# Error

本模块提供`Error`基础错误类型及`ErrorOptions`接口。`Error`用于表示可抛出和可捕获的运行时错误，并保存错误名称、错误码、消息、原因和堆栈信息。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## ErrorOptions

export interface ErrorOptions

创建错误对象时可选的配置。

| 属性 | 类型 | 说明 |
| :--- | :--- | :--- |
| cause? | Object | 原始错误原因。 |

## Error

export class Error

标准错误基础类。

## constructor

constructor(code: int, message?: String, options?: ErrorOptions)

按错误码、消息和可选原因创建`Error`实例，错误名默认为`Error`。

## constructor

constructor(message?: String, options?: ErrorOptions)

按消息和可选原因创建`Error`实例，错误码默认为`0`。

## constructor

constructor(name: String, code: int, message?: String, options?: ErrorOptions)

按错误名、错误码、消息和可选原因创建`Error`实例。

## constructor

constructor(name: String, message: String | undefined, options?: ErrorOptions)

按错误名、消息和可选原因创建`Error`实例，错误码默认为`0`。

## 属性

| 属性 | 类型 | 说明 |
| :--- | :--- | :--- |
| name | string | 错误名称，可读写。 |
| code | int | 错误码，可读写。 |
| message | string | 错误消息，可读写。 |
| cause | Object \| undefined | 原始错误原因，可读写。 |
| stack | String \| undefined | 错误堆栈，可读写。读取时会按需生成堆栈字符串。 |

## Error.$_invoke

static $_invoke(message?: String, options?: ErrorOptions): Error

创建`Error`实例，等价于按`message`和`options`调用构造函数。

## toString

override toString(): String

返回错误的字符串表示。名称和消息都存在时返回`name: message`格式。

**示例：**

```ets
const cause = new Error("root cause");
const err = new Error("RuntimeError", 1001, "failed", { cause: cause });

console.log(err.name);
console.log(err.code);
console.log(err.message);
console.log(err.toString());
```

