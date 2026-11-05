# taskpoolexecutedelayedtest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`taskpool.executeDelayed` 延时任务」——验证延时任务本体异常、各生命周期回调（onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData/then/catch/asyncLock/promise/setTimeout/async/worker）抛异常的传播，以及延时任务与 TaskGroup/GenericsTask/multiple 的组合执行。真实接口：`@ohos.taskpool.executeDelayed`。
> **数据来源**：`taskpoolexecutedelayedtest/entry/src/ohosTest/ets/test/` 下 3 个 `*.test.ets`，共解析 **37** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.taskpool.d.ts`（executeDelayed L978/L1000）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
taskpoolexecuteddelayedtest（executeDelayed 延时任务）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   └── 1.1 executeDelayed(delayTime, task, priority?)
├── 2. 稳定性              （延时循环不崩溃）
├── 3. 性能                （无独立基线）
├── 4. 并发安全            （延时任务并发 worker）
├── 5. 兼容性与继承        （GenericsTask）
└── 6. 资料与文档符合性     （延时任务契约符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | ExecuteDelayedTaskError.test.ets | 27 | executeDelayed 任务本体 + 各回调 ThrowError 全矩阵 |
| 2 | TaskPoolExecuteDelayedMultipleTest.test.ets | 5 | executeDelayed 多任务 worker error |
| 3 | TaskPoolTaskExecuteDelayed.test.ets | 5 | executeDelayed + TaskGroup/GenericsTask/task.name |
| | **合计** | **37** | executeDelayed 全场景 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 executeDelayed(delayTime, task, priority?)

```
executeDelayed
├── 入参范围覆盖
│   ├── 普通 Task 抛异常（0100）、GenericsTask 抛异常（0200）
│   ├── 6 生命周期回调 onEnqueued/onStartExecution/onExecutionFailed/onExecutionSucceeded/onReceiveData 抛异常（0300~0700）
│   └── asyncLock 本体/then/catch/finally、promise then、setTimeout、async、worker onmessage 各回调链抛异常（1100~2000、2900/3000）
├── 边界值测试
│   ├── 任务本体 vs 各回调点抛异常的触发时机（0100~0700）
│   └── 二级 errorTask2/Then2/Catch2/Finally2 回调链各段抛异常（3100~3400）
├── 异常与非法输入
│   ├── 任务/回调主动抛 CustomError → 主线程 catch 捕获（全 27 例）
│   └── asyncLock 三段、promise then、worker 跨线程各段抛异常传播与捕获（1100~2000、2900/3000）
├── 返回值与类型验证
│   ├── 异常经延时通道回传 message 可断言（全例 assertContain）
│   └── 组合执行结果正确、task.name 可读（TaskPoolTaskExecuteDelayed 0400 task1.name）
├── 组合场景
│   ├── 延时任务与 TaskGroup 组合（TaskPoolTaskExecuteDelayed 0100）
│   ├── 延时任务与 GenericsTask 组合（0200/0300/0300_2）
│   └── 延时任务 multiple worker error 并发（TaskPoolExecuteDelayedMultiple 0100~0500）
├── 重复调用/幂等性
│   └── （未单独取证，同延时任务重复执行稳定未见）
└── 并发跨线程
    ├── 延时任务子线程异常回传宿主（2900/3000 worker）
    └── multiple worker 跨线程并发（TaskPoolExecuteDelayedMultiple 0100~0500）
```

- **用例位置**：`ExecuteDelayedTaskError.test.ets` `0100`~`3400`（27 例）+ `TaskPoolExecuteDelayedMultipleTest.test.ets` `0100`~`0500`（5 例，multiple worker error）+ `TaskPoolTaskExecuteDelayed.test.ets` `0100`~`0400`/`0300_2`（5 例，TaskGroup/GenericsTask/task.name）。共 37 例。
- **测了哪些**：延时任务本体 + 6 生命周期回调 + then/catch/asyncLock 三段 + promise/setTimeout/async/worker 回调链异常传播与捕获 + TaskGroup/GenericsTask/multiple 组合；**multiple 段 desc 均为 "test worker error" 较笼统；未见 delayTime 边界值（0/负/极大/NaN）用例**。

---

# 2. 稳定性

- **用例位置**：`ExecuteDelayedTaskError.test.ets` 全 27 例 + multiple 5 例。
- **测了哪些**：延时任务异常路径不崩溃稳定性；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：`TaskPoolExecuteDelayedMultipleTest.test.ets` `0100`~`0500`（multiple worker error）。
- **测了哪些**：延时任务多任务并发 worker；**无多写者写写竞态数据一致性断言**。

# 5. 兼容性与继承

- **用例位置**：`TaskPoolTaskExecuteDelayed.test.ets` `0200`/`0300`/`0300_2`（GenericsTask）。
- **测了哪些**：GenericsTask 延时执行；**未见延时任务子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`ExecuteDelayedTaskError.test.ets` 全 27 例覆盖 executeDelayed 各回调点。
- **测了哪些**：executeDelayed 回调链契约符合性；**未发现与文档逐条断言的符合性用例，未发现 delayTime 边界值（0/负/极大）用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| executeDelayed | ✅(6回调+本体+回调链) | ✅(各回调点+二级) | ✅(各点抛异常) | ✅(message/task.name) | ✅(TaskGroup/Generic/multiple) | ❌ | ✅(worker/multiple) |

## 7.2 本套件缺口简要（自包含）

1. **delayTime 边界值未覆盖**：未见 delayTime=0/负数/极大值/NaN 边界用例（异常维度覆盖充分但入参边界缺失）。
2. **重复幂等未覆盖**：同延时任务重复执行结果稳定未见取证。
3. **多写者竞态未覆盖**：multiple 段 desc 笼统，无并发数据正确性断言。
4. **multiple 段 desc 模糊**：5 例 desc 均为 "test worker error"，定位弱。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | delayTime 边界值（0/负/极大） | 入参边界硬缺口。 |
| P2 | 3 | 重复幂等 / 多写者竞态 / multiple desc 细化 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 延时任务本体/各回调/各组合载体 | 0100~0700、组合段 |
| ②边界值测试 | 各回调点抛异常、二级回调链、多任务并发 | 多数异常用例、3100~3400、multiple |
| ③异常与非法输入 | 任务/回调主动抛异常验证捕获 | 0100~3400 异常段 |
| ④返回值与类型验证 | 异常 message 回传、task.name | assertContain、0400 task.name |
| ⑤组合场景 | then/catch 链、asyncLock 三段、TaskGroup/Generic/multiple | 0800~1800、组合段 |
| ⑥重复调用幂等性 | 同延时任务重复执行稳定 | （未取证） |
| ⑦并发跨线程 | 延时任务子线程/worker 异常回传 | 2900/3000 worker、multiple |
