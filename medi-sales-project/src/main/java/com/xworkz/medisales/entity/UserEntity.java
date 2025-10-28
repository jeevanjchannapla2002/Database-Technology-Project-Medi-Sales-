package com.xworkz.medisales.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "new_table")
@Data
@ToString
@NamedQueries({
        @NamedQuery(name = "getAllDetailsByEmail", query = "select dto from UserEntity dto where dto.eMail=:email"),
        @NamedQuery(name = "updatePasswordAndConfirmPasswordByEmail", query = "UPDATE UserEntity e SET e.password = :pass, e.confirmPassword = :cpass WHERE e.eMail = :email"),
        @NamedQuery(name = "checkEmail", query = "select e from UserEntity e where e.eMail=:email"),
        @NamedQuery(name = "checkPhone", query = "select dto from UserEntity dto where dto.contact=:phone"),
//        @NamedQuery(name = "getDtoByEmailAndPassword", query = "select dto from UserEntity dto where dto.eMail=:email AND dto.password=:password")
})

public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "companyName")
    private String companyName;

    @Column(name = "contactPerson")
    private String contactPerson;

    @Column(name = "businessType")
    private String businessType;

    @Column(name = "contact")
    private String contact;

    @Column(name = "email")
    private String eMail;

    @Column(name = "address1")
    private String address1;

    @Column(name = "address2")
    private String address2;

    @Column(name = "pincode")
    private String pincode;

    private String referral;

    private String password;

    @Column(name = "confirmPassword")
    private String confirmPassword;

    @Column(name = "created_date")
    private LocalDate createdDate;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "updated_by")
    private String updatedBy;

    @Column(name = "updated_date")
    private LocalDate updatedDate;

    @Column(name = "profile_photo")
    private String photo;

    @Column(name = "profile_photo_type")
    private String profilePhotoType;

    @Column(name = "attempts_login")
    private Integer attemptsLogin;

    private String otp;
}
