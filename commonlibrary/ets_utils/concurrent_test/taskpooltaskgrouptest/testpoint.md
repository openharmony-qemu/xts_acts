# taskpooltaskgrouptest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`taskpool.TaskGroup` 任务组」——覆盖 TaskGroup constructor（默认/带名，含 name 全边界与异常）、addTask（func 重载 + Task 实例重载，含参数矩阵与 401/10200014/10200051/10200057 错误码）、name 属性（读回/一致性/序列化）、继承与多态（TaskGroup subclass + Task↔LongTask/GenericsTask 多态）、全类型参数能力矩阵（×10 次）、6 生命周期回调 + then/catch/finally + asyncLock/promise/Wait/Worker/Taskpool 回调链异常传播、execute 能力（isCanceled/isDone/setTransferList/setCloneList）、多任务 GC/UI，以及 `use concurrent` 关键字跨 .ets/.ts/.js 文件矩阵。
> **数据来源**：`taskpooltaskgrouptest/entry/src/ohosTest/ets/test/` 下 19 个 `*.test.ets`（含 `taskGroup/` 子目录），共解析 **346** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（TaskGroup constructor L474、addTask、name、Task setTransferList/setCloneList/isCanceled/isDone、6 生命周期回调）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
taskpooltaskgrouptest（TaskGroup 任务组）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 TaskGroup constructor
│   ├── 1.2 TaskGroup addTask
│   ├── 1.3 TaskGroup name
│   ├── 1.4 继承与多态（subclass + Task↔LongTask/GenericsTask 多态）
│   ├── 1.5 全类型能力矩阵（×10 次）
│   ├── 1.6 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）
│   ├── 1.7 回调链异常传播（then/catch/finally + asyncLock/promise/Wait/Worker/Taskpool）
│   ├── 1.8 Task.setTransferList
│   ├── 1.9 Task.setCloneList
│   ├── 1.10 Task.isCanceled
│   ├── 1.11 Task.isDone
│   ├── 1.12 多任务 GC/UI
│   └── 1.13 use concurrent 关键字（.ets/.ts/.js）
├── 2. 稳定性              （1000/10000 实例、多任务 UI）
├── 3. 性能                （×10 次、10000 stress，无独立基线）
├── 4. 并发安全            （3/5/10 并发、Sendable counter）
├── 5. 兼容性与继承        （subclass、Task↔LongTask/GenericsTask 多态）
└── 6. 资料与文档符合性     （401/10200014/10200051/10200057 错误码 + name 契约）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | TaskGroupAbility.test.ets | 30 | 全类型能力矩阵 ×10（string~Uint32Array） |
| 2 | TaskGroupAbility2.test.ets | 22 | 全类型矩阵续（Uint8ClampedArray~SendableClass） |
| 3 | TaskGroupAbility3.test.ets | 4 | 全类型矩阵续（ISendable/SendableFunction/SendableClass） |
| 4 | TaskGroupInheritanceTest.test.ets | 13 | TaskGroup subclass instanceof/构造/addTask 继承/自定义方法/多 subclass 并发 |
| 5 | TaskPolymorphismTest.test.ets | 15 | Task↔LongTask/GenericsTask 多态 + 继承属性 |
| 6 | TaskPoolErrorSuccess2Test.test.ets | 6 | worker error / 二级 error / 二级 error-then/catch |
| 7 | TaskPoolErrorSuccessTest.test.ets | 24 | 6 回调 + asyncLock/task-promise/setTimeout/async/await 回调链 |
| 8 | TaskPoolTaskGroupActTest.test.ets | 8 | TaskGroup act smoke ×8 |
| 9 | TaskPoolTaskGroupExecute.test.ets | 20 | TaskGroup/error/GenericsTask/isCanceled/cancel(id)/setTransferList/setCloneList/6 回调/isDone |
| 10 | TaskPoolTaskGroupMultipleTest.test.ets | 2 | task ui ×2 |
| 11 | TaskPoolTaskGroupTask.test.ets | 30 | 异常回调矩阵（Common/GenericsTask/6 回调/then/catch/finally/asyncLock/promise/Wait/Worker/Taskpool） |
| 12 | TaskPoolTaskMultipleTest.test.ets | 5 | multiple worker error |
| 13 | TaskPoolTaskMultipleUITest.test.ets | 2 | task ui ×2 |
| 14 | UseConcurrentTest.test.ets | 30 | use concurrent 关键字 .ets/.ts/.js × 参数/返回/位置/跨文件/嵌套 |
| 15 | taskGroup/TaskGroupAddTaskFuncTest.test.ets | 26 | addTask(func) 重载参数矩阵 + 401/10200014 + 嵌套 |
| 16 | taskGroup/TaskGroupAddTaskInstanceTest.test.ets | 29 | addTask(Task) 实例重载矩阵 + 401/10200051/10200057 + 1000 实例 + 嵌套 |
| 17 | taskGroup/TaskGroupConstructorDefaultTest.test.ets | 15 | constructor() 默认 + 1000/10000 实例 + 嵌套 + worker |
| 18 | taskGroup/TaskGroupConstructorNamedTest.test.ets | 34 | constructor('name') 全边界 + 401 + 100KB/1MB name + worker 并发 |
| 19 | taskGroup/TaskGroupNameTest.test.ets | 31 | name 属性读回/一致性/序列化/stress |
| | **合计** | **346** | TaskGroup 全场景 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 TaskGroup constructor

```
TaskGroup constructor
├── 入参范围覆盖
│   ├── constructor() 默认（ConstructorDefault 0100~1500）
│   ├── constructor('name') 带名（ConstructorNamed 0100~3400）
│   └── name 全边界：''/中文/emoji/alphanumeric/hyphen/dot/single char/space/multi spaces/1000+chars/escape chars
├── 边界值测试
│   ├── 1000/10000 实例、100 sequential、10000 chars name
│   └── 100KB/1MB name
├── 异常与非法输入
│   └── constructor(null/undefined/number/object) → 401（ConstructorNamed）
├── 返回值与类型验证
│   ├── instanceof taskpool.TaskGroup
│   └── name 匹配
├── 组合场景
│   ├── construct + addTask + execute
│   ├── 多 named Promise.all
│   └── worker creates named TaskGroup
├── 重复调用/幂等性
│   ├── 同名独立实例
│   └── 10000 named 实例
└── 并发跨线程
    ├── worker 内构造
    └── 3/5/10 并发构造
```

- **用例位置**：`taskGroup/TaskGroupConstructorDefaultTest.test.ets` `0100`~`1500`（15 例：instanceof/construct+addTask/多 Promise.all/1000/100/10000 实例/Sendable counter/1000 batches/@Concurrent 嵌套/onExecutionSucceeded 嵌套/onReceiveData 嵌套/execute.then 嵌套/worker 构造）+ `TaskGroupConstructorNamedTest.test.ets` `0100`~`3400`（34 例：全 name 边界 + 401 + 100KB/1MB + worker 3/5/10 并发 + 嵌套）。共 49 例。
- **测了哪些**：默认+带名 constructor 全 name 边界 + 1000/10000/100KB/1MB 容量 + 401 + worker 并发 + 嵌套。

---

## 1.2 TaskGroup addTask

```
TaskGroup addTask
├── 入参范围覆盖
│   ├── addTask(@Concurrent func,arg)/addTask(func)0args/多args/arrow/async（AddTaskFunc）
│   └── addTask(Task) basic/带参/named/async/GenericsTask（AddTaskInstance）
├── 边界值测试
│   ├── 1000 Task 实例、小并发 3/5/10
│   └── boolean/negative/zero/empty_string args
├── 异常与非法输入
│   ├── addTask after execute→401、non-@Concurrent→10200014、null→401
│   ├── executed Task→401、same Task to two groups→401、dependent task rejected→401
│   ├── SequenceRunner Task→401、non-Task types→401、LongTask→401
│   ├── periodic task→10200051、AsyncRunner task→10200057
│   └── Task throws group fails
├── 返回值与类型验证
│   ├── addTask 返回结果、void return side effect
│   └── shared counter
├── 组合场景
│   ├── Promise.all、@Sendable counter、多 tasks 并发
│   └── 嵌套（@Concurrent body/onExecutionSucceeded/onReceiveData/execute.then）
├── 重复调用/幂等性
│   ├── 多 tasks 并发
│   └── 1000 实例
└── 并发跨线程
    ├── 小并发 3/5/10
    └── @Sendable shared counter
```

- **用例位置**：`taskGroup/TaskGroupAddTaskFuncTest.test.ets` `0100`~`2600`（26 例：func 重载参数矩阵 + 401/10200014 + 嵌套）+ `TaskGroupAddTaskInstanceTest.test.ets` `0100`~`2900`（29 例：Task 实例重载矩阵 + 401/10200051/10200057 + 1000 实例 + 嵌套）。共 55 例。
- **测了哪些**：addTask 两重载参数矩阵 + 401/10200014/10200051/10200057 错误码 + 1000 实例 + 嵌套。

---

## 1.3 TaskGroup name

```
TaskGroup name
├── 入参范围覆盖
│   └── 无参/'myGroup'/''/中文/emoji/spaces/special chars/escape/1000 chars（NameTest 0100~3100）
├── 边界值测试
│   ├── 10000 chars name
│   └── 10000 次读 stress
├── 返回值与类型验证
│   ├── name 读回一致、length 匹配
│   ├── toString、typeof string
│   └── name serialized through Worker
├── 组合场景
│   ├── addTask/execute/cancel 后 name 不变
│   ├── Promise.then/catch 可访问
│   ├── Map key、字符串拼接
│   └── @Concurrent body + onExecutionSucceeded
└── 重复调用/幂等性
    ├── 多次读一致
    ├── 10000 次读 stress
    └── 多 execute 后可访问
```

- **用例位置**：`taskGroup/TaskGroupNameTest.test.ets` `0100`~`3100`（31 例：name 全形态读回 + 一致性 + addTask/execute/cancel 后不变 + Promise.then/catch + Map key + 10000 次读 + 字符串拼接 + 10000 chars + typeof string + @Concurrent body + onExecutionSucceeded + serialized through Worker）。共 31 例。
- **测了哪些**：name 属性全形态读回 + 一致性 + 各场景不变 + stress + Worker 序列化。

---

## 1.4 继承与多态（subclass + Task↔LongTask/GenericsTask 多态）

```
继承与多态
├── 入参范围覆盖
│   ├── TaskGroup subclass instanceof/无参/带 name/super（Inheritance 0100~1300）
│   ├── addTask(func)/(Task) 继承、扩展 counting wrapper、自定义属性、new methods
│   └── Task ref→LongTask/GenericsTask 多态（Polymorphism 0100~1500）
├── 边界值测试
│   ├── 二级继承
│   └── 多 subclass 并发
├── 异常与非法输入
│   └── 已执行 Task to subclass throws
├── 返回值与类型验证
│   ├── subclass instanceof
│   ├── 继承 addTask/name/function/arguments 属性
│   ├── LongTask no timeout
│   └── GenericsTask compile-time type safety
├── 组合场景
│   ├── 多 subclass 并发执行
│   ├── execute accepts Task/LongTask/GenericsTask
│   ├── executeDelayed accepts LongTask
│   └── addDependency after dependency
└── 并发跨线程
    ├── 多 subclass 并发
    └── terminateTask lifecycle
```

- **用例位置**：`TaskGroupInheritanceTest.test.ets` `0100`~`1300`（13 例）+ `TaskPolymorphismTest.test.ets` `0100`~`1500`（15 例）。共 28 例。
- **测了哪些**：TaskGroup subclass 继承链 + Task↔LongTask/GenericsTask 多态 + 继承属性。

---

## 1.5 全类型能力矩阵（×10 次）

```
全类型能力矩阵
├── 入参范围覆盖
│   └── 53 种参数类型（基础/数组/容器/Sendable/ASON）×2 任务传参与返回
├── 边界值测试
│   └── ×10 次重复执行
├── 异常与非法输入
│   └── 含 error 子例
├── 返回值与类型验证
│   └── 参数传递与返回值一致
├── 组合场景
│   └── 两任务 ×10 次执行
├── 重复调用/幂等性
│   └── ×10 次一致
└── 并发跨线程
    └── TaskGroup 子线程执行
```

- **用例位置**：`TaskGroupAbility.test.ets` `0100`~`3000`（30）+ `Ability2` `3100`~`5200`（22）+ `Ability3` `5300`~`5600`（4），每例「Create two tasks with X parameters and X return values, execute them 10 times」。共 56 例。
- **测了哪些**：53 种参数类型 ×2 任务 ×10 次执行。

---

## 1.6 Task 生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData）

```
Task 生命周期回调
├── 入参范围覆盖
│   ├── onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData 注册与触发（ErrorSuccess 0100~2400、TaskGroupTask 1001~1030）
│   └── 各回调正常与异常分支
├── 边界值测试
│   └── 各回调点正常与异常触发时机
├── 异常与非法输入
│   ├── Common/GenericsTask 抛异常
│   ├── 各回调抛异常 → 主线程 catch
│   └── 二级 error-then/catch（ErrorSuccess2 2500~3000）
├── 返回值与类型验证
│   ├── 异常 message 经 TaskGroup 回传
│   └── 各回调计数符合预期
├── 组合场景
│   ├── 6 回调联动
│   └── 回调内再抛异常
└── 并发跨线程
    └── TaskGroup 子线程异常回传
```

- **用例位置**：`TaskPoolErrorSuccessTest.test.ets` `0100`~`2400`（24 例）+ `TaskPoolErrorSuccess2Test.test.ets` `2500`~`3000`（6 例）+ `TaskPoolTaskGroupTask.test.ets` `1001`~`1030`（30 例：Common/GenericsTask/OnEnqueued/OnStartExecution/OnExecutionFailed/OnExecutionSucceeded/OnReceiveData）。共 60 例。
- **测了哪些**：6 生命周期回调 + 各回调抛异常传播与计数。

---

## 1.7 回调链异常传播（then/catch/finally + asyncLock/promise/Wait/Worker/Taskpool）

```
回调链异常传播
├── 入参范围覆盖
│   └── then/catch/finally、asyncLock 三段、promise 三段、Wait 三段、Worker/Taskpool callback|then|catch|finally
├── 边界值测试
│   └── 各回调链段正常与异常
├── 异常与非法输入
│   └── 各回调链段抛异常 → 传播与捕获
├── 返回值与类型验证
│   └── 异常 message 经链回传
├── 组合场景
│   ├── asyncLock 三段、promise 四段、Wait 三段
│   └── 二级 worker-error
└── 并发跨线程
    └── TaskGroup 子线程异常回传
```

- **用例位置**：`TaskPoolTaskGroupTask.test.ets` `1001`~`1030`（30 例含 Then/Catch/Finally/AsyncLock/AsyncLock's then|catch|finally/Promise|then|catch|finally/Settimeout/Asynchronous/Worker callback/Taskpool callback|then|catch|finally）+ `TaskPoolErrorSuccessTest` asyncLock/task-promise/setTimeout/async/await 段。共 60 例（与 §1.6 同文件矩阵）。
- **测了哪些**：then/catch/finally + asyncLock/promise/Wait 三段四段 + Worker + Taskpool 回调链正常与异常传播。

---

## 1.8 Task.setTransferList

```
Task.setTransferList
├── 入参范围覆盖
│   └── setTransferList(list) 与 execute 联动（TaskPoolTaskGroupExecute）
├── 返回值与类型验证
│   └── transfer list 生效、transfer 后 ArrayBuffer 所有权转移
└── 并发跨线程
    └── TaskGroup 子线程接收 transfer 对象
```

- **用例位置**：`TaskPoolTaskGroupExecute.test.ets` setTransferList 段。共 1 例。
- **测了哪些**：setTransferList 在 TaskGroup execute 下的生效。

---

## 1.9 Task.setCloneList

```
Task.setCloneList
├── 入参范围覆盖
│   └── setCloneList(list) Object[]/ArrayBuffer[] 与 execute 联动
├── 异常与非法输入
│   └── Sendable 类继承约束矩阵（见 taskpoolSendableTest，本套件少量）
├── 返回值与类型验证
│   └── clone list 生效、对象克隆传递
└── 并发跨线程
    └── TaskGroup 子线程接收 clone 对象
```

- **用例位置**：`TaskPoolTaskGroupExecute.test.ets` setCloneList 段。共 1 例。
- **测了哪些**：setCloneList 在 TaskGroup execute 下的生效。

---

## 1.10 Task.isCanceled

```
Task.isCanceled
├── 入参范围覆盖
│   ├── isCanceled 状态查询（TaskPoolTaskGroupExecute）
│   └── cancel(id) by taskId 后状态
├── 边界值测试
│   └── 各 task 状态：未执行/执行中/已执行/已取消
├── 返回值与类型验证
│   └── isCanceled 返回 boolean
└── 组合场景
    └── execute + cancel + isCanceled 联动
```

- **用例位置**：`TaskPoolTaskGroupExecute.test.ets` isCanceled/cancel(id) 段。共 2 例。
- **测了哪些**：isCanceled 状态查询 + cancel(id) 联动。

---

## 1.11 Task.isDone

```
Task.isDone
├── 入参范围覆盖
│   └── isDone 状态查询（TaskPoolTaskGroupExecute isDone ×2）
├── 边界值测试
│   └── 各状态：未添加/未执行/执行中/已执行/取消中
├── 返回值与类型验证
│   └── isDone 返回 boolean
└── 重复调用/幂等性
    └── isDone 多次读取
```

- **用例位置**：`TaskPoolTaskGroupExecute.test.ets` isDone ×2 段。共 2 例。
- **测了哪些**：isDone 状态查询。

---

## 1.12 多任务 GC/UI

```
多任务 GC/UI
├── 入参范围覆盖
│   ├── 多 worker 错误（TaskPoolTaskMultiple 0100~0500）
│   └── task UI 场景（TaskGroupMultiple、TaskMultipleUI）
├── 边界值测试
│   └── UI 场景
├── 异常与非法输入
│   └── multiple worker error
├── 返回值与类型验证
│   └── UI 场景结果正确
└── 并发跨线程
    └── 多任务 + UI 线程
```

- **用例位置**：`TaskPoolTaskGroupMultipleTest.test.ets` `0100`/`0200`（task ui ×2）、`TaskPoolTaskMultipleTest.test.ets` `0100`~`0500`（multiple worker error ×5）、`TaskPoolTaskMultipleUITest.test.ets` `0100`/`0200`（task ui ×2）。共 9 例。
- **测了哪些**：multiple worker error + UI 场景；**multiple 段 desc 均为 "test worker error" 较笼统**。

---

## 1.13 use concurrent 关键字（.ets/.ts/.js）

```
use concurrent 关键字
├── 入参范围覆盖
│   ├── .ets/.ts/.js 文件 use concurrent 函数 × 参数(number/string/boolean/collections.Array/Map/Set/BitVector/ArrayBuffer/@Sendable class)
│   └── 返回(number/string/boolean/collections.Array/Map/@Sendable class)
├── 边界值测试
│   └── keyword 位置（首行/前空行）
├── 返回值与类型验证
│   └── 跨文件 import 执行结果正确
├── 组合场景
│   ├── .ets import .ts/.js concurrent
│   ├── TaskGroup uses cross-file、nests TaskPool.execute
│   ├── 10 concurrent、worker invokes
│   ├── TaskPool→worker、async function
│   └── use sendable calls use concurrent
├── 重复调用/幂等性
│   └── 10 concurrent
└── 并发跨线程
    └── TaskPool/worker 跨线程执行 concurrent 函数
```

- **用例位置**：`UseConcurrentTest.test.ets` `0100`~`3000`（30 例：.ets/.ts/.js use concurrent × 参数/返回类型矩阵 × keyword 位置 × 跨文件 import × TaskGroup cross-file × nests execute × 10 concurrent × worker invokes × TaskPool→worker × async × use sendable calls use concurrent）。共 30 例。
- **测了哪些**：use concurrent 关键字跨 .ets/.ts/.js × 参数/返回/位置/跨文件/嵌套全矩阵。

---

# 2. 稳定性

- **用例位置**：`ConstructorDefault` 1000/10000 实例、`ConstructorNamed` 10000 named/100KB/1MB name、`AddTaskInstance` 1000 Task 实例。
- **测了哪些**：大容量实例创建稳定性 + 超长 name 承载；**无长时/GC 压力专项**。

# 3. 性能

- **用例位置**：`Ability ×3` ×10 次执行、`NameTest` 10000 次读 stress、`ConstructorDefault` 1000 batches。
- **测了哪些**：×10 次吞吐 + 10000 次读 stress；**无独立时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`AddTaskFunc`/`AddTaskInstance` 小并发 3/5/10 + Sendable counter、`ConstructorNamed` worker 3/5/10 并发、`UseConcurrent` 10 concurrent。
- **测了哪些**：多 TaskGroup 并发 + Sendable shared counter 一致性；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：`TaskGroupInheritanceTest` 13 例（subclass）、`TaskPolymorphismTest` 15 例（Task↔LongTask/GenericsTask 多态）。
- **测了哪些**：TaskGroup subclass 继承链 + Task↔LongTask/GenericsTask 多态 + 继承属性；**未见 addTask 对新 API 的继承覆写用例**。

# 6. 资料与文档符合性

- **用例位置**：`AddTaskFunc`/`AddTaskInstance` 401/10200014/10200051/10200057、`ConstructorNamed` 401、`NameTest` name 契约。
- **测了哪些**：addTask/constructor 401 + 10200014/10200051/10200057 + name 契约符合性；**未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| TaskGroup constructor | ✅(49) | ✅(1000/10000/1MB) | ✅(401) | ✅(instanceof/name) | ✅(嵌套/worker) | ✅ | ✅(worker 3/5/10) |
| TaskGroup addTask | ✅(55) | ✅(1000/小并发) | ✅(401/10200014/10200051/10200057) | ✅(结果/counter) | ✅(嵌套/Promise.all) | ✅ | ✅(3/5/10) |
| TaskGroup name | ✅(31) | ✅(10000stress/chars) | 🟡(401在ctor) | ✅(读回/typeof) | ✅(不变/Map key/序列化) | ✅ | ✅(Worker序列化) |
| 继承与多态 | ✅(28) | ✅(二级/多subclass) | ✅(已执行throws) | ✅(instanceof/继承属性) | ✅(多态/executeDelayed) | 🟡 | ✅ |
| 全类型能力矩阵 | ✅(53类型) | ✅(×10) | 🟡(error子例) | ✅(返回一致) | ✅(×10) | ✅ | ✅ |
| Task 生命周期回调 | ✅(60) | ✅(正常+异常) | ✅(各点抛异常) | ✅(message回传/计数) | ✅(6回调联动) | ❌ | ✅ |
| 回调链异常传播 | ✅(多链) | ✅(各段) | ✅(各段抛异常) | ✅(message) | ✅(三段/四段/二级) | ❌ | ✅ |
| Task.setTransferList | ✅(1) | 🟡 | 🟡 | ✅(生效) | 🟡 | ❌ | ✅ |
| Task.setCloneList | ✅(1) | 🟡 | 🟡(继承约束) | ✅(生效) | 🟡 | ❌ | ✅ |
| Task.isCanceled | ✅(2) | ✅(各状态) | 🟡 | ✅(boolean) | ✅(cancel联动) | 🟡 | ✅ |
| Task.isDone | ✅(2) | ✅(各状态) | 🟡 | ✅(boolean) | 🟡 | ✅(多读) | ✅ |
| 多任务 GC/UI | ✅(9) | 🟡(UI) | 🟡(worker error) | 🟡 | 🟡 | 🟡 | ✅ |
| use concurrent | ✅(30) | ✅(keyword位置) | ❌ | ✅(跨文件结果) | ✅(跨文件/嵌套/10并发) | ✅(10并发) | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **回调异常重复幂等未覆盖**：60 例回调链无重复抛异常稳定取证。
2. **多写者竞态未覆盖**：小并发 3/5/10 多为 Sendable counter 计数，无多写者写写逐元素正确性断言。
3. **multiple 段 desc 笼统**：multiple worker error 7 例 desc 均为 "test worker error"。
4. **use concurrent 异常路径未覆盖**：未见非 concurrent 函数报错等异常取证。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 多写者写写逐元素正确性断言 | 并发计数掩盖真实数据损坏。 |
| P2 | 3 | 回调异常重复幂等 / multiple desc 细化 / use concurrent 异常路径 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | constructor/addTask/name/继承/全类型/回调/execute/use concurrent 全矩阵 | 全 19 文件 |
| ②边界值测试 | 1000/10000/1MB name、×10 次、10000 stress、keyword 位置 | Constructor*、Ability、NameTest、UseConcurrent |
| ③异常与非法输入 | 401/10200014/10200051/10200057、已执行 throws、各回调抛异常 | AddTask*、ConstructorNamed、TaskGroupTask |
| ④返回值与类型验证 | instanceof/name 读回/返回一致/isCanceled/isDone/counter | 全套件 |
| ⑤组合场景 | 嵌套(@Concurrent body/onExecutionSucceeded/onReceiveData/execute.then)、Promise.all、多态、跨文件 import | AddTask*、Inheritance、Polymorphism、UseConcurrent |
| ⑥重复调用幂等性 | ×10 次、10000 次读、10 concurrent、同名独立 | Ability、NameTest、UseConcurrent |
| ⑦并发跨线程 | worker 3/5/10 并发、TaskPool/worker 跨线程、小并发 3/5/10 | ConstructorNamed、UseConcurrent、AddTask* |
