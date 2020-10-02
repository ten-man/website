---
title: 内建功能
linkTitle: 内建功能
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

图表内建提供了一些功能，比如（在桌面平台上）使用键盘方向键移动十字线，缩放视图等。这些功能都可以通过charty::setFunction接口来启用或者禁用。

## 内建功能

目前已内建的功能由以下枚举值索引：
```cpp
    /*!
     * \enum 内建支持的功能，使用setFunction启用或者禁用某些功能。
     *
     */
    enum FunctionType : int32_t {
        //! 键盘输入
        kFunctionKeyInput = 1 << 1,

        //! 鼠标输入
        kFunctionMouseInput = 1 << 2,

        //! 鼠标框选放大，在开启了kFunctionMouseInput有效
        kFunctionRubberSelect = 1 << 3,

        //! 十字线功能
        kFunctionCrossHair = 1 << 4,

        //! 键盘缩放，在开启了kFunctionKeyInput有效
        kFunctionKeyZoom = 1 << 5,

        //! 键盘移动视图，在开启了kFunctionKeyInput有效
        kFunctionKeyMoveView = 1 << 6,

        //! 最大可用
        kFunctionMaxShift = 16,

        //! 所有的功能
        kFunctionAll = ((1<<kFunctionMaxShift) -1),
    };
```

## 禁用/启用功能

**默认情况下，所有的内建功能都是开启的。**

如果需要禁用/启用某些功能，可以调用Chart方法：
```cpp
    /*! \brief 禁用/启用某些内建已经支持的功能
     *
     *    @param	functions	参考FunctionType
     *    @param	enable	true启用
     *    @return
     */
    void setFunction(int32_t functions, bool enable);
```

例：
```cpp
    // 禁用放大/缩小/选区 等功能
    setFunction(Chart::kFunctionRubberSelect | Chart::kFunctionKeyZoom | Chart::kFunctionKeyMoveView, false);
```

**注意：部分功能的启用，需要多个功能组合启用才会生效。** 如：要启用kFunctionKeyZoom （键盘缩放）功能，必须先开启了kFunctionKeyInput（接受键盘输入）才会生效。在使用前，请先阅读功能的说明。

