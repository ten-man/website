---
title: 外观配置文件
linkTitle: 外观配置文件
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

配置文件格式为lua，通过内置的lua引擎解析后提供给图表使用。基本的配置语法请参考[lua配置文件语法](style-luasyntax.html)。

## 文件结构
```lua
-- 资源
global={
    font={},
    ...
}

-- 窗口应用
paint={
    crosshair={},
    ...
}
```

配置文件共有两个lua table对象。`global`组为全局可引用的资源定义，`paint`为图表特定控件的定制。

## geometry资源解析

为了支持定制面板内的各个组件大小，本图表实现了自定义的`geometry`资源类型的解析。语法为：`"x, y, width, height"`。 字段可以为空，如`geometry=",,,20"`，解析后，仅有`height=20`是有效的。

面板内的组件不支持`(x,y)`定位（它们的左上角位置都是自动计算的），所以以下的控件x，y字段均留空。

## 图表控件定制
### 面板定制
```lua
    mainview={
        background={
            color="#000000"
        },
        grid={
            color="#930a01",
            stroke="1 square miter",
            effect="@global/dashed"
        }
    },
```
面板的定制包括两种：
- background：背景
- grid：网格线
  
**注意：（Grid MiddleLine的宽度为此处的(宽度 * 2 + 1)）**

### 标题栏（Title）
```lua
    title={
        background={
            color="#000000ff"
        },
        text={
            font="bold 13pt 宋体",
            color="#ffffffff"
        },
        border={
            stroke="2 square miter",
            color="@global/border"
        },
        geometry=",,,20"
    },
```
`标题（Title）`定制包括：
- background：背景
- text：字体以及颜色
- border：边界
- geometry：大小，仅支持高度定制。

### 值轴（ValueAxis）
```lua
    value_axis={
        background={
            color="#000000ff"
        },
        border={
            color="@global/theme",
            stroke="1 square miter"
        },
        text={
            font="@global/font/p1",
            color="#ffffffff"
        },
        below_text={            
            font="@global/font/p1",
            color="@global/color/red"
        },
        above_text={            
            font="@global/font/p1",
            color="@global/color/green"
        },
        geometry=",,60,"
    },
```
`值轴（ValueAxis）`定制包括：
- background：背景
- border：边界，颜色和宽度。
- geometry：大小，仅支持宽度定制。
- text：字体
- below_text：中值以下的字体显示（调用Chart::setMiddleVal后生效）
- above_text：中值以上的字体显示（调用Chart::setMiddleVal后生效）

### 比例轴（RatioAxis）
```lua
    ratio_axis={
        background={
            color="#000000ff"
        },
        text={
            font="@global/font/p1",
            color="#ffffffff"
        },
        below_text={            
            font="@global/font/p1",
            color="@global/color/red"
        },
        above_text={            
            font="@global/font/p1",
            color="@global/color/green"
        },
        border={
            color="@global/theme",
            stroke="1 square miter"
        },
        geometry=",,60,"
    },
```
`比例轴（RatioAxis）`定制包括：
- background：背景
- text：字体
- below_text：中值以下的字体显示（调用Chart::setMiddleVal后生效）
- above_text：中值以上的字体显示（调用Chart::setMiddleVal后生效）
- border：边界，包括颜色和宽度
- geometry：大小，仅支持宽度定制。

### 日历轴（Calendar）
```lua
    calendar={
        background={
            color="#000000"
        },
        border={
            stroke="@global/border",
            color="@global/border"
        },
        text={
            ...
        }
        geometry=",,,20"
    },
```
`日历`定制包括：
- background：背景
- text：字体以及颜色
- border：边界
- geometry：大小，仅支持高度定制。

### 十字线（Calendar）
```lua
    crosshair={
        line={
            color="#ffffff",
            stroke="1 square miter"
        },
        tag_background={
            color="#0000ff"
        },
        tag_border={
            stroke="1",
            color="#ffffff"
        },
        tag_text={ 
            color="#ffffff",
            font="@global/font/b1"
        },
        ---- detail panel
        detail_border={
            stroke="2 square miter",
            color="#ffffff"
        },
        detail_background={
            color="#000000"
        },
        detail_title={
            font="normal",
            color="#ffffff"
        },
        detail_value={
            color="#54FFFF"
        },
        geometry=",,60,120",
        -- rubber
        rubber={
            color="#9EEA6AAA"
        }
    },
```
`十字线（Crosshair）`定制包括：
- line：十字线
- tag_text：十字线两端显示的值字体以及颜色
- tag_border：tag的边界
- tag_background：tag背景色
- geometry：detail面板的大小。仅支持宽高设置，可选设置，如果不设置，程序会自动计算大小。如果设置，将使用设置的大小。
- detail_border：detail 面板边界
- detail_background：detail 面板背景
- detail_title：detail面板的标题字体颜色
- detail_value：detail面板的值默认字体颜色。（需要配合`CrosshairDetailItem` 和 `CrosshairStyle`）
- rubber：框选

### 框选（Rubber）
```lua
    crosshair={
        rubber={
            color="#9EEA6A99"
        }
    }
```
`框选（Rubber）`被集成到`crosshair`组中，可定制的仅有框选颜色：
- color：框选的颜色

### 提示（tooltip）
```lua
    tooltip={
        background={
            color="#000000"
        },
        border={
            stroke="@global/border",
            color="@global/border"
        },
        text={
            color="#ffffff"
        }
    }
```
`提示（Tooltip）`定制包括：
- background：背景
- border：边界
- text：字体

> ## 其他参考
> [lua配置文件语法](style-luasyntax.html)
> 