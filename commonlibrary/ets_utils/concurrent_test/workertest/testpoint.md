# workertest 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「`@ohos.worker.ThreadWorker` 全接口」——覆盖 constructor/postMessage/postMessageWithSharedSendable/postMessageAtFront、on/once/off/addEventListener/removeEventListener/removeAllListener、terminate/onexit/onerror/onmessageerror/onAllErrors/onmessage、parentPortClose/dispatchEvent/GlobalScope/callObject、Worker 优先级/Message/Transferable、shared config、全错误码矩阵（10200004/06/07/19/20/21）、null/undefined/empty 参数覆盖、事件类继承（ErrorEvent/MessageEvents/OnAllErrors/OnError/OnExit/OnMessageError/OnMessage/ThreadWorker）、容器序列化、worker+taskpool GC、优先级矩阵、integration。
> **数据来源**：`workertest/entry/src/ohosTest/ets/test/` 下 22 个 `*.test.ets`（含 `inheritance/`、`worker/` 子目录），共解析 **991** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **声明authoritative**：`interface/sdk-js/api/@ohos.worker.d.ts`（ThreadWorker constructor/postMessage/postMessageWithSharedSendable/postMessageAtFront/on/once/off/addEventListener/removeEventListener/removeAllListener/terminate/onexit/onerror/onmessageerror/onAllErrors/onmessage/parentPortClose/dispatchEvent/registerGlobalCallObject/callGlobalCallObjectMethod/ThreadWorkerGlobalScope）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
workertest（@ohos.worker ThreadWorker 全接口）
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 ThreadWorker constructor
│   ├── 1.2 postMessage
│   ├── 1.3 postMessageWithSharedSendable
│   ├── 1.4 postMessageAtFront
│   ├── 1.5 on / once / off
│   ├── 1.6 addEventListener / removeEventListener / removeAllListener
│   ├── 1.7 terminate
│   ├── 1.8 onmessage
│   ├── 1.9 onexit
│   ├── 1.10 onerror
│   ├── 1.11 onmessageerror
│   ├── 1.12 onAllErrors
│   ├── 1.13 parentPortClose
│   ├── 1.14 dispatchEvent
│   ├── 1.15 registerGlobalCallObject / callGlobalCallObjectMethod / ThreadWorkerGlobalScope
│   ├── 1.16 Worker 优先级 / Message / Transferable（场景主题）
│   ├── 1.17 Worker shared config（场景主题）
│   ├── 1.18 全错误码矩阵（跨切面主题）
│   ├── 1.19 参数覆盖 null/undefined/empty（跨切面主题）
│   ├── 1.20 事件类继承（ErrorEvent/MessageEvents/...ThreadWorker）（跨切面主题）
│   └── 1.21 容器序列化 / worker+taskpool GC / 优先级矩阵 / integration（场景主题）
├── 2. 稳定性              （worker+taskpool GC、优先级 ×多）
├── 3. 性能                （优先级矩阵，无独立基线）
├── 4. 并发安全            （多 worker 通信、shared config）
├── 5. 兼容性与继承        （事件类继承 ×8）
└── 6. 资料与文档符合性     （全错误码 assertEqual + 接口符合性）
```

**测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用/幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | Worker.test.ets | 25 | postMessage + postMessageWithSharedSendable ×多 |
| 2 | Worker1.test.ets | 197 | constructor/postMessage/SharedSendable/on/once/off/callObject/terminate/onexit/onerror/addEventListener/removeEventListener/removeAllListener/GlobalScope/Composite |
| 3 | WorkerAdd.test.ets | 6 | Worker 优先级(high/medium/low/background) + Message + Transferable |
| 4 | WorkerAtFront.test.ets | 13 | postMessageAtFront message/priority/transfer null/undefined/empty/sendable/insertion order |
| 5 | WorkerConfigTest.test.ets | 3 | Worker shared config via SharedSendable + bump version + get missing key |
| 6 | WorkerCoverage.test.ets | 67 | postMessage/SharedSendable/dispatchEvent/on/once/off/addEventListener/removeEventListener null/empty/undefined + registerGlobalCallObject + 10200004 + 多回调顺序 |
| 7 | WorkerErrorCode.test.ets | 45 | 全错误码 assertEqual（10200004/06/07/19/20/21） |
| 8 | WorkerIntegrationTest.test.ets | 5 | worker integration |
| 9 | WorkerPriTest.test.ets | 141 | Worker 优先级 ×多矩阵 |
| 10 | WorkerSendableTest.test.ets | 3 | Worker sendable |
| 11 | WorkerTaskPoolGCTest.test.ets | 10 | worker+taskpool GC |
| 12 | WorkerTest.test.ets | 115 | ThreadWorker 全接口 |
| 13 | WorkerTestContainer.test.ets | 7 | container serialize |
| 14 | inheritance/ErrorEventInheritanceTest.test.ets | 13 | ErrorEvent 继承 |
| 15 | inheritance/MessageEventsInheritanceTest.test.ets | 12 | MessageEvents 继承 |
| 16 | inheritance/OnAllErrorsTest.test.ets | 23 | OnAllErrors 继承 |
| 17 | inheritance/OnErrorTest.test.ets | 18 | OnError 继承 |
| 18 | inheritance/OnExitTest.test.ets | 12 | OnExit 继承 |
| 19 | inheritance/OnMessageErrorTest.test.ets | 27 | OnMessageError 继承 |
| 20 | inheritance/OnMessageTest.test.ets | 36 | OnMessage 继承 |
| 21 | inheritance/ThreadWorkerInheritanceTest.test.ets | 18 | ThreadWorker 继承 |
| 22 | worker/Worker.test.ets | 195 | Worker 全接口（worker 子目录） |
| | **合计** | **991** | ThreadWorker 全场景 |

---

# 1. 接口测试

## 1.1 ThreadWorker constructor

```
ThreadWorker constructor
├── 入参范围覆盖
│   └── constructor(scriptURL) ×11（Worker1 CONSTRUCTOR_0100~1800）
├── 异常与非法输入
│   └── constructor 10200007（WorkerErrorCode 2500）
├── 返回值与类型验证
│   └── instanceof ThreadWorker、worker 实例非 null
└── 组合场景
    └── construct + postMessage + onmessage
```

- **用例位置**：`Worker1.test.ets` `CONSTRUCTOR_0100`~`1800`（constructor ×11）、`WorkerErrorCode.test.ets` `2500`（constructor 10200007）。共 12 例。
- **测了哪些**：constructor scriptURL ×11 + 10200007。

---

## 1.2 postMessage

```
postMessage
├── 入参范围覆盖
│   └── postMessage 消息类型矩阵（Worker1 POST_MESSAGE_0100~5000、Worker 0100~2500）
├── 边界值测试
│   ├── postMessage 空/非空 transfer
│   └── null/undefined message（Coverage）
├── 异常与非法输入
│   └── postMessage 10200004/06（WorkerErrorCode）
├── 返回值与类型验证
│   └── postMessage 后 onmessage 接收
├── 组合场景
│   └── postMessage → onmessage 回环
├── 重复调用/幂等性
│   └── postMessage 多次发送
└── 并发跨线程
    └── 主线程↔worker 线程消息
```

- **用例位置**：`Worker1.test.ets` `POST_MESSAGE_0100`~`5000`、`Worker.test.ets` `0100`~`2500`、`WorkerCoverage.test.ets` POSTMESSAGE_PARAM 段、`WorkerErrorCode` postMessage 10200004/06。共 ~多数例。
- **测了哪些**：postMessage 类型矩阵 + transfer/message 边界 + 10200004/06。

---

## 1.3 postMessageWithSharedSendable

```
postMessageWithSharedSendable
├── 入参范围覆盖
│   └── postMessageWithSharedSendable ×多（Worker1 POST_MESSAGE_WITH_SHARED_SENDABLE_0100~5000、Worker 0100~2500）
├── 边界值测试
│   └── SharedSendable transfer null/undefined/empty（Coverage）
├── 异常与非法输入
│   └── postMessageWithSharedSendable null/undefined（见 Coverage）、10200004/06
├── 返回值与类型验证
│   └── shared sendable 引用
└── 并发跨线程
    └── 主线程↔worker 线程 shared 引用
```

- **用例位置**：`Worker1.test.ets` `POST_MESSAGE_WITH_SHARED_SENDABLE_0100`~`5000`、`Worker.test.ets` SharedSendable 段、`WorkerCoverage` SharedSendable transfer 段。共 ~多数例。
- **测了哪些**：postMessageWithSharedSendable + transfer 边界 + shared 引用。

---

## 1.4 postMessageAtFront

```
postMessageAtFront
├── 入参范围覆盖
│   └── postMessageAtFront(message, priority, transfer)（WorkerAtFront 0100~1300）
├── 边界值测试
│   ├── message/priority/transfer null/undefined/empty
│   ├── sendable
│   └── insertion order（same priority）
├── 异常与非法输入
│   └── postMessageAtFront non-serializable
├── 返回值与类型验证
│   └── postMessageAtFront 后 onmessage 接收、插入顺序
└── 组合场景
    └── postMessageAtFront same priority insertion order
```

- **用例位置**：`WorkerAtFront.test.ets` `0100`~`1300`（postMessageAtFront message/priority/transfer ×13）。共 13 例。
- **测了哪些**：postMessageAtFront 全参数边界 + insertion order + non-serializable。

---

## 1.5 on / once / off

```
on / once / off
├── 入参范围覆盖
│   ├── on ×15（Worker1 ON_0100~1500）
│   ├── once ×15（Worker1 ONCE_0100~1500）
│   └── off ×17（Worker1 OFF_0001~0017）
├── 边界值测试
│   └── type/listener null/empty/undefined（Coverage）
├── 异常与非法输入
│   └── on/once/off 10200004 when worker not running（ErrorCode）
├── 返回值与类型验证
│   ├── 注册后回调触发
│   └── 移除后不再触发
├── 组合场景
│   ├── on/once 多回调按序
│   └── on→off 联动
├── 重复调用/幂等性
│   └── 多次注册同名事件
└── 并发跨线程
    └── 事件跨线程触发
```

- **用例位置**：`Worker1.test.ets` `ON_0100`~`1500`/`ONCE_0100`~`1500`/`OFF_0001`~`0017`、`WorkerCoverage` on/once/off null/empty/undefined、`WorkerErrorCode` on/once/off 10200004。共 ~多数例。
- **测了哪些**：on/once/off 注册/移除 + null/empty/undefined + 多回调顺序 + 10200004。

---

## 1.6 addEventListener / removeEventListener / removeAllListener

```
addEventListener / removeEventListener / removeAllListener
├── 入参范围覆盖
│   ├── addEventListener / removeEventListener（Worker1 ADD_EVENT_LISTENER/REMOVE_EVENT_LISTENER）
│   └── removeAllListener ×17（Worker1 REMOVE_ALL_LISTENER_0001~0017）
├── 边界值测试
│   └── type/listener null/empty/undefined（Coverage）
├── 异常与非法输入
│   └── addEventListener/dispatchEvent/removeEventListener/removeAllListener 10200004（ErrorCode）
├── 返回值与类型验证
│   ├── 注册后回调触发、移除后不再触发
│   └── dispatchEvent returns true/false
├── 组合场景
│   └── addEventListener→removeEventListener 联动
├── 重复调用/幂等性
│   └── removeAllListener 多次
└── 并发跨线程
    └── 事件跨线程触发
```

- **用例位置**：`Worker1.test.ets` `ADD_EVENT_LISTENER`/`REMOVE_EVENT_LISTENER`/`REMOVE_ALL_LISTENER_0001`~`0017`、`WorkerCoverage` addEventListener/removeEventListener null/empty/undefined、`WorkerErrorCode` EventTarget 10200004。共 ~多数例。
- **测了哪些**：EventTarget 3 API 注册/移除 + null/empty/undefined + 10200004 + removeAllListener ×17。

---

## 1.7 terminate

```
terminate
├── 入参范围覆盖
│   └── terminate 终止 ×3（Worker1 TERMINATE_0001~0003）
├── 异常与非法输入
│   └── terminate 后调用抛错（10200004）
├── 返回值与类型验证
│   └── terminate 后停止接收
└── 并发跨线程
    └── 主线程管理 worker 生命周期
```

- **用例位置**：`Worker1.test.ets` `TERMINATE_0001`~`0003`。共 3 例。
- **测了哪些**：terminate 终止 worker。

---

## 1.8 onmessage

```
onmessage
├── 入参范围覆盖
│   └── onmessage 回调注册/触发（Worker1、inheritance/OnMessageTest 36）
├── 返回值与类型验证
│   └── onmessage 接收 postMessage 数据
└── 并发跨线程
    └── worker 线程→主线程消息
```

- **用例位置**：`Worker1.test.ets` onmessage 段、`inheritance/OnMessageTest.test.ets`（36 例继承）。共 ~多数例。
- **测了哪些**：onmessage 回调 + 继承。

---

## 1.9 onexit

```
onexit
├── 入参范围覆盖
│   └── onexit 回调（Worker1 ONEXIT_0001/0002、inheritance/OnExitTest 12）
├── 异常与非法输入
│   └── onexit 10200004（ErrorCode）
├── 返回值与类型验证
│   └── onexit 触发、exit code
└── 组合场景
    └── terminate + onexit 联动
```

- **用例位置**：`Worker1.test.ets` `ONEXIT_0001`/`0002`、`inheritance/OnExitTest.test.ets`（12 例）、`WorkerErrorCode` onexit 10200004。共 ~多数例。
- **测了哪些**：onexit 回调 + exit code + 10200004 + 继承。

---

## 1.10 onerror

```
onerror
├── 入参范围覆盖
│   └── onerror 回调（Worker1 ONERROR_0001、inheritance/OnErrorTest 18）
├── 异常与非法输入
│   └── onerror 10200004（ErrorCode）
├── 返回值与类型验证
│   └── onerror 触发、error message
└── 组合场景
    └── error 链 onAllErrors 汇聚
```

- **用例位置**：`Worker1.test.ets` `ONERROR_0001`、`inheritance/OnErrorTest.test.ets`（18 例）、`WorkerErrorCode` onerror 10200004。共 ~多数例。
- **测了哪些**：onerror 回调 + error message + 10200004 + 继承。

---

## 1.11 onmessageerror

```
onmessageerror
├── 入参范围覆盖
│   └── onmessageerror 回调（inheritance/OnMessageErrorTest 27）
├── 异常与非法输入
│   └── onmessageerror 10200004（ErrorCode）、序列化错误触发
├── 返回值与类型验证
│   └── onmessageerror 触发
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`inheritance/OnMessageErrorTest.test.ets`（27 例）、`WorkerErrorCode` onmessageerror 10200004。共 ~多数例。
- **测了哪些**：onmessageerror 回调 + 10200004 + 继承。

---

## 1.12 onAllErrors

```
onAllErrors
├── 入参范围覆盖
│   └── onAllErrors 错误链汇聚（inheritance/OnAllErrorsTest 23）
├── 异常与非法输入
│   └── onAllErrors 10200004（ErrorCode）
├── 返回值与类型验证
│   └── onAllErrors 汇聚多错误源 message
└── 组合场景
    └── error 链 onAllErrors 汇聚
```

- **用例位置**：`inheritance/OnAllErrorsTest.test.ets`（23 例）、`WorkerErrorCode` onAllErrors 10200004。共 ~多数例。
- **测了哪些**：onAllErrors 错误链汇聚 + 10200004 + 继承。

---

## 1.13 parentPortClose

```
parentPortClose
├── 入参范围覆盖
│   └── parentPortClose 关闭线程（Worker1、Coverage）
├── 返回值与类型验证
│   └── close 后 worker 停止
└── 并发跨线程
    └── worker↔主线程
```

- **用例位置**：`Worker1.test.ets` parentPortClose 段、`WorkerCoverage`。共 ~少数例。
- **测了哪些**：parentPortClose 关闭线程。

---

## 1.14 dispatchEvent

```
dispatchEvent
├── 入参范围覆盖
│   └── dispatchEvent(event)（Worker1、Coverage）
├── 边界值测试
│   └── dispatchEvent null/undefined event
├── 异常与非法输入
│   └── dispatchEvent 10200004（ErrorCode）
├── 返回值与类型验证
│   └── dispatchEvent returns true/false
└── 组合场景
    └── dispatchEvent + addEventListener 联动
```

- **用例位置**：`Worker1.test.ets`、`WorkerCoverage` dispatchEvent null/undefined、`WorkerErrorCode` dispatchEvent 10200004。共 ~少数例。
- **测了哪些**：dispatchEvent + null/undefined event + 10200004 + returns。

---

## 1.15 registerGlobalCallObject / callGlobalCallObjectMethod / ThreadWorkerGlobalScope

```
registerGlobalCallObject / callGlobalCallObjectMethod / ThreadWorkerGlobalScope
├── 入参范围覆盖
│   ├── registerGlobalCallObject / unregister（Worker1 CALL_OBJECT_0100~1600）
│   ├── callGlobalCallObjectMethod 方法调用
│   └── GlobalScope（Worker1 GLOBAL_SCOPE_0001/0002）
├── 边界值测试
│   └── registerGlobalCallObject null/undefined（Coverage）
├── 异常与非法输入
│   └── callGlobalCallObjectMethod 10200004/06/19/20/21（ErrorCode 1900~2300）
├── 返回值与类型验证
│   └── callObject 方法调用成功
└── 组合场景
    └── register→call→unregister
```

- **用例位置**：`Worker1.test.ets` `CALL_OBJECT_0100`~`1600`/`GLOBAL_SCOPE_0001`/`0002`、`WorkerCoverage` registerGlobalCallObject null/undefined、`WorkerErrorCode` `1900`~`2300`（callGlobalCallObjectMethod 10200004/06/19/20/21）。共 ~多数例。
- **测了哪些**：callObject register/unregister + GlobalScope + 10200004/06/19/20/21。

---

## 1.16 Worker 优先级 / Message / Transferable（场景主题）

```
Worker 优先级 / Message / Transferable
├── 入参范围覆盖
│   ├── Worker 优先级 high/medium/low/background（WorkerAdd 0100~0600）
│   ├── Message 类
│   └── Transferable(ArrayBuffer)
├── 边界值测试
│   └── 优先级矩阵 ×141（WorkerPriTest 0100~0141）
├── 返回值与类型验证
│   ├── 优先级生效
│   ├── Message 持有数据
│   └── Transferable 所有权转移
├── 组合场景
│   └── 优先级 + postMessage
├── 重复调用/幂等性
│   └── 优先级矩阵 ×多
└── 并发跨线程
    └── 多 worker 优先级调度
```

- **用例位置**：`WorkerAdd.test.ets` `0100`~`0600`、`WorkerPriTest.test.ets` `0100`~`0141`。共 147 例。
- **测了哪些**：4 优先级 + Message + Transferable + 优先级 ×141 矩阵；**优先级矩阵 desc 模式化**。

---

## 1.17 Worker shared config（场景主题）

```
Worker shared config
├── 入参范围覆盖
│   ├── postMessageWithSharedSendable 传 Sendable 配置
│   ├── set/get config 键
│   └── version bump
├── 边界值测试
│   └── get on missing key returns not found
├── 返回值与类型验证
│   └── set 后 shared config 生效、bump version
├── 组合场景
│   └── set → bump version → get
└── 并发跨线程
    └── shared config 跨线程共享
```

- **用例位置**：`WorkerConfigTest.test.ets` `0100`~`0300`（set shared config + bump version + get missing key）。共 3 例。
- **测了哪些**：shared config set/get + version bump + missing key；**仅 3 例**。

---

## 1.18 全错误码矩阵（跨切面主题）

```
全错误码矩阵
├── 入参范围覆盖
│   └── 各 API 非法入参触发 10200004/06/07/19/20/21 错误码
├── 边界值测试
│   └── 各错误码触发场景
├── 异常与非法输入
│   └── 10200004/06/07/19/20/21 assertEqual
├── 返回值与类型验证
│   └── 错误码 assertEqual
└── 组合场景
    └── 各 API 错误码
```

- **用例位置**：`WorkerErrorCode.test.ets` `0100`~`4300`（45 例：WorkerEventListener Constructor 10200004、EventTarget addEventListener/dispatchEvent/removeEventListener/removeAllListener 10200004、ThreadWorkerGlobalScope onmessage/postMessage/postMessageWithSharedSendable/callGlobalCallObjectMethod 10200004/06/19/20/21、ThreadWorker constructor 10200007、onexit/onerror/onAllErrors/onmessageerror/postMessage/postMessageWithSharedSendable/on/once/off/addEventListener/dispatchEvent/removeEventListener 10200004/06）。共 45 例。
- **测了哪些**：6 错误码（10200004/06/07/19/20/21）assertEqual 全矩阵 + 各 API 错误场景。

---

## 1.19 参数覆盖 null/undefined/empty（跨切面主题）

```
参数覆盖 null/undefined/empty
├── 入参范围覆盖
│   └── 全 API 各入参（type/listener/message/transfer）取 null/empty/undefined
├── 边界值测试
│   ├── empty/non-empty transfer
│   └── empty string type
├── 异常与非法输入
│   └── null/undefined 各参数处理、10200004 when not running
├── 返回值与类型验证
│   ├── dispatchEvent returns
│   └── 注册生效
└── 组合场景
    └── EventTarget API 与 ThreadWorker API 对位
```

- **用例位置**：`WorkerCoverage.test.ets` `POSTMESSAGE_PARAM`~`REMOVELISTENER_CALLBACK_UNDEF`（67 例：postMessage/SharedSendable transfer、dispatchEvent、on/once/off/addEventListener/removeEventListener null/empty/undefined type/listener、registerGlobalCallObject null/undefined、10200004 when not running、on/once 多回调顺序、EventTarget API 对位）。共 67 例。
- **测了哪些**：全 API null/empty/undefined 参数覆盖 + EventTarget/ThreadWorker 对位 + 10200004 + 多回调顺序。

---

## 1.20 事件类继承（ErrorEvent/MessageEvents/...ThreadWorker）（跨切面主题）

```
事件类继承
├── 入参范围覆盖
│   ├── ErrorEvent/MessageEvents 继承
│   ├── OnAllErrors/OnError/OnExit/OnMessageError/OnMessage 回调继承
│   └── ThreadWorker 子类继承
├── 返回值与类型验证
│   ├── 继承后 instanceof
│   ├── 回调触发
│   └── 属性可读
├── 组合场景
│   └── 多事件继承联动
└── 并发跨线程
    └── worker 线程事件回传
```

- **用例位置**：`inheritance/ErrorEventInheritanceTest.test.ets`（13）、`MessageEventsInheritanceTest`（12）、`OnAllErrorsTest`（23）、`OnErrorTest`（18）、`OnExitTest`（12）、`OnMessageErrorTest`（27）、`OnMessageTest`（36）、`ThreadWorkerInheritanceTest`（18），共 159 例。
- **测了哪些**：8 类事件/ThreadWorker 继承链 + instanceof + 回调触发 + 属性。

---

## 1.21 容器序列化 / worker+taskpool GC / 优先级矩阵 / integration（场景主题）

```
容器序列化 / GC / 优先级 / integration
├── 入参范围覆盖
│   ├── container serialize（WorkerTestContainer 7）
│   ├── worker+taskpool GC（WorkerTaskPoolGC 10）
│   ├── 优先级 ×141（WorkerPriTest，跨节 §1.16）
│   └── integration（WorkerIntegrationTest 5）、sendable（WorkerSendableTest 3）
├── 边界值测试
│   └── GC 压力、优先级矩阵
├── 返回值与类型验证
│   ├── 容器传递一致
│   ├── GC 后状态
│   └── 优先级生效
├── 组合场景
│   └── worker + taskpool
├── 重复调用/幂等性
│   └── 优先级矩阵 ×多
└── 并发跨线程
    └── worker + taskpool 跨线程
```

- **用例位置**：`WorkerTestContainer.test.ets`（7，容器序列化）、`WorkerTaskPoolGCTest.test.ets`（10，worker+taskpool GC）、`WorkerIntegrationTest.test.ets`（5，integration）、`WorkerSendableTest.test.ets`（3，sendable）、`WorkerTest.test.ets`（115，全接口）、`worker/Worker.test.ets`（195，Worker 全接口）。共 ~335 例。
- **测了哪些**：容器序列化 + worker+taskpool GC + integration + sendable + 全接口；**WorkerTest/worker.Worker 两文件 desc 模式化（多为接口名）**。

---

# 2. 稳定性

- **用例位置**：`WorkerTaskPoolGCTest.test.ets`（10，GC）、`WorkerPriTest.test.ets`（141，优先级 ×多）、`worker/Worker.test.ets`（195）。
- **测了哪些**：worker+taskpool GC 稳定性 + 优先级矩阵稳定性；**无长时压力专项**。

# 3. 性能

- **用例位置**：`WorkerPriTest.test.ets`（141，优先级矩阵）。
- **测了哪些**：优先级矩阵吞吐；**无独立时延基线基准用例**。

# 4. 并发安全

- **用例位置**：`WorkerConfigTest`（shared config）、`WorkerTaskPoolGCTest`（worker+taskpool）、`Worker.test.ets`（postMessage + SharedSendable）。
- **测了哪些**：shared config 跨线程共享 + worker+taskpool 并发 + SharedSendable；**无多 worker 写写竞态数据一致性断言**。

# 5. 兼容性与继承

- **用例位置**：`inheritance/` 8 文件（159 例：ErrorEvent/MessageEvents/OnAllErrors/OnError/OnExit/OnMessageError/OnMessage/ThreadWorker）。
- **测了哪些**：8 类事件/ThreadWorker 继承链 + instanceof + 回调 + 属性；**未见 worker API 子类化覆写新 API 用例**。

# 6. 资料与文档符合性

- **用例位置**：`WorkerErrorCode.test.ets`（45，6 错误码 assertEqual）、`WorkerCoverage.test.ets`（67，参数覆盖）。
- **测了哪些**：6 错误码 assertEqual + null/empty/undefined 参数契约；**未见与文档逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 接口/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ThreadWorker constructor | ✅(×11) | 🟡 | ✅(10200007) | ✅(instanceof) | ✅ | 🟡 | ✅ |
| postMessage | ✅(×多) | ✅(null/empty/transfer) | ✅(10200004/06) | ✅(回环) | ✅ | ✅(多次) | ✅ |
| postMessageWithSharedSendable | ✅(×多) | ✅(null/undefined/empty) | ✅(10200004/06) | ✅(shared引用) | ✅ | 🟡 | ✅ |
| postMessageAtFront | ✅(13) | ✅(null/undefined/empty/sendable) | ✅(non-serializable) | ✅(insertion order) | ✅ | 🟡 | ✅ |
| on/once/off | ✅(×多) | ✅(null/empty/undefined) | ✅(10200004) | ✅(触发/移除) | ✅(多回调顺序) | ✅ | ✅ |
| addEventListener/removeEventListener/removeAllListener | ✅(5类×多) | ✅(null/empty/undefined) | ✅(10200004) | ✅(dispatch returns) | ✅(联动) | ✅(removeAll ×17) | ✅ |
| terminate | ✅(3) | 🟡 | ✅(10200004) | ✅(停止接收) | 🟡 | 🟡 | ✅ |
| onmessage | ✅(×多) | 🟡 | 🟡 | ✅(接收数据) | ✅ | 🟡 | ✅ |
| onexit | ✅(×多) | 🟡 | ✅(10200004) | ✅(exit code) | ✅(terminate联动) | 🟡 | ✅ |
| onerror | ✅(×多) | 🟡 | ✅(10200004) | ✅(message) | ✅(error链汇聚) | 🟡 | ✅ |
| onmessageerror | ✅(×多) | 🟡 | ✅(10200004/序列化错误) | ✅(触发) | 🟡 | 🟡 | ✅ |
| onAllErrors | ✅(×多) | 🟡 | ✅(10200004) | ✅(汇聚message) | ✅(error链汇聚) | 🟡 | ✅ |
| parentPortClose | ✅ | 🟡 | 🟡 | ✅(worker停止) | 🟡 | ❌ | ✅ |
| dispatchEvent | ✅ | ✅(null/undefined event) | ✅(10200004) | ✅(returns true/false) | ✅(联动) | 🟡 | ✅ |
| registerGlobalCallObject/callGlobalCallObjectMethod/GlobalScope | ✅(×多) | ✅(null/undefined) | ✅(10200004/06/19/20/21) | ✅(callObject) | ✅(register→call→unregister) | 🟡 | ✅ |
| Worker 优先级/Message/Transferable | ✅(4优先级+Message+Transferable) | ✅(矩阵×141) | ❌ | ✅(优先级生效) | ✅(优先级+postMessage) | ✅(×141) | ✅ |
| Worker shared config | ✅(3) | ✅(missing key) | ❌ | ✅(set/get/version) | ✅(set→bump→get) | ❌ | ✅ |
| 全错误码矩阵 | ✅(6码) | ✅(各触发) | ✅(assertEqual) | ✅(assertEqual) | ✅(各 API) | 🟡 | 🟡 |
| 参数覆盖 null/undefined/empty | ✅(全 API) | ✅(empty/non-empty) | ✅(401/10200004) | ✅(dispatch/注册) | ✅(对位) | 🟡 | 🟡 |
| 事件类继承 | ✅(8类×159) | 🟡 | ❌ | ✅(instanceof/回调/属性) | ✅(多事件联动) | 🟡 | ✅ |
| 容器序列化/GC/优先级/integration | ✅(7+10+141+5) | ✅(GC/矩阵) | ❌ | ✅(一致/状态/生效) | ✅(worker+taskpool) | ✅(×141) | ✅ |

## 7.2 本套件缺口简要（自包含）

1. **shared config 覆盖窄**：仅 3 例，无异常/重复取证。
2. **terminate/onAllErrors/parentPortClose 重复幂等弱**：无重复调用稳定取证。
3. **事件类继承异常路径未覆盖**：159 例继承无错误码取证。
4. **多 worker 写写竞态未覆盖**：shared config/GC 多为不抛错即通过，无逐元素正确性断言。
5. **WorkerTest/worker.Worker 两文件 desc 模式化**：310 例 desc 多为接口名，定位弱。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P1 | 1 | 多 worker 写写竞态逐元素正确性断言 | shared config/GC 掩盖真实数据损坏。 |
| P2 | 3 | shared config 补强 / 事件类继承异常路径 / 310 例 desc 细化 | 补强弱项。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | constructor/postMessage/事件/callObject/优先级/错误码/参数/继承/容器 全矩阵 | 全 22 文件 |
| ②边界值测试 | null/empty/undefined、empty/non-empty transfer、优先级矩阵、GC 压力 | Coverage、AtFront、PriTest、TaskPoolGC |
| ③异常与非法输入 | 10200004/06/07/19/20/21 assertEqual、non-serializable、10200004 when not running | ErrorCode、Coverage |
| ④返回值与类型验证 | 回环、dispatchEvent returns、callObject、优先级生效、instanceof、回调触发 | 全套件 |
| ⑤组合场景 | postMessage→onmessage、register→call→unregister、error 链汇聚、worker+taskpool | Worker1、callObject、OnAllErrors、TaskPoolGC |
| ⑥重复调用幂等性 | postMessage 多次、removeAllListener ×17、优先级 ×141 | Worker1、PriTest |
| ⑦并发跨线程 | 主线程↔worker、shared config、worker+taskpool、SharedSendable | 全套件跨线程用例 |
