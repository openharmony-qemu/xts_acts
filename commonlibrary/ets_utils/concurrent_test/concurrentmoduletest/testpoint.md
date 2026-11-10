# concurrentmoduletest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「并发模块的跨工程/跨文件 import 与 export 行为」（跨切面主题）——覆盖 ets 并发模块 import/export、`AsyncLock` 跨模块 import、`Promise` 跨模块 import，以及 JS 工程与 TS 工程下 async/Promise/TypedArray 在并发模块中的行为矩阵。真实接口：并发模块 import/export、`@ohos.taskpool`、`@ohos.worker`、`arkts.AsyncLock`、ECMAScript Promise/async/TypedArray。
> **数据来源**：`concurrentmoduletest/entry/src/ohosTest/ets/test/` 下 9 个 `*.test.ets`，共解析 **335** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`Ability.test.ets`/`List.test.ets`/`UlitsTest.test.ets` 为 0 用例聚合器/工具）。
> **注**：本套件用例 `@tc.desc` 均为 "test"，下文用例形态按文件主题（模块/载体）刻画。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
concurrentmoduletest（并发模块跨工程/跨文件 import-export·跨切面主题）
├── 1. 接口测试（Functional / Interface）  —— §1，按模块/工程主题分组
│   ├── 1.1 ets 并发模块 import/export
│   ├── 1.2 AsyncLock 跨模块 import
│   ├── 1.3 Promise 跨模块 import
│   ├── 1.4 JS 工程 async
│   ├── 1.5 JS 工程 Promise
│   ├── 1.6 JS 工程 TypedArray
│   ├── 1.7 TS 工程 async
│   ├── 1.8 TS 工程 Promise
│   └── 1.9 TS 工程 TypedArray
├── 2. 稳定性              （多工程矩阵）
├── 3. 性能                （无独立基线）
├── 4. 并发安全            （async/Promise/AsyncLock 跨模块并发）
├── 5. 兼容性与继承        （JS/TS/ets 三工程兼容）
└── 6. 资料与文档符合性     （模块 import/export 规范符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | ConcurrencyModularImportAndExportTest.test.ets | 79 | ets 并发模块 import/export ×79 |
| 2 | ConcurrencyModularImportAsyncLockTest.test.ets | 18 | AsyncLock 跨模块 import ×18 |
| 3 | ConcurrencyModularImportPromiseTest.test.ets | 27 | Promise 跨模块 import ×27 |
| 4 | JSProjectAsyncTest.test.ets | 44 | JS 工程 async ×44 |
| 5 | JSProjectPromiseTest.test.ets | 28 | JS 工程 Promise ×28 |
| 6 | JSProjectTypedArrayTest.test.ets | 25 | JS 工程 TypedArray ×25 |
| 7 | TSProjectAsyncTest.test.ets | 51 | TS 工程 async ×51 |
| 8 | TSProjectPromiseTest.test.ets | 40 | TS 工程 Promise ×40 |
| 9 | TSProjectTypedArrayTest.test.ets | 23 | TS 工程 TypedArray ×23 |
| | **合计** | **335** | 并发模块跨工程 import-export |

**已排除**：`Ability.test.ets`/`List.test.ets`/`UlitsTest.test.ets`（0 用例聚合器/工具）。

---

# 1. 接口测试（Functional / Interface）

> 本套件为跨切面主题，§1.x 按 模块/工程主题分组。各例 `@tc.desc` 均为 "test"，形态定位弱。

## 1.1 ets 并发模块 import/export

```
ets 并发模块 import/export
├── 入参范围覆盖
│   ├── ets 并发模块 import/export 各形态 ×79（0100~9400）
│   └── 模块边界形态：跨文件 import/export、re-export、聚合
├── 返回值与类型验证
│   └── import/export 行为符合预期（79 例）
├── 组合场景
│   └── 79 例内 import/export 组合形态
└── 并发跨线程
    └── 并发模块跨线程引用
```

- **用例位置**：`ConcurrencyModularImportAndExportTest.test.ets` `0100`~`9400`（79 例，desc 均为 "test"）。
- **测了哪些**：ets 并发模块 import/export 各形态；**desc 全为 "test"，形态定位弱**。

---

## 1.2 AsyncLock 跨模块 import

```
AsyncLock 跨模块 import
├── 入参范围覆盖
│   └── AsyncLock 跨模块 import 各形态 ×18（0100~1800）
├── 边界值测试
│   └── AsyncLock 边界形态
├── 返回值与类型验证
│   └── AsyncLock import 后行为正确
├── 组合场景
│   └── 18 例内组合
└── 并发跨线程
    └── AsyncLock 跨模块并发
```

- **用例位置**：`ConcurrencyModularImportAsyncLockTest.test.ets` `0100`~`1800`（18 例，desc 均为 "test"）。
- **测了哪些**：AsyncLock 跨模块 import；**desc 全为 "test"，定位弱**。

---

## 1.3 Promise 跨模块 import

```
Promise 跨模块 import
├── 入参范围覆盖
│   └── Promise 跨模块 import 各形态 ×27（0100~2700）
├── 边界值测试
│   └── Promise 边界形态
├── 返回值与类型验证
│   └── Promise import 后行为正确
├── 组合场景
│   └── 27 例内组合
└── 并发跨线程
    └── Promise 跨模块并发
```

- **用例位置**：`ConcurrencyModularImportPromiseTest.test.ets` `0100`~`2700`（27 例，desc 均为 "test"）。
- **测了哪些**：Promise 跨模块 import；**desc 全为 "test"，定位弱**。

---

## 1.4 JS 工程 async

```
JS 工程 async
├── 入参范围覆盖
│   └── JS 工程下 async 方法各形态 ×44（JS_PROJECT_ASYNC_METHOD_0100~5300）
├── 边界值测试
│   └── async 边界形态
├── 返回值与类型验证
│   └── async 方法行为正确
├── 组合场景
│   └── 44 例内组合
└── 并发跨线程
    └── async 跨线程
```

- **用例位置**：`JSProjectAsyncTest.test.ets` `JS_PROJECT_ASYNC_METHOD_0100`~`5300`（44 例，desc 均为 "test"）。
- **测了哪些**：JS 工程 async 方法矩阵；**desc 全为 "test"，定位弱**。

---

## 1.5 JS 工程 Promise

```
JS 工程 Promise
├── 入参范围覆盖
│   └── JS 工程下 Promise 各形态 ×28（JS_PROJECT_PROMISE_METHOD_0100~2800）
├── 边界值测试
│   └── Promise 边界形态
├── 返回值与类型验证
│   └── Promise 行为正确
├── 组合场景
│   └── 28 例内组合
└── 并发跨线程
    └── Promise 跨线程
```

- **用例位置**：`JSProjectPromiseTest.test.ets` `JS_PROJECT_PROMISE_METHOD_0100`~`2800`（28 例，desc 均为 "test"）。
- **测了哪些**：JS 工程 Promise 矩阵；**desc 全为 "test"，定位弱**。

---

## 1.6 JS 工程 TypedArray

```
JS 工程 TypedArray
├── 入参范围覆盖
│   └── JS 工程下 TypedArray 各形态 ×25（JS_PROJECT_TYPEDARRAY_METHOD_0100~2500）
├── 边界值测试
│   └── TypedArray 边界形态
├── 返回值与类型验证
│   └── TypedArray 行为正确
├── 组合场景
│   └── 25 例内组合
└── 并发跨线程
    └── TypedArray 跨线程
```

- **用例位置**：`JSProjectTypedArrayTest.test.ets` `JS_PROJECT_TYPEDARRAY_METHOD_0100`~`2500`（25 例，desc 均为 "test"）。
- **测了哪些**：JS 工程 TypedArray 矩阵；**desc 全为 "test"，定位弱**。

---

## 1.7 TS 工程 async

```
TS 工程 async
├── 入参范围覆盖
│   └── TS 工程下 async 方法各形态 ×51（TS_PROJECT_ASYNC_0100~5200）
├── 边界值测试
│   └── async 边界形态
├── 返回值与类型验证
│   └── async 方法行为正确
├── 组合场景
│   └── 51 例内组合
└── 并发跨线程
    └── async 跨线程
```

- **用例位置**：`TSProjectAsyncTest.test.ets` `TS_PROJECT_ASYNC_0100`~`5200`（51 例，desc 均为 "test"）。
- **测了哪些**：TS 工程 async 方法矩阵；**desc 全为 "test"，定位弱**。

---

## 1.8 TS 工程 Promise

```
TS 工程 Promise
├── 入参范围覆盖
│   └── TS 工程下 Promise 各形态 ×40（PROMISE_TS_PROJECT_0100/TS_PROJECT_3300~5500）
├── 边界值测试
│   └── Promise 边界形态
├── 返回值与类型验证
│   └── Promise 行为正确
├── 组合场景
│   └── 40 例内组合
└── 并发跨线程
    └── Promise 跨线程
```

- **用例位置**：`TSProjectPromiseTest.test.ets` `PROMISE_TS_PROJECT_0100`/`TS_PROJECT_3300`~`5500`（40 例，desc 均为 "test"）。
- **测了哪些**：TS 工程 Promise 矩阵；**desc 全为 "test"，定位弱**。

---

## 1.9 TS 工程 TypedArray

```
TS 工程 TypedArray
├── 入参范围覆盖
│   └── TS 工程下 TypedArray 各形态 ×23（TS_PROJECT_TYPEDARRAY_METHOD_0100~2500）
├── 边界值测试
│   └── TypedArray 边界形态
├── 返回值与类型验证
│   └── TypedArray 行为正确
├── 组合场景
│   └── 23 例内组合
└── 并发跨线程
    └── TypedArray 跨线程
```

- **用例位置**：`TSProjectTypedArrayTest.test.ets` `TS_PROJECT_TYPEDARRAY_METHOD_0100`~`2500`（23 例，desc 均为 "test"）。
- **测了哪些**：TS 工程 TypedArray 矩阵；**desc 全为 "test"，定位弱**。

---

# 2. 稳定性

- **用例位置**：JS/TS 工程矩阵（async ×95、Promise ×68、TypedArray ×48）。
- **测了哪些**：多工程矩阵稳定性；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：async/Promise/AsyncLock 跨模块矩阵。
- **测了哪些**：async/Promise/AsyncLock 跨模块并发；**无多写者写写逐元素正确性断言**。

# 5. 兼容性与继承

- **用例位置**：JS/TS/ets 三工程矩阵（async/Promise/TypedArray）。
- **测了哪些**：JS/TS/ets 三工程并发模块兼容；**未见并发模块子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`ConcurrencyModularImportAndExportTest` 79 例（import/export 规范）。
- **测了哪些**：模块 import/export 规范符合性；**desc 全为 "test"，取证弱**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ets 并发模块 import/export | ✅(79) | 🟡 | ❌ | 🟡(desc弱) | 🟡 | 🟡 | 🟡 |
| AsyncLock 跨模块 import | ✅(18) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | ✅ |
| Promise 跨模块 import | ✅(27) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | ✅ |
| JS/TS 工程 async | ✅(95) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | ✅ |
| JS/TS 工程 Promise | ✅(68) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | ✅ |
| JS/TS 工程 TypedArray | ✅(48) | 🟡 | ❌ | 🟡 | 🟡 | 🟡 | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **desc 全为 "test"**：335 例 desc 均为 "test"，形态定位极弱，无法区分具体场景。
2. **异常路径全未覆盖**：未见 import/export 失败、循环依赖、未导出符号等异常取证。
3. **重复幂等未覆盖**：无重复 import 稳定取证。
4. **多写者竞态未覆盖**：async/Promise/AsyncLock 无并发数据正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 335 例 desc 细化（按 import/export/async/Promise/TypedArray 具体形态） | desc 全为 "test" 致取证不可用。 |
| P2 | 2 | 异常路径（循环依赖/未导出符号）/ 多写者竞态 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | ets/JS/TS 三工程 × import/export/AsyncLock/Promise/async/TypedArray 矩阵 | 全 9 文件 |
| ②边界值测试 | 各载体边界（desc 未区分） | （desc 弱） |
| ③异常与非法输入 | import/export 失败、循环依赖、未导出符号 | （未取证） |
| ④返回值与类型验证 | import/export 后行为正确（desc 未区分） | （desc 弱） |
| ⑤组合场景 | 三工程×各载体组合（desc 未区分） | （desc 弱） |
| ⑥重复调用幂等性 | 重复 import 稳定 | （未取证） |
| ⑦并发跨线程 | async/Promise/AsyncLock/TypedArray 跨模块并发 | 全套件跨线程用例 |
