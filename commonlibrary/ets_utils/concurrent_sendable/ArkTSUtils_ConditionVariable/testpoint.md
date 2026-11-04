# ConditionVariable 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/ArkTSUtils_ConditionVariable/entry/src/ohosTest/ets/test/` 下 5 个 ConditionVariable `*.test.ets`，共解析 **95** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.utils.d.ets` **L359–L423**（`@Sendable class ConditionVariable`，@since 18 / @crossplatform [since 22] / @atomicservice）。
> **文档来源**：`docs/zh-cn/application-dev/reference/apis-arkts/arkts-apis-arkts-utils-locks.md`（仓库内同名列文件 `test/.../apis-arkts/arkts-apis-arkts-utils-locks.md`）§`ConditionVariable<sup>18+</sup>`（L480–L628）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
ConditionVariable (@Sendable)
├── 1. 接口测试
│   ├── constructor()        （无参默认构造，new 一个异步等待通知对象）
│   ├── static request(name) （按名查找/创建，返回 ConditionVariable 实例）
│   ├── wait()               （无超时等待，notify 后 resolve；返回 Promise<void>）
│   ├── waitFor(timeout)     （带超时等待，notify 或超时后 resolve；timeout ms 正整数）
│   ├── notifyAll()          （唤醒全部等待者，void）
│   └── notifyOne()          （唤醒first等待者，void）
├── 2. 稳定性                （GC 期间等待、Worker terminate 期间等待、循环 notifyAll）
├── 3. 性能                  （多线程 wait/notify 时序、waitFor 计时精度）
├── 4. 并发安全               （TaskPool/Worker 跨线程 wait/notify、@Sendable 共享、多等待者竞态）
├── 5. 兼容性与继承          （new 与 request 两种构造路径、跨线程引用传递）
└── 6. 资料与文档符合性       （@Sendable 装饰、@atomicservice、@since 18、timeout 正整数约束）
```

**契约要点（贯穿全报告）**：`@arkts.utils.d.ets` L359–L423 与 `arkts-apis-arkts-utils-locks.md` L480–L628 对 ConditionVariable 的 **6 个成员均未声明任何 `@throws` 错误码**（无 401 / 10200011 / 10200201 等），`.md` 各成员亦无"错误码"小节。因此本套件的"异常与非法输入"维度几乎为空白——既有测试无任何错误码断言（`grep 10200201|10200011|401` 在 5 个测试文件中 **0 命中**），产品对非法入参/解绑/并发的实际行为**待验证**（见 §7、补充设计 A/D 组）。

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | ConditionVariableWait.test.ets | 9 | wait（基础/跨线程/递归等待） |
| 2 | ConditionVariableWaitFor.test.ets | 15 | waitFor（超时/0/负值/计时/notify 抢占） |
| 3 | ConditionVariableNotify.test.ets | 29 | notifyAll + request（2 例 request 返回/空串 + 27 例 notifyAll 唤醒） |
| 4 | ConditionVariableNotifyOne.test.ets | 26 | notifyOne（单唤醒/FIFO/多对多/混合 wait+waitFor） |
| 5 | ConditionVariableConcurrent.test.ets | 16 | 并发安全（TaskPool/Worker/terminate/GC） |
| | **合计** | **95** | 6 接口 + 并发/稳定性维度 |

**已排除**：`List.test.ets`（非 CV 用例，0 条 `@tc.name`）、`GCFull.ets`（GC 工具函数，0 条用例）、`ConditionVariableHelpers.ets`（`@Concurrent` 线程函数库 `threadWait/threadWaitFor/threadNotify/threadNotifyOne/threadGC/threadWaitNotAwait`，0 条用例，被 5 个测试文件 import）。三者不产出测试点。

**辅助 worker**（`entry/src/ohosTest/ets/workers/`，非用例文件，承载跨线程逻辑）：`workerWait.ets`、`workerWaitFor.ets`、`workerNotify.ets`、`workerNotifyOne.ets`、`workerCreateCV.ets`、`workerCreateCVReq.ets`、`workerImplementCV.ets`。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/并发文件」标注用例位置；编号段取自解析结果。ConditionVariable 无独立 `Constructor`/`Request` 专用文件，构造与 request 散落于各方法文件。

## 1.1 constructor()

```
constructor()
├── 入参范围覆盖
│   └── 无参构造（N/A），全部用例 `new ArkTSUtils.locks.ConditionVariable()` 起手
├── 边界值测试
│   ├── 首对象构造
│   └── 与 request 共存
├── 异常与非法输入
│   └── （契约未声明 @throws；无任何构造异常用例）
├── 返回值与类型验证
│   └── instanceof ArkTSUtils.locks.ConditionVariable（RequestReturnValidation001）
├── 组合场景
│   ├── new→wait/notify
│   └── new→TaskPool/Worker 共享
├── 重复调用幂等性
│   └── 多次 new 应得相互独立实例（未显式断言）
└── 并发跨线程
    └── workerCreateCV 在子线程 `new` 后回传主线程
```
- **用例位置**：无独立 `Constructor` 文件；`new` 直接出现于几乎所有用例（Wait001/002、WaitFor0100/0200、Notify001~022、NotifyOne001~013、Concurrent TaskPool001/002/ThreadWorker001/002/Terminate001/GCFull001/002）。`workerCreateCV.ets` 子线程构造。request 返回类型校验见 `ConditionVariableNotify.test.ets` `RequestReturnValidation001`（`instanceof ... .assertTrue()`）。
- **测了哪些**：无参默认构造可用性 + instanceof + 子线程构造回传；**无 `new` 重复独立性显式断言**（见 §7.2）。

## 1.2 static request(name: string): ConditionVariable

```
request(name)
├── 入参范围覆盖
│   ├── 普通串("Test"/"testCondition")
│   ├── CASE 名
│   └── 空串("")
├── 边界值测试
│   └── 空串 name → 仍返回实例（RequestEmptyString001）
├── 异常与非法输入
│   └── （契约未声明 @throws；无非串/缺省参数用例）
├── 返回值与类型验证
│   └── instanceof ConditionVariable（RequestReturnValidation001/RequestEmptyString001）
├── 组合场景
│   ├── request→wait/notifyAll/notifyOne
│   └── request 与 new 混用
├── 重复调用幂等性
│   └── 同名 request 应返回同一实例（"find or create"语义，未显式断言）
└── 并发跨线程
    └── workerCreateCVReq 子线程 request 后回传
```
- **用例位置**：`ConditionVariableNotify.test.ets`（2 例：`conditionVariableRequestEmptyString001`、`conditionVariableRequestReturnValidation001`，编号段 `NOTIFY_0023/0024`）；`request('Test')` 路径散落于 `Wait003/004`、`WaitFor0600~1100`、`Notify012~022`、`NotifyOne014~026`、`Concurrent TaskPool003/004/ThreadWorker003/004/Terminate002/GCFull003/004`。
- **测了哪些**：普通/空串 name 不抛错 + instanceof；**未测非串/缺省 name、未断言同名同实例/异名异实例**（见 §7.2、§7.3）。

## 1.3 wait(): Promise\<void>

```
wait()
├── 入参范围覆盖
│   └── 无参（N/A）
├── 边界值测试
│   └── 无等待者时 notify 的对端；wait 后无 notify 的"持续挂起"（未测）
├── 异常与非法输入
│   └── （契约未声明 @throws；无 detached bind/并发错误用例）
├── 返回值与类型验证
│   └── Promise<void> resolve（.then 命中）；resolve 值为 undefined（未显式断言）
├── 组合场景
│   ├── wait→notifyAll/notifyOne 唤醒
│   ├── wait+waitFor 混合
│   └── notify 时序（先注册后通知）
├── 重复调用幂等性
│   └── 递归 wait（wait().then(()=>wait().then(...))）+ 循环 notifyAll（Recursive001，count==3）
└── 并发跨线程
    ├── TaskPool threadWait
    ├── Worker workerWait
    └── 多等待者同 CV
```
- **用例位置**：专用 `ConditionVariableWait.test.ets`（9 例：`Wait001~004` + `Recursive001` + 4 例补充 spurious wakeup/lost wakeup/pending/resolve value）；作为"等待线程"散落于 `Notify003/004/008~011/014/015/019~022`、`NotifyOne003/004/008~013/016/017/021/023~026`、`Concurrent TaskPool001/003/ThreadWorker001/003/Terminate001/002/GCFull001~004`（经 `threadWait`/`workerWait`）。
- **测了哪些**：wait 被 notifyAll/notifyOne 唤醒 + 递归 re-wait + 跨线程；**未测无 notify 持续挂起 / 假唤醒(spurious wakeup) / resolve 值 undefined / detached bind**（见 §7.2、§7.3）。

## 1.4 waitFor(timeout: number): Promise\<void>

```
waitFor(timeout)
├── 入参范围覆盖
│   ├── 0
│   ├── -1
│   ├── 500
│   ├── 1000
│   ├── 3000
│   ├── 5000
│   └── 8000（无 NaN/Infinity/小数/字符串/缺省）
├── 边界值测试
│   ├── timeout=0（立即 resolve）
│   ├── timeout=-1（立即 resolve）
│   └── 大值 8000
├── 异常与非法输入
│   └── （契约未声明 @throws；.md 注"正整数"但 0/-1 不抛错且立即 resolve——行为/文档不符）
├── 返回值与类型验证
│   ├── 超时后 resolve
│   └── 计时精度 threadExecutionTime>=3000（WaitFor0500/1100）
├── 组合场景
│   └── waitFor+notify 抢占（operationTime<waitTime 提前唤醒 / >waitTime 超时后 notify no-op）
├── 重复调用幂等性
│   └── （未见连续 waitFor 同 CV 显式断言）
└── 并发跨线程
    ├── TaskPool threadWaitFor
    └── Worker workerWaitFor
```
- **用例位置**：专用 `ConditionVariableWaitFor.test.ets`（15 例：`WaitFor0100~1100` + 5 例补充 NaN/Infinity/Float/String/Missing）；作为"定时等待"散落于 `Notify005~008/016~019/022`、`NotifyOne005~008/018~022`（经 `threadWaitFor`/`workerWaitFor`）。
- **测了哪些**：超时 resolve + 计时精度 + notify 早于/晚于 timeout 的抢占 + 0/-1 容忍；**未测 NaN/Infinity/小数/字符串/缺省参数、未 pin 0/-1 立即 resolve 的计时**（见 §7.2、§7.4）。

## 1.5 notifyAll(): void

```
notifyAll()
├── 入参范围覆盖
│   └── 无参（N/A）
├── 边界值测试
│   └── 无等待者时 notifyAll 不抛错（Notify001/012）
├── 异常与非法输入
│   └── （契约未声明 @throws；无 detached bind 用例）
├── 返回值与类型验证
│   └── void（未显式断言返回值）
├── 组合场景
│   ├── 多等待者全唤醒（Notify004/009 resultThread1&&resultThread2）
│   └── wait+waitFor 混合全唤醒
├── 重复调用幂等性
│   └── 连续 2 次 notifyAll 唤醒 2 批等待者（Notify009/020）
└── 并发跨线程
    ├── TaskPool threadNotify
    ├── Worker workerNotify
    └── 主线程与子线程混合 notify
```
- **用例位置**：专用 `ConditionVariableNotify.test.ets`（27 例：`Notify001~022` + 5 例补充 request 非串/缺省/同名/异名 + notify void 返回值，覆盖 new + request 两路径对位）；散落于 `Concurrent TaskPool002/004/ThreadWorker001/003`（经 `threadNotify`/`workerNotify`）。
- **测了哪些**：全唤醒语义 + 无等待者 no-op + 重复 notify + 跨线程；**未测 detached bind / void 返回值显式断言**（见 §7.2）。

## 1.6 notifyOne(): void

```
notifyOne()
├── 入参范围覆盖
│   └── 无参（N/A）
├── 边界值测试
│   └── 无等待者时 notifyOne 不抛错（NotifyOne001/014）
├── 异常与非法输入
│   └── （契约未声明 @throws；无 detached bind 用例）
├── 返回值与类型验证
│   └── void（未显式断言返回值）
├── 组合场景
│   ├── 仅唤醒first等待者（NotifyOne004/017 `r1&&!r2`）
│   ├── FIFO 顺序（NotifyOne013/026 两阶段断言）
│   └── 2 次 notifyOne 唤醒 2 个（NotifyOne009/022）
├── 重复调用幂等性
│   └── 连续 2 次 notifyOne 逐个唤醒（NotifyOne009/022）
└── 并发跨线程
    ├── TaskPool threadNotifyOne
    └── Worker workerNotifyOne
```
- **用例位置**：专用 `ConditionVariableNotifyOne.test.ets`（26 例：`NotifyOne001~026`，编号段 `NOTIFY_ONE_0001~0026`，覆盖 new + request 两路径对位）；散落于 `Concurrent` 经 `threadNotifyOne`/`workerNotifyOne`。
- **测了哪些**：单唤醒语义 + FIFO + 多对多 + 无等待者 no-op + 跨线程；**未测 detached bind / void 返回值显式断言**（见 §7.2）。

---

# 2. 稳定性

- **用例位置**：`ConditionVariableConcurrent.test.ets`（`GCFull001~004`：wait 挂起期间触发 `GCFull()` 全量 GC，断言不崩；`ThreadWorkerTerminate001/002`：构造端 Worker `terminate()` 后实现端仍能 wait/notify 回传）+ 各 `WaitFor`/`Notify` 大等待时序用例（`WaitFor0500/1100` 5s 等待、`NotifyOne013/026` 多阶段 8s 时序）。
- **测了哪些**：GC 期间等待稳定性 + Worker 终止后 CV 仍可用 + 长时序稳定性；**未见循环创建/销毁 CV N 次的稳定性用例**。

# 3. 性能

- **用例位置**：`ConditionVariableConcurrent.test.ets`（`TaskPool001~004`：TaskPool wait+notify 时序、`ThreadWorker001~004`：Worker wait+notify 时序）+ `WaitFor0500/1100`（计时精度 `threadExecutionTime>=3000`）+ `Notify011/022`/`NotifyOne012/025`（`threadExecutionTime<1000` 抢占时序断言）。
- **测了哪些**：wait/notify 跨线程时序 + waitFor 计时精度 + notify 抢占延迟；**未见高并发（如 100+ 等待者）吞吐/延迟基准用例**。

# 4. 并发安全

- **用例位置**：`ConditionVariableConcurrent.test.ets`（14 例 `CONCURRENT_0001~0014`：TaskPool wait+notify、Worker wait+notify、`request('Test')` 跨线程共享、构造端+实现端双 Worker、`terminate()` 中断、`GCFull()` 期间等待）+ `Notify003/004/008~011`/`NotifyOne003/004/008~013`（多等待者+多通知者竞态）+ 跨接口混合 `wait+waitFor` 同 CV（`Notify008/011/019/022`、`NotifyOne008/011/021/024`）。
- **测了哪些**：@Sendable 跨 TaskPool/Worker 共享 + 多等待者唤醒正确性（notifyAll 全唤醒、notifyOne 单唤醒+FIFO）+ Worker terminate/GC 容错；**未测并发 wait/notify 是否触发 10200201**（CV 契约未声明该码，全套件 0 命中，需验证"CV 不抛 10200201"为符合性证据，见 §7.3、补充设计 D 组）；**未见"多写者写写数据一致性"类用例**（CV 为信号量非数据容器，不直接适用，但"多 notify 丢失/重复"未验证）。

# 5. 兼容性与继承

- **用例位置**：`new` vs `request` 两构造路径对位覆盖——`Wait001/002`（new）vs `Wait003/004`（request）、`WaitFor0100~0500`（new）vs `WaitFor0600~1100`（request）、`Notify001~011`（new）vs `Notify012~022`（request）、`NotifyOne001~013`（new）vs `NotifyOne014~026`（request）、`Concurrent TaskPool001/002/ThreadWorker001/002/Terminate001/GCFull001/002`（new）vs `TaskPool003/004/ThreadWorker003/004/Terminate002/GCFull003/004`（request）。
- **测了哪些**：两构造路径行为对位 + @Sendable 跨线程引用传递；**未见子类化/继承用例**（CV 声明为 `@Sendable class`，可被继承，但无 `extends ConditionVariable` 测试）；**未见 new 与 request 混用同实例的显式一致性断言**。

# 6. 资料与文档符合性

- **用例位置**：散落于全部 95 例——`@Sendable` 跨线程传递（`postMessageWithSharedSendable`、`taskpool.execute`）、`@atomicservice`/`@since 18` 隐式符合（接口可调用）、`request` 返回 instanceof、`waitFor` 计时符合"ms 单位"。
- **测了哪些**：@Sendable 跨线程可用 + instanceof + waitFor ms 单位；**未测 `waitFor` "正整数"约束符合性**（.md L571 注"正整数"，但 `WaitFor0300/0400/0800/0900` 用 0/-1 仍 `assertTrue()` 通过——**产品行为与文档"正整数"约束不符**，见 §7.4）；**未见与 `arkts-apis-arkts-utils-locks.md` 逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接 / ➖ 不适用（无参/无契约）

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ➖(无参) | ✅(首对象) | ❌(无@throws契约/无测试) | ✅(instanceof) | ✅(new→wait/notify) | 🟡(多次new独立性未断言) | ✅(子线程new) |
| request | 🟡(普通/空串) | ✅(空串) | ❌(非串/缺省未测) | ✅(instanceof) | ✅(request→wait/notify) | ❌(同名同实例未断言) | ✅(子线程request) |
| wait | ➖(无参) | ❌(无notify持续挂起未测) | ❌(detached bind未测) | 🟡(resolve命中/值undefined未断言) | ✅(wait+notify全/单) | ✅(递归re-wait) | ✅(多线程wait) |
| waitFor | 🟡(整数集) | ✅(0/-1/大值) | ❌(NaN/Inf/小数/串/缺省未测) | ✅(超时resolve/计时精度) | ✅(notify抢占时序) | 🟡(连续waitFor未显式断言) | ✅(跨线程waitFor) |
| notifyAll | ➖(无参) | ✅(无等待者no-op) | ❌(detached bind未测) | 🟡(void未显式断言) | ✅(全唤醒) | ✅(连续2次) | ✅(跨线程notify) |
| notifyOne | ➖(无参) | ✅(无等待者no-op) | ❌(detached bind未测) | 🟡(void未显式断言) | ✅(单唤醒+FIFO) | ✅(连续2次逐个唤醒) | ✅(跨线程notifyOne) |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.utils.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷 / ➖ 不适用。所有结论均经实际测试代码逐行复核（非仅凭 @tc.desc 推断）。`grep 10200201|10200011|401` 在 5 个 CV 测试文件中 **0 命中**——CV 契约与测试均无任何错误码断言。

| # | 接口 | 契约要点（.d.ets L359–423 / .md L480–628） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `constructor()` | 无参；无 @throws；@Sendable @since 18 | ✅ 覆盖：`new` 出现于几乎所有用例 + instanceof（`RequestReturnValidation001`）+ 子线程构造（`workerCreateCV`）。❌ **多次 new 相互独立性未显式断言**（无 `cv1 !== cv2`，SUP_CONDITIONVAR_CTOR_INDEP_001）。无异常契约，无 401/10200011 缺口（无参不可触发）。 |
| 2 | `static request(name: string)` | name 必填 string；.md L518 "字符串无特别限制"；无 @throws；"find or create" | ✅ 覆盖：普通串/空串/`RequestReturnValidation001` instanceof。❌ **非串/缺省 name 未测**（SUP_CONDITIONVAR_REQUEST_NONSTRING_001、SUP_CONDITIONVAR_REQUEST_MISSING_001，`undefined as string` 注入）；❌ **同名同实例 / 异名异实例未断言**（"find or create" 语义核心，SUP_CONDITIONVAR_REQUEST_SAME_NAME_001 / SUP_CONDITIONVAR_REQUEST_DIFF_NAME_001）；⚠️ `.md` 未声明"同名返回同实例"。 |
| 3 | `wait(): Promise<void>` | 无参；无 @throws；notify 后 resolve | ✅ 覆盖：wait→notifyAll/notifyOne 唤醒、递归 re-wait（`Recursive001` count==3）、跨线程。❌ **无 notify 持续挂起未测**（SUP_CONDITIONVAR_WAIT_PENDING_001）；❌ **假唤醒 spurious wakeup 未测**（CV 正确性核心，SUP_CONDITIONVAR_SPURIOUS_WAKEUP_001）；❌ **detached bind（`const fn=cv.wait;fn()`）未测**（CV 无 @throws 10200011，需验证是否抛，SUP_CONDITIONVAR_DETACHED_BIND_001）；🟡 resolve 值 undefined 未显式断言（SUP_CONDITIONVAR_WAIT_RESOLVE_VALUE_001）。 |
| 4 | `waitFor(timeout: number)` | timeout 必填 number；.md L571 "正整数，单位 ms"；无 @throws | ✅ 覆盖：整数集 0/-1/500/1000/3000/5000/8000、计时精度（`WaitFor0500/1100` `threadExecutionTime>=3000`）、notify 抢占时序。🔴 **0/-1 行为与文档"正整数"矛盾**：`WaitFor0300/0400/0800/0900` 用 0/-1 仍 `assertTrue()`（立即 resolve，未抛错），与 .md "正整数"约束不符（SUP_CONDITIONVAR_WAITFOR_NONPOSITIVE_PIN_001 pin 行为 + §7.4 文档同步）。❌ **NaN/Infinity/小数/字符串/缺省参数未测**（SUP_CONDITIONVAR_WAITFOR_NAN/INFINITY/FLOAT/STRING/MISSING_001，`undefined as number` 注入）；⚠️ `.d.ets`/`.md` 均未声明 401。 |
| 5 | `notifyAll(): void` | 无参；无 @throws；唤醒全部 | ✅ 覆盖：全唤醒（`Notify004/009` `r1&&r2`）、无等待者 no-op（`Notify001/012`）、连续 2 次（`Notify009/020`）、跨线程。❌ **detached bind 未测**（与 wait 共享，SUP_CONDITIONVAR_DETACHED_BIND_001）；🟡 void 返回值未显式断言（SUP_CONDITIONVAR_NOTIFY_VOID_001）。 |
| 6 | `notifyOne(): void` | 无参；无 @throws；.md L613 "通知第一个等待的线程" | ✅ 覆盖：单唤醒（`NotifyOne004/017` `r1&&!r2`）、FIFO（`NotifyOne013/026` 两阶段）、2 次唤醒 2 个（`NotifyOne009/022`）、无等待者 no-op（`NotifyOne001/014`）。❌ **detached bind 未测**（SUP_CONDITIONVAR_DETACHED_BIND_001）；🟡 void 返回值未显式断言（SUP_CONDITIONVAR_NOTIFY_VOID_001）；⚠️ `.md` "第一个"未明示 FIFO 保证（实现定义，见 §7.4）。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **wait/notify 时序核心语义**：(a) **wait() 无 notify 是否持续挂起**——未测（全套件 wait 均配对 notify，`Wait001/003` 调 `wait()` 后直接 `done()` 未验证挂起，`Wait002/004` 用 `threadWaitNotAwait` 返回 true 不依赖唤醒）。(b) **假唤醒 spurious wakeup**——未测（wait() 是否会在无 notify 时自行 resolve）。(c) **notify 先于 wait（lost wakeup）**——未测（先 notifyOne 再 wait，通知是否丢失/保留）。❌ 三项均为 CV 正确性核心，现有套件**仅覆盖 happy path**（先 wait 后 notify），无负面时序断言（SUP_CONDITIONVAR_WAIT_PENDING/SPURIOUS_WAKEUP/LOST_WAKEUP_001）。**最高优先**。

2. **request 同名/异名实例一致性**："find or create" 语义要求 `request("X") === request("X")`、`request("A") !== request("B")`。全套件 `request("Test")` 出现于 30+ 用例但**无任何 `===`/`!==` 实例断言**（`grep` 确认 NONE）。❌ 组合缺口（SUP_CONDITIONVAR_REQUEST_SAME_NAME/DIFF_NAME_001）。

3. **waitFor 非正整数行为**：0/-1 在 `WaitFor0300/0400/0800/0900` 中 `assertTrue()` 通过（立即 resolve），但 .md L571 约束"正整数"。🔴 产品行为/文档矛盾；且 0/-1 用例**仅断言 result true，未 pin 立即 resolve 的计时**（未断言 `threadExecutionTime < 某阈值`）。❌ 需 pin 行为并同步文档（SUP_CONDITIONVAR_WAITFOR_NONPOSITIVE_PIN_001 + §7.4）。

4. **waitFor 非法入参**：NaN/Infinity/小数(500.5)/字符串/缺省均未测（`grep waitFor(` 仅见整数变量/字面量）。CV 无 @throws，产品实际行为（抛 401？静默？立即 resolve？）**未知**。❌ 组合缺口（SUP_CONDITIONVAR_WAITFOR_NAN/INFINITY/FLOAT/STRING/MISSING_001）。

5. **request 非法入参**：非串/缺省 name 未测。❌ 组合缺口（SUP_CONDITIONVAR_REQUEST_NONSTRING/MISSING_001）。

6. **并发 wait/notify 与 10200201**：CV 无 @throws 10200201 声明，全套件 `grep 10200201` **0 命中**。但并发 wait/notify/notifyAll/notifyOne 频繁发生（`Concurrent` 14 例 + 多等待者用例），现有断言多为 `.catch(done)` 弱容错。❌ 需验证"CV 并发 wait/notify 不抛 10200201"为符合性证据（SUP_CONDITIONVAR_CONC_NO_10200201_001），固化"CV 非 collections 容器、无并发修改错误"契约边界。

7. **detached bind（10200011？）**：CV 方法为 `@Sendable` 类成员，collections 同类方法 detached 抛 10200011。CV 未声明，但需验证 `const fn = cv.wait; fn()` / `cv.notifyAll; ...()` 实际行为（抛 10200011？静默？正常？）。❌ 未测（SUP_CONDITIONVAR_DETACHED_BIND_001）。

8. **返回值/类型显式断言**：wait()/waitFor() resolve 值（应 undefined）、notifyAll()/notifyOne() 返回值（应 undefined）均未显式 `assertEqual(undefined)`。🟡 弱缺口（SUP_CONDITIONVAR_WAIT_RESOLVE_VALUE/NOTIFY_VOID_001）。

9. **new 与 request 混用同实例**：`new` 与 `request("Test")` 在不同用例中分别使用，但未断言"request 创建的实例与 new 实例相互独立"或"request 同名与 new 是否共享注册表"。❌ 组合缺口（并入 SUP_CONDITIONVAR_REQUEST_SAME_NAME_001 验证范围）。

10. **继承/子类化**：CV 为 `@Sendable class`，声明允许 `extends`，但无 `extends ConditionVariable` 用例（无覆写 wait/notify、无子类跨线程）。❌ 组合缺口（SUP_CONDITIONVAR_INHERIT_001）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **waitFor "正整数"与 0/-1 行为矛盾（🔴）**：`.md` L571 注 timeout"正整数"，但 `WaitFor0300/0400/0800/0900` 实测 0/-1 立即 resolve 不抛错。建议二选一：(a) 产品对 0/负数抛 401（与"正整数"一致），同步更新测试为负向断言；(b) 文档放宽为"非负整数或整数，<=0 立即 resolve"，同步 pin 测试计时。**当前为产品/文档不一致，必须澄清**（SUP_CONDITIONVAR_WAITFOR_NONPOSITIVE_PIN_001 + 本条）。

2. **CV 全员无 @throws 声明（⚠️）**：`.d.ets` L359–423 与 `.md` L480–628 对 6 个成员**均无 `@throws` / 无错误码小节**。建议对带必填参数的 `request(name)`、`waitFor(timeout)` 补 `@throws BusinessError 401 - The parameter check failed.`（与 ArkTS 401 通用规范一致），并补对应测试（SUP_CONDITIONVAR_REQUEST_NONSTRING/MISSING、WAITFOR_NAN/INFINITY/FLOAT/STRING/MISSING_001）。无参成员（constructor/wait/notifyAll/notifyOne）可不声明 401。

3. **request "find or create" 同实例语义未文档化（⚠️）**：`.md` L508 仅述"查找或创建"，未明示"同名多次调用返回**同一**实例"。建议补注"相同 name 返回同一 ConditionVariable 实例"，并补测试（SUP_CONDITIONVAR_REQUEST_SAME_NAME_001）。

4. **notifyOne "第一个"语义未明示 FIFO（⚠️）**：`.md` L613 "通知第一个等待的线程"未明示是否保证 FIFO 唤醒顺序。`NotifyOne013/026` 实测断言 FIFO（先注册先唤醒）。建议文档 pin "按等待注册顺序唤醒first（FIFO）"或标注"实现定义"，同步固化测试。

5. **CV 无 10200201/10200011 契约边界（⚠️）**：collections 容器声明 10200201（并发修改）/10200011（detached），CV 作为锁原语**不声明**。建议在 `.md` ConditionVariable 概述补注"本类为异步等待通知原语，非并发修改容器，不触发 10200201；方法 detached 调用行为见 §错误码"，并补符合性测试（SUP_CONDITIONVAR_CONC_NO_10200201_001、SUP_CONDITIONVAR_DETACHED_BIND_001）。

6. **spurious wakeup / 持续挂起语义未文档化（⚠️）**：`.md` L536 "异步调用进入等待中，将在被唤醒后继续执行"暗示 wait() 在无 notify 时持续挂起、不假唤醒，但未显式声明。建议补注"wait() 在收到 notify 前持续挂起，不会自行 resolve（无假唤醒）"，并补负面断言测试（SUP_CONDITIONVAR_SPURIOUS_WAKEUP_001、SUP_CONDITIONVAR_WAIT_PENDING_001）。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 2 | SUP_CONDITIONVAR_SPURIOUS_WAKEUP_001、SUP_CONDITIONVAR_LOST_WAKEUP_001 | CV 正确性核心——wait/notify 时序负面语义（假唤醒、丢失唤醒）完全未测，现有套件仅覆盖 happy path，无法防回归。 |
| **P1** | 11 | A 组 6（waitFor NaN/Infinity/小数/串/缺省/非正整数 pin）+ B 组 3（request 非串/缺省/同名同实例）+ C 组 1（wait 持续挂起）+ D 组 1（并发不抛 10200201 符合性） | 入参合法性/实例一致性/挂起语义/并发契约边界——契约未声明且行为未知，或核心语义待 pin。 |
| **P2** | 5 | B 组 1（异名异实例）+ D 组 1（detached bind 验证）+ E 组 2（resolve 值/void 返回值）+ G 组 1（子类继承） | 弱缺口/契约边界固化/继承补全；非阻断但提升套件质量。 |
| **合计** | **18 新增** | | P0=2 / P1=11 / P2=5。无现有用例改造项（CV 套件无弱断言需强化——0/-1 用例需 pin 计时但归入 A 组新增 NONPOSITIVE_PIN）。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（name/timeout）遍历合法类型空间 | request 普通/空串 name；waitFor 0/-1/正整数 |
| ②边界值测试 | 无参构造、空串 name、timeout=0/-1、无等待者 notify、首/末等待者 | RequestEmptyString001、WaitFor0300/0400、Notify001/NotifyOne001 |
| ③异常与非法输入 | 非法参数(401)、detached bind(10200011)、并发(10200201) | **CV 契约未声明任何 @throws，本类全空白**（见 §7.2、补充设计 A/D 组） |
| ④返回值与类型验证 | Promise<void> resolve、void 返回、instanceof、计时精度 | Recursive001、WaitFor0500/1100、RequestReturnValidation001 |
| ⑤组合场景 | wait↔notifyAll/notifyOne、wait+waitFor 混合、notify 时序抢占 | Notify008/011/022、NotifyOne008/013/026 |
| ⑥重复调用幂等性 | 递归 wait、连续 notify、re-notify 后再 wait | Recursive001、Notify009/020、NotifyOne009/022 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程 wait/notify、@Sendable 共享、多等待者竞态 | Concurrent TaskPool/ThreadWorker/Terminate/GCFull 全 14 例 |
