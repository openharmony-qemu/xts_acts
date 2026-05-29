# ErrorHandler

本模块提供`ProcessErrorHandler`相关的ArkTS-Sta标准库接口。`ProcessErrorHandler`用于为未捕获错误注册处理回调。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## ProcessErrorHandler

export class ProcessErrorHandler

封装进程级未捕获错误处理回调。

## constructor

public constructor(cb: UncaughtErrorListener)

创建错误处理器。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| cb | UncaughtErrorListener | 是 | 未捕获错误回调。 |

## handleUncaughtError

public handleUncaughtError(error: Object): void

处理未捕获错误。`error`不是`Error`实例，或回调执行失败时，运行时会输出错误并退出进程。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| error | Object | 是 | 未捕获错误对象。 |

## reset

public reset(cb: UncaughtErrorListener): void

替换内部错误处理回调。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| cb | UncaughtErrorListener | 是 | 新的未捕获错误回调。 |

