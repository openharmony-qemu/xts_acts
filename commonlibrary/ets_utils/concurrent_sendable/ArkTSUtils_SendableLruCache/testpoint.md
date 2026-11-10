# SendableLruCache 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/ArkTSUtils_SendableLruCache/entry/src/ohosTest/ets/test/`（递归含 `SendableLruCacheBase/`、`SendableLruCacheConcurrent/` 子目录）下 **32** 个 `*.test.ets`（含 1 聚合器 `List.test.ets`），共解析 **470** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.utils.d.ets` **L580–L791**（`@Sendable class SendableLruCache<K, V>`）。
> **文档来源**：`docs/en/application-dev/reference/apis-arkts/arkts-apis-arkts-utils-SendableLruCache.md`（仓库内同名列文件 `test/.../apis-arkts/arkts-apis-arkts-utils-SendableLruCache.md`）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
ArkTSUtils.SendableLruCache<K, V>   (@Sendable, @since 18, @atomicservice, @crossplatform since 22)
├── 1. 接口测试
│   ├── constructor(capacity?)     （默认 64 / max 2147483647 / ≤0 抛异常 / 容量 1 边界）
│   ├── length (readonly)          （随 put/remove/clear/eviction 增减）
│   ├── updateCapacity(n)          （扩容/缩容，缩容触发 LRU 淘汰，≤0/NaN 抛异常→401）
│   ├── getCapacity()              （取当前容量）
│   ├── get(key)                   （命中→值+matchCount++；未命中→createDefault 钩子）
│   ├── put(key, value)            （返回 value，超容淘汰 LRU，putCount++）
│   ├── remove(key)                （返回值或 undefined；不累加 getRemoveCount）
│   ├── contains(key)             （存在性 boolean；刷新 LRU 位置）
│   ├── clear()                    （清空条目，保留统计计数器）
│   ├── isEmpty()                  （length===0）
│   ├── toString()                 （固定格式 maxSize/hits/misses/hitRate）
│   ├── keys() / values()          （K[]/V[]，LRU 访问序，快照独立）
│   ├── entries()                  （IterableIterator<[K,V]>，独立迭代器）
│   ├── getCreateCount()           （createDefault 返回非 undefined 次数）
│   ├── getMissCount()             （查询未命中次数）
│   ├── getMatchCount()            （查询命中次数）
│   ├── getRemoveCount()           （LRU 淘汰次数，非手动 remove）
│   ├── getPutCount()              （put 调用次数）
│   └── createDefault(key) 钩子     （子类可覆写，未命中 get 时调用，非声明成员）
├── 2. 稳定性                  （1000 次 put 压测、1000 容量大缓存、1024 边界、内存泄漏长跑）
├── 3. 性能                    （1000 TaskPool 并发 put/get 压测、100×100 迭代）
├── 4. 并发安全                 （TaskPool/Worker 跨线程、AsyncLock 串行化、读写隔离、容量 1 边界并发）
├── 5. 兼容性与继承            （子类化、createDefault 覆写、instanceof、多态、与 collections.Map 对比）
└── 6. 资料与文档符合性         （@Sendable/@Concurrent 装饰、import、泛型 Sendable 约束、无 forEach/Symbol.iterator 契约符合性）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件（相对 test/） | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | SendableLruCacheConstructor.test.ets | 12 | constructor（默认/边界/异常）+ updateCapacity（0/NaN/2147483647/1） |
| 2 | SendableLruCacheCreateDefault.test.ets | 12 | createDefault 钩子 + LRU 淘汰序（put/get/contains/updateCapacity 触发） |
| 3 | SendableLruCacheLengthEmpty.test.ets | 27 | length / isEmpty / 空缓存边界 / 重复幂等 / 键边界 |
| 4 | SendableLruCacheContains.test.ets | 9 | contains（存在性 + remove 后 false） |
| 5 | SendableLruCacheCapacity.test.ets | 12 | updateCapacity / getCapacity（含负数/小数异常） |
| 6 | SendableLruCacheRemove.test.ets | 8 | remove（返回值/缺失/返回类型） |
| 7 | SendableLruCacheGet.test.ets | 10 | get（命中/未命中/空串键/返回类型） |
| 8 | SendableLruCacheConcurrent.test.ets | 33 | 并发（combine/worker/taskpool/concurrent 全 API）+ 401（ctor/updateCapacity） |
| 9 | SendableLruCachePut.test.ets | 16 | put（返回值/覆盖/null-undefined 拒绝/LRU 序/值边界/同值幂等） |
| 10 | SendableLruCacheClear.test.ets | 10 | clear（清空 + 统计计数器保留语义） |
| 11 | SendableLruCacheToStringEntries.test.ets | 10 | toString / entries（格式 + 迭代器） |
| 12 | SendableLruCacheCounts.test.ets | 27 | getCreateCount/getMissCount/getRemoveCount/getMatchCount/getPutCount（5×5+2） |
| 13 | SendableLruCacheKeysValues.test.ets | 10 | keys / values（5+5） |
| 14 | SendableLruCacheBase/SendableLruCacheBasicTypes.test.ets | 19 | 全 19 接口 × 基础类型矩阵 |
| 15 | SendableLruCacheBase/SendableLruCacheBoundaryCases.test.ets | 19 | 全 19 接口 × 4 类边界值矩阵 |
| 16 | SendableLruCacheBase/SendableLruCacheComplexTypes.test.ets | 19 | 全 19 接口 × 9 类复合类型矩阵 |
| 17 | SendableLruCacheBase/SendableLruCacheError.test.ets | 8 | keys/values/entries 快照独立性（命名含 10200201，实为快照语义） |
| 18 | SendableLruCacheBase/SendableLruCacheSpecial.test.ets | 60 | LRU 淘汰/容量/统计/entries-keys-values/继承/sendable/与 Map 对比 |
| 19 | SendableLruCacheBase/SendableLruCacheNullableTest.test.ets | 12 | nullable 类型 + null/undefined 拒绝后恢复 |
| 20 | SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch1.test.ets | 20 | 全 19 接口 × 6 类 Sendable 类型 + 引用相异性 |
| 21 | SendableLruCacheBase/Typetest/SendableLruCacheBigintTest.test.ets | 5 | bigint 键值（边界/snowflake/统计） |
| 22 | SendableLruCacheBase/Typetest/SendableLruCacheBooleanTest.test.ets | 5 | boolean 键值（覆盖/淘汰/统计） |
| 23 | SendableLruCacheBase/Typetest/SendableLruCacheConcurrencyTest.test.ets | 3 | 跨 Worker 顺序/并发写者一致性/字段保留 |
| 24 | SendableLruCacheBase/Typetest/SendableLruCacheNonSendableTest.test.ets | 5 | 非 Sendable 拒绝（object/fn/Map/Set/Date/RegExp） |
| 25 | SendableLruCacheBase/Typetest/SendableLruCacheNumberTest.test.ets | 7 | number 键值（NaN/-0/淘汰/统计/容量异常/createDefault） |
| 26 | SendableLruCacheBase/Typetest/SendableLruCacheSendableTest.test.ets | 6 | Sendable 对象键值（引用相等/淘汰/容量=size 边界） |
| 27 | SendableLruCacheBase/Typetest/SendableLruCacheStringTest.test.ets | 7 | string 键值（空串/unicode/特殊字符/统计/createDefault） |
| 28 | SendableLruCacheBase/Typetest/SendableLruCacheUnionTest.test.ets | 6 | 联合类型键值（混合/null 拒绝/emoji/统计） |
| 29 | SendableLruCacheConcurrent/SendableLruCacheConcurrent.test.ets | 43 | 深度并发（put/get/remove/contains/entries/keys/values/capacity/stat/sendable/pressure/worker） |
| 30 | SendableLruCacheConcurrent/SendableLruCacheExpand1024Test.test.ets | 18 | 1024 容量边界（填充/淘汰/扩缩容/NaN±0/Sendable 键/TaskPool） |
| 31 | SendableLruCacheConcurrent/SendableExpand1024Test.test.ets | 12 | Sendable 1025 属性对象跨线程稳定性（非 LruCache 专用，辅助） |
| | **合计** | **470** | 19 接口 + createDefault 钩子 + LRU 淘汰行为维度 |

**去重删除（3）**：`SendableLruCacheSendableSpecial/Batch2.test.ets`、`Batch3.test.ets`、`Batch4.test.ets`（各原 19 例，与 `Batch1.test.ets` 套件内确定重复，去重后删除；`Batch1` 保留为规范）。另：`SendableLruCacheLengthEmpty.test.ets`（−1）、`SendableLruCacheRemove.test.ets`（−1）各移除 1 例套件内确定重复。

**已排除**：`List.test.ets`（聚合 re-export，0 条 `@tc.name`）、`Util.ets`/`Utils.ets`/`utils/TestUtils.ets`（工具/辅助类，0 条用例）、`SharedLock.ets`/`SendableLruCacheHelpers.ets`/`SendableLruCache.ets`/`SendableLruCacheConcurrent/SendableLruCacheWorker.ets`/`.../SendableExpand1024Model.ets`/`.../SendableLruCacheExpandCfg.ets`（helper/model/cfg，非 `it()` 用例产出）。以上均不产出测试点。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/矩阵/并发文件」标注用例位置；编号段取自解析结果（`@tc.number` 末 4 位段号）。矩阵类文件（BasicTypes/BoundaryCases/ComplexTypes/Batch1）每文件固定 19 例（去重前含 Batch1-4，Batch2/3/4 已删除），覆盖全 19 接口一遍，下称「19-接口矩阵」。

## 1.1 constructor(capacity?: number)

```
constructor
├── 入参范围覆盖
│   ├── 无参（默认 64）
│   ├── 正整数 1/10/100/1000/2147483647
│   ├── number|string 联合泛型
│   └── 子类 super(capacity)
├── 边界值测试
│   ├── capacity=1（最小有效，仅留 1 条）
│   ├── capacity=2147483647（最大）
│   ├── capacity=0
│   ├── 负数
│   ├── 小数 0.1/-0.1
│   ├── NaN
│   └── Infinity
├── 异常与非法输入
│   └── ≤0 / NaN / Infinity / 小数 → 抛异常（Special/Concurrent 断言 401；Constructor 仅断言"抛异常"）
├── 返回值与类型验证
│   ├── instanceof ArkTSUtils.SendableLruCache
│   ├── getCapacity()==capacity
│   ├── 空构造 length=0
│   └── isEmpty()=true
├── 组合场景
│   ├── 构造后立即 put
│   ├── 子类 super 传 capacity
│   └── 构造后 toString/entries 可用
├── 重复调用幂等性
│   └── 相同 capacity 多次构造结果一致
└── 并发跨线程
    ├── 子类构造体跨 TaskPool（taskPoolAllApisTest 内构造）
    └── Worker 接收构造
```
- **用例位置**：专用 `SendableLruCacheConstructor.test.ets`（12 例：`CONSTRUCTOR_0001~0012`，含 capacity=1/2147483647/0/-5/NaN/Infinity/0.1/-0.1 + updateCapacity 边界）+ `Special`（`L_0500~0800` 默认/自定义/1/1000 + `L_1000/1100` 0/负数→401 + `L_1900` ReturnValues 含 ctor/401）+ `Concurrent_0032`（ctor(0)→401）+ 19-接口矩阵（每文件第 19 例 `...ConstructorAllValues0019`，4 份：Basic/Boundary/Complex/Batch1）+ `Typetest/*`（每文件 0001 例 ctor+getCapacity+isEmpty，7 份）+ `Nullable_1500`（nullable 泛型 ctor）+ 继承 `Special_L4600~5200`/`Concurrent_0001~0004`（子类 super 构造）。
- **测了哪些**：默认容量 64 / 最大 2147483647 / 最小 1 / ≤0·NaN·Infinity·小数抛异常（401 部分断言）/ 全类型键值构造矩阵 / 子类 super 传参；**constructor 的 401 仅在 capacity≤0 路径测**（.d.ets 未声明 @throws，.md 未列 ctor 错误码表，⚠️ 文档缺口，见 §7.4）。

## 1.2 length（readonly 属性）

```
length
├── 入参范围覆盖
│   └── 随 number/string/boolean/bigint/Sendable/联合 等全类型键的 put/remove 变化
├── 边界值测试
│   ├── 空缓存 length=0
│   ├── 单元素
│   ├── capacity=1 仅留 1 条
│   ├── 1000 容量大缓存
│   └── 1024 边界
├── 异常与非法输入
│   └── （无直接异常用例，length 为只读属性，无独立抛错契约）
├── 返回值与类型验证
│   ├── number 类型
│   ├── put++/remove--/clear→0
│   └── 淘汰后正确衰减
├── 组合场景
│   ├── put→remove→clear 链中持续校验 length
│   └── putCount==累计 put 次数
├── 重复调用幂等性
│   ├── 重复 put 同键 length 不变
│   ├── 重复 remove 不再衰减
│   └── 重复 clear 保持 0
└── 并发跨线程
    ├── TaskPool 多写者下 length 一致性
    └── 跨线程读取 length
```
- **用例位置**：无独立 LengthTest 文件；专用 `SendableLruCacheLengthEmpty.test.ets`（前 5 例 `LENGTH_EMPTY_0001~0005` length 随增删）+ 19-接口矩阵每文件第 9 例 `...LengthAllValues0009`（4 份）+ `Special_L0100~0400`（淘汰/重复 put 不增 length）+ 散落 length 断言（`Constructor_0011/0012` capacity=1/shrink→length=1、`Clear_*` length→0、`Counts_*`、`KeysValues_*`、`Concurrent_T_0200` length<=10 等）。
- **测了哪些**：length 随各类键增删/淘汰/清空的正确性 + 大容量/1024 边界 + 并发一致性；**无独立异常用例**（只读属性，无 @throws 契约）。

## 1.3 updateCapacity(newCapacity: number)

```
updateCapacity
├── 入参范围覆盖
│   ├── 正整数扩容/缩容
│   └── 10/20/50/100/2147483646/2147483647
├── 边界值测试
│   ├── 缩容到 1（仅留最近 1 条）
│   ├── 缩容触发 LRU 顺序淘汰
│   └── 1023→1024→1025 边界
├── 异常与非法输入
│   └── 0/负数/NaN/小数 → 抛 401（Concurrent_0033/Special_L1000~1100 断言 401；Capacity 仅断言"抛异常"）
├── 返回值与类型验证
│   ├── void
│   ├── getCapacity()==newCapacity
│   └── 缩容后 length<=newCapacity
├── 组合场景
│   ├── 扩容后继续 put 不淘汰
│   ├── 缩容后保留最近条目
│   └── 与 get/remove 联动
├── 重复调用幂等性
│   ├── 重复相同 capacity 不变
│   └── 连续多次 updateCapacity
└── 并发跨线程
    ├── 多线程并发 updateCapacity（Concurrent_T_0100~0500/Y_0100~0500）
    └── 1024 边界并发 updateCapacity
```
- **用例位置**：专用 `SendableLruCacheCapacity.test.ets`（12 例：`CAPACITY_0001~0012`，含 10/20/50/100/2147483646/2/-20/50.5 异常）+ `Constructor_0008~0010/0012`（0/NaN/2147483647/1 缩容）+ `Special_L0900`（运行时改容量）+ `Concurrent_0033`（updateCapacity(-5)→401）+ `Concurrent/Y_0100~0500`（并发 updateCapacity 5 例）+ 19-接口矩阵每文件第 11 例（4 份）+ `Expand1024_EXP_LRU_002/006/007/016`（边界/扩容/边界扩容/并发 updateCapacity）。
- **测了哪些**：扩缩容语义 + 缩容 LRU 淘汰 + 0/负/NaN/小数→401 + 并发 updateCapacity + 1024 边界；**401 在 .md 已声明**（仅此成员有错误码表），测试侧断言对齐。

## 1.4 getCapacity()

```
getCapacity
├── 入参范围覆盖
│   └── （无参，随构造/updateCapacity 后取值）
├── 边界值测试
│   ├── 默认 64
│   ├── 1
│   ├── 1000
│   └── 2147483647
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── number
│   ├── ==构造值/==updateCapacity 值
│   └── clear 不影响 capacity
├── 组合场景
│   └── put/get/remove/clear 后 capacity 不变（仅 updateCapacity 改变）
├── 重复调用幂等性
│   └── 连续多次 getCapacity 一致
└── 并发跨线程
    ├── 跨线程 getCapacity
    └── 并发 updateCapacity 后 getCapacity
```
- **用例位置**：专用 `SendableLruCacheCapacity.test.ets`（5 例 `CAPACITY_0006~0010` getCapacity 取值）+ 19-接口矩阵每文件第 10 例（4 份）+ `Typetest/*`（每文件 0001 例含 getCapacity，7 份）+ 散落（`Constructor_0003/0009`、`Special_L0500~0800`、`Clear_006` clear 不影响 capacity）。
- **测了哪些**：默认/自定义/最大容量取值 + clear/put 不影响 capacity + 并发取值；**无 @throws，无缺口**。

## 1.5 get(key)

```
get
├── 入参范围覆盖
│   └── number/string/boolean/bigint/Sendable/联合/空串/unicode/emoji/特殊字符 键取值
├── 边界值测试
│   ├── 空缓存 get→undefined
│   ├── 单元素
│   ├── capacity=1
│   ├── 1000 大缓存
│   └── 缺失键
├── 异常与非法输入
│   └── null/undefined 键被拒（put 路径间接；get(null) 行为见 NonSendable/Nullable）
├── 返回值与类型验证
│   ├── 命中→值+matchCount++
│   ├── 缺失→createDefault 钩子（非 undefined 则入缓存+createCount++，否则 undefined+missCount++）
│   ├── BigInt≠Number
│   ├── -0/+0
│   └── 返回类型 V|undefined
├── 组合场景
│   ├── put→get
│   ├── remove→get→undefined
│   ├── clear→get→undefined
│   └── updateCapacity 后 get
├── 重复调用幂等性
│   ├── 同键多次 get 一致
│   └── 重复 get 累加 matchCount
└── 并发跨线程
    ├── 跨 TaskPool/Worker 传递后 get
    └── 并发 get 同键/不同键/缺失键
```
- **用例位置**：专用 `SendableLruCacheGet.test.ets`（10 例：`GET_0001~0007` + 空串键 + 返回类型）+ 19-接口矩阵每文件第 2 例 `...GetAllValues0002`（4 份）+ `Special_L6000`（get 提升 LRU 位置）+ `Counts_GETMISS/MATCH`（未命中/命中计数）+ `CreateDefault_0001~0004`（createDefault 钩子语义）+ `Typetest/*` 0002 例（7 份，含 NaN/-0）+ `Concurrent_Get_0100~0300`（并发 get）+ `Empty_0024` 空 get→undefined。
- **测了哪些**：全类型键取值 + createDefault 钩子 + match/miss 计数 + LRU 位置提升 + 并发读；**get 的 401 detached/bind 未测**（.d.ets 未声明 @throws，见 §7.2）。

## 1.6 put(key, value)

```
put
├── 入参范围覆盖
│   ├── number|string|boolean|bigint|Sendable|联合 键值
│   ├── 同键覆盖
│   └── 不同键同值
├── 边界值测试
│   ├── value=0/MAX_SAFE/MIN_SAFE/-0
│   ├── capacity=1/2/1024
│   ├── 超容淘汰 LRU
│   └── 1025th 淘汰
├── 异常与非法输入
│   ├── null/undefined key 或 value → 拒绝（断言 message）
│   └── 非 Sendable 值→运行错误
├── 返回值与类型验证
│   ├── 返回 value
│   ├── 覆盖返回新 value
│   ├── putCount++
│   └── 超容淘汰触发 getRemoveCount++
├── 组合场景
│   ├── put 覆盖刷新 LRU 位置（Put_0009）
│   ├── put→get/contains/keys/values 联动
│   └── updateCapacity 后 put
├── 重复调用幂等性
│   ├── 重复 put 同键 length 不增
│   ├── putCount 累加
│   └── 返回最新 value
└── 并发跨线程
    ├── 并发 put 同键/不同键/超容淘汰
    ├── Worker 并发 put
    └── AsyncLock 串行 put
```
- **用例位置**：专用 `SendableLruCachePut.test.ets`（16 例：`PUT_0001~0008` 基础+null/undefined 拒绝 + `PUT_0009` LRU 序 + `PUT_0010~0016` 值边界/同值幂等）+ 19-接口矩阵每文件第 1 例（4 份）+ `Special_L0100/0200/0400/6100`（淘汰/访问序/重复 put/put 提升 LRU）+ `Typetest/*` 0002 例（7 份）+ `Concurrent_Put_0100~0300/E_0100~0300`（并发 put）+ `Expand1024_EXP_LRU_004/005/018`（1025th 淘汰/计数/重复键）。
- **测了哪些**：返回 value 语义 + null/undefined 拒绝 + LRU 位置刷新 + 超容淘汰 + 全类型矩阵 + 值边界 + 并发写；**put 的 401 未测**（.d.ets 未声明 @throws，见 §7.2）。

## 1.7 remove(key)

```
remove
├── 入参范围覆盖
│   └── number/string/boolean/bigint/Sendable/联合 键移除
├── 边界值测试
│   ├── 空缓存 remove→undefined
│   ├── 单元素
│   ├── 首/末元素
│   └── 删全后空
├── 异常与非法输入
│   ├── null key 抛错（.md 注明"throws an error if null is passed in for key"）
│   └── 非 Sendable key→miss 语义
├── 返回值与类型验证
│   ├── 存在→返回旧值
│   ├── 缺失→undefined
│   ├── 返回类型 V|undefined
│   └── **不累加 getRemoveCount**（ClearStats_0010）
├── 组合场景
│   ├── remove→contains→false/get→undefined
│   ├── remove→重加
│   └── remove 后 length--
├── 重复调用幂等性
│   ├── remove 两次第二次 undefined
│   └── 循环 remove
└── 并发跨线程
    ├── 并发 remove 同键/不同键
    └── 原子性校验
```
- **用例位置**：专用 `SendableLruCacheRemove.test.ets`（8 例：`REMOVE_0001~0008`）+ 19-接口矩阵每文件第 3 例（4 份）+ `Special_L6200`（remove 不改其余相对访问序）+ `Counts_GETREMOVE`（5 例）+ `Clear_0010`（手动 remove 不累加 getRemoveCount）+ `Typetest/*` 0002 例（7 份含 remove）+ `Concurrent_Remove_E_0100~0200`（并发 remove）。
- **测了哪些**：返回旧值/undefined + 不累加 eviction 计数 + 全类型 + 并发原子性；**null key 抛错契约 .md 已声明但 .d.ets 无 @throws，且测试未直接断言 null key 抛错**（见 §7.2/§7.4）。

## 1.8 contains(key)

```
contains
├── 入参范围覆盖
│   └── number/string/boolean/bigint/Sendable/联合 键存在性
├── 边界值测试
│   ├── 空缓存→false
│   ├── 单元素
│   └── 删后→false
├── 异常与非法输入
│   └── 非 Sendable key→false（miss 语义，NonSendable_0005）
├── 返回值与类型验证
│   └── boolean true/false
├── 组合场景
│   ├── put→contains→true
│   ├── remove→false
│   └── contains 刷新 LRU 位置（EvictOrder_003）
├── 重复调用幂等性
│   ├── 同键多次 contains 一致
│   └── 重复 contains 累加 matchCount（Repeat_002）
└── 并发跨线程
    └── 并发 contains 查询（Concurrent_S_0100）
```
- **用例位置**：专用 `SendableLruCacheContains.test.ets`（9 例：`CONTAINS_0001~0008` + remove 后 false）+ 19-接口矩阵每文件第 4 例（4 份）+ `Special_L2700/3000`（keys 联动/唯一）+ `Typetest/*` 0002 例（7 份含 contains）+ `Concurrent_Contains_S_0100`（并发 contains）+ `Empty_0026` 空→false + `Repeat_0019` 重复 contains 累加 matchCount。
- **测了哪些**：全类型存在性 + LRU 位置刷新 + 增删后一致性 + 并发查询 + matchCount 累加；**contains 的 401 未测**（.d.ets 无 @throws）。

## 1.9 clear()

```
clear
├── 入参范围覆盖
│   └── （无参，对各类键值缓存 clear）
├── 边界值测试
│   ├── 空缓存 clear 无副作用
│   ├── 单元素
│   ├── 多元素
│   └── capacity 不变
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── void
│   ├── length→0
│   ├── isEmpty→true
│   └── keys/values/entries 空
├── 组合场景
│   ├── clear→has/get→false/undefined
│   ├── clear 后再 put 再 clear
│   └── **统计计数器保留不重置**（ClearStats_0001~0005）
├── 重复调用幂等性
│   ├── 连续多次 clear
│   └── clear 后 remove 无效
└── 并发跨线程
    └── 并发 clear + 统计查询（Concurrent_T_0400~0500）
```
- **用例位置**：专用 `SendableLruCacheClear.test.ets`（10 例：`CLEAR_0001~0005` 基础 + `CLEAR_0006~0010` 统计计数器保留/getRemoveCount 仅淘汰累加）+ 19-接口矩阵每文件第 5 例（4 份）+ `Special_L6300`（clear 重置访问序）+ `Typetest/*` 0004 例（7 份含 clear）+ `Concurrent_StatClear_T_0400~0500`（并发 clear）。
- **测了哪些**：void 返回 + length/迭代器清空 + **统计计数器保留语义**（putCount/matchCount/missCount/removeCount/createCount 不重置）+ getRemoveCount 仅计淘汰；**关键语义覆盖充分，无 @throws 无缺口**。

## 1.10 isEmpty()

```
isEmpty
├── 入参范围覆盖
│   └── （无参，随状态变化）
├── 边界值测试
│   ├── 新缓存→true
│   ├── put 后→false
│   ├── remove 到空→true
│   └── clear→true
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   └── boolean
├── 组合场景
│   ├── put→false
│   ├── remove→true
│   ├── clear→true
│   └── updateCapacity 不影响
├── 重复调用幂等性
│   └── 连续多次 isEmpty 一致
└── 并发跨线程
    └── 并发操作下 isEmpty
```
- **用例位置**：专用 `SendableLruCacheLengthEmpty.test.ets`（`LENGTH_EMPTY_0006~0010` isEmpty 5 例 + `0023` 新缓存→true）+ 19-接口矩阵每文件第 12 例（4 份）+ `Typetest/*` 0001 例（7 份含 isEmpty）+ 散落（`Constructor_*`、`Clear_*`、`Concurrent_*`）。
- **测了哪些**：空/非空状态转换 + 全类型矩阵 + clear 后 true；**无 @throws 无缺口**。

## 1.11 toString()

```
toString
├── 入参范围覆盖
│   └── （无参，随统计状态变化）
├── 边界值测试
│   ├── 空缓存格式
│   └── 含命中/未命中后的格式
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── string
│   ├── 格式 `SendableLruCache[ maxSize = X, hits = Y, misses = Z, hitRate = W% ]`
│   └── 含子串校验
├── 组合场景
│   ├── put/get 后 toString 反映 hits/misses
│   └── clear 后 toString 不变（计数器保留 Clear_0009）
├── 重复调用幂等性
│   └── 连续多次 toString 一致
└── 并发跨线程
    ├── 跨线程 toString
    └── 并发操作后 toString
```
- **用例位置**：专用 `SendableLruCacheToStringEntries.test.ets`（`TO_STRING_ENTRIES_0001~0005` toString 5 例）+ `Empty_0014`（空缓存格式）+ `Clear_0009`（clear 后 toString 不变）+ 19-接口矩阵每文件第 13 例（4 份）+ `Typetest/*` 0005 例（boolean/number/string 含 toString）+ `Concurrent_Combine_003`（子类覆写 toString）+ 散落（`taskPoolAllApisTest`、`Concurrent_0050/0060` hits=99/maxSize=364 断言）。
- **测了哪些**：固定格式 + maxSize/hits/misses/hitRate 字段 + clear 后不变（计数器保留）+ 子类覆写 + 跨线程；**无 @throws 无缺口**。

## 1.12 keys()

```
keys
├── 入参范围覆盖
│   └── number/string/boolean/bigint/Sendable/联合 键返回
├── 边界值测试
│   ├── 空缓存→[]
│   ├── 单元素
│   ├── 多元素
│   └── 1024 边界
├── 异常与非法输入
│   └── （无 @throws；快照独立性见 Error 文件，命名含 10200201 实为快照语义）
├── 返回值与类型验证
│   ├── K[]（数组，非 IterableIterator）
│   ├── LRU 访问序
│   ├── 唯一无重复
│   └── 快照独立（修改缓存不影响已返回数组）
├── 组合场景
│   ├── 与 get/contains 一致性
│   ├── put/remove 后 keys 反映
│   └── 与 collections.Map.keys() 对比（Special_L5500 Map 返回迭代器、LRU 返回数组）
├── 重复调用幂等性
│   └── 多次 keys() 各得新数组
└── 并发跨线程
    ├── 并发 keys 迭代（Concurrent_S_0100~0200）
    └── 跨线程 keys
```
- **用例位置**：专用 `SendableLruCacheKeysValues.test.ets`（`KEYS_VALUES_0001~0005` keys 5 例）+ 19-接口矩阵每文件第 7 例（4 份）+ `Special_L2500~3200`（number/string/boolean/访问序/唯一/空）+ `Error_R_0800/1100/1300`（快照独立性）+ `Typetest/*` 0004 例（7 份含 keys 序）+ `Concurrent_Keys_S_0100~0200`（并发 keys）+ `Expand1024_EXP_LRU_011/012`（长串/emoji键保留）。
- **测了哪些**：K[] 数组类型 + LRU 访问序 + 快照独立 + 全类型 + 与 Map.keys() 迭代器差异对比 + 并发；**无 @throws，快照语义有间接覆盖但无 10200201 抛错契约**（见 §7.2）。

## 1.13 values()

```
values
├── 入参范围覆盖
│   └── number/string/Sendable/collections.Array/SendableClass 值返回
├── 边界值测试
│   ├── 空缓存→[]
│   ├── 单元素
│   ├── 多元素
│   └── 1024 边界
├── 异常与非法输入
│   └── （无 @throws；快照独立性见 Error 文件）
├── 返回值与类型验证
│   ├── V[]（数组）
│   ├── LRU 访问序（most→least recently used）
│   ├── 快照独立
│   └── 含重复值（同值不同键）
├── 组合场景
│   ├── 与 get/keys 一致性
│   ├── put/remove 后 values 反映
│   └── 与 Map.values() 对比（Special_L5600）
├── 重复调用幂等性
│   └── 多次 values() 各得新数组
└── 并发跨线程
    └── 并发 values 迭代（Concurrent_S_0100~0200）
```
- **用例位置**：专用 `SendableLruCacheKeysValues.test.ets`（`KEYS_VALUES_0006~0010` values 5 例）+ 19-接口矩阵每文件第 8 例（4 份）+ `Special_L3300~3900`（number/string/object/array/SendableClass/访问序/空）+ `Error_R_0900/1200/1400`（快照独立性）+ `Typetest/*` 0004 例（7 份含 values 序）+ `Concurrent_Values_S_0100~0200`（并发 values）+ `Put_0014`（同值不同键 values 含重复）。
- **测了哪些**：V[] 数组类型 + LRU 访问序 + 快照独立 + 全类型 + 重复值 + 与 Map.values() 差异 + 并发；**无 @throws**。

## 1.14 entries()

```
entries
├── 入参范围覆盖
│   └── number/string/Sendable/nested LruCache 键值对返回
├── 边界值测试
│   ├── 空缓存→迭代器立即 done
│   ├── 单对
│   ├── 多对
│   └── 1024 边界
├── 异常与非法输入
│   └── （无 @throws；get 不影响迭代器见 Error_R_1000）
├── 返回值与类型验证
│   ├── IterableIterator<[K,V]>
│   ├── 含 next()
│   ├── 每次返回新迭代器
│   └── for...of/Array.from 可消费
├── 组合场景
│   ├── 与 get/forEach 一致性
│   ├── put/remove 后新迭代器反映
│   └── 与 Map.entries() 对比（Special_L5700 同为迭代器）
├── 重复调用幂等性
│   ├── 多次 entries() 各得新迭代器
│   └── 可重复遍历
└── 并发跨线程
    └── 并发 entries 迭代（Concurrent_S_0100~0200）
```
- **用例位置**：专用 `SendableLruCacheToStringEntries.test.ets`（`TO_STRING_ENTRIES_0006~0010` entries 5 例）+ 19-接口矩阵每文件第 6 例（4 份）+ `Special_L1800~2400`（number/for...of/string/SendableClass/nestedMap/多次调用/空）+ `Error_R_1000`（get 不影响迭代器）+ `Typetest/*` 0004 例（7 份含 entries 序）+ `Concurrent_Entries_S_0100~0200`（并发 entries）+ `Empty_0013` 空→无迭代项。
- **测了哪些**：IterableIterator 类型 + for...of/Array.from + 新迭代器语义 + 全类型 + 与 Map.entries() 同为迭代器 + 并发；**无 @throws**。

## 1.15 getCreateCount()

```
getCreateCount
├── 入参范围覆盖
│   └── （无参，随 createDefault 钩子调用变化）
├── 边界值测试
│   ├── 无 createDefault 覆写→始终 0
│   ├── 覆写后未命中 get→++
│   └── 命中 get 不++
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── number
│   └── ==createDefault 返回非 undefined 次数
├── 组合场景
│   ├── createDefault 返回 undefined 不入缓存
│   └── clear 后 createCount 保留累加（Clear_0008）
├── 重复调用幂等性
│   └── 多次未命中 get 累加
└── 并发跨线程
    └── 跨线程 createDefault 钩子（Concurrent_0014 taskPoolCreateDefault）
```
- **用例位置**：专用 `SendableLruCacheCounts.test.ets`（`COUNTS_0001~0005` getCreateCount 5 例）+ `CreateDefault_0001~0004`（钩子语义）+ 19-接口矩阵每文件第 14 例（4 份）+ `Special_L1600`（createDefault 统计）+ `Typetest/Number_0007`、`String_0007`（createDefault 钩子）+ `Clear_0008`（clear 后 createCount 保留）+ `Concurrent_0014`（taskpool createDefault）。
- **测了哪些**：createDefault 钩子触发计数 + 非 undefined 入缓存 + clear 保留 + 跨线程钩子；**无 @throws 无缺口**。

## 1.16 getMissCount()

```
getMissCount
├── 入参范围覆盖
│   └── （无参，随未命中 get 变化）
├── 边界值测试
│   ├── 0 次 get→0
│   ├── 未命中→++
│   └── 命中不++
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   └── number
├── 组合场景
│   └── clear 后 missCount 保留（Clear_0007）
├── 重复调用幂等性
│   └── 多次未命中 get 累加
└── 并发跨线程
    └── 并发 get 缺失键验证 missCount（Concurrent_Get_0300/StatMatch_0200）
```
- **用例位置**：专用 `SendableLruCacheCounts.test.ets`（`COUNTS_0006~0011` getMissCount 6 例）+ 19-接口矩阵每文件第 15 例（4 份）+ `Special_L1400` + `Typetest/*` 0005 例 + `Clear_0007`（clear 后保留）+ `Concurrent_StatMatch_0200`（并发 miss）。
- **测了哪些**：未命中计数 + clear 保留 + 并发；**无 @throws 无缺口**。

## 1.17 getRemoveCount()

```
getRemoveCount
├── 入参范围覆盖
│   └── （无参，随 LRU 淘汰变化）
├── 边界值测试
│   ├── 无淘汰→0
│   ├── 超容淘汰→++
│   └── updateCapacity 缩容淘汰→++
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── number
│   └── ==LRU 淘汰次数（**非手动 remove**，Clear_0010）
├── 组合场景
│   ├── 手动 remove 不累加
│   └── clear 后保留（Clear_0010）
├── 重复调用幂等性
│   └── 多次淘汰累加
└── 并发跨线程
    └── 并发淘汰验证 removeCount（Concurrent_StatRemove_0300）
```
- **用例位置**：专用 `SendableLruCacheCounts.test.ets`（`COUNTS_0012~0016` getRemoveCount 5 例）+ 19-接口矩阵每文件第 17 例（4 份）+ `Special_L1500` + `Typetest/*` 0003 例（淘汰/缩容）+ `Clear_0010`（手动 remove 不累加、仅淘汰）+ `Concurrent_StatRemove_0300`（并发淘汰计数）+ `Expand1024_EXP_LRU_005`（1100 条插入计数淘汰）。
- **测了哪些**：淘汰计数 + 手动 remove 不累加（关键语义）+ clear 保留 + 并发淘汰；**无 @throws 无缺口**。

## 1.18 getMatchCount()

```
getMatchCount
├── 入参范围覆盖
│   └── （无参，随命中 get/contains 变化）
├── 边界值测试
│   ├── 0→0
│   ├── 命中→++
│   └── 未命中不++
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── number
│   └── 命中 get 与 contains 均++（Repeat_0018/0019）
├── 组合场景
│   └── clear 后 matchCount 保留（Clear_0007）
├── 重复调用幂等性
│   └── 多次命中累加
└── 并发跨线程
    └── 并发 get 命中验证 matchCount（Concurrent_StatMatch_0200）
```
- **用例位置**：专用 `SendableLruCacheCounts.test.ets`（`COUNTS_0017~0022` getMatchCount 6 例）+ 19-接口矩阵每文件第 16 例（4 份）+ `Special_L1300` + `Typetest/*` 0005 例 + `Repeat_0018/0019`（重复 get/contains 累加）+ `Clear_0007`（保留）+ `Concurrent_StatMatch_0200`。
- **测了哪些**：命中计数（get+contains 均累加）+ clear 保留 + 并发；**无 @throws 无缺口**。

## 1.19 getPutCount()

```
getPutCount
├── 入参范围覆盖
│   └── （无参，随 put 变化）
├── 边界值测试
│   ├── 0→0
│   └── 每次 put→++（含覆盖/同值）
├── 异常与非法输入
│   └── （无参，无 @throws）
├── 返回值与类型验证
│   ├── number
│   └── ==put 调用次数（覆盖/同值均累加，Put_0015）
├── 组合场景
│   └── clear 后 putCount 保留（Clear_0006/0007）
├── 重复调用幂等性
│   └── 重复 put 同值累加（Put_0015）
└── 并发跨线程
    └── 并发 put 验证 putCount（Concurrent_StatPut_0100/T_0600）
```
- **用例位置**：专用 `SendableLruCacheCounts.test.ets`（`COUNTS_0023~0027` getPutCount 5 例）+ 19-接口矩阵每文件第 18 例（4 份）+ `Special_L1200` + `Typetest/*` 0005 例 + `Put_0015`（重复 put 同值累加）+ `Clear_0006/0007`（保留）+ `Concurrent_StatPut_0100`（并发 put=100）。
- **测了哪些**：put 计数（含覆盖/同值累加）+ clear 保留 + 并发；**无 @throws 无缺口**。

## 1.20 createDefault(key) 钩子（非声明成员，子类可覆写）

```
createDefault (hook)
├── 入参范围覆盖
│   └── 未命中 get(key) 时以 key 为参调用
├── 边界值测试
│   ├── 返回非 undefined→入缓存+createCount++
│   └── 返回 undefined→不入缓存+missCount++
├── 异常与非法输入
│   └── （非声明成员，无独立异常契约）
├── 返回值与类型验证
│   ├── 返回值作为 get 的返回
│   └── 非 undefined 则新增条目
├── 组合场景
│   ├── createDefault 触发淘汰（CreateDefault_0005）
│   └── clear 后再次未命中触发 createDefault 累加（Clear_0008）
├── 重复调用幂等性
│   └── 多次未命中同键均触发
└── 并发跨线程
    └── 跨线程 createDefault 钩子（Concurrent_0014、Typetest/Concurrency）
```
- **用例位置**：专用 `SendableLruCacheCreateDefault.test.ets`（12 例：`CREATE_DEFAULT_0001~0005` 钩子语义 + `EVICT_ORDER_0006~0009` LRU 淘汰序 + `STRESS_0010~0012` 1000 次 put 压测）+ `Helpers`（CreateDefaultLruCache/CreateDefaultUndefinedLruCache 子类）+ `Special_L4700`（子类覆写 createDefault）+ `Typetest/Number_0007`、`String_0007`、`Concurrent_0014`。
- **测了哪些**：createDefault 钩子完整语义（非 undefined 入缓存/createCount++、undefined 不入/missCount++、触发淘汰、clear 后累加、跨线程）；**createDefault 非 .d.ets 声明成员，仅在 .md getCreateCount 示例中以子类覆写形式文档化，⚠️ 文档未独立列出该方法签名**（见 §7.4）。

---

# 2. 稳定性

- **用例位置**：`CreateDefault_STRESS_0010`（capacity-100 缓存 1000 次 put 压测）+ `Expand1024_EXP_LRU_001~005/018`（1024 容量填充/淘汰/1100 插入/重复键）+ `Concurrent_Pressure_E_0100~0400`（1000 TaskPool put、10000 get、大容量 100×100、1000 次迭代内存泄漏长跑）+ `Concurrent_StatAccuracy_T_0600`（200 TaskPool 统计准确性）+ `SendableExpand1024Test`（1025 属性 Sendable 对象跨线程稳定性，辅助）+ 19-接口矩阵 large/复合类型承载。
- **测了哪些**：大规模 put/get 压测 + 1024 边界稳定性 + 长跑内存泄漏检测 + 高并发统计准确性；**未见 500000 超大规模创建销毁用例**（collections.Map 有，LRU 无）。

# 3. 性能

- **用例位置**：`Concurrent_Pressure_E_0100~0300`（1000 TaskPool put、10000 get、100×100 大容量迭代）+ `Concurrent_PressureLargeCapacity_E_0300`（大容量 100×100 put/get）+ `Expand1024_EXP_LRU_005`（1100 条插入计数）+ `Concurrent_StatAccuracy_T_0600`（200 TaskPool）。
- **测了哪些**：高并发吞吐 + 大容量访问 + 统计准确性；**未见单接口基线性能基准（如单次 put/get 微基准）**，性能用例均以并发压测形式存在。

# 4. 并发安全

- **用例位置**：`SendableLruCacheConcurrent.test.ets`（33 例：`CONCURRENT_0001~0016` combine/worker/taskpool/concurrent + `0017~0031` sendable 多场景 + `0032/0033` 401）+ `SendableLruCacheConcurrent/SendableLruCacheConcurrent.test.ets`（43 例：put/get/remove/contains/entries/keys/values/capacity/stat/sendable/pressure/worker 全维度并发）+ `Typetest/ConcurrencyTest`（3 例跨 Worker）+ `Expand1024_EXP_LRU_014~017`（1024 边界并发 TaskPool/读写/updateCapacity）+ `Special_L4100/4200`（@Sendable/@Concurrent 跨 TaskPool）+ 各 19-接口矩阵并发无（矩阵为单线程）。
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + AsyncLock 串行化 + 读写隔离 + 容量 1 边界并发 + 并发淘汰 + 压力测试 + Worker postMessageWithSharedSendable；**关键差异**：SendableLruCache .d.ets **无 @throws 10200201 声明**（与 collections.Map 不同），并发修改不抛并发错误，`SendableLruCacheError.test.ets` 命名含 "10200201" 实为 keys/values **快照独立性**测试（不抛错，🔴 命名误导，见 §7.2/§7.4）。

# 5. 兼容性与继承

- **用例位置**：`SendableLruCacheConcurrent.test.ets`（`CONCURRENT_0002~0004` 子类属性/覆写 toString+contains/覆写 contains）+ `Special_L4600~5200`（子类自定义方法/覆写 createDefault/包装父 API/instanceof/多态/构造继承/泛型继承）+ `CreateDefault_*`（CreateDefaultLruCache/CreateDefaultUndefinedLruCache 子类）+ `Typetest/Concurrency_0001`（跨 Worker 子类）。
- **测了哪些**：子类化 + createDefault 覆写 + instanceof（子类+父类）+ 多态 + super 构造 + 泛型继承 + 跨线程子类引用；**未见二级继承链用例**（collections.Map 有，LRU 无）。

# 6. 资料与文档符合性

- **用例位置**：`Special_L4100~4400`（@Sendable 跨 TaskPool/@Concurrent 装饰/import 解析/泛型 Sendable 约束）+ `Special_L5300/5400`（**SendableLruCache 无 forEach、无 Symbol.iterator 的编译期符合性**）+ `Special_L5500~5900`（与 collections.Map 对比：keys/values 返回数组 vs 迭代器、固定容量 vs 无界、LRU 淘汰 vs 永不淘汰）+ `NonSendable_*`（非 Sendable 拒绝）+ `Nullable_*`（nullable 泛型 + null/undefined 拒绝恢复）。
- **测了哪些**：@Sendable/@Concurrent 装饰 + import + 泛型 Sendable 约束 + **无 forEach/Symbol.iterator 契约符合性** + 与 Map 差异对比 + 非 Sendable 拒绝；**.d.ets 对所有成员均无 @throws 声明**（仅 .md 为 updateCapacity 列 401），constructor capacity≤0 抛 401 但 .md 未列 ctor 错误码表（⚠️ 文档缺口，见 §7.4）；**任务提及的 onRemove 回调在 .d.ets/.md 中均不存在**——LRU 淘汰仅以 getRemoveCount() 计数器为信号，无回调钩子（见 §7.4）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅(矩阵5×19) | ✅(0/1/max/小数/NaN/∞) | ✅(≤0→401/异常) | ✅(instanceof/getCapacity) | ✅(super/子类) | 🟡 | ✅(子类跨线程) |
| length | ✅ | ✅(0/1/1024/1000) | ❌(只读无异常契约) | ✅ | ✅ | ✅ | ✅ |
| updateCapacity | ✅ | ✅(1/1024/缩容淘汰) | ✅(0/负/NaN/小数→401) | ✅(void/getCapacity) | ✅(扩缩容联动) | ✅ | ✅(并发 updateCapacity) |
| getCapacity | ✅ | ✅(默认/1/max) | ❌(无参无 @throws) | ✅(number) | ✅ | ✅ | ✅ |
| get | ✅(矩阵+Typetest) | ✅(空/缺失/1024) | 🟡(null 拒绝间接) | ✅(值/undefined/钩子) | ✅ | ✅ | ✅ |
| put | ✅(矩阵+Typetest) | ✅(值边界/超容淘汰) | ✅(null/undefined 拒绝) | ✅(返回 value) | ✅(LRU 序) | ✅ | ✅ |
| remove | ✅(矩阵+Typetest) | ✅(空/首末) | 🟡(null 抛错未断言) | ✅(旧值/undefined) | ✅ | ✅ | ✅ |
| contains | ✅(矩阵+Typetest) | ✅(空→false) | 🟡(非 Sendable→false 间接) | ✅(boolean) | ✅(LRU 刷新) | ✅ | ✅ |
| clear | ✅ | ✅(空/多元素) | ❌(无参无 @throws) | ✅(void/计数器保留) | ✅ | ✅ | ✅ |
| isEmpty | ✅ | ✅(空/非空) | ❌(无参无 @throws) | ✅(boolean) | ✅ | ✅ | 🟡 |
| toString | ✅ | ✅(空格式) | ❌(无参无 @throws) | ✅(格式/字段) | ✅(clear 后不变) | ✅ | ✅ |
| keys | ✅(矩阵+Typetest) | ✅(空/1024) | 🟡(快照间接,无 10200201) | ✅(K[]/访问序/快照) | ✅(与 Map 对比) | ✅ | ✅ |
| values | ✅(矩阵+Typetest) | ✅(空/1024) | 🟡(快照间接) | ✅(V[]/访问序/快照) | ✅(与 Map 对比) | ✅ | ✅ |
| entries | ✅(矩阵+Typetest) | ✅(空 done/1024) | 🟡(get 不影响间接) | ✅(IterableIterator) | ✅(与 Map 对比) | ✅ | ✅ |
| getCreateCount | ✅ | ✅(钩子触发) | ❌(无参无 @throws) | ✅(number) | ✅(clear 保留) | ✅ | ✅ |
| getMissCount | ✅ | ✅ | ❌(无参无 @throws) | ✅(number) | ✅(clear 保留) | ✅ | ✅ |
| getRemoveCount | ✅ | ✅(淘汰/缩容) | ❌(无参无 @throws) | ✅(仅淘汰非 remove) | ✅(手动 remove 不累加) | ✅ | ✅ |
| getMatchCount | ✅ | ✅ | ❌(无参无 @throws) | ✅(number) | ✅(clear 保留) | ✅ | ✅ |
| getPutCount | ✅ | ✅ | ❌(无参无 @throws) | ✅(number) | ✅(clear 保留) | ✅ | ✅ |
| createDefault 钩子 | ✅ | ✅(undefined/非 undefined) | ❌(非声明成员) | ✅(返回值入缓存) | ✅(触发淘汰/clear 累加) | ✅ | ✅ |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.utils.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论均经实际测试代码逐行复核。
> **关键差异**：与 collections.Map 不同，SendableLruCache `.d.ets` **对所有 19 成员均无 @throws 声明**（仅 .md 为 updateCapacity 列 401 错误码表）；`.d.ets` **无 forEach、无 Symbol.iterator、无 onRemove 回调**。

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `constructor(capacity?: number)` | 默认 64，max 2147483647，≤0 抛异常；.md 注"≤0 抛异常"但**无错误码表**；.d.ets 无 @throws | ✅ 覆盖：默认/边界/异常（Constructor 12 + Special_L0500~1100/1900 + Concurrent_0032 + 4 矩阵 + 7 Typetest）。⚠️ **ctor 401 未在 .md 声明**（Special_L1000/1100/Concurrent_0032 已断言 `error.code===401`，文档侧缺错误码表）。🔴 **Constructor_0004~0007 仅断言"抛异常"未断 code**（与 Special/Concurrent 的 401 断言不一致，弱断言，见 F.1 改造）。 |
| 2 | `length`（readonly） | 只读属性，无 @throws | ✅ 覆盖：随增删/淘汰/clear 变化 + 1024 边界 + 并发一致性。无异常契约，无缺口。 |
| 3 | `updateCapacity(newCapacity)` | .md 列 @throws 401；≤0/NaN 抛 401 | ✅ 覆盖：专用 Capacity 12 + Constructor_0008~0010/0012 + Special_L0900 + Concurrent_0033（断言 401）+ Expand1024 + 4 矩阵 + 并发 5 例。401 已测且 .md 已声明，对齐。✅ 无缺口。 |
| 4 | `getCapacity()` | 无参，无 @throws | ✅ 覆盖：默认/自定义/max 取值 + clear/put 不影响 + 并发。无缺口。 |
| 5 | `get(key)` | .d.ets 无 @throws；.md 注"key 必填" | ✅ 行为覆盖：命中/缺失/createDefault 钩子 + 全类型 + LRU 提升 + 并发。✅ **null key 拒绝已测**（GET_0007 断言 message "The type of null must be Object"）。❌ **401 code 未断言**（GET_0007 仅断 message 不断 `e.code===401`，SUP_LRUCACHE_GET_401_001）；⚠️ .md/.d.ets 均未声明 401。 |
| 6 | `put(key, value)` | .d.ets 无 @throws；.md 注 key/value 必填 | ✅ 覆盖：返回 value + null/undefined 拒绝（PUT_0006~0008 断言 message）+ LRU 序 + 全类型 + 并发。❌ **401 code 未断言**（PUT_0006~0008 仅断 message，SUP_LRUCACHE_PUT_401_001）；⚠️ .md/.d.ets 未声明 401。 |
| 7 | `remove(key)` | .md 注"key 为 null 时抛错"；.d.ets 无 @throws | ✅ 覆盖：返回旧值/undefined + **null key 抛错已测**（REMOVE_0007 断言 message）+ 不累加 getRemoveCount + 全类型 + 并发。❌ **401 code 未断言**（REMOVE_0007 仅断 message，SUP_LRUCACHE_REMOVE_401_001）；⚠️ .md/.d.ets 未声明 401。 |
| 8 | `contains(key)` | .d.ets 无 @throws；.md 注 key 必填 | ✅ 行为覆盖：存在性 + LRU 刷新 + 全类型 + 并发 + matchCount 累加。❌ **contains(null) 完全未测**（get/remove/put null 均已测 message，contains 无，SUP_LRUCACHE_CONTAINS_NULL_001）；❌ 401 code 未断言；⚠️ .md/.d.ets 未声明 401。 |
| 9 | `clear()` | 无参，无 @throws | ✅ 覆盖：void + length→0 + **统计计数器保留语义**（Clear_0006~0010 五例）+ getRemoveCount 仅淘汰 + 并发。✅ 关键语义覆盖充分，无缺口。 |
| 10 | `isEmpty()` | 无参，无 @throws | ✅ 覆盖：空/非空转换 + 全矩阵 + clear 后 true。无缺口。 |
| 11 | `toString()` | .md 注固定格式 maxSize/hits/misses/hitRate | ✅ 覆盖：格式 + 字段 + clear 后不变（计数器保留）+ 子类覆写 + 跨线程。无缺口。 |
| 12 | `keys()` | 返回 K[]（数组）；.d.ets 无 @throws | ✅ 覆盖：K[] 类型 + LRU 访问序 + 快照独立 + 全类型 + 与 Map.keys() 迭代器对比 + 并发。⚠️ **Error_R_0800/1100/1300 命名含 "10200201" 实为快照语义**（不抛错，🔴 命名误导，见 B 组改造）。 |
| 13 | `values()` | 返回 V[]；.d.ets 无 @throws | ✅ 覆盖：V[] 类型 + LRU 访问序 + 快照独立 + 全类型 + 重复值 + 与 Map.values() 对比 + 并发。⚠️ Error_R_0900/1200/1400 同上命名误导。 |
| 14 | `entries()` | 返回 IterableIterator<[K,V]>；.d.ets 无 @throws | ✅ 覆盖：迭代器类型 + for...of/Array.from + 新迭代器 + 全类型 + 与 Map.entries() 对比 + 并发。⚠️ Error_R_1000 命名 "10200201Get" 实为"get 不影响迭代器"快照语义。 |
| 15 | `getCreateCount()` | 无参，无 @throws；.md 示例文档化 createDefault 钩子 | ✅ 覆盖：钩子触发计数 + 非 undefined 入缓存 + clear 保留 + 跨线程。⚠️ **createDefault 非 .d.ets 声明成员**（仅在 .md getCreateCount 示例中以子类覆写文档化，方法签名未独立列出，SUP_LRUCACHE_CREATEDEFAULT_DOC_001）。 |
| 16 | `getMissCount()` | 无参，无 @throws | ✅ 覆盖：未命中计数 + clear 保留 + 并发。无缺口。 |
| 17 | `getRemoveCount()` | 无参，无 @throws；语义=LRU 淘汰次数（非手动 remove） | ✅ 覆盖：淘汰计数 + **手动 remove 不累加**（Clear_0010 关键语义）+ 缩容淘汰 + clear 保留 + 并发。✅ 无缺口。 |
| 18 | `getMatchCount()` | 无参，无 @throws | ✅ 覆盖：命中计数（get+contains 均累加）+ clear 保留 + 并发。无缺口。 |
| 19 | `getPutCount()` | 无参，无 @throws | ✅ 覆盖：put 计数（覆盖/同值累加）+ clear 保留 + 并发。无缺口。 |
| 20 | `createDefault(key)` 钩子 | **非 .d.ets 声明成员**；.md getCreateCount 示例文档化 | ✅ 行为覆盖：非 undefined 入缓存+createCount++/undefined 不入+missCount++/触发淘汰/clear 累加/跨线程。⚠️ **方法签名未在 .md/.d.ets 独立列出**（仅在 getCreateCount 示例代码中出现，SUP_LRUCACHE_CREATEDEFAULT_DOC_001）。 |
| — | `onRemove` 回调 | **任务口径提及，.d.ets/.md 均不存在此成员** | ⚠️ **确认契约无 onRemove 回调钩子**——LRU 淘汰仅以 getRemoveCount() 计数器为信号，无回调通知机制。任务提及系口径偏差，非测试缺口（SUP_LRUCACHE_ONREMOVE_CONFORMANCE_001 符合性证据）。 |
| — | `forEach` / `Symbol.iterator` | .d.ets **无此两成员**（与 collections.Map 不同） | ✅ 覆盖：Special_L5300/5400 编译期符合性证据（LruCache 无 forEach、无 Symbol.iterator）。✅ 契约禁用正确，有符合性证据。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **LRU 淘汰顺序**：(a) put 超容淘汰最久未用（CreateDefault_EvictOrder_001 + Special_L0100）✅；(b) get 刷新位置避免淘汰（EvictOrder_002 + Special_L6000）✅；(c) contains 刷新位置（EvictOrder_003）✅；(d) put 同键覆盖刷新位置（Put_0009 + Special_L6100）✅；(e) updateCapacity 缩容按 LRU 序淘汰（EvictOrder_004 + Special_L0300）✅。✅ 淘汰序全覆盖。

2. **capacity 边界**：(a) 默认 64（Special_L0500）✅；(b) 最小 1（Constructor_0011 + Special_L0700）✅；(c) 最大 2147483647（Constructor_0003/0009）✅；(d) 1024 边界（Expand1024 18 例）✅；(e) ≤0/NaN/小数抛 401（Special_L1000~1100 + Concurrent_0032/0033 + Capacity_-20/50.5）✅。✅ 边界全覆盖。

3. **统计计数器保留语义**：clear 后 putCount/matchCount/missCount/removeCount/createCount 均保留（Clear_0006~0009）✅；getRemoveCount 仅淘汰累加非手动 remove（Clear_0010）✅。✅ 关键语义全覆盖。

4. **null/undefined 拒绝矩阵**：put(null)/put(undefined)/put(value=null)（PUT_0006~0008 message 断言）✅；get(null)（GET_0007 message）✅；remove(null)（REMOVE_0007 message）✅；**contains(null) 完全缺失**（SUP_LRUCACHE_CONTAINS_NULL_001）❌。且以上均**仅断言 e.message 不断言 e.code**（SUP_LRUCACHE_*_401_001 系列）❌。

5. **淘汰后状态访问**：淘汰后 contains→false、get→undefined、keys/values 不含已淘汰键（CreateDefault_EvictOrder + Special_L0100~0300 + Expand1024_EXP_LRU_004）✅。✅ 全覆盖。

6. **并发写写数据一致性**：Concurrent 文件（33+41 例）覆盖 put/get/remove/contains/entries/keys/values/capacity/stat 全维度并发，含容量 1 边界并发（Y_0100）、读写隔离（E_0100~0300）、压力测试（E_0100~0400 Pressure）。**但并发用例多为"不抛错即通过 + 容量上界校验"，少量有逐键值正确性断言**（T_0200 length<=10、StatPut_T_0100 putCount=100）。🟡 并发统计准确性有覆盖（T_0600 200 TaskPool 全计数器），但**多写者写写逐键值正确性无显式断言**（SUP_LRUCACHE_CONC_DISTINCT_KEYS_001）。❌ 部分缺口。

7. **10200201 命名误导**：`SendableLruCacheError.test.ets` 8 例 @tc.name/@tc.number 均含 "10200201"（如 `testErrorCode10200201Keys0008`），但实际代码测试 keys()/values() **快照独立性**（修改缓存不影响已返回数组），**无任何 assertEqual(10200201)**。.d.ets 无 @throws 10200201（SendableLruCache 并发修改不抛并发错误，与 collections.Map 不同）。🔴 命名误导（B 组改造）。

8. **SendableExpand1024Test.test.ets 误归类**：该文件 12 例（`4_0100~1200`）实为 **1025 属性 Sendable 对象（SendableClassOver1024）跨线程稳定性测试**，import 自 `SendableExpand1024Model`，与 SendableLruCache API 无直接关系，错置于 LruCache 测试目录。🔴 测试组织缺陷（C 组改造）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **constructor 401 未声明（⚠️ 文档缺口）**：`.md` constructor 参数说明注"If the value is less than or equal to 0, an exception is thrown"但**未列错误码表**；产品实际抛 401（Special_L1000/1100、Concurrent_0032 已断言 `error.code===401`）。建议在 `.md` constructor 段补"Error codes"表 `401 - Parameter error.`，与 updateCapacity 对齐。同步强化 Constructor_0004~0007 的弱断言（F.1）。

2. **createDefault 方法签名未独立列出（⚠️ 文档缺口）**：`createDefault(key)` 为子类可覆写钩子，但 `.d.ets` **未声明该方法**，`.md` 仅在 getCreateCount 示例代码中以 `class ChildLRUCache { createDefault(key) {...} }` 形式文档化，**无独立方法说明段、无参数表、无返回值表、无 @since**。建议在 `.md` 补独立 `createDefault` 段（参数 key、返回 V|undefined、说明"子类覆写后，get(missing key) 调用此钩子；返回非 undefined 则入缓存并 createCount++"），并在 `.d.ets` 补 protected 声明或注记。同步补符合性测试（SUP_LRUCACHE_CREATEDEFAULT_DOC_001）。

3. **onRemove 回调契约确认（⚠️ 口径澄清）**：任务口径提及"onRemove callback on eviction"，但 `.d.ets`/`.md` **均不存在 onRemove 回调成员**。SendableLruCache 的 LRU 淘汰通知机制**仅为 getRemoveCount() 计数器**，无回调钩子（与某些 LRUCache 实现不同）。建议在 `.md` 明确注记"本类不提供淘汰回调钩子，淘汰次数可通过 getRemoveCount() 查询"，避免误解。同步以符合性证据固化（SUP_LRUCACHE_ONREMOVE_CONFORMANCE_001）。

4. **10200201 命名误导修正（🔴 测试缺陷）**：`SendableLruCacheError.test.ets` 的 8 例不应以 "10200201" 命名——`.d.ets` 无 @throws 10200201，SendableLruCache 并发修改不抛并发错误，keys()/values() 返回快照数组是设计语义而非错误码。建议将 @tc.name/@tc.number/@tc.desc 改为"snapshot independence"语义（B 组改造），避免与 collections.Map 的真 10200201 契约混淆。

5. **401 code 断言一致性（⚠️ 测试质量）**：get/remove/put 的 null/undefined key 拒绝已测 `e.message` 但**未断言 `e.code===401`**，而 constructor/updateCapacity 已断言 code。建议统一为 `e.code===401` + message 双断言（A 组补全）；并在 `.d.ets`/`.md` 为 get/put/remove/contains 补 `@throws 401`（与 updateCapacity 对称）。

6. **contains(null) 缺口补全**：get(null)/remove(null)/put(null,undefined) 均已测 null 拒绝，**唯独 contains(null) 无任何用例**。建议补 contains(null) 拒绝测试（SUP_LRUCACHE_CONTAINS_NULL_001），与Other三个对齐。

7. **forEach / Symbol.iterator 禁用声明保留**：`.d.ets` 无 forEach、无 Symbol.iterator（与 collections.Map 不同），Special_L5300/5400 已有编译期符合性证据。建议保留该禁用声明符合性测试，不强行构造运行期用例。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 1 | SUP_LRUCACHE_CONC_DISTINCT_KEYS_001（新增） | 多写者并发写写逐键值正确性——现有并发套件多为"不抛错即通过 + 容量上界校验"，掩盖真实数据损坏，最高优先。 |
| **P1** | 8 | A 组 5 新增（get/put/remove/contains 的 401 code 断言补全 + contains(null) 新增）+ E 组 1 新增（SUP_LRUCACHE_CONC_REMOVE_VERIFY_001）+ B.1 改造（Error.test.ets 8 例命名改标）+ F.1 改造（Constructor_0004~0007 弱断言强化为 401 code） | 契约符合性硬缺口（401 code 断言缺失、contains(null) 缺失、命名误导、弱断言）；属阻断性质量缺陷。 |
| **P2** | 5 | B.2 新增（SUP_LRUCACHE_NO_10200201_001 无 10200201 契约符合性）+ D 组 2 新增（createDefault 文档符合性 + onRemove 无回调符合性）+ G 组 1 新增（SUP_LRUCACHE_SECONDARY_INHERIT_001 二级继承链）+ C.1 改造（SendableExpand1024Test.test.ets 迁出） | 覆盖已存在但定位弱 / 文档缺口需同步 / 契约确认需固化证据；非阻断但提升套件与文档质量。 |
| **合计** | **11 新增 + 3 改造** | | P0=1 / P1=8 / P2=5（含改造项随所属优先级计入）。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（key/value/capacity）遍历合法类型空间 | 19-接口矩阵（Basic/Boundary/Complex/Batch1-4）按 number/string/boolean/bigint/Sendable/联合 逐类型；Typetest/* 按单类型 5-7 例 |
| ②边界值测试 | 空缓存、单元素、容量阈值(1/1024/2147483647)、极值(0/MAX_SAFE/NaN/±0/-0)、大规模(1000/10000) | Constructor 边界、Expand1024、CreateDefault_Stress、Concurrent_Pressure |
| ③异常与非法输入 | 非法参数(≤0/NaN/小数→401)、null/undefined 拒绝、非 Sendable 拒绝 | Constructor/Capacity 异常段、Put null/undefined 拒绝、NonSendable_*、Concurrent 401 |
| ④返回值与类型验证 | 返回值语义(value/旧值/undefined/boolean/void/数组/迭代器/number)、instanceof、固定格式 | put/remove 返回、entries 迭代器类型、toString 格式、各 get*Count 返回 number |
| ⑤组合场景 | 多接口串联(put→get→remove→clear)、跨 API 联动(put↔contains↔getRemoveCount)、createDefault 钩子触发淘汰 | CreateDefault 淘汰序、Clear 统计保留、Special LRU 序 |
| ⑥重复调用幂等性 | 同操作连续调用结果稳定、不产生副作用膨胀 | Repeat_*、Put_0015 重复 put、Clear 连续多次 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock 串行化、多写者竞态、读写隔离、压力测试 | Concurrent 文件（33+41 例）、Expand1024 并发、Typetest/Concurrency |
