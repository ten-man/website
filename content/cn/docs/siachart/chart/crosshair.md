---
title: 十字线（Crosshair）
linkTitle: 十字线（Crosshair）
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

`十字线（crosshair）`是图表基本的元素之一，我们可以移动十字线在图表视图上导航，也可以禁用十字线功能。

## 十字线功能
默认情况下，十字线功能是开启的。可以通过[启用/禁用内建功能](builtin-func.html)来禁用它：
```cpp
    setFunction(Chart::kFunctionCrossHair, false)
```

## 十字线的移动

十字线可以通过以下几种方式移动：
- 鼠标移动（需要启用`kFunctionMouseInput | kFunctionCrossHair` 标志）
- 键盘`左右方向键`移动 （需要启用`kFunctionKeyInput | kFunctionCrossHair` 标志）
- 通过Chart::moveCrosshair方法调用（需要启用`kFunctionCrossHair`标志）

```cpp
    /*! \brief 移动十字线
     *
     *    @param	offset	>0 向右移动，<0 向左移动. abs(offset) 移动的index的数量
     *    @return
     */
    void moveCrosshair(int offset);
```

## 十字线value面板内容定制
```cpp
/*!
 * \class CrosshairDetail
 *
 * \brief 十字线详情面板内容生成。
 *	继承此类，重写detailItems方法，返回内容列表（DetailItem）
 */
class CHARTY_API CrosshairDetail {
public:
	struct DetailItem {
		SkColor val_color = SK_ColorRED;
		SkString title;
		SkString val;
	};

public:
    /*! \brief 十字线detail面板上显示的项目信息
     *
     *    @param	data	当前十字线所在index索引的数据
     *    @return	detail面板上需要显示的项目
     */
    virtual std::vector<DetailItem> detailItems(const my_sp<chartbase::ColumnData> data) = 0;
};

```
重写`CrosshairDetail::detailItems`以提供十字线detail面板的内容项目。此方法在每次界面重绘的时候都被会调用。


> ## 其他参考
> [启用/禁用内建功能](builtin-func.html)
>
> [十字线的外观定制](style-luaconfig.html#十字线（Calendar）)
