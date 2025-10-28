package com.xworkz.medisales.service;

public interface MailService {
    boolean sendRegistrationMessage(String subject,String body,String email);
}