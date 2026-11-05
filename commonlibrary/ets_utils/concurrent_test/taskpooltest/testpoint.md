# taskpooltest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`taskpool` 主接口全场景」——覆盖 execute/Task/TaskGroup/SequenceRunner/AsyncRunner 构造与执行、cancel（task/taskId/taskGroup 各状态）、isCanceled、sendData/onReceiveData、getTaskPoolInfo、addDependency/removeDependency、executeDelayed/executePeriodically、isDone/isConcurrent/terminateTask/getTask/Priority/State、全错误码 assertEqual 矩阵（10200006/15/18/22/23/25/26/27/28/29/34/50/51/52/54/55/56/57）、多线程 Dynamics/Share、execute(func) smoke。
> **数据来源**：`taskpooltest/entry/src/ohosTest/ets/test/` 下 11 个 `*.test.ets`，共解析 **718** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（execute/Task/TaskGroup/SequenceRunner/AsyncRunner/LongTask/GenericsTask/State/Priority/Configs/cancel/executeDelayed/executePeriodically/getTaskPoolInfo/terminateTask/isConcurrent/getTask）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
taskpooltest（taskpool 主接口全场景）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 taskpool.execute               ├── 1.16 Task.addDependency
│   ├── 1.2 Task constructor               ├── 1.17 Task.removeDependency
│   ├── 1.3 GenericsTask constructor       ├── 1.18 taskpool.executeDelayed
│   ├── 1.4 LongTask constructor           ├── 1.19 taskpool.executePeriodically
│   ├── 1.5 TaskGroup constructor         ├── 1.20 Task.isDone
│   ├── 1.6 TaskGroup addTask              ├── 1.21 taskpool.isConcurrent
│   ├── 1.7 SequenceRunner constructor    ├── 1.22 taskpool.terminateTask
│   ├── 1.8 SequenceRunner execute         ├── 1.23 taskpool.getTask
│   ├── 1.9 AsyncRunner constructor        ├── 1.24 Priority 枚举
│   ├── 1.10 AsyncRunner execute           ├── 1.25 State 枚举
│   ├── 1.11 taskpool.cancel               ├── 1.26 全错误码 assertEqual 矩阵（跨切面主题）
│   ├── 1.12 Task.isCanceled               ├── 1.27 参数覆盖 null/undefined/empty（跨切面主题）
│   ├── 1.13 Task.sendData                 ├── 1.28 多线程 Dynamics/Share（跨切面主题）
│   ├── 1.14 Task.onReceiveData            └── 1.29 execute(func) smoke（跨切面主题）
│   └── 1.15 taskpool.getTaskPoolInfo
├── 2. 稳定性              （10 线程 Dynamics/Share、长时）
├── 3. 性能                （share type 矩阵、无独立基线）
├── 4. 并发安全            （10 线程共享、多线程 SequenceRunner）
├── 5. 兼容性与继承        （TaskGroup/SequenceRunner/LongTask）
└── 6. 资料与文档符合性     （全错误码 assertEqual + configs 契约）
```

**测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | Ability.test.ets | 202 | Task/execute/cancel/isCanceled/sendData/getTaskPoolInfo/Priority/executePeriodically + SequenceRunner/addDependency/executeDelayed + 长时/约束/嵌套综合 |
| 2 | Cancel.test.ets | 45 | cancel(taskId) + 各 task 类型 cancel + microjob + TreeSet + getTask ×多 |
| 3 | TaskPool1.test.ets | 191 | execute/terminateTask/isConcurrent/sendData ×多 + addDependency/removeDependency + 6 回调 + isDone + Priority + cancel + combine scenes + executePeriodically + State + TaskGroup/LongTask/SequenceRunner + share type |
| 4 | TaskPoolCoverage.test.ets | 110 | 全 API null/undefined/empty 参数覆盖 + 10200014 + getTask + AsyncRunner |
| 5 | TaskPoolTaskGroupDynamicsTest.test.ets | 24 | 10 taskPool 线程动态 import ×24 |
| 6 | TaskPoolTaskGroupShareTest.test.ets | 24 | 10 taskpool/worker 线程 promise/await 共享 ×24 |
| 7 | TaskPoolTest.test.ets | 6 | execute(func) smoke（happy/two/many/chained/repeat） |
| 8 | Taskpool.test.ets | 54 | getTaskPoolInfo/execute/executeDelayed/cancel/Priority/Task Constructor/TaskGroup/SequenceRunner/State/Error ×多 |
| 9 | TaskpoolErrorCode.test.ets | 59 | 全错误码 assertEqual（10200006~10200057） |
| 10 | TaskpoolTestState.test.ets | 2 | State 串行任务态 ×2 |
| 11 | TaskpoolTestTask.test.ets | 1 | Task 串行 |
| | **合计** | **718** | taskpool 全接口 |

---

# 1. 接口测试

## 1.1 taskpool.execute

```
taskpool.execute
├── 入参范围覆盖
│   ├── execute(func/task)（TaskPool1 0100~0400）
│   ├── execute + share type 矩阵 17 类型（TaskPool1 7700~9200）
│   └── execute + Task/Execute ×多（TaskPool1 9100~5500）
├── 边界值测试
│   └── execute(func) happy/two/many/chained/repeat（TaskPoolTest smoke）
├── 异常与非法输入
│   └── execute throws 10200014 when func not @Concurrent
├── 返回值与类型验证
│   ├── execute 返回 Promise
│   └── share type 返回类型与值
├── 组合场景
│   └── execute + 嵌套 execute、share type ×多
├── 重复调用/幂等性
│   └── repeat 执行（TaskPoolTest smoke）
└── 并发跨线程
    └── TaskPool 子线程执行
```

- **用例位置**：`Ability.test.ets` `0196`~`0202`、`TaskPool1.test.ets` `0100`~`0400`/`7700`~`9200`/`9100`~`5500`、`TaskPoolTest.test.ets` `0001`~`0006`、`Taskpool.test.ets` `Execute001`~`019`。共 ~多数例。
- **测了哪些**：execute/Task 执行 + share type 17 类型 + 10200014 + 长时约束 + smoke。

---

## 1.2 Task constructor

```
Task constructor
├── 入参范围覆盖
│   └── new Task(func, args)（Taskpool Task Constructor、TaskPool1）
├── 边界值测试
│   └── long task only once、task group does not support long task
├── 返回值与类型验证
│   └── instanceof Task
└── 组合场景
    └── construct + execute（smoke）
```

- **用例位置**：`Taskpool.test.ets` Task Constructor 段、`TaskPool1`、`TaskpoolTestTask.test.ets` `4601`。共 ~多数例。
- **测了哪些**：Task 构造 + long task 约束。

---

## 1.3 GenericsTask constructor

```
GenericsTask constructor
├── 入参范围覆盖
│   └── new GenericsTask(func, args)（Ability 0202 sendableFunc、TaskPool1）
├── 返回值与类型验证
│   └── GenericsTask execute<R> 返回类型与值
└── 组合场景
    └── GenericsTask + execute + share type
```

- **用例位置**：`Ability.test.ets` `0202`（GenericsTask/sendableFunc）、`TaskPool1`。共 ~少数例。
- **测了哪些**：GenericsTask 构造 + execute<R>。

---

## 1.4 LongTask constructor

```
LongTask constructor
├── 入参范围覆盖
│   └── new LongTask(func, args)（Ability 0134~0136、TaskPool1 9900~0600）
├── 边界值测试
│   ├── long task only once（Ability 0135）
│   └── task group does not support long task（Ability 0136）
└── 返回值与类型验证
    └── LongTask execute 返回结果
```

- **用例位置**：`Ability.test.ets` `0134`~`0136`、`TaskPool1.test.ets` `9900`~`0600`。共 ~少数例。
- **测了哪些**：LongTask 构造 + 长时约束。

---

## 1.5 TaskGroup constructor

```
TaskGroup constructor
├── 入参范围覆盖
│   ├── constructor() 无 name（Taskpool 3100~3800）
│   └── constructor(string "") 带名
├── 返回值与类型验证
│   └── instanceof TaskGroup
└── 组合场景
    └── construct + addTask + execute（Ability 0201）
```

- **用例位置**：`Taskpool.test.ets` `3100`~`3800`、`Ability` 0201。共 ~少数例。
- **测了哪些**：TaskGroup constructor 默认/带名。

---

## 1.6 TaskGroup addTask

```
TaskGroup addTask
├── 入参范围覆盖
│   ├── addTask(func)（Taskpool）
│   └── addTask(LongTask)（TaskPool1 9100~9900）
├── 边界值测试
│   ├── taskGroup cannot add groupTask/seqRunnerTask/executedTask（Ability 0083~0088）
│   └── taskGroup cannot addTask
├── 异常与非法输入
│   ├── taskGroup cannot add ×多
│   └── dependent task not allowed
├── 返回值与类型验证
│   └── TaskGroup 执行结果、Priority 生效
└── 组合场景
    └── taskGroup + SequenceRunner/LongTask
```

- **用例位置**：`Ability.test.ets` `0083`~`0088`/`0201`/`0204`、`TaskPool1` `9100`~`9900`、`Taskpool` addTask 段。共 ~多数例。
- **测了哪些**：addTask 两重载 + 互斥约束（cannot add groupTask/seqRunnerTask/executedTask）。

---

## 1.7 SequenceRunner constructor

```
SequenceRunner constructor
├── 入参范围覆盖
│   └── constructor(无 name/带 name/同 name)（Taskpool 3900~4700、TaskPool1 0600~1800）
├── 返回值与类型验证
│   └── instanceof SequenceRunner
└── 组合场景
    └── SequenceRunner with name execute task
```

- **用例位置**：`Taskpool.test.ets` `3900`~`4700`、`TaskPool1` `0600`~`1800`。共 ~多数例。
- **测了哪些**：SequenceRunner constructor + name + priority。

---

## 1.8 SequenceRunner execute

```
SequenceRunner execute
├── 入参范围覆盖
│   └── SequenceRunner.execute(task)（Ability 0050~0051/0146~0164）
├── 边界值测试
│   ├── SequenceRunner repeating tasks
│   ├── Repeat on same thread
│   └── Multi threaded
├── 异常与非法输入
│   ├── SequenceRunner cannot execute groupTask/seqRunnerTask/executedTask（Ability 0089~0103）
│   └── dependent task not allowed
├── 返回值与类型验证
│   └── SequenceRunner 串行执行结果
├── 组合场景
│   ├── SequenceRunner with name execute task/delayed task/executed task ×多
│   ├── task group in SequenceRunner
│   └── Tasks with dependencies
├── 重复调用/幂等性
│   ├── SequenceRunner repeating tasks
│   └── Repeat on same thread
└── 并发跨线程
    └── Multi threaded SequenceRunner
```

- **用例位置**：`Ability.test.ets` `0050`~`0051`/`0089`~`0103`/`0146`~`0164`、`Taskpool` `3900`~`4700`。共 ~多数例。
- **测了哪些**：SequenceRunner execute + name + priority + 互斥约束 + 串行执行 + 多线程。

---

## 1.9 AsyncRunner constructor

```
AsyncRunner constructor
├── 入参范围覆盖
│   └── constructor(name, runningCapacity, waitingCapacity)（TaskPoolCoverage AsyncRunner constructor）
├── 边界值测试
│   └── AsyncRunner constructor no params/empty name
└── 返回值与类型验证
    └── instanceof AsyncRunner
```

- **用例位置**：`TaskPoolCoverage.test.ets` AsyncRunner constructor no params/empty name 段。共 ~少数例。
- **测了哪些**：AsyncRunner constructor + empty name 边界。

---

## 1.10 AsyncRunner execute

```
AsyncRunner execute
├── 入参范围覆盖
│   └── AsyncRunner.execute(task, priority?)（TaskPoolCoverage AsyncRunner execute null/undefined）
├── 异常与非法输入
│   └── execute null/undefined → 401/10200014
└── 返回值与类型验证
    └── AsyncRunner execute 返回 Promise
```

- **用例位置**：`TaskPoolCoverage.test.ets` AsyncRunner execute null/undefined 段。共 ~少数例。
- **测了哪些**：AsyncRunner execute + null/undefined 参数。

---

## 1.11 taskpool.cancel

```
taskpool.cancel
├── 入参范围覆盖
│   └── cancel(task/taskId/taskGroup)（Cancel 0451~0495、Ability 0264~0273、TaskPool1 5200~7000）
├── 边界值测试
│   ├── cancel 未执行/进行中/已执行/不存在/多次/序列/各 task 状态
│   ├── cancel by taskId ×6（Cancel 0451~0456）
│   └── 各 task 类型 cancel（task/asyncTask/sequenceTask/delayTask/groupTask/longTask）
├── 异常与非法输入
│   └── handle cancel task error ×多、cancel 10200015/55/18
├── 返回值与类型验证
│   ├── isCanceled 状态
│   └── cancel 后 catch 触发
├── 组合场景
│   ├── cancel + executeDelayed
│   └── cancel 各 task 状态（TaskPool1 6500~7000 combine scenes）
├── 重复调用/幂等性
│   └── canceling unexecuted tasks multiple times
└── 并发跨线程
    └── cancel 跨线程
```

- **用例位置**：`Cancel.test.ets` `0451`~`0495`、`Ability.test.ets` `0264`~`0273`/`0108`/`0116`/`0117`/`0132`/`0133`/`0145`、`TaskPool1.test.ets` `5200`~`7000`。共 ~多数例。
- **测了哪些**：cancel(task/taskId/taskGroup) ×各状态 + 各 task 类型 cancel + 错误码 10200015/55/18。

---

## 1.12 Task.isCanceled

```
Task.isCanceled
├── 入参范围覆盖
│   └── isCanceled 状态查询（Cancel、Ability 0264~0273）
├── 边界值测试
│   └── 各 task 状态：未执行/执行中/已执行/取消中
├── 返回值与类型验证
│   └── isCanceled 返回 boolean
└── 组合场景
    └── cancel + isCanceled 联动
```

- **用例位置**：`Cancel.test.ets`、`Ability.test.ets` `0264`~`0273`。共 ~少数例（与 §1.11 cancel 同例）。
- **测了哪些**：isCanceled 各状态 boolean。

---

## 1.13 Task.sendData

```
Task.sendData
├── 入参范围覆盖
│   └── sendData ×17 + catch（TaskPool1 0800~2400、Ability 0069/0189/0190、Taskpool 2600~2800）
├── 边界值测试
│   └── sendData 多次
├── 异常与非法输入
│   └── sendData 10200006/22/23
├── 返回值与类型验证
│   └── sendData 跨线程数据回传
└── 并发跨线程
    └── TaskPool 子线程↔主线程数据
```

- **用例位置**：`Ability.test.ets` `0069`/`0189`/`0190`、`TaskPool1.test.ets` `0800`~`2400`/`7600`、`Taskpool.test.ets` `2600`~`2800`。共 ~多数例。
- **测了哪些**：sendData 跨线程数据回传 + 10200006/22/23 错误码。

---

## 1.14 Task.onReceiveData

```
Task.onReceiveData
├── 入参范围覆盖
│   └── onReceiveData 注册/触发（TaskPool1 2500、Taskpool 2600~2800）
├── 异常与非法输入
│   └── onReceiveData 10200034/no param/no NoSerialize/no register
├── 返回值与类型验证
│   └── onReceiveData 回调触发、收到 sendData 数据
└── 组合场景
    └── sendData + onReceiveData 联动
```

- **用例位置**：`TaskPool1.test.ets` `2500`、`Taskpool.test.ets` `2600`~`2800`。共 ~少数例。
- **测了哪些**：onReceiveData 注册/触发 + 10200034/no param/no NoSerialize/no register。

---

## 1.15 taskpool.getTaskPoolInfo

```
taskpool.getTaskPoolInfo
├── 入参范围覆盖
│   └── getTaskPoolInfo 返回 threadInfos/taskInfos（Coverage GETTASKPOOLINFO_0100~0500、Ability 0260/0261、Taskpool 1300/1400）
├── 边界值测试
│   └── execute 后线程/任务信息
├── 返回值与类型验证
│   ├── threadInfos 数组、taskInfos 数组
│   └── state/duration/name 属性
└── 组合场景
    └── execute 后 getTaskPoolInfo
```

- **用例位置**：`TaskPoolCoverage.test.ets` `GETTASKPOOLINFO_RETURN_0100`~`0500`、`Ability.test.ets` `0260`/`0261`、`Taskpool.test.ets` `1300`/`1400`。共 ~少数例。
- **测了哪些**：getTaskPoolInfo 返回结构 + state/duration/name 属性；**无错误码取证**。

---

## 1.16 Task.addDependency

```
Task.addDependency
├── 入参范围覆盖
│   └── addDependency（多任务依赖图）（Ability 0052~0055/0141~0144、TaskPool1 2600~3700、Taskpool 2900）
├── 边界值测试
│   └── 依赖图各种形态：未执行/部分执行/long task/taskGroup/SequenceRunner
├── 异常与非法输入
│   ├── executedTask cannot addDependency
│   ├── groupTask/seqRunnerTask/executedTask cannot addDependency/be relied on
│   └── 10200026/52/56/27
├── 返回值与类型验证
│   └── 依赖顺序执行
└── 组合场景
    └── addDependency + taskGroup/SequenceRunner
```

- **用例位置**：`Ability.test.ets` `0052`~`0055`/`0087`/`0092`/`0094`~`0103`/`0109`/`0141`~`0144`、`TaskPool1.test.ets` `2600`~`3700`、`Taskpool.test.ets` `2900`。共 ~多数例。
- **测了哪些**：依赖图多形态 + executedTask/groupTask/seqRunnerTask 约束 + 10200026/52/56/27。

---

## 1.17 Task.removeDependency

```
Task.removeDependency
├── 入参范围覆盖
│   └── removeDependency（Ability 0052~0055、Taskpool 3000）
├── 返回值与类型验证
│   └── 移除依赖后执行顺序
└── 组合场景
    └── addDependency → removeDependency
```

- **用例位置**：`Ability.test.ets` `0052`~`0055`、`Taskpool.test.ets` `3000`。共 ~少数例。
- **测了哪些**：removeDependency 依赖图移除。

---

## 1.18 taskpool.executeDelayed

```
taskpool.executeDelayed
├── 入参范围覆盖
│   └── executeDelayed（Ability 0056~0058/0176~0182/0186、TaskPool1 7800、Taskpool 7800/0700）
├── 边界值测试
│   └── repeatedly calling Cancel and ExecuteDelayed only last executes（Ability 0174）
├── 异常与非法输入
│   ├── executeDelayed failed serialize result/arguments/task null/function
│   └── 10200028/50/51/57
├── 返回值与类型验证
│   └── 延时执行结果
└── 组合场景
    └── cancel + executeDelayed
```

- **用例位置**：`Ability.test.ets` `0056`~`0058`/`0176`~`0182`/`0186`、`TaskPool1.test.ets` `7800`、`Taskpool.test.ets` `7800`/`0700`。共 ~多数例。
- **测了哪些**：executeDelayed configs 矩阵 + 序列化失败 + 10200028/50/51/57。

---

## 1.19 taskpool.executePeriodically

```
taskpool.executePeriodically
├── 入参范围覆盖
│   └── executePeriodically（period/task名/优先级）（Ability 0165~0174、TaskPool1 7800~8600）
├── 边界值测试
│   └── repeatedly calling Cancel and ExecuteDelayed only last executes
├── 异常与非法输入
│   ├── executePeriodically failed serialize arguments
│   └── 10200028/50/51/57
├── 返回值与类型验证
│   └── 周期执行结果
└── 组合场景
    └── executePeriodically ×多 configs
```

- **用例位置**：`Ability.test.ets` `0165`~`0174`/`0180`/`0187`、`TaskPool1.test.ets` `7800`~`8600`。共 ~多数例。
- **测了哪些**：executePeriodically period/task名/优先级/依赖/已执行/周期/Other任务组/有依赖/SequenceRunner task 报错 + 10200028/50/51/57。

---

## 1.20 Task.isDone

```
Task.isDone
├── 入参范围覆盖
│   └── isDone 各状态查询（TaskPool1 4600~5000）
├── 边界值测试
│   └── isDone 各状态（未添加/未执行/执行中/已执行/取消中）
├── 返回值与类型验证
│   └── isDone boolean
└── 重复调用/幂等性
    └── isDone 多次读取
```

- **用例位置**：`TaskPool1.test.ets` `4600`~`5000`。共 5 例。
- **测了哪些**：isDone 5 状态 boolean。

---

## 1.21 taskpool.isConcurrent

```
taskpool.isConcurrent
├── 入参范围覆盖
│   └── isConcurrent（Ability 0137、TaskPool1 0600/0700）
├── 返回值与类型验证
│   └── isConcurrent boolean
└── 组合场景
    └── isConcurrent + execute
```

- **用例位置**：`Ability.test.ets` `0137`、`TaskPool1.test.ets` `0600`/`0700`。共 ~少数例。
- **测了哪些**：isConcurrent boolean。

---

## 1.22 taskpool.terminateTask

```
taskpool.terminateTask
├── 入参范围覆盖
│   └── terminateTask 终止入参（TaskPool1 0500）
├── 异常与非法输入
│   └── terminateTask null/undefined→401（见 Coverage）
└── 并发跨线程
    └── terminateTask 管理 worker 生命周期
```

- **用例位置**：`TaskPool1.test.ets` `0500`、`TaskPoolCoverage` terminateTask null/undefined。共 ~少数例。
- **测了哪些**：terminateTask 终止 + null/undefined→401。

---

## 1.23 taskpool.getTask

```
taskpool.getTask
├── 入参范围覆盖
│   └── getTask by taskId/empty/null/undefined name（Cancel 0485~0495、Coverage GETTASK_RETURN）
├── 边界值测试
│   └── empty/null/undefined name
├── 异常与非法输入
│   └── getTask empty/null/undefined name 处理
└── 返回值与类型验证
    └── getTask returns task with properties
```

- **用例位置**：`Cancel.test.ets` `0485`~`0495`、`TaskPoolCoverage.test.ets` `GETTASK_RETURN` 段。共 ~少数例。
- **测了哪些**：getTask by taskId/empty/null/undefined name + task properties。

---

## 1.24 Priority 枚举

```
Priority 枚举
├── 入参范围覆盖
│   └── Priority.HIGH/MEDIUM/LOW/IDLE（TaskPool1 5100、Ability 0288~0290/0332、TaskGroup 0002）
├── 边界值测试
│   └── priority 999→401
└── 返回值与类型验证
    └── 不同 priority 下的派发顺序
```

- **用例位置**：`TaskPool1.test.ets` `5100`、`Ability` 0288~0290/0332、`TaskGroupTest` 0002。共 ~少数例。
- **测了哪些**：Priority 4 枚举值 + 999→401 + 派发顺序。

---

## 1.25 State 枚举

```
State 枚举
├── 入参范围覆盖
│   └── State WAITING/RUNNING/CANCELED（TaskPool1 8700~9000、TaskpoolTestState 4501/4502）
├── 边界值测试
│   └── state waiting
└── 返回值与类型验证
    └── State 串行任务态
```

- **用例位置**：`TaskPool1.test.ets` `8700`~`9000`、`TaskpoolTestState.test.ets` `4501`/`4502`。共 ~少数例。
- **测了哪些**：State WAITING/RUNNING/CANCELED 4 状态 + 串行任务态。

---

## 1.26 全错误码 assertEqual 矩阵（跨切面主题）

```
全错误码 assertEqual 矩阵
├── 入参范围覆盖
│   └── 各 API 非法入参（no param/no register/no period 等）触发 18 错误码
├── 边界值测试
│   └── 各错误码触发场景
├── 异常与非法输入
│   └── 10200006/15/18/22/23/25/26/27/28/29/34/50/51/52/54/55/56/57 assertEqual
├── 返回值与类型验证
│   └── 错误码 assertEqual
└── 组合场景
    └── Task transferList/onReceiveData/addTask no param/no NoSerialize/no register/no period/two apis
```

- **用例位置**：`TaskpoolErrorCode.test.ets` `0300`~`6700`（59 例：Task sendData 10200006/22/23、transferList 10200029、addDependency 10200026/52/56/27、onEnqueued/onStartExecution/onExecutionFailed 10200034、SequenceRunner execute 10200006/25/51/57、taskpool execute 10200006/51/57、executeDelayed 10200006/28/51/57、executePeriodically 10200006/28/50/57、cancel 10200015/55/18、AsyncRunner 10200006/25/51/54/57、Task transferList/onReceiveData no param/no NoSerialize/no register、addTask no period/two apis、cancel 10200055、state waiting）。
- **测了哪些**：18 种错误码 assertEqual 全矩阵 + Task 各 API no param/no NoSerialize/no register/no period/two apis。

---

## 1.27 参数覆盖 null/undefined/empty（跨切面主题）

```
参数覆盖 null/undefined/empty
├── 入参范围覆盖
│   ├── 全 API 各入参取 null/undefined/empty
│   ├── getTask 各形态
│   └── AsyncRunner 构造
├── 边界值测试
│   └── empty/non-empty arguments、empty name
├── 异常与非法输入
│   └── null/undefined 各参数 → 401/10200014
├── 返回值与类型验证
│   └── getTask by taskId/empty/null/undefined name、getTask returns task with properties
└── 组合场景
    └── Task constructor empty/non-empty args、Task sendData empty/non-empty、addDependency/removeDependency empty/non-empty、execute(func,...args) with args=[]
```

- **用例位置**：`TaskPoolCoverage.test.ets` `SETTRANSFERLIST_NULL_0100`~`GETTASK_RETURN_0500`（110 例：全 API null/undefined/empty 参数 + 10200014 + getTask + AsyncRunner execute null/undefined + AsyncRunner constructor no params/empty name + execute priority + Task constructor/sendData/addDependency empty/non-empty + executePeriodically null/undefined/out-of-range priority + execute(func,...args) with args=[]）。
- **测了哪些**：全 API null/undefined/empty 参数覆盖 + 10200014 + getTask 全形态 + AsyncRunner 构造。

---

## 1.28 多线程 Dynamics/Share（跨切面主题）

```
多线程 Dynamics / Share
├── 入参范围覆盖
│   ├── 10 taskPool 线程动态 import（DynamicsTest）
│   └── 10 taskpool/worker 线程 promise/await 共享（ShareTest）
├── 边界值测试
│   └── 10 线程并发边界
├── 返回值与类型验证
│   └── 10 线程并发结果一致
├── 组合场景
│   └── new promise/await/promise callback/onEnqueued/catch/finally/onexit 组合
├── 重复调用/幂等性
│   └── 10 线程循环
└── 并发跨线程
    └── 10 taskpool/worker 线程并发
```

- **用例位置**：`TaskPoolTaskGroupDynamicsTest.test.ets` `0100`~`2400`（24 例，"create 10 taskPool threads, dynamics import"）、`TaskPoolTaskGroupShareTest.test.ets` `0100`~`2400`（24 例，10 taskpool/worker 线程 new promise/await/promise callback/onEnqueued/catch/finally/onexit 组合）。共 48 例。
- **测了哪些**：10 线程动态 import + promise/await 共享；**desc 笼统，定位弱**。

---

## 1.29 execute(func) smoke（跨切面主题）

```
execute(func) smoke
├── 入参范围覆盖
│   └── execute 合法 function、不同参数个数、链式与重复调用
├── 边界值测试
│   └── chained/repeat
├── 返回值与类型验证
│   └── execute 返回 Promise、结果正确
├── 组合场景
│   └── chained、repeat
├── 重复调用/幂等性
│   └── repeat
└── 并发跨线程
    └── TaskPool 子线程
```

- **用例位置**：`TaskPoolTest.test.ets` `0001`~`0006`（6 例：happy/two/many/chained/repeat）。
- **测了哪些**：execute(func) 基础 smoke。

---

# 2. 稳定性

- **用例位置**：`TaskPoolTaskGroupDynamicsTest`/`ShareTest`（10 线程 ×24）、`Ability.test.ets` duration ×多、长时。
- **测了哪些**：10 线程并发动态 import/promise 共享稳定性 + duration 长时；**无 GC 压力专项**。

# 3. 性能

- **用例位置**：`TaskPool1.test.ets` share type 矩阵 ×17、`Ability.test.ets` duration ×多。
- **测了哪些**：share type 矩阵吞吐、duration 计时；**无独立时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`TaskPoolTaskGroupDynamicsTest`/`ShareTest`（10 线程）、`TaskPool1.test.ets` cancel combine scenes、`Ability.test.ets` Multi threaded SequenceRunner。
- **测了哪些**：10 线程并发共享 + cancel 竞态 + 多线程 SequenceRunner；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：`Ability.test.ets` TaskGroup/SequenceRunner/LongTask 互斥、`TaskPool1.test.ets` TaskGroup/LongTask/SequenceRunner ×多。
- **测了哪些**：TaskGroup/SequenceRunner/LongTask 互斥与组合；**未见 taskpool API 子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`TaskpoolErrorCode.test.ets` 59 例全错误码 assertEqual、`TaskPoolCoverage.test.ets` 10200014 + 401 参数覆盖。
- **测了哪些**：18 错误码 assertEqual + 401/10200014 参数契约符合性；**未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| taskpool.execute | ✅(share 17) | ✅(long once) | ✅(10200014) | ✅(Promise/share) | ✅(嵌套) | ✅(repeat) | ✅ |
| Task constructor | ✅ | ✅(long once) | 🟡 | ✅instanceof | ✅ | 🟡 | ✅ |
| GenericsTask constructor | ✅ | 🟡 | 🟡 | ✅(execute<R>) | ✅ | 🟡 | 🟡 |
| LongTask constructor | ✅ | ✅(long once/group不支持) | 🟡 | ✅(结果) | ✅ | 🟡 | ✅ |
| TaskGroup constructor | ✅(默认/带名) | 🟡 | 🟡 | ✅instanceof | ✅ | 🟡 | ✅ |
| TaskGroup addTask | ✅(2重载) | ✅(互斥) | ✅(cannot add ×多) | ✅(结果/Priority) | ✅ | 🟡 | ✅ |
| SequenceRunner constructor | ✅(name/priority) | 🟡 | 🟡 | ✅instanceof | ✅ | 🟡 | 🟡 |
| SequenceRunner execute | ✅ | ✅(重复/多线程) | ✅(cannot execute ×多) | ✅(串行结果) | ✅(嵌套/依赖) | ✅(重复) | ✅(多线程) |
| AsyncRunner constructor | ✅(no params/empty name) | ✅(empty name) | 🟡 | ✅instanceof | 🟡 | 🟡 | 🟡 |
| AsyncRunner execute | ✅ | 🟡 | ✅(null/undefined→401/10200014) | ✅(Promise) | 🟡 | 🟡 | 🟡 |
| taskpool.cancel | ✅(各 task类型) | ✅(各状态) | ✅(10200015/55/18) | ✅(isCanceled) | ✅(各状态) | ✅(多次) | ✅ |
| Task.isCanceled | ✅(各状态) | ✅(各状态) | 🟡 | ✅(boolean) | ✅(cancel联动) | 🟡 | ✅ |
| Task.sendData | ✅(×17) | 🟡 | ✅(10200006/22/23) | ✅(回传) | ✅(联动) | ✅(多次) | ✅ |
| Task.onReceiveData | ✅ | 🟡 | ✅(10200034/no param/no NoSerialize/no register) | ✅(回调触发) | ✅(联动) | 🟡 | ✅ |
| taskpool.getTaskPoolInfo | ✅ | 🟡 | ❌ | ✅(结构/属性) | ✅(execute 后) | 🟡 | ✅ |
| Task.addDependency | ✅(多形态) | ✅(依赖图) | ✅(约束+10200026/52/56/27) | ✅(依赖顺序) | ✅(taskGroup/SequenceRunner) | 🟡 | ✅ |
| Task.removeDependency | ✅ | 🟡 | 🟡 | ✅(顺序) | ✅(add→remove) | 🟡 | 🟡 |
| taskpool.executeDelayed | ✅(configs) | ✅(only last) | ✅(序列化失败+10200028/50/51/57) | ✅(结果) | ✅(cancel+Delayed) | ✅(repeatedly) | ✅ |
| taskpool.executePeriodically | ✅(period/task名/优先级) | ✅(only last) | ✅(序列化失败+10200028/50/51/57) | ✅(结果) | ✅(×多configs) | 🟡 | ✅ |
| Task.isDone | ✅(5状态) | ✅(各状态) | 🟡 | ✅(boolean) | 🟡 | ✅(多读) | 🟡 |
| taskpool.isConcurrent | ✅ | 🟡 | 🟡 | ✅(boolean) | ✅ | 🟡 | 🟡 |
| taskpool.terminateTask | ✅ | 🟡 | ✅(null/undefined→401) | ✅(释放) | 🟡 | 🟡 | ✅ |
| taskpool.getTask | ✅(taskId/empty/null/undefined name) | ✅(empty/null/undefined) | ✅(各 name 处理) | ✅(task properties) | 🟡 | 🟡 | 🟡 |
| Priority 枚举 | ✅(4枚举) | ✅(999→401) | ✅(999→401) | ✅(派发顺序) | ✅ | 🟡 | 🟡 |
| State 枚举 | ✅(4状态) | ✅(waiting) | 🟡 | ✅(串行态) | 🟡 | 🟡 | 🟡 |
| 全错误码 assertEqual | ✅(18码) | ✅(各触发) | ✅(assertEqual) | ✅(assertEqual) | ✅(各 API no param) | 🟡 | 🟡 |
| 参数覆盖 null/undefined/empty | ✅(全 API) | ✅(empty/non-empty) | ✅(401/10200014) | ✅(getTask) | ✅(empty/non-empty) | 🟡 | 🟡 |
| 多线程 Dynamics/Share | ✅(10线程) | ✅(10并发) | ❌ | ✅(结果一致) | ✅(promise/await/cb) | ✅(10循环) | ✅ |
| execute(func) smoke | ✅(6) | ✅(chained/repeat) | ❌ | ✅(Promise) | ✅(chained) | ✅(repeat) | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **多线程 Dynamics/Share desc 笼统**：48 例 desc 高度重复，形态定位弱。
2. **多写者竞态未覆盖**：10 线程并发多为结果一致校验，无多写者写写逐元素正确性断言。
3. **getTaskPoolInfo 异常路径未覆盖**：无错误码取证。
4. **addDependency 重复幂等弱**：依赖图无重复 addDependency 稳定取证。
5. **GC 压力未覆盖**：无 GC 压力专项稳定性用例。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 多写者写写逐元素正确性断言 | 10 线程并发掩盖真实数据损坏。 |
| P2 | 3 | Dynamics/Share desc 细化 / getTaskPoolInfo 异常 / addDependency 重复幂等 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | execute/Task/TaskGroup/SequenceRunner/cancel/sendData/getTaskPoolInfo/依赖/延时周期/错误码/参数/多线程 全矩阵 | 全 11 文件 |
| ②边界值测试 | long once、各 task 状态、依赖图形态、only last、State 各状态、10 并发、chained/repeat | Ability、Cancel、TaskPool1、TaskpoolErrorCode |
| ③异常与非法输入 | 10200006~10200057 assertEqual、401/10200014、序列化失败、互斥约束 | TaskpoolErrorCode、Coverage、Ability cannot ×多 |
| ④返回值与类型验证 | Promise、share type、isCanceled/isDone、State、错误码 assertEqual、getTaskPoolInfo 结构、getTask properties | 全套件 |
| ⑤组合场景 | 嵌套 execute、cancel 各状态、依赖+taskGroup/SequenceRunner、cancel+Delayed、promise/await/cb | Ability、TaskPool1 combine scenes、Share |
| ⑥重复调用幂等性 | repeat、canceling multiple times、repeatedly Cancel+Delayed、isDone 多读、10 循环 | TaskPoolTest、Ability 0268、0174、TaskPool1 isDone |
| ⑦并发跨线程 | TaskPool/worker 子线程执行、10 线程并发、Multi threaded SequenceRunner | 全套件跨线程用例 |
