package com.xworkz.medisales.repository;

import com.xworkz.medisales.entity.DistributorEntity;

import java.util.List;

public interface DistributerRepository {
    boolean saveProduct(DistributorEntity entity);

    List<DistributorEntity> getAllProducts();

    List<DistributorEntity> getAllDistributors();


    int getStockByProduct(String productName);

    DistributorEntity getDistributorDtoByProductName(String productName);

    List<DistributorEntity> getAllProductsStocksByEmail(String email);
}
