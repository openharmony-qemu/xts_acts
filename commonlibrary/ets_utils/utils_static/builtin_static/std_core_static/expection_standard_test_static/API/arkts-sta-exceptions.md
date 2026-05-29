# Exceptions

本模块提供ArkTS-Sta标准库中的通用异常类型。这些类型均继承自`Error`，用于表达参数、状态、运行时和不支持操作等错误场景。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## 异常类型

| 类型 | 构造函数 | 说明 |
| :--- | :--- | :--- |
| NoDataError | constructor(message?: String, options?: ErrorOptions) | 需要数据但未提供时使用。 |
| ArgumentOutOfRangeError | constructor(message?: String, options?: ErrorOptions) | 参数值超出允许范围时使用。 |
| IllegalStateError | constructor(message?: String, options?: ErrorOptions) | 方法在非法或不合适的状态下被调用时使用。 |
| UnsupportedOperationError | constructor(message?: String, options?: ErrorOptions) | 请求的操作不受支持时使用。 |
| IllegalArgumentError | constructor(message?: String, options?: ErrorOptions) | 方法收到非法参数时使用。 |
| RuntimeError | constructor(message?: String, options?: ErrorOptions) | 运行时错误的通用类型。 |

## constructor

constructor(message?: String, options?: ErrorOptions)

创建对应异常类型的实例。`message`用于设置错误消息，`options.cause`可设置原始原因。

**示例：**

```ets
const err = new IllegalArgumentError("count must be positive");
console.log(err.name);
console.log(err.message);
```

