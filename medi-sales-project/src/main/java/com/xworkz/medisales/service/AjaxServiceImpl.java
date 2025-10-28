package com.xworkz.medisales.service;

import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.entity.DistributorEntity;
import com.xworkz.medisales.entity.UserEntity;
import com.xworkz.medisales.repository.DistributerRepository;
import com.xworkz.medisales.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
@Slf4j
public class AjaxServiceImpl implements AjaxService {
    @Autowired
    private UserRepository repository;
    @Autowired
    private MailService mailService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private DistributerRepository distributerRepository;

    @Override
    public String checkEmail(String email) {
        boolean isExists = repository.checkMail(email);
        if(isExists)
            return "Email Already Exists";

        return "Email does not exists";
    }

    @Override
    public String checkPhone(String phone) {
        boolean isExists = repository.checkPhone(phone);
        if(isExists)
            return "PhoneNumber Already Exists";

        return "PhoneNumber does not exists";
    }

    @Override
    public String sendOtp(String email){
        UserEntity userEntity = repository.getDtoByEmail(email);
        if (userEntity.getEMail()!=null){
            Random random = new Random();
            Integer otp = random.nextInt(9999);
            log.info("otp is {}",otp);
            mailService.sendRegistrationMessage("Otp Verification","<b> your otp is:: </b>"+otp,email);
            userEntity.setOtp(otp.toString());
            repository.updateByEmail(userEntity);
            return "OTP Sent Successfully";
        }else return "User not found";
    }

    @Override
    public List<DistributorDto> getProducts(){
        List<DistributorEntity> entities = distributerRepository.getAllDistributors();
        List<DistributorDto> dto = new ArrayList<>();

        for (DistributorEntity entity : entities) {
            DistributorDto distributorDto = new DistributorDto();
            BeanUtils.copyProperties(entity, distributorDto);
            dto.add(distributorDto);
        }

        return dto;
    }

    @Override
    public List<UserDto> getUser() {
        List<UserEntity> entities = repository.getAllUsers();
        List<UserDto> dto = new ArrayList<>();

        for (UserEntity entity : entities) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(entity, userDto);
            dto.add(userDto);
        }

        return dto;
    }

    @Override
    public int getStockByProduct(String productName) {
        return distributerRepository.getStockByProduct(productName);
    }
}



