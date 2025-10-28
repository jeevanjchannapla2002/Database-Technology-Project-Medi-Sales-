package com.xworkz.medisales.constant;

import lombok.Getter;

@Getter
public enum Constants {
    PROFILE_PHOTO_PATH("D://medi-sales-images/"),FROM_EMAIL("jeevanjcklb.xworkz@gmail.com"),PASSWORD("cavj grow etyy xvxo");

    private  String path;

    Constants(String path){
        this.path =path;
    }

}
