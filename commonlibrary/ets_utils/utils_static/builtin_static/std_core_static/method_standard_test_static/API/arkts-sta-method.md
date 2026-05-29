# Method

本模块提供`Method`反射元数据接口。`Method`表示类或接口的方法，可读取方法签名、所属类型、属性并动态调用。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## Method

export class Method extends Object

方法元数据对象。实例通常由`ClassType`等类型反射API返回。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getName());
```

### getType

public getType(): MethodType

获取方法类型。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getType().getResultType().toString());
```

### getOwnerType

public getOwnerType(): Type

获取声明该方法的类型。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getOwnerType().getName());
```

### getName

public getName(): string

获取方法名。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getName());
```

### getAttributes

public getAttributes(): int

获取方法属性位。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getAttributes().toString());
```

### getAccessModifier

public getAccessModifier(): int

获取访问修饰符。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.getAccessModifier().toString());
```

### isStatic

public isStatic(): boolean

判断是否为静态方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isStatic().toString());
```

### isFinal

public isFinal(): boolean

判断是否为`final`方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isFinal().toString());
```

### isAbstract

public isAbstract(): boolean

判断是否为抽象方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isAbstract().toString());
```

### isConstructor

public isConstructor(): boolean

判断是否为构造函数。

**示例：**

```ets
class Sample {
    constructor() {}
}

const method = (Type.from<Sample>() as ClassType).getConstructor(0);
console.log(method.isConstructor().toString());
```

### isGetter

public isGetter(): boolean

判断是否为getter。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isGetter().toString());
```

### isSetter

public isSetter(): boolean

判断是否为setter。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isSetter().toString());
```

### isNative

public isNative(): boolean

判断是否为native方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isNative().toString());
```

### isAsync

public isAsync(): boolean

判断是否为异步方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.isAsync().toString());
```

### invoke

public invoke(recv: Any, args: FixedArray<Any>): Any

以`recv`作为接收者、`args`作为参数动态调用方法。静态方法和构造函数的`recv`应为`null`。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
const args: FixedArray<Any> = [1];
console.log((method.invoke(new Sample(), args) as int).toString());
```

### toString

public override toString(): string

返回方法的字符串表示。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const method = (Type.from<Sample>() as ClassType).getMethodByName("add");
console.log(method.toString());
```

### equals

public equals(oth: Any): boolean

判断另一个对象是否表示同一个方法。

**示例：**

```ets
class Sample {
    add(value: int): int {
        return value + 1;
    }
}

const classType = Type.from<Sample>() as ClassType;
const left = classType.getMethodByName("add");
const right = classType.getMethodByName("add");
console.log(left.equals(right));
```
