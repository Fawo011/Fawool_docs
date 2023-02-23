# 工程URDF概括

## transmission

### 作用 
用于从软件转换到硬件，有用到转换接口和硬件接口
### 内容
小模板
```
<transmission name="joint_name">
            <type>transmission_interface/SimpleTransmission</type>
            <actuator name="motor_name">
                <mechanicalReduction>n</mechanicalReduction>
            </actuator>
            <joint name="joint1">
                <hardwareInterface>hardware_interface/EffortJointInterface</hardwareInterface>
                <offset>0</offset>
            </joint>
        </transmission>
```
用于每个关节

## arm 手臂urdf

### 作用
描述手臂的link和joint

### 内容

#### link

```
<link name="link1">
            <inertial>
                <mass value="2.933612"/>
                <origin xyz="0.009153 -0.001831 0.028124"/>
                <inertia ixx="1.232e-1" ixy="-5.053e-4" ixz="7.076e-4" iyy="6.280e-2" iyz="2.855e-4" izz="1.773e-1"/>
            </inertial>
            <visual>
                <origin xyz="0 0 0" rpy="0 0 0"/>
                <geometry>
                    <mesh filename="package://rm_description/meshes/engineer/link1.stl" scale="0.001 0.001 0.001"/>
                </geometry>
            </visual>
            <collision>
                <origin xyz="0.004 0.1903 0.045" rpy="0 0 0"/>
                <geometry>
                    <box size="0.57 0.1356 0.045"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="0.004 -0.1903 0.045" rpy="0 0 0"/>
                <geometry>
                    <box size="0.57 0.1356 0.045"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="-0.185 0. 0.045" rpy="0 0 0"/>
                <geometry>
                    <box size="0.04 0.245 0.025"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="0. 0.237 -0.0175" rpy="0 0 0"/>
                <geometry>
                    <box size="0.29 0.042 0.08"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="0. -0.237 -0.0175" rpy="0 0 0"/>
                <geometry>
                    <box size="0.29 0.042 0.08"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="0.054 0.1815 0.003" rpy="0 0 0"/>
                <geometry>
                    <box size="0.086 0.069 0.039"/>
                </geometry>
            </collision>
            <collision>
                <origin xyz="0.054 -0.1815 0.003" rpy="0 0 0"/>
                <geometry>
                    <box size="0.086 0.069 0.039"/>
                </geometry>
            </collision>
        </link>
```

#### joint
```
 <joint name="mimic_joint2" type="prismatic">
                <parent link="link1"/>
                <child link="mimiclink2_1"/>
                <origin xyz="0. 0. 0.098707" rpy="0 0 0"/>
                <axis xyz="1 0 0"/>
                <limit lower="${joint2_lower_limit}" upper="${joint2_upper_limit}" velocity="1" effort="200"/>
            </joint>
```

#### xarco拓展
在文件的开头
```
<robot xmlns:xacro="http://www.ros.org/wiki/xacro" name="arm">
```
之后定义变量如实例
```
<xacro:macro name="arm" params="connected_to simulation">
        <xacro:property name="threshold" value="0.1"/>
        <xacro:property name="joint1_lower_limit" value="0.0005736069829"/>
        <xacro:property name="joint1_upper_limit" value="0.6351414275302"/>
        <xacro:property name="joint2_upper_limit" value="0.3438321773"/>
        <xacro:property name="joint2_lower_limit" value="-0.2253643418193"/>
        <xacro:property name="joint3_upper_limit" value="0.2362959079343"/>
        <xacro:property name="joint3_lower_limit" value="-0.2253360962"/>
        <xacro:property name="joint4_upper_limit" value="0.34152550806"/>
        <xacro:property name="joint4_lower_limit" value="-0.296310718475"/>
        <xacro:property name="joint5_upper_limit" value="-0.00022605078282"/>
        <xacro:property name="joint5_lower_limit" value="-3.23240560816"/>
        <xacro:property name="joint6_upper_limit" value="0.798170237718"/>
        <xacro:property name="joint6_lower_limit" value="-4.2362368464"/>
        <xacro:property name="joint7_upper_limit" value="3.979137624343"/>
        <xacro:property name="joint7_lower_limit" value="-1.26312636630"/>
```
数据由机械组给出

调用时，使用 ${joint3_lower_limit}
```
lower="${joint3_lower_limit}" upper="${joint3_upper_limit}"
```

### chassis底盘urdf
同时包括了link和joint以及transmission的部分

### engineer urdf
定义和调用XACRO
