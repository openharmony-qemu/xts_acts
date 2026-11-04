# threadworkerjstest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「JS 工程下 `@ohos.worker.ThreadWorker` 线程 Worker 接口」（`.test.js`）——覆盖 constructor（含空串 scriptURL/options 边界与构造错误）、postMessage（含错误）、terminate、on/once/addEventListener/off/removeListener（含各 API 错误码）、parentPortClose、onmessageerror、二级三级 Worker、支持传输类型、SharedArrayBuffer、listener、callObject 全局调用、timer、nestedCall、napi async、序列化原语、多级生命周期、onAllErrors 错误链。
> **数据来源**：`threadworkerjstest/entry/src/ohosTest/ets/test/ThreadWorker.test.js`，共解析 **111** 条用例（`@tc.name` 计数与 `it()` 计数对齐，零漂移；`List.test.js` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.worker.d.ts`（ThreadWorker constructor/postMessage/terminate/on/once/off/addEventListener/removeEventListener/removeListener/parentPortClose/onmessageerror/onAllErrors/callGlobalCallObjectMethod）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
threadworkerjstest（JS 工程 ThreadWorker）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 ThreadWorker constructor（边界 + 构造错误 + finally）
│   ├── 1.2 postMessage（含错误）
│   ├── 1.3 terminate
│   ├── 1.4 事件监听 API（on/once/addEventListener/off/removeListener + 错误码）
│   ├── 1.5 parentPortClose
│   ├── 1.6 onmessageerror
│   ├── 1.7 onAllErrors 错误链
│   ├── 1.8 二级/三级 Worker + 传输类型 + SharedArrayBuffer + listener（场景主题）
│   ├── 1.9 callObject + timer + nestedCall + napi async + 序列化原语（场景主题）
│   └── 1.10 多级 Worker 生命周期（场景主题）
├── 2. 稳定性            （多级 worker 生命周期）
├── 3. 性能              （无独立基线）
├── 4. 并发安全          （多级 worker 通信 + SharedArrayBuffer）
├── 5. 兼容性与继承      （多级 worker 继承链）
└── 6. 资料与文档符合性   （ThreadWorker 接口 + 错误码符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | ThreadWorker.test.js | 111 | ThreadWorker 全接口 + 边界 + 错误码 + 多级生命周期 + onAllErrors 错误链 |
| | **合计** | **111** | ThreadWorker 全场景 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 ThreadWorker constructor（边界 + 构造错误 + finally）

```
ThreadWorker constructor
├── 入参范围覆盖
│   └── 多种 scriptURL 构造 ×10（THREADWORKER_0102~0111）
├── 边界值测试
│   ├── 空串 scriptURL（0200）
│   ├── options.name=""（0203）
│   └── options={}（0206）
├── 异常与非法输入
│   └── 构造抛错误（0106~0109 finally 001、0101 throw error finally）
├── 返回值与类型验证
│   └── worker 实例非 null
└── 组合场景
    └── options.name 与 options={} 不同配置
```

- **用例位置**：`ThreadWorker.test.js` —— `THREADWORKER_0102`~`0111`（constructor ×10，含 0106~0109 throw error、0110/0111）、`0200`（空串 scriptURL）、`0203`（options.name=""）、`0206`（options={}）、`0101`（throw error finally）。共 14 例。
- **测了哪些**：constructor ×10 + 空串/options 边界 + 构造错误 + finally。

---

## 1.2 postMessage（含错误）

```
postMessage
├── 入参范围覆盖
│   └── postMessage 多种消息类型 ×6（0112~0117）+ worker postmessage ×3（0178~0180）
├── 边界值测试
│   └── 消息类型矩阵
├── 异常与非法输入
│   └── postMessage 抛错误（0118/0119）
├── 返回值与类型验证
│   └── postMessage 后 onmessage 回调接收
├── 组合场景
│   └── postMessage→onmessage 回环
├── 重复调用/幂等性
│   └── postMessage 多次发送
└── 并发跨线程
    └── 主线程↔worker 线程消息
```

- **用例位置**：`ThreadWorker.test.js` —— `0112`~`0117`（postMessage ×6）、`0118`/`0119`（postMessage throw error）、`0178`~`0180`（worker postmessage ×3）。共 9 例。
- **测了哪些**：postMessage ×8（含错误）+ worker postmessage 回环。

---

## 1.3 terminate

```
terminate
├── 入参范围覆盖
│   └── terminate 终止 ×4（0120~0123）
├── 返回值与类型验证
│   └── terminate 后停止接收
└── 并发跨线程
    └── 主线程管理 worker 生命周期
```

- **用例位置**：`ThreadWorker.test.js` —— `0120`~`0123`（terminate ×4）。共 4 例。
- **测了哪些**：terminate 终止 worker。

---

## 1.4 事件监听 API（on/once/addEventListener/off/removeListener + 错误码）

```
事件监听 API
├── 入参范围覆盖
│   ├── on ×7（0124~0130）、once ×7（0131~0137）
│   ├── addEventListener ×8（0138~0145）
│   ├── off ×5（0146~0150）
│   └── removeListener ×7（0151~0157）
├── 边界值测试
│   └── 注册移除矩阵
├── 异常与非法输入
│   ├── on throw error（0127~0129）
│   ├── addEventListener throw error（0141~0145）
│   ├── off throw error（0148~0150）
│   └── removeListener throw error（0154~0157）
├── 返回值与类型验证
│   ├── 注册后回调触发
│   ├── 移除后不再触发
│   └── 错误码断言
├── 组合场景
│   ├── on→off 联动
│   └── addEventListener→removeEventListener 联动
├── 重复调用/幂等性
│   └── 多次注册同名事件
└── 并发跨线程
    └── 事件跨线程触发
```

- **用例位置**：`ThreadWorker.test.js` —— `0124`~`0130`（on ×7，含 0127~0129 throw）、`0131`~`0137`（once ×7）、`0138`~`0145`（addEventListener ×8，含 0141~0145 throw）、`0146`~`0150`（off ×5，含 0148~0150 throw）、`0151`~`0157`（removeListener ×7，含 0154~0157 throw）。共 34 例。
- **测了哪些**：5 类事件 API 注册/移除 + 各 API throw error 错误码取证。

---

## 1.5 parentPortClose

```
parentPortClose
├── 入参范围覆盖
│   └── parentPortClose 关闭线程（0158/0159）
├── 边界值测试
│   └── close 后停止接收
├── 返回值与类型验证
│   └── close 后 worker 停止
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`ThreadWorker.test.js` —— `0158`/`0159`（parentPortClose ×2）。共 2 例。
- **测了哪些**：parentPortClose 关闭线程。

---

## 1.6 onmessageerror

```
onmessageerror
├── 入参范围覆盖
│   └── onmessageerror 错误处理（0160/0161）
├── 异常与非法输入
│   └── 序列化错误触发 onmessageerror
├── 返回值与类型验证
│   └── onmessageerror 回调触发
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`ThreadWorker.test.js` —— `0160`/`0161`（onmessageerror ×2）。共 2 例。
- **测了哪些**：onmessageerror 错误处理。

---

## 1.7 onAllErrors 错误链

```
onAllErrors 错误链
├── 入参范围覆盖
│   ├── postMessage throw（0015）
│   ├── worker.js throw（0016）
│   ├── post func to main ×2（0017/0018）
│   ├── worker.onerror throw ×2（0019/0020）
│   └── addEventListener throw（0021）
├── 边界值测试
│   └── 各错误点
├── 异常与非法输入
│   └── 各错误点抛异常 → onAllErrors 捕获
├── 返回值与类型验证
│   └── 异常 message 回传
├── 组合场景
│   └── 多错误源汇聚 onAllErrors
└── 并发跨线程
    └── worker 线程异常回传宿主
```

- **用例位置**：`ThreadWorker.test.js` —— `0015`（postMessage throw）、`0016`（worker.js throw）、`0017`/`0018`（post func to main ×2）、`0019`/`0020`（worker.onerror throw ×2）、`0021`（addEventListener throw）。共 7 例。
- **测了哪些**：5 类错误源汇聚 onAllErrors 错误链。

---

## 1.8 二级/三级 Worker + 传输类型 + SharedArrayBuffer + listener（场景主题）

```
多级 Worker 与传输矩阵
├── 入参范围覆盖
│   ├── new second/third worker（0162/0163）
│   ├── 二级/三级 postMessage（0164~0167）
│   ├── 二级 terminate（0168）
│   ├── 支持传输类型 ×9（0169~0177）
│   ├── SharedArrayBuffer（0182）
│   └── listener ×6（0183~0188）、worker close（0181）
├── 边界值测试
│   └── 传输类型矩阵
├── 返回值与类型验证
│   └── 二级/三级 postMessage 正常、terminate 正常
├── 组合场景
│   └── 多级 worker 通信链
├── 重复调用/幂等性
│   └── 矩阵内重复
└── 并发跨线程
    └── 多级 worker 跨线程通信
```

- **用例位置**：`ThreadWorker.test.js` —— `0162`/`0163`（二级/三级 worker）、`0164`~`0167`（二级/三级 postMessage）、`0168`（二级 terminate）、`0169`~`0177`（支持传输类型 ×9）、`0182`（SharedArrayBuffer）、`0183`~`0188`（listener ×6）、`0181`（worker close）。共 27 例。
- **测了哪些**：二级/三级 worker + 9 传输类型 + SharedArrayBuffer + listener + worker close。

---

## 1.9 callObject + timer + nestedCall + napi async + 序列化原语（场景主题）

```
Worker 高级能力（callObject/timer/nested/async/序列化）
├── 入参范围覆盖
│   ├── callObject 全局调用 ×5（0003~0007）
│   ├── timer（0008）
│   ├── nestedCall（0009）
│   ├── napi_queue_async_work_with_qos（0100）
│   └── 序列化原语 ×3（0010~0012）
├── 边界值测试
│   └── 序列化原语
├── 返回值与类型验证
│   ├── callObject 方法调用成功
│   ├── timer 正常、nested 正常、async 正常
│   └── 序列化原语往返一致
├── 组合场景
│   └── callObject + napi async
└── 并发跨线程
    └── worker 线程内全局调用/定时器/嵌套/异步/序列化
```

- **用例位置**：`ThreadWorker.test.js` —— `0003`~`0007`（callObject ×5）、`0008`（timer）、`0009`（nestedCall）、`0100`（napi async）、`0010`~`0012`（序列化原语 ×3）。共 11 例。
- **测了哪些**：callObject 全局调用 + timer + nestedCall + napi async + 序列化原语。

---

## 1.10 多级 Worker 生命周期（场景主题）

```
多级 Worker 生命周期
├── 入参范围覆盖
│   └── 多级 worker 创建/执行/销毁生命周期 ×2（0013/0014）
├── 边界值测试
│   └── 多级链
├── 返回值与类型验证
│   └── 多级生命周期各阶段状态正确
├── 组合场景
│   └── 多级链贯穿
└── 并发跨线程
    └── 多级 worker 跨线程
```

- **用例位置**：`ThreadWorker.test.js` —— `0013`/`0014`（多级 worker 生命周期 ×2）。共 2 例。
- **测了哪些**：多级 worker 生命周期。

---

# 2. 稳定性

- **用例位置**：`ThreadWorker.test.js` `0013`/`0014`（多级生命周期）、constructor/terminate smoke。
- **测了哪些**：多级 worker 生命周期稳定性；**无长时/GC 压力专项**。

# 3. 性能

- 本套件无独立性能基准用例。

# 4. 并发安全

- **用例位置**：`ThreadWorker.test.js` 二级/三级 worker、SharedArrayBuffer、onAllErrors 错误链。
- **测了哪些**：多级 worker 通信 + SharedArrayBuffer + 错误回传；**无多 worker 写写竞态数据一致性断言**。

# 5. 兼容性与继承

- **用例位置**：`ThreadWorker.test.js` `0013`/`0014`（多级 worker 继承链）、`0162`/`0163`（二级/三级 worker）。
- **测了哪些**：多级 worker 继承链；**未见 ThreadWorker 子类化继承用例**。

# 6. 资料与文档符合性

- **用例位置**：`ThreadWorker.test.js` 111 例覆盖 ThreadWorker 全接口 + 各 API 错误码。
- **测了哪些**：ThreadWorker 接口 + 错误码符合性；**未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ThreadWorker constructor | ✅(×10) | ✅(空串/options) | ✅(构造错误+finally) | ✅(实例) | ✅(options 配置) | ❌ | N/A |
| postMessage | ✅(×8) | 🟡 | ✅(postMessage throw) | ✅(回环) | ✅ | ✅ | ✅ |
| terminate | ✅(×4) | 🟡 | 🟡 | ✅(停止接收) | 🟡 | 🟡 | ✅ |
| 事件监听 API | ✅(5类×多) | 🟡 | ✅(各 API throw) | ✅(触发/移除/错误码) | ✅ | 🟡 | ✅ |
| parentPortClose | ✅(2) | 🟡 | 🟡 | ✅(worker停止) | 🟡 | ❌ | ✅ |
| onmessageerror | ✅(2) | 🟡 | ✅(序列化错误) | ✅(触发) | 🟡 | ❌ | ✅ |
| onAllErrors 错误链 | ✅(5源) | ✅(各源) | ✅(各源抛异常) | ✅(message) | ✅(汇聚) | ❌ | ✅ |
| 多级Worker+传输+SAB+listener | ✅(9类型) | 🟡 | ❌ | ✅ | ✅(多级链) | 🟡 | ✅ |
| callObject/timer/nested/async/序列化 | ✅(11) | 🟡(原语) | ❌ | ✅ | ✅ | 🟡 | ✅ |
| 多级生命周期 | ✅(2) | 🟡 | ❌ | ✅ | ✅ | ❌ | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **重复幂等弱**：constructor/parentPortClose/多级生命周期/onAllErrors 无重复调用稳定取证。
2. **高级能力异常路径未覆盖**：callObject/timer/nestedCall/napi async/序列化原语未见错误码取证。
3. **多级 worker 异常路径未覆盖**：二级/三级 worker terminate/error 路径未见细化。
4. **多 worker 写写竞态未覆盖**：无多 worker 并发读写 SharedArrayBuffer 的正确性断言。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 2 | 高级能力异常路径 / 多 worker 写写竞态 | 补强弱项，非阻断。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | constructor/postMessage/事件/传输/callObject/多级/错误链 全矩阵 | THREADWORKER_0102~0188、0003~0021 |
| ②边界值测试 | 空串 scriptURL、options 边界、序列化原语 | 0200/0203/0206、0010~0012 |
| ③异常与非法输入 | 构造/postMessage/事件 API throw error、onAllErrors 各源 | 0106~0109、0118/0119、0127~0129、0141~0145、0015~0021 |
| ④返回值与类型验证 | 实例、回调触发、错误码、message 回传 | 全套件 |
| ⑤组合场景 | postMessage 回环、多级链、onAllErrors 汇聚、options 配置 | 0136~0139、0015~0021、0203/0206 |
| ⑥重复调用幂等性 | postMessage 多次、多次注册同名事件 | （部分取证） |
| ⑦并发跨线程 | 主线程↔worker↔二级/三级 worker 通信 | 全套件跨线程用例 |
