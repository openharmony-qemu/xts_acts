# Iterator

本模块提供ArkTS-Sta迭代协议相关接口。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## IteratorResult

export class IteratorResult<out T>

迭代器单次迭代结果。

## constructor

constructor()

创建完成状态的迭代结果。

## constructor

constructor(done: boolean, value: T | undefined)

按完成状态和值创建迭代结果。

## constructor

constructor(value: T)

创建未完成且包含当前值的迭代结果。

## Iterator

export interface Iterator<out T>

| 方法 | 说明 |
| :--- | :--- |
| next(): IteratorResult<T> | 返回下一次迭代结果。 |

## Iterable

export interface Iterable<out T>

| 方法 | 说明 |
| :--- | :--- |
| $_iterator(): IterableIterator<T> | 返回可迭代迭代器。 |

## IterableIterator

export interface IterableIterator<out T> extends Iterator<T>, Iterable<T>

同时满足`Iterator`和`Iterable`协议的迭代器。

## iteratorForEach

export function iteratorForEach<V>(x: Iterator<V>, fn: (x: V) => void): void

依次读取迭代器中的值并调用`fn`。

