# Errors

本模块提供ArkTS-Sta标准库中的常见错误类型。这些类型均继承自`Error`或`RangeError`，用于描述运行时、类型、范围、URI和聚合错误等场景。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## 通用构造函数

constructor(message?: String, options?: ErrorOptions)

除`AggregateError`外，本模块错误类型都支持按消息和可选原因创建实例。

## 错误类型

| 类型 | 继承 | 说明 |
| :--- | :--- | :--- |
| AssertionError | Error | 断言失败。 |
| DivideByZeroError | Error | 除零错误。 |
| NullPointerError | Error | 空引用解引用。 |
| UncaughtExceptionError | Error | 未捕获异常。 |
| SyntaxError | Error | 语法无效。 |
| JSONTypeError | Error | JSON值无法赋给目标类型。 |
| RangeError | Error | 集合索引或数值范围错误，错误码为`401`。 |
| NegativeArraySizeError | RangeError | 数组长度为负数。 |
| ArrayIndexOutOfBoundsError | RangeError | 数组索引越界。 |
| ArithmeticError | Error | 非法算术操作。 |
| OutOfMemoryError | Error | 内存分配失败。 |
| StackOverflowError | Error | 调用栈溢出。 |
| InstantiationError | Error | 实例化抽象类或接口。 |
| InternalError | Error | 内部错误。 |
| IndexOutOfBoundsError | RangeError | 集合索引越界。 |
| StringIndexOutOfBoundsError | RangeError | 字符串索引越界。 |
| ClassCastError | Error | 非法类型转换。 |
| ArrayStoreError | Error | 向数组写入不兼容类型。 |
| ExceptionInInitializerError | Error | 初始化过程发生错误。 |
| CoroutinesLimitExceedError | Error | 协程数量达到限制。 |
| IllegalLockStateError | Error | 锁处于非法状态。 |
| InvalidJobOperationError | Error | 对协程任务执行了非法操作。 |
| ArgumentsUnderapplicationError | Error | `Function`不安全调用参数不足。 |
| InvalidStoreAccessError | Error | 存储访问错误。 |
| EvalError | Error | 求值错误。 |
| NonIntegralIndexError | Error | 索引表达式的小数部分不为0。 |
| TypeError | Error | 值类型不符合操作要求。 |
| ReferenceError | Error | 引用了不存在或尚未初始化的变量。 |
| URIError | Error | URI编码或解码错误。 |
| AggregateError | Error | 多个错误的聚合错误。 |
| FormatError | Error | 输入字符串格式无效。 |

## $_invoke

static $_invoke(message?: String, options?: ErrorOptions): ErrorSubtype

`SyntaxError`、`RangeError`、`EvalError`、`NonIntegralIndexError`、`TypeError`、`ReferenceError`、`URIError`和`FormatError`提供静态`$_invoke`创建接口。

## AggregateError

export class AggregateError extends Error

聚合多个错误的错误类型。

| 成员 | 类型 | 说明 |
| :--- | :--- | :--- |
| errors | Array<Error> | 被聚合的错误列表。 |

## AggregateError constructor

constructor(errors: Iterable<Error>, message?: String, options?: ErrorOptions)

constructor(errors: Error[], message?: String, options?: ErrorOptions)

创建聚合错误。`errors`会被复制到实例的`errors`数组。

## AggregateError.$_invoke

static $_invoke(errors: Iterable<Error>, message?: String, options?: ErrorOptions): AggregateError

static $_invoke(errors: Error[], message?: String, options?: ErrorOptions): AggregateError

创建`AggregateError`实例。

**示例：**

```ets
const range = new RangeError("index out of range");
const type = new TypeError("value type mismatch");
const aggregate = new AggregateError([range, type], "validation failed");

console.log(range.name);
console.log(type.message);
console.log(aggregate.errors.length);
```

