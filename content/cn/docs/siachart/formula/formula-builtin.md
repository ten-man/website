---
title: 内建公式
linkTitle: 内建公式
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

SiaChart 已集成了[TA-lib](http://ta-lib.org/)，并简化了使用接口，可以非常方便的在图表中显示各种指标公式。

## 使用内建公式

在图表指定面板中显示公式只需要调用`Chart::showFormula`即可，并且可以通过参数`formula::TaParam`控制公式在图表上的输出形式：

```cpp
    /*! \brief 应用一个公式
     *
     *    @param    panel   公式计算后，在哪个panel上显示
     *    @param    ta_name 公式名
     *    @param    param   公式需要的参数
     *    @return	公式实例的ID。 >0 为添加成功
     */
    int32_t showFormula(HPANEL panel, const SkString& ta_name, const formula::TaParam& param);
```

### 例子：显示MACD

例如，显示MACD指标在图表上：
```cpp
    formula::TaParam para;
    para.setParam(SkString("optInFastPeriod"), 12);
    para.setParam(SkString("optInSlowPeriod"), 26);
    para.setParam(SkString("optInSignalPeriod"), 9);

    // ... 其他参数设置

    // 显示到图表
    _id = chart_->showFormula(formula_panel_, SkString("MACD"), para);
```

### 使用默认参数

对于内建的公式，如果不从外部传入任何参数，则自动使用默认的参数，所以以上代码可以简化为：
```cpp
    formula::TaParam para;
    _id = chart_->showFormula(formula_panel_, SkString("MACD"), para);
```

### 定制输出序列

公式运行后，将（可能）产生数据输出，我们可以将数据输出为图表序列：
```cpp
    formula::TaParam para;

    // 定制一个输出序列
    formula::TaSeries ts;
    ts.color = SK_ColorBLUE;
    ts.data_name.push_back(SkString("outMACD"));
    ts.series_name = SkString("fast_p");
    ts.typ = SeriesType::kLine;

    // 添加输出序列到参数中
    para.addOutSeries(ts);

    // 计算公式，并输出序列到图表上
    _id = chart_->showFormula(formula_panel_, SkString("MACD"), para);
```
