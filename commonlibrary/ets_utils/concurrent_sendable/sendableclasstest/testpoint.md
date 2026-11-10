# sendableclasstest 测试点报告（按特性域·摘要版）

> **数据来源**：`concurrent_sendable/sendableclasstest/entry/src/ohosTest/ets/test/` 下递归解析得 **1519** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐；已排除 `List.test.ets` 聚合 re-export 垫片，0 用例）。
> **套件定位**：@Sendable 类定义/继承/instanceof/@Concurrent/锁/容器互操作（主覆盖域 1/3/5/6）
> **特性域**：本套件覆盖 @Sendable 类定义形态、static/readonly 字段、函数 set 访问器、继承(单/二级/triple)、ISendable/instanceof、Ecma 兼容类定义、@Concurrent 函数执行、@Sendable/'use sendable' 类 Object 方法(Object.prototype/静态方法/call/apply/bind)；本报告自包含，不引用外部文件。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（套件内顶层结构）

```
sendableclasstest
├── 1. 接口/特性域测试 —— §1，每域含用例位置
│   ├── 1.1 @Sendable 类定义形态（default，13 形态×26 类型矩阵）
│   ├── 1.2 @Sendable static/readonly 字段
│   ├── 1.3 @Sendable 函数 set 访问器（get/set/static/async）
│   ├── 1.4 @Sendable 继承（单/private/default、二级）
│   ├── 1.5 @Sendable triple 继承链（跨 TaskPool/Worker）
│   ├── 1.6 ISendable / isSendable / instanceof
│   ├── 1.7 @Sendable Ecma 兼容类定义
│   ├── 1.8 @Concurrent 函数执行
│   └── 1.9 @Sendable/'use sendable' 类 Object 方法（Object.prototype/静态方法/call/apply/bind）
├── 2. 稳定性（GC/生命周期/批量创建销毁）
├── 3. 性能（并发 stress / IR 优化）
├── 4. 并发安全（TaskPool/Worker/锁/CV）
├── 5. 兼容性与继承（extends/implements/composition）
└── 6. 资料与文档符合性（@Sendable/ISendable/错误码）
```

> 测试逻辑分类口径（7 类）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附》。

---

## 0.1 文件清单（12 个文件 / 1519 用例）

| # | 文件 | 用例数 | 接口覆盖（本套件） |
|---|------|:---:|------|
| 1 | SendableClass/SendableClass.test.ets | 338 | @Sendable 类定义形态×26 类型矩阵(338) |
| 2 | SendableClass_static/SendableClass_static.test.ets | 338 | @Sendable static 字段(338) |
| 3 | SendableClass_static_readonly/SendableClass_static_readonly.test.ets | 156 | @Sendable static+readonly 字段(156) |
| 4 | SendableClassFuncSet/SendableClassFuncSet.test.ets | 208 | @Sendable 函数 set 访问器(208) |
| 5 | SendableClassInherit/SendableClassInherit.test.ets | 239 | @Sendable 继承(private/default/二级)(239) |
| 6 | SendableClassEcmaTest.test.ets | 61 | @Sendable Ecma 兼容类定义(61) |
| 7 | ISendableImplTest.test.ets | 48 | ISendable/isSendable/instanceof(48) |
| 8 | UseSendableTest.test.ets | 28 | @Concurrent 函数执行(28) |
| 9 | SendableBuiltinsUseSendableObjectMethodsTest.test.ets | 20 | 'use sendable' 类 Object 方法(hasOwnProperty/toString/valueOf/keys/values/entries/assign/freeze/instanceof)(20) |
| 10 | SendableObjectMethodsTest.test.ets | 51 | @Sendable 类 Object 方法(hasOwnProperty/toString/Object 静态方法/call/apply/bind/stress)(51) |
| 11 | tripleInheritanceTaskPool.test.ets | 16 | triple 继承跨 TaskPool(16) |
| 12 | tripleInheritanceWorker.test.ets | 16 | triple 继承跨 Worker(16) |
| | **合计** | **1519** | 12 文件 |

# 1. 接口/特性域测试

> 各特性域按文件分组标注用例位置；编号段取自解析结果。本套件无 assertThrow/10200011 异常用例（异常码专用覆盖在 sendable_mix_test/returnCovered），故 §1 各域依 RULE 3 省略「异常与非法输入」分支。


## 1.1 @Sendable 类定义形态（default，13 形态 × 26 类型属性矩阵）

```
@Sendable 类定义形态（default）
├── 入参范围覆盖
│   ├── 13 种类定义形态：default class / 函数表达式(func) / 类内函数(funcIn) / 无参函数(nonParameterFunc) / 有参函数(parameterFunc) / 非函数(nonFunc) / 箭头函数(arrow) / 箭头 new(arrowNew) / 外部箭头(outArrow) / 表达式外部(expressionOut) / 表达式箭头外部(expressionOutArrow)（每种 26 例）
│   ├── 全类型属性矩阵 26 类型：number/string/boolean/BigInt/undefined/null/class/function/enum/Array/Map/Set/TypedArray 实例与静态赋值
│   └── 构造后属性默认值读取与修改、类方法（number/string 参数、返回 number/string/void）
├── 边界值测试
│   ├── 空类、单属性类、深嵌套 @Sendable（类内含 Sendable 属性）
│   └── 26 类型属性边界值（BigInt/undefined/null/enum/function 等极端类型赋值）
├── 返回值与类型验证
│   ├── instanceof collections.* / typeof === "object"
│   └── 属性读取类型、方法返回值类型断言
├── 组合场景
│   ├── 属性修改 + 方法读取联动、构造后方法调用返回值
│   ├── AsyncLock 作为 @Sendable 类属性（41 处）
│   └── collections.Array/Map/Set 作为类属性（4 处）
└── 重复调用/幂等性
    └── 相同形态多次构造属性一致、方法多次返回一致
```

- **用例位置（sendableclasstest）**：`SendableClass/SendableClass.test.ets`（338 例）。
- **测了哪些**：13 类定义形态 × 26 全类型属性矩阵 + instanceof/typeof + AsyncLock/collections 作为属性 + 构造/方法/重复。共 338。


## 1.2 @Sendable static/readonly 字段（13 形态 static + static+readonly 版）

```
@Sendable static/readonly 字段
├── 入参范围覆盖
│   ├── static 字段 13 形态矩阵（同 §1.1 形态，static 版：default/func/arrow/expression 等，各 26 例）
│   ├── static+readonly 字段形态矩阵（NonParameterFunc/NonFunc/ExpressionOutArrow/ExpressionArrowOut/ArrowNew 等，各 26 例）
│   └── static 字段全类型属性矩阵（number/string/boolean/BigInt/class/enum/Array/Map/Set/TypedArray 等）
├── 边界值测试
│   ├── 空 static、单 static 字段、全类型 static 边界
│   └── readonly 赋值约束（初始化后不可变）
├── 返回值与类型验证
│   ├── static 字段读取类型正确、instanceof collections.*
│   └── readonly 字段多次读取恒定
├── 组合场景
│   ├── static + 实例字段混合、AsyncLock 作为 static 字段（41+6 处）
│   └── collections.Array/Map/Set 作为 static 字段（4 处）
└── 重复调用/幂等性
    └── static 字段多次访问恒定、多次构造 static 值一致
```

- **用例位置（sendableclasstest）**：`SendableClass_static/SendableClass_static.test.ets`（338 例） + `SendableClass_static_readonly/SendableClass_static_readonly.test.ets`（156 例）。
- **测了哪些**：static 字段 13 形态矩阵 + static+readonly 约束 + 全类型 static + AsyncLock/collections 作为 static 字段 + instanceof。共 494。


## 1.3 @Sendable 函数 set 访问器（constructor / get / set / static get/set / async set）

```
@Sendable 函数 set 访问器
├── 入参范围覆盖
│   ├── constructor 访问器、get/set 访问器对（实例）
│   ├── static get / static set / static funcSet 访问器
│   ├── async set（异步 set 访问器）与 GetFuncSet/AsyncFuncSet 形态
│   └── 全类型属性经 set 访问器写入、get 读取（含 collections.Array/Map/Set 54 处）
├── 边界值测试
│   ├── 空 get/set、单字段访问器、async set 边界
│   └── set 写入极端类型（BigInt/undefined/null/enum/class）
├── 返回值与类型验证
│   ├── get 返回值类型、set 后 get 命中（instanceof 221 处）
│   └── static get 返回与实例 get 一致性
├── 组合场景
│   ├── constructor + get/set 联动、async set + 同步 get
│   ├── AsyncLock 作为访问器保护字段（27 处）
│   └── collections 容器经 set/get 存取（54 处）
└── 重复调用/幂等性
    └── 同字段多次 set 保留最后、多次 get 一致
```

- **用例位置（sendableclasstest）**：`SendableClassFuncSet/SendableClassFuncSet.test.ets`（208 例）。
- **测了哪些**：constructor/get/set/static get/set/async set 访问器 + 全类型 set/get + instanceof + AsyncLock/collections 经访问器存取。共 208。


## 1.4 @Sendable 继承（private/default 单继承、二级继承）

```
@Sendable 继承
├── 入参范围覆盖
│   ├── private 继承（testSendablePrivateInheritClass）、default 继承（testSendableDefaultInheritClass 多序号）
│   ├── 二级继承链、继承链方法覆写/自定义
│   └── 全类型属性矩阵经继承传递（number/string/boolean/BigInt/class/enum/Array/Map/Set/TypedArray）
├── 边界值测试
│   ├── 单继承、二级继承、深继承链边界
│   └── 父类 private/default 成员可见性边界
├── 返回值与类型验证
│   ├── 子类 instanceof collections.* / instanceof 父类（239 处）
│   └── 继承属性读取类型、覆写方法返回值
├── 组合场景
│   ├── 继承 + 属性修改/方法读取联动
│   ├── AsyncLock 作为继承类字段（22 处）
│   └── collections.Array/Map/Set 作为继承字段（10 处）
└── 重复调用/幂等性
    └── 同继承结构多次构造属性一致、覆写方法多次返回一致
```

- **用例位置（sendableclasstest）**：`SendableClassInherit/SendableClassInherit.test.ets`（239 例）。
- **测了哪些**：private/default 单继承 + 二级继承 + 方法覆写 + 全类型继承属性 + instanceof + AsyncLock/collections 作为继承字段。共 239。


## 1.5 @Sendable triple 继承链（跨 TaskPool/Worker）

```
@Sendable triple 继承链
├── 入参范围覆盖
│   ├── triple 继承链（四级属性类 FourAttributeClass）构造与属性读写
│   ├── triple 继承链经 TaskPool 跨线程传递（testSendableTripleInheritanceTaskPool0001~）
│   └── triple 继承链经 Worker 跨线程传递（testSendableTripleInheritanceTaskPool/Worker）
├── 边界值测试
│   ├── 单实例、多实例、四级属性边界
│   └── TaskPool 单任务 vs Worker 长生命周期边界
├── 返回值与类型验证
│   ├── triple 链各层属性读取类型、instanceof 各级父类
│   └── 跨线程返回值与主线程一致
├── 组合场景
│   ├── triple 链 + TaskPool 并发读写
│   └── triple 链 + Worker 持有引用修改
└── 并发跨线程
    ├── TaskPool 内 triple 继承实例读写可见性（16 例）
    └── Worker 内 triple 继承实例读写可见性（16 例）
```

- **用例位置（sendableclasstest）**：`tripleInheritanceTaskPool.test.ets`（16 例） + `tripleInheritanceWorker.test.ets`（16 例）。
- **测了哪些**：triple 继承链四级属性 + 跨 TaskPool/Worker 传递与读写可见性 + instanceof 各级父类。共 32。


## 1.6 ISendable 实现 / isSendable 判定 / instanceof

```
ISendable / isSendable / instanceof
├── 入参范围覆盖
│   ├── ISendable 接口实现类构造与字段读写
│   ├── isSendable(obj) 判定 true/false、ISendable 标记验证
│   └── collections.Array/Map/Set 存 ISendable 对象存取（16 处）
├── 边界值测试
│   ├── 空 ISendable、单字段、多 ISendable 对象
│   └── 非 Sendable 对象 isSendable 判定 false
├── 返回值与类型验证
│   ├── isSendable 返回 boolean、ISendable 字段读取类型
│   └── AsyncLock implements ISendable 验证（15 处）
├── 组合场景
│   ├── ISendable 对象作为容器元素 + 跨线程取出
│   └── AsyncLock(ISendable) + 容器互操作
└── 并发跨线程
    └── ISendable 对象经 TaskPool 跨线程传递与读写（20 处）
```

- **用例位置（sendableclasstest）**：`ISendableImplTest.test.ets`（48 例）。
- **测了哪些**：ISendable 实现 + isSendable 判定 + AsyncLock implements ISendable + 容器存 ISendable + 跨 TaskPool 传递。共 48。


## 1.7 @Sendable Ecma 兼容类定义（Point/User/Employee/Manager/Order/Profile 等具体类）

```
@Sendable Ecma 兼容类定义
├── 入参范围覆盖
│   ├── 简单类 SimpleSendable、Point/User/Employee/Manager/Order 业务类构造与字段
│   ├── ctor 类（CtorPoint/CtorCombined）、field 类（FieldProfile/FieldBase）
│   └── entity 抽象类（AllEntityAbstractClass）、basic 类（BasicPoint/BasicUser）
├── 边界值测试
│   ├── 空类、单字段类、多字段业务类
│   └── 抽象类派生边界、ctor 组合边界
├── 返回值与类型验证
│   ├── 字段读取类型、方法返回值、instanceof 对应类
│   └── ctor 构造后字段初值
├── 组合场景
│   ├── Employee extends Person、Manager extends Employee 继承链
│   └── 字段修改 + 方法读取联动
└── 重复调用/幂等性
    └── 同类多次构造字段一致、方法多次返回一致
```

- **用例位置（sendableclasstest）**：`SendableClassEcmaTest.test.ets`（61 例）。
- **测了哪些**：Ecma 兼容 @Sendable 具体业务类（Point/User/Employee/Manager/Order/Profile/abstract）构造/字段/方法/继承 + instanceof。共 61。


## 1.8 @Concurrent 函数执行

```
@Concurrent 函数执行（UseSendable）
├── 入参范围覆盖
│   ├── 跨语言定义执行：.ets/.ts/.js 文件定义的 sendable 函数经 TaskPool 执行
│   ├── 参数类型：number/string/boolean 与返回值类型校验
│   ├── 容器参数：collections.Array(原地改)/Map(读写 entries)/Set(add/delete)/BitVector
│   └── ArrayBuffer 参数（返回 byteLength）、@Sendable 类参数（读/改/嵌套/round-trip）
├── 边界值测试
│   ├── 空参函数、单参、多参
│   └── 跨语言(.ets/.ts/.js)定义边界
├── 返回值与类型验证
│   ├── 返回 number/string 与入参匹配
│   └── 容器/Sendable 参数 round-trip 返回值
├── 组合场景
│   ├── 容器参数 in-place 修改后主线程可见
│   └── @Sendable 类参数 round-trip（读/改/嵌套）
├── 重复调用/幂等性
│   └── 同函数多次 TaskPool 执行结果一致
└── 并发跨线程
    └── 全部经 TaskPool 跨线程执行、容器/Sendable 引用传递（28 例）
```

- **用例位置（sendableclasstest）**：`UseSendableTest.test.ets`（28 例）。
- **测了哪些**：@Concurrent 函数跨 .ets/.ts/.js 定义 + number/string/boolean/容器/Sendable 参数与返回 + TaskPool 执行 + in-place 修改可见。共 28。


## 1.9 @Sendable/'use sendable' 类 Object 方法（Object.prototype / Object 静态方法 / Function.prototype call/apply/bind）

```
@Sendable/'use sendable' 类 Object 方法
├── 入参范围覆盖
│   ├── Object.prototype 方法：hasOwnProperty（own/inherited/nonexistent）、toString（"[object Object]"）、toLocaleString（非空串）、valueOf（返回原对象）、propertyIsEnumerable
│   ├── Object 静态方法：keys/values/entries/getOwnPropertyNames/getOwnPropertyDescriptors/getOwnPropertySymbols/getPrototypeOf/is/isFrozen/isSealed/assign/freeze/create/defineProperty/setPrototypeOf
│   ├── Function.prototype 方法：call/apply/bind（@Concurrent 函数与 @Sendable 类方法）、bound 函数 length/name/prototype
│   └── 'use sendable' 类（UseSendablePoint/Rich/Empty/WithMethod）Object 方法全覆盖
├── 边界值测试
│   ├── 空类 Object 方法（keys=0、hasOwnProperty=false、toString=[object Object]）
│   ├── nullish 入参（undefined/null → keys/entries/getOwnPropertyNames/getOwnPropertyDescriptors 抛错；isFrozen/isSealed 返回 true）
│   ├── 原始值入参（number/boolean → keys/getOwnPropertyNames 返回空数组）
│   ├── 属性名边界（空串 '' / unicode emoji '🔑emoji' / 256 字符长名）
│   └── bound 函数 length 递减（3→2→1）、name 含 "bound" 前缀
├── 异常与非法输入
│   ├── hasOwnProperty.call(null/undefined) 抛错
│   ├── Object.setPrototypeOf(null/undefined/primitive/bool/string) 抛错
│   ├── Object.create(non-object proto / @Sendable proto) 抛错
│   ├── Object.assign(@Sendable target) 抛错（不可扩展）
│   ├── bind/call/apply on non-callable @Sendable property 抛错
│   ├── apply(non-object argArray) 抛错
│   └── bound 函数不可跨线程传递（taskpool.execute 抛错）
├── 返回值与类型验证
│   ├── hasOwnProperty boolean、toString string、valueOf 原对象引用
│   ├── Object.keys/values/entries 数组长度与内容、getOwnPropertyDescriptors 含 own 字段
│   ├── bound 函数 length（剩余未绑定参数数）、name（含 "bound" 前缀）
│   └── instanceof true/false、typeof === "object"、constructor.name
├── 组合场景
│   ├── call rebinds this 到另一 @Sendable 实例（getX.call(otherInstance)）
│   ├── Object.assign 多字段/数值键/符号键拷贝
│   └── bind(this + prefix args) → bound(partial) 结果
├── 重复调用/幂等性
│   └── 多次 call/apply 同结果
└── 并发跨线程
    ├── 4 Worker × 1000 轮 stress（hasOwnProperty/toString/valueOf/propertyIsEnumerable/keys/getPrototypeOf/is/getOwnPropertyNames/instanceof/typeof/constructor/JSON.stringify）
    └── 4 Worker 并发读共享 @Sendable 字段一致性
```

- **用例位置（sendableclasstest）**：`SendableBuiltinsUseSendableObjectMethodsTest.test.ets`（20 例） + `SendableObjectMethodsTest.test.ets`（51 例）。
- **测了哪些**：'use sendable' 类与 @Sendable 类的 Object.prototype 方法（hasOwnProperty/toString/toLocaleString/valueOf/propertyIsEnumerable）+ Object 静态方法（keys/values/entries/getOwnPropertyNames/getOwnPropertyDescriptors/getOwnPropertySymbols/getPrototypeOf/is/isFrozen/isSealed/assign/freeze/create/defineProperty/setPrototypeOf）+ Function.prototype（call/apply/bind 含 bound length/name/prototype）+ nullish/原始值/空类/属性名边界 + 4 Worker × 1000 轮 stress。共 71。

# 2. 稳定性

- **用例位置（sendableclasstest）**：`SendableClass/SendableClass.test.ets`、`SendableClass_static/*`、`tripleInheritance*` 等
- **测了哪些**：Sendable 对象批量创建销毁/GC 后状态完整性/跨线程引用计数稳定性（本套件范围内）。

# 3. 性能

- **用例位置（sendableclasstest）**：`SendableClass_static/*` 全类型属性矩阵、`UseSendableTest`
- **测了哪些**：并发 stress（500 tasks）/ IR 优化（IC cache 建立/更新、fixed property IR）大规模吞吐（本套件范围内）；**未见显式时延阈值**。

# 4. 并发安全

- **用例位置（sendableclasstest）**：`UseSendableTest`、`tripleInheritanceTaskPool/Worker`、`ISendableImplTest`、各文件 AsyncLock 段
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + AsyncLock/ConditionVariable 序列化 + 并发读写可见性/一致性（本套件范围内）。

# 5. 兼容性与继承

- **用例位置（sendableclasstest）**：`SendableClassInherit/SendableClassInherit.test.ets`、`tripleInheritance*`、`SendableClassEcmaTest.test.ets`
- **测了哪些**：@Sendable 类继承/private/default/二级/triple 跨线程 + Ecma 兼容继承链 + instanceof + ISendable 实现（本套件范围内）。

# 6. 资料与文档符合性

- **用例位置（sendableclasstest）**：`SendableClass/SendableClass.test.ets`、`SendableClassEcmaTest.test.ets`、`ISendableImplTest.test.ets`
- **测了哪些**：@Sendable/@Concurrent 装饰、ISendable/isSendable、错误码 10200011/10200012/10200201/401 文档符合（本套件范围内，异常码专用覆盖在 sendable_mix_test）；**未发现与 `.d.ets` 逐条断言的符合性用例**。

---
# 7. 覆盖度矩阵与缺口分析（本套件自包含）

## 7.1 特性域 × 测试逻辑分类 覆盖矩阵

> 图例：✅ 充足 / 🟡 部分 / ❌ 未覆盖或仅间接。本套件无 assertThrow 异常用例，③列整体 ❌（异常码专用覆盖在 sendable_mix_test/returnCovered）。

| 特性域 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| @Sendable 类定义形态 | ✅(13形态×26类型) | ✅(空/单/全类型) | ❌ | ✅(instanceof/返回类型) | ✅(AsyncLock/collections 属性) | ✅(多次构造一致) | ❌(同线程) |
| static/readonly 字段 | ✅(13形态static) | ✅(空/单/readonly) | ❌ | ✅(static 类型/instanceof) | ✅(static+实例/AsyncLock) | ✅(static 恒定) | ❌(同线程) |
| 函数 set 访问器 | ✅(get/set/static/async) | ✅(空/单/async) | ❌ | ✅(get 返回/instanceof) | ✅(constructor+get/set) | ✅(多次 set) | ❌(同线程) |
| 继承 | ✅(private/default/二级) | ✅(单/二级/深链) | ❌ | ✅(instanceof 父类) | ✅(覆写/AsyncLock/collections) | ✅(多次构造一致) | ❌(同线程) |
| triple 继承链 | ✅(四级属性) | ✅(单/多实例) | ❌ | ✅(各级 instanceof) | ✅(triple+TaskPool/Worker) | 🟡 | ✅(TaskPool/Worker) |
| ISendable/isSendable | ✅(ISendable/isSendable) | ✅(空/单/非Sendable) | ❌ | ✅(boolean/ISendable) | ✅(容器存ISendable) | 🟡 | ✅(TaskPool) |
| Ecma 兼容类定义 | ✅(Point/User/Manager…) | ✅(空/单/抽象) | ❌ | ✅(instanceof/ctor) | ✅(继承链/字段方法) | ✅(多次一致) | ❌(同线程) |
| @Concurrent 函数执行 | ✅(跨语言/参数返回) | ✅(空/单参) | ❌ | ✅(返回类型) | ✅(容器/Sendable 参数) | ✅(多次执行一致) | ✅(TaskPool) |
| @Sendable 类 Object 方法 | ✅(prototype/静态/call/apply/bind) | ✅(空类/nullish/原始值/属性名边界) | ✅(非callable/setPrototypeOf/create/assign 抛错) | ✅(boolean/string/数组/bound length+name) | ✅(call rebinds/assign 多字段) | ✅(多次 call/apply) | ✅(4 Worker stress) |

## 7.2 逐域遗漏确认（本套件范围内）

> ✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。对照本套件所测特性域逐条核查。

| # | 特性域 | 本套件核查结论 |
|---|------|----------------|
| 1 | @Sendable 类定义形态 | ✅ 13 形态×26 类型矩阵覆盖；⚠️ `.d.ets` 未声明 @throws 401 但非 Sendable 泛型报错路径未显式测。 |
| 2 | static/readonly 字段 | ✅ static+readonly 全形态覆盖；⚠️ readonly 赋值约束未显式断言“二次赋值报错”。 |
| 3 | 函数 set 访问器 | ✅ get/set/static/async 全覆盖；❌ async set 异常路径未测。 |
| 4 | 继承 | ✅ private/default/二级/triple 覆盖；❌ 继承约束违反（非 Sendable 父类）报错路径未测。 |
| 5 | triple 继承链 | ✅ 跨 TaskPool/Worker；🟡 无 AsyncLock 保护的并发写用例。 |
| 6 | ISendable/isSendable | ✅ isSendable/ISendable/容器存取/跨线程；⚠️ instanceof 在本文件 0 处（用 isSendable 替代），与 `.d.ets` instanceof 契约对齐建议。 |
| 7 | Ecma 兼容类定义 | ✅ 多业务类覆盖；❌ 抽象类实例化报错路径未测。 |
| 8 | @Concurrent 函数执行 | ✅ 跨语言/参数返回/容器/Sendable 参数；❌ @Concurrent 函数异常路径（throw/reject）未测；❌ 缺参→401 未测。 |
| 9 | @Sendable 类 Object 方法 | ✅ Object.prototype（hasOwnProperty/toString/toLocaleString/valueOf/propertyIsEnumerable）+ Object 静态（keys/values/entries/getOwnPropertyNames/getOwnPropertyDescriptors/getOwnPropertySymbols/getPrototypeOf/is/isFrozen/isSealed/assign/freeze/create/defineProperty/setPrototypeOf）+ Function.prototype（call/apply/bind 含 bound length/name/prototype）+ 'use sendable' 类全覆盖 + nullish/原始值/空类/属性名边界 + 4 Worker × 1000 轮 stress；✅ 充分。 |

## 7.3 接口组合遗漏（本套件范围内）

1. **继承×容器组合**：@Sendable 继承实例作为容器元素跨 TaskPool/Worker 传递——✅ 覆盖（tripleInheritance 文件）。
2. **static×容器组合**：static/readonly 字段持有 Array/Map/Set/TypedArray 全类型——✅ 覆盖。
3. **@Concurrent×容器组合**：sendable 函数以容器为参数 in-place 修改后主线程可见——✅ 覆盖。
4. **锁×容器组合**：AsyncLock 保护容器并发读写——🟡 间接（专用 stress 在 sendable_mix_test）。

## 7.4 文档与测试一致性建议（同步资料侧·本套件范围内）

1. **401 未声明（⚠️）**：@Sendable 装饰约束、@Concurrent 函数缺参/类型非法→401 产品行为，`.d.ets` 未声明；建议补 401 与增补测试。
2. **10200011/10200012 错误码**：容器 detached 10200011、constructor 直接调用 10200012 行为已测（在 sendable_mix_test）；建议 `.md` 错误码表保持一致。
3. **ISendable 接口**：AsyncLock implements ISendable 已测；建议 `.d.ets` ISendable 接口与测试对齐。
4. **@Sendable 继承约束**：继承链/triple 跨线程已测；建议 `.md` 明确继承语义与跨线程引用规则。

## 7.5 优先级建议（本套件范围内）

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.2 @Concurrent 函数异常路径（throw/reject）与缺参 401 补全 |
| P1 | 7.2 继承约束违反报错路径；readonly 二次赋值报错断言 |
| P2 | 7.4 文档 401/10200011/10200012 错误码表补注；ISendable 接口对齐 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对 @Sendable 类属性/方法/参数/返回值遍历合法类型空间 | 13 类定义形态 × 26 全类型属性矩阵、get/set/static/async 访问器、private/default 继承 |
| ②边界值测试 | 空/单元素/大规模/边界值（空类、单字段、二级/triple 继承链、非 Sendable 对象） | 空类、单属性类、triple 四级属性、非 Sendable isSendable=false |
| ③异常与非法输入 | 10200011(detached)、10200012(constructor 直接调用)、10200201(并发修改)、401(参数非法) | 本套件无专用异常用例（覆盖在 sendable_mix_test/returnCovered） |
| ④返回值与类型验证 | 方法返回 number/string/boolean、instanceof、引用相等、计数语义 | instanceof collections.*、isSendable boolean、get 返回值、各级父类 instanceof |
| ⑤组合场景 | 多对象串联（继承链字段方法联动、AsyncLock/collections 作为属性、容器存 ISendable、@Concurrent 容器参数 in-place） | 继承+方法覆写、AsyncLock 作为字段(41处)、collections 经 set/get 存取、@Concurrent 容器参数 |
| ⑥重复调用/幂等性 | 同操作多次稳定、多次构造属性一致、方法多次返回一致 | 相同形态多次构造、多次 set 保留最后、多次 TaskPool 执行一致 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock/CV 序列化、triple 继承跨线程、ISendable 跨线程 | triple 继承跨 TaskPool/Worker(32)、ISendable 跨 TaskPool(20)、@Concurrent TaskPool(28) |
