package com.nit.entity;

import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;

    private String userName;
    
    private LocalDate dateOfBirth;
    
    private String occupation;
    
    @Column(unique = true, nullable = false)
    private String email;

    private String password;

    private String phone;

    private String address;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Account account;
}
