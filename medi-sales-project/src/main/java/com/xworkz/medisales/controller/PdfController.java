package com.xworkz.medisales.controller;

import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.service.DistributerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/")

public class PdfController {

    @Autowired
    private DistributerService service;

    @GetMapping("generatePdf")
    public  String getPdf(HttpServletRequest request)
    {
       List<DistributorDto> dtos = (List<DistributorDto>) request.getSession().getAttribute("listDto");
        UserDto userDto = (UserDto) request.getSession().getAttribute("customer");
        UserDto dto = (UserDto) request.getSession().getAttribute("sessionDto");
        Double finalAmount = (Double) request.getSession().getAttribute("final");
       log.info("-----------------------------{}",dtos);
       service.pdfGenerate(dtos,userDto,finalAmount,dto);
        return "generatePdf";
    }
}
