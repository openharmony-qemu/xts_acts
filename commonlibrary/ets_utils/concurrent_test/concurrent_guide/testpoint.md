# concurrent_guide 测试点报告（按接口维度·摘要版）

> **本套件测什么**：聚焦「并发能力文档指南示例的端到端验证」（场景套件）——按 8 个主题分组覆盖 arktsUtils（ASON/AsyncLock/Collections/ConditionVariable/SendableLruCache）、concurrencyOverview（async/Promise/await/TaskPool/Worker/Sendable 概述与 FAQ）、nativeNapi（批数据库/并发加载模块/全局配置/跨线程共享/Sendable 定义）、objectTransfer（ArrayBuffer/Buffer/容器/普通对象/SerializableView/SharedArrayBuffer/Transferable 7 类传输）、sendable（ArktsSendable/MakeObserved/Constraints/Freeze/Guide/Module/TransGuide 7 类）、taskType（CPU/IO/LongTask/Worker/TaskGroup 任务类型 85 例）、taskpool（AsyncRunner/通信/介绍/对比Worker/数据流）、worker（通信/介绍/调用/Sendable/Taskpool）。
> **数据来源**：`concurrent_guide/entry/src/ohosTest/ets/test/` 下 44 个 `*.test.ets`（按 8 个子目录分组），共解析 **665** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；`List.test.ets` 为 0 用例聚合器）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
concurrent_guide（并发能力指南示例·场景套件）
├── 1. 接口测试（Functional / Interface）  —— §1，按 8 主题分组
│   ├── 1.1 arktsUtils      （ASON/AsyncLock/Collections/ConditionVariable/SendableLruCache）
│   ├── 1.2 concurrencyOverview （async/Promise/await + Cancel/FAQ/Overview/通信/多线程）
│   ├── 1.3 nativeNapi      （批数据库/并发加载模块/全局配置/跨线程共享/Sendable 定义）
│   ├── 1.4 objectTransfer  （ArrayBuffer/Buffer/容器/普通对象/SerializableView/SharedArrayBuffer/Transferable）
│   ├── 1.5 sendable        （ArktsSendable/MakeObserved/Constraints/Freeze/Guide/Module/TransGuide）
│   ├── 1.6 taskType        （CPU/IO/LongTask/Worker/TaskGroup/Priority/并发/异常 85 例）
│   ├── 1.7 taskpool        （AsyncRunner/通信/介绍/对比Worker/数据流）
│   └── 1.8 worker          （通信/介绍/调用/Sendable/Taskpool）
├── 2. 稳定性              （大容量传输、并发压力、生命周期）
├── 3. 性能                （大容量/cold start/并发吞吐多例）
├── 4. 并发安全            （AsyncLock/CV/SharedArrayBuffer Atomics/Sendable 共享）
├── 5. 兼容性与继承        （多级 Worker、Sendable 类继承、跨 .ets/.ts）
└── 6. 资料与文档符合性     （指南示例逐条 Verify 符合性）
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。空分类省略。

---

## 0.1 文件清单

| # | 文件（子目录/文件） | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | arktsUtils/ASONTest | 9 | ASON.parse/stringify（Map/Set/Array/bigIntMode/invalid） |
| 2 | arktsUtils/AsyncLockTest | 13 | AsyncLock constructor/lockAsync/跨线程/10·100并发/异常释放 |
| 3 | arktsUtils/CollectionsTest | 18 | Array/Map/Set/TypedArray create+操作+跨线程+AsyncLock |
| 4 | arktsUtils/ConditionVariableSupplementTest | 3 | CV waitFor/notifyOne/notifyAll 异常补充 |
| 5 | arktsUtils/ConditionVariableTest | 12 | CV constructor/request/wait/waitFor/notify/跨线程 |
| 6 | arktsUtils/SendableLruCacheTest | 8 | LruCache constructor/put/get/keys/remove/clear/LRU驱逐 |
| 7 | concurrencyOverview/AsyncConcurrencyTest | 13 | Promise 状态/then/catch/finally + async/await/异常 |
| 8 | concurrencyOverview/CancelTaskTest | 5 | Task taskId/cancel by taskId/Sendable存taskId/executeDelayed/canceled异常 |
| 9 | concurrencyOverview/CommonLibraryFaqTest | 3 | setTimeout/setInterval/clear/Timer ID |
| 10 | concurrencyOverview/ConcurrencyFaqTest | 13 | TaskPool异常/优先级/SequenceRunner/Sendable跨线程/100并发 |
| 11 | concurrencyOverview/ConcurrencyOverviewTest | 6 | async/TaskPool/Actor模型/Task execute/错误/序列化失败 |
| 12 | concurrencyOverview/InterthreadCommunicationTest | 7 | 结构化克隆/ArrayBuffer/SharedArrayBuffer/Sendable/基础类型/数组 |
| 13 | concurrencyOverview/MultithreadDevelopTest | 3 | 耗时计算/CPU分片/并行对比串行 |
| 14 | concurrencyOverview/WorkerCommunicationOverviewTest | 6 | Worker 创建/echo/ping-pong/计算/长时/onexit |
| 15 | nativeNapi/BatchDatabaseOpsTest | 26 | RdbStore/Config/executeSql/batchInsert/query/ResultSet/Sendable/TaskPool/性能/异常 |
| 16 | nativeNapi/ConcurrentLoadingModulesTest | 20 | Calculator Sendable模块/add-sub-mul-div/Promise.all/SharedCounter/TimerSdk/并发限制 |
| 17 | nativeNapi/GlobalConfigurationTest | 21 | GlobalConfig Sendable/AsyncLock EXCLUSIVE/SHARED/读写并发/异常释放/压力 |
| 18 | nativeNapi/InterthreadSharedTest | 15 | Sendable序列化/跨线程修改/大容量/重复/非Sendable报错/并发 |
| 19 | nativeNapi/SendableDefineTest | 18 | Sendable类constructor/getter/setter/方法/跨线程/极值/并发读写 |
| 20 | objectTransfer/ArrayBufferTest | 18 | ArrayBuffer copy/transfer/slice/TaskGroup/1MB·10MB/8·16 slice/性能 |
| 21 | objectTransfer/BufferTest | 20 | Uint8Array/Int32Array/Float32Array transfer/max255/zero/大容量/性能 |
| 22 | objectTransfer/ContainerObjectTest | 15 | 排序容器/Set/forEach/字符串/去重/clear/1000·10000/Promise.all |
| 23 | objectTransfer/NormalObjectTest | 25 | 基础类型/Date/RegExp/Array/Map/Set/ArrayBuffer/TypedArray/Symbol报错/Sendable/嵌套/大属性 |
| 24 | objectTransfer/SerializableViewTest | 18 | Sendable/普通对象/ArrayBuffer/SharedArrayBuffer/15MB·10MB/并发/性能 |
| 25 | objectTransfer/SharedArrayBufferTest | 18 | SAB/Atomics store·load·add·sub·compareExchange·exchange·wait·notify/并发/越界 |
| 26 | objectTransfer/TransferableObjectTest | 13 | ArrayBuffer transfer/copy/setTransferList/ApplicationContext共享/再transfer |
| 27 | sendable/ArktsSendableTest | 18 | isSendable/@Sendable装饰/ISendable/const enum/全类型/collections/AsyncLock/CV/LruCache/Union/SharedHeap |
| 28 | sendable/MakeObservedSendableTest | 12 | Sendable观察/属性绑定/TaskPool返回/Concurrent返回/多并发/Watched/Click/AsyncLock |
| 29 | sendable/SendableConstraintsTest | 18 | Sendable继承/isSendable/全类型成员/泛型/装饰器/new/类型转换/跨线程/默认初始化 |
| 30 | sendable/SendableFreezeTest | 12 | freeze/只读/transfer/修改抛异常/多线程读/嵌套/幂等/isSendable/性能 |
| 31 | sendable/SendableGuideTest | 10 | 大数据100KB/方法跨线程/Task携带/ASON/嵌套/AsyncLock并发/引用一致性/性能 |
| 32 | sendable/SendableModuleTest | 10 | use shared模块/单例/多线程/数据共享/AsyncLock计数/一致性/worker isSendable/懒加载 |
| 33 | sendable/SendableTransGuideTest | 15 | ASON round-trip/TaskPool传递/isSendable/容器/嵌套/空对象/invalid JSON/并发 |
| 34 | taskType/TaskTypeTest | 86 | CPU/IO/混合任务/Task/TaskGroup/LongTask/Worker/Priority/并发/异常/分片/Actor |
| 35 | taskpool/TaskpoolAsyncRunnerTest | 16 | AsyncRunner runningCapacity/waitingCapacity/命名/并发控制/异常/优先级/串行 |
| 36 | taskpool/TaskpoolCommunicationTest | 12 | sendData 全类型/null/undefined/collections.Array/批量/多任务路由 |
| 37 | taskpool/TaskpoolIntroductionTest | 22 | Task/@Concurrent/参数序列化/Priority/cancel/TaskGroup/async/sendData/大数组/并发/线程复用 |
| 38 | taskpool/TaskpoolVsWorkerTest | 15 | TaskPool cancel/线程复用/TaskGroup/Priority/sendData/自动生命周期/Sendable/AsyncRunner/依赖/延时/周期 |
| 39 | taskpool/TaskpoolWaterflowTest | 12 | 数据库查询模拟/sendData分页/懒加载/scroll加载/空/5000/异常/分页/并发/offset |
| 40 | worker/WorkerCommunicationTest | 10 | string/object/empty/大容量/多类型消息/计算/长时/快速/双向 |
| 41 | worker/WorkerIntroductionTest | 21 | 创建/Stage模型路径/invalid path/terminate/close/onexit/exit code/postMessage后terminate/多Worker/父子Worker |
| 42 | worker/WorkerInvokeTest | 10 | registerGlobalCallObject/callGlobalCallObjectMethod/同步/多对象/不存在方法/不存在对象/参数/unregister/terminated后 |
| 43 | worker/WorkerSendableTest | 12 | @Sendable/postMessageWithSharedSendable/属性/collections.Array/双向/多Worker并发 |
| 44 | worker/WorkerTaskpoolTest | 8 | Worker创建TaskPool/await/传播/多并发/大计算/并发不阻塞/多Worker/失败处理 |
| | **合计** | **665** | 8 主题并发指南 |

---

# 1. 接口测试（Functional / Interface）

> 本套件为场景套件，§1.x 按 8 主题分组，每主题下列具体场景子叶。

## 1.1 arktsUtils（ASON / AsyncLock / Collections / ConditionVariable / SendableLruCache）

```
arktsUtils
├── 入参范围覆盖
│   ├── ASON.parse/stringify(Map/Set/Array/bigIntMode)（ASONTest 0100~0800）
│   ├── AsyncLock lockAsync/跨线程/10·100并发（AsyncLockTest 0100~1300）
│   ├── Collections Array create/from/push/pop/遍历/Map/Set/TypedArray（CollectionsTest 0100~1800）
│   ├── CV wait/waitFor/notifyOne/notifyAll/request（ConditionVariableTest 0100~1200 + Supplement 0100~0300）
│   └── SendableLruCache put/get/keys/remove/clear/LRU（SendableLruCacheTest 0100~0800）
├── 边界值测试
│   ├── ASON invalid JSON 抛错（ASONTest）
│   ├── CV waitFor(0) 立即完成、notify 无等待者不抛
│   ├── LruCache 超容量驱逐/覆盖
│   └── AsyncLock 空 callback/异常释放
├── 异常与非法输入
│   ├── ASON.parse invalid JSON 抛错
│   ├── AsyncLock 回调抛异常后释放锁
│   └── Collections Array 遍历中修改 fail-fast 抛异常
├── 返回值与类型验证
│   ├── ASON 转 Sendable Map
│   ├── AsyncLock 返回 callback 结果
│   ├── LruCache get/contains
│   └── CV request 同名同实例
├── 组合场景
│   ├── AsyncLock + Collections 线程安全
│   ├── CV 跨 task wait/notify + shared counter
│   └── LruCache get 更新访问序
├── 重复调用/幂等性
│   ├── AsyncLock 多次 acquire-release
│   ├── LruCache put 覆盖
│   └── CV request 同名同实例
└── 并发跨线程
    ├── AsyncLock 10·100 并发互斥
    ├── CV 跨 TaskPool
    └── Collections Array 跨 TaskPool 引用
```

- **用例位置**：`arktsUtils/ASONTest` `0100`~`0900`、`AsyncLockTest` `0100`~`1300`、`CollectionsTest` `0100`~`1800`、`ConditionVariableSupplementTest` `0100`~`0300`、`ConditionVariableTest` `0100`~`1200`、`SendableLruCacheTest` `0100`~`0800`。共 63 例。
- **测了哪些**：ASON 全转换 + AsyncLock 互斥/异常释放/100 并发 + Collections 全容器操作 + CV wait/notify 全场景 + LruCache LRU 驱逐。

---

## 1.2 concurrencyOverview（async/Promise + Cancel/FAQ/Overview/通信/多线程）

```
concurrencyOverview
├── 入参范围覆盖
│   ├── Promise 构造/pending/fulfilled/rejected/then/catch/finally（AsyncConcurrency 0100~1300）
│   ├── async/await
│   ├── Task taskId/cancel by taskId/executeDelayed/canceled异常（CancelTask 0100~0500）
│   ├── Timer set/setInterval/clear/Timer ID（CommonLibraryFaq 0100~0300）
│   ├── TaskPool异常/优先级/SequenceRunner/Sendable/100并发（ConcurrencyFaq 0100~1300）
│   └── 跨线程通信 结构化克隆/ArrayBuffer/SAB/Sendable/基础类型/数组（InterthreadCommunication 0100~0700）
├── 边界值测试
│   ├── Promise pending
│   ├── Timer ID 初始值
│   ├── 序列化失败
│   └── 100 并发
├── 异常与非法输入
│   ├── TaskPool try/catch
│   ├── 执行 canceled task 抛异常
│   ├── 序列化失败
│   └── unhandled rejection
├── 返回值与类型验证
│   ├── Promise 状态、async 返回 Promise、await 暂停
│   ├── cancel 结果
│   └── Timer 执行
├── 组合场景
│   ├── async + TaskPool、Actor 模型
│   ├── SequenceRunner 严格顺序
│   └── Worker ping-pong/计算/长时
├── 重复调用/幂等性
│   ├── 多 await 顺序
│   └── Worker 多消息交换
└── 并发跨线程
    ├── TaskPool 多线程
    ├── Worker 通信
    └── Sendable 跨线程
```

- **用例位置**：`AsyncConcurrencyTest` `0100`~`1300`、`CancelTaskTest` `0100`~`0500`、`CommonLibraryFaqTest` `0100`~`0300`、`ConcurrencyFaqTest` `0100`~`1300`、`ConcurrencyOverviewTest` `0100`~`0600`、`InterthreadCommunicationTest` `0100`~`0700`、`MultithreadDevelopTest` `0100`~`0300`、`WorkerCommunicationOverviewTest` `0100`~`0600`。共 56 例。
- **测了哪些**：Promise/async/await 全状态 + TaskPool 概述 + 跨线程通信 7 机制 + Worker 通信概述 + FAQ。

---

## 1.3 nativeNapi（批数据库 / 并发加载模块 / 全局配置 / 跨线程共享 / Sendable 定义）

```
nativeNapi
├── 入参范围覆盖
│   ├── RdbStore/Config/executeSql/batchInsert/query/ResultSet（BatchDatabaseOps 0100~2500）
│   ├── Calculator Sendable 模块 add/sub/mul/div/TimerSdk/SharedCounter（ConcurrentLoadingModules 0100~2000）
│   ├── GlobalConfig/AsyncLock EXCLUSIVE·SHARED（GlobalConfiguration 0100~2100）
│   ├── Sendable 序列化/跨线程修改（InterthreadShared 0100~1500）
│   └── Sendable 类 constructor/getter/setter/方法（SendableDefine 0100~1800）
├── 边界值测试
│   ├── 100 行/长字符串/空表/10000 history
│   ├── 空 username/logout 无 login/重复 login/长 username
│   ├── 大容量 Sendable 序列化
│   └── 极值/负数/浮点/MAX·MIN_VALUE
├── 异常与非法输入
│   ├── SQL 语法错误/不存在表抛错
│   ├── 非 Sendable 对象报错
│   ├── concurrent 函数抛异常 Promise reject
│   └── lockAsync 回调抛异常释放锁
├── 返回值与类型验证
│   ├── Sendable 数据回主线程
│   ├── Calculator 方法结果
│   ├── GlobalConfig 状态
│   └── Sendable 跨线程一致性
├── 组合场景
│   ├── TaskPool 子线程批插入/查询
│   ├── Promise.all 并行
│   ├── 多线程读写 EXCLUSIVE/SHARED
│   └── 50 并发任务限制
├── 重复调用/幂等性
│   ├── 重复序列化
│   ├── 频繁创建销毁数据库
│   └── 重复 login 替换
└── 并发跨线程
    ├── TaskPool 子线程数据库
    ├── SharedCounter 跨线程
    ├── GlobalConfig 跨线程读写
    └── Sendable 引用修改
```

- **用例位置**：`BatchDatabaseOpsTest` `0100`~`2500`、`ConcurrentLoadingModulesTest` `0100`~`2000`、`GlobalConfigurationTest` `0100`~`2100`、`InterthreadSharedTest` `0100`~`1500`、`SendableDefineTest` `0100`~`1800`。共 100 例。
- **测了哪些**：批数据库 + Sendable 模块加载 + GlobalConfig 读写锁 + 跨线程共享 + Sendable 类定义全场景。

---

## 1.4 objectTransfer（ArrayBuffer / Buffer / 容器 / 普通对象 / SerializableView / SharedArrayBuffer / Transferable）

```
objectTransfer
├── 入参范围覆盖
│   ├── ArrayBuffer copy/transfer/slice（ArrayBufferTest 0100~1800）
│   ├── Buffer Uint8/Int32/Float32 transfer（BufferTest 0100~2000）
│   ├── 容器 排序/Set/forEach/String/去重（ContainerObject 0100~1500）
│   ├── 普通对象 Date/RegExp/Array/Map/Set/TypedArray/Symbol（NormalObject 0100~2500）
│   ├── SerializableView（SerializableView 0100~1800）
│   ├── SharedArrayBuffer Atomics store/load/add/sub/compareExchange/exchange/wait/notify（SharedArrayBuffer 0100~1800）
│   └── Transferable transfer/copy/setTransferList/ApplicationContext（TransferableObject 0100~1200）
├── 边界值测试
│   ├── 1MB/10MB/15MB/16MB
│   ├── 8·16 slice、1000·10000 元素、单元素、空数组
│   ├── max255/zero
│   └── 越界 Atomics
├── 异常与非法输入
│   ├── Symbol 不可序列化报错
│   ├── SQL 不存在表
│   ├── Atomics 越界抛错
│   └── >16MB 序列化限制
├── 返回值与类型验证
│   ├── transfer 后原 byteLength=0
│   ├── copy 保留原
│   ├── SAB 共享可见、Atomics 返回旧值
│   └── 容器排序/去重
├── 组合场景
│   ├── TaskGroup 批处理 slice
│   ├── Promise.all 多 buffer
│   ├── 再 transfer
│   └── copy vs transfer 性能
├── 重复调用/幂等性
│   ├── 重复 freeze
│   ├── 重复序列化
│   └── 多次 Atomics
└── 并发跨线程
    ├── 多 slice 并行
    ├── SAB 跨线程可见
    ├── 并发 Atomics 一致性
    └── 多线程并发序列化
```

- **用例位置**：`ArrayBufferTest` `0100`~`1800`、`BufferTest` `0100`~`2000`、`ContainerObjectTest` `0100`~`1500`、`NormalObjectTest` `0100`~`2500`、`SerializableViewTest` `0100`~`1800`、`SharedArrayBufferTest` `0100`~`1800`、`TransferableObjectTest` `0100`~`1200`。共 127 例。
- **测了哪些**：7 类对象传输 + ArrayBuffer transfer/copy + SAB Atomics 全操作 + 容器/普通对象序列化 + 大容量边界 + Symbol 报错。

---

## 1.5 sendable（ArktsSendable / MakeObserved / Constraints / Freeze / Guide / Module / TransGuide）

```
sendable
├── 入参范围覆盖
│   ├── isSendable/@Sendable 装饰/ISendable/const enum/全类型/collections/AsyncLock·CV·LruCache 成员（ArktsSendable 0100~1800）
│   ├── 观察模式 UIState/Watched/Click（MakeObserved 0100~1200）
│   ├── 继承约束/全类型成员/泛型/装饰器（Constraints 0100~1800）
│   ├── freeze/只读/transfer（Freeze 0100~1200）
│   ├── use shared 模块（Module 0100~1000）
│   └── ASON round-trip（TransGuide 0100~1500）
├── 边界值测试
│   ├── Union 类型、SharedHeap、private 字段
│   ├── 100KB 传输
│   ├── 嵌套 Sendable
│   └── 空对象默认值
├── 异常与非法输入
│   ├── freeze 后修改抛异常
│   ├── invalid JSON 抛错
│   └── isSendable 对非 Sendable 返回 false
├── 返回值与类型验证
│   ├── isSendable
│   ├── 引用一致性
│   ├── 属性跨线程可读
│   └── ASON round-trip 完整性
├── 组合场景
│   ├── AsyncLock 保护并发
│   ├── 多线程读 frozen 无锁
│   ├── TaskPool 返回 Sendable
│   └── use shared 模块单例
├── 重复调用/幂等性
│   ├── freeze 幂等
│   ├── 重复 ASON round-trip
│   └── shared 模块懒加载
└── 并发跨线程
    ├── Sendable 引用跨线程
    ├── 多 TaskPool 并发访问
    ├── worker isSendable
    └── shared 模块多线程
```

- **用例位置**：`ArktsSendableTest` `0100`~`1800`、`MakeObservedSendableTest` `0100`~`1200`、`SendableConstraintsTest` `0100`~`1800`、`SendableFreezeTest` `0100`~`1200`、`SendableGuideTest` `0100`~`1000`、`SendableModuleTest` `0100`~`1000`、`SendableTransGuideTest` `0100`~`1500`。共 95 例。
- **测了哪些**：Sendable 装饰/约束/继承/freeze/观察/use shared/ASON round-trip 全场景。

---

## 1.6 taskType（CPU/IO/LongTask/Worker/TaskGroup/Priority/并发/异常 86 例）

```
taskType
├── 入参范围覆盖
│   ├── CPU 密集/IO 密集/混合任务
│   ├── @Concurrent/Task/execute/Task 参数（TaskType 0100~8500）
│   ├── TaskGroup/addTask/批执行/结果顺序
│   ├── LongTask Priority/terminateTask/sendData
│   ├── Worker ThreadWorker/postMessage/onmessage/onexit/onerror
│   └── 静态方法/消息分发/任务链/Actor 模型
├── 边界值测试
│   ├── 10000 元素大数组
│   ├── 50 tasks
│   ├── 105 元素 20-chunk
│   ├── 20 并发 IO
│   └── 主线程响应时间
├── 异常与非法输入
│   ├── 任务内部异常捕获传播
│   ├── 空数据 CPU 异常
│   ├── IO invalid input 异常
│   └── Worker 内部错误 onerror
├── 返回值与类型验证
│   ├── Task 返回 Promise/结果
│   ├── TaskGroup 结果数组/顺序
│   ├── LongTask 计数
│   └── Worker 计算结果
├── 组合场景
│   ├── TaskGroup 数据分片 1-to-1000
│   ├── 任务链依赖
│   ├── Promise.all 并行
│   ├── Actor 内存隔离
│   └── 高低优先级共存
├── 重复调用/幂等性
│   ├── 线程复用 10 顺序任务
│   ├── 多 LongTask 独立
│   └── Worker 多消息交换
└── 并发跨线程
    ├── TaskPool/Worker 跨线程
    ├── 多核利用
    └── 并发 IO 控制
```

- **用例位置**：`taskType/TaskTypeTest` `0100`~`8500`（86 例）。
- **测了哪些**：CPU/IO/LongTask/Worker/TaskGroup 任务类型全场景 + Priority + 数据分片 + 任务链 + Actor + 异常。

---

## 1.7 taskpool（AsyncRunner / 通信 / 介绍 / 对比Worker / 数据流）

```
taskpool
├── 入参范围覆盖
│   ├── AsyncRunner runningCapacity/waitingCapacity/命名/并发控制/优先级（AsyncRunner 0100~1600）
│   ├── sendData 全类型 null/undefined/collections.Array/批量/多任务路由（Communication 0100~1200）
│   ├── Task/@Concurrent/参数序列化/Priority/cancel/TaskGroup/async/大数组/线程复用（Introduction 0100~2200）
│   ├── TaskPool vs Worker cancel/复用/TaskGroup/Priority/sendData/Sendable/AsyncRunner/依赖/延时/周期（VsWorker 0100~1500）
│   └── 数据流 查询/sendData分页/懒加载/scroll/5000/分页/offset（Waterflow 0100~1200）
├── 边界值测试
│   ├── runningCapacity=0/1/超线程
│   ├── waitingCapacity=0/负
│   ├── 50 并发
│   ├── 10000 元素、5000 items
│   └── 空数据
├── 异常与非法输入
│   ├── AsyncRunner zero/negative capacity 抛参数错误
│   ├── execute 异常 Promise reject
│   ├── canceled task 抛异常
│   └── 数据库查询异常
├── 返回值与类型验证
│   ├── AsyncRunner 结果、sendData 接收
│   ├── Task 返回、TaskGroup 结果
│   └── 查询返回 DataItem
├── 组合场景
│   ├── AsyncRunner 串行/并发
│   ├── sendData 多任务路由
│   ├── TaskPool 自动生命周期
│   └── 数据流分页/offset
├── 重复调用/幂等性
│   ├── sendData 批量
│   ├── AsyncRunner 串行 8 任务
│   └── 多 sequential load-more
└── 并发跨线程
    ├── AsyncRunner 并发控制
    ├── TaskPool 跨线程
    └── sendData worker→host
```

- **用例位置**：`taskpool/TaskpoolAsyncRunnerTest` `0100`~`1600`、`TaskpoolCommunicationTest` `0100`~`1200`、`TaskpoolIntroductionTest` `0100`~`2200`、`TaskpoolVsWorkerTest` `0100`~`1500`、`TaskpoolWaterflowTest` `0100`~`1200`。共 77 例。
- **测了哪些**：AsyncRunner 容量控制 + sendData 全类型 + TaskPool 介绍/对比 Worker + 数据流分页全场景。

---

## 1.8 worker（通信 / 介绍 / 调用 / Sendable / Taskpool）

```
worker
├── 入参范围覆盖
│   ├── Worker 通信 string/object/empty/大容量/多类型（WorkerCommunication 0100~1000）
│   ├── 创建 Stage 模型路径/invalid path（WorkerIntroduction 0100~2100）
│   ├── terminate/close/onexit/exit code
│   ├── registerGlobalCallObject/callGlobalCallObjectMethod（WorkerInvoke 0100~1000）
│   ├── @Sendable/postMessageWithSharedSendable（WorkerSendable 0100~1200）
│   └── Worker 创建 TaskPool（WorkerTaskpool 0100~0800）
├── 边界值测试
│   ├── 大容量消息
│   ├── 多 Worker、父子 Worker
│   └── postMessage 后 terminate
├── 异常与非法输入
│   ├── invalid path 抛错
│   ├── abnormal exit 非 0
│   ├── postMessage terminated 后抛错
│   ├── 不存在方法/对象返回错误
│   ├── terminated 后调用抛错
│   └── Worker 内部错误 onerror
├── 返回值与类型验证
│   ├── echo 响应、计算结果
│   ├── callObject 返回、exit code
│   └── Sendable 属性可读
├── 组合场景
│   ├── ping-pong、长时周期 tick
│   ├── 父子 Worker 多级消息
│   ├── 推荐 terminate 顺序、双向通信
│   └── 多 Worker 并发
├── 重复调用/幂等性
│   ├── 多消息交换
│   ├── 批量创建销毁
│   └── 多请求-响应
└── 并发跨线程
    ├── host↔Worker
    ├── 父子 Worker
    ├── 多 Worker 并发
    └── Worker+TaskPool 并发
```

- **用例位置**：`worker/WorkerCommunicationTest` `0100`~`1000`、`WorkerIntroductionTest` `0100`~`2100`、`WorkerInvokeTest` `0100`~`1000`、`WorkerSendableTest` `0100`~`1200`、`WorkerTaskpoolTest` `0100`~`0800`。共 61 例。
- **测了哪些**：Worker 通信 + 创建/生命周期 + callObject 调用 + Sendable 共享 + Worker+TaskPool 协作。

---

# 2. 稳定性

- **用例位置**：`ArrayBufferTest` 1MB/10MB、`ContainerObjectTest` 1000/10000、`InterthreadSharedTest` 大容量/频繁创建、`GlobalConfigurationTest` 高并发压力、`ConcurrentLoadingModulesTest` 频繁任务、`BatchDatabaseOpsTest` 频繁创建销毁。
- **测了哪些**：大容量传输 + 1000/10000 元素 + 高并发读写压力 + 频繁创建销毁稳定性；**无独立 GC 压力专项**。

# 3. 性能

- **用例位置**：`ArrayBufferTest` 0600/0700/0900（1MB/10MB/copy vs transfer）、`BufferTest` 0900/1400/1700、`SerializableViewTest` 1400/1800（1MB/10MB）、`ArktsSendableTest` 1500（100KB）、`SendableGuideTest` 0800、`ConcurrentLoadingModulesTest` 1500/1600（cold start/并行效率）、`BatchDatabaseOpsTest` 1400/2300（Sendable 性能优势/计时）、`SendableFreezeTest` 1000（freeze 开销）。
- **测了哪些**：大容量传输/cold start/并行效率/Sendable 性能优势/freeze 开销多例；**无统一时延基线基准**。

# 4. 并发安全

- **用例位置**：`AsyncLockTest` 10/100 并发、`GlobalConfigurationTest` EXCLUSIVE/SHARED 读写并发、`SharedArrayBufferTest` Atomics 并发一致性、`InterthreadSharedTest` 多线程序列化、`ArktsSendableTest` AsyncLock 保护并发、`SendableModuleTest` AsyncLock 计数。
- **测了哪些**：AsyncLock 互斥 + CV 同步 + Atomics 原子 + Sendable 共享；**Sendable 并发修改多为 AsyncLock 保护，少量无锁并发读**。

# 5. 兼容性与继承

- **用例位置**：`WorkerIntroductionTest` 1800~2000（父子 Worker 多级）、`SendableConstraintsTest` 0100（Sendable 继承）、`NormalObjectTest` 1500/1600（@Sendable 方法跨线程）、`WorkerSendableTest` 1000（多 Worker）。
- **测了哪些**：父子 Worker 多级 + Sendable 类继承 + @Sendable 方法跨线程；**未见 Worker/Sendable 子类化覆写专项**。

# 6. 资料与文档符合性

- **用例位置**：全套件 665 例 desc 均以 "Verify ..." 开头，逐条对应指南示例。
- **测了哪些**：8 主题指南示例逐条 Verify 符合性；**指南覆盖度高，但多为行为符合性，错误码 assertEqual 取证弱**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 主题×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足用例 / 🟡 部分覆盖 / ❌ 未覆盖

| 主题/维度 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| arktsUtils | ✅(63) | ✅(invalid/0/驱逐) | ✅(ASON/AsyncLock/fail-fast) | ✅(转换/返回/LRU) | ✅(AsyncLock+Collections) | ✅(acquire-release) | ✅(10·100并发) |
| concurrencyOverview | ✅(56) | ✅(pending/100并发) | ✅(cancel/序列化/rejection) | ✅(Promise状态/async) | ✅(Actor/SequenceRunner) | ✅(多await) | ✅(TaskPool/Worker) |
| nativeNapi | ✅(100) | ✅(100行/10000/极值) | ✅(SQL/非Sendable/reject) | ✅(Sendable回传/状态) | ✅(TaskPool/Promise.all/50并发) | ✅(频繁创建销毁) | ✅(子线程/SharedCounter) |
| objectTransfer | ✅(127) | ✅(1MB~16MB/10000) | ✅(Symbol/越界/>16MB) | ✅(transfer/SAB/Atomics) | ✅(TaskGroup slice/Promise.all) | ✅(重复序列化) | ✅(多slice/SAB/并发Atomics) |
| sendable | ✅(95) | ✅(100KB/Union/private) | ✅(freeze修改/invalid JSON) | ✅(isSendable/引用/ASON) | ✅(AsyncLock/use shared) | ✅(freeze幂等) | ✅(跨线程/多TaskPool/worker) |
| taskType | ✅(86) | ✅(10000/50/20并发) | ✅(异常/onerror) | ✅(Promise/结果数组) | ✅(分片/任务链/Actor) | ✅(线程复用) | ✅(多核/并发IO) |
| taskpool | ✅(77) | ✅(capacity 0/负/50并发) | ✅(参数错误/reject/cancel) | ✅(AsyncRunner/sendData/查询) | ✅(串行/并发/分页) | ✅(批量/串行8) | ✅(并发控制/跨线程) |
| worker | ✅(61) | ✅(大容量/多Worker/父子) | ✅(invalid path/非0/terminated) | ✅(echo/计算/callObject/exit) | ✅(ping-pong/父子/双向) | ✅(多消息/批量) | ✅(host↔Worker/多Worker) |

## 7.2 本套件缺口简要（自包含）

1. **错误码 assertEqual 弱**：665 例多为行为 Verify，未见 401/10200006 等错误码 assertEqual 取证。
2. **GC 压力专项缺失**：稳定性多为大容量/频繁创建，无独立 GC 压力专项。
3. **Sendable 无锁并发写写竞态未覆盖**：并发修改多为 AsyncLock 保护，无无锁多写者逐元素正确性断言。
4. **Worker/Sendable 子类化覆写未覆盖**：父子 Worker 与 Sendable 继承覆盖，但无子类化覆写新 API 专项。

## 7.3 优先级建议（本套件）

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| P2 | 2 | 错误码 assertEqual 取证 / GC 压力专项 | 指南行为覆盖度高，补强契约与压力。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 8 主题各 API/对象/任务类型全矩阵 | 全 44 文件 |
| ②边界值测试 | 1MB~16MB、1000/10000、50/100 并发、capacity 0/负、极值、empty | ArrayBuffer、Container、AsyncRunner、SendableDefine |
| ③异常与非法输入 | invalid JSON/SQL、Symbol 报错、越界 Atomics、freeze 修改、terminated 后调用、非 Sendable 报错 | ASON、BatchDatabase、SharedArrayBuffer、SendableFreeze、Worker |
| ④返回值与类型验证 | ASON 转换、Promise 状态、transfer/SAB/Atomics、isSendable、查询结果、exit code | 全套件 |
| ⑤组合场景 | AsyncLock+Collections、TaskGroup slice、任务链、Actor、父子 Worker、分页/offset | arktsUtils、objectTransfer、taskType、worker、taskpool |
| ⑥重复调用幂等性 | acquire-release、freeze 幂等、ASON round-trip、线程复用、批量 | AsyncLock、SendableFreeze、TransGuide、TaskType |
| ⑦并发跨线程 | TaskPool/Worker 跨线程、SAB 共享、AsyncLock 10·100 并发、多 Worker | 全套件跨线程用例 |
