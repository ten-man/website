---
title: 公式开发
linkTitle: 公式开发
weight: 1
date: 2018-11-01
description: >
  What can your user do with your project?
---

公式是一组抽象的流程标准化的算法，可以独立于图表而存在。公式的开发可以分为以下几个标准的流程：
1. 实现`formula::IFormula`接口类
2. 注册到公式管理器`formula::FormulaMan`
3. 使用`formula::FormulaMan::create`创建公式实例。
4. 使用公式实例。

## 公式管理器

`FormulaMan`用于管理公式的注册/查询/创建/销毁等。

```cpp
class FORMULA_API FormulaMan{...}
```

## 公式接口类

`SiaChart`中的所有公式都必须实现`IFormula`虚拟接口类：

```cpp
class FORMULA_API IFormula
```

## 注册新的公式到管理器

## 使用公式
