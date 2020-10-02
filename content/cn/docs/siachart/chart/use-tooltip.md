---
title: 使用序列提示（Tooltip）
linkTitle: 使用序列提示（Tooltip）
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---


当鼠标移动到序列（Series）或者图元对象（ChartObject）上的时候，图表会显示一个提示框，以展示序列/对象的详细信息。

## 自定义提示信息

默认情况下，序列会显示序列名以及组成序列的数据值。图表提供了重写提示信息的接口，使用者得以扩展显示提示的内容。使用Chart方法：
```cpp
    /*! \brief Tooltip提示内容的回调函数
     *		在设置的时候，序列名必须已经存在，否则设置失败
     *
     *    @param	panel	面板
     *    @param	callbacks <series_name, callback>	回调设置
     *				每个series单独定制一个提示
     *    @return
     */
    void setSeriesTooltipCallback(HPANEL panel, std::map<SkString, SeriesTooltipCallback> callbacks);
```
在提供的回调函数中，将会传入SeriesTooltipData参数，此参数中包含了序列当前的各项数据信息，只需要根据这些提供的信息组装新的需要显示的信息，并填入`SeriesTooltipData::items`字段即可：

```cpp
/*!
 * \class SeriesTooltipData
 *
 * \brief 序列tooltip的数据。
 *	当鼠标移动到序列上的时候，将会弹出一个tooltip展示鼠标指示位置处的序列详细信息。
 *
 */
struct CHARTY_API SeriesTooltipData : public ChartFormater {
    //! 序列名字
    SkString series_name;

    //! 序列类型
    SeriesType typ;

    //! 鼠标所在位置对应的key
    chart_key_t key;

    //! <data_name, data_val>
    std::map<SkString, chart_val_t> datas;

    // ----------------
    //! 输出title
    SkString title;

    //! 显示到Tooltip上的项目
    struct Item {
        SkString cont;
        SkColor color;
    };
    SkTArray<Item> items;
};

```

例如：
```cpp
    auto cb = [](SeriesTooltipData& d)->bool {
        if (d.key % 30 == 0) {
            // 不显示提示
            return false;
        }

        d.title = d.series_name;
        for (auto i : d.datas) {
            SeriesTooltipData::Item item;
            SkString val = d.formatVal(i.second);
            item.cont.printf("%s: %s", i.first.c_str(), val.c_str());
            item.color = SK_ColorRED;

            d.items.push_back(item);
        }
        return true;
    };
    std::map<SkString, SeriesTooltipCallback> cbs;
    cbs.insert({SkString("candle_test"), cb});
    chart_->setSeriesTooltipCallback(main_, cbs);
```

**注意：如果使用`setSeriesTooltipCallback`自己组装tooltip的显示内容，则图表内部不会再自动翻译显示内容。** 请参考：[字典翻译](use-dict.html)


## 显示当前显示序列的最大最小值指示

有时可能会希望在序列上显示一个指示点，用于标识序列的最高最低点，可通过`Chart`的以下方法实现：

```cpp
    /*! \brief 显示序列的最大最小值位置提示
     *
     *    @param	panel	面板
     *    @param	series_name	序列名
     *    @param	show	true，显示。
     *    @return
     */
    void showSeriesMinMaxTip(HPANEL panel, const SkString&series_name, bool show);
```

## 禁用提示

### 禁用整个图表的tooltip
请参考 [启用/禁用内建功能](builtin-func.html) 章节
```cpp
	chart_->setFunction(Chart::kFunctionTooltip, false);
```

### 禁用某个序列的tooltip
在`setSeriesTooltipCallback`的回调函数中返回false即可：
```cpp
    auto cb = [](SeriesTooltipData& d)->bool {
        // 返回false，就不会再显示tooltip了
        return false;
    };
    std::map<SkString, SeriesTooltipCallback> cbs;
    cbs.insert({SkString("candle_test"), cb});
    chart_->setSeriesTooltipCallback(main_, cbs);
```

## 图元对象的提示

图元对象的提示内容只支持简单的字符串，需要在创建图元对象的时候指定：
```cpp
struct CHARTY_API ObjectParam {
    ...

    //! 提示内容
    SkString tooltip;
};

```
请参考 [添加图元对象](add-object.html#添加对象)


> ## 其他参考
> [启用/禁用内建功能](builtin-func.html)
> [Tooltip外观定制](style-luaconfig.html#提示（tooltip）)
> [添加图元对象](add-object.html#添加对象)