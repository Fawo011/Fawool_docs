我以注册一个Ctrl+L为例子
## 注册一个键位
在engineer_manual.cpp的EngineerManual类中加入
```
 ctrl_l_event_.setRising(boost::bind(&EngineerManual::ctrlLPress, this));
```
同时在.h文件InputEvent类型中加入
```
ctrl_l_event_
```
前边加入
```
void ctrlLPress
```
**跟随前边代码的阵容**
在checkKeyboard类中加入
```
ctrl_l_event_.update(dbus_data->key_l & dbus_data->key_ctrl);
```
加入ctrlLPressl类的框架
```
void EngineerManual::ctrlXPress()
{
prefix_ = "";//不打算加入前缀
  root_ = "NEW_KEY";
  runStepQueue(root_);
  ROS_INFO("%s", (prefix_ + root_).c_str());
}
```
然后去rm_ws/src/rm_engineer/engineer_middleware/config下的steps_list.yaml中添加自己的新动作(复杂动作是会涉及很多步骤,现指实例简单动作)
```
  NEW_KEY:
    - step: "arm go"
      arm:
        joints: 
        common:
          <<: *NORMALLY
        tolerance:
          <<: *BIGGER_TOLERANCE
    
```
如实例每小步都可以以-step开始设置arm或者gripper的大类
## 用RViz调各个关节的值
### 调动作关节值

在rviz上边自己乱玩

##### 获取现在关节值

```
rosrun moveit_commander moveit_commander_cmdline.py
```

运行后，输入use enginner,等待进入输入current即可获得当前六个joint的位置值



##### 移动机械臂

```
mon launch engineer_arm_confi rviz.launch
```

- 在左下窗口内点击joints然后根据需求拖动关节到指定位置
- 或者在右边直接拖动末端也可以，看自己喜欢



##### 达到指定位置后用上面的current获得当前位置

## 输入joint值，替换

## 测试自己的动作按键是否合格
**记得要上传修改的文件**



