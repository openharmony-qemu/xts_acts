# taskpoolsequencerunnertest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`taskpool.SequenceRunner` 串行队列」——验证 SequenceRunner constructor（name/priority）、execute 全类型参数能力矩阵（每类型含 error 子例）、6 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）正常与异常传播、asyncLock/promise/setTimeout/async/await 回调链、act 场景（worker/二级/asyncLock/promise/setTimeout/async/wait/waitfor-then）、isDone、多任务 multiple/GC/UI，以及 SequenceRunner 下 TaskGroup 串行执行。
> **数据来源**：`taskpoolsequencerunnertest/entry/src/ohosTest/ets/test/` 下 10 个 `*.test.ets`，共解析 **152** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（SequenceRunner constructor L550、execute、Task isDone、6 生命周期回调、TaskGroup）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
taskpoolsequencerunnertest（SequenceRunner 串行队列）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 SequenceRunner constructor（name/priority）
│   ├── 1.2 SequenceRunner execute
│   ├── 1.3 全类型能力矩阵（含 error 子例 + TaskGroup）
│   ├── 1.4 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）
│   ├── 1.5 回调链异常传播（asyncLock/promise/setTimeout/async/await + worker/二级）
│   ├── 1.6 act 回调链（worker/二级/asyncLock/promise/setTimeout/async/wait/waitfor-then）
│   ├── 1.7 Task.isDone
│   ├── 1.8 TaskGroup in SequenceRunner（串行执行 ×30）
│   └── 1.9 多任务 GC/UI
├── 2. 稳定性              （多任务 GC/UI）
├── 3. 性能                （无独立基线）
├── 4. 并发安全            （串行队列顺序执行）
├── 5. 兼容性与继承        （TaskGroup in SequenceRunner）
└── 6. 资料与文档符合性     （SequenceRunner 回调与串行契约）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | SequenceRunneErrorSuccess2Test.test.ets | 6 | Task worker-error ×2 + task-error ×4 |
| 2 | SequenceRunneErrorSuccessTest.test.ets | 22 | 6 回调 + asyncLock/task-promise/settimeout/async/await 回调链 |
| 3 | SequenceRunnerAbility.test.ets | 30 | 全类型能力矩阵（string~int_32_array + error 子例 + TaskGroup） |
| 4 | SequenceRunnerAbilityTwo.test.ets | 26 | 全类型矩阵续（uint_32_array ×多 + isEndAble/sendableFunction/unitClamped/any/ASON/asyncLock） |
| 5 | SequenceRunnertask.test.ets | 30 | SequenceRunner task(TaskGroup) 串行执行 ×30 |
| 6 | TaskPoolSequenceRunnerActTest.test.ets | 9 | act 回调链（worker/二级/asyncLock/promise/setTimeout/async/wait/waitfor-then） |
| 7 | TaskPoolSequenceRunnerMultipleTest.test.ets | 5 | multiple worker error |
| 8 | TaskPoolSequenceRunnerMultipleUITest.test.ets | 2 | task ui |
| 9 | TaskPoolSequenceRunnerTest.test.ets | 20 | 6 回调 + idDone ×2 |
| 10 | TaskPoolSequenceRunnerTwoMultipleTest.test.ets | 2 | task ui ×2 |
| | **合计** | **152** | SequenceRunner 全场景 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 SequenceRunner constructor（name/priority）

```
SequenceRunner constructor
├── 入参范围覆盖
│   ├── constructor() 默认、constructor(name) 同 name、constructor(name, priority)
│   └── priority HIGH/MEDIUM/LOW/IDLE
├── 边界值测试
│   └── 同名独立实例
└── 返回值与类型验证
    └── instanceof SequenceRunner
```

- **用例位置**：`SequenceRunnerAbility.test.ets`/`SequenceRunnerAbilityTwo.test.ets`/`TaskPoolSequenceRunnerTest.test.ets` 中 constructor/name/priority 形态。跨文件贯穿，无独立专用文件。
- **测了哪些**：constructor 默认/带名/priority 全形态。

---

## 1.2 SequenceRunner execute

```
SequenceRunner execute
├── 入参范围覆盖
│   └── execute(task, priority?) 串行派发
├── 边界值测试
│   └── SequenceRunner repeating tasks、Repeat on same thread、Multi threaded
├── 异常与非法输入
│   └── cannot execute groupTask/seqRunnerTask/executedTask、dependent task not allowed
├── 返回值与类型验证
│   └── execute 返回 Promise<Object> 结果
├── 组合场景
│   ├── with name execute task/delayed task/executed task ×多
│   ├── task group in SequenceRunner
│   └── Tasks with dependencies
├── 重复调用/幂等性
│   ├── repeating tasks
│   └── Repeat on same thread
└── 并发跨线程
    └── Multi threaded SequenceRunner
```

- **用例位置**：`SequenceRunnerAbility.test.ets` `1100`~`2500`、`SequenceRunnerAbilityTwo.test.ets` `2600`~`4000`、`TaskPoolSequenceRunnerTest.test.ets` `0100`~`2000`（Task ×7）。贯穿全 Ability 两文件 + Test 文件。
- **测了哪些**：execute 派发 + 互斥约束 + 串行执行 + 多线程 + 重复。

---

## 1.3 全类型能力矩阵（含 error 子例 + TaskGroup）

```
全类型能力矩阵
├── 入参范围覆盖
│   ├── 20+ 类型参数（基础/数组/容器/Sendable/ASON）含正常与 error 子例（Ability 1100~2500）
│   └── uint_32_array ×多 + isEndAble/sendableFunction/unitClamped/any/ASON/asyncLock（AbilityTwo 2600~4000）
├── 边界值测试
│   └── 每类型含 error 子例
├── 异常与非法输入
│   └── 每类型带 error 子例 → 序列化/执行错误
├── 返回值与类型验证
│   └── 参数传递与返回值一致
├── 组合场景
│   └── 全类型 + TaskGroup 子例
└── 并发跨线程
    └── SequenceRunner 子线程执行
```

- **用例位置**：`SequenceRunnerAbility.test.ets` `1100`~`2500`（30 例，每类型 _2 为 error 子例，含 TaskGroup）+ `SequenceRunnerAbilityTwo.test.ets` `2600`~`4000`（26 例，含 _2 error 子例）。共 56 例。
- **测了哪些**：20+ 类型参数 ×（正常 + error 子例）+ TaskGroup 组合；**uint_32_array 矩阵 desc 多处重复，定位弱**。

---

## 1.4 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）

```
Task 生命周期回调
├── 入参范围覆盖
│   ├── 6 生命周期回调注册与触发（ErrorSuccess 020300~022200、Test 0100~2000 回调 ×2）
│   └── 各回调正常与异常分支
├── 边界值测试
│   └── 回调触发次数（×2）
├── 异常与非法输入
│   └── 各回调点抛异常 → 主线程 catch
├── 返回值与类型验证
│   ├── 异常 message 经串行队列回传
│   └── 各回调计数符合预期
├── 组合场景
│   └── 6 回调联动
└── 并发跨线程
    └── 串行队列子线程异常回传
```

- **用例位置**：`TaskPoolSequenceRunnerTest.test.ets` `0100`~`2000`（20 例：Task ×7 + onStartExecution ×2 + onExecutionFailed ×2 + onExecutionSucceeded ×2 + onReceiveData ×2）+ `SequenceRunneErrorSuccessTest.test.ets` `020300`~`022200`（22 例：onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）+ `ErrorSuccess2` `0200`~`0700`（6 例：worker-error ×2 + task-error ×4）。共 48 例。
- **测了哪些**：6 生命周期回调 + 各回调抛异常传播与计数。

---

## 1.5 回调链异常传播（asyncLock/promise/setTimeout/async/await + worker/二级）

```
回调链异常传播
├── 入参范围覆盖
│   ├── asyncLock 本体/then/catch/finally、asyncLock 三段链
│   ├── task-promise/then/catch/finally
│   ├── task-settimeout、async-task-error、await error、await-then-error
│   └── worker-error ×2 + task-error ×4（二级）
├── 边界值测试
│   └── 各回调链段正常与异常
├── 异常与非法输入
│   └── 各回调链段抛异常 → 传播与捕获
├── 返回值与类型验证
│   └── 异常 message 经串行队列回传
├── 组合场景
│   ├── asyncLock 三段、promise 三段
│   └── 二级 worker-error
└── 并发跨线程
    └── 串行队列子线程异常回传
```

- **用例位置**：`SequenceRunneErrorSuccessTest.test.ets` `020300`~`022200`（22 例）+ `SequenceRunneErrorSuccess2Test.test.ets` `0200`~`0700`（6 例）。共 28 例（与 §1.4 同文件矩阵）。
- **测了哪些**：asyncLock 三段 + promise 三段 + setTimeout + async + await + 二级 worker-error 异常传播。

---

## 1.6 act 回调链（worker/二级/asyncLock/promise/setTimeout/async/wait/waitfor-then）

```
act 回调链
├── 入参范围覆盖
│   └── worker-then/二级-then/asyncLock-then/promise-then/promise-cancel/setTimeOut-then/async-then/wait-then/waitfor-then（ActTest 0100~0900）
├── 边界值测试
│   └── 各 then 链
├── 异常与非法输入
│   └── promise-cancel
├── 返回值与类型验证
│   └── 各 then 链回调触发
├── 组合场景
│   └── worker + 二级 + asyncLock + promise + setTimeout + async + wait + waitfor
└── 并发跨线程
    └── worker + SequenceRunner 子线程
```

- **用例位置**：`TaskPoolSequenceRunnerActTest.test.ets` `0100`~`0900`（9 例：worker-then/二级-then/asyncLock-then/promise-then/promise-cancel/setTimeOut-then/async-then/wait-then/waitfor-then）。共 9 例。
- **测了哪些**：9 种 then 链 + promise-cancel 组合。

---

## 1.7 Task.isDone

```
Task.isDone
├── 入参范围覆盖
│   └── isDone 状态查询（Test idDone ×2）
├── 边界值测试
│   └── 各状态：未添加/未执行/执行中/已执行/取消中
├── 返回值与类型验证
│   └── isDone 返回 boolean
└── 重复调用/幂等性
    └── isDone 多次读取
```

- **用例位置**：`TaskPoolSequenceRunnerTest.test.ets` idDone ×2 段。共 2 例。
- **测了哪些**：isDone 状态查询。

---

## 1.8 TaskGroup in SequenceRunner（串行执行 ×30）

```
TaskGroup in SequenceRunner
├── 入参范围覆盖
│   └── TaskGroup 在 SequenceRunner 下串行执行 ×30（SequenceRunnertask 1000~3900）
├── 边界值测试
│   └── 不同 TaskGroup 形态
├── 返回值与类型验证
│   └── 串行执行结果正确
├── 组合场景
│   └── 30 例矩阵内组合
├── 重复调用/幂等性
│   └── 矩阵内重复
└── 并发跨线程
    └── SequenceRunner 子线程串行
```

- **用例位置**：`SequenceRunnertask.test.ets` `1000`~`3900`（30 例，desc 均为 "test TaskGroup"）。
- **测了哪些**：TaskGroup 在 SequenceRunner 下串行执行矩阵；**30 例 desc 全为 "test TaskGroup"，形态定位弱**。

---

## 1.9 多任务 GC/UI

```
多任务 GC/UI
├── 入参范围覆盖
│   ├── 多 worker 错误（MultipleTest 0100~0500）
│   └── UI 场景（MultipleUI、TwoMultiple task ui ×4）
├── 边界值测试
│   └── UI 场景
├── 异常与非法输入
│   └── multiple worker error
├── 返回值与类型验证
│   └── UI 场景结果正确
└── 并发跨线程
    └── 多任务 + UI 线程
```

- **用例位置**：`TaskPoolSequenceRunnerMultipleTest.test.ets` `0100`~`0500`（multiple worker error ×5）、`MultipleUITest` `0100`/`0200`（task ui ×2）、`TwoMultipleTest` `0100`/`0200`（task ui ×2）。共 9 例。
- **测了哪些**：multiple worker error + UI 场景；**multiple 段 desc 均为 "test worker error" 较笼统**。

---

# 2. 稳定性

- **用例位置**：`MultipleUITest`/`TwoMultipleTest`（task ui ×4）。
- **测了哪些**：UI 场景稳定性；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：`SequenceRunnerTest` 串行执行、`ActTest` 回调链。
- **测了哪些**：串行队列顺序执行 + 回调链；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：`SequenceRunnertask.test.ets` 30 例（TaskGroup in SequenceRunner）。
- **测了哪些**：TaskGroup 与 SequenceRunner 组合；**未见 SequenceRunner 子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`ErrorSuccess`/`ErrorSuccess2` 回调异常矩阵、`Ability` 全类型矩阵。
- **测了哪些**：SequenceRunner 回调与串行契约符合性；**未见错误码 assertEqual 取证，未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| SequenceRunner constructor | ✅(name/priority) | ✅(同名) | 🟡 | ✅(instanceof) | 🟡 | 🟡 | 🟡 |
| SequenceRunner execute | ✅ | ✅(重复/多线程) | ✅(cannot execute ×多) | ✅(串行结果) | ✅(嵌套/依赖) | ✅(重复) | ✅(多线程) |
| 全类型能力矩阵 | ✅(56) | ✅(error子例) | ✅(每类型error) | ✅(返回一致) | ✅(TaskGroup) | 🟡 | ✅ |
| Task 生命周期回调 | ✅(48) | ✅(回调×2) | ✅(各点抛异常) | ✅(message/计数) | ✅(6回调) | ❌ | ✅ |
| 回调链异常传播 | ✅(28) | ✅(正常+异常) | ✅(各段抛异常) | ✅(message回传) | ✅(三段/二级) | ❌ | ✅ |
| act 回调链 | ✅(9) | 🟡 | ✅(promise-cancel) | ✅(then触发) | ✅(9链) | ❌ | ✅ |
| Task.isDone | ✅(2) | ✅(各状态) | 🟡 | ✅(boolean) | 🟡 | ✅(多读) | ✅ |
| TaskGroup in SequenceRunner | ✅(30) | 🟡 | ❌ | ✅(串行结果) | 🟡 | 🟡 | ✅ |
| 多任务 GC/UI | ✅(9) | 🟡(UI) | 🟡(worker error) | 🟡 | 🟡 | 🟡 | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **错误码 assertEqual 缺失**：异常回调矩阵无 10200006/10200025/10200051/10200057 等错误码 assertEqual。
2. **矩阵 desc 重复**：uint_32_array 矩阵与 task(TaskGroup) 30 例 desc 重复，定位弱。
3. **重复幂等未覆盖**：回调链/act 链/multiple 无重复稳定取证。
4. **多写者竞态未覆盖**：multiple 段笼统，无并发数据正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 错误码 assertEqual 取证 | 串行队列错误码硬契约未取证。 |
| P2 | 3 | 矩阵 desc 细化 / 回调链重复幂等 / 多写者竞态 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 全类型矩阵/6 回调/act 链/TaskGroup 串行 | Ability ×2、ErrorSuccess、ActTest、SequenceRunnertask |
| ②边界值测试 | 每类型 error 子例、回调 ×2、UI 场景 | Ability _2 子例、SequenceRunnerTest 回调 ×2 |
| ③异常与非法输入 | 每类型 error、各回调抛异常、promise-cancel | Ability _2、ErrorSuccess、ActTest 0500 |
| ④返回值与类型验证 | 返回一致、回调触发、isDone、message 回传 | 全套件 |
| ⑤组合场景 | asyncLock 三段/promise 三段/二级/TaskGroup、act 9 链 | ErrorSuccess、ActTest、SequenceRunnertask |
| ⑥重复调用幂等性 | isDone 多读、矩阵内重复 | （部分取证） |
| ⑦并发跨线程 | SequenceRunner 子线程串行/异常回传/worker | 全套件跨线程用例 |
