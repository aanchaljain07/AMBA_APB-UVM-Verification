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

![Architecture](images/APB_Verification_Architecture.png)

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

![Write Waveform](images/APB_write_transaction.png)

### APB Read Transaction

![Read Waveform](images/APB_read_transaction.png)

### APB Write And Read Transaction

![Write Waveform](images/APB_write_read_transaction.png)


## Tools and Technologies

- SystemVerilog
- UVM
- Cadence Simvision
- Linux
  
## Conclusion

This project demonstrates a reusable and scalable UVM-based verification environment for APB protocol verification. The environment ensures protocol correctness through assertions, functional coverage, and transaction-level checking.
