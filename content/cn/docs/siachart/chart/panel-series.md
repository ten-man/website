---
title: 面板和序列
linkTitle: 面板和序列
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---



每个`图表（Chart）`都至少包含一个`面板（Panel）`，每个面板都包含至少一个`序列（Series）`。

## 面板

图表中几乎所有的可视化元素都是在面板中显示的。图表提供的类方法中的第一个参数通常也都是`面板句柄（HPANEL）`。

### 添加面板
当创建了图表实例后，可以通过图表的以下方法添加面板：
```cpp
    /*! \brief 添加图表面板
     *
     *    @param
     *    @return
     */
    HPANEL addPanel();
```

面板在图表中显示的位置（顺序）为添加的顺序。

### 移除面板
移除面板可以通过以下方法：
```cpp
    /*! \brief 移除面板
     *
     *    @param
     *    @return
     */
    bool removePanel(HPANEL panel);
```
面板移除后，`面板句柄（HPANEL）`即失效。面板容器中的一切元素（Series/Objects ...）均被销毁。

## 序列

`序列（Series）`是图表的基础可视化元素。

### 添加序列

通过以下方法添加序列：
```cpp
    /*! \brief 添加一个序列
     *
     *    @param  panel 序列要添加的面板
     *    @param  series_name 序列名字
     *    @param  type 序列类型
     *    @param  datanames 序列需要的数据名字
     *    @return   false |
     *      1，如果序列数据名找不到
     *      2，name冲突
     *      3，panel找不到
     */
    bool addSeries(HPANEL panel, const SkString& series_name, SeriesType typ, const SkTArray<SkString>& datanames);

    bool addSeries(HPANEL panel, const SkString& series_name, SeriesType typ, const SkString& dataname);
```

需要注意的是，在同一个面板中，序列名称是唯一的，不可冲突。如果序列名字已存在，序列添加失败。

### 移除序列

通过以下方法移除序列：

```cpp
	/*! \brief 移除已存在的序列
	 *	
	 *    @param	panel	序列所在面板
	 *    @param	series_name	序列名
	 *    @return	
	 */
	void removeSeries(HPANEL panel, const SkString& series_name);
```

注意：序列的移除不会导致序列关联数据的移除。数据的删除请参考 [数据源](datasource.html) 的相关章节。

> ## 其他参考
> 1. [序列的外观定制](series-style.html)
> 2. [数据源的操作](datasource.html)
> 3. [数据的精度显示](precision.html)