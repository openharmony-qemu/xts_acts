# taskpoolasyncrunnertest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`taskpool.AsyncRunner` 异步并发队列」——验证 AsyncRunner 构造错误、execute/cancel、不能执行的任务类型互斥矩阵（seqRunnerTask/groupTask/dependent/asyncRunnerTask/executedTask/periodicTask）、全类型参数能力矩阵（×10 次执行）、各生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData/then/catch/finally/asyncLock/promise/setTimeout/async/worker）异常传播、isCanceled/setTransferList/setCloneList/isDone、多任务 GC/UI。
> **数据来源**：`taskpoolasyncrunnertest/entry/src/ohosTest/ets/test/` 下 12 个 `*.test.ets`，共解析 **160** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（AsyncRunner constructor L1151、execute、Task cancel/isCanceled/setTransferList/setCloneList/isDone、6 生命周期回调）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
taskpoolasyncrunnertest（AsyncRunner 异步并发队列）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 AsyncRunner constructor
│   ├── 1.2 AsyncRunner execute（含互斥约束：不支持任务类型拒绝）
│   ├── 1.3 Task.cancel（AsyncRunner 场景）
│   ├── 1.4 全类型能力矩阵（×10 次）
│   ├── 1.5 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）
│   ├── 1.6 回调链异常传播（then/catch/finally + asyncLock/promise/setTimeout/async/worker/Taskpool）
│   ├── 1.7 Task.isCanceled
│   ├── 1.8 Task.setTransferList
│   ├── 1.9 Task.setCloneList
│   ├── 1.10 Task.isDone
│   └── 1.11 多任务 GC/UI
├── 2. 稳定性              （多任务 UI、GC）
├── 3. 性能                （×10 次执行，无独立基线）
├── 4. 并发安全            （异步队列并发执行）
├── 5. 兼容性与继承        （GenericsTask）
└── 6. 资料与文档符合性     （AsyncRunner 互斥契约 + 回调契约）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | AsyncRunner.test.ets | 18 | 构造错误 + execute error + 不能执行的任务类型互斥矩阵 + cancel + discarded/canceled |
| 2 | TaskPoolAsyncRunnerAbility.test.ets | 30 | 全类型参数能力矩阵 ×10 次（string~Uint32Array） |
| 3 | TaskPoolAsyncRunnerAbility2.test.ets | 19 | 全类型矩阵续（Uint8ClampedArray~SendableClass） |
| 4 | TaskPoolAsyncRunnerAbility3.test.ets | 4 | 全类型矩阵续（ISendable/SendableFunction/SendableClass） |
| 5 | TaskPoolAsyncRunnerActTest.test.ets | 7 | AsyncRunner act smoke + cancel |
| 6 | TaskPoolAsyncRunnerErrorSuccessTest.test.ets | 20 | 回调 ErrorSuccess 矩阵（GenericsTask/6 回调/asyncLock/task-then/catch/finally/promise/setTimeout/async） |
| 7 | TaskPoolAsyncRunnerErrorSuccessTest2.test.ets | 6 | worker error / 二级 error / 二级 error-then/catch |
| 8 | TaskPoolAsyncRunnerErrorTest.test.ets | 26 | 异常回调矩阵（Common/GenericsTask/6 回调/then/catch/finally/asyncLock 三段/promise 四段/setTimeout/async/worker/Taskpool 三段） |
| 9 | TaskPoolAsyncRunnerExecute.test.ets | 21 | execute/error/GenericsTask/isCanceled/taskId isCanceled/setTransferList/setCloneList/6 回调/isDone |
| 10 | TaskPoolAsyncRunnerMultipleGCTest.test.ets | 2 | task ui GC |
| 11 | TaskPoolAsyncRunnerMultipleTest.test.ets | 5 | multiple worker error |
| 12 | TaskPoolAsyncRunnerMultipleUITest.test.ets | 2 | task ui / task ui&await |
| | **合计** | **160** | AsyncRunner 全场景 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 AsyncRunner constructor

```
AsyncRunner constructor
├── 入参范围覆盖
│   └── constructor(name, runningCapacity, waitingCapacity)（Listening 载体 'async',3,3、010 caseName,50）
├── 边界值测试
│   └── 构造错误 ×2（AsyncRunner.test 0433/0434 Create AsyncRunner error）
├── 异常与非法输入
│   └── 构造参数非法 → 构造抛错
└── 返回值与类型验证
    └── instanceof AsyncRunner、构造后可 execute
```

- **用例位置**：`AsyncRunner.test.ets` `0433`/`0434`（Create AsyncRunner error ×2）+ 跨节 Listening 004/010 载体。共 2 例（构造错误专项）。
- **测了哪些**：AsyncRunner 合法构造 + 构造错误边界。

---

## 1.2 AsyncRunner execute（含互斥约束：不支持任务类型拒绝）

```
AsyncRunner execute
├── 入参范围覆盖
│   ├── execute(task, priority?) 正常派发（AsyncRunner.test 0435 execute error、ActTest smoke）
│   └── 互斥约束：execute 拒绝 seqRunnerTask/groupTask/dependent/asyncRunnerTask/executedTask/periodicTask（0437~0442）
├── 边界值测试
│   ├── task discarded（0449）
│   └── task has been canceled（0450）
├── 异常与非法输入
│   ├── execute error（0435）
│   ├── 跨载体互斥：sequenceRunner/taskGroup 不能 execute asyncRunnerTask（0443/0444）
│   ├── asyncRunnerTask 不能 execute outside（0445/0446）
│   ├── 不能 executed periodically（0447）
│   └── 不能 executeDelayed（0448）
├── 返回值与类型验证
│   └── execute 返回 Promise<Object> 结果
├── 组合场景
│   └── nested AsyncRunner inner timeout shorter/longer（Timeout2 0425~0428 跨节）
└── 并发跨线程
    ├── AsyncRunner 子线程执行
    └── 并发容量（runningCapacity 3/50）
```

- **用例位置**：`AsyncRunner.test.ets` `0435`（execute error）、`0437`~`0442`（不能 execute seqRunnerTask/groupTask/dependent/asyncRunnerTask/executedTask/periodicTask）、`0443`/`0444`（sequenceRunner/taskGroup 不能 execute asyncRunnerTask）、`0445`/`0446`（asyncRunnerTask 不能 execute outside）、`0447`（不能 executed periodically）、`0448`（不能 executeDelayed）、`0449`（task discarded）、`0450`（task has been canceled）+ `TaskPoolAsyncRunnerActTest.test.ets` act smoke。共 18 例（互斥矩阵）+ ActTest 7 例。
- **测了哪些**：execute 派发 + 6 类互斥任务 + 跨载体互斥 + discarded/canceled 边界。

---

## 1.3 Task.cancel（AsyncRunner 场景）

```
Task.cancel（AsyncRunner 场景）
├── 入参范围覆盖
│   └── cancel(task) 取消 AsyncRunner 队列任务（AsyncRunner.test 0436 cancel task、ActTest 1005 cancel）
├── 返回值与类型验证
│   └── cancel 后 task 状态、catch 触发
└── 并发跨线程
    └── AsyncRunner 子线程 cancel
```

- **用例位置**：`AsyncRunner.test.ets` `0436`（cancel task）+ `TaskPoolAsyncRunnerActTest.test.ets` `1005`（cancel）。共 2 例。
- **测了哪些**：AsyncRunner 场景下 cancel。

---

## 1.4 全类型能力矩阵（×10 次）

```
全类型能力矩阵
├── 入参范围覆盖
│   └── 53 种参数类型（基础/数组/容器/Sendable/ASON）×2 任务传参与返回
├── 边界值测试
│   └── ×10 次重复执行
├── 异常与非法输入
│   └── 含 error 子例
├── 返回值与类型验证
│   └── 参数传递与返回值类型一致
├── 组合场景
│   └── 两任务 ×10 次执行
├── 重复调用/幂等性
│   └── ×10 次执行结果一致
└── 并发跨线程
    └── AsyncRunner 子线程执行
```

- **用例位置**：`TaskPoolAsyncRunnerAbility.test.ets` `0100`~`3000`（30 例）+ `Ability2` `3100`~`5200`（19 例）+ `Ability3` `5300`~`5600`（4 例），每例「Create two tasks with X parameters and X return values, execute them 10 times」。共 53 例。
- **测了哪些**：53 种参数类型 ×2 任务 ×10 次执行的传递与返回一致性。

---

## 1.5 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）

```
Task 生命周期回调
├── 入参范围覆盖
│   └── onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData 注册与触发（ErrorSuccessTest 0100~2000、Execute 6 回调 ×2）
├── 边界值测试
│   └── 各回调点正常与异常
├── 异常与非法输入
│   └── 各回调点抛异常 → 主线程 catch
├── 返回值与类型验证
│   ├── 异常 message 经异步队列回传
│   └── 各回调计数符合预期
├── 组合场景
│   └── 6 回调联动
└── 并发跨线程
    └── 异步队列子线程异常回传
```

- **用例位置**：`TaskPoolAsyncRunnerErrorSuccessTest.test.ets` `0100`~`2000`（20 例：ErrorSuccess/GenericsTask/onStartExecution/onExecutionSucceeded/onReceiveData/Task/onEnqueued/onExecutionFailed）+ `ErrorSuccessTest2` `2500`~`3000`（6 例：worker error/二级 error）+ `ErrorTest` `0100`~`1030`（26 例：Common/GenericsTask/OnEnqueued/OnStartExecution/OnExecutionFailed/OnExecutionSucceeded/OnReceiveData）+ `Execute` 6 回调 ×2。共 52 例。
- **测了哪些**：6 生命周期回调注册/触发/异常传播 + 计数。

---

## 1.6 回调链异常传播（then/catch/finally + asyncLock/promise/setTimeout/async/worker/Taskpool）

```
回调链异常传播
├── 入参范围覆盖
│   ├── then/catch/finally（ErrorTest Then/Catch/Finally）
│   ├── asyncLock 三段（本体/then/catch/finally）
│   ├── promise 四段（then/catch/finally）
│   ├── setTimeout、async、worker callback
│   └── Taskpool 三段（callback/then/catch/finally）
├── 边界值测试
│   └── 各回调链段正常与异常
├── 异常与非法输入
│   └── 各回调链段抛异常 → 传播与捕获
├── 返回值与类型验证
│   └── 异常 message 经异步队列回传
├── 组合场景
│   ├── asyncLock 三段、promise 四段
│   └── 二级 error-then/catch（ErrorSuccess2 2500~3000）
└── 并发跨线程
    └── 异步队列子线程异常回传
```

- **用例位置**：`TaskPoolAsyncRunnerErrorTest.test.ets` `0100`~`1030`（26 例：Then/Catch/Finally/AsyncLock/AsyncLock's then|catch|finally/Promise|then|catch|finally/Settimeout/Asynchronous/Worker callback/Taskpool callback|then|catch|finally）+ `ErrorSuccessTest2` 二级 error-then/catch。共 26 例。
- **测了哪些**：then/catch/finally + asyncLock 三段 + promise 四段 + setTimeout + async + worker + Taskpool 三段共多条回调链正常与异常传播。

---

## 1.7 Task.isCanceled

```
Task.isCanceled
├── 入参范围覆盖
│   └── isCanceled 状态查询（Execute isCanceled、taskId isCanceled）
├── 边界值测试
│   └── 各 task 状态
├── 返回值与类型验证
│   └── isCanceled 返回 boolean
└── 并发跨线程
    └── AsyncRunner 子线程查询
```

- **用例位置**：`TaskPoolAsyncRunnerExecute.test.ets` isCanceled/taskId isCanceled 段。共 2 例。
- **测了哪些**：isCanceled + taskId isCanceled 状态查询。

---

## 1.8 Task.setTransferList

```
Task.setTransferList
├── 入参范围覆盖
│   └── setTransferList(list) 与 execute 联动（Execute setTransferList）
├── 返回值与类型验证
│   └── transfer list 生效、transfer 后 ArrayBuffer 所有权转移
└── 并发跨线程
    └── AsyncRunner 子线程接收 transfer 对象
```

- **用例位置**：`TaskPoolAsyncRunnerExecute.test.ets` setTransferList 段。共 1 例。
- **测了哪些**：setTransferList 在 AsyncRunner execute 下的生效。

---

## 1.9 Task.setCloneList

```
Task.setCloneList
├── 入参范围覆盖
│   └── setCloneList(list) 与 execute 联动（Execute setCloneList）
├── 返回值与类型验证
│   └── clone list 生效、对象克隆传递
└── 并发跨线程
    └── AsyncRunner 子线程接收 clone 对象
```

- **用例位置**：`TaskPoolAsyncRunnerExecute.test.ets` setCloneList 段。共 1 例。
- **测了哪些**：setCloneList 在 AsyncRunner execute 下的生效。

---

## 1.10 Task.isDone

```
Task.isDone
├── 入参范围覆盖
│   └── isDone 状态查询（Execute isDone ×2）
├── 边界值测试
│   └── 各状态：未添加/未执行/执行中/已执行/取消中
├── 返回值与类型验证
│   └── isDone 返回 boolean
└── 重复调用/幂等性
    └── isDone 多次读取
```

- **用例位置**：`TaskPoolAsyncRunnerExecute.test.ets` isDone ×2 段。共 2 例。
- **测了哪些**：isDone 状态查询。

---

## 1.11 多任务 GC/UI

```
多任务 GC/UI
├── 入参范围覆盖
│   ├── 多 worker 错误（MultipleTest 0100~0500）
│   ├── GC 压力（MultipleGC 0100/0200 task ui GC）
│   └── UI 与 UI&await 场景（MultipleUI 0100/0200）
├── 边界值测试
│   └── GC 压力、UI 场景
├── 异常与非法输入
│   └── multiple worker error
├── 返回值与类型验证
│   ├── GC 后状态正确
│   └── UI 场景结果正确
├── 组合场景
│   └── UI + await
└── 并发跨线程
    └── 多任务并发 + UI 线程
```

- **用例位置**：`TaskPoolAsyncRunnerMultipleTest.test.ets` `0100`~`0500`（multiple worker error ×5）、`MultipleGCTest` `0100`/`0200`（task ui GC ×2）、`MultipleUITest` `0100`/`0200`（task ui / task ui&await）。共 9 例。
- **测了哪些**：multiple worker error + GC 压力 + UI/UI&await 场景；**multiple 段 desc 均为 "test worker error" 较笼统**。

---

# 2. 稳定性

- **用例位置**：`TaskPoolAsyncRunnerMultipleGCTest.test.ets` `0100`/`0200`（GC）、`MultipleUITest`。
- **测了哪些**：GC 压力下 AsyncRunner 稳定性 + UI 稳定性；**无长时压力专项**。

# 3. 性能

- **用例位置**：`TaskPoolAsyncRunnerAbility*.test.ets` ×10 次执行。
- **测了哪些**：×10 次重复执行吞吐；**无独立时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`TaskPoolAsyncRunnerActTest.test.ets` `1005`（cancel）、`Execute` isCanceled、multiple 段。
- **测了哪些**：异步队列并发执行 + cancel；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：`TaskPoolAsyncRunnerExecute.test.ets` `0300`/`0400`（GenericsTask）、`Ability` 全类型矩阵。
- **测了哪些**：GenericsTask 在 AsyncRunner 下执行；**未见 AsyncRunner 子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`AsyncRunner.test.ets` 互斥矩阵（18 例）、`ErrorTest` 异常回调矩阵（26 例）。
- **测了哪些**：AsyncRunner 互斥契约 + 回调异常契约符合性；**未发现与文档逐条断言的符合性用例，错误码 assertEqual 取证弱**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| AsyncRunner constructor | ✅(2错误) | ✅(构造错误) | ✅(构造抛错) | ✅(instanceof) | 🟡 | 🟡 | 🟡 |
| AsyncRunner execute（含互斥） | ✅(18) | ✅(discarded/canceled) | ✅(6互斥+跨载体) | ✅(Promise) | ✅(nested timeout) | 🟡 | ✅ |
| Task.cancel（AsyncRunner 场景） | ✅(2) | 🟡 | 🟡 | ✅(状态) | 🟡 | 🟡 | ✅ |
| 全类型能力矩阵 | ✅(53类型) | ✅(×10) | 🟡(error子例) | ✅(返回类型) | ✅(×10) | ✅ | ✅ |
| Task 生命周期回调 | ✅(52) | ✅(正常+异常) | ✅(各点抛异常) | ✅(message/计数) | ✅(6回调) | ❌ | ✅ |
| 回调链异常传播 | ✅(多链) | ✅(各段) | ✅(各段抛异常) | ✅(message) | ✅(三段/四段/二级) | ❌ | ✅ |
| Task.isCanceled | ✅(2) | ✅(各状态) | 🟡 | ✅(boolean) | 🟡 | 🟡 | ✅ |
| Task.setTransferList | ✅(1) | 🟡 | 🟡 | ✅(生效) | 🟡 | ❌ | ✅ |
| Task.setCloneList | ✅(1) | 🟡 | 🟡 | ✅(生效) | 🟡 | ❌ | ✅ |
| Task.isDone | ✅(2) | ✅(各状态) | 🟡 | ✅(boolean) | 🟡 | ✅(多读) | ✅ |
| 多任务 GC/UI | ✅(9) | ✅(GC/UI) | 🟡(worker error) | 🟡 | ✅(UI+await) | 🟡 | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **错误码 assertEqual 弱**：互斥矩阵与异常回调多为 catch 验证，未见 10200006/10200025/10200051/10200057 等错误码 assertEqual 取证（错误码取证在 taskpooltest/TaskpoolErrorCode）。
2. **回调异常重复幂等未覆盖**：各回调链无重复抛异常稳定取证。
3. **多写者竞态未覆盖**：multiple 段 desc 笼统，无并发数据正确性断言。
4. **长时压力未覆盖**：仅 GC 2 例，无长时 AsyncRunner 压力。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 错误码 assertEqual 取证 | 互斥/回调错误码硬契约未取证。 |
| P2 | 2 | 回调异常重复幂等 / multiple desc 细化 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 互斥矩阵/53 类型/多回调链/execute 能力 | AsyncRunner.test、Ability ×3、ErrorTest、Execute |
| ②边界值测试 | 构造错误、×10 次、GC/UI、回调 ×2 | 0433/0434、Ability ×10、GC、Execute 回调 ×2 |
| ③异常与非法输入 | 互斥拒绝、各回调抛异常、execute error | 0437~0448、ErrorTest 26 例 |
| ④返回值与类型验证 | 互斥拒绝、参数返回一致、isCanceled/isDone/message | 全套件 |
| ⑤组合场景 | 跨载体互斥、×10、asyncLock 三段/promise 四段/二级 error | AsyncRunner.test、Ability、ErrorSuccess |
| ⑥重复调用幂等性 | ×10 次一致、isCanceled/isDone 多读 | Ability ×10、Execute |
| ⑦并发跨线程 | AsyncRunner 子线程执行/异常回传/multiple | 全套件跨线程用例 |
