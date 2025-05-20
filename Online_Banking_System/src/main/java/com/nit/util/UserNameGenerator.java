package com.nit.util;

import java.time.LocalDate;
import java.util.Random;

public class UserNameGenerator {

    public static String generate(String fullName, LocalDate dob) {
        if (fullName == null || fullName.isBlank() || dob == null) {
            throw new IllegalArgumentException("Full name and date of birth are required for username generation");
        }

        String[] names = fullName.trim().split("\\s+");
        String firstName = names.length > 0 ? names[0] : "";
        String lastName = names.length > 1 ? names[names.length - 1] : "";

        String part1 = firstName.length() >= 2 ? firstName.substring(0, 2).toLowerCase() : firstName.toLowerCase();
        String part2 = lastName.length() >= 2 ? lastName.substring(lastName.length() - 2).toLowerCase()
                : lastName.toLowerCase();

        int year = dob.getYear();
        int randomNumber = new Random().nextInt(900) + 100; // Generates 100–999

        return (part1 + randomNumber + part2 + year).toUpperCase();
    }
}
