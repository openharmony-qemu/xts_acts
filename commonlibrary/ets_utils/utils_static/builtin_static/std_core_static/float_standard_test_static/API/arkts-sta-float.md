# Float

本模块提供`Float`装箱类型及`float`相关转换、比较、格式化、判断、算术和位转换接口。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## Float

export final class Float extends Floating implements Comparable<Float>

`float`值的装箱类型。`Float`实例保存一个`float`值，并提供浮点数相关的转换、比较和算术方法。

### constructor

public constructor()

创建值为`0.0f`的`Float`实例。

**示例：**

```ets
const value = new Float();
console.log(value.toString());
```

### constructor

public constructor(value: float)

按指定`float`值创建`Float`实例。

**示例：**

```ets
const value = new Float(1.5f);
console.log(value.toString());
```

### constructor

public constructor(value: double)

按指定`double`值创建`Float`实例，构造时会转换为`float`。

**示例：**

```ets
const value = new Float(1.5);
console.log(value.toString());
```

### 静态常量

| 常量 | 类型 | 说明 |
| :--- | :--- | :--- |
| MIN_VALUE | float | 最小正`float`值。 |
| MAX_VALUE | float | 最大`float`值。 |
| MAX_SAFE_INTEGER | int | `float`可安全表示的最大整数。 |
| BIT_SIZE | byte | `float`位数，值为`32`。 |
| BYTE_SIZE | byte | `float`字节数，值为`4`。 |
| NaN | float | 非数字值。 |
| POSITIVE_INFINITY | float | 正无穷。 |
| NEGATIVE_INFINITY | float | 负无穷。 |
| PRECISION | byte | 有效精度位数。 |
| DELTA | float | 两个`float`值进行近似比较时使用的最小差值。 |
| EPSILON | float | 与`DELTA`相同。 |

**示例：**

```ets
console.log(Float.MIN_VALUE.toString());
console.log(Float.MAX_VALUE.toString());
console.log(Float.MAX_SAFE_INTEGER.toString());
console.log(Float.BIT_SIZE.toString());
console.log(Float.BYTE_SIZE.toString());
console.log(Float.isNaN(Float.NaN));
console.log(Float.POSITIVE_INFINITY.toString());
console.log(Float.NEGATIVE_INFINITY.toString());
console.log(Float.PRECISION.toString());
console.log(Float.DELTA.toString());
console.log(Float.EPSILON.toString());
```

### toByte

public override toByte(): byte

将当前`Float`实例保存的值转换为`byte`。

**示例：**

```ets
const value = new Float(12.0f);
const result: byte = value.toByte();
console.log(result.toString());
```

### toShort

public override toShort(): short

将当前`Float`实例保存的值转换为`short`。

**示例：**

```ets
const value = new Float(123.0f);
const result: short = value.toShort();
console.log(result.toString());
```

### toInt

public override toInt(): int

将当前`Float`实例保存的值转换为`int`。

**示例：**

```ets
const value = new Float(123.5f);
const result: int = value.toInt();
console.log(result.toString());
```

### toLong

public override toLong(): long

将当前`Float`实例保存的值转换为`long`。

**示例：**

```ets
const value = new Float(123.5f);
const result: long = value.toLong();
console.log(result.toString());
```

### toFloat

public override toFloat(): float

返回当前`Float`实例保存的`float`值。

**示例：**

```ets
const value = new Float(1.5f);
const result: float = value.toFloat();
console.log(result.toString());
```

### toDouble

public override toDouble(): double

将当前`Float`实例保存的值转换为`double`。

**示例：**

```ets
const value = new Float(1.5f);
const result: double = value.toDouble();
console.log(result.toString());
```

### toByte

public static native toByte(value: float): byte

将传入的`float`值转换为`byte`。

**示例：**

```ets
const result: byte = Float.toByte(8.0f);
console.log(result.toString());
```

### toShort

public static native toShort(value: float): short

将传入的`float`值转换为`short`。

**示例：**

```ets
const result: short = Float.toShort(1024.0f);
console.log(result.toString());
```

### toInt

public static native toInt(value: float): int

将传入的`float`值转换为`int`。

**示例：**

```ets
const result: int = Float.toInt(12.5f);
console.log(result.toString());
```

### toLong

public static native toLong(value: float): long

将传入的`float`值转换为`long`。

**示例：**

```ets
const result: long = Float.toLong(12.5f);
console.log(result.toString());
```

### toFloat

public static toFloat(value: float): float

返回传入的`float`值。该方法用于和其他数值装箱类型的静态转换接口保持一致。

**示例：**

```ets
const result: float = Float.toFloat(1.5f);
console.log(result.toString());
```

### toDouble

public static native toDouble(value: float): double

将传入的`float`值转换为`double`。

**示例：**

```ets
const result: double = Float.toDouble(1.5f);
console.log(result.toString());
```

### compareTo

public override compareTo(other: Float): int

比较当前`Float`实例与`other`。两个值差值小于`Float.EPSILON`时视为相等；当前值更小时返回`-1`，相等时返回`0`，更大或当前值为`NaN`时返回`1`。

**示例：**

```ets
const left = new Float(1.0f);
const right = new Float(2.0f);
console.log(left.compareTo(right).toString());
```

### toString

public static native toString(f: float, r: int): String

按指定进制将`float`值转换为字符串。

**示例：**

```ets
const text = Float.toString(15.0f, 10);
console.log(text);
```

### toString

public static toString(f: float): String

按十进制将`float`值转换为字符串。

**示例：**

```ets
const text = Float.toString(15.5f);
console.log(text);
```

### toString

public toString(r: int): String

按指定进制将当前`Float`实例保存的值转换为字符串。

**示例：**

```ets
const value = new Float(15.0f);
console.log(value.toString(10));
```

### toString

public override toString(): String

按十进制将当前`Float`实例保存的值转换为字符串。

**示例：**

```ets
const value = new Float(15.5f);
console.log(value.toString());
```

### toLocaleString

public toLocaleString(locales?: Intl.LocalesArgument, options?: Intl.NumberFormatOptions): String

按指定区域设置和数字格式选项格式化当前`Float`值。

**示例：**

```ets
const value = new Float(1234.5f);
console.log(value.toLocaleString("en-US"));
```

### toLocaleString

public override toLocaleString(locales?: Intl.LocalesArgument, options?: object): String

按指定区域设置格式化当前`Float`值。若`options`不是`Intl.NumberFormatOptions`实例，则忽略该参数。

**示例：**

```ets
const value = new Float(1234.5f);
const options: object = new Object();
console.log(value.toLocaleString("en-US", options));
```

### compare

public static compare(lhs: float, rhs: float): boolean

判断两个`float`值的差值是否不大于`Float.DELTA`。

**示例：**

```ets
console.log(Float.compare(1.0f, 1.0f));
```

### equals

public equals(other: Any): boolean

判断`other`是否也是`Float`实例且保存相同的`float`值。

**示例：**

```ets
const left = new Float(1.5f);
const right = new Float(1.5f);
console.log(left.equals(right));
```

### isNaN

public static isNaN(v: float): boolean

判断传入的`float`值是否为`NaN`。

**示例：**

```ets
console.log(Float.isNaN(Float.NaN));
```

### isNaN

public isNaN(): boolean

判断当前`Float`实例保存的值是否为`NaN`。

**示例：**

```ets
const value = new Float(Float.NaN);
console.log(value.isNaN());
```

### isFinite

public static isFinite(v: float): boolean

判断传入的`float`值是否为有限值。

**示例：**

```ets
console.log(Float.isFinite(1.0f));
console.log(Float.isFinite(Float.POSITIVE_INFINITY));
```

### isFinite

public isFinite(): boolean

判断当前`Float`实例保存的值是否为有限值。

**示例：**

```ets
const value = new Float(1.0f);
console.log(value.isFinite());
```

### isInteger

public static isInteger(v: float): boolean

判断传入的`float`值是否可视为整数。

**示例：**

```ets
console.log(Float.isInteger(2.0f));
console.log(Float.isInteger(2.5f));
```

### isInteger

public isInteger(): boolean

判断当前`Float`实例保存的值是否可视为整数。

**示例：**

```ets
const value = new Float(2.0f);
console.log(value.isInteger());
```

### isSafeInteger

public static isSafeInteger(v: float): boolean

判断传入的`float`值是否为安全整数。

**示例：**

```ets
console.log(Float.isSafeInteger(2.0f));
console.log(Float.isSafeInteger(2.5f));
```

### isSafeInteger

public isSafeInteger(): boolean

判断当前`Float`实例保存的值是否为安全整数。

**示例：**

```ets
const value = new Float(2.0f);
console.log(value.isSafeInteger());
```

### add

public add(other: Float): Float

返回当前值与`other`相加后的新`Float`实例。

**示例：**

```ets
const result = new Float(1.5f).add(new Float(2.0f));
console.log(result.toString());
```

### sub

public sub(other: Float): Float

返回当前值减去`other`后的新`Float`实例。

**示例：**

```ets
const result = new Float(3.5f).sub(new Float(2.0f));
console.log(result.toString());
```

### mul

public mul(other: Float): Float

返回当前值与`other`相乘后的新`Float`实例。

**示例：**

```ets
const result = new Float(3.0f).mul(new Float(2.0f));
console.log(result.toString());
```

### div

public div(other: Float): Float

返回当前值除以`other`后的新`Float`实例。

**示例：**

```ets
const result = new Float(6.0f).div(new Float(2.0f));
console.log(result.toString());
```

### isLessThan

public isLessThan(other: Float): boolean

判断当前值是否小于`other`。

**示例：**

```ets
console.log(new Float(1.0f).isLessThan(new Float(2.0f)));
```

### isLessEqualThan

public isLessEqualThan(other: Float): boolean

判断当前值是否小于或等于`other`。

**示例：**

```ets
console.log(new Float(2.0f).isLessEqualThan(new Float(2.0f)));
```

### isGreaterThan

public isGreaterThan(other: Float): boolean

判断当前值是否大于`other`。

**示例：**

```ets
console.log(new Float(3.0f).isGreaterThan(new Float(2.0f)));
```

### isGreaterEqualThan

public isGreaterEqualThan(other: Float): boolean

判断当前值是否大于或等于`other`。

**示例：**

```ets
console.log(new Float(3.0f).isGreaterEqualThan(new Float(3.0f)));
```

### bitCastFromInt

public static native bitCastFromInt(bits: int): float

将32位整数位模式解释为对应的IEEE-754 `float`值。

**示例：**

```ets
const value = Float.bitCastFromInt(0x3f800000);
console.log(value.toString());
```

### bitCastToInt

public static native bitCastToInt(val: float): int

将`float`值的IEEE-754位模式转换为32位整数。

**示例：**

```ets
const bits = Float.bitCastToInt(1.0f);
console.log(bits.toString());
```
