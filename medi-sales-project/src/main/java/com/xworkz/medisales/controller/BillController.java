package com.xworkz.medisales.controller;

import com.xworkz.medisales.dto.DistributorDto;
import com.xworkz.medisales.dto.UserDto;
import com.xworkz.medisales.service.DistributerService;
import com.xworkz.medisales.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller("/")
public class BillController {
    @Autowired
    UserService mediSalesService;
    @Autowired
    DistributerService distributerService;

    private static List<DistributorDto> attributesList = new ArrayList<>();


    @PostMapping("getBill")
    public String generateBill(@RequestParam("productName") String productName,
                               @RequestParam("customerName") String customerName,
                               @RequestParam("quantity") int quantity,
                               @RequestParam("gst") double gst,
                               @RequestParam("discount") double discount,
                               Model model, HttpSession session) {
        double finalTotal = 0.0;
        UserDto userDto = mediSalesService.getDtoByCustomername(customerName);
        model.addAttribute("customerName", userDto.getContactPerson());
        model.addAttribute("address", userDto.getAddress1());
        session.setAttribute("customer",userDto);
        for(DistributorDto existingProduct :attributesList){

            if(existingProduct.getProductName().equals(productName)){
                double discountedPrice = (existingProduct.getRate() * quantity * discount) / 100;
                double gstAmount = (discountedPrice * gst) / 100;
                double totalAmount = existingProduct.getRate() * quantity - discountedPrice + gstAmount;


                existingProduct.setGst(existingProduct.getGst()+gst);
                existingProduct.setDiscount(existingProduct.getDiscount()+discount);
                existingProduct.setQuantity(existingProduct.getQuantity()+quantity);
                existingProduct.setTotalAmount(totalAmount+existingProduct.getTotalAmount());

                model.addAttribute("dtoList", attributesList);
                for(DistributorDto distributorDto :attributesList) {
                    finalTotal+=distributorDto.getTotalAmount();
                }
                model.addAttribute("total",finalTotal);
                session.setAttribute("final",finalTotal);
                session.setAttribute("listDto",attributesList);
                return "generatebill";

            }
        }

        DistributorDto product = distributerService.getDistributorDtoByProductName(productName);


        double discountedPrice = (product.getRate() * quantity * discount) / 100;
        double gstAmount = (discountedPrice * gst) / 100;
        product.setTotalAmount( product.getRate() * quantity - discountedPrice + gstAmount);


        DistributorDto dto = new DistributorDto();
        BeanUtils.copyProperties(product,dto);
        dto.setGst(gst);
        dto.setDiscount(discount);
        dto.setQuantity(quantity);

        attributesList.add(dto);

        model.addAttribute("dtoList", attributesList);
        for(DistributorDto distributorDto :attributesList) {
            finalTotal+=distributorDto.getTotalAmount();
        }
        model.addAttribute("total",finalTotal);
        model.addAttribute("total",finalTotal);
        session.setAttribute("listDto",attributesList);
        return "generatebill";
    }
}