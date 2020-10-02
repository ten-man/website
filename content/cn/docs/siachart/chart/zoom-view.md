---
title: 视图缩放和移动
linkTitle: 视图缩放和移动
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---


视图缩放是指数据显示范围的缩放，而非图像本身的缩放。

## 视图缩放

### 非精确缩放

Chart提供以下粗略缩放的方法：
```cpp
    /*! \brief 放大显示数据范围
     *
     */
    void zoomIn();

    /*! \brief 缩小显示数据范围
     *
     */
    void zoomOut();
```

### 精确显示数据范围（索引）

图表中的数据是根据key升序排序的，排序后的数据可以使用[0,n)来进行索引。可以调用以下方法，传入数据的索引值来精确显示数据范围：
```cpp
    /*! \brief 设置当前显示的区域
     *
     *    @param    begin 显示开始index
     *    @param    end 显示结束index。-1：显示到最后一条数据
     *    @return
     */
    void setCurrentDomain(int32_t begin = 0, int32_t end = -1);
```

### 开启键盘缩放功能

图表已提供了使用键盘缩放数据显示范围的功能，开启此功能后，可以使用`上下方向键`缩放视图。启用或禁用此功能：请参考[启用内建功能](builtin-func.html)。

## 左右导航数据显示

我们可以使用`setCurrentDomain`来左右移动视图显示。但是图表已提供了更方便的方法：`moveView`。此方法会自动检测偏移后的数据范围，确保显示正确。

### 通过方法调用左右导航
```cpp
    /*! \brief 平移视图（数据显示范围）
     *
     *    @param	offset	>0 向右移动， <0 向左移动，绝对值是移动的index数
     *    @return	返回false，代表移动失败（比如，向左已经移动到第0根index，或者向右已经是最后一个index）
     */
    bool moveView(int offset);
```

### 开启键盘左右导航功能

图表已提供了使用键盘左右导航数据显示的功能，开启此功能后，可以使用`CTRL + 左右方向键`来左右导航视图的显示。启用或禁用此功能：请参考[启用内建功能](builtin-func.html)。


> ## 其他参考
> [启用/禁用内建功能](builtin-func.html)
> [定制框选外观](style-rubber.html)
