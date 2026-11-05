# concurrent_builtins_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/concurrent_builtins_test/entry/src/ohosTest/ets/test/` 下 **23** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`/`Ability.test.ets`），post-dedup 解析 **437** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；本套件删除 6 条跨套件同名同体重复：testSubarray/testToString/testLastIndexOf 副本已从 String/TypedArray/FastbufferSecond 移除）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
concurrent_builtins_test（String/TypedArray/DataView 内置 + CBL-Runtime + JS 内置）
├── 1. 接口测试
│   ├── 1.1 String / 1.2 TypedArray / 1.3 DataView（内置）
│   ├── 1.4 taskpool 运行时（TaskGroup/addTask/execute + Concurrent* 266 各 builtin 并发）
│   ├── 1.5 BigInt / 1.6 Boolean / 1.7 Error / 1.8 Intl / 1.9 Number
│   ├── 1.10 BigInt.asIntN/AsUintN
│   ├── 1.11 char 字面量 / 1.12 float 字面量 / 1.13 multiline string / 1.14 null 字面量
│   └── 1.15 泛型 / 1.16 utility 类型（Partial/Readonly/Record/Proxy/Private）
├── 2. 稳定性（无显式大容量/循环创建销毁压测，仅 concurrentNum 次并发）
├── 3. 性能（无计时/吞吐基准）
├── 4. 并发安全（taskpool.TaskGroup + execute 并发应力 = 全套件核心形态）
├── 5. 兼容性与继承（子类化未覆盖；跨线程引用传递由 taskpool 序列化间接覆盖）
└── 6. 资料与文档符合性（String/TypedArray/DataView 无独立 SDK .md；@tc.desc 普遍为 "Test"）
```

> **核心形态说明**：`String`/`TypedArray`/`DataView`/`CBL-Runtime`/`JS 内置` 各用例均采用同一并发应力模板——`it('test<Method>', flags, async fn)` 内 `new taskpool.TaskGroup` → 循环 `concurrentNum` 次 `group.addTask` → `await taskpool.execute(group)` → 断言 `result.length === concurrentNum`，catch 仅 `assertFail()`。即每用例只验证"方法在 N 次并发下不崩溃且回传任务数"，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担。

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 23 文件 / 437 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | BigInt.test.ets | 2 | JS-Builtins·BigInt(2) |
| 2 | Boolean.test.ets | 14 | JS-Builtins·Boolean(14) |
| 3 | BuiltinsAsIntNTest.test.ets | 10 | JS-Builtins·BigInt/AsIntN(10) |
| 4 | BuiltinsCharLiteralTest.test.ets | 10 | JS-Builtins·char 字面量(10) |
| 5 | BuiltinsConstructorTest.test.ets | 2 | JS-Builtins·BigInt 构造(2) |
| 6 | BuiltinsFloatLiteralTest.test.ets | 8 | JS-Builtins·float 字面量(8) |
| 7 | BuiltinsGenericsActTest.test.ets | 7 | JS-Builtins·泛型(7) |
| 8 | BuiltinsMultilineStringLiteralTest.test.ets | 2 | JS-Builtins·多行串字面量(2) |
| 9 | BuiltinsNullLiteralTest.test.ets | 1 | JS-Builtins·null 字面量(1) |
| 10 | BuiltinsNumberConstructorTest.test.ets | 8 | JS-Builtins·Number(8) |
| 11 | BuiltinsPartialUtilityType.test.ets | 5 | JS-Builtins·utility 类型(5) |
| 12 | ConcurrentGlobalTest.test.ets | 51 | CBL-Runtime(Global 001~051,51) |
| 13 | ConcurrentSecondTest.test.ets | 97 | CBL-Runtime(typed-array ctor+各 builtin 并发,97) |
| 14 | ConcurrentTest.test.ets | 68 | CBL-Runtime(reflect/number/map/locale/regexp/promise/weakmap/set/weakset/weakref/object/json,68) |
| 15 | ConcurrentThirdTest.test.ets | 31 | CBL-Runtime(Array 全方法并发,31) |
| 16 | CoucurrentFourthTest.test.ets | 19 | CBL-Runtime(regexp symbol*/bigint/string/泛型/utility,19) |
| 17 | DataView.test.ets | 22 | DataView(~21 get/set 方法) |
| 18 | Error.test.ets | 8 | JS-Builtins·Error(8) |
| 19 | Intl.test.ets | 16 | JS-Builtins·Intl(16) |
| 20 | String.test.ets | 33 | String(33,规范驻 testSlice) |
| 21 | TypedArray.test.ets | 23 | TypedArray(25 原型方法) |
| | **合计** | **437** | 21 文件（+2 聚合器 List.test.ets/Ability.test.ets，0 例已排除） |

---

# 1. 接口测试

> **本套件为"并发应力模板"套件**：各接口用例均采用同一模板——`new taskpool.TaskGroup` → 循环 `concurrentNum` 次 `group.addTask` → `await taskpool.execute(group)` → 断言 `result.length === concurrentNum`，catch 仅 `assertFail()`。每用例只验证"方法在 N 次并发下不崩溃且回传任务数"，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担。下列各 §1.x 树中 ❸~❹ 类（边界值/异常/返回值）多为 ❌，是模板的结构性缺口（非本套件职责），缺口详见 §7。

## 1.1 String（内置）

```
String
├── 入参范围覆盖
│   ├── charAt/concat/includes/indexOf/lastIndexOf/matchAll/normalize
│   ├── padEnd/padStart/replace/replaceAll/search/slice/split/startsWith/substring
│   ├── toLowerCase/toUpperCase/trim/trimStart/trimEnd/valueOf/raw/localeCompare
│   └── ~33 原型方法点（固定串入参）
├── 边界值测试
│   └── ❌ 无空串/单字符/超长串/0 长度边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言 401（RegExp 非法/replace 回调类型）
├── 返回值与类型验证
│   └── ❌ 仅 result.length==N，未校验 charAt/slice/replace 返回串
├── 组合场景
│   └── TaskGroup + execute
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`String.test.ets`（33，规范驻 `testSlice`；`testToString`/`testLastIndexOf` 副本已按去重移除）。
- **测了哪些**：33 原型方法的并发应力；不测返回串正确性、空串/代理对边界、replaceAll/matchAll 回调异常（见 §7.2）。

---

## 1.2 TypedArray（内置）

```
TypedArray
├── 入参范围覆盖
│   ├── copyWithin/entries/fill/filter/find/findIndex/forEach/includes/indexOf
│   ├── join/keys/lastIndexOf/map/reduce/reduceRight/reverse/set/slice/some/sort
│   ├── subarray/[Symbol.iterator] + from/of（25 原型方法）
│   └── 各子类构造器 uint8/16/32array_constructor/from/of/byteoffset/bytelength/buffer/length/bytesperelement（ConcurrentSecondTest 97）
├── 边界值测试
│   └── ❌ 无 length=0/1/超长/字节对齐边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言 set 越界/类型不匹配 RangeError
├── 返回值与类型验证
│   └── ❌ 仅 result.length==N，未校验 filter/map/find 返回数组内容
├── 组合场景
│   ├── TaskGroup + execute
│   └── typed-array ctor + 各 builtin 并发（ConcurrentSecondTest）
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`TypedArray.test.ets`（23，25 原型方法；`testSubarray`/`testToString`/`testLastIndexOf` 副本已按去重移除，规范在 `Fastbuffer.test.ets`）+ `ConcurrentSecondTest.test.ets`（97，并发覆盖各 typed-array 子类构造器，归 CBL-Runtime，详见 §1.4）。
- **测了哪些**：25 原型方法 + 各子类构造器的并发应力；不测 set 越界、sort 比较器异常、subarray 视图共享/独立性、返回数组内容（见 §7.2）。

---

## 1.3 DataView（内置）

```
DataView
├── 入参范围覆盖
│   ├── byteLength / byteOffset
│   ├── getInt8/16/32、getUint8/16/32、getFloat32/64、getBigInt64/getBigUint64
│   └── setInt8/16/32、setUint8/16/32、setFloat32/64、setBigInt64/setBigUint64
├── 边界值测试
│   └── ❌ 无 offset 对齐边界/越界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言 get/set 越界 RangeError
├── 返回值与类型验证
│   └── ❌ 仅 result.length==N，未校验 getInt*/getFloat* 返回值
├── 组合场景
│   ├── TaskGroup + execute
│   └── get→set→get 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`DataView.test.ets`（22，~21 逻辑方法：byteLength/byteOffset + get*/set* Int8/16/32/Uint8/16/32/Float32/64/BigInt64/BigUint64）。
- **测了哪些**：get/set 全数值类型的并发应力；不测 offset 越界 RangeError、littleEndian=true/false 字节序正确性、对齐边界（见 §7.2）。

---

## 1.4 taskpool 运行时（TaskGroup / addTask / execute）

> 本节聚合 `ConcurrentTest/Second/Third/Fourth/Global`（266 例）显式针对 builtin 在 taskpool 下的并发执行；taskpool 为全套件并发载体。

```
taskpool
├── 入参范围覆盖
│   ├── TaskGroup(name)/addTask(fn)/execute(group) 主路径
│   ├── Array 全方法并发（ConcurrentThirdTest 31：constructor/of/fill/...）
│   ├── Map/Set/WeakMap/WeakSet/WeakRef/Object/JSON/Reflect/RegExp/Locale/Promise/Number 并发（ConcurrentTest 68）
│   └── Global builtin 并发（ConcurrentGlobalTest 51）+ regexp symbol*/bigint/string/泛型/utility（CoucurrentFourth 19）
├── 边界值测试
│   └── 🟡 concurrentNum 次，❌ 无 1/极大/0 任务边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言 taskpool 错误码
├── 返回值与类型验证
│   ├── ✅ result.length==concurrentNum
│   └── ❌ 未校验返回值内容
├── 组合场景
│   └── TaskGroup + addTask + execute 组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── 核心形态（worker 池调度 + 跨线程结果回传）
```

- **用例位置**：`ConcurrentTest.test.ets`（68：reflect/number/map/locale/regexp/promise/weakmap/set/weakset/weakref/object/json）+ `ConcurrentSecondTest.test.ets`（97：typed-array ctors + 各 builtin 并发）+ `ConcurrentThirdTest.test.ets`（31：Array 全方法并发）+ `CoucurrentFourthTest.test.ets`（19：regexp symbol*/bigint/string 方法/泛型/utility）+ `ConcurrentGlobalTest.test.ets`（51：Global 001~051）= 266 用例。
- **测了哪些**：taskpool 调度正确性（任务数回传）+ Array/Map/Set/RegExp/Reflect/Object/Number/typed-array-ctor/global 各 builtin 在 taskpool 下的并发；不测任务取消/超时/优先级/序列化失败错误码、worker 数量边界、跨线程共享对象可见性（见 §7.2）。

---

## 1.5 BigInt（内置）

```
BigInt
├── 入参范围覆盖
│   ├── BigInt asIntN/prototype toString（BigInt.test 2）
│   └── BigInt 构造（BuiltinsConstructorTest 2：positive/string）+ 运算 div/add/sub/mod/pow（AsIntNTest 4~8）
├── 边界值测试
│   └── ❌ 无极值/溢出边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 运算组合（div/add/sub/mod/pow）
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BigInt.test.ets`（2）+ `BuiltinsConstructorTest.test.ets`（2：`testBigIntPositive/testBigIntString`）+ `BuiltinsAsIntNTest.test.ets`（BigInt 运算 4~8 段，详见 §1.10）。
- **测了哪些**：BigInt 运算/toString/构造的并发应力；不测 BigInt 溢出、类型错误码（见 §7.2）。

---

## 1.6 Boolean（内置）

```
Boolean
├── 入参范围覆盖
│   ├── constructor（testBooleanConstructor0001）
│   ├── 字面量 true/false（testBoolean002/testBoolLiteralTrue/False）
│   ├── prototype toString/valueOf（0003/0004）
│   └── 逻辑运算 not/and/or（testBoolNot/And/Or 0007~）
├── 边界值测试
│   └── ❌ 无极值边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 逻辑运算组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Boolean.test.ets`（14：`testBooleanConstructor/Boolean/prototypetoString/PrototypeValueOf/BoolLiteralTrue/False/Not/And/...`）。
- **测了哪些**：Boolean 构造/字面量/逻辑运算的并发应力；不测类型错误码（见 §7.2）。

---

## 1.7 Error（内置）

```
Error
├── 入参范围覆盖
│   └── Error 构造/子类（TypeError/RangeError/SyntaxError/ReferenceError/URIError 等）
├── 边界值测试
│   └── ❌ 无极值边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 message/stack 未显式断言
├── 组合场景
│   └── 构造 + 抛出 + 捕获链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Error.test.ets`（8）。
- **测了哪些**：Error 子类构造的并发应力；不测 Error cause 链、类型错误码（见 §7.2）。

---

## 1.8 Intl（内置）

```
Intl
├── 入参范围覆盖
│   ├── Collator（构造/compare/resolvedOptions）
│   ├── DateTimeFormat（构造/format/formatToParts/resolvedOptions）
│   ├── NumberFormat（构造/format/formatToParts/resolvedOptions）
│   ├── PluralRules（构造/select）
│   └── RelativeTimeFormat（构造/format/formatToParts）
├── 边界值测试
│   └── ❌ 无极值/不支持 locale 回退边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── locale + options 组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Intl.test.ets`（16）。
- **测了哪些**：Intl Collator/DateTimeFormat/NumberFormat/PluralRules/RelativeTimeFormat 各 API 点的并发应力；不测 Intl 不支持 locale 回退、类型错误码（见 §7.2）。

---

## 1.9 Number（内置）

```
Number
├── 入参范围覆盖
│   ├── constructor（builtinsNumberConstructorTest0200）
│   ├── Number.isFinite/isInteger/isNaN/isSafeInteger（0100~0400）
│   ├── Number.parseFloat/parseInt（0600）
│   └── 属性 MAX_SAFE_INTEGER/MIN_VALUE 等（0700）+ prototype（0800）
├── 边界值测试
│   └── ❌ 无极值/越界精度边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 构造 + 静态方法组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsNumberConstructorTest.test.ets`（8：`builtinsNumberConstructorTest0200/IsFinite/IsInteger/IsNaN/IsSafeInteger/ParseTest/PropertyTest/PrototypeTest`）。
- **测了哪些**：Number 构造/静态方法/属性的并发应力；不测 Number 越界精度、类型错误码（见 §7.2）。

---

## 1.10 BigInt.asIntN / BigInt.asUintN（内置）

```
BigInt.asIntN / asUintN
├── 入参范围覆盖
│   ├── asIntN（BuiltinsAsIntNTest 2600）
│   ├── asUintN（0100）
│   └── BigInt 字面量（0300）+ 运算 div/add/sub/mod/pow（0400~0800）
├── 边界值测试
│   └── ❌ 无 64-bit 回绕边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回 BigInt 未显式断言
├── 组合场景
│   └── asIntN + 运算组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsAsIntNTest.test.ets`（10：`BuiltinsAsIntNTest2600/BuiltinsAsUintNTest0100/BuiltinsBigIntLiteralTest0100/testBigIntDiv/Add/Sub/Mod/Pow`）。
- **测了哪些**：asIntN/asUintN + BigInt 运算的并发应力；不测 64-bit 回绕边界、类型错误码（见 §7.2）。

---

## 1.11 char 字面量（语法）

```
char 字面量
├── 入参范围覆盖
│   ├── 单字符（testCharSingle 0100）
│   ├── 字符数组（testCharArray 0200）
│   ├── 对象/嵌套数组/三元/逻辑/Set/Map 中使用（0300~0800）
│   └── 各语法上下文中 char 字面量
├── 边界值测试
│   └── ❌ 无边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── char 在各语法结构中组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsCharLiteralTest.test.ets`（10：`testCharSingle/CharInObj/CharNestedArray/CharTernary/CharLogicAnd/CharSet/CharMap`）。
- **测了哪些**：char 字面量在各语法上下文的并发应力；不测错误码（见 §7.2）。

---

## 1.12 float 字面量（语法）

```
float 字面量
├── 入参范围覆盖
│   ├── float literal（testFloatLiteral 0100）
│   ├── parseFloat（0200）/ 科学计数法（0300）
│   ├── 下划线分隔（0400）/ 数组求和（0500）
│   └── 加法（0600）/ floor（0700）/ 复利计算（0800）
├── 边界值测试
│   └── ❌ 无极值/精度边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── float 字面量在运算中组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsFloatLiteralTest.test.ets`（8：`testFloatLiteral/ParseFloat/Scientific/Underscore/ArraySum/Add/Floor/CompoundInterest`）。
- **测了哪些**：float 字面量 + parseFloat + 科学计数/下划线/运算的并发应力；不测精度边界、错误码（见 §7.2）。

---

## 1.13 multiline string 字面量（语法）

```
multiline string 字面量
├── 入参范围覆盖
│   └── 多行字符串字面量（BuiltinsMultilineStringLiteralTest 0100/1600）
├── 边界值测试
│   └── ❌ 无超长/嵌套边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 多行串在表达式中组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsMultilineStringLiteralTest.test.ets`（2：`BuiltinsMultilineStringLiteralTest0100/1600`）。
- **测了哪些**：多行串字面量的并发应力；不测超长/嵌套边界、错误码（见 §7.2）。

---

## 1.14 null 字面量（语法）

```
null 字面量
├── 入参范围覆盖
│   └── null 字面量在表达式中使用（BuiltinsNullLiteralTest0900）
├── 边界值测试
│   └── ❌ 无边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── null 在判空/默认值组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsNullLiteralTest.test.ets`（1：`BuiltinsNullLiteralTest0900`）。
- **测了哪些**：null 字面量的并发应力；不测错误码（见 §7.2）。

---

## 1.15 泛型（ArkTS 语法）

```
泛型
├── 入参范围覆盖
│   ├── 泛型类（testGenericClass 0100）
│   ├── 泛型接口（0200）/ 多泛型（0300）
│   ├── 泛型约束（0400）/ 默认类（0500）
│   └── format/restraint（0600/0700）
├── 边界值测试
│   └── ❌ 无边界
├── 异常与非法输入
│   └── ❌ 未断言约束违反错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 泛型类/接口/约束组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsGenericsActTest.test.ets`（7：`testGenericClass/Interface/MultiGeneric/GenericConstraint/GenericDefaultClass/builtinsGenericsFormatTest/RestraintTest`）。
- **测了哪些**：泛型类/接口/约束/默认/多泛型的并发应力；不测约束违反错误码（见 §7.2）。

---

## 1.16 utility 类型（Partial/Readonly/Record/Proxy/Private）

```
utility 类型
├── 入参范围覆盖
│   ├── Partial（BuiltinsPartialUtilityTypeTest0100）
│   ├── Proxy（builtinsProxyTest0100）
│   ├── PrivateFields（0100）
│   ├── Readonly（BuiltinsReadonlyUtilityTypeTest0100）
│   └── Record（BuiltinsRecordUtilityTypeTest0100）
├── 边界值测试
│   └── ❌ 无边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── 各 utility 类型组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`BuiltinsPartialUtilityType.test.ets`（5：`BuiltinsPartialUtilityTypeTest0100/builtinsProxyTest0100/BuiltinsPrivateFieldsUtilityTypeTest0100/BuiltinsReadonlyUtilityTypeTest0100/BuiltinsRecordUtilityTypeTest0100`）。
- **测了哪些**：Partial/Proxy/PrivateFields/Readonly/Record 各 utility 类型的并发应力；不测 utility 类型边界、错误码（见 §7.2）。

---

# 2. 稳定性
- **用例位置**：无（所有用例仅 `concurrentNum` 次瞬时执行）。
- **测了哪些**：❌ 未覆盖。无大容量、无循环创建销毁、无长时运行压测；所有用例仅 `concurrentNum` 次瞬时执行（见 §7.4 #1）。

# 3. 性能
- **用例位置**：无（仅断言任务数）。
- **测了哪些**：❌ 未覆盖。无计时、无吞吐基准、无延迟统计；仅断言 `result.length === concurrentNum`（见 §7.4 #1）。

# 4. 并发安全
- **用例位置**：全套件 437 用例均以 `taskpool.TaskGroup + execute` 为并发载体（核心形态）。
- **测了哪些**：🟡 部分覆盖（核心形态但深度不足）。builtin 在并发执行下不崩溃；✅ 任务数回传正确（`result.length === concurrentNum`）；❌ 未校验跨线程数据可见性/Sendable 跨线程引用传递语义/并发错误码/并发量边界（1/极大/0 任务）（见 §7.3）。

# 5. 兼容性与继承
- **用例位置**：无。
- **测了哪些**：❌ 基本未覆盖。无 String/TypedArray/DataView 子类化；跨线程引用传递由 taskpool 序列化间接覆盖（无显式断言）。

# 6. 资料与文档符合性
- **用例位置**：`grep` 确认 `apis-arkts/` 仅 `@arkts.collections.d.ets` 声明 `ArrayBuffer` + 具体 typed-array 子类（无 String/TypedArray 原型/DataView 独立 `.md`）；`@tc.desc` 普遍为 "Test"（无信息量）。
- **测了哪些**：⚠️ 文档缺口显著：`String`/`TypedArray`(原型方法)/`DataView` 无独立 SDK `.md`；`@tc.desc` 普遍为 "Test"（无信息量，可追溯性差，见 §7.4 #2）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| String 内置 | ❌(固定串) | ❌(无边界) | ❌(catch assertFail) | ❌(仅 length==N) | ✅(TaskGroup) | ✅(concurrentNum) | ✅(taskpool) |
| TypedArray 内置 | ❌(固定数组) | ❌(无边界) | ❌(catch assertFail) | ❌(仅 length==N) | ✅(TaskGroup) | ✅ | ✅(taskpool) |
| DataView 内置 | ❌(固定 buffer) | ❌(无对齐/越界) | ❌(catch assertFail) | ❌(仅 length==N) | ✅(TaskGroup) | ✅ | ✅(taskpool) |
| taskpool 运行时 | ✅(主路径) | 🟡(concurrentNum) | ❌(无错误码) | ✅(length==N) | ✅(TaskGroup+execute) | ✅ | ✅(核心形态) |
| JS 内置(BigInt/Intl/...) | 🟡(主路径) | ❌(无极值/溢出) | ❌(无类型错误码) | 🟡(未显式断言) | ✅(类型/泛型组合) | ✅ | ✅(taskpool) |

## 7.2 逐接口遗漏确认（对照 `@arkts.collections.d.ets` / 语言规范）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。本套件为"并发应力模板"套件，功能正确性由 `testability/pages/*` 私有库承担。

| # | 接口 | 契约要点 | 核查结论 |
|---|------|--------------------------|----------|
| 1 | String 原型方法（charAt/concat/.../localeCompare） | 全局内置 String 原型 | 🟡 33 原型方法并发应力。❌ **入参范围**（固定串，未遍历普通/空串/emoji/代理对/多码点）、❌ **边界值**（空串/单字符/超长串/0 长度）、❌ **异常码**（RegExp 非法/replace 回调类型→401 未断言，catch assertFail）、❌ **返回值**（charAt/slice/replace 返回串未校验）。缺口由 testability 私有库承担（见 §7.4 #1）。 |
| 2 | TypedArray 原型方法 + 子类构造器 | @arkts.collections.d.ets 声明具体子类 | 🟡 25 原型方法 + 各子类构造器并发应力。❌ **set 越界 RangeError**、❌ **sort 比较器异常**、❌ **subarray 视图共享/独立性**、❌ **filter/map/find 返回数组内容**。 |
| 3 | DataView（byteLength/byteOffset + get*/set*） | 依赖 ArrayBuffer，无 .d.ets | 🟡 ~21 get/set 方法并发应力。❌ **offset 越界 RangeError**、❌ **littleEndian=true/false 字节序正确性**、❌ **对齐边界**。 |
| 4 | taskpool 运行时（TaskGroup/addTask/execute） | @kit.ArkTS | ✅ 主路径（TaskGroup(name)/addTask(fn)/execute(group)）。❌ **addTask 重载/优先级/取消**、❌ **任务取消/超时/序列化失败错误码**、❌ **worker 数量边界**、❌ **跨线程共享对象可见性**、❌ **1/极大/0 任务边界**。 |
| 5 | JS 内置（BigInt/Boolean/Error/Intl/Number/字面量/AsIntN/泛型/Partial/Global） | ES 内置 + ArkTS 类型工具 | 🟡 各内置主路径并发应力。❌ **BigInt 溢出**、❌ **Number 越界精度**、❌ **Intl 不支持 locale 回退**、❌ **Error cause 链**、❌ **utility 类型边界**。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **"并发不崩"覆盖深度不足**：全套件 437 用例均以 `taskpool.TaskGroup + execute` 为载体，仅验证"方法在 N 次并发下不崩溃且回传任务数"。❌ 未校验跨线程数据可见性、Sendable 跨线程引用传递语义、并发错误码、并发量边界（1/极大/0 任务）。这是全套件的结构性缺口（功能正确性由 testability 私有库承担，但并发深度断言缺失）。
2. **taskpool 任务取消/超时/优先级**：taskpool 运行时仅覆盖主路径（TaskGroup/addTask/execute），任务取消/超时/优先级/序列化失败错误码未测。❌ 组合缺口（SUP_BUILTINS_TASKPOOL_CANCEL_TIMEOUT_001）。
3. **TypedArray set 越界 + subarray 视图独立性**：set 越界 RangeError、subarray 视图共享/独立性未断言（仅"不崩"）。❌ 组合缺口（SUP_BUILTINS_TYPEDARRAY_SET_SUBARRAY_001）。
4. **DataView 字节序**：littleEndian=true/false 的字节序正确性未断言（仅"不崩"）。❌ 组合缺口（SUP_BUILTINS_DATAVIEW_ENDIAN_001）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **"并发不崩"模板定位**：本套件为"并发应力模板"套件，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担，不在本测试目录内。建议资料侧在套件说明注明该定位，避免误解为功能覆盖套件；测试侧保留并发应力定位，功能缺口由 testability 私有库覆盖。
2. **String/TypedArray/DataView 无独立 `.md`（⚠️ 文档缺口）**：`@arkts.collections.d.ets` 仅声明 `ArrayBuffer` + 具体 typed-array 子类，无 String/TypedArray 原型/DataView 独立 `.md`。建议资料侧补 String/TypedArray 原型/DataView `.md`（或注明"全局/ES 内置无独立 SDK 声明"）。
3. **@tc.desc 占位 "Test"（⚠️）**：`@tc.desc` 普遍为 "Test"（无信息量，可追溯性差）。建议补语义化 desc（标注方法名/场景），与 100 例深套件（有语义编号）对齐。
4. **taskpool 错误码声明**：`@kit.ArkTS` taskpool 声明，但任务取消/超时/序列化失败错误码未声明且未测。建议资料侧补 `@throws` 说明（若契约），测试侧补错误码用例（SUP_BUILTINS_TASKPOOL_CANCEL_TIMEOUT_001）。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 2 | SUP_BUILTINS_TASKPOOL_CANCEL_TIMEOUT_001、SUP_BUILTINS_TYPEDARRAY_SET_SUBARRAY_001 | taskpool 取消/超时错误码 / TypedArray set 越界+subarray 独立性；契约符合性硬缺口。 |
| **P2** | 2 | SUP_BUILTINS_DATAVIEW_ENDIAN_001、@tc.desc 占位补语义化 | DataView 字节序 / desc 信息密度提升；非阻断但提升套件质量。 |
| — | — | String/TypedArray/DataView/JS 内置 功能正确性 | 结构性缺口，由 testability 私有库承担，本套件不补。 |
| **合计** | **3 新增 + 1 改造** | | P1=2 / P2=1 新增 + 1 改造。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 模板用固定入参，未遍历各方法的入参空间（串内容/数组元素/buffer offset/BigInt 值/Intl locale 等）；仅"全方法点"覆盖 | String 33 方法固定串、TypedArray 25 方法固定数组、ConcurrentSecond typed-array ctor |
| ②边界值测试 | 无空串/单字符/超长串/0 长度、无 length=0/1/超长/字节对齐、无 offset 对齐/越界、无极值/溢出 | （本套件无边界用例，结构性缺口） |
| ③异常与非法输入 | catch 仅 assertFail，未断言 401（RegExp 非法/replace 回调）、set 越界 RangeError、get/set 越界 RangeError、类型错误码、taskpool 错误码 | （本套件无异常码断言，结构性缺口） |
| ④返回值与类型验证 | 仅断言 `result.length === concurrentNum`，未校验 charAt/slice/replace 返回串、filter/map/find 返回数组、getInt*/getFloat* 返回值 | String/TypedArray/DataView 仅 length==N |
| ⑤组合场景 | TaskGroup + addTask + execute 组合、类型组合/泛型组合、typed-array ctor + 各 builtin 并发 | ConcurrentTest/Second/Third/Fourth/Global 266 用例、BuiltinsGenericsAct 泛型组合 |
| ⑥重复调用幂等性 | concurrentNum 次重复 addTask 同一方法（模板固有） | 全套件 concurrentNum 次重复 |
| ⑦并发跨线程 | taskpool.TaskGroup + execute 并发执行（核心形态），worker 池调度 + 跨线程结果回传 | 全套件 437 用例核心形态、Concurrent* 266 用例显式 taskpool 并发 |
