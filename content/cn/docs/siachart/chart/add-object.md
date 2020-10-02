---
title: "添加对象"
linkTitle: "添加对象"
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

## 图元对象（ChartObject）

`图元对象（Object）`是图表的基础可视化元素之一。使用图元对象可以方便的对图表做标注。比如，可以根据自己开发的公式在序列上标注买卖点等。

### 添加对象

通过以下方法添加对象：
```cpp
    /*! \brief 添加一个自定义的可视化对象（Object）
     *
     *    @param    panel   添加到哪个panel中
     *              name    对象名
     *              para    对象参数
     *              obj     对象绘制类型
     *
     *    @return   如果panel不存在，或者对象名已存在，或者参数错误，返回false
     */
    bool addObject(HPANEL panel, const SkString& name, const ObjectParam&para, my_sp<IVisualObject> obj);
```
请查看[其他参考](add-object.html#其他参考) 章节以掌握对象的定位和对象类型。

### 移除对象

通过以下方法移除已有对象：
```cpp
    /*! \brief 移除可视化对象
     *	
     *    @param	panel	面板
     *    @param	object_name	对象名
     *    @return
     */
    void removeObject(HPANEL panel, const SkString& object_name);
```

> ## 其他参考
> [创建自定义对象](object-custom.html)
> [对象的显示位置](object-position.html)

