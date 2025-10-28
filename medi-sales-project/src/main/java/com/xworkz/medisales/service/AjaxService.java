package com.xworkz.medisales.service;

import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;

import java.util.List;

public interface AjaxService {
    String checkEmail(String email);

    String checkPhone(String phone);

    String sendOtp(String email);

    List<DistributorDto> getProducts();

    List<UserDto> getUser();

    int getStockByProduct(String productName);
}
