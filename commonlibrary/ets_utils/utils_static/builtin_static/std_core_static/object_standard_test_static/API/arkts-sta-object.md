# Object

本模块提供ArkTS-Sta对象基础类型、对象属性枚举函数以及对象合并/构造辅助接口。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## PropertyKey

export type PropertyKey = string

对象属性键类型。

**示例：**

```ets
const key: PropertyKey = "name";
console.log(key);
```

## object

export type object = Object

`Object`的类型别名。

**示例：**

```ets
const value: object = new Object();
console.log(value.toString());
```

## Object

export class Object

所有对象的基础类型。

**示例：**

```ets
const value = new Object();
console.log(value.toString());
```

### constructor

constructor()

创建空对象。

**示例：**

```ets
const obj = new Object();
console.log(obj.toString());
```

### toString

public toString(): String

返回对象字符串表示。

**示例：**

```ets
const obj = new Object();
console.log(obj.toString());
```

### toLocaleString

public toLocaleString(locales?: Intl.LocalesArgument, options?: object): String

返回本地化字符串表示。默认实现返回对象字符串表示。

**示例：**

```ets
const obj = new Object();
console.log(obj.toLocaleString());
```

### $_hashCode

public final $_hashCode(): int

返回对象标识哈希码。

**示例：**

```ets
const obj = new Object();
console.log(obj.$_hashCode().toString());
```

### hasOwnProperty

public hasOwnProperty(index: number): boolean

判断对象是否拥有指定数字索引属性。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| index | number | 是 | 要检查的数字索引。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| boolean | 对象拥有该索引属性时返回`true`，否则返回`false`。 |

**示例：**

```ets
const values = [10, 20];
console.log(values.hasOwnProperty(0));
```

public hasOwnProperty(key: string): boolean

判断对象是否拥有指定字符串属性。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| key | string | 是 | 要检查的属性名。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| boolean | 对象拥有该属性时返回`true`，否则返回`false`。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS" };
console.log(record.hasOwnProperty("name"));
```

### keys

public static keys(rec: Record<PropertyKey, Any>): string[]

返回记录对象的可枚举属性名。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| rec | Record<PropertyKey, Any> | 是 | 要枚举属性名的记录对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string[] | 可枚举属性名数组。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
console.log(Object.keys(record).length.toString());
```

public static keys(o: Object): string[]

返回普通对象的可枚举属性名。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| o | Object | 是 | 要枚举属性名的对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string[] | 可枚举属性名数组。 |

**示例：**

```ets
const obj = new Object();
console.log(Object.keys(obj).length.toString());
```

### values

public static values(rec: Record<PropertyKey, Any>): Any[]

返回记录对象的可枚举属性值。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| rec | Record<PropertyKey, Any> | 是 | 要枚举属性值的记录对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| Any[] | 可枚举属性值数组。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
console.log(Object.values(record).length.toString());
```

public static values(o: Object): Any[]

返回普通对象的可枚举属性值。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| o | Object | 是 | 要枚举属性值的对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| Any[] | 可枚举属性值数组。 |

**示例：**

```ets
const obj = new Object();
console.log(Object.values(obj).length.toString());
```

### entries

public static entries(rec: Record<PropertyKey, Any>): NullishEntryType[]

返回记录对象的键值对数组。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| rec | Record<PropertyKey, Any> | 是 | 要枚举键值对的记录对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| NullishEntryType[] | 键值对数组。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS" };
const entries = Object.entries(record);
console.log(entries.length.toString());
```

public static entries(o: Object): NullishEntryType[]

返回普通对象的键值对数组。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| o | Object | 是 | 要枚举键值对的对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| NullishEntryType[] | 键值对数组。 |

**示例：**

```ets
const obj = new Object();
const entries = Object.entries(obj);
console.log(entries.length.toString());
```

### getOwnPropertyNames

public static getOwnPropertyNames(rec: Record<PropertyKey, Any>): string[]

返回记录对象的自有属性名。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| rec | Record<PropertyKey, Any> | 是 | 要枚举自有属性名的记录对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string[] | 自有属性名数组。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS" };
console.log(Object.getOwnPropertyNames(record)[0]);
```

public static getOwnPropertyNames(o: Object): string[]

返回普通对象的自有属性名。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| o | Object | 是 | 要枚举自有属性名的对象。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string[] | 自有属性名数组。 |

**示例：**

```ets
const obj = new Object();
console.log(Object.getOwnPropertyNames(obj).length.toString());
```

### hasOwn

public static hasOwn(target: Object, key: PropertyKey): boolean

判断对象是否拥有指定字符串属性。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| target | Object | 是 | 要检查的对象。 |
| key | PropertyKey | 是 | 要检查的属性名。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| boolean | 对象拥有该属性时返回`true`，否则返回`false`。 |

**示例：**

```ets
const record: Record<string, Any> = { "name": "ArkTS" };
console.log(Object.hasOwn(record, "name"));
```

public static hasOwn(target: Object, index: number): boolean

判断对象是否拥有指定数字索引属性。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| target | Object | 是 | 要检查的对象。 |
| index | number | 是 | 要检查的数字索引。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| boolean | 对象拥有该索引属性时返回`true`，否则返回`false`。 |

**示例：**

```ets
const values = [10, 20];
console.log(Object.hasOwn(values, 0));
```

### fromEntries

public static fromEntries<T = Any>(entries: Iterable<[PropertyKey, T]>): Record<PropertyKey, T>

根据键值对迭代器创建记录对象。

**示例：**

```ets
const pairs: Array<[string, int]> = [["year", 2026]];
const record = Object.fromEntries<int>(pairs);
console.log((record["year"]!).toString());
```

### assign

public static assign(target: Record<PropertyKey, Any>, ...source: FixedArray<Object>): Record<PropertyKey, Any>

将一个或多个源对象的可枚举属性复制到目标记录并返回目标记录。

**示例：**

```ets
const target: Record<string, Any> = { "name": "ArkTS" };
const source: Record<string, Any> = { "year": 2026 };
const result = Object.assign(target, source);
console.log(Object.hasOwn(result, "year"));
```
