---
title: 数据源
linkTitle: 数据源
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

图表是典型的`MVC`模型，所有的图形展示都是由数据来驱动的。

## 数据特点

图表的数据有以下特点：

- 是有序的，按照key值升序排序。
- key唯一。
- 是命名的，在一个图表实例内，数据命名唯一。

可以将数据源想象成一个排序的`map`结构。

## 数据操作
### 添加/编辑数据
通过以下方法添加/编辑数据：
```cpp
    /*! \brief 添加/编辑数据。
     *		因为数据的key是唯一的，后添加的数据会更新原有的数据，所以此方法也可以编辑数据。
	 *	
     *    @param    data_name   数据名称
     *    @param    datas   数据
     *    @return
     */
    void addData(const SkString& data_name, const std::map<chart_key_t, chart_val_t>& datas);
```

因为数据的key是唯一的，所以此方法可以同时添加/编辑数据。

### 移除数据

通过以下方法移除数据：
```cpp
	/*! \brief 移除数据。
	 *		移除数据名所指的所有数据，执行后数据名将销毁。
	 *
	 *    @param	data_name	数据名
	 *    @return
	 */
	void removeData(const SkString& data_name);

	/*! \brief 移除数据
	 *		移除数据名所指数据结构中的部分数据。执行后数据名依然存在。
	 *
	 *    @param	data_name	数据名
	 *    @param	keys	数据key
	 *    @return
	 */
	void removeData(const SkString& data_name, const SkTArray<chart_key_t>& keys);
```
数据的变化影响使用到此数据的序列的显示。但是即便数据名销毁，使用到此数据的序列也并不会被销毁（但是序列不再显示）。

## 数据放大取整

请参考这个章节：[数据显示精度](precision.html)

> **默认情况下，认为数据是不放大的！**

## 数据显示

数据需要通过图表元素（Series/Object等）的解析/转换/表达呈现到界面上才具备意义，不同的图表元素对数据的解析/使用方式是不同的，需要图表元素自身决定如何使用数据。

数据相关元素的显示，请参考其他相关章节。

> ## 其他参考
> 1. [序列和面板](panel-series.html)
> 2. [自定义Object](object-custom.html)
> 3. [自定义公式（公式）开发](formula-dev.html)

