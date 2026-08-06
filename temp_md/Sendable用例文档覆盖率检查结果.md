# Sendable 用例文档覆盖率检查结果

> 检查日期：2026-08-06  
> 被检查工程：`projects/xts_acts_sendable_all727`  
> 被检查套件：`commonlibrary/ets_utils/concurrent_sendable/sendable_all_test`  
> 文档范围：`md/sendable` 下 19 份 Markdown 测试设计文档  
> 并发模型：ArkTS-Dyn（ArkTS 1.1 动态模型）  
> 检查方式：静态、只读的设计点与测试代码语义映射，未执行编译和设备运行

## 1. 检查结论

当前 `sendable_all_test` **未完全覆盖** `md/sendable` 中的全部测试设计。

若需要用一个数字表达当前状态，建议采用：

> **综合有效覆盖率约为 75%。**

不同统计口径下的估算结果如下：

| 统计口径 | 覆盖率估算 | 判定标准 |
|---|---:|---|
| 严格完整覆盖率 | 约 65%～70% | 实际执行文档要求的机制，并通过有效断言证明结果 |
| 综合有效覆盖率 | 约 73%～77% | 完整覆盖计 1，弱覆盖计 0.5，缺失计 0 |
| 主题触达率 | 约 80%～85% | 只要存在相近主题或业务场景测试即视为触达 |
| 建议对外使用值 | **约 75%** | 兼顾完整覆盖和弱覆盖后的综合评估值 |

该覆盖率是基于设计语义的工程估算，不是代码行覆盖率、分支覆盖率或 LCOV 结果。

## 2. 检查范围

### 2.1 设计文档

本次检查覆盖 `md/sendable` 下全部 19 份文档：

1. `Sendable测试设计思维导图.md`
2. `Sendable实战型测试设计-总览文档.md`
3. `Sendable实战型测试设计-共享计数器场景.md`
4. `Sendable实战型测试设计-生产者消费者队列场景.md`
5. `Sendable实战型测试设计-共享缓存LRUCache场景.md`
6. `Sendable实战型测试设计-多任务结果收集场景.md`
7. `Sendable实战型测试设计-共享锁与条件变量场景.md`
8. `Sendable实战型测试设计-共享配置管理场景.md`
9. `Sendable实战型测试设计-共享状态机场景.md`
10. `Sendable实战型测试设计-进度追踪监控场景.md`
11. `Sendable实战型测试设计-共享事件总线场景.md`
12. `Sendable实战型测试设计-共享数据库连接池场景.md`
13. `Sendable实战型测试设计-共享模块加固版.md`
14. `Sendable实战型测试设计-共享内存GC场景.md`
15. `Sendable实战型测试设计-GC与并发组合场景.md`
16. `GC与并发组合测试场景设计.md`
17. `Sendable实战型测试设计-IR化优化场景.md`
18. `Sendable实战型测试设计-IR化加固补充.md`
19. `Sendable实战型测试设计-字典模式触发场景.md`

### 2.2 测试代码

主要检查目录：

```text
projects/xts_acts_sendable_all727/
└── commonlibrary/ets_utils/concurrent_sendable/sendable_all_test/
    └── entry/src/ohosTest/ets/
        ├── test/List.test.ets
        ├── test/sendable/*.test.ets
        └── workers/*.ets
```

测试入口链路：

- `entry/src/ohosTest/ets/testability/TestAbility.ets`
- `entry/src/ohosTest/ets/test/List.test.ets`

## 3. 套件基础统计

| 项目 | 数量 | 说明 |
|---|---:|---|
| `sendable` 目录下 `.test.ets` 文件 | 111 | 不含辅助枚举文件 |
| 已注册测试文件 | 111 | 全部在 `List.test.ets` 中导入并调用 |
| 未注册测试文件 | 0 | 未发现遗漏注册 |
| 实际 `it()` 数 | 1196 | 按已注册测试文件统计 |
| `@tc` 注释块 | 1196 | 与 `it()` 一一对应 |
| 断言总数 | 2209 | 包含各类 `assert*` 断言 |
| 无断言 `it()` | 0 | 每个实际用例至少包含一个断言 |
| 已注册但 0 用例的空套件 | 2 | Worker 相关套件 |

两个空套件为：

- `BuiltinsWorkerSendableTest.test.ets`
- `BuiltinsWorkerConfigTest.test.ets`

另有 `BuiltinsWorkerIntegrationTest.test.ets` 仅包含 1 个用例，且没有真正创建 Worker。

## 4. 覆盖率计算口径

### 4.1 为什么不能直接按用例数量相除

不能使用以下方式计算：

```text
1196 个测试用例 ÷ 906 个文档用例
```

原因包括：

1. 多个 `it()` 可能重复验证同一个设计能力。
2. 一个设计点可能需要多个正常、异常、边界和并发用例共同覆盖。
3. 部分用例名称或 `@tc.desc` 声称覆盖某项机制，但测试体没有真正执行该机制。
4. 文档中的用例数量存在多套互相冲突的统计口径。
5. GC、IC、HiddenClass、IR 等运行时机制不能仅通过普通业务结果断言证明。

### 4.2 本次判定等级

| 等级 | 权重 | 判定说明 |
|---|---:|---|
| 完整覆盖 | 1.0 | 测试操作、并发机制、异常路径和断言均与文档设计语义相符 |
| 弱覆盖 | 0.5 | 存在相近测试，但关键机制不同、断言偏弱或只模拟业务状态 |
| 缺失 | 0 | 没有对应测试，或已注册套件实际没有 `it()` |

综合有效覆盖率采用如下估算方式：

```text
综合有效覆盖率 ≈（完整覆盖设计点 + 0.5 × 弱覆盖设计点）÷ 去重后的设计点总数
```

由于文档缺少统一编号且存在跨文档重复，最终结果以区间表达，中心值约为 75%。

## 5. 分领域覆盖评估

| 测试领域 | 有效覆盖率估算 | 评价 |
|---|---:|---|
| `@Sendable class/function`、正向约束 | 约 75%～85% | 基础能力覆盖较好，编译期负例不足 |
| 基础类型属性 | 约 70%～80% | 常用值已覆盖，null/undefined 和特殊数值不足 |
| Array/Map/Set/LRUCache | 约 85%～90% | 常用接口、容量和淘汰覆盖较好 |
| TypedArray/ArrayBuffer | 约 35%～50% | 主要只有 Int32Array 基础路径 |
| TaskPool Sendable 共享传递 | 约 80%～85% | 引用共享、修改可见和嵌套覆盖较好 |
| Worker Sendable/配置/共享模块 | 约 20%～35% | 两个空套件，真实 Worker 场景严重不足 |
| 计数器、队列、进度等业务场景 | 约 75%～85% | 基础功能较全，失败、恢复和精确并发断言不足 |
| 状态机、事件总线 | 约 65%～75% | 基础状态流转较全，Worker、通知和错误恢复不足 |
| 锁、ConditionVariable、连接池 | 约 65%～75% | 有真实等待场景，但部分用例未证明预期并发语义 |
| 错误、超时、取消、自动重试 | 约 45%～60% | 大量场景采用手工标记状态，没有真实失败链路 |
| SharedHeap GC、引用计数、泄漏检测 | 严格口径约 10%～25% | 大部分为容器清理或业务计数模拟 |
| IR、IC、HiddenClass | 严格口径约 30%～50% | 多数通过功能结果间接推断内部机制 |
| 1024/1025 等大容器边界 | 约 85%～90% | Array/Map/Set 的功能边界覆盖较好 |

## 6. 主要未覆盖或弱覆盖问题

### 6.1 Worker 相关套件为空或过薄

#### 问题

- `BuiltinsWorkerSendableTest.test.ets` 已注册但无 `it()`。
- `BuiltinsWorkerConfigTest.test.ets` 已注册但无 `it()`。
- `BuiltinsWorkerIntegrationTest.test.ets` 只有一个主线程自增测试，没有创建 `ThreadWorker`。

#### 影响

以下文档设计点无法认定为覆盖：

- Worker 发送和接收 Sendable 对象
- Worker 修改共享对象后主线程可见
- 多 Worker 共享同一个 Sendable 实例
- Worker 配置读写和同步通知
- Worker 错误恢复、超时重试和配置重置
- Worker 生命周期与退出后引用释放
- Worker 回调内嵌套 TaskPool

#### 严重度

**高。**

### 6.2 缺少真实 SharedHeap GC 验证

目标套件中没有发现以下 API 的实际调用：

- `ArkTools.forceFullGC()`
- `ArkTools.getSharedHeapInfo()`

多个 GC 用例实际只执行：

- `Map.clear()`
- manager 删除对象
- 业务访问计数递增
- 检查对象属性仍可读取

这些行为不能证明：

- GC 已经发生
- Sendable 对象已从 SharedHeap 回收
- 运行时引用计数已经归零
- Worker terminate 后引用已经释放
- 不存在真实内存泄漏

#### 严重度

**高。**

### 6.3 序列化大小边界和错误码缺失

文档要求验证：

- 16 MiB 临界值
- 大于 16 MiB 失败
- 错误码 `10200006`

当前套件未发现对应数据构造和错误码断言。

#### 严重度

**高。**

### 6.4 Sendable 约束负例不足

缺少或仅有正向弱覆盖的设计点包括：

- 属性未初始化
- 动态添加和删除属性
- 计算属性名
- Sendable 类型别名限制
- Sendable 类继承非 Sendable 类

这些多为编译期负例，当前工程没有发现独立编译负例项目或诊断结果基线。

#### 严重度

**中高。**

### 6.5 基础类型和 TypedArray 边界不足

缺失或不完整项包括：

- `null` 属性
- `undefined` 属性
- `NaN`
- `Infinity`
- 负 BigInt
- 长字符串专项边界
- Int8Array、Float32Array
- ArrayBuffer 共享
- TypedArray `slice/subarray`
- TypedArray 经 Worker 传递

#### 严重度

**中。**

### 6.6 并发用例存在弱断言

部分并发用例只断言：

- 返回数组长度正确
- 结果大于等于 1
- 计数大于等于 0

但没有断言：

- 最终共享计数精确等于任务数
- 不存在更新丢失
- 每个任务只执行一次
- 取消后共享状态没有被修改

例如 `SharedCounterTaskCompleteTest` 中 TaskGroup 确实被创建和执行，但只断言结果数组长度，没有断言共享完成计数最终等于 5。

#### 严重度

**中高。**

### 6.7 错误、超时、取消和重试多为手工状态模拟

主要问题：

- 失败结果由主线程手工写入，而不是任务真实抛错
- 超时由手工调用 `markTimeout()`，未必发生真实超时
- 缺少超时任务的实际取消
- 缺少自动重试和最大重试次数限制
- 缺少失败恢复任务的完整结果验证

#### 严重度

**高。**

### 6.8 锁和 ConditionVariable 部分测试不等价

发现的典型问题包括：

- 部分 ReadWriteLock 读取仍被同一 AsyncLock 串行化，不能证明多读者并行。
- “写阻塞读”用例先等待写完成，再启动读，没有制造真实重叠。
- 部分 ConditionVariable 管理器只维护自定义等待数组，没有让任务进入 `wait()`。
- 数据库连接专用等待队列创建了 ConditionVariable，但没有实际调用 `wait()` 或 `waitFor()`。

#### 严重度

**高。**

### 6.9 配置持久化、快照和回滚缺失

缺少：

- 配置落盘和重新加载
- 完整配置快照
- 指定版本回滚
- 回滚后的配置恢复
- 回滚版本号和并发一致性
- Worker 退出清理配置

#### 严重度

**中高。**

### 6.10 缓存仍有独立缺口

缺少：

- URL + 参数组合缓存键
- API 缓存刷新策略
- 过期 Session 自动清理
- Session 失效统计

当前 Session 测试只验证过期判断，没有验证过期项从缓存和时间戳容器中删除。

#### 严重度

**中。**

## 7. 覆盖较好的领域

以下内容已有较完整的实际执行路径和断言：

1. `@Sendable class` 的实例化、基础属性和正向继承。
2. `@Sendable function` 的参数、返回值和 TaskPool 调用。
3. `ISendable` 正向实现。
4. `collections.Array/Map/Set` 常用接口。
5. `SendableLruCache` 的 put/get/contains/remove 和 LRU 淘汰。
6. TaskPool 传递并修改同一 Sendable 实例。
7. TaskPool `sendData/onReceiveData` 基础链路。
8. TaskPool 回调内嵌套任务及 3/5/10 小并发组合。
9. `'use shared'` 模块与 TaskPool 共享单例。
10. 计数器、队列、进度、状态机、事件和连接池的基础业务功能。
11. Array/Map/Set 的 1024/1025 元素边界。
12. 100、512、1024、1025、2048、4096 等大容器功能验证。

## 8. 文档统计问题

`md/sendable` 中的数量不能直接作为唯一覆盖率分母，主要不一致包括：

| 文档或文档组 | 数量问题 |
|---|---|
| Sendable 测试设计思维导图 | 同时出现 47 和 51，实际内嵌 `it()` 数也不一致 |
| 总览文档 | 同时出现 663、774、906 等统计值 |
| 共享模块加固版 | 统计表为 104，正文有约 275 个字面 `it()` |
| GC 与并发组合两份文档 | 同类设计分别声明 426 和 112 项 |
| 多份业务场景文档 | 末尾统计表与正文实际 `it()` 数不一致 |

建议后续建立统一编号的设计矩阵，例如：

```text
SENDABLE-WORKER-001
SENDABLE-GC-001
SENDABLE-CACHE-001
SENDABLE-CONFIG-001
```

每个设计点至少记录：

- 文档来源
- 场景和前置条件
- 输入和操作
- 预期结果
- 对应测试文件
- 对应 `@tc.name`
- 覆盖状态：完整/弱覆盖/缺失/N/A

## 9. 修复优先级建议

### P0：优先补齐

1. 补齐 `BuiltinsWorkerSendableTest` 和 `BuiltinsWorkerConfigTest` 空套件。
2. 建立真实 Worker Sendable 传递、修改可见、多 Worker 和生命周期用例。
3. 补齐 16 MiB、超限失败和 `10200006` 错误码。
4. 修复连接池等待队列，使测试真实进入 ConditionVariable 等待和唤醒路径。
5. 补齐真实异常、真实超时、取消和重试链路。

### P1：重要补齐

1. 明确 GC 测试是否允许使用稳定公开的运行时诊断 API；若不允许，应降低文档中“真实 GC/引用计数”的声明。
2. 补齐配置快照、回滚和持久化。
3. 补齐 TypedArray、null/undefined 和特殊数值边界。
4. 修正弱断言，使用任务数、唯一 ID 集合、精确计数和最终状态进行验证。
5. 修正 ReadWriteLock 和 ConditionVariable 中不等价的并发测试。

### P2：文档和机制口径治理

1. 对 19 份文档进行设计点去重和统一编号。
2. 修正文档中的用例总数和重复章节编号。
3. 区分“功能结果验证”和“运行时内部机制验证”。
4. 对无法稳定观测的 IC、HiddenClass、IR 和字典模式机制改用可验证的功能稳定性描述。

## 10. 最终判定

| 检查项 | 结论 |
|---|---|
| 测试文件注册完整性 | 通过 |
| 实际用例断言完整性 | 通过 |
| 主要业务主题触达 | 基本通过 |
| 文档全部设计点覆盖 | 不通过 |
| Worker 相关覆盖 | 严重不足 |
| 真实 SharedHeap GC 覆盖 | 严重不足 |
| 异常、超时、取消和重试 | 不完整 |
| 配置持久化、快照和回滚 | 缺失 |
| 综合有效覆盖率 | **约 75%** |

最终结论：

> `sendable_all_test` 已具备较大的测试规模和较广的业务主题覆盖，但尚不能认定为完整覆盖 `md/sendable`。当前综合有效覆盖率建议记录为 **约 75%**，其中严格完整覆盖率约为 **65%～70%**。

## 11. 限制说明

本报告基于静态代码与文档语义映射，未执行：

- HAP 编译
- 设备安装与运行
- 压力测试
- SharedHeap profiler 或内存快照
- 运行时 IR/IC/HiddenClass 诊断

因此，本报告反映的是**测试设计实现覆盖情况**，不代表设备运行通过率或产品代码行覆盖率。
