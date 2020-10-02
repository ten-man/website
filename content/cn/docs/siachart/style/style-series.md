---
title: 序列（Series）外观
linkTitle: 序列（Series）外观
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

序列的外观设置分为两级：
- 全局设置
- 针对单个序列设置

针对单个序列设置优先级高于全局设置的优先级。
**注意：一旦对单个序列设置过风格/颜色(`Chart::setSeriesStyle 或 Chart::setSeriesColor`)，全局风格将不会再对其产生影响！**

## 序列风格

序列外观由以下结构定义：
```cpp
/*!
 * \struct SeriesStyle
 *
 * \brief 序列的风格显示
 *
 */
struct CHARTY_API SeriesStyle {
    //! 反锯齿
    bool antialias = false;

    //! line style
    SkScalar stroke_width = SkIntToScalar(1);

    //! bar/candle style
    bool fill_bar = false;

    //! bar的宽度。 0 : 由图表智能决定。
    SkScalar bar_width = SkIntToScalar(0);

    //! 正常的颜色
    SkColor color = SK_ColorWHITE;

    //! candle/updown/axis series color
    SkColor up_color = SK_ColorRED;
    SkColor down_color = SK_ColorGREEN;
};
extern CHARTY_API const SeriesStyle& siaSeriesStyle();
```

## 全局设置序列外观

全局设置是对整个进程内所有的序列进行的统一设置。使用导出的全局API设置：
```cpp
/*! \brief 设置全局的序列外观展示
 *
 *    @param	ss	SeriesStyle风格设置
 *    @return
 */
CHARTY_API void setSiaSeriesStyle(const SeriesStyle& ss);

/*! \brief 返回设置的全局序列外观
 *
 *    @param
 *    @return	const SeriesStyle&
 */
CHARTY_API const SeriesStyle& siaSeriesStyle();
```
可以在运行过程中全局更改序列的外观，这是实时生效的。序列实例创建后会自动应用全局外观设置。

## 针对单个序列设置外观

也可以针对每一个序列实例来设置序列外观以达到更精确的控制，通过`Chart::setSeriesStyle`方法来设置：
```cpp
    /*! \brief 定制序列的外观风格
     *		此时被设置的序列必须是已存在的，否则设置无效
     *    @param	panel	需要设置风格的面板
     *    @param	styles	序列的外观风格
     *    @return
     */
    void setSeriesStyle(HPANEL panel, const std::map<SkString, SeriesStyle>& styles);
```

或者仅设置序列的颜色，此方法仅对单色的序列有效（Bar/Line 等），`Chart::setSeriesColor`：
```cpp
    /*! \brief 设置panel中的序列显示颜色
     *		此方法仅对单色的序列有效，比如Bar/Line等。对于Candle/Updown序列请使用setSeriesStyle设置
     *
     *    @param    panel   面板索引
     *    @param    colors   序列颜色，目前的设计中，如果对应的series name不存在，则设置无效
     */
    void setSeriesColor(HPANEL panel, const std::map<SkString, SkColor>& colors);
```


**注意：此方法调用的时候，被设置的序列实例必须存在，否则设置无效。**

> ## 其他参考
> [创建序列](panel-series.html)
> [序列的类型](series-candle.html)

