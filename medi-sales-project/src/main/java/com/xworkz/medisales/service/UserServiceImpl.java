package com.xworkz.medisales.service;

import com.xworkz.medisales.constant.Constants;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.entity.UserEntity;
import com.xworkz.medisales.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

@Slf4j
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository repository;

    @Autowired
    private MailService mailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean validateAndSave(UserDto dto) {
        if(repository.checkMail(dto.getEMail())){
            return false;
        } else {
            UserEntity entity = new UserEntity();
            dto.setPassword(passwordEncoder.encode(dto.getPassword()));
            BeanUtils.copyProperties(dto, entity);
            entity.setCreatedBy(dto.getEMail());
            entity.setCreatedDate(LocalDate.now());
            entity.setPhoto("default.jpeg");
            entity.setProfilePhotoType("jpeg");
            //   UserEntity user=repository.getDtoByEmail(dto.getEMail());

            repository.save(entity);
            mailService.sendRegistrationMessage("Registration", "Thank you for registering welcome to our page", dto.getEMail());
            return true;
        }

    }

    @Override
    public UserDto getDtoByEmailAndPassword(String email, String password) {
        UserDto dto=new UserDto();
        UserEntity userEntity=  repository.getDtoByEmail(email);
        UserEntity user;
        if(userEntity.getEMail()!=null&&passwordEncoder.matches(password, userEntity.getPassword())) {
            System.out.println("get by email" + userEntity);
            BeanUtils.copyProperties(userEntity, dto);
            return dto;
        }else if(userEntity.getEMail()!=null&&password.equals(userEntity.getPassword())){
            System.out.println("get by email" + userEntity);
            BeanUtils.copyProperties(userEntity, dto);
            return dto;
        }else {
            user = repository.getDtoByEmail(email);
            if(user.getAttemptsLogin()==null){
                user.setAttemptsLogin(0);
            }
            user.setAttemptsLogin(user.getAttemptsLogin() + 1);
            dto.setAttemptsLogin(user.getAttemptsLogin());
            user = repository.updateByEmail(user);
            log.info("user : {}", user);
            return dto;
        }
    }

    @Override
    public UserDto getDtoByEmail(String eMail) {
        UserDto dto=new UserDto();
        UserEntity userEntity=  repository.getDtoByEmail(eMail);
        System.out.println("get by email"+userEntity);
        BeanUtils.copyProperties(userEntity,dto);

        return dto;
    }

    @Override
    public Boolean updatePasswordByEmail(String email, String password, String confirmPassword) {
        if (email != null) {

            return repository.updatePasswordByEmail(email,passwordEncoder.encode(password),confirmPassword);
        }
        return false;
    }

    @Override
    public UserDto updateByEmail(MultipartFile multipartFile, UserDto dto, UserDto sessionDto) {

        if(multipartFile.isEmpty()){
            log.info("photo is empty");
        }
        else {
            try {
                byte[] bytes= multipartFile.getBytes();
                Path path= Paths.get(Constants.PROFILE_PHOTO_PATH.getPath()+multipartFile.getOriginalFilename());
                Files.write(path, bytes);
            } catch (IOException e) {
                log.error("error at service :{}",e.getMessage());
            }
        }

        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(dto, entity);

        entity.setUpdatedBy(sessionDto.getContactPerson());
        entity.setUpdatedDate(LocalDate.now());
        entity.setCreatedBy(sessionDto.getCreatedBy());
        entity.setCreatedDate(sessionDto.getCreatedDate());
        entity.setPhoto(multipartFile.getOriginalFilename());
        entity.setProfilePhotoType(multipartFile.getContentType());
        UserEntity entity1 =repository.updateByEmail(entity);
        UserDto userDto = new UserDto();
        BeanUtils.copyProperties(entity1,userDto);

        System.out.println("service impl after copy"+userDto);


        return userDto;
    }

    @Override
    public UserDto updateWithSeesionDto(UserDto dto, UserDto sessionDto) {
        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(dto, entity);
        entity.setPassword(sessionDto.getPassword());
        entity.setUpdatedBy(sessionDto.getContactPerson());
        entity.setUpdatedDate(LocalDate.now());
        entity.setCreatedBy(sessionDto.getCreatedBy());
        entity.setCreatedDate(sessionDto.getCreatedDate());
        entity.setOtp(sessionDto.getOtp());
        UserEntity entity1 =repository.updateByEmail(entity);
        UserDto userDto = new UserDto();
        BeanUtils.copyProperties(entity1,userDto);
        return userDto;
    }

    @Override
    public boolean validateOtp(String email, String otp){
        boolean isValid = false;
        UserEntity userEntity = repository.getDtoByEmail(email);
        if (otp.equals(userEntity.getOtp())){
            userEntity.setAttemptsLogin(0);
            userEntity = repository.updateByEmail(userEntity);
            log.info("after update {}",userEntity);
            isValid = true;
        }
        return isValid;
    }

    @Override
    public UserDto getDtoByCustomername(String customerName) {
        UserDto dto=new UserDto();
        UserEntity entity=  repository.getEntityByCustomername(customerName);
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }


}

