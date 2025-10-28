package com.xworkz.medisales.dto;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDate;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto implements Serializable {

    private Integer id;

    @NotNull(message="Company Name shouldn't be null")
    @Size(min = 2, max = 30,message = "Should be min 2 char and max 30")
    private String companyName;

    @NotNull(message="Contact Person shouldn't be null")
    @Size(min = 2, max = 25,message = "Should be min 2 char and max 25")
    private String contactPerson;

    @NotNull(message = "Business Type shouldn't be null")
    @Size(min = 2, max = 50, message = "business Type should be min 2 chars and max 50")
    private String businessType;

    @Pattern(regexp = "^\\d{10}$", message = "Contact should be a valid 10-digit number")
    private String contact;

    @NotNull(message = "Registered Email shouldn't be null")
    @Size(min = 3, max = 50, message = "Email should be min 3 chars and max 50")
    private String eMail;

    @NotNull(message = "address1 should not be null")
    @Size(min = 2, max = 50, message = "address should be min 2 chars and max 50")
    private String address1;

    @NotNull(message = "address2should not be null")
    @Size(min = 2, max = 50, message = "address should be min 2 chars and max 50")
    private String address2;

    @NotNull(message = "pincode shouldn't be null")
    @Size(min = 5, max = 10, message = "pincode should be min 5 chars and max 10")
    private String pincode;

    @NotNull(message = "referral should not be null")
    @Size(min = 2, max = 50, message = "referral should be min 2 chars and max 50")
    private String referral;

    @NotNull(message = "Password shouldn't be null")
    @Size(min = 6, max = 20, message = "Password should be min 6 chars and max 20")
    private String password;

    @NotNull(message = "Confirm password shouldn't be null")
    @Size(min = 6, max = 20, message = "Confirm password should be min 6 chars and max 20")
    private String confirmPassword;

    private LocalDate createdDate;
    private String createdBy;

    private String updatedBy;
    private LocalDate updatedDate;

    private String photo;
    private String profilePhotoType;

    private Integer attemptsLogin;

    private String otp;
}

