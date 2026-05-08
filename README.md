# APB Protocol Verification using UVM


## Overview

This project focuses on the verification of the Advanced Peripheral Bus (APB) protocol using Universal Verification Methodology (UVM) in SystemVerilog.

The verification environment is designed to validate APB read and write transactions, protocol behavior, reset functionality, and error handling using reusable UVM components such as driver, monitor, sequencer, agent, scoreboard, and coverage collector.

## About APB Protocol

Advanced Peripheral Bus (APB) is a low-bandwidth and low-power protocol used for communication between peripherals in System-on-Chip (SoC) designs.

APB operates mainly in three phases:
- Idle Phase
- Setup Phase
- Access Phase

The protocol is simple, efficient, and commonly used for interfacing peripherals like UART, GPIO, Timers, and SPI controllers.

## UVM Verification Environment

The verification environment consists of:

- Sequence
- Sequencer
- Driver
- Monitor
- Agent
- Scoreboard
- Coverage Collector
- Environment
- Testcases

## Verification Architecture

<img width="1247" height="508" alt="APB_Verification_Architecture" src="https://github.com/user-attachments/assets/19fe182e-149c-457e-9af9-4e3b1e204788" />



## Components Description

### Driver
Drives APB transactions from sequence items to DUT interface signals.

### Monitor
Monitors DUT activity and sends transaction data to scoreboard and coverage.

### Scoreboard
Checks expected and actual outputs for protocol correctness.

### Agent
Contains driver, monitor, and sequencer components.

### Environment
Top-level container connecting all verification components.

## Simulation Results

### APB Write Transaction

<img width="1911" height="496" alt="APB_write_read_transaction" src="https://github.com/user-attachments/assets/3aac34eb-d48d-480a-9662-95719c16970f" />


### APB Read Transaction

<img width="1920" height="494" alt="APB_read_transaction" src="https://github.com/user-attachments/assets/a48eba1b-9c51-4bca-984f-68d110fc3580" />


### APB Write And Read Transaction


<img width="1911" height="496" alt="APB_write_read_transaction" src="https://github.com/user-attachments/assets/7303ea8d-211d-455c-8e35-b41e958b65de" />


## Tools and Technologies

- SystemVerilog
- UVM
- Cadence Simvision
- Linux
  
## Conclusion

This project demonstrates a reusable and scalable UVM-based verification environment for APB protocol verification. The environment ensures protocol correctness through assertions, functional coverage, and transaction-level checking.
