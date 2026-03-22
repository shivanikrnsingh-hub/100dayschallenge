**Description**

This project implements a Finite State Machine (FSM) based Traffic Light Controller for a four-way intersection. The system manages the flow of traffic across a Main Road (M1, M2), a Main Road Turn (MT), and a Side Road (S).The controller ensures safe transitions by utilizing specific timing intervals for Green, Yellow, and Red lights across six distinct states. The design is highly modular, allowing for independent control of four different signal sets based on a centralized timer.

**Hardware Architecture**

The architecture is divided into two primary logic blocks:
* Sequential State & Counter Logic: A clocked process manages the state transitions and a 4-bit timer (count). It ensures that each state remains active for a predefined duration (e.g., 7 seconds for the primary flow, 2 seconds for yellow transitions).
* Combinational Output Logic: An always @(*) block decodes the present_state into specific signal outputs for the 3-bit light registers ($Red=100, Yellow=010, Green=001$).

**State Table**

<img width="587" height="162" alt="image" src="https://github.com/user-attachments/assets/eecc37e6-4d5a-4eef-bc69-ad13bc5fe53d" />

**Simulation Result**

<img width="1691" height="250" alt="trafic_controller_sim" src="https://github.com/user-attachments/assets/cddb003e-ee2c-4cc1-bcb6-9925ef7a7a14" />

