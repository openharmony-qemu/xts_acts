# collections.Set 测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_sendable/collections_set/.../test/` 下 30 个 `*.test.ets` 文件，共 **1389** 个用例（`@tc.name` 计数 = `it()` 计数，逐文件对账零误差）。
> **契约来源**：`@arkts.collections.d.ets` L1335–L1496 `class Set<T>`（`@Sendable`，`@since 12 dynamiconly` / `@crossplatform since 18`），共枚举 11 个成员：`constructor`×2 重载、`size`、`[Symbol.iterator]`、`entries`、`keys`、`values`、`add`、`clear`、`delete`、`forEach`、`has`。
> **文档来源**：`apis-arkts/arkts-apis-arkts-collections-Set.md`。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
collections.Set
├── 1. 接口测试
│   ├── constructor（无参 / 数组 / Iterable / null）
│   ├── size（只读属性）
│   ├── add（返回 this 链式 / 去重）
│   ├── has（存在性 boolean）
│   ├── delete（返回 boolean）
│   ├── clear（清空）
│   ├── forEach（key===value 回调）
│   ├── entries（[T,T] 迭代器）
│   ├── keys / values（T 迭代器）
│   └── [Symbol.iterator]（for...of 可迭代）
├── 2. 稳定性（rehash / 容量扩张 / 错误恢复）
├── 3. 性能（大集合 / 10000 元素遍历）
├── 4. 并发安全（Worker / TaskPool / 并发修改 10200201）
├── 5. 兼容性继承（@Sendable 子类 / instanceof / 跨线程引用）
└── 6. 资料符合性（Basic 文档示例 / 综合 API 矩阵）
```

**7 类测试逻辑分类**（贯穿各接口的脑图分支）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。

> **注**：`.d.ets` 中 `Set` **不存在** `from` 静态工厂；`CollectionsSetFromTest.test.ets` 实际测试的是 `Array.from(set.keys()/set.values())` 转换，归为 keys/values 衍生场景（见 §1 末附注）。

---

## 0.1 文件清单

| # | 文件（相对 test/） | 用例数 | 接口覆盖 |
|---|---|---|---|
| 1 | CollectionSetBase/CollectionsSetAddHas.test.ets | 49 | add + has |
| 2 | CollectionSetBase/CollectionsSetAuxiliary.test.ets | 77 | 异常/错误码/边界/返回值（misc） |
| 3 | CollectionSetBase/CollectionsSetConstructor.test.ets | 34 | constructor |
| 4 | CollectionSetBase/CollectionsSetDeleteClearSize.test.ets | 74 | delete + clear + size |
| 5 | CollectionSetBase/CollectionsSetForEachEntries.test.ets | 47 | forEach + entries |
| 6 | CollectionSetBase/CollectionsSetInheritanceAndSendableTypes.test.ets | 74 | 继承/@Sendable |
| 7 | CollectionSetBase/CollectionsSetKeysValuesForOf.test.ets | 61 | keys + values + [Symbol.iterator] |
| 8 | CollectionSetBase/CollectionsSetSendableFunction.test.ets | 33 | @Sendable 函数元素（misc） |
| 9 | CollectionsSetAddTest.test.ets | 57 | add |
| 10 | CollectionsSetClearTest.test.ets | 38 | clear |
| 11 | CollectionsSetConcurrent/CollectionsSetConcurrent.test.ets | 28 | 并发 |
| 12 | CollectionsSetConcurrent/CollectionsSetWorker.test.ets | 14 | 并发（Worker） |
| 13 | CollectionsSetConstructorTest.test.ets | 25 | constructor |
| 14 | CollectionsSetDeleteTest.test.ets | 62 | delete |
| 15 | CollectionsSetEntriesTest.test.ets | 27 | entries |
| 16 | CollectionsSetExpand1024Test.test.ets | 18 | 容量扩张/rehash |
| 17 | CollectionsSetForeachTest.test.ets | 31 | forEach |
| 18 | CollectionsSetFromTest.test.ets | 32 | Array.from 转换（非 Set 接口） |
| 19 | CollectionsSetHasTest.test.ets | 58 | has |
| 20 | CollectionsSetKeysTest.test.ets | 43 | keys |
| 21 | CollectionsSetMultiRoundConsistencyTest.test.ets | 11 | 多轮幂等一致性（全接口 3 轮 deep-equal） |
| 22 | CollectionsSetSizeTest.test.ets | 32 | size |
| 23 | CollectionsSetSymbolIteratorTest.test.ets | 36 | [Symbol.iterator] |
| 24 | CollectionsSetTest.test.ets | 44 | 综合套件 |
| 25 | CollectionsSetThisArgTest.test.ets | 3 | forEach thisArg 上下文绑定 |
| 26 | CollectionsSetValuesTest.test.ets | 51 | values |
| 27 | Normal/SetNormal.test.ets | 135 | 综合（主线程，与 TaskPool 同源） |
| 28 | SetBasic.test.ets | 27 | 文档示例（基础） |
| 29 | TaskPool/SetTaskPool.test.ets | 136 | 综合（TaskPool，与 Normal 同源） |
| 30 | collections/SetInheritanceTest.test.ets | 32 | 继承/@Sendable |
| **合计** | **30 文件** | **1389** | 全接口 + 稳定性 + 并发 + 继承 + 文档 |

> **排除文件（2）**：`List.test.ets`（聚合导入索引，0 用例）、`Util.test.ets`（工具类 `Utils.msSleep`，0 用例，非 collections.Set 测试）。
> **去重删除（1）**：`Concurrent/SetConcurrent.test.ets`（原 19 例，与 `collections_map` 跨套件确定重复，去重后删除）。

---

# 1. 接口测试

## 1.1 constructor（2 重载：`values?: readonly T[] \| null` / `iterable: Iterable<T>`）

```brain-map
constructor (58 例)
├── 入参范围覆盖
│   ├── 数组单/多元素（number/string/boolean/BigInt/emoji/特殊字符）
│   ├── Iterable<T> 构造（collections.Set/Map 嵌套、collections.Array）
│   ├── @Sendable 类实例 / SendableFuncType / SendableAsyncFnType
│   └── 科学计数法浮点 / AsyncLock / ConditionVariable
├── 边界值测试
│   ├── 无参空 Set / 空数组 → 空 Set
│   ├── null 参数 / undefined
│   └── 空字符串 / MAX_SAFE_INTEGER
├── 异常与非法输入
│   └── 10200012 直接调用构造错误（非 new）
├── 返回值与类型验证
│   ├── size 正确 / 元素存在性
│   └── instanceof Set 检测
├── 组合场景
│   └── 从另一 Set/Map 构造（拷贝语义）
├── 重复调用幂等性
│   └── 重复元素去重（constructor0005）
└── 并发跨线程
    └── constructor(iterable) 跨线程引用（AsyncLock 实例）
```

- **用例位置**：`CollectionSetBase/CollectionsSetConstructor.test.ets`（34 例，0100–3400）+ `CollectionsSetConstructorTest.test.ets`（24 例，0100–2400）+ 综合/继承文件补充。
- **测了哪些**：两类重载均覆盖，含全部 sendable 元素类型、空/null/undefined 边界、去重与拷贝语义，以及 10200012 构造错误码。

## 1.2 size（只读属性）

```brain-map
size (59 例)
├── 入参范围覆盖
│   └── 各元素类型 add 后 size 跟踪（number/string/boolean/BigInt/emoji）
├── 边界值测试
│   ├── 新建空 Set size=0
│   ├── empty string / null / undefined
│   └── MAX_SAFE_INTEGER / NaN
├── 返回值与类型验证
│   ├── add 后 size+1 / delete 后 size-1 / clear 后 size=0
│   └── number 类型断言
├── 组合场景
│   ├── add→delete→clear 序列
│   └── add+delete 同元素多次后 size 一致
├── 重复调用幂等性
│   └── 重复 add 不增 size / 同元素增删多次 size 不漂移
└── 并发跨线程
    └── AsyncLock 元素 size 跟踪
```

- **用例位置**：`CollectionsSetSizeTest.test.ets`（32 例，0100–3200）+ `CollectionSetBase/CollectionsSetDeleteClearSize.test.ets`（size 段 27 例，0100–2700）。
- **测了哪些**：size 与 add/delete/clear 的联动一致性、各类型元素计数、边界值与重复 add 幂等性。

## 1.3 add(value)

```brain-map
add (81 例)
├── 入参范围覆盖
│   ├── number/string/boolean/BigInt/emoji/特殊字符/空字符串
│   ├── @Sendable 类 / SendableEnum / 嵌套 collections.Set/Map
│   └── AsyncLock / ConditionVariable / 科学计数法
├── 边界值测试
│   ├── undefined / null / 空字符串
│   ├── NaN / +0 / -0 / ±Infinity / MAX_SAFE_INTEGER
│   └── 100000 长字符串
├── 返回值与类型验证
│   └── add 返回 this（链式） / size 唯一性
├── 组合场景
│   └── 链式 add 多元素 / add 后立即 has=true
├── 重复调用幂等性
│   └── 重复 add 不增 size、不重复元素（SameValueZero）
└── 并发跨线程
    └── AsyncLock 实例 add
```

- **用例位置**：`CollectionsSetAddTest.test.ets`（56 例，0100–5600）+ `CollectionSetBase/CollectionsSetAddHas.test.ets`（add 段 25 例，0100–2500）+ 扩张文件补充。
- **测了哪些**：返回 this 链式、SameValueZero 去重、全类型元素、边界值（NaN/±0/Infinity/超长串）、链式组合。

## 1.4 has(value)

```brain-map
has (82 例)
├── 入参范围覆盖
│   ├── 存在→true / 不存在→false（各类型）
│   └── Unicode 多字符 / ±Infinity
├── 边界值测试
│   ├── 空字符串 / null / undefined
│   └── 空集 has 任意→false
├── 返回值与类型验证
│   └── boolean 类型 / true|false 断言
├── 组合场景
│   ├── add 后 has=true / delete 后 has=false / clear 后 has=false
│   └── 多参数 has（仅取首参）
├── 重复调用幂等性
│   └── 多次重复 add 后 has 仍 true
└── 并发跨线程
    └── 并发修改期间 has / AsyncLock 元素 has
```

- **用例位置**：`CollectionsSetHasTest.test.ets`（58 例，0100–5800）+ `CollectionSetBase/CollectionsSetAddHas.test.ets`（has 段 24 例，0100–2400）。
- **测了哪些**：存在性 boolean、各类型元素、add/delete/clear 联动、多参数仅取首参行为、并发修改期间一致性。

## 1.5 delete(value)

```brain-map
delete (85 例)
├── 入参范围覆盖
│   ├── 存在元素删除→true / 不存在→false（各类型）
│   └── 嵌套 Set/Map / AsyncLock / ConditionVariable / 科学计数法
├── 边界值测试
│   ├── 空字符串 / null / undefined
│   └── 空集 delete→false
├── 返回值与类型验证
│   └── boolean 返回值 true|false
├── 组合场景
│   ├── for...of 中 delete / 逆序 delete / delete 后 clear
│   ├── delete 后 size-1 且 has=false
│   └── delete 已删元素→false
├── 重复调用幂等性
│   └── 重复 delete 同元素→false
└── 并发跨线程
    └── 并发遍历中 delete（10200201 触发）
```

- **用例位置**：`CollectionsSetDeleteTest.test.ets`（62 例，0100–6200）+ `CollectionSetBase/CollectionsSetDeleteClearSize.test.ets`（delete 段 23 例，0100–2300）。
- **测了哪些**：删除存在/不存在 boolean 返回、全类型、for...of/逆序/delete+clear 组合、并发修改触发 10200201。

## 1.6 clear()

```brain-map
clear (62 例)
├── 入参范围覆盖
│   └── 各类型元素 Set 清空后 size=0（number/string/boolean/BigInt）
├── 边界值测试
│   ├── 空 Set clear 不抛错
│   ├── empty string / null / undefined / 空集
│   └── 嵌套 Set/Map / AsyncLock / ConditionVariable
├── 异常与非法输入
│   ├── forEach 回调内 clear → 10200201
│   └── 元素 getter 抛错时 clear 行为
├── 返回值与类型验证
│   └── void / size→0 / 迭代器空
├── 组合场景
│   ├── clear 后可复用 add+has
│   ├── clear 后迭代器无元素
│   └── clear 与 entries/keys/values 独立迭代器
├── 重复调用幂等性
│   └── 多次 clear（其间 add）仍 size=0
└── 并发跨线程
    └── AsyncLock 元素 clear
```

- **用例位置**：`CollectionsSetClearTest.test.ets`（38 例，0100–3800）+ `CollectionSetBase/CollectionsSetDeleteClearSize.test.ets`（clear 段 24 例，0100–2400）+ Auxiliary 异常段。
- **测了哪些**：清空后 size=0/迭代器空、空 Set 不抛错、可复用性、forEach 内 clear 触发 10200201。

## 1.7 forEach(callbackFn)

```brain-map
forEach (53 例)
├── 入参范围覆盖
│   ├── 单元素 / 多元素 / 全类型 key===value 语义
│   ├── @Sendable 类引用 / SendableEnum / 嵌套 Set
│   └── AsyncLock / ConditionVariable / 科学计数法
├── 边界值测试
│   ├── 空 Set 不执行回调
│   ├── empty string / null / undefined
│   └── NaN / MAX_SAFE_INTEGER
├── 异常与非法输入
│   ├── 回调抛错中断遍历
│   └── 回调内 add/delete/clear → 10200201
├── 返回值与类型验证
│   ├── 插入顺序遍历 / key===value 不变式
│   └── void 返回
├── 组合场景
│   ├── delete 再 add 同元素 → 访问两次
│   └── 遍历结果与 keys/values 一致
├── 重复调用幂等性
│   └── 重复值仅处理唯一值
└── 并发跨线程
    └── 并发 forEach 遍历（多线程只读）
```

- **用例位置**：`CollectionsSetForeachTest.test.ets`（31 例，0100–3100）+ `CollectionSetBase/CollectionsSetForEachEntries.test.ets`（forEach 段 22 例，0100–2200）+ `CollectionsSetThisArgTest.test.ets`（3 例，forEach thisArg 上下文绑定：delete+re-add 后遍历序、无 thisArg 基础遍历、@Sendable 类方法回调绑定）+ Concurrent 文件并发段。
- **测了哪些**：插入顺序遍历、key===value 语义、空集不回调、回调内修改触发 10200201、回调抛错中断、并发只读遍历、thisArg 上下文绑定（@Sendable SetContext 闭包访问 + ESObject 方法绑定）。

## 1.8 entries()

```brain-map
entries (52 例)
├── 入参范围覆盖
│   ├── [T,T] 键值对（各类型 / @Sendable 类引用）
│   └── AsyncLock / 嵌套 Set / SendableEnum
├── 边界值测试
│   ├── 空 Set → 空迭代器
│   ├── undefined / null key===value 不变式
│   └── NaN / MAX_SAFE_INTEGER
├── 异常与非法输入
│   ├── 非 sendable 绑定 → 10200011
│   └── 遍历中 add 不抛错（entries 返回独立迭代器）
├── 返回值与类型验证
│   ├── IterableIterator<[T,T]> 类型
│   └── 存在性与耗尽
├── 组合场景
│   ├── 插入顺序 / for...of 遍历
│   └── 忽略传入参数
├── 重复调用幂等性
│   └── 多次调用返回新独立迭代器
└── 并发跨线程
    └── 并发修改 → 10200201
```

- **用例位置**：`CollectionsSetEntriesTest.test.ets`（27 例，0100–2700）+ `CollectionSetBase/CollectionsSetForEachEntries.test.ets`（entries 段 25 例，0100–2500）。
- **测了哪些**：[T,T] 键值对迭代器、独立迭代器（遍历中 add 不报错）、key===value 不变式、空迭代器、非 sendable 绑定 10200011。

## 1.9 keys()

```brain-map
keys (66 例)
├── 入参范围覆盖
│   ├── 各类型 T 迭代器（number/string/boolean/BigInt/emoji）
│   ├── @Sendable 类引用 / SendableEnum 值
│   └── 嵌套 collections.Set/Map / AsyncLock
├── 边界值测试
│   ├── 空 Set → 空迭代器
│   ├── undefined / null
│   └── NaN / MAX_SAFE_INTEGER
├── 异常与非法输入
│   ├── 非 sendable 绑定 → 10200011
│   └── 遍历中 delete 不抛错（独立迭代器）
├── 返回值与类型验证
│   ├── IterableIterator<T> 类型
│   └── 与 values 等价序列
├── 组合场景
│   ├── 插入顺序 / for...of / 部分迭代
│   └── keys 与 values 一致序列
├── 重复调用幂等性
│   └── 重复元素被忽略 / 多次增删后序列正确
└── 并发跨线程
    └── 并发修改迭代 → 10200201
```

- **用例位置**：`CollectionsSetKeysTest.test.ets`（43 例，0100–4300）+ `CollectionSetBase/CollectionsSetKeysValuesForOf.test.ets`（keys 段 23 例，0100–2300）。
- **测了哪些**：T 迭代器、与 values 等价、独立迭代器（遍历中 delete 不报错）、空迭代器、部分迭代、Unicode、并发修改 10200201。

## 1.10 values()

```brain-map
values (74 例)
├── 入参范围覆盖
│   ├── 各类型 T 迭代器 / @Sendable 类复杂字段访问
│   ├── SendableClassExtended 引用 / SendableEnum
│   └── 嵌套 collections.Set 引用 / AsyncLock
├── 边界值测试
│   ├── 空 Set → 空迭代器
│   ├── MAX_SAFE_INTEGER / NaN / ±Infinity
│   └── empty string / null / undefined
├── 异常与非法输入
│   ├── 非 sendable 绑定 → 10200011
│   └── 遍历中 clear 不抛错（独立迭代器）
├── 返回值与类型验证
│   ├── IterableIterator<T> 类型
│   └── 与 keys 等价
├── 组合场景
│   ├── 插入顺序 / for...of / 部分迭代
│   └── values 与 keys 等价性
├── 重复调用幂等性
│   └── 重复元素过滤
└── 并发跨线程
    └── 并发修改迭代 → 10200201
```

- **用例位置**：`CollectionsSetValuesTest.test.ets`（51 例，0100–5100）+ `CollectionSetBase/CollectionsSetKeysValuesForOf.test.ets`（values 段 23 例，0100–2300）。
- **测了哪些**：T 迭代器、与 keys 等价、独立迭代器（遍历中 clear 不报错）、MAX_SAFE_INTEGER/NaN 边界、Sendable 类引用字段访问。

## 1.11 [Symbol.iterator]()

```brain-map
[Symbol.iterator] (50 例)
├── 入参范围覆盖
│   ├── for...of 遍历各类型（number/string/boolean/BigInt）
│   ├── 特殊字符 / emoji / 科学计数法
│   └── @Sendable 类 / SendableEnum
├── 边界值测试
│   ├── MAX_SAFE_INTEGER / NaN / ±0
│   ├── empty string / null / undefined
│   └── 空集 for...of 不执行
├── 异常与非法输入
│   └── Symbol.iterator 非 sendable 绑定 → 10200011
├── 返回值与类型验证
│   ├── IterableIterator<T>
│   └── for...of 与 values 等价结果
├── 组合场景
│   ├── Array 构造器配合（带 length/fill/unshift/join）
│   ├── break 提前终止 for...of
│   └── 插入顺序一致
├── 重复调用幂等性
│   └── 多次 for...of 结果一致
└── 并发跨线程
    └── 并发 for...of 完整性
```

- **用例位置**：`CollectionsSetSymbolIteratorTest.test.ets`（35 例，0100–3500）+ `CollectionSetBase/CollectionsSetKeysValuesForOf.test.ets`（for-of 段 15 例，0100–1500）。
- **测了哪些**：for...of 可迭代契约、与 values 等价、break 提前终止、Array 构造器组合、非 sendable 绑定 10200011。

### 附注：Array.from 转换（非 Set 接口，32 例）

`.d.ets` 的 `Set` **无 `from` 静态工厂**。`CollectionsSetFromTest.test.ets`（32 例，0100–3200）实测的是 `Array.from(set.keys()/set.values())` 转换：keys/values 一致性（各类型、add/delete/clear 后、NaN/特殊数、null/undefined、混合类型、BigInt、Unicode）、并发修改期间一致性、for-of 与 has 组合、break 提前终止。归为 keys/values 的衍生转换场景。

---

# 2. 稳定性

- **用例位置**：`CollectionsSetExpand1024Test.test.ets`（18 例，0001–0018）。
- **测了哪些**：1023/1024/1025 元素 rehash 不丢元素、rehash 前后 has 一致、重复 delete 无残留、NaN/±0 SameValueZero 跨 rehash、超长字符串（100000 字符）存活、rehash 边界并发 add 不重复不超量、并发 rehash 期间 TaskPool 进度上报。
- **错误恢复**：`CollectionsSetAuxiliary` 含 Set 在 10200201 后可复用断言。
- **多轮幂等一致性**：`CollectionsSetMultiRoundConsistencyTest.test.ets`（11 例，072–082）——对 add/delete/has/size/forEach/keys/values/entries/clear 全接口执行 3 轮相同操作序列，每轮采集返回值+状态快照，`assertDeepEquals` 跨轮比对一致性。覆盖：add 返回 self + 重复 add 幂等（072）、delete+has 一致（073）、size 序列一致（074）、forEach 多类型回调计数+成员一致（075）、values/keys 序列一致（076）、entries [m,m] 序列一致（077）、clear+add 后 size+has 一致（078）、3 状态 has+forEach+size 一致（079）、空集+单元素读取一致（080）、add(non-Sendable)→401 异常码跨轮一致（081）、混合操作序列返回值+终态一致（082）。

# 3. 性能

- **用例位置**：`CollectionSetBase/CollectionsSetAuxiliary.test.ets`（boundary 段）+ `CollectionsSetConcurrent` large 段。
- **测了哪些**：10000 元素大 Array 作为 Set 元素、1000 条目大 Map 元素、forEach 遍历大集合、大 String Set entries 遍历。**未见独立的耗时/内存基线测度**（仅规模断言，无 `performance`/计时断言）。

# 4. 并发安全

- **用例位置**：
  - `CollectionsSetConcurrent/CollectionsSetConcurrent.test.ets`（28 例，0100–2800）
  - `CollectionsSetConcurrent/CollectionsSetWorker.test.ets`（14 例，0100–1400）
  - `Concurrent/SetConcurrent.test.ets`（19 例，0001–0019）
  - `TaskPool/SetTaskPool.test.ets`（135 例，0001–0135，与 Normal 同源）
- **测了哪些**：并发 forEach/keys/values/for-of 只读遍历完整正确、并发修改（add/delete/clear）触发 10200201 并可恢复 size 正确、Worker 接收/遍历/修改 Set 引用、TaskPool 共享 Set 跨线程、Worker Sendable Class Set、大集合并发遍历。

# 5. 兼容性与继承

- **用例位置**：`CollectionSetBase/CollectionsSetInheritanceAndSendableTypes.test.ets`（74 例，0100–6600）+ `collections/SetInheritanceTest.test.ets`（32 例，0100–3200）。
- **测了哪些**：`@Sendable` 子类 `extends collections.Set`（自定义方法/重写 forEach/构造继承 values/泛型继承/多类型混合）、instanceof 检测与原型链、多态、两级继承链、子类实例跨 TaskPool 引用传递、多 TaskPool 共享同一子类实例、`@Sendable` 装饰跨线程类型检查、构造器接受 @Sendable 函数（SendableFuncType/SendableAsyncFnType，33 例）。

# 6. 资料与文档符合性

- **用例位置**：`SetBasic.test.ets`（27 例，0001–0027）+ `CollectionsSetTest.test.ets`（44 例，0100–4400）。
- **测了哪些**：`SetBasic` 按文档 API 描述逐成员给最小示例（constructor/entries/keys/values/add/has/delete/clear/forEach/size）；`CollectionsSetTest` 综合功能矩阵（各类型 set、overwrite、链式、null/undefined/empty 边界、delete/clear 后、重复 key）。**注意**：`CollectionsSetTest` 用例描述沿用 Map 术语（"key-value pair"/"overwrite key"），与 Set 无键值语义存在表述偏差。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> ✅ = 有专用用例充分覆盖；❓ = 仅零星/借道覆盖；— = 不适用。

| 接口 | 入参范围覆盖 | 边界值测试 | 异常与非法输入 | 返回值与类型验证 | 组合场景 | 重复调用幂等性 | 并发跨线程 |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅ | ✅ | ❓(10200012) | ✅ | ✅ | ✅ | ❓ |
| size | ✅ | ✅ | — | ✅ | ✅ | ✅ | ❓ |
| add | ✅ | ✅ | ❓(10200011) | ✅ | ✅ | ✅ | ❓ |
| has | ✅ | ✅ | — | ✅ | ✅ | ✅ | ✅ |
| delete | ✅ | ✅ | — | ✅ | ✅ | ✅ | ✅ |
| clear | ✅ | ✅ | ✅(10200201) | ✅ | ✅ | ✅ | ❓ |
| forEach | ✅ | ✅ | ✅(10200201/10200011) | ✅ | ✅ | ✅ | ✅ |
| entries | ✅ | ✅ | ✅(10200011) | ✅ | ✅ | ❓ | ✅ |
| keys | ✅ | ✅ | ✅(10200011) | ✅ | ✅ | ✅ | ✅ |
| values | ✅ | ✅ | ✅(10200011) | ✅ | ✅ | ✅ | ✅ |
| [Symbol.iterator] | ✅ | ✅ | ❓(10200011) | ✅ | ✅ | ❓ | ✅ |

# collections.Set §7 回填块（步骤四产物）


---

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.collections.d.ets）

> 标记：✅ 已覆盖｜❌ 测试缺口｜⚠️ 文档缺口（已测但声明/语义不一致）｜🔴 工程/产品缺陷

| 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|---|---|
| **size** | `readonly size: number`；无 `@throws` | ✅ 已覆盖。`CollectionsSetSizeTest`（32）+ `DeleteClearSize`（size 段 27）测了 add/delete/clear 联动、各类型计数、边界、重复 add 幂等。size 为只读属性、无 10200011 绑定语义，无需绑定错误用例。 |
| **constructor①** `values?: readonly T[] \| null` | `@throws 10200012`（不可直接调用） | ✅ 已覆盖。数组/null/空/去重/拷贝语义全覆盖；10200012 由 `testSetError0009`（`set.constructor()` 直接调用）覆盖。 |
| **constructor②** `iterable: Iterable<T>` | `@throws 10200012` | ⚠️ 边界缺口。现有重载②用例仅以另一 `collections.Set`（`ConstructorTest0700`）或 `Map.values()`（base L422/442/460）为 iterable 源；**无非 Set/Map 的通用 `Iterable<T>`**（生成器/自定义可迭代）构造路径，未触及重载②与重载①的本质区分。补 `SUP_SET_CTOR_001`（P2）。 |
| **[Symbol.iterator]** | `@throws 10200011`；`.d.ets` 注释"not usable in .ets files" | 🔴 工程+测试双重缺口。`CollectionsSetSymbolIteratorTest.test.ets`（35 例）**全部测 `collections.Array`**（`grep collections.Set`=0、`collections.Array`=40、`for...of`=0），文件命名/归属错位，致测试点 §1.11 虚高 35 例覆盖。真实 `[Symbol.iterator]` 直接覆盖仅 `KeysValuesForOf` 中 `for(let item of set)` **15 例** + `SetInheritanceTest` **1 例** = 16 例。`10200011` 绑定错误（`Auxiliary` testSetError0007~0015 覆盖 9 个方法唯独缺此项）与 `.ets` 不可用约束**均无任何用例**。补 `SUP_SET_ITER_001/002/003`（P0）。 |
| **entries** | `@throws 10200011,10200201`；返回 `IterableIterator<[T,T]>` | ✅ 已覆盖。`[T,T]` 对、key===value 不变式、独立迭代器（`testSetError0004` 迭代中 add 不抛错）、空迭代器、10200011（`testSetError0008`）均覆盖。10200201 由并发文件覆盖（独立迭代器单线程修改不抛，并发修改抛）。 |
| **keys** | `@throws 10200011,10200201`；与 values 等价 | ✅ 已覆盖。T 迭代器、与 values 等价、独立迭代器（`testSetError0005`）、空迭代器、10200011（`testSetError0010`）、并发 10200201 均覆盖。 |
| **values** | `@throws 10200011,10200201`；与 keys 等价 | ✅ 已覆盖。`CollectionsSetValuesTest`（51）+ base 段 23；T 迭代器、与 keys 等价、独立迭代器（`testSetError0006` 迭代中 clear 不抛错）、边界、10200011（`testSetError0011`）、并发 10200201。 |
| **add** | `@throws 10200011,10200201`；返回 `Set<T>` 本身（链式） | ⚠️ 弱断言。链式 `add().add()`、重复 add no-op、10200011（`testSetError0015`）均覆盖；但 `collectionsSetAddTest2100` 用 `assertDeepEquals(set)` 验证返回值，**深相等非引用身份**，无法区分"返回 this"与"返回同型新对象"。补 `SUP_SET_ADD_001`（P1，改 `=== set` 身份断言）。10200201 经 forEach 回调内 add（`testSetError0001`）与并发文件覆盖。 |
| **clear** | `@throws 10200011,10200201`；返回 void | ✅ 已覆盖。清空后 size=0/迭代器空/可复用、空 Set 不抛错、forEach 内 clear 触发 10200201（`testSetError0003`）、10200011（`testSetError0012`）。 |
| **delete** | `@throws 10200011,10200201`；存在→true/不存在→false | ✅ 已覆盖。删除存在/不存在 boolean、for...of 中 delete、逆序、delete+clear 组合、10200011（`testSetError0013`）。⚠️ `.d.ets` L1449 文案"if the key is deleted"用"key"表述，Set 无键语义，见 §7.4。 |
| **forEach** | `@throws 10200011,10200201`；回调 `(value,value2,set)`；插入顺序；回调内修改→10200201 | ✅ 已覆盖（分布在不同文件）。`CollectionsSetForeachTest1600` 测三参数（`value===key===value2` 不变式）；10200201 修改三路径（add/delete/clear 内回调）在 `testSetError0001/0002/0003`；10200011 在 `testSetError0014`；空集不回调、回调抛错中断、并发只读遍历在 `Concurrent` 文件。`CollectionsSetForeachTest`（31 例）本身不含 10200201/修改路径，覆盖集中 `Auxiliary`，属分布性而非缺口。 |
| **has** | `@throws 10200011,10200201`；存在→true/不存在→false | ✅ 已覆盖。各类型存在性、add/delete/clear 联动、多参仅取首参、10200011（`testSetError0007`）。⚠️ `.d.ets` L1474 `@param value - Target key.` 用"key"表述，Set 无键语义，见 §7.4。 |

---

## 7.3 接口组合遗漏（从组合角度核查）

1. **返回新对象 API 的后续操作**：
   - `entries/keys/values` 返回的 `IterableIterator` 是否进一步 `next()` 操作、是否独立——✅ 已由 `testSetError0004~0006`（迭代中修改不抛错）+ 多次调用返回新迭代器覆盖。
   - `add` 链式 `set.add().add()`——✅ 覆盖；但**返回值身份**仅深相等断言，❌ 缺引用身份（`=== set`）断言，见 `SUP_SET_ADD_001`。

2. **状态变更后访问**：
   - `delete`→`has=false`/`size-1`——✅ 覆盖（`DeleteClearSize` + `DeleteTest`）。
   - `clear`→`size=0`/`has=false`/`forEach` 不回调——✅ 覆盖（`ClearTest` + base）。

3. **`for...of`（[Symbol.iterator]）迭代中修改 Set**：
   - ❌ 缺口。`testSetError0004~0006` 仅覆盖 `entries/keys/values` **独立迭代器**迭代中修改不抛错；`for...of set`（直接走 `[Symbol.iterator]`）在 `add/delete/clear` 中途的行为**无任何用例**，无法判定其走并发检测路径还是快照路径。补 `SUP_SET_ITER_004`（P1）。

4. **constructor 两重载全路径**：
   - 重载①（数组/null/空）——✅ 充分。
   - 重载②（`Iterable<T>`）——⚠️ 仅以 Set/Map 为源，缺通用 `Iterable<T>`（生成器/自定义），见 `SUP_SET_CTOR_001`（P2）。

5. **`delete` 缺失元素→false、`add` 重复→no-op**：
   - ✅ 均覆盖（`DeleteTest` L193"empty Set delete→false"；`AddTest` L207"add('duplicate').add('duplicate')"后 size 不增）。

6. **forEach 回调修改 Set（10200201）全路径**：
   - ✅ 三路径（add/delete/clear 内回调）均由 `testSetError0001/0002/0003` 覆盖，且 `testSetAnnotation0004` 验证 10200201 后 Set 可恢复。

7. **`[Symbol.iterator]` 与 `values()` 等价性**：
   - ✅ 部分覆盖（`KeysValuesForOf` 有 for-of 与 values 序列对照），但因 `SymbolIteratorTest` 文件错位，等价性断言样本偏少，随 `SUP_SET_ITER_001` 重写后补齐。

8. **Normal/TaskPool 重复套件的并发修改覆盖**：
   - ⚠️ 覆盖效率缺口。`Normal/SetNormal`（135）与 `TaskPool/SetTaskPool`（135）`@tc.name` 列表**完全相同**（`diff` 为空），TaskPool 版仅将每例包进 `taskpool.execute()`，两文件 `10200201` 计数均=0，即 TaskPool 版**未验证并发修改**这一跨线程核心契约，仅验证"同断言跨线程可执行"。补 `SUP_SET_DUP_001`（P1，TaskPool 新增并发修改场景区别于 Normal）。

---

## 7.4 文档与测试一致性建议（同步资料侧）

1. **401 未声明（设计正确，建议补防御探针）**：`.d.ets` 全部 12 成员无 `@throws 401`，与 `Map` 一致；`CollectionsSetAuxiliary.test.ets` L122–127 已明确记载 401 由 ArkTS 严格类型编译期拦截、运行时不可达。建议：① 维持 `.d.ets` 不声明 401（正确）；② 在 `Auxiliary` 补 `SUP_SET_401_001/002` 防御性 `as unknown as T` 探针（P2，标注 `code_no_check`），固定"绕过严格类型后的运行时行为"作为非契约观测点。

2. **`.d.ets` "key" 表述与 Set 语义冲突**：
   - `has`（L1474）：`@param value - Target key.`——Set 无键，应为"Target value"。
   - `delete`（L1449）："The value **true** is returned if the key is deleted"——应为"if the value is deleted"。
   - `entries`（L1383）："key-value pair of each element"——Set 中 `[T,T]` 两元相同，建议"the pair `[value, value]` of each element"。
   - `forEach`（L1460）："for each key-value pair"——应为"for each element"（Set 无键值对）。
   - 建议同步修订 `.d.ets` JSDoc 与 `.md` 对应描述（`.md` 已较准确，但 §forEach 子参数表 L354 "value2" 标注"键"亦需改为"值"）。

3. **`CollectionsSetTest.test.ets` Map 术语污染**：7 个 `@tc.desc`（L58/95/113/132/150/168/187）使用"set string/number/boolean/null/undefined/bigint key-value pair"措辞，与 Set 无键值语义冲突。建议统一改为"add element (type) to Set"。

4. **forEach 子参数"必填=否"语义澄清**：`.md` L352–356 将 `value/value2/set` 三参均标"必填=否"，易误读为类型可选；实为"回调可忽略参数"（JS 位置参数语义）。`CollectionsSetForeachTest0800`（无参回调正常执行）已覆盖此行为。建议 `.md` 将表头"必填"改为"是否必填（回调内）"或加注"回调可省略未用参数"。

5. **`CollectionsSetSymbolIteratorTest.test.ets` 文件归属错位**（🔴 工程）：35 例实际测 `collections.Array`，应迁移至 Array 专用测试文件，原文件重写为真实 `[Symbol.iterator]` 用例（见 `SUP_SET_ITER_001`）。此为最高优先级工程整改，涉及测试点 §1.11 / §0.1 文件清单计数修正。

---

## 7.5 优先级建议

| 优先级 | 编号 | 主题 | 缺口类型 | 缺口来源 |
|---|---|---|---|---|
| **P0** | SUP_SET_ITER_001 | `CollectionsSetSymbolIteratorTest` 整体改造（迁移 35 例 Array + 重写 ≥12 例真实 for...of） | 🔴 工程缺陷 | §7.2 [Symbol.iterator] / §7.3-⑦ |
| **P0** | SUP_SET_ITER_002 | `[Symbol.iterator]` 10200011 绑定错误 | ❌ 测试缺口 | §7.2 [Symbol.iterator] |
| **P0** | SUP_SET_ITER_003 | `[Symbol.iterator]` 在 .ets 直接方法调用边界（`for...of` vs `set[Symbol.iterator]()`） | ❌ 测试缺口 | §7.2 [Symbol.iterator] / §7.4-5 |
| **P1** | SUP_SET_ADD_001 | `add` 返回值引用身份断言（`=== set` 替换 `assertDeepEquals`） | ⚠️ 弱断言 | §7.2 add / §7.3-① |
| **P1** | SUP_SET_DUP_001 | TaskPool 套件新增并发修改（10200201）场景，与 Normal 区分 | ⚠️ 覆盖效率 | §7.3-⑧ |
| **P1** | SUP_SET_ITER_004 | `for...of` 迭代中修改 Set 行为锁定 | ❌ 测试缺口 | §7.3-③ |
| **P2** | SUP_SET_CTOR_001 | constructor 重载② 接受通用 `Iterable<T>`（生成器/自定义） | ⚠️ 边界缺口 | §7.2 constructor② / §7.3-④ |
| **P2** | SUP_SET_401_001 | `add/has/delete` 受限绕过类型探针（`undefined as T`） | ⚠️ 防御性观测 | §7.4-① |
| **P2** | SUP_SET_401_002 | `forEach` 受限绕过回调探针（`null as unknown as cb`） | ⚠️ 防御性观测 | §7.4-① |

> **优先级口径**：P0 = 契约声明存在但零覆盖，或文件错位致用例计数虚高；P1 = 已覆盖但断言弱于契约，或核心跨线程契约在重复套件中缺位；P2 = 边界场景/防御性观测，非接口契约必需。

---

## 附：测试逻辑分类口径说明

| # | 分类 | 口径定义 |
|---|---|---|
| ① | 入参范围覆盖 | 对接口入参的不同合法类型/取值枚举测试（number/string/boolean/BigInt/emoji/特殊字符/@Sendable 类/嵌套集合/AsyncLock 等）。 |
| ② | 边界值测试 | 空 Set、空串、null、undefined、单元素、NaN、±0、±Infinity、MAX_SAFE_INTEGER、超长串、1024 容量边界等极值与退化输入。 |
| ③ | 异常与非法输入 | 10200011（非 sendable 绑定）、10200012（构造直接调用）、10200201（并发修改）、回调抛错、非 sendable 函数元素等错误码与非法路径。 |
| ④ | 返回值与类型验证 | 返回值类型/值断言（boolean、this 链式、IterableIterator、void、size 数字）、instanceof、key===value 不变式、迭代器等价性。 |
| ⑤ | 组合场景 | 多接口序列联动（add→has、delete→clear、for...of 中 delete、链式 add、keys/values 一致、Array 构造器配合、break 终止）。 |
| ⑥ | 重复调用幂等性 | 重复 add 不增 size、重复 delete→false、重复 clear、多次增删同元素 size 不漂移、多次迭代器独立。 |
| ⑦ | 并发跨线程 | Worker/TaskPool 共享、并发只读遍历、并发修改触发 10200201 并恢复、AsyncLock 元素、跨线程引用传递。 |
