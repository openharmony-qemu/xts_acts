# concurrenterrormessagetest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「异常消息在不同线程上下文的传播与回调链」（跨切面主题）——覆盖主线程（setTimeout/promise/asyncLock/waitFor/async）、taskpool（普通 Task/泛型 Task then/TaskGroup/延时/周期/长时/串行/异步队列，真实接口 `taskpool.execute`/`executeDelayed`/`executePeriodically`/`Task`/`TaskGroup`/`LongTask`/`SequenceRunner`/`AsyncRunner`）、worker（top-level作用域/二级 subWorker/宿主 onmessage，真实接口 `@ohos.worker.ThreadWorker`）三类线程上下文中各回调点抛异常后的错误传播路径与捕获行为。
> **数据来源**：`concurrenterrormessagetest/entry/src/ohosTest/ets/test/` 下 2 个 `*.test.ets`，共解析 **34** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
concurrenterrormessagetest（异常消息传播·跨切面主题）
├── 1. 接口测试（Functional / Interface）  —— §1，按线程上下文主题分组，标注真实接口
│   ├── 1.1 主线程异常传播（setTimeout/promise/asyncLock/waitFor/async）
│   ├── 1.2 taskpool 异常传播（execute/Task/TaskGroup/延时/周期/LongTask/串行/异步）
│   └── 1.3 worker 异常传播（ThreadWorker top-level/subWorker onmessage/宿主 onmessage）
├── 2. 稳定性              （异常循环不崩溃）
├── 3. 性能                （无独立基线）
├── 4. 并发安全            （跨线程异常不丢失）
├── 5. 兼容性与继承        （subWorker 二级继承链）
└── 6. 资料与文档符合性     （异常码/消息字符串符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | Ability.test.ets | 1 | assertContain 工具校验 |
| 2 | ErrManagerTest.test.ets | 33 | 主线程/taskpool/worker 三上下文异常传播全回调链 |
| | **合计** | **34** | 异常传播 3 上下文 |

---

# 1. 接口测试（Functional / Interface）

> 本套件为跨切面主题，§1.x 按线程上下文分组，节内标注各点驱动的真实接口。

## 1.1 主线程异常传播（setTimeout/promise/asyncLock/waitFor/async）

```
主线程异常传播
├── 入参范围覆盖
│   ├── setTimeout 回调抛异常（SetTimeoutThrowErrorTest0100）
│   ├── promise 四段：本体/then/catch/finally 抛异常（0200~0500）
│   ├── asyncLock 三段：本体/then/catch 抛异常（0600~0800）
│   └── waitFor.finally / wait·waitFor / async 异步方法 抛异常（0900~1100）
├── 边界值测试
│   └── 各回调点抛 CustomError 的触发时机（0100~1100）
├── 异常与非法输入
│   └── 各回调点主动抛异常 → 验证可被 catch 捕获（全 11 例）
├── 返回值与类型验证
│   └── 异常对象 message/code 可断言（assertContain）
└── 组合场景
    └── promise→then→catch→finally 链式异常传播（0200~0500）
```

- **用例位置**：`ErrManagerTest.test.ets` `SetTimeoutThrowErrorTest0100`（setTimeout）、`PromiseThrowErrorTest0200`（promise）、`PromiseThenThrowErrorTest0300`（then）、`PromiseCatchThrowErrorTest0400`（catch）、`PromiseFinallyThrowErrorTest0500`（finally）、`AsyncLockThrowErrorTest0600`/`0700`/`0800`（asyncLock 本体/then/catch）、`WaitForThrowErrorTest0900`（waitFor.finally）、`WaitForErrorTest1000`（wait/waitFor）、`AsyncFunctionThrowErrorTest1100`（async）。共 11 例。
- **测了哪些**：主线程 setTimeout/promise 四段/asyncLock 三段/waitFor/async 共 11 个回调点抛异常后的捕获与消息断言。

---

## 1.2 taskpool 异常传播（execute/Task/TaskGroup/延时/周期/LongTask/串行/异步）

```
taskpool 异常传播
├── 入参范围覆盖
│   ├── 普通 Task / 泛型 Task then 抛异常（1300/1400）
│   ├── TaskGroup（task1正常+task2异常）抛异常（1500/1600）
│   ├── 延时 task / 周期 task 抛异常（1800/2000、2100 onEnqueued）
│   ├── LongTask / onReceiveData 回调抛异常（2200/2300）
│   └── 串行队列 task / 异步队列 task 抛异常（2400~2600、2700~2900）
├── 边界值测试
│   ├── task1 正常 + task2 抛异常的混合场景（1600、2500、2800）
│   └── onStartExecution / onExecutionSucceeded 回调抛异常（2600、2900）
├── 异常与非法输入
│   └── 各 task/回调主动抛异常 → 主线程 catch 捕获（1300~2900 全段）
├── 返回值与类型验证
│   └── 异常经跨线程回传后 message 可断言（assertContain）
├── 组合场景
│   ├── onExecutionFailed 回调内再抛异常（1700）
│   └── catch 回调内抛异常（1900）
└── 并发跨线程
    └── taskpool 子线程抛异常回传主线程（1300~2900 全段）
```

- **用例位置**：`ErrManagerTest.test.ets` `TaskpoolTaskThrowErrorTest1300`（普通 task）、`TaskpoolGenericTaskThenThrowErrorTest1400`（泛型 task then）、`TaskpoolTaskGroupTaskThrowErrorTest1500`/`1600`（taskgroup task / task1正常task2异常）、`TaskpoolTaskGroupOnExecutionFailedThrowErrorTest1700`（onExecutionFailed 回调内抛异常）、`TaskpoolDelayedTaskThrowErrorTest1800`（延时 task）、`TaskpoolDelayedTaskCatchThrowErrorTest1900`（catch 回调内抛异常）、`TaskpoolPeriodicTaskThrowErrorTest2000`/`OnEnqueuedThrowErrorTest2100`（周期 task / onEnqueued 回调）、`TaskpoolLongTaskThrowErrorTest2200`/`OnReceiveDataThrowErrorTest2300`（longTask / onReceiveData 回调）、`TaskpoolSerialTaskThrowErrorTest2400`/`SerialTask1ErrorTask2NormalTest2500`/`SerialTask1OnStartExecutionErrorTest2600`（串行 task / task1异常task2正常 / onStartExecution 回调）、`TaskpoolAsyncTaskThrowErrorTest2700`/`AsyncTask1NormalTask2ErrorTest2800`/`AsyncTask1OnExecutionSucceededErrorTest2900`（异步 task / task1正常task2异常 / onExecutionSucceeded 回调）。共 17 例。
- **测了哪些**：taskpool 7 种 task 类型 × onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData/then/catch 各回调点抛异常的跨线程回传与捕获。

---

## 1.3 worker 异常传播（ThreadWorker top-level/subWorker onmessage/宿主 onmessage）

```
worker 异常传播
├── 入参范围覆盖
│   ├── worker top-level作用域抛异常（WorkerTopLevelThrowErrorTest3000）
│   ├── 二级 subWorker onmessage 抛异常（3500/3600）
│   └── 宿主线程 onmessage 回调抛异常（3800）
├── 边界值测试
│   └── onmessage 抛异常前主线程 terminate 的竞态（3700）
├── 异常与非法输入
│   └── 各作用域抛异常 → 宿主 onerror 捕获（3000~3800）
├── 返回值与类型验证
│   └── 异常 message 经 worker 通道回传断言（assertContain）
├── 组合场景
│   └── worker 创建 subWorker，subWorker onmessage 抛异常（3500/3600）
└── 并发跨线程
    └── worker 子线程抛异常回传宿主线程（3000~3800）
```

- **用例位置**：`ErrManagerTest.test.ets` `WorkerTopLevelThrowErrorTest3000`（top-level作用域）、`WorkerSubWorkerThrowErrorTest3500`（top-level作用域创建二级 worker 的 onmessage 抛异常）、`WorkerSubWorkerThrowErrorTest3600`（onmessage 内创建二级 worker 抛异常）、`WorkerSubWorkerThrowErrorTest3700`（onmessage 抛异常前主线程 terminate）、`WorkerSubWorkerThrowErrorTest3800`（宿主 onmessage 回调内抛异常）。共 5 例。
- **测了哪些**：worker top-level作用域 + 二级 subWorker onmessage + terminate 竞态 + 宿主 onmessage 回调共 5 个 worker 异常传播点；**未见 worker onerror/onAllErrors 回调内抛异常用例**。

---

# 2. 稳定性

- **用例位置**：`ErrManagerTest.test.ets` 全 33 例（异常路径不崩溃）。
- **测了哪些**：各线程上下文异常传播循环稳定；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：`ErrManagerTest.test.ets` taskpool 段（1300~2900）、worker 段（3000~3800）。
- **测了哪些**：跨线程异常不丢失、terminate 竞态（`3700`）；**无多 worker 并发异常顺序一致性断言**。

# 5. 兼容性与继承

- **用例位置**：`ErrManagerTest.test.ets` `WorkerSubWorkerThrowErrorTest3500`/`3600`（二级 subWorker 继承链）。
- **测了哪些**：二级 worker 异常传播；**未见 worker 子类化异常覆写用例**。

# 6. 资料与文档符合性

- **用例位置**：`ErrManagerTest.test.ets` 全 33 例 + `Ability.test.ets` assertContain（异常消息字符串校验）。
- **测了哪些**：异常 message 字符串 assertContain 符合性；**未发现与具体错误码文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 主线程异常传播 | ✅(11回调点) | ✅(各回调点) | ✅(各点抛异常) | ✅(message) | ✅(链式) | ❌ | N/A |
| taskpool 异常传播 | ✅(7 task类型) | ✅(混合场景) | ✅(各回调抛异常) | ✅(回传) | ✅(回调内再抛) | ❌ | ✅ |
| worker 异常传播 | ✅(5传播点) | ✅(terminate竞态) | ✅(各作用域) | ✅(message) | ✅(subWorker) | ❌ | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **重复幂等未覆盖**：三类上下文均无「同回调点重复抛异常结果稳定」用例。
2. **worker onerror/onAllErrors 回调内抛异常未覆盖**：仅覆盖top-level作用域/subWorker onmessage/宿主 onmessage，未覆盖 onerror 回调链。
3. **多 worker 异常顺序一致性未覆盖**：无多 worker 并发异常的到达顺序断言。
4. **性能基线缺失**：无异常传播时延基线。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 2 | worker onerror 回调链 / 重复幂等 | 覆盖已较充分，补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 三上下文各回调点/各 task 类型抛异常 | 主线程 11 回调点、taskpool 7 task 类型、worker 5 传播点 |
| ②边界值测试 | task1 正常 task2 异常、terminate 竞态 | 1600、3700 |
| ③异常与非法输入 | 各回调点主动抛异常验证捕获 | 0100~3800 全例 |
| ④返回值与类型验证 | 异常 message/code 经通道回传断言 | assertContain |
| ⑤组合场景 | 回调内再抛异常、subWorker 继承链 | 1700、3500/3600 |
| ⑥重复调用幂等性 | 同回调点重复抛异常稳定 | （未取证） |
| ⑦并发跨线程 | taskpool/worker 子线程异常回传主线程 | taskpool 段、worker 段 |
