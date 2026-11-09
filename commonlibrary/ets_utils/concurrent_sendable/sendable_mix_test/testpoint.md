# sendable_mix_test 测试点报告（按特性域·摘要版）

> **数据来源**：`concurrent_sendable/sendable_mix_test/entry/src/ohosTest/ets/test/` 下递归解析得 **361** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐；已排除 `List.test.ets` 聚合 re-export 垩片，0 用例）。
> **套件定位**：Sendable + TaskPool/Worker/容器/锁混合（跨线程传递+可见性+容器互操作+错误场景）（主覆盖域 2/4/6/7）
> **特性域**：本套件覆盖 跨线程传递(TaskPool/Worker)、跨线程数据可见性/一致性、Sendable+容器互操作、错误场景；本报告自包含，不引用外部文件。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（套件内顶层结构）

```
sendable_mix_test
├── 1. 接口/特性域测试 —— §1，每域含用例位置
│   ├── 1.1 跨线程传递(TaskPool/Worker)
│   ├── 1.2 跨线程数据可见性/一致性
│   ├── 1.3 Sendable+容器互操作
│   ├── 1.4 错误场景
├── 2. 稳定性（GC/生命周期/批量创建销毁）
├── 3. 性能（并发 stress / IR 优化）
├── 4. 并发安全（TaskPool/Worker/锁/CV）
├── 5. 兼容性与继承（extends/implements/composition）
└── 6. 资料与文档符合性（@Sendable/ISendable/错误码）
```

> 测试逻辑分类口径（7 类）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附》。

---

## 0.1 文件清单（11 个文件 / 361 用例）

| # | 文件 | 用例数 | 特性域覆盖 |
|---|------|:---:|------|
| 1 | BaselibContainerSendableObject.test.ets | 79 | Sendable+容器互操作(79) |
| 2 | BuiltinContainerSendableObject.test.ets | 49 | Sendable+容器互操作(49) |
| 3 | CollectionsContainerSendableObject.test.ets | 35 | Sendable+容器互操作(35) |
| 4 | ConcurrentSharedObjectRW.test.ets | 48 | 跨线程数据可见性/一致性(48) |
| 5 | NormalContainerSendableObject.test.ets | 38 | 跨线程传递(TaskPool/Worker)(38) |
| 6 | SendablesChain.test.ets | 4 | 跨线程数据可见性/一致性(4) |
| 7 | SendablesGroup.test.ets | 8 | 跨线程数据可见性/一致性(8) |
| 8 | SendablesGroupWithAlloc.test.ets | 2 | 跨线程数据可见性/一致性(2) |
| 9 | SendablesTest.test.ets | 24 | 跨线程数据可见性/一致性(24) |
| 10 | returnCovered/ConcurrencyCoveredSupplement.test.ets | 16 | 错误场景(16) |
| 11 | returnCovered/ConcurrencyReturnCoveredTest.test.ets | 58 | 错误场景(58) |
| | **合计** | **361** | 11 文件 |

# 1. 接口/特性域测试

> 各特性域按文件分组标注用例位置；编号段取自解析结果。


## 1.1 跨线程传递(TaskPool/Worker)（38 用例）

```
跨线程传递（NormalClass 持有 Sendable 成员）
├── 入参范围覆盖
│   ├── NormalClass 持有 SendableMember（setter/getter）
│   ├── 持有 SendableArray/SendableMap/SendableSet 成员
│   ├── 持有 Baselib PlainArray/ArrayList/TreeMap 成员
│   ├── 持有 Builtin Array 成员、nested Sendable、SendableKey
│   └── NormalComplexContainer 混合容器/交叉引用、NormalUserDataManager static
├── 边界值测试
│   ├── 单成员 NormalClass、多成员容器组合
│   └── 深嵌套 nested Sendable
├── 返回值与类型验证
│   ├── 成员读取类型正确、setter/getter 联动
│   └── static 方法 + 实例成员返回值
├── 组合场景
│   ├── 多容器成员交叉引用
│   └── static 方法 + 实例成员混合
├── 重复调用/幂等性
│   └── setter 多次保留最后
└── 并发跨线程
    ├── NormalClass 经 TaskPool 传递、成员读写
    └── NormalClass 经 Worker 传递
```

- **用例位置（sendable_mix_test）**：`NormalContainerSendableObject.test.ets`（38 例）。

- **测了哪些**：NormalClass 持 SendableMember/Array/Map/Set/Baselib/Builtin/nested 成员跨 TaskPool 传递 + ComplexContainer 交叉引用。


## 1.2 跨线程数据可见性/一致性（86 用例）

```
跨线程数据可见性/一致性
├── 入参范围覆盖
│   ├── counter/array/map/complex/collections.Map/collections.Array/collections.Set 读写
│   ├── stress 500 tasks（counter/array/map/complex 各 500 任务）
│   ├── multiple shared objects、boundary zero tasks、all containers parallel
│   └── iterate during modify（迭代期间修改）
├── 边界值测试
│   ├── 0 tasks boundary
│   └── 500 tasks stress
├── 异常与非法输入
│   ├── concurrent error handling
│   └── iterate during modify 触发错误
├── 返回值与类型验证
│   ├── counter 累计正确
│   └── 数组/Map 值一致
├── 组合场景
│   ├── 多共享对象并行
│   └── all containers parallel
├── 重复调用/幂等性
│   └── 多次 stress 结果一致
└── 并发跨线程
    └── TaskPool 多任务并发读写可见性
```

- **用例位置（sendable_mix_test）**：`ConcurrentSharedObjectRW.test.ets`（48 例） + `SendablesTest.test.ets`（24 例） + `SendablesChain.test.ets`（4 例） + `SendablesGroup.test.ets`（8 例） + `SendablesGroupWithAlloc.test.ets`（2 例）。

- **测了哪些**：counter/array/map/complex/collections 读写 + 500 tasks stress + 多对象并行 + 迭代期间修改 + 错误处理。


## 1.3 Sendable+容器互操作（163 用例）

```
Sendable + 容器互操作（sendableClass 作为容器元素）
├── 入参范围覆盖
│   ├── Baselib：PlainArray/LinkedList/Queue/Stack/TreeMap/TreeSet/LightWeightMap/LightWeightSet（typed + object）
│   ├── Builtin：Array/Map/Set 存 sendableClass
│   └── collections：Array/Map/Set 存 sendableClass
├── 边界值测试
│   ├── 空容器、单元素
│   └── typed vs object 双形态
├── 返回值与类型验证
│   ├── 元素读取 instanceof sendableClass
│   └── typed 值类型正确
├── 组合场景
│   ├── 多容器交叉存取
│   └── typed/object 对比
└── 重复调用/幂等性
    └── 重复 add/push 幂等
```

- **用例位置（sendable_mix_test）**：`BaselibContainerSendableObject.test.ets`（79 例） + `BuiltinContainerSendableObject.test.ets`（49 例） + `CollectionsContainerSendableObject.test.ets`（35 例）。

- **测了哪些**：Baselib(PlainArray/LinkedList/Queue/Stack/TreeMap/TreeSet/LightWeight*)+Builtin+collections 存 sendableClass（typed+object 双形态）。


## 1.4 错误场景（74 用例）

```
错误场景（构造/参数错误码）
├── 入参范围覆盖
│   ├── constructor cannot be directly invoked→10200012：Array/Map/Set/ArrayBuffer/Int8/Uint8/Int16/Uint16/Int32/Uint32/Uint8Clamped/Float32 全 TypedArray
│   ├── constructor input param coverage：empty/non-empty array、null
│   └── lockAsync mode 超枚举范围→401
├── 边界值测试
│   ├── 空入参、null
│   └── 非空入参
├── 异常与非法输入
│   ├── 10200012：constructor 直接调用（全部容器/TypedArray）
│   └── 401：lockAsync mode 越界
├── 返回值与类型验证
│   └── 错误码 10200012/401 断言
├── 组合场景
│   └── 各容器 10200012 对称覆盖
└── 重复调用/幂等性
    └── 同错误多次抛同一码
```

- **用例位置（sendable_mix_test）**：`returnCovered/ConcurrencyReturnCoveredTest.test.ets`（58 例） + `returnCovered/ConcurrencyCoveredSupplement.test.ets`（16 例）。

- **测了哪些**：10200012(constructor 直接调用·全容器+全 TypedArray)+ 401(lockAsync mode 越界)+ 构造入参(null/empty)覆盖。

# 2. 稳定性

- **用例位置（sendable_mix_test）**：`ConcurrentSharedObjectRW.test.ets`、`SendablesGroup.test.ets`、`SendablesGroupWithAlloc.test.ets`
- **测了哪些**：Sendable 对象批量创建销毁/GC 后状态完整性/跨线程引用计数稳定性（本套件范围内）。

# 3. 性能

- **用例位置（sendable_mix_test）**：`ConcurrentSharedObjectRW.test.ets`（500 tasks stress）、`returnCovered/*`
- **测了哪些**：并发 stress（500 tasks）/ IR 优化（IC cache 建立/更新、fixed property IR）大规模吞吐（本套件范围内）；**未见显式时延阈值**。

# 4. 并发安全

- **用例位置（sendable_mix_test）**：`ConcurrentSharedObjectRW.test.ets`、`NormalContainerSendableObject.test.ets`、`returnCovered/*`
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + AsyncLock/ConditionVariable/ReadWriteLock 序列化 + 并发读写可见性/一致性（本套件范围内）。

# 5. 兼容性与继承

- **用例位置（sendable_mix_test）**：`NormalContainerSendableObject.test.ets`（NormalClass 持多成员）
- **测了哪些**：@Sendable 类继承/composition/二级继承/triple 跨线程 + instanceof + ISendable 实现（本套件范围内）。

# 6. 资料与文档符合性

- **用例位置（sendable_mix_test）**：`returnCovered/ConcurrencyReturnCoveredTest.test.ets`、`returnCovered/ConcurrencyCoveredSupplement.test.ets`
- **测了哪些**：@Sendable/@Concurrent 装饰、ISendable/isSendable、错误码 10200011/10200012/10200201/401 文档符合（本套件范围内）；**未发现与 `.d.ets` 逐条断言的符合性用例**。

---
# 7. 覆盖度矩阵与缺口分析（本套件自包含）

## 7.1 特性域 × 测试逻辑分类 覆盖矩阵

> 图例：✅ 充足 / 🟡 部分 / ❌ 未覆盖或仅间接

| 特性域 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 跨线程传递 | ✅(多类型成员) | ✅(单/多/嵌套) | ❌ | ✅(成员类型) | ✅(交叉引用/static) | ✅(setter 幂等) | ✅(TaskPool/Worker) |
| 跨线程可见性 | ✅(counter/array/map/complex) | ✅(0/500 tasks) | ✅(error/iterate-modify) | ✅(累计/一致) | ✅(多对象并行) | ✅(stress 一致) | ✅(TaskPool 并发) |
| Sendable+容器互操作 | ✅(全容器 typed+object) | ✅(空/单) | 🟡(间接) | ✅(instanceof/typed) | ✅(多容器交叉) | ✅(add 幂等) | 🟡(同线程) |
| 错误场景 | ✅(全容器/TypedArray) | ✅(null/empty) | ✅(10200012/401) | ✅(错误码断言) | ✅(对称覆盖) | ✅(同码) | 🟡(同线程) |

## 7.2 逐域遗漏确认（本套件范围内）

> ✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。对照本套件所测特性域逐条核查。

| # | 特性域 | 本套件核查结论 |
|---|------|----------------|
| 1 | 跨线程传递 | ✅ NormalClass 多成员跨线程；❌ 非 Sendable 成员跨线程应报错的路径未测。 |
| 2 | 跨线程可见性 | ✅ stress 500 + 迭代期间修改；🟡 多写者逐键正确性断言偏弱（不抛即通过）。 |
| 3 | Sendable+容器互操作 | ✅ Baselib/Builtin/collections 全容器 typed+object；❌ 跨线程容器+sendableClass 并发读写未专项。 |
| 4 | 错误场景 | ✅ 全容器/TypedArray 10200012 + 401；⚠️ 10200012 为内部守卫，应用层 new 不可达，建议文档注明。 |

## 7.3 接口组合遗漏（本套件范围内）

1. **NormalClass×容器组合**：NormalClass 持多容器成员跨线程——✅ 覆盖。
2. **stress×容器组合**：all containers parallel 并发——✅ 覆盖。
3. **错误码对称性**：全容器+全 TypedArray 10200012 对称——✅ 覆盖。
4. **可见性×错误**：iterate during modify 触发错误——✅ 覆盖。

## 7.4 文档与测试一致性建议（同步资料侧·本套件范围内）

1. **10200012 不可达性（⚠️）**：constructor 直接调用 10200012 为内部守卫，应用层 new 不可达；建议 `.md` 注明，避免资料侧误判可验证。
2. **401 未声明（⚠️）**：lockAsync mode 越界 401 已测，`.d.ets` lockAsync 未声明 401；建议补。
3. **非 Sendable 跨线程错误**：建议 `.md` 明确非 Sendable 成员跨线程传递的错误行为。

## 7.5 优先级建议（本套件范围内）

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.3 跨线程容器+sendableClass 并发读写专项；7.2 非成员跨线程报错路径 |
| P1 | 7.2 多写者逐键正确性强化（pin 10200201） |
| P2 | 7.4 文档 10200012 不可达性注明 + lockAsync 401 补声明 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对 @Sendable 类属性/方法/参数/返回值遍历合法类型空间 | 全类型属性矩阵（number/string/boolean/BigInt/null/undefined/class/function/enum/Array/Map/Set/TypedArray） |
| ②边界值测试 | 空/单元素/大规模/边界值（401 枚举越界、空容器、500 tasks stress） | 0 tasks boundary、空 Session、版本=0 初值 |
| ③异常与非法输入 | 10200011(detached)、10200012(constructor 直接调用)、10200201(并发修改)、401(参数非法) | returnCovered 各容器 10200012、lockAsync mode 越界 401 |
| ④返回值与类型验证 | 方法返回 number/string/boolean、instanceof、引用相等、计数语义 | refCount=1、singleton getInstance 同实例、counter 累加 |
| ⑤组合场景 | 多对象串联（NormalClass 持多 Sendable 成员跨线程、shared module singleton+TaskPool）、DataView↔容器 | NormalComplexContainer 交叉引用、shared module+TaskPool mutate |
| ⑥重复调用/幂等性 | 同操作多次稳定、singleton 多次 getInstance 同实例、连续递增 | singleton 多次、AsyncLock sequential 累计 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock/CV 序列化、stress 500 tasks、GC 后状态 | 500 tasks stress、TaskPool mutate by reference、PostGC 完整性 |
