# taskpoolSendableTest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「Sendable 在 TaskPool 跨线程引用传递与继承约束」（跨切面主题）——验证 Sendable 类/对象/collections 容器经真实接口 `taskpool.execute` / `Task.sendData` 跨线程按引用传递（修改同步、引用持久化）、Sendable 类只能继承自 Sendable 类的约束、共享模块多任务嵌套并发读写一致性、以及 `@ohos.util` ArrayList/HashMap/HashSet/List/LinkedList 等容器的序列化传递。
> **数据来源**：`taskpoolSendableTest/entry/src/ohosTest/ets/test/` 下 5 个 `*.test.ets`，共解析 **72** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
taskpoolSendableTest（Sendable 跨线程引用与约束·跨切面主题）
├── 1. 接口测试（Functional / Interface）  —— §1，按 Sendable 主题分组，标注真实接口
│   ├── 1.1 Sendable 引用传递（execute/sendData 跨线程按引用）
│   ├── 1.2 Sendable 类继承约束（execute/setCloneList 矩阵）
│   ├── 1.3 Sendable 共享模块集成（execute 嵌套并发）
│   ├── 1.4 Sendable namespace（execute 调用矩阵）
│   └── 1.5 Sendable 容器序列化（@ohos.util 容器 execute 传递）
├── 2. 稳定性                （LongTask 清理、10 任务序列）
├── 3. 性能                （10 任务序列、无独立基线）
├── 4. 并发安全            （并发3/10 自增、读写混合5、嵌套任务）
├── 5. 兼容性与继承        （Sendable 类继承约束）
└── 6. 资料与文档符合性     （@Sendable 装饰、继承约束符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | TaskPoolIntegrationTest.test.ets | 11 | Sendable 共享模块集成：单/并发3/并发10自增/读写混合5/回调校验/嵌套任务/LongTask清理/取消 |
| 2 | TaskPoolSendable.test.ets | 26 | Sendable 类继承约束：execute 矩阵 13 + setCloneList 矩阵 13 |
| 3 | TaskPoolSendableNameSpace.test.ets | 19 | Sendable namespace：Task 调用矩阵 |
| 4 | TaskPoolSendableTest.test.ets | 9 | Sendable 引用传递：单/多参数/容器/sendData/3-5-10 序列/同步/持久化 |
| 5 | TaskpoolTestContainer.test.ets | 7 | Sendable 容器序列化：ArrayList/HashMap/HashSet/List/LinkedList × 长度/空容器 |
| | **合计** | **72** | Sendable 引用/约束/集成/namespace/容器 |

---

# 1. 接口测试（Functional / Interface）

> 本套件为跨切面主题，§1.x 按 Sendable 主题分组，节内标注各点驱动的真实接口。

## 1.1 Sendable 引用传递（execute/sendData 跨线程按引用）

```
Sendable 引用传递
├── 入参范围覆盖
│   ├── 单个 Sendable 参数按引用（TaskPoolSendableTest 0100）
│   ├── 多个 Sendable 参数按引用（0200）
│   └── collections 容器（Set/Int8Array/Uint8ClampedArray）Sendable 参数（0300）
├── 边界值测试
│   └── 3/5/10 任务序列修改 Sendable（0500/0600/0700）
├── 返回值与类型验证
│   ├── 引用修改跨任务同步（0800）
│   └── 任务完成后引用持久化（0900）
├── 组合场景
│   └── sendData 发送 Sendable 实例按引用（0400）
├── 重复调用/幂等性
│   └── 多任务序列修改结果一致（0500~0700）
└── 并发跨线程
    └── TaskPool 跨线程引用修改同步（0500~0900）
```

- **用例位置**：`TaskPoolSendableTest.test.ets` —— `0100`（单 Sendable 参数按引用）、`0200`（多 Sendable 参数按引用）、`0300`（collections 容器 Sendable 参数）、`0400`（sendData 发送 Sendable 实例按引用）、`0500`/`0600`/`0700`（3/5/10 任务序列修改 Sendable）、`0800`（Sendable 引用修改跨任务同步）、`0900`（Sendable 引用任务完成后持久化）。共 9 例。
- **测了哪些**：单/多参数 + 容器 + sendData 按引用传递 + 3/5/10 序列修改一致性 + 引用同步与持久化。

---

## 1.2 Sendable 类继承约束（execute/setCloneList 矩阵）

```
Sendable 类继承约束
├── 入参范围覆盖
│   ├── execute 矩阵 13 例覆盖各类 Sendable 继承形态（SendableExecute_0100~1300）
│   └── setCloneList 矩阵 13 例覆盖同类继承形态（SendableSetCloneList_0100~1300）
├── 异常与非法输入
│   └── Sendable 类继承非 Sendable 类 → 约束报错（26 例 catch 验证）
├── 返回值与类型验证
│   └── 继承约束通过/失败断言（26 例）
├── 组合场景
│   └── execute 与 setCloneList 两路径（13+13）
└── 重复调用/幂等性
    └── 矩阵内重复继承形态（26 例）
```

- **用例位置**：`TaskPoolSendable.test.ets` —— `SendableExecute_0100`~`1300`（execute 矩阵 13）、`SendableSetCloneList_0100`~`1300`（setCloneList 矩阵 13），26 例 desc 均为 "Sendable class can only inherit from Sendable class"。
- **测了哪些**：Sendable 类只能继承自 Sendable 类的约束在 execute 与 setCloneList 两路径下的取证；**26 例 desc 完全相同，矩阵内形态定位弱**。

---

## 1.3 Sendable 共享模块集成（execute 嵌套并发）

```
Sendable 共享模块集成
├── 入参范围覆盖
│   ├── 单任务访问共享模块（IntegrationTest 0100）
│   ├── 并发3 / 并发10 自增（0200/0300）
│   └── 读写混合5（0400）、回调校验共享数据（0500）
├── 边界值测试
│   └── 并发数 3/5/10 边界（0200/0300、0700/0800）
├── 返回值与类型验证
│   └── 共享数据自增计数正确、回调校验通过（0300/0500）
├── 组合场景
│   ├── 嵌套任务 + count waiting（0600）
│   ├── 嵌套任务并发3/5、多级嵌套（0700/0800/0900）
│   └── LongTask 执行与清理（1000）、任务取消（1100）
├── 重复调用/幂等性
│   └── 并发自增结果稳定（0300）
└── 并发跨线程
    └── 多 TaskPool 任务并发访问共享模块（0200/0300/0400）
```

- **用例位置**：`TaskPoolIntegrationTest.test.ets` —— `0100`（单任务访问共享模块）、`0200`（并发3）、`0300`（并发10自增）、`0400`（读写混合5）、`0500`（回调校验共享数据）、`0600`（回调嵌套任务 + count waiting）、`0700`/`0800`（嵌套任务并发3/5）、`0900`（多级嵌套）、`1000`（LongTask 执行与清理）、`1100`（任务取消）。共 11 例。
- **测了哪些**：共享模块在单/并发3/10/读写混合/嵌套/多级/LongTask/取消下的访问一致性。

---

## 1.4 Sendable namespace（execute 调用矩阵）

```
Sendable namespace
├── 入参范围覆盖
│   └── namespace 下的 Task 调用矩阵 19 例（SendableNameSpace 0100~2000）
├── 返回值与类型验证
│   └── namespace 下 Task 执行结果正确（19 例）
├── 组合场景
│   └── 矩阵内组合（19 例）
└── 并发跨线程
    └── namespace 下跨线程（19 例）
```

- **用例位置**：`TaskPoolSendableNameSpace.test.ets` `0100`~`2000`（19 例，desc 均为 "Testing Task"）。
- **测了哪些**：namespace 下的 Sendable Task 调用矩阵；**19 例 desc 完全相同为 "Testing Task"，定位弱**。

---

## 1.5 Sendable 容器序列化（@ohos.util 容器 execute 传递）

```
Sendable 容器序列化
├── 入参范围覆盖
│   ├── ArrayList/HashMap/HashSet/List/LinkedList 五类容器（Container 0100~0500）
│   └── 容器长度在任务内读取（0600）
├── 边界值测试
│   └── 空容器序列化（0700）
├── 返回值与类型验证
│   └── 任务内读取容器长度正确（0600）
├── 组合场景
│   └── 六容器 × 长度读取 × 空容器（0100~0700）
└── 并发跨线程
    └── TaskPool 子线程接收容器（0100~0700）
```

- **用例位置**：`TaskpoolTestContainer.test.ets` —— `0100`（ArrayList）、`0200`（HashMap）、`0300`（HashSet）、`0400`（List）、`0500`（LinkedList）、`0600`（容器长度在任务内读取）、`0700`（空容器）。共 7 例。
- **测了哪些**：五类容器经 TaskPool 序列化传递后长度读取 + 空容器边界。

---

# 2. 稳定性

- **用例位置**：`TaskPoolIntegrationTest.test.ets` `1000`（LongTask 执行与清理）、`0300`（并发10自增）。
- **测了哪些**：LongTask 生命周期清理 + 10 任务并发稳定性。

# 3. 性能

- **用例位置**：`TaskPoolSendableTest.test.ets` `0500`~`0700`（3/5/10 序列）、`TaskPoolIntegrationTest.test.ets` `0300`（并发10）。
- **测了哪些**：10 任务序列吞吐；**无独立吞吐/时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`TaskPoolIntegrationTest.test.ets` `0200`/`0300`/`0400`/`0700`/`0800`/`0900`（并发3/10自增/读写混合/嵌套）、`TaskPoolSendableTest.test.ets` `0800`（引用同步）。
- **测了哪些**：多任务并发自增/读写混合一致性 + 引用同步；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：`TaskPoolSendable.test.ets` 26 例（Sendable 类继承约束）。
- **测了哪些**：Sendable 类只能继承自 Sendable 类；**矩阵 desc 相同，形态定位弱**。

# 6. 资料与文档符合性

- **用例位置**：`TaskPoolSendable.test.ets` 26 例（@Sendable 装饰/继承约束）、`TaskPoolSendableTest.test.ets` 9 例（引用传递）。
- **测了哪些**：@Sendable 装饰与继承约束符合性；**未发现与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Sendable 引用传递 | ✅(9) | ✅(3/5/10) | ❌ | ✅(同步/持久化) | ✅(sendData) | ✅ | ✅ |
| Sendable 类继承约束 | ✅(26矩阵) | 🟡 | ✅(约束报错) | ✅(通过/失败) | ✅(execute/setCloneList) | 🟡 | N/A |
| Sendable 共享模块集成 | ✅(11) | ✅(3/5/10) | 🟡 | ✅(自增计数) | ✅(嵌套/回调) | ✅ | ✅ |
| Sendable namespace | 🟡(19 desc同) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | 🟡 |
| Sendable 容器序列化 | ✅(5容器) | ✅(空容器) | ❌ | ✅(长度) | ✅ | ❌ | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **继承约束矩阵 desc 全同**：26 例 desc 均为 "Sendable class can only inherit from Sendable class"，矩阵内形态无法定位。
2. **namespace 段 desc 全同**：19 例 desc 均为 "Testing Task"，定位弱。
3. **引用传递异常路径未覆盖**：未见非 Sendable 参数跨线程报错、>16MB 跨线程错误用例。
4. **容器序列化异常/重复未覆盖**：空容器覆盖，但不支持类型序列化、重复传递未见。
5. **多写者写写竞态未覆盖**：并发自增为计数校验，无逐元素写写正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 3 | 继承约束矩阵 desc 细化 / namespace desc 细化 / 引用传递异常路径 | 定位弱与异常路径缺口，非阻断。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 单/多 Sendable 参数、容器、共享模块、namespace 矩阵 | 0100~0900、26 矩阵、11 集成 |
| ②边界值测试 | 3/5/10 并发数、空容器 | 0500~0700、容器 0700 |
| ③异常与非法输入 | 继承约束报错 | TaskPoolSendable 26 例 |
| ④返回值与类型验证 | 引用同步/持久化、自增计数、容器长度 | 0800/0900、集成 0300、容器 0600 |
| ⑤组合场景 | sendData 引用、嵌套任务、回调内校验 | 0400、集成 0600~0900 |
| ⑥重复调用幂等性 | 多任务序列修改结果一致 | 0500~0700、集成 0300 |
| ⑦并发跨线程 | TaskPool 跨线程引用修改/容器传递 | 全套件跨线程用例 |
