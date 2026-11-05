# tasktest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦真实 `@ohos.taskpool` 公共 API——`Task`（构造、`sendData`/`setTransferList`/`setCloneList`、`onReceiveData`/`onEnqueued`/`onStartExecution`/`onExecutionFailed`/`onExecutionSucceeded` 回调、`addDependency`）、`taskpool` 派发函数（`execute`/`executeDelayed`/`executePeriodically`/`cancel`/`terminateTask`）、`TaskGroup`（`constructor`/`addTask`/`name`）、`SequenceRunner`/`AsyncRunner`（`constructor`/`execute`）、`LongTask`/`GenericsTask`（`constructor`，继承自 `Task`）、`Configs`（`timeout`/`priority`）+ `Priority` 枚举。
> **数据来源**：`tasktest/entry/src/ohosTest/ets/test/` 下 7 个 `*.test.ets`，共解析 **209** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。用例跨多接口，按"主接口"归口后 §1.1~§1.22 计数之和 = 209。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（Task L141、TaskGroup L474、SequenceRunner L550、AsyncRunner L1151、LongTask L622、GenericsTask L635、State L685、Priority L62、Configs L1299、execute L871/L892/L915/L936/L954/L1342/L1360/L1376、executeDelayed L978/L1000、executePeriodically L1022/L1044、cancel L1066/L1082/L1104、getTaskPoolInfo L1115、terminateTask L1127、isConcurrent L1141、getTask L1289）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
tasktest（真实 @ohos.taskpool API 维度）
├── 1. 接口测试（按真实公共 API 归口，计数和=209）
│   ├── 1.1 Task constructor            ├── 1.12 TaskGroup constructor
│   ├── 1.2 Task.sendData               ├── 1.13 TaskGroup addTask
│   ├── 1.3 Task.setTransferList        ├── 1.14 TaskGroup name
│   ├── 1.4 Task.setCloneList           ├── 1.15 SequenceRunner constructor
│   ├── 1.5 Task 生命周期回调（5 回调）  ├── 1.16 SequenceRunner execute
│   ├── 1.6 Task.addDependency          ├── 1.17 AsyncRunner constructor
│   ├── 1.7 taskpool.execute            ├── 1.18 AsyncRunner execute
│   ├── 1.8 taskpool.executeDelayed     ├── 1.19 LongTask constructor
│   ├── 1.9 taskpool.executePeriodically├── 1.20 GenericsTask constructor
│   ├── 1.10 taskpool.cancel            ├── 1.21 Configs（timeout/priority）
│   ├── 1.11 taskpool.terminateTask     └── 1.22 Priority 枚举
├── 2. 稳定性              （多 timeout 并发、多层嵌套）
├── 3. 性能                （多 timeout 并发，无独立基线）
├── 4. 并发安全            （cancel/exception/timeout 竞态）
├── 5. 兼容性与继承        （GenericsTask/TaskGroup/Mixed）
└── 6. 资料与文档符合性     （configs/timeout/priority 契约 + 401/10200058 错误码）
```

**测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

> **口径说明**：原测试文件内的 `TaskDispatchQueue`/`TaskQueueCoord`/`TaskStateMachine`/`TaskListening` 等是 describe/test-class 名或用户自建 `@Sendable` 类（基于 `@arkts.collections`+`AsyncLock`/`ConditionVariable`），**不是** `@ohos.taskpool` 公共 API。本报告按各用例实际驱动的真实 `taskpool.*` API 归口到 §1.1~§1.22；这些测试内部名仅作为场景叶节描述出现于真实 API 小节内。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 实际驱动的真实 `@ohos.taskpool` API |
|---|------|:---:|------|
| 1 | TaskDispatchQueueTest.test.ets | 11 | `execute(task)`+`new Task(func,args)`（0700/0800/0900，3 例）；其余 8 例为用户 `@Sendable` 队列类宿主线程行为，**不触达 taskpool** |
| 2 | TaskGroupTest.test.ets | 1 | `new TaskGroup()`+`addTask(task)`/`addTask(func,args)`+`execute(group,Priority.HIGH)`+`Priority.HIGH` |
| 3 | TaskListening.test.ets | 12 | `Task` 全套回调 +`Task.sendData`+`execute`/`executeDelayed`/`executePeriodically`/`cancel`+`TaskGroup`/`SequenceRunner`/`AsyncRunner`/`LongTask`/`GenericsTask`+`Priority` |
| 4 | TaskQueueCoordTest.test.ets | 17 | `execute(task)`+`new Task`（1300/1400，2 例）+`onReceiveData`/`Task.sendData`（1800，1 例）；其余 14 例为用户 `@Sendable` 队列类宿主线程行为 |
| 5 | TaskStateMachineTest.test.ets | 12 | `execute(task)`+`new Task`（0900，1 例）+`onReceiveData`/`Task.sendData`（0800，1 例）；其余 10 例为用户 `@Sendable` 状态机类宿主线程行为 |
| 6 | TaskTimeout.test.ets | 72 | `execute(task,Configs)`/`execute(GenericsTask,Configs)`/`execute(TaskGroup,Configs)`+`Configs.timeout/priority`+`Priority`+`addDependency`+回调+`Task.sendData`+`setCloneList`+`executeDelayed`+`terminateTask(LongTask)` |
| 7 | TaskTimeout2.test.ets | 84 | 嵌套 `execute(*,Configs)`+`cancel(task)`/`cancel(group)`+`SequenceRunner.execute`/`AsyncRunner.execute`+`LongTask`/`GenericsTask`+回调+`setTransferList`/`setCloneList`+`Task.sendData`+`terminateTask(LongTask)` |
| | **合计** | **209** | 上述真实 API（主接口归口见 §1.1~§1.22） |

---

# 1. 接口测试

> 下文每节先给 7 类树（叶节为具体中文场景，括注来源用例号），再给「用例位置」（文件 + 编号区间）与「测了哪些」。用例跨多接口时在多节出现，节首「(主接口 N 例)」为归口计数，22 节之和 = 209。

## 1.1 Task constructor

```
Task constructor
├── 入参范围覆盖
│   └── new Task(func, args) 全 task 类型载体（Listening 001~006 Task/LongTask/GenericsTask）
├── 返回值与类型验证
│   └── instanceof Task、taskId/function/arguments 只读 props（未取证）
└── 并发跨线程
    └── Task 跨 worker 执行
```

- **用例位置**：`TaskListening.test.ets` `0100`~`0600` 载体 + `TaskDispatchQueueTest` 0700/0800/0900、`TaskQueueCoordTest` 1300/1400、`TaskStateMachineTest` 0900 中 `new Task`。跨节归口。
- **测了哪些**：Task 构造 func+args 全载体；**未取证** name-variant 构造、只读 props（`function`/`arguments`/`name`/`taskId`/`*Duration`）。

---

## 1.2 Task.sendData

```
Task.sendData
├── 入参范围覆盖
│   └── sendData 数值/对象入参（Listening 001/StateMachine 0800/QueueCoord 1800）
├── 边界值测试
│   └── sendData 在 timeout 前/后触发与否（Timeout 0327 不触发/0328 触发）
├── 异常与非法输入
│   └── sendData 10200006/22/23（错误码取证见 taskpooltest）
├── 返回值与类型验证
│   └── onReceiveData 回调收到 sendData 数据正确
└── 并发跨线程
    └── sendData 跨 worker→宿主线程
```

- **用例位置**：`TaskListening.test.ets` 001/003~008/012、`TaskStateMachineTest` 0800、`TaskQueueCoordTest` 1800、`TaskTimeout` 0327/0328。共 ~8 例主归口。
- **测了哪些**：sendData 入参 + timeout 前后触发 + onReceiveData 数据正确。

---

## 1.3 Task.setTransferList

```
Task.setTransferList
├── 入参范围覆盖
│   └── setTransferList(list) 与 execute 联动（Timeout2 0352）
├── 返回值与类型验证
│   └── transfer list 生效、ArrayBuffer 所有权转移
└── 并发跨线程
    └── Task 子线程接收 transfer 对象
```

- **用例位置**：`TaskTimeout2.test.ets` `0352`（setTransferList）。共 1 例。
- **测了哪些**：setTransferList 与 execute 联动。

---

## 1.4 Task.setCloneList

```
Task.setCloneList
├── 入参范围覆盖
│   └── setCloneList(list) Object[]/ArrayBuffer[]（Timeout 0337/0338、Timeout2 0353）
├── 返回值与类型验证
│   └── clone list 生效、对象克隆传递
└── 并发跨线程
    └── Task 子线程接收 clone 对象
```

- **用例位置**：`TaskTimeout.test.ets` `0337`/`0338`、`TaskTimeout2.test.ets` `0353`。共 3 例。
- **测了哪些**：setCloneList 与 execute 联动 + Object[]/ArrayBuffer[] 入参。

---

## 1.5 Task 生命周期回调（onReceiveData/onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded）

```
Task 生命周期回调
├── 入参范围覆盖
│   ├── onReceiveData 收 sendData 数据（Listening 001/003~008/012、StateMachine 0800、QueueCoord 1800）
│   ├── onEnqueued/onStartExecution 触发与计数（Listening 全 12 例、Timeout2 0369/0370）
│   ├── onExecutionFailed task 失败触发（Listening 009/010、Timeout2 0367）
│   └── onExecutionSucceeded 成功触发（Listening、Timeout2 0366）
├── 边界值测试
│   └── 回调嵌套 task 各生命周期触发点（Listening 001~012 各 listener）
├── 异常与非法输入
│   └── onExecutionFailed 在 task 执行失败时触发
├── 返回值与类型验证
│   ├── 各回调计数符合预期
│   └── timeout 后 onEnqueued/onStartExecution 状态验证（Timeout 0330/0331）
├── 组合场景
│   ├── 8 种 task 类型 × 各 listener 嵌套（Listening 001~008）
│   ├── listener 内再嵌套 task+priority 组合（Listening 010/011/012）
│   └── timeout+回调组合（Timeout2 0364~0372 onReceiveData/onEnqueued/onStartExecution/Promise.then/catch）
└── 并发跨线程
    └── listener 内嵌套 task 跨线程派发
```

- **用例位置**：`TaskListening.test.ets` `0100`~`1200`（12 例）+ `TaskTimeout2.test.ets` `0364`/`0366`/`0367`/`0368`/`0369`/`0370`/`0371`/`0372`（listener 内嵌套 timeout task×8）+ `TaskTimeout` 0330/0331。共 ~22 例主归口。
- **测了哪些**：Task 全套生命周期回调 + 计数 + 嵌套组合 + timeout 状态。

---

## 1.6 Task.addDependency

```
Task.addDependency
├── 入参范围覆盖
│   └── addDependency(Task[]) 入参（Timeout 0312/0313/0324/0325）
├── 边界值测试
│   └── addDependency 在 timeout=0 时放开约束（Timeout 0324/0325）
├── 异常与非法输入
│   ├── TimeoutTask 禁止 addDependency→约束（Timeout 0312/0313）
│   └── Task 禁止 addDependency TimeoutTask→约束（Timeout 0313）
└── 组合场景
    └── timeout=0 时 addDependency 可用且可重复（Timeout 0324/0325）
```

- **用例位置**：`TaskTimeout.test.ets` `0312`/`0313`/`0324`/`0325`。共 4 例。
- **测了哪些**：addDependency 入参 + TimeoutTask 互斥约束 + timeout=0 放开；**未取证** `Task.removeDependency`。

---

## 1.7 taskpool.execute

```
taskpool.execute
├── 入参范围覆盖
│   └── execute(task)/execute(task,Priority)/execute(group,Priority)/execute(task,Configs) 多重载（DispatchQueue 0700~0900、QueueCoord 1300/1400、StateMachine 0900、TaskGroup 0002）
├── 异常与非法输入
│   └── execute 被取消 task again（Timeout2 0397）
├── 返回值与类型验证
│   └── execute 返回 Promise<Object> 结果正确
├── 组合场景
│   └── 派发队列 producer×consumer 跨线程协调（DispatchQueue 0700/0800/0900、QueueCoord 1300/1400）
├── 重复调用/幂等性
│   └── execute 同 task 多次（DispatchQueue 0800/0900、QueueCoord 1300/1400 内 Promise.all）
└── 并发跨线程
    └── 多 producer/consumer 并发 execute（DispatchQueue ×20、QueueCoord ×5~10、StateMachine ×20）
```

- **用例位置**：`TaskDispatchQueueTest` 0700/0800/0900、`TaskQueueCoordTest` 1300/1400、`TaskStateMachineTest` 0900、`TaskGroupTest` 0002。共 ~9 例主归口。
- **测了哪些**：execute 多重载 + Promise 结果 + 并发协调；**未取证** `execute(func,...args)` 纯函数重载（仅 TaskGroup 间接用）、`getTaskPoolInfo`/`isConcurrent`/`getTask`。

---

## 1.8 taskpool.executeDelayed

```
taskpool.executeDelayed
├── 入参范围覆盖
│   └── executeDelayed(delayTime,task,Priority)（Listening 007、Timeout2 0379）
├── 边界值测试
│   └── 延时触发时机
├── 返回值与类型验证
│   └── 延时执行结果
└── 并发跨线程
    └── TaskPool 子线程延时执行
```

- **用例位置**：`TaskListening.test.ets` `0700`（executeDelayed）、`TaskTimeout2.test.ets` `0379`。共 2 例。
- **测了哪些**：executeDelayed 延时派发；**未取证** delayTime 边界（0/负/极大/NaN）。

---

## 1.9 taskpool.executePeriodically

```
taskpool.executePeriodically
├── 入参范围覆盖
│   └── executePeriodically(period,task,Priority)（Listening 008）
├── 返回值与类型验证
│   └── 周期触发结果
└── 并发跨线程
    └── TaskPool 子线程周期执行
```

- **用例位置**：`TaskListening.test.ets` `0800`（executePeriodically）。共 1 例。
- **测了哪些**：executePeriodically 周期派发；**仅 1 例**。

---

## 1.10 taskpool.cancel

```
taskpool.cancel
├── 入参范围覆盖
│   └── cancel(task)/cancel(group)（Timeout2 0390~0406/0418~0424）
├── 边界值测试
│   └── cancel 各时机——before/after/executing/waiting/group/partial/simultaneously/again/outer-inner（Timeout2 0390~0403/0405/0406）
├── 异常与非法输入
│   ├── cancel 不存在/已执行 task（Timeout2 0397/0399/0401/0402）
│   └── cancel+exception+timeout 三者嵌套异常路径（Timeout2 0418/0419/0420/0421/0423/0424）
├── 返回值与类型验证
│   └── cancel 后 task 状态（catch 分支）
├── 组合场景
│   ├── cancel×timeout×exception 嵌套组合（Timeout2 0418~0424）
│   └── outer-cancel-inner-timeout/inner-cancel-outer-timeout（Timeout2 0398~0402）
└── 并发跨线程
    └── 多 timeout 并发 cancel（Timeout2 0390~0406）
```

- **用例位置**：`TaskTimeout2.test.ets` `0390`~`0403`/`0405`/`0406`（cancel×timeout×16）、`0418`/`0419`/`0420`/`0421`/`0423`/`0424`（cancel+exception+timeout×6）+ `TaskListening` 007 cancel executeDelay。共 ~22 例主归口。
- **测了哪些**：cancel 各时机 + cancel×timeout×exception 嵌套；**未取证** `cancel(taskId:number)` 重载。

---

## 1.11 taskpool.terminateTask

```
taskpool.terminateTask
├── 入参范围覆盖
│   └── terminateTask(LongTask)（Timeout 0315、Timeout2 0383~0389，跨节 §1.19）
├── 返回值与类型验证
│   └── terminateTask 后 LongTask worker 释放
└── 并发跨线程
    └── terminateTask 管理 worker 生命周期
```

- **用例位置**：`TaskTimeout.test.ets` `0315`、`TaskTimeout2.test.ets` `0383`~`0389`（均含 terminateTask 收尾）。共 ~8 例（与 §1.19 LongTask 同例）。
- **测了哪些**：terminateTask(LongTask) 收尾；**未取证** terminateTask Other场景。

---

## 1.12 TaskGroup constructor

```
TaskGroup constructor
├── 入参范围覆盖
│   ├── constructor()（TaskGroup 0002、Timeout 0307/0314）
│   └── constructor(name)（Listening 002 'testGroup'）
├── 边界值测试
│   └── 空 TaskGroup set timeout（Timeout 0307）
├── 返回值与类型验证
│   └── instanceof TaskGroup
└── 组合场景
    └── construct + addTask + execute（TaskGroup 0002）
```

- **用例位置**：`TaskGroupTest.test.ets` `0002`、`TaskTimeout` 0307/0314、`TaskListening` 002。共 ~4 例主归口。
- **测了哪些**：TaskGroup 默认/带名构造 + 空 group timeout。

---

## 1.13 TaskGroup addTask

```
TaskGroup addTask
├── 入参范围覆盖
│   ├── addTask(func,...args) 函数重载（TaskGroup 0002）
│   └── addTask(task) Task 重载（TaskGroup 0002、Listening 002、Timeout 0304~0306）
├── 异常与非法输入
│   └── TaskGroup 内 task throw before/after timeout（Timeout 0304/0305/0306）
├── 返回值与类型验证
│   └── execute(group) 返回 Promise<Object[]> 顺序与 addTask 顺序一致（TaskGroup 0002）
└── 并发跨线程
    └── group 内多 task 跨 worker 执行（TaskGroup 0002）
```

- **用例位置**：`TaskGroupTest.test.ets` `0002`、`TaskTimeout` 0304/0305/0306、`TaskListening` 002。共 ~5 例主归口。
- **测了哪些**：addTask 两重载 + 异常传播 + 顺序结果；**仅 1 例 happy path**。

---

## 1.14 TaskGroup name

```
TaskGroup name
├── 入参范围覆盖
│   └── name 属性（Listening 002 'testGroup'）
└── 返回值与类型验证
    └── name 读回一致
```

- **用例位置**：`TaskListening.test.ets` `0200`（name 'testGroup'）。共 1 例。
- **测了哪些**：name 属性读回；**仅 1 例**。

---

## 1.15 SequenceRunner constructor

```
SequenceRunner constructor
├── 入参范围覆盖
│   └── constructor(Priority)（Listening 003 Priority.HIGH）
└── 返回值与类型验证
    └── instanceof SequenceRunner
```

- **用例位置**：`TaskListening.test.ets` `0300`（constructor(Priority.HIGH)）。共 1 例。
- **测了哪些**：SequenceRunner constructor(Priority)；**未取证** `constructor(name,priority)` 全局命名队列重载。

---

## 1.16 SequenceRunner execute

```
SequenceRunner execute
├── 入参范围覆盖
│   └── SequenceRunner.execute(task)（Listening 003、Timeout2 0361/0363）
├── 边界值测试
│   └── nested AsyncRunner/SequenceRunner inner timeout shorter/longer（Timeout2 0425~0428、0429~0432 跨节 §1.13）
├── 返回值与类型验证
│   ├── runner.execute 返回 Promise<Object> 结果（Listening 003）
│   └── nested runner 结果传播（Timeout2 0361/0363）
├── 组合场景
│   ├── SequenceRunner task with nested timeout task/task group（Timeout2 0361/0363）
│   └── AsyncRunner onReceiveData with nested timeout task（Timeout2 0364 跨节 §1.5）
└── 并发跨线程
    └── runner 内 task 跨 worker 执行
```

- **用例位置**：`TaskTimeout2.test.ets` `0361`/`0363`/`0425`/`0426`/`0427`/`0428`（8 例含 nested）+ `TaskListening` 003。共 ~7 例主归口。
- **测了哪些**：SequenceRunner execute + nested timeout；**未取证** dependent/periodic/delayed task 禁入 runner 的约束错误码。

---

## 1.17 AsyncRunner constructor

```
AsyncRunner constructor
├── 入参范围覆盖
│   └── constructor(name,runningCapacity,waitingCapacity)（Listening 004 'async',3,3、010 caseName,50）
└── 返回值与类型验证
    └── instanceof AsyncRunner
```

- **用例位置**：`TaskListening.test.ets` `0400`/`1000`（constructor）。共 2 例。
- **测了哪些**：AsyncRunner constructor(name,capacities)；**未取证** 丢弃策略（waitingCapacity 溢出）。

---

## 1.18 AsyncRunner execute

```
AsyncRunner execute
├── 入参范围覆盖
│   └── AsyncRunner.execute(task,priority?)（Listening 004/010、Timeout2 0360/0362）
├── 边界值测试
│   └── nested AsyncRunner inner timeout shorter/longer（Timeout2 0425~0428）
├── 返回值与类型验证
│   └── runner.execute 返回 Promise<Object> 结果（Listening 004/010）
├── 组合场景
│   └── AsyncRunner task with nested timeout task/task group（Timeout2 0360/0362）
└── 并发跨线程
    └── AsyncRunner 并发容量（runningCapacity 3/50）
```

- **用例位置**：`TaskTimeout2.test.ets` `0360`/`0362`（nested）+ `TaskListening` 004/010。共 ~4 例主归口。
- **测了哪些**：AsyncRunner execute + nested timeout + 并发容量。

---

## 1.19 LongTask constructor

```
LongTask constructor
├── 入参范围覆盖
│   └── LongTask constructor(func,args)（Listening 005、Timeout 0315、Timeout2 0383~0389）
├── 边界值测试
│   ├── LongTask configs timeout=0/仅 priority/空 configs（Timeout2 0386/0387/0388）
│   ├── LongTask set timeout（Timeout 0315）
│   └── timeout task with LongTask inside（Timeout2 0385）
├── 异常与非法输入
│   └── LongTask 不应被 timeout 限制（.d.ets L611 注释；Timeout 0315 验证 LongTask set timeout 行为）
├── 返回值与类型验证
│   └── LongTask execute 返回结果（Listening 005）
├── 组合场景
│   ├── LongTask nested timeout task/task group（Timeout2 0383/0384）
│   └── LongTask callback with nested timeout task（Timeout2 0389）
└── 并发跨线程
    └── LongTask 独占 worker 直至 terminateTask（Timeout2 0383~0389）
```

- **用例位置**：`TaskTimeout.test.ets` `0315`（LongTask set timeout + terminateTask，1 例）+ `TaskTimeout2.test.ets` `0383`/`0384`/`0385`/`0386`/`0387`/`0388`/`0389`（LongTask×7，均含 terminateTask 收尾）+ `TaskListening` 005。共 ~9 例主归口。
- **测了哪些**：LongTask 构造 + timeout/nested 上下文 + terminateTask 收尾；**未取证** LongTask 与依赖/队列互斥约束错误码。

---

## 1.20 GenericsTask constructor

```
GenericsTask constructor
├── 入参范围覆盖
│   └── GenericsTask constructor(func,args)（Listening 006、Timeout 0497 跨节 §1.21、Timeout2 0344）
├── 返回值与类型验证
│   └── GenericsTask execute<R> 返回（Listening 006、Timeout2 0344）
└── 组合场景
    └── GenericsTask + timeout（Timeout2 0344）
```

- **用例位置**：`TaskTimeout2.test.ets` `0344`（GenericsTask+timeout）+ `TaskListening` 006。共 ~2 例主归口。
- **测了哪些**：GenericsTask 构造 + execute<R> + timeout；**未取证** name-variant 构造。

---

## 1.21 Configs（timeout/priority）

```
Configs 接口（timeout?/priority?）
├── 入参范围覆盖
│   ├── Configs(undefined/空对象/仅 priority/timeout+priority)（Timeout 0275~0278）
│   ├── timeout 取值 0/-1/-100/小数/Infinity/-Infinity/NaN/undefined/等于执行时间/略大/略小/>int32_max/MAX_SAFE_INTEGER/MIN_VALUE（Timeout 0280~0298）
│   ├── priority HIGH/MEDIUM/LOW/IDLE/undefined/MEDIUM（Timeout 0288~0290/0332、Timeout2 0339~0342）
│   ├── Task/GenericsTask/TaskGroup set timeout（Timeout 0496/0497/0498）
│   └── sendable/ArrayBuffer params（Timeout 0333~0336、Timeout2 0350/0351）
├── 边界值测试
│   ├── timeout 全边界矩阵（同上 0280~0298）
│   ├── priority 999→401（Timeout 0289）
│   ├── timeout 略小于执行时间→10200058（Timeout 0297）
│   └── timeout>int32_max 归 0（Timeout 0293）
├── 异常与非法输入
│   ├── configs undefined→401（Timeout 0275）
│   ├── configs type error(123)→401（Timeout 0279）
│   ├── priority 999→401（Timeout 0289）
│   ├── serialization error（Timeout 0299）
│   ├── AsyncTask/ExecutedTask/SequenceTask 禁止 set timeout（Timeout 0300/0301/0311）
│   ├── Task/TaskGroup throw before/after timeout（Timeout 0302/0303/0304~0306）
│   └── exception before/after/simultaneously timeout、taskgroup partial/all exception、async reject（Timeout2 0408~0417、0411/0412 inner/outer）
├── 返回值与类型验证
│   ├── timeout 触发→catch 10200058（Timeout 0297、Timeout2 0343/0345）
│   ├── 不触发→正常 result（Timeout 0280~0298 多数）
│   └── 不同 priority 下的派发顺序（Timeout 0288/0332、Timeout2 0339~0342）
├── 组合场景
│   ├── priority×timeout 组合（Timeout2 0339~0342）
│   ├── 多 timeout 并发（Timeout2 0347）、timeout+normal 并发（Timeout2 0348）
│   ├── nested timeout（普通内/timeout内/不同 timeout/多层）（Timeout2 0354~0359）
│   ├── Delayed/Periodic task set timeout（Timeout 0309/0310、Timeout2 0379/0381）
│   └── Worker onmessage with timeout task（Timeout2 0378）
├── 重复调用/幂等性
│   ├── timeout=0 可重复 execute（Timeout 0316/0317）
│   ├── 不设 timeout 可重复 execute（Timeout 0318）
│   └── 负 timeout/空 configs 不触发约束可重复（Timeout 0319/0320）
└── 并发跨线程
    ├── timeout 任务子线程（Timeout 全节）
    └── 多 timeout 并发跨 worker（Timeout2 0347/0348）
```

- **用例位置**：`TaskTimeout.test.ets` `0496`/`0497`/`0498`、`0275`~`0298`、`0299`、`0300`/`0301`/`0302`/`0303`/`0308`/`0309`/`0310`/`0311`、`0316`/`0317`/`0318`/`0319`/`0320`、`0332`/`0333`/`0334`/`0335`/`0336`、`1001`~`1004`（51 例）+ `TaskTimeout2.test.ets` `0339`/`0340`/`0341`/`0342`/`0343`/`0347`/`0348`/`0350`/`0351`/`0354`/`0355`/`0356`/`0358`/`0359`/`0365`/`0378`/`0379`/`0381`/`0408`/`0409`/`0410`/`0411`/`0412`/`0415`/`0416`/`0417`（25 例）。共 76 例主归口。
- **测了哪些**：Configs timeout/priority 全矩阵 + 全边界 + 401/10200058 错误码 + 约束 + 重复执行 + 嵌套/并发/异常×timeout；**未取证** `taskpool.State` 枚举（0 用例——StateMachine 用的是自建 `TaskState`）。

---

## 1.22 Priority 枚举

```
Priority 枚举
├── 入参范围覆盖
│   └── Priority.HIGH/MEDIUM/LOW/IDLE（Timeout 0288~0290/0332、Timeout2 0339~0342、TaskGroup 0002 Priority.HIGH）
├── 边界值测试
│   └── priority 999→401（Timeout 0289）
└── 返回值与类型验证
    └── 不同 priority 下的派发顺序（Timeout 0288/0332、Timeout2 0339~0342）
```

- **用例位置**：`TaskTimeout` 0288~0290/0332、`TaskTimeout2` 0339~0342、`TaskGroupTest` 0002。跨节归口（与 §1.21 Configs 同例）。
- **测了哪些**：Priority 4 枚举值 + 999→401 + 派发顺序。

---

# 2. 稳定性

- **用例位置**：`TaskTimeout2.test.ets` 多 timeout 并发、多层嵌套 timeout。
- **测了哪些**：多 timeout 并发 + 多层嵌套稳定性；**无长时/GC 压力专项**。

# 3. 性能

- **用例位置**：`TaskTimeout2.test.ets` 多 timeout 并发、多 task group 并发 timeout。
- **测了哪些**：多 timeout 并发吞吐；**无独立时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`TaskTimeout2.test.ets` cancel×exception×timeout 竞态（`0390`~`0406`、`0418`~`0424`）、nested cancel。
- **测了哪些**：cancel/exception/timeout 三者竞态一致性；**无多写者写写逐元素正确性断言，多为不抛错即通过**。

# 5. 兼容性与继承

- **用例位置**：`TaskTimeout.test.ets` GenericsTask/TaskGroup set timeout、`TaskTimeout2` Mixed/TaskGroup nested、`Listening 005/006` LongTask/GenericsTask 载体。
- **测了哪些**：GenericsTask/TaskGroup/Mixed/LongTask 在 timeout 与 listener 上下文行为；**未见 Task/TaskGroup 子类化继承用例**（LongTask/GenericsTask 仅用框架内置子类）。

# 6. 资料与文档符合性

- **用例位置**：`TaskTimeout.test.ets` 401/10200058 错误码、configs 契约、约束（AsyncTask/ExecutedTask/SequenceTask/TimeoutTask addDependency）。
- **测了哪些**：configs/timeout/priority 契约 + 401/10200058 错误码符合性；**未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵（按真实 `@ohos.taskpool` API）

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖。主接口归口计数，22 行之和 = 209；跨节用例在各 API 树中另列。

| 真实接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Task constructor | ✅(全载体) | 🟡 | 🟡 | ✅instanceof | 🟡 | — | ✅ |
| Task.sendData | ✅ | ✅(timeout前后) | ✅(10200006/22/23在taskpooltest) | ✅(数据) | ✅ | 🟡 | ✅ |
| Task.setTransferList | ✅(1) | 🟡 | 🟡 | ✅(生效) | 🟡 | ❌ | ✅ |
| Task.setCloneList | ✅(3) | 🟡 | 🟡 | ✅(生效) | 🟡 | ❌ | ✅ |
| Task 生命周期回调（5） | ✅(22) | ✅(触发点/sendData前后) | ✅(onExecutionFailed) | ✅(计数/数据) | ✅(8类型×listener嵌套) | 🟡(timeout=0) | ✅ |
| Task.addDependency | ✅(4) | ✅(timeout=0放开) | ✅(TimeoutTask约束) | 🟡 | ✅(timeout=0重复) | 🟡 | 🟡 |
| taskpool.execute | ✅(多重载) | 🟡 | ✅(被取消again) | ✅(Promise) | ✅(producer×consumer) | ✅(同task多次) | ✅(×20并发) |
| taskpool.executeDelayed | ✅(2) | 🟡(delayTime边界未取证) | 🟡 | ✅(结果) | 🟡 | 🟡 | ✅ |
| taskpool.executePeriodically | ✅(1) | 🟡 | 🟡 | ✅(触发) | 🟡 | 🟡 | ✅ |
| taskpool.cancel | ✅(各时机) | ✅(各状态) | ✅(不存在/again) | ✅(状态) | ✅(cancel×timeout×exception) | 🟡 | ✅(多并发) |
| taskpool.terminateTask | ✅(8) | 🟡 | 🟡 | ✅(释放) | ✅(LongTask收尾) | 🟡 | ✅(独占worker) |
| TaskGroup constructor | ✅(4) | ✅(空group) | 🟡 | ✅instanceof | ✅ | 🟡 | ✅ |
| TaskGroup addTask | ✅(2重载) | 🟡 | ✅(throw before/after) | ✅(顺序结果) | 🟡 | 🟡 | ✅ |
| TaskGroup name | ✅(1) | 🟡 | 🟡 | ✅(读回) | 🟡 | 🟡 | 🟡 |
| SequenceRunner constructor | ✅(1) | 🟡 | 🟡 | ✅instanceof | 🟡 | 🟡 | 🟡 |
| SequenceRunner execute | ✅(7) | ✅(inner shorter/longer) | 🟡 | ✅(Promise) | ✅(nested timeout) | 🟡 | ✅ |
| AsyncRunner constructor | ✅(2) | 🟡 | 🟡 | ✅instanceof | 🟡 | 🟡 | ✅(容量) |
| AsyncRunner execute | ✅(4) | ✅(inner shorter/longer) | 🟡 | ✅(Promise) | ✅(nested timeout) | 🟡 | ✅(容量) |
| LongTask constructor | ✅(9) | ✅(configs timeout=0/仅priority/空) | 🟡(子类约束未取证) | ✅(结果) | ✅(nested/terminateTask收尾) | 🟡 | ✅(独占worker) |
| GenericsTask constructor | ✅(2) | 🟡 | 🟡 | ✅(execute<R>) | ✅(+timeout) | 🟡 | 🟡 |
| Configs（timeout/priority） | ✅(76) | ✅(全边界) | ✅(401/10200058/约束/throw) | ✅(timeout触发/不触发/priority顺序) | ✅(priority×timeout/嵌套/并发) | ✅(timeout=0/不设可重复) | ✅ |
| Priority 枚举 | ✅(4枚举) | ✅(999→401) | ✅(999→401) | ✅(派发顺序) | ✅(priority×timeout) | 🟡 | 🟡 |

**未覆盖的真实公共 API（0 用例）**：`taskpool.State` 枚举（WAITING/RUNNING/CANCELED）、`Task.isCanceled`、`Task.isDone`、`Task.removeDependency`、`taskpool.getTaskPoolInfo`、`taskpool.isConcurrent`、`taskpool.getTask`、`cancel(taskId:number)` 重载、`TaskInfo`/`ThreadInfo`/`TaskPoolInfo` 类、`TaskResult` 接口、Task name-variant 构造、Task 只读 props（`function`/`arguments`/`name`/`taskId`/`totalDuration`/`ioDuration`/`cpuDuration`）。

## 7.2 本套件缺口简要（自包含）

1. **真实 API 大面积未取证**：`State` 枚举、`isCanceled`/`isDone`、`removeDependency`、`getTaskPoolInfo`/`isConcurrent`/`getTask`、`cancel(taskId)`、`TaskResult`、Task props 等 0 用例（见 7.1 末段）。
2. **39 例 desc 模式化**：`TaskDispatchQueue/TaskQueueCoord/TaskStateMachine` 共 39 例 desc 均为 "Verify testX0X00 behavior"，形态定位弱；且其中 31 例（8+14+9）为用户 `@Sendable` 队列/状态机类宿主线程行为，**未触达任何 `@ohos.taskpool` API**。
3. **TaskGroup happy path 仅 1 例**：覆盖窄，无独立异常/约束/重复取证（异常路径依赖 timeout 上下文）。
4. **重复幂等弱**：DispatchQueue/QueueCoord/StateMachine/Listening/Timeout2 无重复稳定取证。
5. **多写者竞态未覆盖**：cancel×exception×timeout 多为不抛错即通过，无逐元素正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | cancel×exception×timeout 逐元素正确性断言 | 竞态掩盖真实数据损坏。 |
| P2 | 2 | 7.1 末段 0 用例真实 API 补齐（State/isCanceled/isDone/getTaskPoolInfo/getTask 等）/ 39 例模式化 desc 细化并改为真实 taskpool API 取证 | 修正"用 taskpool 名义测自建 Sendable 类"的归类偏差。 |
| P3 | 2 | TaskGroup 补强 / 重复幂等 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 真实 API 入参全类型/全 task 类型/configs 矩阵/嵌套组合 | Listening 001~012、Timeout 0275~0298、Timeout2 0339~0359 |
| ②边界值测试 | timeout/priority 全边界、嵌套 inner shorter/longer、cancel/exception 各时机、回调触发点 | Timeout 0274~0298、Timeout2 0339~0432 |
| ③异常与非法输入 | 401/10200058、约束、throw、exception 各时机、addDependency 约束 | Timeout 0275/0279/0297/0312/0313、Timeout2 0408~0424 |
| ④返回值与类型验证 | Promise 结果/回调计数/sendData 数据/cancel 后状态/exception 传播 | 全套件 |
| ⑤组合场景 | listener×priority、priority×timeout、约束×重复、三者嵌套、AsyncRunner/SequenceRunner nested | Listening、Timeout、Timeout2 |
| ⑥重复调用幂等性 | timeout=0 可重复、不设 timeout 可重复 | Timeout 0316~0324 |
| ⑦并发跨线程 | 派发/队列/状态/嵌套/timeout 跨 worker、多 timeout 并发 | 全套件跨线程用例 |
