package com.xworkz.medisales.service;

import com.itextpdf.html2pdf.HtmlConverter;
import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.entity.DistributorEntity;
import com.xworkz.medisales.repository.DistributerRepository;
import com.xworkz.medisales.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
public class DistributerServiceImpl implements DistributerService{
    @Autowired
    DistributerRepository repository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    private TemplateEngine templateEngine;


    @Override
    public boolean validateAndSave(DistributorDto dto, UserDto sessionDto) {
        DistributorEntity entity = new DistributorEntity();
        Date currentDate = new Date();
        SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
        String day = dayFormat.format(currentDate);
        SimpleDateFormat minuteFormat = new SimpleDateFormat("mm");
        String minute = minuteFormat.format(currentDate);
        SimpleDateFormat secondFormat = new SimpleDateFormat("ss");
        String second = secondFormat.format(currentDate);
        String hsnCode = day + minute + second;

        char productInitial = dto.getProductName().charAt(0);
        char companyInitial = dto.getProductCompany().charAt(0);
        Random random = new Random();
        int randomNum = 100 + random.nextInt(900);
        String batchNo = "" + productInitial + companyInitial + randomNum;

        dto.setCreated_by(sessionDto.getEMail());
        dto.setHsn(hsnCode);
        dto.setBatchNo(batchNo);
        dto.setCreatedDate(LocalDate.now());
        BeanUtils.copyProperties(dto,entity);
       return repository.saveProduct(entity);
    }

    @Override
    public List<DistributorDto> getAllProductsStocks() {
        List<DistributorEntity> entities = repository.getAllProducts();
        List<DistributorDto> dto = new ArrayList<>();

        for (DistributorEntity entity : entities) {
            DistributorDto distributorDto = new DistributorDto();
            BeanUtils.copyProperties(entity, distributorDto);
            dto.add(distributorDto);
        }

        return dto;
    }

    @Override
    public DistributorDto getDistributorDtoByProductName(String productName) {
        DistributorDto dto=new DistributorDto();
        DistributorEntity entity=  repository.getDistributorDtoByProductName(productName);
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }

    @Override
    public List<DistributorDto> getAllProductsStocksByEmail(String email) {
        List<DistributorEntity> entities = repository.getAllProductsStocksByEmail(email);
        List<DistributorDto> dto = new ArrayList<>();

        for (DistributorEntity entity : entities) {
            DistributorDto distributorDto = new DistributorDto();
            BeanUtils.copyProperties(entity, distributorDto);
            dto.add(distributorDto);
        }

        return dto;
    }

    @Override
    public void pdfGenerate(List<DistributorDto> dtos,UserDto userDto,Double finalAmount,UserDto dto) {
        Context context = new Context();
        context.setVariable("user", userDto);
        context.setVariable("sales", dtos);
        context.setVariable("login",dto);
        context.setVariable("finalAmount",finalAmount);
        String htmlData = templateEngine.process("SalesBill", context);
        log.info("Html data: {}", htmlData);
        File file = new File("D://projectPdf//" + "SalesBill.pdf");
        try (FileOutputStream fileOutputStream = new FileOutputStream(file.getPath())) {
            HtmlConverter.convertToPdf(htmlData, fileOutputStream);
        } catch (IOException e) {
            throw new RuntimeException("Error while generating the PDF file.", e);
        }
    }
}
