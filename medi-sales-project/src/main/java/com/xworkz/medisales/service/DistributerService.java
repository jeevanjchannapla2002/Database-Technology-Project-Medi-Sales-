package com.xworkz.medisales.service;

import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;

import java.util.List;

public interface DistributerService {
    boolean validateAndSave(DistributorDto dto, UserDto sessionDto);

    List<DistributorDto> getAllProductsStocks();

    DistributorDto getDistributorDtoByProductName(String productName);

    List<DistributorDto> getAllProductsStocksByEmail(String email);

    void pdfGenerate(List<DistributorDto> dtos,UserDto userDto,Double finalAmount,UserDto dto);
}
