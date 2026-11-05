# workermaxtest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「Worker 线程总数上限」——验证创建超过系统允许最大并发 Worker 线程数时触发上限错误日志，覆盖 Worker 实例创建/销毁循环与上限触达路径。真实接口：`@ohos.worker.Worker` constructor（`new worker.Worker(scriptURL)`）+ `terminate()`。
> **数据来源**：`workermaxtest/entry/src/ohosTest/ets/test/` 下 2 个 `*.test.ets`（`WorkermixTest.test.ets`、`WorkermaxLimit.test.ets`），共解析 **2** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.worker.d.ts`（Worker constructor、terminate）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
workermaxtest（Worker 线程总数上限）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   └── 1.1 Worker constructor(scriptURL) / terminate（线程上限场景）
├── 2. 稳定性                （创建/销毁循环混压）
├── 3. 性能                  （多 Worker 创建吞吐，无独立基线）
├── 4. 并发安全              （上限触达不崩溃）
├── 5. 兼容性与继承          （无独立用例）
└── 6. 资料与文档符合性       （上限错误日志符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | WorkermixTest.test.ets | 1 | Worker 创建/销毁混压→上限错误日志 |
| 2 | WorkermaxLimit.test.ets | 1 | 创建至上限后释放 1 个并验证可再创建（配额回收） |
| | **合计** | **2** | Worker 线程上限 |

**已排除**：`List.test.ets`（聚合 re-export，0 条 `@tc.name`）。

---

# 1. 接口测试（Functional / Interface）

## 1.1 Worker constructor(scriptURL) / terminate（线程上限场景）

```
Worker constructor / terminate（线程上限场景）
├── 入参范围覆盖
│   ├── new worker.Worker(scriptURL) 混压循环多次创建（SUB_Runtime_Mix_Create_Delete_threads_0001）
│   └── terminate() 销毁已创建 Worker 释放线程配额
├── 边界值测试
│   └── 触达系统最大并发 Worker 线程数上限
├── 异常与非法输入
│   └── 超上限触发错误日志（不崩溃、不抛未捕获异常）
├── 返回值与类型验证
│   └── 上限触达后错误日志输出可观测
├── 组合场景
│   └── 创建-terminate 交替混压循环
├── 重复调用/幂等性
│   └── 循环多次创建/销毁结果稳定不崩溃
└── 并发跨线程
    └── 主线程管理多 Worker 线程上限
```

- **用例位置**：`WorkermixTest.test.ets` `SUB_Runtime_Mix_Create_Delete_threads_0001`（`it=testWorkerMix001`，"test worker total amount limited with error log"，1 例）+ `WorkermaxLimit.test.ets` `testWorkerMaxLimit0001`（`SUB_RUNTIME_MIX_MAX_WORKER_LIMIT_0100`，"创建 workers 至产品上限后释放一个并验证可再创建"，1 例）。共 2 例。
- **测了哪些**：创建/销毁 Worker 混压循环触达上限并校验错误日志（WorkermixTest）；创建至上限后释放 1 个 Worker 并验证可再创建、配额回收（WorkermaxLimit）。共 2 例；**未见不同 scriptURL/优先级矩阵**。

---

# 2. 稳定性

- **用例位置**：`WorkermixTest.test.ets` `testWorkerMix001`（创建/销毁循环混压）。
- **测了哪些**：创建-销毁混压循环稳定性；**仅 1 例，无长时间/GC 压力专项**。

# 3. 性能

- **用例位置**：`WorkermixTest.test.ets` `testWorkerMix001`。
- **测了哪些**：多 Worker 创建/销毁混压；**无独立吞吐/时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`WorkermixTest.test.ets` `testWorkerMix001`。
- **测了哪些**：上限触达不崩溃；**无多 Worker 写写/读写竞态数据一致性断言**。

# 5. 兼容性与继承

- 本套件无独立兼容性与继承专项用例。

# 6. 资料与文档符合性

- **用例位置**：`WorkermixTest.test.ets` `testWorkerMix001`（错误日志符合性）。
- **测了哪些**：上限错误日志输出；**未发现与 Worker 上限文档数值逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Worker constructor/terminate（上限场景） | 🟡(单 scriptURL) | ✅(上限) | ✅(错误日志) | 🟡(日志) | ✅(创建/销毁) | 🟡 | 🟡(单例) |

## 7.2 本套件缺口简要（自包含）

1. **覆盖面窄**：全套件仅 2 例，未见不同 scriptURL/优先级/并发数矩阵。
2. **超上限后行为细化部分覆盖**：`WorkermaxLimit.test.ets` 已覆盖释放 1 个后可再创建的配额回收路径；terminate 后多次释放/再创建组合未见取证。
3. **竞态数据一致性未覆盖**：无多 Worker 并发读写共享数据的正确性断言。
4. **上限数值文档符合性未取证**：错误日志与文档声明的最大并发数未逐条断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 2 | 上限释放配额取证 / 错误日志文档符合性 | 覆盖窄但非阻断，提升套件质量。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | new Worker(scriptURL) 在混压循环多次创建 | testWorkerMix001 |
| ②边界值测试 | 触达系统最大并发 Worker 数上限 | testWorkerMix001 |
| ③异常与非法输入 | 超上限触发错误日志不崩溃 | testWorkerMix001 |
| ④返回值与类型验证 | 上限触达错误日志输出 | testWorkerMix001 |
| ⑤组合场景 | 创建-terminate 交替混压 | testWorkerMix001 |
| ⑥重复调用幂等性 | 循环多次创建/销毁稳定 | testWorkerMix001 |
| ⑦并发跨线程 | 主线程管理多 Worker 线程上限 | testWorkerMix001 |
