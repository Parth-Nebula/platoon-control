# Platoon Control System

A comprehensive framework for simulating and implementing Model Predictive Control (MPC) strategies for vehicle platooning, featuring ROS 2 integration and Python simulations.

---

## Repository Structure

```
platoon-control/
├── WK/                                         # ROS 2 simulation package
│
├── simulation.py                               # Python simulation for string stability without MPC
│
├── MPC/                                        # MPC implementation core
│   ├── MPCPkg/                                 # Compiled MATLAB MPC package
│   ├── TMPC.m                                  # Traditional MPC controller function
│   ├── LMPC.m                                  # Laguerre in MPC controller function
│   └── casadi-3.7.0/                           # Optimization library
│   └── sample.py                               # Python simulation for string stability using MPC
│
│── Dynamic Programming Decision Making.ipynb   # DP based decision making for merging and splitting
│             
└── README.md                                   # This document
```

---

## Key Features

- **ROS 2 Integration**: Full-scale Gazebo simulation with articulated vehicle models  
- **Predictive Control**: MPC implementation using CasADi for real-time optimization  
- **Multi-Scale Testing**: From 3-vehicle Python simulations to 10+ vehicle ROS scenarios  

---

## Prerequisites

### ROS 2 (Humble Hawksbill)
```bash
sudo apt install ros-humble-moveit ros-humble-depth-image-proc
```

### Python
```bash
pip install numpy matplotlib casadi control
```

### MATLAB (R2021a or later)
Required Toolboxes:
- Control System Toolbox  
- MATLAB Compiler SDK

---

## Installation

### Clone the Repository
```bash
git clone https://github.com/yourusername/platoon-control.git
cd platoon-control
```

### ROS Setup
```bash
cd WK/
rosdep install --from-paths . --ignore-src -r -y
colcon build
```

### Python Setup
```bash
cd ../simulation
pip install -r requirements.txt
```

### MATLAB Setup
In MATLAB:
```matlab
cd MPC/
addpath(genpath('casadi-3.7.0-windows64-matlab2018b')) % Update this path as per your OS and MATLAB version
```

---

## Usage

### ROS Simulation (10+ Vehicles)
```bash
cd WK/
ros2 launch platoon_sim.launch.py vehicle_count:=10
```

### Python Simulation (3 Vehicles)
```bash
cd simulation/
python platoon_sim.py --taus 0.51 0.6 0.55 --pos 200 195 175 --vel 22.2 20 25
```

### MPC Controller

#### MATLAB
```matlab
y = TMPC(4, [0.51, 0.6, 0.55, 0.49], [22.2, 20, 25, 21]);
```

#### Python
```python
from platoon_mpc import TMPC
control_signals = TMPC(4, [0.51, 0.6, 0.55, 0.49], [22.2, 20, 25, 21])
```

---

## Configuration Guide

| Parameter         | File Location                | Description                     |
|------------------|------------------------------|---------------------------------|
| Vehicle Dynamics | `MPC/TMPC.m` (Lines 25–40)   | τ values, state-space models    |
| MPC Weights      | `MPC/TMPC.m` (Lines 115–120) | Q/R matrices for cost function  |
| Platoon Spacing  | `WK/config/platoon.yaml`     | Inter-vehicle distance policies |

---

## Related Projects

- [ROS 2 Robotic Manipulation Template](https://github.com/o3de/o3de-extras)  
- [CasADi Optimization Framework](https://web.casadi.org/)  
- [MATLAB-Python Integration Guide](https://mathworks.com/help/compiler_sdk/python_packages.html)  

---

## References

1. Liang, C.-Y., and Peng, H., “String Stability Analysis of Adaptive Cruise Controlled Vehicles,” *Journal of Dynamic Systems, Measurement, and Control*, vol. 122, no. 3, pp. 576–586, Sep. 2000. [Online].

2. Y. Zheng, S. E. Li, J. Wang, K. Li, and S. E. Shladover, “A Cooperative Driving Strategy for Merging at On-Ramps Based on Dynamic Programming,” *IEEE Transactions on Intelligent Transportation Systems*, vol. 21, no. 1, pp. 172–184, Jan. 2020. [Online].

3. J. Li, B. Yang, and F. Wang, “PeerVote: A Decentralized Voting Mechanism for P2P Collaboration Systems,” in *Proc. 10th IEEE Int. Conf. on Computer Communications and Networks (ICCCN)*, Scottsdale, AZ, USA, 2001, pp. 277–282. [doi:10.1109/ICCCN.2001.956282](https://doi.org/10.1109/ICCCN.2001.956282)

4. L. Guo, P. Ge, D. Sun, and Y. Qiao, “Adaptive Cruise Control Based on Model Predictive Control with Constraints Softening,” *Applied Sciences*, vol. 10, no. 5, pp. 1–16, Feb. 2020. [doi:10.3390/app10051635](https://doi.org/10.3390/app10051635)

5. Elsevier, “Laguerre Function – An Overview,” *ScienceDirect Topics*, [Online]. Available: [https://www.sciencedirect.com/topics/mathematics/laguerre-function](https://www.sciencedirect.com/topics/mathematics/laguerre-function)

