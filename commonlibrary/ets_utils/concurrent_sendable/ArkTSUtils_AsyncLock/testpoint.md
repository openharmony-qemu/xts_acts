# ArkTSUtils.locks.AsyncLock 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/ArkTSUtils_AsyncLock/entry/src/ohosTest/ets/test/` 下 14 个 `*.test.ets`，共解析 **307** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.utils.d.ets` **L59–L169**（`@Sendable class AsyncLock`）及同 namespace 辅助类型 `AsyncLockMode`(L179)/`AsyncLockOptions`(L210)/`AsyncLockState`(L259)/`AsyncLockInfo`(L288)/`AbortSignal`(L328)。
> **文档来源**：`test/xts/acts/commonlibrary/ets_utils/apis-arkts/arkts-apis-arkts-utils-locks.md`（`## AsyncLock` 段，与 ConditionVariable 共享文档；本报告聚焦 AsyncLock）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
ArkTSUtils.locks.AsyncLock
├── 1. 接口测试
│   ├── constructor()           （默认构造，无名锁；new vs request 差异）
│   ├── static request(name)    （按名 find-or-create；同名同实例/异名异实例）
│   ├── static query(name)      （查指定锁状态；@throws 10200030）
│   ├── static queryAll()       （查全部锁状态数组）
│   ├── lockAsync(cb)           （3 重载：cb / cb+mode / cb+mode+options）
│   ├── readonly name           （锁名，与 request 入参一致）
│   ├── AsyncLockMode           （SHARED=1 / EXCLUSIVE=2；SHARED 可重入）
│   ├── AsyncLockOptions        （isAvailable / signal / timeout；默认值 false/null/0）
│   ├── AsyncLockState          （held[] / pending[]）
│   ├── AsyncLockInfo           （name / mode / contextId）
│   └── AbortSignal             （aborted / reason；同线程访问约束）
├── 2. 稳定性                  （GC 期间 lockAsync、共享锁 GC、多 TaskPool 压力）
├── 3. 性能                    （多线程并发吞吐——仅隐式，无显式基准）
├── 4. 并发安全                 （TaskPool/Worker 跨线程引用、SHARED/EXCLUSIVE 互斥、重入、死锁检测）
├── 5. 兼容性与继承            （@Sendable 跨线程引用传递、跨并发实例共享）
└── 6. 资料与文档符合性         （@Sendable 装饰、import、@since 12 / @crossplatform[since 18]）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | AsyncLockArkTSUtilsSubset.test.ets | 52 | queryAll(0001-0003) / request·query(0004-0014) / lockAsync 回调(0015-0030) / AsyncLockMode(0031-0032) / AsyncLockOptions(0033-0040) / AsyncLockState+AsyncLockInfo(0041-0048) |
| 2 | AsyncLockConcurrencyBaseTest.test.ets | 5 | 并发稳定性：worker request 跳过(0001) / GC 期间 lockAsync(0002) / timeout+env 销毁(0003) / 共享锁 GC(0004) / 死锁检测(0005) |
| 3 | AsynclockDifferentForthTest.test.ets | 13 | request+name：异名异实例（第 4 变体） |
| 4 | AsynclockDifferentSecondTest.test.ets | 12 | request+name：异名异实例（第 2 变体） |
| 5 | AsynclockDifferentTest.test.ets | 38 | constructor(new)+request+name：异名异实例（第 1 变体） |
| 6 | AsynclockDifferentThirdTest.test.ets | 37 | constructor(new)+request+name：异名异实例（第 3 变体） |
| 7 | AsynclockSameAddSecondTest.test.ets | 4 | request+name：同名同实例（add 第 2 变体） |
| 8 | AsynclockSameAddTest.test.ets | 32 | request+name：同名同实例（add 变体） |
| 9 | AsynclockSameSecondTest.test.ets | 7 | request+name：同名同实例（第 2 变体） |
| 10 | AsynclockSameTest.test.ets | 49 | request+name：同名同实例（第 1 变体） |
| 11 | AsyncLocktest.test.ets | 9 | 错误码：query 10200030(0001) / lockAsync 401 非法 mode(0002-0004) / lockAsync 10200031 超时(0005) |
| 12 | AsyncLockUtilsCoverageSubset.test.ets | 5 | query 空闲 held/pending(0001) / lockAsync 返回类型(0002) / request 空串(0003) / query 空串(0004) |
| 13 | ConcurrentAsyncLockTest.test.ets | 9 | 并发 smoke：constructor(0001)/request(0002)/query(0003)/queryAll(0004)/lockAsync 基础(0005)/mode(0006)/timeout(0007)/并发访问(0008)/错误处理(0009) |
| 14 | LockTest.test.ets | 35 | AsyncLockMode SHARED/EXCLUSIVE 单/多/worker(0001-0006,0011,0022-0023,0035) / AsyncLockOptions isAvailable·signal·timeout(0007-0008,0010,0024-0031,0033-0034) / query(0009) / 重入嵌套(0024-0031) / 顺序获取(0013-0021) / 多线程(0032) |
| | **合计** | **307** | 11 接口（AsyncLock 8 成员 + AsyncLockMode/Options/State/Info/AbortSignal 辅助类型） |

**已排除**：`List.test.ets`（聚合 re-export，0 条 `@tc.name`）、`UlitsTest.test.ets`（工具类，0 条用例）。两者不产出测试点。`LockTest.ets`（无 `.test` 后缀）为 `@Concurrent` 任务函数定义文件，非用例文件。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合/并发/错误码文件」标注用例位置；编号段取自解析结果。
> 说明：`AsynclockSame*/Different*` 系列文件的 `@tc.desc` 均为占位 "test"，其语义由文件名 + 委托的 `@Concurrent` 任务函数（`TaskpoolUtilsAsynclockSameUtils`/`Utils`/`Methods`）决定，跨 TaskPool/Worker 上下文验证同名同实例 / 异名异实例契约。

## 1.1 constructor()

```
constructor()
├── 入参范围覆盖
│   └── new ArkTSUtils.locks.AsyncLock()（无参默认构造）
├── 边界值测试
│   └── （无名锁，name 为内部生成）
├── 异常与非法输入
│   └── （声明无 @throws；10200030 不适用于构造）
├── 返回值与类型验证
│   └── instanceof AsyncLock
├── 组合场景
│   └── new vs request(name) → 不同实例（AsynclockDifferent*）
├── 重复调用幂等性
│   └── 多次 new 各得独立实例
└── 并发跨线程
    ├── ConcurrentAsyncLock_0001
    └── AsynclockDifferent* 跨 TaskPool/Worker 构造
```
- **用例位置**：`AsynclockDifferentTest`（13 例 `0001~0030`，new vs request 异实例）+ `AsynclockDifferentThirdTest`（13 例）+ `AsyncLockArkTSUtilsSubset`（`0004` request 未创建、`0031` AsyncLockMode 段使用 new）+ `AsyncLocktest`（`0002~0005` 各 new 一把锁）+ `AsyncLockUtilsCoverageSubset_0002`（new 后 lockAsync 返回类型）+ `ConcurrentAsyncLock_0001`。
- **测了哪些**：默认构造 + instanceof + new 与 request 的实例独立性；**未见构造异常码用例**（契约无 @throws，正确）。

## 1.2 static request(name: string): AsyncLock

```
request(name)
├── 入参范围覆盖
│   ├── 普通串
│   ├── 空串("")
│   ├── 多组同名/异名
│   └── 跨 TaskPool/Worker 上下文请求
├── 边界值测试
│   └── 空串边界（AsyncLockUtilsCoverageSubset_0003，lock.name===""）
├── 异常与非法输入
│   └── ❌ 非字符串入参 401 未测（ArkTS 严格为编译期；⚠️ 声明未列 401）
├── 返回值与类型验证
│   ├── instanceof AsyncLock
│   └── lock.name === name
├── 组合场景
│   ├── 同名→同实例（AsynclockSame* 92 例）
│   ├── 异名→异实例（AsynclockDifferent* 100 例）
│   └── new vs request
├── 重复调用幂等性
│   └── 同线程/跨线程重复 request 同名返回同实例
└── 并发跨线程
    ├── AsynclockSame*/Different* 跨 TaskPool/Worker
    ├── ConcurrentAsyncLock_0002
    └── AsyncLockArkTSUtilsSubset_0007~0011
```
- **用例位置**：`AsynclockSameTest`(49) + `AsynclockSameAddTest`(32) + `AsynclockSameSecondTest`(7) + `AsynclockSameAddSecondTest`(4) + `AsynclockDifferentTest/Second/Third/Forth`(38+12+37+13) + `AsyncLockArkTSUtilsSubset_0004/0007~0011` + `AsyncLockUtilsCoverageSubset_0003` + `ConcurrentAsyncLock_0002`。
- **测了哪些**：find-or-create 核心契约（同名同实例/异名异实例）+ 空串边界 + 跨线程引用一致性 + instanceof/name 一致性；**非串入参 401 未测**（见 §7.2）。

## 1.3 static query(name: string): AsyncLockState  [@throws 10200030]

```
query(name)
├── 入参范围覆盖
│   ├── 已存在锁
│   ├── 不存在锁
│   └── 空串
├── 边界值测试
│   ├── 空闲态（held/pending 均 length===0）
│   └── 持有态（held 非空）
├── 异常与非法输入
│   └── 不存在锁→10200030（AsyncLocktest_0001、AsyncLockArkTSUtilsSubset_0006）
├── 返回值与类型验证
│   ├── AsyncLockState
│   └── held/pending 为 Array
├── 组合场景
│   ├── request 后 query
│   └── lockAsync 持有期间 query（held[i].name/mode/contextId）
├── 重复调用幂等性
│   └── 同锁多次 query 状态一致
└── 并发跨线程
    └── ConcurrentAsyncLock_0003（并发 smoke）
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0005/0006/0012~0014`（request/query 联动）+ `0041~0048`（AsyncLockState/AsyncLockInfo 持有态字段）+ `AsyncLocktest_0001`（10200030）+ `AsyncLockUtilsCoverageSubset_0001/0004`（空闲态 + 空串）+ `LockTest_0009`（queryTest）+ `ConcurrentAsyncLock_0003`。
- **测了哪些**：10200030 不存在锁 + 空闲/持有两态 held/pending 结构 + AsyncLockInfo 三字段（name/mode/contextId isFinite）；**非串入参 401 未测**（⚠️ 声明未列 401）。

## 1.4 static queryAll(): AsyncLockState[]

```
queryAll()
├── 入参范围覆盖
│   └── 0/1/多把锁场景
├── 边界值测试
│   ├── 无锁（不创建仅查询）
│   └── 3 把锁 states.length>=3
├── 异常与非法输入
│   └── （声明无 @throws）
├── 返回值与类型验证
│   └── AsyncLockState[] 数组
├── 组合场景
│   └── request 多名后 queryAll 校验条数
├── 重复调用幂等性
│   └── 多次 queryAll 条数稳定
└── 并发跨线程
    └── ConcurrentAsyncLock_0004
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0001~0003`（不创建锁查询 / 多锁 queryAll length>=3）+ `ConcurrentAsyncLock_0004`。
- **测了哪些**：queryAll 不创建锁的纯查询语义 + 多锁条数；**未见 queryAll 返回元素逐条 name 字段校验**（仅 length>=3，见 §7.3）。

## 1.5 lockAsync（3 重载合一）  [@throws 10200030；options 重载另 @throws 10200031]

```
lockAsync<T>(callback) | lockAsync<T>(callback, mode) | lockAsync<T,U>(callback, mode, options)
├── 入参范围覆盖
│   └── 回调返回 T / Promise<T>；SHARED/EXCLUSIVE；options.isAvailable/signal/timeout
├── 边界值测试
│   ├── 空操作回调
│   ├── timeout=0(默认)/1000
│   ├── isAvailable true/false
│   └── signal aborted true/false
├── 异常与非法输入
│   └── 非法 mode(123/-1/999)→401（AsyncLocktest_0002~0004）；timeout→10200031（AsyncLocktest_0005）；❌ 10200030(lockAsync 路径)未触发
├── 返回值与类型验证
│   ├── Promise<T>
│   └── string/number/boolean/Sendable 对象返回值（AsyncLockUtilsCoverageSubset_0002）
├── 组合场景
│   ├── 嵌套重入（LockTest_0024~0031 内外 mode 组合）
│   ├── 顺序获取（0013~0021）
│   └── SHARED 并行/EXCLUSIVE 互斥
├── 重复调用幂等性
│   └── 同锁多次 lockAsync 顺序排队
└── 并发跨线程
    ├── 多线程同锁（LockTest_0022/0023/0032）
    ├── worker（0003/0006/0017/0035）
    └── 死锁检测（AsyncLockConcurrencyBaseTest_0005）
```
- **用例位置**：
  - **重载① callback**：`AsyncLockArkTSUtilsSubset_0015~0030`（16 例基础回调）+ `AsyncLockUtilsCoverageSubset_0002`（返回类型）+ `ConcurrentAsyncLock_0005`。
  - **重载② callback+mode**：`AsyncLockArkTSUtilsSubset_0031~0032` + `LockTest_0001~0006/0011/0022~0023/0035`（SHARED/EXCLUSIVE 单/多/worker）+ `ConcurrentAsyncLock_0006` + `AsyncLockConcurrencyBaseTest_0004`。
  - **重载③ callback+mode+options**：`AsyncLockArkTSUtilsSubset_0033~0040`（isAvailable/signal/timeout）+ `LockTest_0007~0008/0010/0024~0031/0033~0034`（重入+options）+ `AsyncLocktest_0005`（10200031）+ `ConcurrentAsyncLock_0007` + `AsyncLockConcurrencyBaseTest_0002/0003`。
- **测了哪些**：3 重载全覆盖 + 401(非法 mode) + 10200031(timeout) + SHARED/EXCLUSIVE 互斥 + 嵌套重入 + signal 跳过回调 + isAvailable 立即失败/等待；**❌ 10200030(lockAsync 路径) 与 AbortSignal.reason 拒绝 Promise 契约未测**（见 §7.2/§7.3）。

## 1.6 readonly name: string

```
name
├── 入参范围覆盖
│   ├── 普通串
│   └── 空串
├── 边界值测试
│   └── 空串 name===""（AsyncLockUtilsCoverageSubset_0003）
├── 异常与非法输入
│   └── ❌ readonly 赋值拒绝证据未测（严格模式编译期错误）
├── 返回值与类型验证
│   ├── string
│   └── === request 入参
├── 组合场景
│   ├── request 后 name 一致
│   └── new 的无名锁 name
├── 重复调用幂等性
│   └── 同锁 name 稳定
└── 并发跨线程
    └── 跨 TaskPool/Worker 引用 name 一致（AsynclockSame*/Different*）
```
- **用例位置**：`AsynclockSame*/Different*`（每例均断言 `lock.name`，~100 例）+ `AsyncLockUtilsCoverageSubset_0003`（空串 name===""）+ `ConcurrentAsyncLock_0002/0008`。
- **测了哪些**：name === request 入参全场景 + 空串 + 跨线程一致；**readonly 赋值拒绝（编译期）无静态证据**（见 §7.2）。

## 1.7 AsyncLockMode（enum SHARED=1 / EXCLUSIVE=2）

```
AsyncLockMode
├── 入参范围覆盖
│   └── SHARED / EXCLUSIVE 两值
├── 边界值测试
│   └── （枚举仅 2 值）
├── 异常与非法输入
│   └── 非法值(123/-1/999)→401（经 lockAsync mode 位，AsyncLocktest_0002~0004）
├── 返回值与类型验证
│   └── SHARED=1/EXCLUSIVE=2（隐式，held[i].mode 比对）
├── 组合场景
│   ├── SHARED 并行 / EXCLUSIVE 互斥 / SHARED 可重入（.d.ets 注）
│   └── 嵌套内外 mode 组合（LockTest_0024~0031）
├── 重复调用幂等性
│   └── 同 mode 多次行为一致
└── 并发跨线程
    └── worker 内 SHARED/EXCLUSIVE（LockTest_0003/0006/0035）
```
- **用例位置**：`LockTest_0001~0006/0011/0022~0023/0035`（单/多/worker SHARED vs EXCLUSIVE）+ `AsyncLockArkTSUtilsSubset_0031~0032` + `AsyncLockConcurrencyBaseTest_0004`（共享锁 GC）。
- **测了哪些**：SHARED 并行 + EXCLUSIVE 互斥 + 跨 worker + 嵌套重入；**⚠️ .d.ets 注 SHARED "could reenter" 但 .md SHARED 说明未提重入**（见 §7.4）。

## 1.8 AsyncLockOptions\<T\>（constructor + isAvailable/signal/timeout）

```
AsyncLockOptions
├── 入参范围覆盖
│   ├── isAvailable true/false
│   ├── signal {aborted,reason}|null
│   └── timeout 0/1000
├── 边界值测试
│   └── 默认值 false/null/0（AsyncLockArkTSUtilsSubset options 段全断言）
├── 异常与非法输入
│   └── （无 @throws；timeout 越界经 lockAsync 抛 10200031）
├── 返回值与类型验证
│   ├── instanceof AsyncLockOptions
│   ├── 默认值三连断言
│   └── set/get 回读
├── 组合场景
│   ├── options 传入 lockAsync 重载③
│   └── isAvailable+signal+timeout 组合
├── 重复调用幂等性
│   └── 同 options 多次 lockAsync 行为一致
└── 并发跨线程
    └── （options 随 lockAsync 跨 worker，间接）
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0033~0040`（options 构造 + 默认值 + isAvailable/signal/timeout 全组合）+ `LockTest_0007~0008/0010/0024~0031/0033~0034`（isAvailableTest/isNotAvailableTest/abortTest/重入+options）。
- **测了哪些**：constructor + 三默认值(false/null/0) + isAvailable 回读 + signal aborted 跳过回调 + timeout；**AbortSignal 仅以对象字面量 `{aborted,reason}` 传入，未 `new AbortSignal()`（声明无 constructor，符合）**；**signal.reason 拒绝 Promise 契约未测**（见 §7.2）。

## 1.9 AsyncLockState（held[] / pending[]）

```
AsyncLockState
├── 入参范围覆盖
│   └── held / pending 两数组
├── 边界值测试
│   ├── 空闲态 length===0
│   ├── 持有态 held 非空
│   └── 等待态 pending 非空
├── 异常与非法输入
│   └── （无 @throws，由 query/queryAll 返回）
├── 返回值与类型验证
│   └── Array.isArray(held/pending)
├── 组合场景
│   ├── lockAsync 持有期间 query → held[i] 命中
│   └── SHARED/EXCLUSIVE mode 命中
├── 重复调用幂等性
│   └── 同状态多次 query 一致
└── 并发跨线程
    └── ConcurrentAsyncLock_0004（并发 queryAll）
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0041~0048`（held/pending 持有/等待态 + AsyncLockInfo 字段）+ `AsyncLockUtilsCoverageSubset_0001/0004`（空闲态）+ `AsyncLockArkTSUtilsSubset_0001~0003`（queryAll 返回）+ `ConcurrentAsyncLock_0004`。
- **测了哪些**：held/pending 结构 + 空闲/持有/等待三态 + Array.isArray；覆盖充分。

## 1.10 AsyncLockInfo（name / mode / contextId）

```
AsyncLockInfo
├── 入参范围覆盖
│   └── name / mode / contextId 三字段
├── 边界值测试
│   └── contextId Number.isFinite
├── 异常与非法输入
│   └── （无 @throws）
├── 返回值与类型验证
│   ├── held[i].name===TAG
│   ├── mode===SHARED/EXCLUSIVE
│   └── contextId isFinite
├── 组合场景
│   └── 不同 mode 下 held[i].mode 命中
├── 重复调用幂等性
│   └── 同锁 held[i] 稳定
└── 并发跨线程
    └── ❌ contextId 跨上下文（main vs worker）区分未测
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0041~0048`（held[i]/pending[i] 的 name/mode/contextId 逐字段）。
- **测了哪些**：三字段类型 + name/mode 命中 + contextId isFinite；**contextId 跨上下文区分（main vs worker 应不同）未测**（见 §7.2/§7.3）。

## 1.11 AbortSignal\<T\>（aborted / reason；同线程访问约束）

```
AbortSignal
├── 入参范围覆盖
│   ├── aborted true/false
│   └── reason 串
├── 边界值测试
│   └── aborted true 跳过回调（result===''）
├── 异常与非法输入
│   └── ❌ 跨线程访问 UB 未文档化取证（.d.ets L320 警告）
├── 返回值与类型验证
│   └── 🟡 reason 字段被设置但 ❌ Promise 拒绝值===reason 未断言
├── 组合场景
│   └── signal + isAvailable + timeout 组合传入 lockAsync
├── 重复调用幂等性
│   └── 同 signal 多次行为一致
└── 并发跨线程
    └── ❌ 同线程约束未测（仅主线程构造对象字面量）
```
- **用例位置**：`AsyncLockArkTSUtilsSubset_0018~0040`（多例 `options.signal={aborted:true/false,reason}`）+ `LockTest_0010`（abortTest）。
- **测了哪些**：aborted true 跳过回调 + 对象字面量传入；**❌ reason 拒绝 Promise 契约（.d.ets L347 "will be used to reject the promise returned from lockAsync"）未测** + **❌ 同线程访问约束（.d.ets L320 cross-thread UB）未取证**（见 §7.2）。

---

# 2. 稳定性

- **用例位置**：`AsyncLockConcurrencyBaseTest_0002`（call lockAsync 后立即 GC）、`0004`（共享锁销毁后 GC）、`0003`（timeout 回调与 env 销毁处理）+ `AsynclockSame*/Different*`（~100 例跨 TaskPool/Worker 反复 request/name 压力）。
- **测了哪些**：GC 期间锁生命周期稳定性 + 跨线程反复请求压力；**无显式大规模（1000+ 把锁）创建/销毁稳定性用例**。

# 3. 性能

- **用例位置**：`LockTest_0032`（many threads using async lock simultaneously）+ `AsynclockSame*/Different*` 多 TaskPool 并发。
- **测了哪些**：多线程并发吞吐（隐式）；**无显式单接口基线性能基准**（如 N 次 lockAsync 耗时基线）。

# 4. 并发安全

- **用例位置**：`LockTest_0001~0006/0011/0017/0022~0023/0032/0035`（SHARED/EXCLUSIVE 多线程/worker 互斥与并行）+ `0024~0031`（嵌套重入）+ `0013~0021`（顺序获取/唤醒）+ `AsyncLockConcurrencyBaseTest_0001/0005`（worker request 跳过 + 死锁检测）+ `ConcurrentAsyncLockTest`（9 例全接口并发 smoke）+ `AsynclockSame*/Different*`（跨 TaskPool/Worker 同名/异名实例一致性）。
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + SHARED 并行/EXCLUSIVE 互斥 + 嵌套重入 + 死锁检测 + 顺序排队/唤醒；**并发安全覆盖充分**。

# 5. 兼容性与继承

- **用例位置**：`AsynclockSame*/Different*`（@Sendable AsyncLock 跨并发实例引用传递 + 同名跨线程同实例）+ `LockTest_0003/0006/0017/0035`（worker 内 lockAsync）。
- **测了哪些**：@Sendable 跨线程引用传递 + 跨并发实例共享同名锁；**无子类化/继承用例**（AsyncLock 为 final 风格 @Sendable 类，子类化非契约支持范围）。

# 6. 资料与文档符合性

- **用例位置**：`AsyncLockArkTSUtilsSubset`（API 全覆盖 smoke）+ `AsyncLockUtilsCoverageSubset`（空串边界符合性）+ `AsyncLocktest`（错误码 10200030/401/10200031 符合性）+ `LockTest`（mode/options 符合性）。
- **测了哪些**：@Sendable 装饰 + import 可用性 + instanceof + 错误码符合性；**⚠️ .d.ets 与 .md 错误码表一致（10200030/10200031）但 401 未声明**（见 §7.4）；**⚠️ .md SHARED 说明未提"可重入"（.d.ets 注有）**（见 §7.4）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅(new vs request) | ✅(无名锁) | ❌(无 @throws 契约) | ✅(instanceof) | ✅(new vs request) | 🟡 | ✅(跨 TaskPool) |
| request(name) | ✅(普通/空串/同名/异名) | ✅(空串) | ❌(401 非串未测；⚠️ 未声明) | ✅(instanceof+name) | ✅(同名同实例/异名异实例) | ✅(重复同名) | ✅(TaskPool/Worker) |
| query(name) | ✅ | ✅(空闲/持有/空串) | ✅(10200030) | ✅(AsyncLockState) | ✅(持有期 query) | 🟡 | 🟡(并发 smoke) |
| queryAll() | ✅(0/1/多锁) | ✅(无锁/多锁) | ❌(无 @throws) | ✅(AsyncLockState[]) | 🟡(仅 length，元素 name 未逐校) | 🟡 | 🟡 |
| lockAsync(3 重载) | ✅(cb/mode/options) | ✅(timeout 0/1000、isAvailable、signal) | ✅(401 非法 mode、10200031 超时)；❌(10200030 lockAsync 路径) | ✅(Promise\<T\> 类型) | ✅(重入/顺序/互斥) | ✅ | ✅(多线程/worker/死锁) |
| readonly name | ✅(普通/空串) | ✅(空串) | ❌(readonly 赋值拒绝无证据) | ✅(string===入参) | ✅ | ✅ | ✅(跨线程一致) |
| AsyncLockMode | ✅(SHARED/EXCLUSIVE) | ✅ | ✅(401 非法值经 mode 位) | ✅(held[i].mode 比对) | ✅(并行/互斥/重入) | 🟡 | ✅(worker) |
| AsyncLockOptions | ✅(isAvailable/signal/timeout) | ✅(默认 false/null/0) | ❌(无 @throws；超时→10200031) | ✅(instanceof+默认值+回读) | ✅(随 lockAsync) | ✅(回读) | 🟡(随 lockAsync 跨 worker) |
| AsyncLockState | ✅(held/pending) | ✅(空闲/持有/等待) | ❌(无 @throws) | ✅(Array.isArray) | ✅ | 🟡 | 🟡 |
| AsyncLockInfo | ✅(name/mode/contextId) | ✅(contextId isFinite) | ❌(无 @throws) | ✅(字段类型) | ✅(mode 命中) | 🟡 | ❌(contextId 跨上下文区分未测) |
| AbortSignal | ✅(aborted/reason) | ✅(true/false) | ❌(跨线程 UB 未取证) | 🟡(reason 拒绝值未断言) | ✅(跳过回调) | 🟡 | ❌(同线程约束未测) |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.utils.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `constructor()` | 无 @throws；@Sendable @since 12 | ✅ 覆盖：`new AsyncLock()` + instanceof + new vs request 独立性（AsynclockDifferent* 13+13、AsyncLockArkTSUtilsSubset_0004/0031、AsyncLocktest_0002~0005、AsyncLockUtilsCoverageSubset_0002、ConcurrentAsyncLock_0001）。无异常契约，无缺口。 |
| 2 | `static request(name)` | name 必填 string；无 @throws | ✅ 行为覆盖：同名同实例（AsynclockSame* 92）/异名异实例（AsynclockDifferent* 100）/空串（AsyncLockUtilsCoverageSubset_0003，lock.name===""）/跨线程一致。❌ **401 非字符串入参未测**（SUP_ASYNCLOCK_REQUEST_401_001）；⚠️ 401 未声明。 |
| 3 | `static query(name)` | @throws 10200030 | ✅ 覆盖：10200030 不存在锁（AsyncLocktest_0001、AsyncLockArkTSUtilsSubset_0006）+ 空闲/持有两态 held/pending（0041~0048）+ 空串（AsyncLockUtilsCoverageSubset_0001/0004）。❌ **401 非字符串入参未测**（SUP_ASYNCLOCK_QUERY_401_001）；⚠️ 401 未声明。 |
| 4 | `static queryAll()` | 无 @throws；返回 AsyncLockState[] | ✅ 覆盖：不创建锁纯查询 + 多锁 length>=3（AsyncLockArkTSUtilsSubset_0001~0003、ConcurrentAsyncLock_0004）。❌ **返回元素逐条 name 命中未校验**（仅 length，SUP_ASYNCLOCK_QUERYALL_NAMES_001）。 |
| 5 | `lockAsync①(callback)` | @throws 10200030 | ✅ 覆盖：回调返回 T/Promise、返回类型（AsyncLockArkTSUtilsSubset_0015~0030、AsyncLockUtilsCoverageSubset_0002）。❌ **callback 非函数 401 未测**（SUP_ASYNCLOCK_LOCKASYNC_CALLBACK_401_001）；❌ **10200030(lockAsync 路径)未触发**（SUP_ASYNCLOCK_LOCKASYNC_10200030_001）；⚠️ 401 未声明。 |
| 6 | `lockAsync②(callback, mode)` | @throws 10200030 | ✅ 覆盖：SHARED/EXCLUSIVE 单/多/worker（LockTest_0001~0006/0011/0022~0023/0035、AsyncLockArkTSUtilsSubset_0031~0032）。✅ **mode 位 401 已测**（AsyncLocktest_0002~0004，`123`/`-1 as AsyncLockMode`/`999`）。❌ 10200030(lockAsync 路径)未触发（同⑤）。 |
| 7 | `lockAsync③(callback, mode, options)` | @throws 10200030, 10200031 | ✅ 覆盖：isAvailable/signal/timeout 全组合（AsyncLockArkTSUtilsSubset_0033~0040、LockTest_0007~0008/0010/0024~0031/0033~0034）。✅ 10200031 超时（AsyncLocktest_0005）。❌ **AbortSignal.reason 拒绝 Promise 契约未测**（SUP_ASYNCLOCK_ABORT_REASON_001）；❌ 10200030(lockAsync 路径)未触发。 |
| 8 | `readonly name` | readonly string；无 @throws | ✅ 覆盖：name===request 入参 + 空串 + 跨线程一致（AsynclockSame*/Different* ~100 例、AsyncLockUtilsCoverageSubset_0003）。❌ **readonly 赋值拒绝（编译期）无静态证据**（SUP_ASYNCLOCK_NAME_READONLY_001）。 |
| 9 | `AsyncLockMode` enum | SHARED=1/EXCLUSIVE=2；SHARED "could reenter" | ✅ 覆盖：两值 + 并行/互斥 + 重入 + worker（LockTest_0001~0006/0011/0022~0023/0035、AsyncLockArkTSUtilsSubset_0031~0032）。⚠️ **.md SHARED 说明未提"可重入"**（.d.ets L184 注有，见 §7.4）。 |
| 10 | `AsyncLockOptions<T>` | constructor + isAvailable/signal/timeout；默认 false/null/0 | ✅ 覆盖：instanceof + 默认值三连断言（false/null/0）+ isAvailable 回读 + signal aborted 跳过回调（AsyncLockArkTSUtilsSubset_0033~0040、LockTest_0007~0008/0010/0024~0031）。无缺口。 |
| 11 | `AsyncLockState` | held[]/pending[] | ✅ 覆盖：Array.isArray + 空闲/持有/等待三态（AsyncLockArkTSUtilsSubset_0041~0048、AsyncLockUtilsCoverageSubset_0001/0004）。无缺口。 |
| 12 | `AsyncLockInfo` | name/mode/contextId | ✅ 覆盖：三字段类型 + name/mode 命中 + contextId isFinite（AsyncLockArkTSUtilsSubset_0041~0048）。❌ **contextId 跨上下文（main vs worker）区分未测**（SUP_ASYNCLOCK_CONTEXTID_CROSS_001）。 |
| 13 | `AbortSignal<T>` | aborted/reason；同线程访问约束；reason 拒绝 lockAsync Promise | ✅ 部分覆盖：aborted true/false + 对象字面量传入 + 跳过回调（AsyncLockArkTSUtilsSubset_0018~0040、LockTest_0010）。❌ **reason 拒绝 Promise 值未断言**（SUP_ASYNCLOCK_ABORT_REASON_001，.d.ets L347 契约）；❌ **同线程访问约束（.d.ets L320 跨线程 UB）未取证**（SUP_ASYNCLOCK_ABORTSIGNAL_SAMETHREAD_001）。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **request → lockAsync → query 联动**：request 得名锁 → lockAsync 持有 → query 取 held[i].name/mode/contextId 命中——已覆盖（AsyncLockArkTSUtilsSubset_0041~0048）。✅

2. **同名同实例 / 异名异实例**：AsynclockSame*（92 例）+ AsynclockDifferent*（100 例）跨 TaskPool/Worker 全覆盖。✅

3. **new vs request 独立性**：AsynclockDifferent* 以 `new AsyncLock()` 与 `request(name)` 对比异实例——覆盖。✅

4. **SHARED 并行 / EXCLUSIVE 互斥**：LockTest_0001~0006/0011/0022~0023/0035 单/多/worker 全覆盖。✅

5. **嵌套重入**：LockTest_0024~0031 内外 mode（SHARED/EXCLUSIVE）× isAvailable(true/false) 8 组合全覆盖。✅ .d.ets 注 "SHARED could reenter" 由 0024（SHARED+SHARED）覆盖。

6. **顺序排队/唤醒**：LockTest_0013~0021（wait for lock / not waiting / sequentially acquiring / multiple wake ups）全覆盖。✅

7. **死锁检测**：AsyncLockConcurrencyBaseTest_0005（checkDeadlock）覆盖。✅

8. **AbortSignal.reason 拒绝 Promise**：❌ **组合缺口**——signal.aborted=true 时回调虽跳过（result==='' 已断言），但 lockAsync 返回的 Promise **是否被 reject、reject 值是否等于 reason** 从未断言（SUP_ASYNCLOCK_ABORT_REASON_001）。现有用例若产品改为静默丢弃仍通过，回归不可检测。

9. **queryAll 返回元素逐条命中**：❌ **组合缺口**——仅断言 length>=3，未验证 states 元素的 Info.name 命中已创建锁（SUP_ASYNCLOCK_QUERYALL_NAMES_001）。

10. **contextId 跨上下文区分**：❌ **组合缺口**——仅 isFinite，未比对 main vs worker 的 contextId 不同（SUP_ASYNCLOCK_CONTEXTID_CROSS_001）。

11. **401 覆盖面**：仅 lockAsync mode 位 401 已测（AsyncLocktest_0002~0004）；request/query 的 name 位、lockAsync 的 callback 位 **401 未测**，且声明侧全部未声明 401（⚠️ 文档缺口，见 §7.4）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **401 未声明（⚠️ 文档缺口）**：`.d.ets` 对 `request`/`query`/`lockAsync`(3 重载) 均未 `@throws 401`，但产品对非法参数抛 401（mode 位 `AsyncLocktest_0002~0004` 已证）。建议在 `.d.ets` 与 `.md` 错误码表为上述成员补 `@throws BusinessError 401 - The parameter check failed.`。同步增补 A 组测试。

2. **.md SHARED 未提重入（⚠️ 文档不一致）**：`.d.ets` L184 注 SHARED "could reenter"，但 `.md` SHARED 说明仅"允许多个线程或并发任务同时获取锁"，未提重入。建议 `.md` SHARED 说明补"支持同线程重入"。测试侧 LockTest_0024（SHARED+SHARED 嵌套）已覆盖，无需新增。

3. **AbortSignal 同线程约束同步**：`.d.ets` L319–321 警告与 `.md` "该类的实例必须在其创建的同一线程中访问"一致。建议保留，测试侧以 SUP_ASYNCLOCK_ABORTSIGNAL_SAMETHREAD_001 固化证据。

4. **10200030 在 lockAsync 的可达性说明**：声明对 3 个 lockAsync 重载列 10200030，但应用层（new/request 所得实例）触发路径不明。建议 `.md` lockAsync 错误码说明补注"该错误码为锁 registry/生命周期守卫，正常 new/request 所得实例路径不可达"。同步 SUP_ASYNCLOCK_LOCKASYNC_10200030_001 探索。

5. **错误码表一致性**：`.d.ets` 与 `.md` 对 query(10200030)、lockAsync①②(10200030)、lockAsync③(10200030+10200031) 声明**完全一致**。✅ 无矛盾。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 0 | — | 并发正确性（SHARED/EXCLUSIVE 互斥、嵌套重入、顺序排队、死锁检测）均已充分覆盖，无数据一致性掩盖缺口。 |
| **P1** | 4 | A×3（SUP_ASYNCLOCK_REQUEST_401_001、SUP_ASYNCLOCK_QUERY_401_001、SUP_ASYNCLOCK_LOCKASYNC_CALLBACK_401_001）+ B×1（SUP_ASYNCLOCK_ABORT_REASON_001） | 声明/契约要求但无直接证据；AbortSignal.reason 拒绝 Promise 契约缺失致回归不可检测。 |
| **P2** | 7 | B×1（ABORTSIGNAL_SAMETHREAD）+ C×2（LOCKASYNC_10200030、CONTEXTID_CROSS）+ D×2（QUERYALL_NAMES、NAME_READONLY）+ E×2（STABILITY、PERF）+ 改造 F.1（~143 例 @tc.desc 占位 "test" 语义化） | 覆盖已存在但定位/可读性弱，或契约禁用/不可达需固化证据；非阻断但提升套件质量。 |
| **合计** | **11 新增 + 1 改造项（~143 例）** | | P0=0 / P1=4 / P2=7（按新增计）；改造 F.1 随 P2。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（name/callback/mode/options）遍历合法类型空间 | request 同名/异名/空串、lockAsync 回调返回 T/Promise、mode SHARED/EXCLUSIVE |
| ②边界值测试 | 空串、空闲态/持有态/等待态、默认值、timeout=0、isAvailable true/false | AsyncLockUtilsCoverageSubset 空串、AsyncLockArkTSUtilsSubset 默认值三连 |
| ③异常与非法输入 | 10200030(锁不存在)、10200031(超时)、401(非法 mode/类型)、死锁 | AsyncLocktest 错误码段、AsyncLockConcurrencyBaseTest_0005 死锁 |
| ④返回值与类型验证 | Promise\<T\>、AsyncLock/State/Info 类型、instanceof、字段类型 | AsyncLockUtilsCoverageSubset_0002 返回类型、AsyncLockArkTSUtilsSubset State/Info 字段 |
| ⑤组合场景 | request→lockAsync→query 联动、嵌套重入、顺序排队、SHARED 并行/EXCLUSIVE 互斥 | LockTest_0024~0031 重入、0013~0021 顺序 |
| ⑥重复调用幂等性 | 同名重复 request、同锁多次 lockAsync 排队、同 options 多次 | AsynclockSame* 重复 request、LockTest 顺序获取 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、跨并发实例同名共享、多线程同锁、死锁检测 | AsynclockSame*/Different* 跨 TaskPool/Worker、LockTest 多线程/worker、死锁检测 |
