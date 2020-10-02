---
title: 字典翻译（dict）
linkTitle: 字典翻译（dict）
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

我们在添加数据/序列的时候，序列/数据名通常使用一些简短的英文单词。但是在图表上显示的时候，又希望能翻译成比较易读的文本。此时可以使用字典翻译功能。

## Dict对象

Dict对象通过`ChartMan::dict()`方法导出，此对象是全局唯一的：
```cpp
	/*! \brief 字典对象
	 *	
	 *    @param
	 *    @return
	 */
	Dict* dict();
```

使用者可以向词典中加入需要翻译的项目，例如：
```cpp
		auto dic = ChartMan::instance()->dict();
		dic->add(SkString("avg_price"), SkString(u8"均线"));
		dic->add(SkString("open"), SkString(u8"开"));
		dic->add(SkString("high"), SkString(u8"高"));
		dic->add(SkString("low"), SkString(u8"低"));
		dic->add(SkString("close"), SkString(u8"平"));
        ...
```

## 内部使用Dict的地方

图表的以下地方会自动使用Dict翻译：
* 序列名显示。（比如Panel::Title的序列名显示）
* 数据名显示。（比如序列提示框）
* 十字线详细内容显示。

**注意：如果使用`setSeriesTooltipCallback`自己组装tooltip的显示内容，则图表内部不会再自动翻译显示内容。**
