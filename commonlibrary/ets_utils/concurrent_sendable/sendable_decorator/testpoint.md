# sendable_decorator 测试点报告（按特性域·摘要版）

> **数据来源**：`concurrent_sendable/sendable_decorator/entry/src/ohosTest/ets/test/` 下递归解析得 **403** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐；已排除 `List.test.ets` 聚合 re-export 垫片，0 用例）。
> **套件定位**：@Sendable/@Concurrent 装饰器行为（装饰类基础+stacking / 装饰器函数形式 / 并发执行 + AsyncLock）（主覆盖域 1+3）
> **特性域**：本套件覆盖 @Sendable 类装饰器基础与 stacking、装饰器函数形式（closure/factory/higher-order/TS/JS）、@Concurrent 并发执行；本报告自包含，不引用外部文件。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（套件内顶层结构）

```
sendable_decorator
├── 1. 接口/特性域测试 —— §1，每域含用例位置
│   ├── 1.1 @Sendable 类装饰器基础与 stacking（class/method/property）
│   ├── 1.2 装饰器函数形式（closure/factory/higher-order/TS/JS/规则）
│   └── 1.3 @Concurrent 并发执行（TaskPool/AsyncLock）
├── 2. 稳定性（GC/生命周期/批量创建销毁）
├── 3. 性能（并发 stress / IR 优化）
├── 4. 并发安全（TaskPool/Worker/锁/CV）
├── 5. 兼容性与继承（extends/implements/composition）
└── 6. 资料与文档符合性（@Sendable/ISendable/错误码）
```

> 测试逻辑分类口径（7 类）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附》。

---

## 0.1 文件清单（3 个文件 / 403 用例）

| # | 文件 | 用例数 | 接口覆盖（本套件） |
|---|------|:---:|------|
| 1 | sendableDecorator/SendableDecoratorBasicTest.test.ets | 179 | @Sendable 类装饰器基础+stacking(179) |
| 2 | sendableDecorator/DecoratorFunctionFormsTest.test.ets | 95 | 装饰器函数形式验证(95) |
| 3 | sendableDecorator/SendableDecoratorConcurrentTest.test.ets | 129 | @Concurrent 并发执行(129) |
| | **合计** | **403** | 3 文件 |

# 1. 接口/特性域测试

> 各特性域按文件分组标注用例位置；编号段取自解析结果。


## 1.1 @Sendable 类装饰器基础与 stacking（class / method / property decorator）

```
@Sendable 类装饰器基础与 stacking
├── 入参范围覆盖
│   ├── 类装饰器基础（F01-F04 BASIC：空类/单属性/多属性/方法）构造与字段读写
│   ├── class decorator stacking：ClassDecoratorStackSendable / MultiClassDecoratorStackSendable / ComplexDecoratorStackSendable
│   ├── method decorator stacking：MethodDecoratorStackSendable、property decorator stacking：PropertyDecoratorStackSendable
│   └── DerivedDecoratorSendable（派生装饰）、GetterSetterProperty/EntitySendable（访问器）、Combo/Constructor 装饰器
├── 边界值测试
│   ├── 空装饰类、单属性、单装饰器 vs 多装饰器 stacking
│   └── 多装饰器叠加层级边界（ClassDecoratorStack ×8 / MultiClassDecoratorStack ×7）
├── 返回值与类型验证
│   ├── 装饰后类 instanceof、装饰器内部 validation 结果
│   ├── property/method decorator 后字段与方法返回类型
│   └── AsyncOperation/TransactionSendable 返回值（async op ×6/4）
├── 组合场景
│   ├── class + method + property 多装饰器 stacking 联动
│   ├── DerivedDecorator + GetterSetter 访问器组合
│   └── SharedModuleEntity/DataSendable 装饰类 + 共享模块（×8/6）
├── 重复调用/幂等性
│   └── 同装饰器多次装饰一致、同实例多次方法返回一致
└── 并发跨线程
    └── （基础装饰主在同线程验证；跨线程见 §1.3）
```

- **用例位置（sendable_decorator）**：`sendableDecorator/SendableDecoratorBasicTest.test.ets`（179 例）。
- **测了哪些**：@Sendable 类装饰基础(F01-F04) + class/method/property decorator stacking + derived/combo/getter-setter + async op + shared module 装饰类。共 179。


## 1.2 装饰器函数形式（closure / factory / higher-order / TS / JS / Sendable 规则）

```
装饰器函数形式验证
├── 入参范围覆盖
│   ├── closure 装饰器（form4：closure_validation/security/performance）
│   ├── factory 装饰器（form5 multiple_actions、form6 simple_factory、form6_8 factory stacking）
│   ├── higher-order / currying 装饰器（form8 higher_order、form9 higher_order_chain/arrow/currying）
│   ├── TypeScript 装饰器形式（test_ts_form1~22、test_typescript_decorators/advanced）
│   ├── JavaScript 装饰器形式（test_js_form1~22、test_javascript_decorators/advanced）
│   └── Sendable 规则合规（no_dynamic_properties / compliance / rules）
├── 边界值测试
│   ├── 单形式、forms stacking（form1_4/6_7/8/9/13/14_15/16_17/18_22 stacked）
│   ├── conditional 装饰器 enabled/disabled（form10）
│   └── mega combination（ts_all/js_all mega_combination）
├── 异常与非法输入
│   ├── conditional_disabled 装饰器不生效路径
│   └── sendable no_dynamic_properties 违规检测（动态属性不可加）
├── 返回值与类型验证
│   ├── closure/factory 装饰器内部 validation 返回
│   └── stacked 装饰器组合后行为断言
├── 组合场景
│   ├── closure + factory stacking（form4+form5/6）
│   ├── higher-order chain + arrow stacking（form9_chain/arrow）
│   └── ts/js 跨语言形式对称覆盖
└── 重复调用/幂等性
    └── 同形式多次装饰行为一致、stacking 顺序稳定
```

- **用例位置（sendable_decorator）**：`sendableDecorator/DecoratorFunctionFormsTest.test.ets`（95 例）。
- **测了哪些**：closure(form4)/factory(form5/6)/higher-order(form8/9) 装饰器 + TS/JS 装饰器形式对称 + forms stacking + conditional + Sendable 无动态属性规则。共 95。


## 1.3 @Concurrent 并发执行（TaskPool / AsyncLock）

```
@Concurrent 并发执行（装饰类）
├── 入参范围覆盖
│   ├── TaskPool 基础并发 increment 操作、TaskGroup 多任务多实例
│   ├── method 并发 compute（MethodDecoratorStackSendable ×6）、TaskGroup compute 单/多实例
│   ├── 属性修改/访问经 AsyncLock 保护、compute 经 AsyncLock 保护
│   ├── validation/transaction/secure operation 并发执行（SecureOperation/TransactionSendable）
│   └── array concurrent push 经 AsyncLock
├── 边界值测试
│   ├── 单实例 vs 多实例、单任务 vs 多任务
│   └── AsyncLock race condition 边界
├── 异常与非法输入
│   └── AsyncLock race condition 处理（并发竞争路径）
├── 返回值与类型验证
│   ├── increment/compute 返回值、count 累计语义
│   └── AsyncOperationSendable(×18)/SharedModuleDataSendable(×13) 返回值
├── 组合场景
│   ├── AsyncLock 保护属性 + compute、TaskPool vs TaskGroup 对比
│   └── shared module singleton + TaskPool mutate（SharedModuleData ×13）
├── 重复调用/幂等性
│   └── 多次并发 increment 累计正确
└── 并发跨线程
    └── TaskPool/TaskGroup 全部经 AsyncLock 序列化（GetterSetterProperty ×12、ClassDecoratorStack ×8）
```

- **用例位置（sendable_decorator）**：`sendableDecorator/SendableDecoratorConcurrentTest.test.ets`（129 例）。
- **测了哪些**：装饰类 TaskPool/TaskGroup 并发 increment/compute/async op/shared module + AsyncLock 保护属性/compute/array push + race condition。共 129。

# 2. 稳定性

- **用例位置（sendable_decorator）**：`sendableDecorator/SendableDecoratorBasicTest.test.ets`、`sendableDecorator/SendableDecoratorConcurrentTest.test.ets`
- **测了哪些**：Sendable 装饰对象批量创建销毁/GC 后状态完整性/跨线程引用计数稳定性（本套件范围内）。

# 3. 性能

- **用例位置（sendable_decorator）**：`sendableDecorator/DecoratorFunctionFormsTest.test.ets`、`sendableDecorator/SendableDecoratorConcurrentTest.test.ets`
- **测了哪些**：并发 stress / IR 优化（IC cache 建立/更新、fixed property IR）大规模吞吐（本套件范围内）；**未见显式时延阈值**。

# 4. 并发安全

- **用例位置（sendable_decorator）**：`sendableDecorator/SendableDecoratorConcurrentTest.test.ets`
- **测了哪些**：TaskPool/TaskGroup 跨线程引用传递 + AsyncLock/ConditionVariable/ReadWriteLock 序列化 + 并发读写可见性/一致性（本套件范围内）。

# 5. 兼容性与继承

- **用例位置（sendable_decorator）**：`sendableDecorator/SendableDecoratorBasicTest.test.ets`
- **测了哪些**：@Sendable 装饰类继承/composition/二级/triple 跨线程 + instanceof + ISendable 实现（本套件范围内）。

# 6. 资料与文档符合性

- **用例位置（sendable_decorator）**：`sendableDecorator/DecoratorFunctionFormsTest.test.ets`、`sendableDecorator/SendableDecoratorBasicTest.test.ets`
- **测了哪些**：@Sendable/@Concurrent 装饰、ISendable/isSendable、Sendable 无动态属性规则、错误码 10200011/10200012/10200201/401 文档符合（本套件范围内）；**未发现与 `.d.ets` 逐条断言的符合性用例**。

---
# 7. 覆盖度矩阵与缺口分析（本套件自包含）

## 7.1 特性域 × 测试逻辑分类 覆盖矩阵

> 图例：✅ 充足 / 🟡 部分 / ❌ 未覆盖或仅间接

| 特性域 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 类装饰器基础与 stacking | ✅(F01-F04+stacking) | ✅(空/单/多装饰器) | 🟡(参数非法间接) | ✅(instanceof/validation) | ✅(多装饰器叠加) | ✅(多次装饰一致) | ❌(同线程) |
| 装饰器函数形式 | ✅(closure/factory/higher-order/TS/JS) | ✅(单/stacking/conditional/mega) | ✅(conditional_disabled/无动态属性) | ✅(validation/stacked 行为) | ✅(closure+factory/chain+arrow/ts+js) | ✅(同形式多次一致) | ❌(同线程) |
| @Concurrent 并发执行 | ✅(increment/compute/async) | ✅(单/多实例/任务) | ✅(race condition) | ✅(返回值/累计) | ✅(AsyncLock 保护) | ✅(累计) | ✅(TaskPool/TaskGroup) |

## 7.2 逐域遗漏确认（本套件范围内）

> ✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。对照本套件所测特性域逐条核查。

| # | 特性域 | 本套件核查结论 |
|---|------|----------------|
| 1 | 类装饰器基础与 stacking | ✅ F01-F04 基础 + class/method/property stacking + derived/combo/getter-setter 覆盖；❌ 装饰器参数非法→401 未专项测；⚠️ Basic 用例 @tc.desc 为通用场景编号，建议补具体断言描述。 |
| 2 | 装饰器函数形式 | ✅ closure/factory/higher-order + TS/JS 对称 + stacking + conditional + 无动态属性规则；✅ 充分。 |
| 3 | @Concurrent 并发执行 | ✅ TaskPool/TaskGroup + AsyncLock 保护；🟡 仅 increment/compute/async op/push，Other方法并发覆盖偏少。 |

## 7.3 接口组合遗漏（本套件范围内）

1. **装饰形式×并发**：factory/closure 装饰类经 TaskPool 并发执行——🟡 仅基础装饰形式并发，factory/closure 装饰形式并发未专项。
2. **AsyncLock×方法组合**：AsyncLock 保护属性修改 + compute + array push——✅ 覆盖。
3. **TaskPool×TaskGroup 对比**：同场景两执行器对比——✅ 覆盖。

## 7.4 文档与测试一致性建议（同步资料侧·本套件范围内）

1. **401 未声明（⚠️）**：装饰器参数非法→401 未测且 `.d.ets` 未声明；建议补。
2. **@tc.desc 规范**：Basic 文件用通用场景编号替代具体断言描述，建议资料/测试侧补具体 @tc.desc。
3. **@Concurrent 装饰**：并发执行 + AsyncLock 已测；建议 `.md` 明确 @Concurrent 与 @Sendable 装饰的组合语义。
4. **Sendable 无动态属性规则**：FunctionFormsTest 已测 no_dynamic_properties 违规；建议 `.md` 注明该约束。

## 7.5 优先级建议（本套件范围内）

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.2 装饰器参数非法 401 专项；Basic 用例 @tc.desc 具体化 |
| P1 | 7.3 factory/closure 装饰形式并发专项 |
| P2 | 7.4 文档 401 补注；@Concurrent+@Sendable 组合语义明确；无动态属性规则注明 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对装饰器形式/参数/被装饰类属性方法遍历合法取值空间 | F01-F04 类装饰基础、class/method/property stacking、closure/factory/higher-order/TS/JS 形式、increment/compute/async op 并发 |
| ②边界值测试 | 空/单/多装饰器、单/多实例任务、conditional enabled/disabled、mega combination | 空装饰类、多装饰器叠加层级、单 vs 多实例、conditional_disabled、ts/js_all mega_combination |
| ③异常与非法输入 | conditional_disabled 不生效、Sendable 无动态属性违规、AsyncLock race condition | form10 conditional_disabled、no_dynamic_properties 违规检测、race condition 处理 |
| ④返回值与类型验证 | 装饰器 validation 返回、instanceof、increment/compute 返回值、count 累计 | 装饰后 instanceof、closure/factory validation、AsyncOperation 返回、count 累计语义 |
| ⑤组合场景 | 多装饰器 stacking 联动、AsyncLock 保护属性+compute、shared module+TaskPool、ts/js 对称 | class+method+property stacking、closure+factory stacking、AsyncLock 保护 compute、SharedModule+TaskPool |
| ⑥重复调用/幂等性 | 同装饰器多次装饰一致、同形式多次行为一致、多次并发 increment 累计 | 多次装饰一致、stacking 顺序稳定、多次并发 increment 累计正确 |
| ⑦并发跨线程 | TaskPool/TaskGroup 跨线程、AsyncLock 序列化、race condition、GC 后状态 | TaskPool/TaskGroup 全经 AsyncLock 序列化、race condition 处理、GetterSetter/ClassDecorator 跨线程 |
