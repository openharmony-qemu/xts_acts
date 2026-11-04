# workerjstest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「JS 工程下 `@ohos.worker` Worker 接口」（`.test.js`）——覆盖 Worker constructor/postMessage/terminate、on/once/addEventListener/off/removeListener、parentPortClose/onmessageerror、二级与三级 Worker、支持的传输类型、SharedArrayBuffer、监听器，以及 EventListener/EventTarget 的 null/empty/undefined 参数覆盖。
> **数据来源**：`workerjstest/entry/src/ohosTest/ets/test/` 下 2 个 `*.test.js`，共解析 **92** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.js` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.worker.d.ts`（Worker constructor/postMessage/terminate/on/once/off/addEventListener/removeEventListener/removeListener/parentPortClose/onmessageerror）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
workerjstest（JS 工程 @ohos.worker Worker）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 Worker constructor
│   ├── 1.2 postMessage
│   ├── 1.3 terminate
│   ├── 1.4 事件监听 API（on/once/addEventListener/off/removeListener）
│   ├── 1.5 parentPortClose
│   ├── 1.6 onmessageerror
│   ├── 1.7 二级/三级 Worker + 传输类型 + SharedArrayBuffer + listener（场景主题）
│   └── 1.8 EventListener/EventTarget 参数覆盖（场景主题）
├── 2. 稳定性            （多 worker 创建销毁 smoke）
├── 3. 性能              （无独立基线）
├── 4. 并发安全          （多级 worker 通信）
├── 5. 兼容性与继承      （二级/三级 worker 继承链）
└── 6. 资料与文档符合性   （@ohos.worker 接口符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | WorkerTest.test.js | 81 | constructor/postMessage/terminate/on/once/addEventListener/off/removeListener/parentPortClose/onmessageerror/二级三级 worker/支持类型/SharedArrayBuffer/listener/transfer 参数 |
| 2 | WorkerCoverageTest.test.js | 11 | EventListener callable + EventTarget addEventListener/dispatchEvent/removeEventListener null/empty/undefined 参数 + on/once 多回调顺序 |
| | **合计** | **92** | @ohos.worker Worker 全接口 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 Worker constructor

```
Worker constructor
├── 入参范围覆盖
│   └── constructor(scriptURL) 多种 scriptURL 形态 ×6（WORKER_0100~0106）
├── 返回值与类型验证
│   └── worker 实例非 null
└── 并发跨线程
    └── 主线程创建 worker 线程
```

- **用例位置**：`WorkerTest.test.js` —— `WORKER_0100`~`0106`（constructor ×6）。共 6 例。
- **测了哪些**：constructor 多 scriptURL 形态 smoke。

---

## 1.2 postMessage

```
postMessage
├── 入参范围覆盖
│   └── postMessage 多种消息类型 ×6（0106~0111）+ non-empty（0180）
├── 边界值测试
│   ├── postMessage 空/非空 transfer（0158/0159）
│   ├── null message（0160）
│   └── undefined transfer（0161）
├── 返回值与类型验证
│   └── postMessage 后 onmessage 回调接收
├── 组合场景
│   └── postMessage → onmessage 回环
├── 重复调用/幂等性
│   └── postMessage 多次发送
└── 并发跨线程
    └── 主线程↔worker 线程消息
```

- **用例位置**：`WorkerTest.test.js` —— `0106`~`0111`（postMessage ×6）、`0158`~`0164`（postMessage 空/非空 array transfer、null message、undefined transfer）、`0180`（postMessage non-empty）。共 12 例。
- **测了哪些**：postMessage smoke + transfer/message 参数边界。

---

## 1.3 terminate

```
terminate
├── 入参范围覆盖
│   └── terminate 终止 ×4（0112~0115）
├── 返回值与类型验证
│   └── terminate 后停止接收
├── 组合场景
│   └── terminate 后停止接收
└── 并发跨线程
    └── 主线程管理 worker 生命周期
```

- **用例位置**：`WorkerTest.test.js` —— `0112`~`0115`（terminate ×4）。共 4 例。
- **测了哪些**：terminate 终止 smoke。

---

## 1.4 事件监听 API（on/once/addEventListener/off/removeListener）

```
事件监听注册与移除
├── 入参范围覆盖
│   ├── on ×3（0116~0118）
│   ├── once ×3（0119~0121）
│   ├── addEventListener ×3（0122~0124）
│   ├── off ×2（0125~0126）
│   └── removeListener ×3（0127~0129）
├── 边界值测试
│   ├── on 空串/null/undefined listener（0165~0169）
│   ├── once 空串/null/undefined listener（0170~0174）
│   └── off 空串/null/undefined listener（0175~0179）
├── 异常与非法输入
│   └── type/listener 非法值处理
├── 返回值与类型验证
│   ├── 注册后回调被触发
│   └── 移除后不再触发
├── 组合场景
│   ├── on 多回调按序
│   └── once 仅触发一次
├── 重复调用/幂等性
│   └── 多次注册同名事件
└── 并发跨线程
    └── 事件跨线程触发
```

- **用例位置**：`WorkerTest.test.js` —— `0116`~`0118`（on ×3）、`0119`~`0121`（once ×3）、`0122`~`0124`（addEventListener ×3）、`0125`~`0126`（off ×2）、`0127`~`0129`（removeListener ×3）、`0165`~`0169`（on 空串/null/undefined listener）、`0170`~`0174`（once 空串/null/undefined listener）、`0175`~`0179`（off 空串/null/undefined listener）。共 30 例。
- **测了哪些**：5 类事件 API 注册/移除 + type/listener 空串/null/undefined 参数边界。

---

## 1.5 parentPortClose

```
parentPortClose
├── 入参范围覆盖
│   └── parentPortClose 关闭线程（0130/0131）
├── 边界值测试
│   └── close 后停止接收
├── 返回值与类型验证
│   └── close 后 worker 停止
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`WorkerTest.test.js` —— `0130`/`0131`（parentPortClose ×2）。共 2 例。
- **测了哪些**：parentPortClose 关闭线程。

---

## 1.6 onmessageerror

```
onmessageerror
├── 入参范围覆盖
│   └── onmessageerror 错误处理（0132/0133）
├── 异常与非法输入
│   └── 序列化错误触发 onmessageerror
├── 返回值与类型验证
│   └── onmessageerror 回调触发
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`WorkerTest.test.js` —— `0132`/`0133`（onmessageerror ×2）。共 2 例。
- **测了哪些**：onmessageerror 错误处理。

---

## 1.7 二级/三级 Worker + 传输类型 + SharedArrayBuffer + listener（场景主题）

```
多级 Worker 与传输矩阵
├── 入参范围覆盖
│   ├── new second worker、new third worker（0134/0135）
│   ├── 二级/三级 postMessage（0136~0138）
│   ├── 二级 worker terminate（0140）
│   ├── 支持传输类型 ×10（0141~0150）
│   ├── SharedArrayBuffer（0151）
│   └── listener ×6（0152~0157）
├── 边界值测试
│   └── 传输类型矩阵
├── 返回值与类型验证
│   └── 二级/三级 worker postMessage 正常、terminate 正常
├── 组合场景
│   └── 多级 worker 通信链
├── 重复调用/幂等性
│   └── 传输类型矩阵内重复
└── 并发跨线程
    └── 多级 worker 跨线程通信
```

- **用例位置**：`WorkerTest.test.js` —— `0134`/`0135`（new 二级/三级 worker）、`0136`~`0138`（二级 worker postMessage ×3）、`0139`（三级 worker postMessage）、`0140`（二级 worker terminate）、`0141`~`0150`（支持传输类型 ×10）、`0151`（SharedArrayBuffer）、`0152`~`0157`（listener ×6）。共 25 例。
- **测了哪些**：二级/三级 worker 通信 + 10 种传输类型 + SharedArrayBuffer + listener。

---

## 1.8 EventListener/EventTarget 参数覆盖（场景主题）

```
EventListener / EventTarget 参数覆盖
├── 入参范围覆盖
│   ├── EventListener callable 接口（SUP_0139）
│   ├── addEventListener/dispatchEvent/removeEventListener 的 type/event/listener 参数
│   └── on/once 多回调按序触发（0137/0138）
├── 边界值测试
│   ├── type 空串/null/undefined（0140~0142、0145~0147）
│   └── event null/undefined（0143/0144）
├── 异常与非法输入
│   └── 非法 type/event/listener 处理
├── 返回值与类型验证
│   ├── dispatchEvent 返回
│   └── addEventListener 注册生效
├── 组合场景
│   └── on/once 多回调按序触发
└── 并发跨线程
    └── EventTarget 跨线程
```

- **用例位置**：`WorkerCoverageTest.test.js` —— `SUP_0139`（EventListener callable）、`0140`/`0141`/`0142`（addEventListener 空/null/undefined type）、`0143`/`0144`（dispatchEvent null/undefined event）、`0145`/`0146`/`0147`（removeEventListener 空/null/undefined type）、`0137`（on 多回调按序）、`0138`（once 多回调）。共 11 例。
- **测了哪些**：EventListener callable + EventTarget 三 API 的 type/event/listener null/empty/undefined 全覆盖 + on/once 多回调顺序。

---

# 2. 稳定性

- **用例位置**：`WorkerTest.test.js` constructor/terminate smoke（多 worker 创建销毁）。
- **测了哪些**：worker 创建/销毁 smoke 稳定性；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：`WorkerTest.test.js` 二级/三级 worker、postMessage 回环、SharedArrayBuffer。
- **测了哪些**：多级 worker 通信 + SharedArrayBuffer 共享；**无多 worker 写写竞态数据一致性断言**。

# 5. 兼容性与继承

- **用例位置**：`WorkerTest.test.js` `0134`/`0135`（二级/三级 worker）。
- **测了哪些**：二级/三级 worker 继承链；**未见 Worker 子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`WorkerTest.test.js` 81 例覆盖 @ohos.worker Worker 全接口。
- **测了哪些**：@ohos.worker 接口符合性；**未发现与文档逐条断言的符合性用例，错误码（10200004 等）未见 assertEqual 取证**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Worker constructor | ✅(×6) | 🟡 | 🟡(smoke) | ✅(实例) | 🟡 | ❌ | ✅ |
| postMessage | ✅(×6) | ✅(空/null/undefined) | 🟡(smoke) | ✅(回环) | ✅ | ✅ | ✅ |
| terminate | ✅(×4) | 🟡 | 🟡 | ✅(停止接收) | ✅ | 🟡 | ✅ |
| 事件监听 API | ✅(5类) | ✅(空串/null/undefined) | ✅ | ✅(触发/移除) | ✅(多回调/once单次) | 🟡 | ✅ |
| parentPortClose | ✅(2) | 🟡 | 🟡 | ✅ | 🟡 | ❌ | ✅ |
| onmessageerror | ✅(2) | 🟡 | 🟡 | ✅ | 🟡 | ❌ | ✅ |
| 多级Worker+传输+SharedArrayBuffer | ✅(10类型) | 🟡 | ❌ | ✅ | ✅(多级链) | 🟡 | ✅ |
| EventListener/EventTarget参数覆盖 | ✅(11) | ✅(null/empty/undefined) | ✅ | ✅(dispatchEvent) | ✅(多回调顺序) | 🟡 | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **错误码未取证**：10200004（worker 未运行）等错误码未见 assertEqual，仅在 threadworkerjstest 取证。
2. **重复幂等弱**：parentPortClose/onmessageerror/多级 worker 无重复调用稳定取证。
3. **多级 worker 异常路径未覆盖**：二级/三级 worker terminate/error 路径未见细化。
4. **多 worker 写写竞态未覆盖**：无多 worker 并发读写 SharedArrayBuffer 的正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 2 | 错误码 assertEqual 取证 / 多 worker 写写竞态 | 错误码硬契约在 JS 工程下未取证。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | constructor/postMessage/事件 API/传输类型矩阵 | WORKER_0100~0157 |
| ②边界值测试 | type/listener/message/transfer 空/null/undefined | 0158~0179、Coverage 0140~0147 |
| ③异常与非法输入 | 非法 type/event/listener 处理 | Coverage 11 例 |
| ④返回值与类型验证 | worker 实例、回调触发、dispatchEvent 返回 | constructor/postMessage/dispatchEvent |
| ⑤组合场景 | postMessage→onmessage 回环、多级 worker 链、多回调顺序 | 0136~0139、0137/0138 |
| ⑥重复调用幂等性 | postMessage 多次、多次注册同名事件 | （部分取证） |
| ⑦并发跨线程 | 主线程↔worker↔二级/三级 worker 通信 | 全套件跨线程用例 |
