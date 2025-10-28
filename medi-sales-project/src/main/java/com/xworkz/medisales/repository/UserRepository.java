package com.xworkz.medisales.repository;

import com.xworkz.medisales.entity.UserEntity;

import java.util.List;

public interface UserRepository {
    boolean save(UserEntity entity);

    UserEntity getDtoByEmail(String email);

    Boolean updatePasswordByEmail(String email, String password, String confirmPassword);

    UserEntity updateByEmail(UserEntity entity);

    boolean checkMail(String email);

    boolean checkPhone(String phone);

    List<UserEntity> getAllUsers();

    UserEntity getEntityByCustomername(String customerName);
}
