# Field

本模块提供`Field`相关的ArkTS-Sta标准库接口。`Field`表示类或接口上的字段元数据，可用于读取字段类型、所属类型、名称、属性以及静态字段值。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## Field

export class Field extends Object

字段元数据对象。实例通常由`ClassType`等类型反射API返回。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getName());
```

### getType

public getType(): Type

获取字段类型。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getType().toString());
```

### getOwnerType

public getOwnerType(): Type

获取声明该字段的类型。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getOwnerType().getName());
```

### getName

public getName(): String

获取字段名。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getName());
```

### getAttributes

public getAttributes(): int

获取字段属性位。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getAttributes().toString());
```

### getAccessModifier

public getAccessModifier(): int

获取字段访问修饰符。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.getAccessModifier().toString());
```

### isStatic

public isStatic(): boolean

判断字段是否为静态字段。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.isStatic().toString());
```

### isReadonly

public isReadonly(): boolean

判断字段是否为只读字段。

**示例：**

```ets
class Sample {
    readonly count: int = 1;
}

const classType = Type.from<Sample>() as ClassType;
const field = classType.getFieldByName("count");
console.log(field.isReadonly().toString());
```

### getStaticValue

public getStaticValue(): Any

读取静态字段的当前值。字段不是静态字段时会抛出`TypeError`。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const classType = Type.from<Sample>() as ClassType;
const field = classType.getFieldByName("count");
console.log((field.getStaticValue() as int).toString());
```

### setStaticValue

public setStaticValue(v: Any): void

设置静态字段值。字段不是静态字段，或传入值无法赋给字段类型时会抛出`TypeError`。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const classType = Type.from<Sample>() as ClassType;
const field = classType.getFieldByName("count");
field.setStaticValue(2);
console.log((field.getStaticValue() as int).toString());
```

### toString

public override toString(): string

返回`字段名: 字段类型`格式的字符串。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const field = (Type.from<Sample>() as ClassType).getFieldByName("count");
console.log(field.toString());
```

### equals

public equals(oth: Any): boolean

判断另一个对象是否表示同一个字段。

**示例：**

```ets
class Sample {
    static count: int = 1;
}

const classType = Type.from<Sample>() as ClassType;
const left = classType.getFieldByName("count");
const right = classType.getFieldByName("count");
console.log(left.equals(right));
```
