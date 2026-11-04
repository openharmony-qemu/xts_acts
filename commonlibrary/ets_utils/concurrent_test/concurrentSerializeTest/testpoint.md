# concurrentSerializeTest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「容器对象在 TaskPool / Worker 跨线程传递时的序列化完整通路」（跨切面主题）——验证 `@ohos.util` 六大容器（ArrayList/HashMap/HashSet/TreeSet/LinkedList/List）经真实接口 `taskpool.execute` / `Task` 构造 / `LongTask` / `Task.sendData` / `@ohos.worker.Worker` 返回 / `TaskGroup` / `SequenceRunner.execute` / `AsyncRunner.execute` 等不同并发载体传递后，容器长度、元素值、自定义比较器、类实例承载等是否保持一致。
> **数据来源**：`concurrentSerializeTest/entry/src/ohosTest/ets/test/serialize/ContainerSerialize.test.ets`，共解析 **21** 条用例（`@tc.name` 计数与 `it()` 计数对齐，零漂移；已排除 0 用例的 `List.test.ets` 聚合器）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
concurrentSerializeTest（容器跨线程序列化·跨切面主题）
├── 1. 接口测试（Functional / Interface）  —— §1，按载体主题分组，标注真实接口
│   ├── 1.1 容器×并发载体完整通路（execute/Task/LongTask/sendData/Worker/TaskGroup）
│   ├── 1.2 SequenceRunner / AsyncRunner 队列载体
│   ├── 1.3 序列化边界与异常（空容器/不支持类型/自定义比较器/类实例）
│   └── 1.4 多线程并发与压力
├── 2. 稳定性                （大数据循环压力、Worker 生命周期 6 容器）
├── 3. 性能                  （大数据循环 stress）
├── 4. 并发安全              （多线程并发传递容器）
├── 5. 兼容性与继承          （TreeSet 自定义比较器、容器内类实例）
└── 6. 资料与文档符合性       （六容器×多载体覆盖对应文档示例）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | serialize/ContainerSerialize.test.ets | 21 | 容器跨线程序列化全通路：ArrayList/HashMap/HashSet/TreeSet/LinkedList/List × execute/Task/LongTask/sendData/Worker/TaskGroup/SequenceRunner/AsyncRunner |
| | **合计** | **21** | 6 容器 × 多并发载体 |

**已排除**：`List.test.ets`（聚合 re-export，0 条 `@tc.name`，不产出测试点）。

---

# 1. 接口测试（Functional / Interface）

> 本套件为跨切面主题，§1.x 按并发载体主题分组，节内标注各点驱动的真实接口。

## 1.1 容器×并发载体完整通路（execute/Task/LongTask/sendData/Worker/TaskGroup）

```
容器×并发载体完整通路
├── 入参范围覆盖
│   ├── ArrayList 经 execute 传递（CONTAINER_SERIALIZE_0100）
│   ├── HashMap 经 Task 构造传递（0200）
│   ├── HashSet 经 LongTask 传递（0300）
│   ├── TreeSet + 自定义比较器 + task 返回（0400/0411）
│   ├── LinkedList 经 sendData 传递（0500）
│   └── List 经 TaskPool 传递（0600）、Priority 多容器（0700）、TaskGroup 多容器（0800）
├── 边界值测试
│   └── 空容器序列化（length=0 传递，1500）
├── 返回值与类型验证
│   ├── 传递后容器 length/size 与元素值一致（0100~0800）
│   └── TreeSet 自定义比较器排序保持（0400/0411）
├── 组合场景
│   ├── execute→Task 构造→LongTask→sendData→Worker 返回→TaskGroup 串联通路（0100~1300）
│   └── Worker 全生命周期承载 6 容器（1300）
└── 并发跨线程
    ├── TaskPool 子线程接收容器后读取（0100~0800）
    └── Worker 子线程接收容器后返回（1200/1300）
```

- **用例位置**：`ContainerSerialize.test.ets` —— `CONTAINER_SERIALIZE_0100`（ArrayList+execute）、`0200`（HashMap+Task 构造）、`0300`（HashSet+LongTask）、`0400`/`0411`（TreeSet+自定义比较器+task 返回）、`0500`（LinkedList+sendData）、`0600`（List+TaskPool）、`0700`（Priority 多容器）、`0800`（TaskGroup 多容器）、`1200`（Worker 返回 ArrayList）、`1300`（Worker 生命周期 6 容器）。共 10 例。
- **测了哪些**：六容器分别经 execute/Task/LongTask/sendData/Worker/TaskGroup 载体传递，校验 length 与元素一致性 + TreeSet 比较器排序保持 + Worker 全生命周期 6 容器承载。

---

## 1.2 SequenceRunner / AsyncRunner 队列载体

```
队列载体（SequenceRunner / AsyncRunner）
├── 入参范围覆盖
│   ├── 容器作为 SequenceRunner.execute 串行队列任务入参与返回（2800）
│   └── 容器作为 AsyncRunner.execute 异步并发队列任务入参与返回（2900）
├── 返回值与类型验证
│   └── 队列任务执行后容器内容回传一致（2800/2900）
├── 组合场景
│   └── SequenceRunner 串行队列、AsyncRunner 并发队列分别承载容器
└── 并发跨线程
    └── 队列任务在子线程执行，容器结果回主线程
```

- **用例位置**：`ContainerSerialize.test.ets` —— `2800`（SequenceRunner 串行队列+容器）、`2900`（AsyncRunner 并发队列+容器）。共 2 例。
- **测了哪些**：容器经串行/异步两种队列载体传递后的内容一致性；**未见队列内并发修改容器的竞态用例**。

---

## 1.3 序列化边界与异常（空容器/不支持类型/自定义比较器/类实例）

```
序列化边界与异常
├── 边界值测试
│   ├── 空容器序列化（length=0 传递，1500）
│   └── TreeSet 自定义比较器序列化保持排序（1800）
├── 异常与非法输入
│   └── 不支持类型序列化 → 序列化失败路径触发（1700）
├── 返回值与类型验证
│   ├── 空容器传递后仍为空（1500）
│   └── 自定义比较器排序保持（1800）
└── 组合场景
    └── 容器内承载类实例序列化（1900）
```

- **用例位置**：`ContainerSerialize.test.ets` —— `1500`（空容器序列化）、`1700`（不支持类型序列化）、`1800`（TreeSet 自定义比较器序列化）、`1900`（容器内类实例序列化）。共 4 例。
- **测了哪些**：空容器/不支持类型/自定义比较器/类实例四类序列化边界与失败路径。

---

## 1.4 多线程并发与压力

```
多线程并发与压力
├── 边界值测试
│   └── 大数据循环压力（2400）
├── 返回值与类型验证
│   └── 并发传递后容器内容一致（2000）
├── 组合场景
│   └── 多线程并发同时操作容器（2000）
├── 重复调用/幂等性
│   └── 循环多次传递结果稳定（2400）
└── 并发跨线程
    └── 多线程并发传递容器（2000）
```

- **用例位置**：`ContainerSerialize.test.ets` —— `2000`（多线程并发+容器）、`2400`（大数据循环 stress）。共 2 例。
- **测了哪些**：多线程并发容器传递一致性 + 大数据量循环压力下稳定性。

---

# 2. 稳定性

- **用例位置**：`ContainerSerialize.test.ets` `2400`（大数据循环 stress）、`1300`（Worker 生命周期 6 容器）。
- **测了哪些**：大数据循环压力下序列化稳定性 + Worker 全生命周期承载 6 容器的稳定性。

# 3. 性能

- **用例位置**：`ContainerSerialize.test.ets` `2400`（大数据循环 stress）。
- **测了哪些**：大数据量循环序列化压力；**无独立吞吐/时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`ContainerSerialize.test.ets` `2000`（多线程并发+容器）、`2900`（AsyncRunner 并发队列+容器）。
- **测了哪些**：多线程并发传递容器的一致性；**未见多写者并发修改同一容器的写写竞态一致性断言用例**。

# 5. 兼容性与继承

- **用例位置**：`ContainerSerialize.test.ets` `1800`（TreeSet 自定义比较器）、`1900`（容器内类实例）、`0400`/`0411`（TreeSet 比较器+task 返回）。
- **测了哪些**：自定义比较器序列化保持、容器承载类实例；**未发现容器子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`ContainerSerialize.test.ets` 全 21 例覆盖六容器×多并发载体，对应「容器跨线程传递」文档示例。
- **测了哪些**：六容器与 execute/Task/LongTask/sendData/Worker/TaskGroup/SequenceRunner/AsyncRunner 载体组合覆盖；**未发现与具体文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖 / ❌ 未覆盖或仅间接

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 容器×并发载体完整通路 | ✅(6容器) | ✅(空容器) | 🟡(不支持类型) | ✅(length/比较器) | ✅(6载体串联) | 🟡 | ✅(TaskPool/Worker) |
| SequenceRunner/AsyncRunner 队列载体 | ✅ | 🟡 | ❌ | ✅ | ✅(两种队列) | 🟡 | ✅ |
| 序列化边界与异常 | ✅ | ✅(空容器) | ✅(不支持类型) | ✅(比较器/类实例) | ✅ | ❌ | ❌ |
| 多线程并发与压力 | ✅ | ✅(大数据) | ❌ | ✅ | ✅ | 🟡 | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **队列载体异常路径未覆盖**：SequenceRunner/AsyncRunner 传递容器时的序列化失败/不支持类型未独立取证（仅 `1700` 在通用路径取证）。
2. **多写者写写竞态未覆盖**：多线程并发传递均为「不抛错即通过」的读侧校验，无多写者并发修改同一容器的逐元素正确性断言。
3. **容器子类化继承未覆盖**：未见容器子类（如自定义 ArrayList 子类）跨线程序列化用例。
4. **重复幂等取证弱**：同一容器多次跨线程传递的一致性无专用断言用例。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 队列载体不支持类型序列化独立取证 | 序列化失败路径在 SequenceRunner/AsyncRunner 下未独立覆盖。 |
| P2 | 3 | 多写者写写竞态 / 容器子类化 / 重复幂等 | 覆盖已存在但定位弱或未覆盖，非阻断。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 六容器（ArrayList/HashMap/HashSet/TreeSet/LinkedList/List）作为任务入参与返回值 | 0100~0800 六容器×多载体 |
| ②边界值测试 | 空容器、大数据循环、自定义比较器 | 1500 空容器、2400 大数据、1800 比较器 |
| ③异常与非法输入 | 不支持类型序列化失败路径 | 1700 不支持类型 |
| ④返回值与类型验证 | 传递后 length/size、元素值、比较器排序一致 | 0400/0411 TreeSet 比较器、1200 Worker 返回 |
| ⑤组合场景 | execute/Task/LongTask/sendData/Worker/TaskGroup/队列 载体串联 | 0100~0800、2800/2900 |
| ⑥重复调用幂等性 | 同一容器多次跨线程传递结果一致 | （未单独取证） |
| ⑦并发跨线程 | TaskPool/Worker 子线程接收容器、多线程并发 | 2000 多线程、1300 Worker 生命周期 |
