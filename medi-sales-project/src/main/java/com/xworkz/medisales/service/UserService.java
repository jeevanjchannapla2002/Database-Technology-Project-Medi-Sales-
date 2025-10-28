package com.xworkz.medisales.service;

import com.xworkz.medisales.dto.UserDto;
import org.springframework.web.multipart.MultipartFile;

public interface UserService {
    boolean validateAndSave(UserDto dto);

    UserDto getDtoByEmailAndPassword(String email,String password);


    UserDto getDtoByEmail(String email);

    Boolean updatePasswordByEmail(String email, String password, String confirmPassword);

    UserDto updateByEmail(MultipartFile multipartFile, UserDto dto, UserDto sessionDto);

    UserDto updateWithSeesionDto(UserDto dto, UserDto sessionDto);

    boolean validateOtp(String email, String otp);

    UserDto getDtoByCustomername(String customerName);
}

