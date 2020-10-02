---
title: Lua配置文件语法
linkTitle: Lua配置文件语法
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---


## lua配置文件语法

资源的基本定义语法如下：

```lua
global={
    font={
        h1="italic-bold 15pt 宋体",
        p1="normal 16px 宋体"
    }
}
```
在此示例中，`global`为资源组名（Res Group），`font` 为资源类型名 （Res Type），`h1, p1` 为资源名字（Res Name），在同一个资源类型下，资源名是唯一的，不可冲突。

资源可以被命名，命名的资源可以在其他地方通过`@global/font/h1`的形式被引用。。

## 资源定义类型
图表已内建支持了几种基本的资源配置类型（见下述子章节），同时提供了扩展开发接口，开发者可以通过注册新的资源解析接口，以提供新的资源类型解析（见下述子章节）。

### 字体
```lua
    font={
        h1="italic-bold 15 宋体,Arial,微软雅黑",
        p1="normal 16 宋体"
    }
```
支持的字体style:
- `italic`
- `italic-bold`
- `normal`
- `bold`

字体大小: 暂不支持字体大小单位，默认为point。

### 颜色
```lua
    color={
        red="#ff0000ff",
        green="#00ff00",
    },
```
语法：`"#RGBA"`。`A`为透明度，`00`：全透明。 `ff`：全不透明。可省略，默认为`ff`。

### 线条
```lua
    stroke={
        border="2.5 round miter"
    }
```
     *    @param res 语法：“$width [$cap] [$join]”, eg:"3.2 round miter"
     *          $width = (0, 1000]
     *          $cap = [butt|round|square]
     *          $join = [miter|round|bevel]

语法：`"width [cap] [join]"`。 `width` 支持浮点数，必须大于0。 `cap` 和 `join`为可选字段。

支持的`cap`类型：
- `butt`
- `round`
- `square`

支持的`join`类型：
- `miter`
- `round`
- `bevel`

### 图像
```lua
    image={
        img="d:/jpg_small/jpgs/a.jpg"
    }
```
语法：`"image-path"`。

### 效果（Effect）
```lua
    effect={
        dashed="dashed:10.0 4.0 2.0 5.0",
        dotted="dashed:1.0 4.0"
    }
```
语法：`$effect_name:$effect_params`。目前支持的`effect_name`：
* dashed

### 自定义解析类型
本图表提供可扩展解析自定义资源类型的方法，使用步骤如下：
1. 从`resy::IResItem`继承，实现自定义资源类型
   ```cpp
    class RESY_API MyItem : public ResItem {}
   ```
2. 从`resy::IResFactory`继承，实现自己的的资源解析器工厂
   ```cpp
    class MyResFactory : public IResFactory {}
   ```
3. 注册资源解析器到 `resy::ResMan`
    ```cpp
    /*! \brief 注册一个资源解析器
     *	        如果已有同类型的资源解析器，则新的将替代前面的！
     *
     *    @param    factory 资源解析器
     *    @return
     */
    void regResFactory(my_sp<IResFactory> factory);

    // 注册资源类型
    regResFactory(std::make_shared<MyResFactory>(this));
    ```
4. 在lua配置文件中使用新的资源配置类型
   ```lua
    myitem="a,b,c,d"
   ```

