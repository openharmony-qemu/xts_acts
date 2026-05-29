# Global

本模块提供ArkTS-Sta中的全局数值常量、数值解析/判断函数以及定时器函数。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## 常量

| 常量 | 类型 | 说明 |
| :--- | :--- | :--- |
| NaN | number | IEEE-754中的非数字值。 |
| Infinity | number | IEEE-754中的正无穷值。 |

**示例：**

```ets
console.log(isNaN(NaN));
console.log(isFinite(Infinity));
```

## parseInt

export function parseInt(s: String): number

export function parseInt(s: String, radix: int): number

export function parseInt(s: String, radix: number): number

将字符串按指定进制解析为整数数值。未传入`radix`时使用默认解析规则。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| s | String | 是 | 待解析的字符串。 |
| radix | int \| number | 否 | 解析使用的进制。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| number | 解析得到的整数数值。 |

**示例：**

```ets
console.log(parseInt("2a", 16));
console.log(parseInt("42"));
```

## parseFloat

export function parseFloat(s: String): number

将字符串解析为浮点数值。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| s | String | 是 | 待解析的字符串。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| number | 解析得到的浮点数值。 |

**示例：**

```ets
console.log(parseFloat("3.5"));
```

## isNaN

isNaN(value): boolean

判断数值是否为`NaN`。支持`byte`、`short`、`int`、`long`、`float`和`number`重载；整数类型重载总是返回`false`。

**示例：**

```ets
console.log(isNaN(NaN));
console.log(isNaN(42));
```

## isFinite

isFinite(value): boolean

判断数值是否为有限值。支持`byte`、`short`、`int`、`long`、`float`和`number`重载；整数类型重载总是返回`true`。

**示例：**

```ets
console.log(isFinite(42.0));
console.log(isFinite(Infinity));
```

## isInteger

isInteger(value): boolean

判断数值是否为整数。支持`byte`、`short`、`int`、`long`、`float`和`number`重载；整数类型重载总是返回`true`。

**示例：**

```ets
console.log(isInteger(42.0));
console.log(isInteger(3.5));
```

## isSafeInteger

isSafeInteger(value): boolean

判断数值是否处于安全整数范围内。支持`int`、`long`、`float`和`number`重载。

**示例：**

```ets
console.log(isSafeInteger(42));
console.log(isSafeInteger(3.5));
```

## setTimeout

export function setTimeout(func: Function): int

export function setTimeout(func: Function, delayMs: int | null | undefined, ...args: FixedArray<Any>): int

export function setTimeout(msg: string, delayMs?: int | null): int

在指定延迟后执行函数，或输出字符串消息。返回的定时器ID可传给`clearTimeout`。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| func | Function | 是 | 到期后执行的函数。 |
| msg | string | 是 | 到期后输出的字符串消息。 |
| delayMs | int \| null \| undefined | 否 | 延迟毫秒数。 |
| args | FixedArray<Any> | 否 | 传给函数的参数。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| int | 定时器ID。 |

**示例：**

```ets
function main(): void {
    const timerId = setTimeout("timeout message", 1000);
    clearTimeout(timerId);
}
```

## clearTimeout

export function clearTimeout(timerId?: int | null): void

取消由`setTimeout`创建的定时器。`timerId`为空时不执行操作。

**示例：**

```ets
function main(): void {
    const timerId = setTimeout("timeout message", 1000);
    clearTimeout(timerId);
}
```

## setInterval

export function setInterval(func: Function, delayMs: int | null | undefined, ...args: FixedArray<Any>): int

export function setInterval(msg: string, delayMs?: int | null): int

按固定间隔重复执行函数，或重复输出字符串消息。返回的定时器ID可传给`clearInterval`。

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| int | 定时器ID。 |

**示例：**

```ets
function main(): void {
    const timerId = setInterval("interval message", 1000);
    clearInterval(timerId);
}
```

## clearInterval

export function clearInterval(timerId?: int | null): void

取消由`setInterval`创建的定时器。`timerId`为空时不执行操作。

**示例：**

```ets
function main(): void {
    const timerId = setInterval("interval message", 1000);
    clearInterval(timerId);
}
```
