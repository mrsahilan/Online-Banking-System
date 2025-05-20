package com.nit.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Transaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(unique = true)
	private String transactionCode; // <- This is your unique 8-digit transaction ID

	private String transactionType; // e.g., "transfer"

	private Double amount;

	private String description;

	private String senderName;

	private String receiverName;

	private LocalDateTime timestamp;

	@ManyToOne
	private Account senderAccount;

	@ManyToOne
	private Account receiverAccount;
}
