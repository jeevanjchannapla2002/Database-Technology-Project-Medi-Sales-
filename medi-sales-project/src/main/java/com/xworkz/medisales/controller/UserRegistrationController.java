package com.xworkz.medisales.controller;

import com.xworkz.medisales.constant.Constants;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class UserRegistrationController  {

    @Autowired
    private UserService service;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("user")
    public String onSave(@Valid UserDto dto, BindingResult bindingResult, Model model) {
        boolean hasErrors = bindingResult.hasErrors();
        model.addAttribute("name", dto.getContactPerson());
        log.info("form data {}",dto);

        if (hasErrors) {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            allErrors.forEach(error -> {
                FieldError fieldError = (FieldError) error;
                System.out.println(fieldError.getField() + " Error message: " + fieldError.getDefaultMessage());

                if (fieldError.getField().equalsIgnoreCase("companyName")) {
                    model.addAttribute("companyNameError", fieldError.getDefaultMessage());

                }
                if (fieldError.getField().equalsIgnoreCase("contactPerson")) {
                    model.addAttribute("contactPersonError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("businessType")) {
                    model.addAttribute("businessTypeError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("contact")) {
                    model.addAttribute("contactError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("eMail")) {
                    model.addAttribute("eMailError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("address1")) {
                    model.addAttribute("address1Error", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("address2")) {
                    model.addAttribute("address2Error", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("pincode")) {
                    model.addAttribute("pincodeError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("password")) {
                    model.addAttribute("passwordError", fieldError.getDefaultMessage());
                }
                if (fieldError.getField().equalsIgnoreCase("confirmPassword")) {
                    model.addAttribute("confirmPasswordError", fieldError.getDefaultMessage());
                }

            });

            return "register";
        }

        boolean isAdded = service.validateAndSave(dto);
        log.info("Entered user insertion method");
        model.addAttribute("key", dto.getContactPerson());
        if (isAdded) {
            return "response";
        } else {
            model.addAttribute("key", "E-mail already exists");
            return "register";
        }

    }

    @GetMapping("register")
    public String onClickRegister() {
        return "register";
    }

    @GetMapping("home")
    public String home() {
        return "index";
    }

    @GetMapping("/signIn")
    public String signIn() {
        return "signIn";
    }

    @GetMapping("login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        log.info("Entered login");

        // Fetch user entity by email
        UserDto dto = service.getDtoByEmailAndPassword(email,password);

        model.addAttribute("name", "");

        if (dto.getAttemptsLogin()<=3) {
            if (dto.getEMail() != null) {
                model.addAttribute("dto", dto);
                return "dashboard";
            } else {
                model.addAttribute("notFound", "Invalid Credentials");
                model.addAttribute("email", email);
                return "signIn";
            }
        }
        else {
            model.addAttribute("notFound", "Account Blocked");
            model.addAttribute("email", email);
            return "otpSignIn";
        }
    }

    @GetMapping("dashboard")
    public String dashboard() {
        log.info("Entered dashboard");
        return "dashboard";
    }

    @GetMapping("forgot-password")
    public String forgotPassword(String email, String newPassword, String confirmPassword, Model model) {
        Boolean isUpdated = false;

        if (email != null && newPassword != null && confirmPassword != null) {
            // Ensure the passwords match before updating
            if (newPassword.equals(confirmPassword)) {

                isUpdated = service.updatePasswordByEmail(email, newPassword,confirmPassword);

                if (isUpdated) {
                    model.addAttribute("valid", "Password updated successfully");
                } else {
                    model.addAttribute("Invalid", "Please provide valid email and passwords");
                    return "forgot-password";
                }
            } else {
                model.addAttribute("Invalid", "Passwords do not match");
                return "forgot-password";
            }
        } else {
            model.addAttribute("Invalid", "Please provide valid email and passwords");
            return "forgot-password";
        }
        model.addAttribute("Invalid","");
        return "forgot-password";
    }
    @GetMapping("fetchDto")
    public String fetchDetailsToUpdate(@RequestParam String eMail, Model model, HttpSession session){
        UserDto dto=service.getDtoByEmail(eMail);
        session.setAttribute("sessionDto",dto);
        model.addAttribute("dto",dto);

        return "update";
    }
    @GetMapping("update")
    public String getUpdate(){
        return "update";
    }

    @PostMapping("update")
    public String update(@RequestParam("profilePhoto") MultipartFile multipartFile, UserDto dto, Model model, HttpServletRequest httpServletRequest){
        log.info("file:  {} :", multipartFile.getOriginalFilename());
        System.out.println(multipartFile.getOriginalFilename());
        UserDto sessionDto = (UserDto) httpServletRequest.getSession().getAttribute("sessionDto");
        log.info("{}",sessionDto);
        UserDto dto1 = service.updateByEmail(multipartFile,dto,sessionDto);
        model.addAttribute("Successful","Updated SuccessFully");
        model.addAttribute("dto", dto1);
        return "update";
    }

    @GetMapping("view/{imageName}")
    public  void getImage(@PathVariable String imageName, HttpServletResponse response) throws IOException {
        Path path= Paths.get(Constants.PROFILE_PHOTO_PATH.getPath() +imageName);
        log.info("{}",path);

        Files.copy(path,response.getOutputStream());
        response.getOutputStream().flush();
    }

    @GetMapping("/otpSignIn")
    public String otpSignIn(){
        return "otpSignIn.jsp";
    }

    @GetMapping("/sendOtp")
    public String verifyOtp(@RequestParam String email,String otp,Model model){
        boolean isOtpCorrect =service.validateOtp(email,otp);
        if (isOtpCorrect){
            model.addAttribute("valid","Email verified please reset your password");
            model.addAttribute("email",email);

            return "forgot-password";
        }else {
            model.addAttribute("msg","Please enter valid otp");
            return "otpSignIn";
        }
    }

    @GetMapping("createstock")
    public String getCreateStock(){
        return "createstock";
    }
}

