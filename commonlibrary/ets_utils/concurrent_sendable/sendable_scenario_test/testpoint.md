# sendable_scenario_test 测试点报告（按特性域·摘要版）

> **数据来源**：`concurrent_sendable/sendable_scenario_test/entry/src/ohosTest/ets/test/` 下递归解析得 **1171** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐；已排除 `List.test.ets` 聚合 re-export 垩片，0 用例）。
> **套件定位**：端到端业务场景（缓存/连接池/配置/事件/状态机/进度/GC/共享计数/共享模块/IR/服务/限流/锁/基础类型/结果收集）（主覆盖域 8）
> **特性域**：本套件覆盖 缓存 Cache、连接池 Connection、配置 Config/Global/Env、事件 Event、状态机 StateMachine、进度 Progress、GC/生命周期、共享计数 SharedCounter、共享模块 SharedModule、IR 优化、服务 Service、限流/队列、锁/CV、基础类型/约束/序列化、结果收集/超时/错误、Other/综合；本报告自包含，不引用外部文件。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（套件内顶层结构）

```
sendable_scenario_test
├── 1. 接口/特性域测试 —— §1，每域含用例位置
│   ├── 1.1 缓存 Cache
│   ├── 1.2 连接池 Connection
│   ├── 1.3 配置 Config/Global/Env
│   ├── 1.4 事件 Event
│   ├── 1.5 状态机 StateMachine
│   ├── 1.6 进度 Progress
│   ├── 1.7 GC/生命周期
│   ├── 1.8 共享计数 SharedCounter
│   ├── 1.9 共享模块 SharedModule
│   ├── 1.10 IR 优化
│   ├── 1.11 服务 Service
│   ├── 1.12 限流/队列
│   ├── 1.13 锁/CV
│   ├── 1.14 基础类型/约束/序列化
│   ├── 1.15 结果收集/超时/错误
│   ├── 1.16 Other/综合
├── 2. 稳定性（GC/生命周期/批量创建销毁）
├── 3. 性能（并发 stress / IR 优化）
├── 4. 并发安全（TaskPool/Worker/锁/CV）
├── 5. 兼容性与继承（extends/implements/composition）
└── 6. 资料与文档符合性（@Sendable/ISendable/错误码）
```

> 测试逻辑分类口径（7 类）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附》。

---

## 0.1 文件清单（108 个文件 / 1171 用例）

| # | 文件 | 用例数 | 特性域覆盖 |
|---|------|:---:|------|
| 1 | sendable/ApiResponseCacheTest.test.ets | 28 | 缓存 Cache(28) |
| 2 | sendable/AppSettingsTest.test.ets | 15 | Other/综合(15) |
| 3 | sendable/ApprovalStateMachineTest.test.ets | 13 | 状态机 StateMachine(13) |
| 4 | sendable/AsonSendableTest.test.ets | 3 | 基础类型/约束/序列化(3) |
| 5 | sendable/AsyncLockBasicTest.test.ets | 10 | 锁/CV(10) |
| 6 | sendable/BatchCreateDestroyTest.test.ets | 10 | GC/生命周期(10) |
| 7 | sendable/BatchProgressTest.test.ets | 12 | 进度 Progress(12) |
| 8 | sendable/BoundedQueueTest.test.ets | 12 | 限流/队列(12) |
| 9 | sendable/CacheIRTest.test.ets | 13 | 缓存 Cache(13) |
| 10 | sendable/ComputeResultCacheTest.test.ets | 9 | 缓存 Cache(9) |
| 11 | sendable/ConcurrencyBase.test.ets | 1 | 锁/CV(1) |
| 12 | sendable/ConcurrentGCTest.test.ets | 10 | GC/生命周期(10) |
| 13 | sendable/ConcurrentStateTest.test.ets | 11 | 状态机 StateMachine(11) |
| 14 | sendable/ConditionVariableTest.test.ets | 10 | 锁/CV(10) |
| 15 | sendable/ConfigIRTest.test.ets | 10 | 配置 Config/Global/Env(10) |
| 16 | sendable/ConfigStabilityTest.test.ets | 2 | 配置 Config/Global/Env(2) |
| 17 | sendable/ConfigVersionTest.test.ets | 17 | 配置 Config/Global/Env(17) |
| 18 | sendable/ConnectionAcquireTest.test.ets | 14 | 连接池 Connection(14) |
| 19 | sendable/ConnectionCapacityTest.test.ets | 12 | 连接池 Connection(12) |
| 20 | sendable/ConnectionPoolIRTest.test.ets | 10 | 连接池 Connection(10) |
| 21 | sendable/ConnectionPoolInitTest.test.ets | 10 | 连接池 Connection(10) |
| 22 | sendable/ConnectionPoolLockTest.test.ets | 12 | 连接池 Connection(12) |
| 23 | sendable/ConnectionStatsTest.test.ets | 12 | 连接池 Connection(12) |
| 24 | sendable/ConnectionTimeoutTest.test.ets | 11 | 连接池 Connection(11) |
| 25 | sendable/ConnectionWaitQueueTest.test.ets | 8 | 连接池 Connection(8) |
| 26 | sendable/ConnectionWaitRealTest.test.ets | 2 | 连接池 Connection(2) |
| 27 | sendable/DataProcessProgressTest.test.ets | 12 | 进度 Progress(12) |
| 28 | sendable/DataResultCollectTest.test.ets | 12 | 结果收集/超时/错误(12) |
| 29 | sendable/DbQueryCacheTest.test.ets | 13 | 缓存 Cache(13) |
| 30 | sendable/DependencyChainTest.test.ets | 10 | 状态机 StateMachine(10) |
| 31 | sendable/DeviceStateMachineTest.test.ets | 15 | 状态机 StateMachine(15) |
| 32 | sendable/DictModeTriggerTest.test.ets | 27 | 配置 Config/Global/Env(27) |
| 33 | sendable/DynamicThresholdTest.test.ets | 16 | 配置 Config/Global/Env(16) |
| 34 | sendable/EnvironmentConfigTest.test.ets | 15 | 配置 Config/Global/Env(15) |
| 35 | sendable/ErrorResultCollectTest.test.ets | 13 | 结果收集/超时/错误(13) |
| 36 | sendable/EventBusIRTest.test.ets | 12 | 事件 Event(12) |
| 37 | sendable/EventErrorTest.test.ets | 10 | 事件 Event(10) |
| 38 | sendable/EventHandlerConcurrentTest.test.ets | 8 | 事件 Event(8) |
| 39 | sendable/EventPublishTest.test.ets | 10 | 事件 Event(10) |
| 40 | sendable/EventQueueTest.test.ets | 12 | 事件 Event(12) |
| 41 | sendable/EventSubscribeTest.test.ets | 10 | 事件 Event(10) |
| 42 | sendable/FreezeSendableTest.test.ets | 3 | 基础类型/约束/序列化(3) |
| 43 | sendable/GlobalConfigTest.test.ets | 12 | 配置 Config/Global/Env(12) |
| 44 | sendable/HeapIsolationTest.test.ets | 10 | GC/生命周期(10) |
| 45 | sendable/IDGeneratorTest.test.ets | 10 | 基础类型/约束/序列化(10) |
| 46 | sendable/IROptimizationTest.test.ets | 26 | IR 优化(26) |
| 47 | sendable/IRReinforcementTest.test.ets | 29 | IR 优化(29) |
| 48 | sendable/ImageCacheTest.test.ets | 11 | 缓存 Cache(11) |
| 49 | sendable/ImageResultCollectTest.test.ets | 13 | 结果收集/超时/错误(13) |
| 50 | sendable/IsSendableTest.test.ets | 3 | 基础类型/约束/序列化(3) |
| 51 | sendable/LazyLoaderTest.test.ets | 9 | 缓存 Cache(9) |
| 52 | sendable/LockIRTest.test.ets | 8 | IR 优化(8) |
| 53 | sendable/LogCollectorQueueTest.test.ets | 10 | 限流/队列(10) |
| 54 | sendable/MakeObservedSendableTest.test.ets | 3 | 基础类型/约束/序列化(3) |
| 55 | sendable/MemoryLeakGCTest.test.ets | 10 | GC/生命周期(10) |
| 56 | sendable/MetricsAggregationTest.test.ets | 13 | 基础类型/约束/序列化(13) |
| 57 | sendable/MetricsCollectorTest.test.ets | 13 | 基础类型/约束/序列化(13) |
| 58 | sendable/MultiStageProgressTest.test.ets | 12 | 进度 Progress(12) |
| 59 | sendable/MultiTaskProgressTest.test.ets | 12 | 进度 Progress(12) |
| 60 | sendable/MultiThreadEventTest.test.ets | 10 | 事件 Event(10) |
| 61 | sendable/MultiThreadRefGCTest.test.ets | 13 | GC/生命周期(13) |
| 62 | sendable/OrderStateMachineTest.test.ets | 11 | 状态机 StateMachine(11) |
| 63 | sendable/ParallelComputeResultTest.test.ets | 12 | 进度 Progress(12) |
| 64 | sendable/PipelineQueueTest.test.ets | 5 | 进度 Progress(5) |
| 65 | sendable/PixMapTest.test.ets | 3 | 基础类型/约束/序列化(3) |
| 66 | sendable/PostGCStateTest.test.ets | 10 | GC/生命周期(10) |
| 67 | sendable/ProducerConsumerCoordTest.test.ets | 10 | 限流/队列(10) |
| 68 | sendable/ProgressIRTest.test.ets | 10 | 进度 Progress(10) |
| 69 | sendable/QueueIRTest.test.ets | 10 | IR 优化(10) |
| 70 | sendable/RateLimiterTest.test.ets | 13 | 限流/队列(13) |
| 71 | sendable/ReadWriteLockTest.test.ets | 9 | 锁/CV(9) |
| 72 | sendable/RealErrorPathTest.test.ets | 5 | 结果收集/超时/错误(5) |
| 73 | sendable/RefCountGCTest.test.ets | 10 | GC/生命周期(10) |
| 74 | sendable/RequestBufferQueueTest.test.ets | 10 | 限流/队列(10) |
| 75 | sendable/ResultCollectIRTest.test.ets | 11 | IR 优化(11) |
| 76 | sendable/SendableBasicTypeTest.test.ets | 18 | 基础类型/约束/序列化(18) |
| 77 | sendable/SendableCollectionsTest.test.ets | 19 | 基础类型/约束/序列化(19) |
| 78 | sendable/SendableConstraintTest.test.ets | 8 | 基础类型/约束/序列化(8) |
| 79 | sendable/SendableDecoratorTest.test.ets | 15 | 基础类型/约束/序列化(15) |
| 80 | sendable/SendableFunctionTest.test.ets | 5 | 基础类型/约束/序列化(5) |
| 81 | sendable/SendableLifecycleTest.test.ets | 10 | GC/生命周期(10) |
| 82 | sendable/SendableNestedTest.test.ets | 6 | 基础类型/约束/序列化(6) |
| 83 | sendable/SendableSharedModuleTest.test.ets | 6 | 共享模块 SharedModule(6) |
| 84 | sendable/SendableTypedArrayTest.test.ets | 8 | 基础类型/约束/序列化(8) |
| 85 | sendable/SerializationBoundaryTest.test.ets | 6 | 基础类型/约束/序列化(6) |
| 86 | sendable/ServiceHotUpdateTest.test.ets | 12 | 服务 Service(12) |
| 87 | sendable/ServiceLifecycleTest.test.ets | 12 | GC/生命周期(12) |
| 88 | sendable/ServiceMonitorTest.test.ets | 12 | 服务 Service(12) |
| 89 | sendable/ServiceRegistryTest.test.ets | 15 | 服务 Service(15) |
| 90 | sendable/ServiceSingletonTest.test.ets | 13 | 服务 Service(13) |
| 91 | sendable/SessionCacheTest.test.ets | 12 | 缓存 Cache(12) |
| 92 | sendable/SharedCounterDownloadTest.test.ets | 8 | 共享计数 SharedCounter(8) |
| 93 | sendable/SharedCounterIRTest.test.ets | 12 | 共享计数 SharedCounter(12) |
| 94 | sendable/SharedCounterInventoryTest.test.ets | 10 | 共享计数 SharedCounter(10) |
| 95 | sendable/SharedCounterRequestTest.test.ets | 11 | 共享计数 SharedCounter(11) |
| 96 | sendable/SharedCounterResourceRefTest.test.ets | 11 | 共享计数 SharedCounter(11) |
| 97 | sendable/SharedCounterTaskCompleteTest.test.ets | 10 | 共享计数 SharedCounter(10) |
| 98 | sendable/SharedHeapGCTest.test.ets | 12 | GC/生命周期(12) |
| 99 | sendable/SharedModuleGCTest.test.ets | 12 | GC/生命周期(12) |
| 100 | sendable/SharedModuleGCTest2.test.ets | 10 | GC/生命周期(10) |
| 101 | sendable/SharedModuleNestedTest.test.ets | 8 | 共享模块 SharedModule(8) |
| 102 | sendable/SharedModuleStabilityTest.test.ets | 7 | 共享模块 SharedModule(7) |
| 103 | sendable/SlidingWindowLimiterTest.test.ets | 12 | 限流/队列(12) |
| 104 | sendable/StateMachineIRTest.test.ets | 8 | 状态机 StateMachine(8) |
| 105 | sendable/StateMachineStabilityTest.test.ets | 5 | 状态机 StateMachine(5) |
| 106 | sendable/TimeoutResultCollectTest.test.ets | 13 | 结果收集/超时/错误(13) |
| 107 | sendable/UploadProgressTest.test.ets | 11 | 进度 Progress(11) |
| 108 | sendable/UseSharedModuleTest.test.ets | 3 | 共享模块 SharedModule(3) |
| | **合计** | **1171** | 108 文件 |

# 1. 接口/特性域测试

> 各特性域按文件分组标注用例位置；编号段取自解析结果。


## 1.1 缓存 Cache（95 用例）

```
缓存 Cache
├── 入参范围覆盖
│   ├── response cache：GET/POST、cache key 隔离(method)、hit/miss 统计、过期清除
│   ├── LRU IR/IC cache：固定属性 IR、IC cache 建立
│   ├── computation/db query cache：参数为 key/结果存储、db query cache
│   └── session/image cache + lazy loader：session 创建/查询、image cache、lazy loader
├── 边界值测试
│   ├── 空缓存、单条
│   └── 过期、未命中
├── 返回值与类型验证
│   ├── 缓存命中/未命中、统计计数
│   └── LRU IC cache 命中
├── 组合场景
│   ├── method 隔离 + 过期 + 统计
│   └── IR 固定属性 + IC cache 联动
├── 重复调用/幂等性
│   └── 同 key 多次命中一致
└── 并发跨线程
    └── TaskPool 并发缓存读写
```

- **用例位置（sendable_scenario_test）**：`sendable/ApiResponseCacheTest.test.ets`（28 例） + `sendable/CacheIRTest.test.ets`（13 例） + `sendable/ComputeResultCacheTest.test.ets`（9 例） + `sendable/DbQueryCacheTest.test.ets`（13 例） + `sendable/ImageCacheTest.test.ets`（11 例） + `sendable/LazyLoaderTest.test.ets`（9 例） + `sendable/SessionCacheTest.test.ets`（12 例）。

- **测了哪些**：GET/POST response cache + key 隔离 + hit/miss 统计 + 过期 + LRU IR/IC + db/session/image cache + lazy loader。


## 1.2 连接池 Connection（91 用例）

```
连接池 Connection
├── 入参范围覆盖
│   ├── acquire/release、capacity 上限、stats 统计
│   ├── pool IR/init/lock、timeout 超时、wait queue 等待
│   └── wait real 实时等待
├── 边界值测试
│   ├── capacity 上限、空池
│   └── 超时、wait real
├── 异常与非法输入
│   ├── acquire 超时
│   └── capacity 超限
├── 返回值与类型验证
│   ├── acquire 返回连接、stats 计数
│   └── timeout 行为
├── 组合场景
│   ├── acquire + release 循环
│   ├── pool lock 并发
│   └── wait queue 排队
├── 重复调用/幂等性
│   └── 多次 acquire/release 计数一致
└── 并发跨线程
    └── 连接池并发 acquire + AsyncLock
```

- **用例位置（sendable_scenario_test）**：`sendable/ConnectionAcquireTest.test.ets`（14 例） + `sendable/ConnectionCapacityTest.test.ets`（12 例） + `sendable/ConnectionPoolIRTest.test.ets`（10 例） + `sendable/ConnectionPoolInitTest.test.ets`（10 例） + `sendable/ConnectionPoolLockTest.test.ets`（12 例） + `sendable/ConnectionStatsTest.test.ets`（12 例） + `sendable/ConnectionTimeoutTest.test.ets`（11 例） + `sendable/ConnectionWaitQueueTest.test.ets`（8 例） + `sendable/ConnectionWaitRealTest.test.ets`（2 例）。

- **测了哪些**：acquire/release + capacity + pool IR/init/lock + stats + timeout + wait queue。


## 1.3 配置 Config/Global/Env（99 用例）

```
配置 Config/Global/Env
├── 入参范围覆盖
│   ├── config IR/IC cache、版本递增、读写锁并发保护
│   ├── hot update sendData/onReceiveData、global config 空初值/加载
│   ├── environment DEVELOPMENT 默认/三容器空
│   └── dict mode 100/512 属性并发读、dynamic threshold
├── 边界值测试
│   ├── 空配置、版本=0 初值
│   └── 512 属性
├── 返回值与类型验证
│   ├── 版本号、属性值
│   └── environment 枚举
├── 组合场景
│   ├── hot update + 版本递增
│   ├── 读写锁 + 并发读
│   └── dict mode + 多属性
├── 重复调用/幂等性
│   └── 多次加载配置一致
└── 并发跨线程
    ├── config 读写锁并发
    └── dict mode 512 并发读
```

- **用例位置（sendable_scenario_test）**：`sendable/ConfigIRTest.test.ets`（10 例） + `sendable/ConfigStabilityTest.test.ets`（2 例） + `sendable/ConfigVersionTest.test.ets`（17 例） + `sendable/DictModeTriggerTest.test.ets`（27 例） + `sendable/DynamicThresholdTest.test.ets`（16 例） + `sendable/EnvironmentConfigTest.test.ets`（15 例） + `sendable/GlobalConfigTest.test.ets`（12 例）。

- **测了哪些**：config IR/IC + 版本递增 + 读写锁并发 + hot update + global/env + dict mode 100/512 并发读。


## 1.4 事件 Event（72 用例）

```
事件 Event
├── 入参范围覆盖
│   ├── EventBus IR、publish、subscribe
│   ├── event error、handler concurrent
│   └── queue、multi-thread event
├── 边界值测试
│   ├── 空订阅、单事件
│   └── 多线程
├── 异常与非法输入
│   └── event error 路径
├── 返回值与类型验证
│   ├── publish/subscribe 消息
│   └── handler 执行
├── 组合场景
│   ├── publish + subscribe + queue
│   └── handler 并发 + 多线程
├── 重复调用/幂等性
│   └── 重复 publish 订阅者均收
└── 并发跨线程
    └── multi-thread event + handler concurrent
```

- **用例位置（sendable_scenario_test）**：`sendable/EventBusIRTest.test.ets`（12 例） + `sendable/EventErrorTest.test.ets`（10 例） + `sendable/EventHandlerConcurrentTest.test.ets`（8 例） + `sendable/EventPublishTest.test.ets`（10 例） + `sendable/EventQueueTest.test.ets`（12 例） + `sendable/EventSubscribeTest.test.ets`（10 例） + `sendable/MultiThreadEventTest.test.ets`（10 例）。

- **测了哪些**：EventBus IR + error + handler concurrent + publish/subscribe + queue + multi-thread。


## 1.5 状态机 StateMachine（73 用例）

```
状态机 StateMachine
├── 入参范围覆盖
│   ├── Approval DRAFT→PENDING 初始/转换
│   ├── Device、Order 状态机
│   ├── StateMachine IR/stability、ConcurrentState
│   └── DependencyChain 依赖链
├── 边界值测试
│   ├── 初始状态、单次转换
│   └── stability 往复
├── 异常与非法输入
│   └── 非法状态转换
├── 返回值与类型验证
│   ├── 当前状态
│   └── 转换后状态
├── 组合场景
│   ├── 多状态机串联
│   ├── stability 往复
│   └── dependency chain
├── 重复调用/幂等性
│   └── 同转换多次结果一致
└── 并发跨线程
    ├── ConcurrentState 并发状态
    └── StateMachine stability
```

- **用例位置（sendable_scenario_test）**：`sendable/ApprovalStateMachineTest.test.ets`（13 例） + `sendable/ConcurrentStateTest.test.ets`（11 例） + `sendable/DependencyChainTest.test.ets`（10 例） + `sendable/DeviceStateMachineTest.test.ets`（15 例） + `sendable/OrderStateMachineTest.test.ets`（11 例） + `sendable/StateMachineIRTest.test.ets`（8 例） + `sendable/StateMachineStabilityTest.test.ets`（5 例）。

- **测了哪些**：Approval/Device/Order 状态机 + IR/stability + ConcurrentState + DependencyChain。


## 1.6 进度 Progress（76 用例）

```
进度 Progress
├── 入参范围覆盖
│   ├── Batch/MultiStage/MultiTask/DataProcess/Upload progress
│   ├── parallel compute result
│   └── pipeline queue
├── 边界值测试
│   ├── 0% / 100%
│   └── 单任务 / 多任务
├── 返回值与类型验证
│   ├── 进度值
│   └── compute result
├── 组合场景
│   └── 多阶段 + 多任务 + 并行计算
├── 重复调用/幂等性
│   └── 同任务多次进度一致
└── 并发跨线程
    └── 多任务并行 + pipeline queue
```

- **用例位置（sendable_scenario_test）**：`sendable/BatchProgressTest.test.ets`（12 例） + `sendable/DataProcessProgressTest.test.ets`（12 例） + `sendable/MultiStageProgressTest.test.ets`（12 例） + `sendable/MultiTaskProgressTest.test.ets`（12 例） + `sendable/ParallelComputeResultTest.test.ets`（12 例） + `sendable/PipelineQueueTest.test.ets`（5 例） + `sendable/UploadProgressTest.test.ets`（11 例）。

- **测了哪些**：Batch/MultiStage/MultiTask/DataProcess/Upload progress + parallel compute + pipeline。


## 1.7 GC/生命周期（129 用例）

```
GC / 生命周期
├── 入参范围覆盖
│   ├── forceFullGC 立即 GC、memory leak snapshot 比对
│   ├── refCount 引用计数、PostGC 属性完整性/引用有效性
│   ├── SharedHeap clearAll/计数、SharedModule 创建/删除
│   └── batch create/destroy、heap isolation、lifecycle
├── 边界值测试
│   ├── 0 对象、批量创建
│   └── GC 前后
├── 返回值与类型验证
│   ├── refCount=1 初值、shared object count
│   └── GC 后属性完整
├── 组合场景
│   ├── 创建 + GC + 引用
│   ├── SharedHeap clearAll + 计数
│   └── batch destroy + leak
├── 重复调用/幂等性
│   └── 多次 GC 后状态一致
└── 并发跨线程
    ├── ConcurrentGC、MultiThreadRefGC
    └── batch create/destroy
```

- **用例位置（sendable_scenario_test）**：`sendable/BatchCreateDestroyTest.test.ets`（10 例） + `sendable/ConcurrentGCTest.test.ets`（10 例） + `sendable/HeapIsolationTest.test.ets`（10 例） + `sendable/MemoryLeakGCTest.test.ets`（10 例） + `sendable/MultiThreadRefGCTest.test.ets`（13 例） + `sendable/PostGCStateTest.test.ets`（10 例） + `sendable/RefCountGCTest.test.ets`（10 例） + `sendable/SendableLifecycleTest.test.ets`（10 例） + `sendable/ServiceLifecycleTest.test.ets`（12 例） + `sendable/SharedHeapGCTest.test.ets`（12 例） + `sendable/SharedModuleGCTest.test.ets`（12 例） + `sendable/SharedModuleGCTest2.test.ets`（10 例）。

- **测了哪些**：forceFullGC + memory leak snapshot + refCount + PostGC 完整性 + SharedHeap/Module + batch create/destroy + lifecycle。


## 1.8 共享计数 SharedCounter（62 用例）

```
共享计数 SharedCounter
├── 入参范围覆盖
│   ├── IR、inventory 库存/售出
│   ├── request、resourceRef
│   └── taskComplete、download
├── 边界值测试
│   ├── 库存=0、单次购买
│   └── 售罄
├── 异常与非法输入
│   └── 库存不足购买失败
├── 返回值与类型验证
│   ├── 库存/售出计数
│   └── resourceRef 引用
├── 组合场景
│   ├── 购买→库存减/售出增
│   └── taskComplete + download
├── 重复调用/幂等性
│   └── 多次购买累计一致
└── 并发跨线程
    └── SharedCounter 并发购买 + IR
```

- **用例位置（sendable_scenario_test）**：`sendable/SharedCounterDownloadTest.test.ets`（8 例） + `sendable/SharedCounterIRTest.test.ets`（12 例） + `sendable/SharedCounterInventoryTest.test.ets`（10 例） + `sendable/SharedCounterRequestTest.test.ets`（11 例） + `sendable/SharedCounterResourceRefTest.test.ets`（11 例） + `sendable/SharedCounterTaskCompleteTest.test.ets`（10 例）。

- **测了哪些**：inventory 库存/售出 + request + resourceRef + taskComplete + download + IR。


## 1.9 共享模块 SharedModule（24 用例）

```
共享模块 SharedModule
├── 入参范围覆盖
│   ├── nested task count waiting/callback nested
│   ├── variable lock、singleton 引用一致
│   ├── TaskPool 访问 singleton
│   └── use shared singleton counter mutate by reference、shared module GC
├── 边界值测试
│   ├── singleton 初值=0
│   └── nested count
├── 异常与非法输入
│   ├── variable lock protection
│   └── assertion key info
├── 返回值与类型验证
│   ├── singleton 同实例
│   └── counter 计数
├── 组合场景
│   ├── singleton + TaskPool mutate
│   └── nested + callback
├── 重复调用/幂等性
│   └── 多次 getInstance 同实例
└── 并发跨线程
    └── singleton 跨 TaskPool 引用一致 + GC
```

- **用例位置（sendable_scenario_test）**：`sendable/SendableSharedModuleTest.test.ets`（6 例） + `sendable/SharedModuleNestedTest.test.ets`（8 例） + `sendable/SharedModuleStabilityTest.test.ets`（7 例） + `sendable/UseSharedModuleTest.test.ets`（3 例）。

- **测了哪些**：singleton 引用一致 + TaskPool mutate + nested count + variable lock + shared module GC。


## 1.10 IR 优化（94 用例）

```
IR 优化
├── 入参范围覆盖
│   ├── IC cache 建立（重复访问同属性）/更新（属性修改后）
│   ├── fixed property IR、IR reinforcement
│   └── 各域 IR：Progress/Queue/ResultCollect/Lock/ConnectionPool/Cache/Config/EventBus/StateMachine/SharedCounter IR
├── 边界值测试
│   ├── first访问 vs 重复访问
│   └── 属性修改前后
├── 返回值与类型验证
│   ├── IC cache 命中
│   └── IR 固定属性访问
├── 组合场景
│   ├── IC cache 建立 + 更新
│   └── fixed property IR + IC cache
├── 重复调用/幂等性
│   └── 重复访问同属性命中 IC
└── 并发跨线程
    └── 跨线程 IR/IC cache 一致性
```

- **用例位置（sendable_scenario_test）**：`sendable/IROptimizationTest.test.ets`（26 例） + `sendable/IRReinforcementTest.test.ets`（29 例） + `sendable/LockIRTest.test.ets`（8 例） + `sendable/ProgressIRTest.test.ets`（10 例） + `sendable/QueueIRTest.test.ets`（10 例） + `sendable/ResultCollectIRTest.test.ets`（11 例）。

- **测了哪些**：IC cache 建立/更新 + fixed property IR + IR reinforcement + 各域 IR（Progress/Queue/ResultCollect/Lock/Connection/Cache/Config/Event/StateMachine/SharedCounter）。


## 1.11 服务 Service（52 用例）

```
服务 Service
├── 入参范围覆盖
│   ├── hotUpdate、monitor
│   ├── registry
│   └── singleton getInstance/TaskPool reference、lifecycle
├── 边界值测试
│   ├── singleton 初次/多次
│   └── registry 空
├── 返回值与类型验证
│   ├── getInstance 同实例
│   └── registry 注册项
├── 组合场景
│   ├── hotUpdate + monitor
│   └── singleton + TaskPool reference
├── 重复调用/幂等性
│   └── 多次 getInstance 同实例
└── 并发跨线程
    └── singleton 跨 TaskPool 引用 + lifecycle
```

- **用例位置（sendable_scenario_test）**：`sendable/ServiceHotUpdateTest.test.ets`（12 例） + `sendable/ServiceMonitorTest.test.ets`（12 例） + `sendable/ServiceRegistryTest.test.ets`（15 例） + `sendable/ServiceSingletonTest.test.ets`（13 例）。

- **测了哪些**：hotUpdate + monitor + registry + singleton getInstance/TaskPool + lifecycle。


## 1.12 限流/队列（67 用例）

```
限流/队列
├── 入参范围覆盖
│   ├── RateLimiter、SlidingWindowLimiter
│   ├── BoundedQueue、RequestBufferQueue、LogCollectorQueue
│   └── ProducerConsumer 协调、pipeline queue
├── 边界值测试
│   ├── 限流阈值
│   ├── bounded queue 满/空
│   └── 生产消费协调
├── 异常与非法输入
│   ├── 超阈值限流
│   └── queue 满
├── 返回值与类型验证
│   ├── 限流判定
│   └── queue 出队元素
├── 组合场景
│   ├── sliding window + 限流
│   └── producer + consumer 协调
├── 重复调用/幂等性
│   └── 限流多次判定一致
└── 并发跨线程
    └── bounded queue + producer/consumer 并发
```

- **用例位置（sendable_scenario_test）**：`sendable/BoundedQueueTest.test.ets`（12 例） + `sendable/LogCollectorQueueTest.test.ets`（10 例） + `sendable/ProducerConsumerCoordTest.test.ets`（10 例） + `sendable/RateLimiterTest.test.ets`（13 例） + `sendable/RequestBufferQueueTest.test.ets`（10 例） + `sendable/SlidingWindowLimiterTest.test.ets`（12 例）。

- **测了哪些**：RateLimiter + SlidingWindow + BoundedQueue + RequestBuffer/LogCollector queue + ProducerConsumer 协调。


## 1.13 锁/CV（30 用例）

```
锁/CV
├── 入参范围覆盖
│   ├── AsyncLock single increment/sequential 累计
│   ├── ConditionVariable wait/notify
│   └── ReadWriteLock、concurrency base
├── 边界值测试
│   ├── 单次 lock
│   └── 连续 lock 累计
├── 返回值与类型验证
│   ├── increment 返回值
│   └── count 累计
├── 组合场景
│   └── AsyncLock sequential + CV 协调 + RWLock
├── 重复调用/幂等性
│   └── 连续 lockAsync 累计
└── 并发跨线程
    └── AsyncLock/CV/RWLock 序列化并发
```

- **用例位置（sendable_scenario_test）**：`sendable/AsyncLockBasicTest.test.ets`（10 例） + `sendable/ConcurrencyBase.test.ets`（1 例） + `sendable/ConditionVariableTest.test.ets`（10 例） + `sendable/ReadWriteLockTest.test.ets`（9 例）。

- **测了哪些**：AsyncLock single/sequential + ConditionVariable wait/notify + ReadWriteLock + concurrency base。


## 1.14 基础类型/约束/序列化（136 用例）

```
基础类型/约束/序列化
├── 入参范围覆盖
│   ├── boolean default false + 修改、@Sendable empty/single property
│   ├── valid Sendable as TaskPool param、nested callback Sendable task
│   ├── collections.Array empty/push、TypedArray boundary values(Int8 负正/Uint8 0..255)
│   └── serialization boundary、freeze、isSendable、makeObserved、ASON、PixMap、IDGenerator、metrics aggregation/collector、dict mode
├── 边界值测试
│   ├── 默认值(false/0/空)、单属性
│   └── boundary values
├── 异常与非法输入
│   ├── constraint 违反
│   └── serialization boundary
├── 返回值与类型验证
│   ├── boolean/number 默认、instanceof
│   └── ID 唯一
├── 组合场景
│   ├── nested callback + Sendable task
│   ├── makeObserved + sendable
│   └── metrics 聚合
├── 重复调用/幂等性
│   ├── IDGenerator 唯一性
│   └── 默认值多次一致
└── 并发跨线程
    ├── Sendable as TaskPool param
    └── nested task
```

- **用例位置（sendable_scenario_test）**：`sendable/AsonSendableTest.test.ets`（3 例） + `sendable/FreezeSendableTest.test.ets`（3 例） + `sendable/IDGeneratorTest.test.ets`（10 例） + `sendable/IsSendableTest.test.ets`（3 例） + `sendable/MakeObservedSendableTest.test.ets`（3 例） + `sendable/MetricsAggregationTest.test.ets`（13 例） + `sendable/MetricsCollectorTest.test.ets`（13 例） + `sendable/PixMapTest.test.ets`（3 例） + `sendable/SendableBasicTypeTest.test.ets`（18 例） + `sendable/SendableCollectionsTest.test.ets`（19 例） + `sendable/SendableConstraintTest.test.ets`（8 例） + `sendable/SendableDecoratorTest.test.ets`（15 例） + `sendable/SendableFunctionTest.test.ets`（5 例） + `sendable/SendableNestedTest.test.ets`（6 例） + `sendable/SendableTypedArrayTest.test.ets`（8 例） + `sendable/SerializationBoundaryTest.test.ets`（6 例）。

- **测了哪些**：boolean/默认值 + valid Sendable + nested callback + collections/TypedArray boundary + @Sendable 基础 + serialization/freeze/isSendable/makeObserved + ASON/PixMap/IDGenerator/metrics。


## 1.15 结果收集/超时/错误（56 用例）

```
结果收集/超时/错误
├── 入参范围覆盖
│   ├── data/image/error/timeout result collect
│   ├── real error path（reject/retry after 2 failures）
│   ├── event error
│   └── config stability（assertion key info）
├── 边界值测试
│   ├── success/failure result
│   ├── timeout
│   └── retry 次数
├── 异常与非法输入
│   ├── concurrent task throw→reject promise
│   └── real error path + retry
├── 返回值与类型验证
│   ├── success/failure result
│   └── timeout 行为
├── 组合场景
│   ├── error collect + retry
│   └── timeout + result collect
├── 重复调用/幂等性
│   └── retry 多次恢复
└── 并发跨线程
    ├── concurrent task error→reject
    └── result collect
```

- **用例位置（sendable_scenario_test）**：`sendable/DataResultCollectTest.test.ets`（12 例） + `sendable/ErrorResultCollectTest.test.ets`（13 例） + `sendable/ImageResultCollectTest.test.ets`（13 例） + `sendable/RealErrorPathTest.test.ets`（5 例） + `sendable/TimeoutResultCollectTest.test.ets`（13 例）。

- **测了哪些**：data/image/error/timeout result collect + real error path(reject/retry) + event error + config stability。


## 1.16 Other/综合（15 用例）

```
Other/综合（AppSettings 应用设置）
├── 入参范围覆盖
│   ├── AppSettings 设置项读写、默认值（default ×16）
│   ├── config 配置加载（config ×7）
│   └── 设置项经 TaskPool 跨线程访问（TaskPool ×3）
├── 边界值测试
│   ├── 默认值初值、空设置
│   └── 单设置项、多设置项
├── 返回值与类型验证
│   ├── 设置读取类型、默认值断言
│   └── config 加载结果
├── 组合场景
│   └── 设置读写 + AsyncLock 保护（AsyncLock ×3）
└── 并发跨线程
    └── AppSettings 跨 TaskPool 设置读写（TaskPool ×3）
```

- **用例位置（sendable_scenario_test）**：`sendable/AppSettingsTest.test.ets`（15 例）。

- **测了哪些**：AppSettings 应用设置项读写 + 默认值 + config 加载 + AsyncLock 保护 + 跨 TaskPool 设置读写。

# 2. 稳定性

- **用例位置（sendable_scenario_test）**：`sendable/BatchCreateDestroyTest.test.ets`、`sendable/ConcurrentGCTest.test.ets`、`sendable/MemoryLeakGCTest.test.ets`、`sendable/RefCountGCTest.test.ets`、`sendable/PostGCStateTest.test.ets`、`sendable/SharedHeapGCTest.test.ets`、`sendable/SharedModuleGCTest.test.ets`、`sendable/MultiThreadRefGCTest.test.ets`
- **测了哪些**：Sendable 对象批量创建销毁/GC 后状态完整性/跨线程引用计数稳定性（本套件范围内）。

# 3. 性能

- **用例位置（sendable_scenario_test）**：`sendable/IROptimizationTest.test.ets`、`sendable/IRReinforcementTest.test.ets`、`sendable/DictModeTriggerTest.test.ets`
- **测了哪些**：并发 stress（500 tasks）/ IR 优化（IC cache 建立/更新、fixed property IR）大规模吞吐（本套件范围内）；**未见显式时延阈值**。

# 4. 并发安全

- **用例位置（sendable_scenario_test）**：`sendable/ConnectionPoolLockTest.test.ets`、`sendable/AsyncLockBasicTest.test.ets`、`sendable/ConditionVariableTest.test.ets`、`sendable/BoundedQueueTest.test.ets`
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + AsyncLock/ConditionVariable/ReadWriteLock 序列化 + 并发读写可见性/一致性（本套件范围内）。

# 5. 兼容性与继承

- **用例位置（sendable_scenario_test）**：`sendable/SendableDecoratorTest.test.ets`、`sendable/SendableConstraintTest.test.ets`、`sendable/SendableNestedTest.test.ets`
- **测了哪些**：@Sendable 类继承/composition/二级继承/triple 跨线程 + instanceof + ISendable 实现（本套件范围内）。

# 6. 资料与文档符合性

- **用例位置（sendable_scenario_test）**：`sendable/SendableBasicTypeTest.test.ets`、`sendable/IsSendableTest.test.ets`、`sendable/SerializationBoundaryTest.test.ets`
- **测了哪些**：@Sendable/@Concurrent 装饰、ISendable/isSendable、错误码 10200011/10200012/10200201/401 文档符合（本套件范围内）；**未发现与 `.d.ets` 逐条断言的符合性用例**。

---
# 7. 覆盖度矩阵与缺口分析（本套件自包含）

## 7.1 特性域 × 测试逻辑分类 覆盖矩阵

> 图例：✅ 充足 / 🟡 部分 / ❌ 未覆盖或仅间接

| 特性域 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 缓存 Cache | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 连接池 Connection | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 配置 Config/Global/Env | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 事件 Event | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 状态机 StateMachine | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 进度 Progress | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| GC/生命周期 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 共享计数 SharedCounter | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 共享模块 SharedModule | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| IR 优化 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 服务 Service | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 限流/队列 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 锁/CV | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 基础类型/约束/序列化 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| 结果收集/超时/错误 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |
| Other/综合 | ✅ | ✅ | 🟡 | ✅ | ✅ | ✅ | ✅ |

## 7.2 逐域遗漏确认（本套件范围内）

> ✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。对照本套件所测特性域逐条核查。

| # | 特性域 | 本套件核查结论 |
|---|------|----------------|
| 1 | 缓存 Cache | ✅ GET/POST response cache + key 隔离 + hit/miss 统计 + 过期 + LRU IR/IC + db/session/image cache + lazy loader。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 2 | 连接池 Connection | ✅ acquire/release + capacity + pool IR/init/lock + stats + timeout + wait queue。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 3 | 配置 Config/Global/Env | ✅ config IR/IC + 版本递增 + 读写锁并发 + hot update + global/env + dict mode 100/512 并发读。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 4 | 事件 Event | ✅ EventBus IR + error + handler concurrent + publish/subscribe + queue + multi-thread。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 5 | 状态机 StateMachine | ✅ Approval/Device/Order 状态机 + IR/stability + ConcurrentState + DependencyChain。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 6 | 进度 Progress | ✅ Batch/MultiStage/MultiTask/DataProcess/Upload progress + parallel compute + pipeline。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 7 | GC/生命周期 | ✅ forceFullGC/refCount/PostGC/SharedHeap/SharedModule/lifecycle；🟡 memory leak snapshot 比对依赖阈值，建议明确判定口径。 |
| 8 | 共享计数 SharedCounter | ✅ inventory 库存/售出 + request + resourceRef + taskComplete + download + IR。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 9 | 共享模块 SharedModule | ✅ singleton 引用一致 + TaskPool mutate + nested count + variable lock + shared module GC。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 10 | IR 优化 | ✅ IC cache 建立/更新+fixed property IR+各域 IR；🟡 跨线程 IR/IC 一致性断言偏弱。 |
| 11 | 服务 Service | ✅ hotUpdate + monitor + registry + singleton getInstance/TaskPool + lifecycle。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 12 | 限流/队列 | ✅ RateLimiter + SlidingWindow + BoundedQueue + RequestBuffer/LogCollector queue + ProducerConsumer 协调。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 13 | 锁/CV | ✅ AsyncLock single/sequential + ConditionVariable wait/notify + ReadWriteLock + concurrency base。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 14 | 基础类型/约束/序列化 | ✅ boolean 默认/TypedArray boundary/nested callback；❌ serialization boundary 深度边界未专项。 |
| 15 | 结果收集/超时/错误 | ✅ data/image/error/timeout result collect + real error path(reject/retry) + event error + config stability。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |
| 16 | Other/综合 | ✅ 未归入主题域的 Sendable 综合场景用例。；🟡 部分用例 @tc.desc 为通用场景编号(testXxx0100)，建议补具体断言描述。 |

## 7.3 接口组合遗漏（本套件范围内）

1. **场景×并发组合**：各主题域(连接池/事件/进度/服务)均含 TaskPool/AsyncLock 并发——✅ 覆盖。
2. **IR×场景组合**：CacheIR/ConfigIR/EventBusIR/StateMachineIR/SharedCounterIR 跨域 IC cache——✅ 覆盖。
3. **GC×引用组合**：refCount+PostGC+MultiThreadRefGC 引用计数与 GC 后完整性——✅ 覆盖。
4. **错误×重试组合**：real error path reject+retry after 2 failures——✅ 覆盖。

## 7.4 文档与测试一致性建议（同步资料侧·本套件范围内）

1. **@tc.desc 规范（⚠️）**：大量端到端用例 @tc.desc 为通用场景编号(testXxx0100)，建议测试侧补具体断言描述以便定位。
2. **IR/IC cache 文档**：建议 `.md` 补充 Sendable 属性访问 IC cache 与 fixed property IR 优化行为说明。
3. **GC 行为文档**：forceFullGC/refCount/shared object count 行为建议 `.md` 明确语义与判定口径。
4. **401/10200012**：lockAsync mode 越界 401、constructor 直接调用 10200012 建议文档保持错误码表一致。

## 7.5 优先级建议（本套件范围内）

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.2 端到端用例 @tc.desc 具体化（testXxx0100 → 具体断言）；7.2 serialization boundary 深度专项 |
| P1 | 7.2 memory leak snapshot 判定口径明确；7.2 跨线程 IR/IC 一致性强化 |
| P2 | 7.4 文档 IR/IC cache + GC 行为说明 + 错误码表一致 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对 @Sendable 类属性/方法/参数/返回值遍历合法类型空间 | 全类型属性矩阵（number/string/boolean/BigInt/null/undefined/class/function/enum/Array/Map/Set/TypedArray） |
| ②边界值测试 | 空/单元素/大规模/边界值（401 枚举越界、空容器、500 tasks stress） | 0 tasks boundary、空 Session、版本=0 初值 |
| ③异常与非法输入 | 10200011(detached)、10200012(constructor 直接调用)、10200201(并发修改)、401(参数非法) | returnCovered 各容器 10200012、lockAsync mode 越界 401 |
| ④返回值与类型验证 | 方法返回 number/string/boolean、instanceof、引用相等、计数语义 | refCount=1、singleton getInstance 同实例、counter 累加 |
| ⑤组合场景 | 多对象串联（NormalClass 持多 Sendable 成员跨线程、shared module singleton+TaskPool）、DataView↔容器 | NormalComplexContainer 交叉引用、shared module+TaskPool mutate |
| ⑥重复调用/幂等性 | 同操作多次稳定、singleton 多次 getInstance 同实例、连续递增 | singleton 多次、AsyncLock sequential 累计 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock/CV 序列化、stress 500 tasks、GC 后状态 | 500 tasks stress、TaskPool mutate by reference、PostGC 完整性 |
