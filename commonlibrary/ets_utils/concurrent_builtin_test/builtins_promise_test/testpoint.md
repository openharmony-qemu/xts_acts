# builtins_promise_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/builtins_promise_test/entry/src/ohosTest/ets/test/` 下 **32** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **1356** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。本套件为 Promise 特性主套件（constructor/then/catch/finally/resolve/reject/all/race/allSettled/any + 组合 + 场景变体）。
> **契约来源**：`arkts/builtin/dynamic/lib.es5.d.ts`（L1526 `interface Promise<T>`）+ `lib.es2015.promise.d.ts`（L21 PromiseConstructor）+ `lib.es2018.promise.d.ts`（L24 finally）+ `lib.es2020.promise.d.ts`（L33 allSettled）+ `lib.es2021.promise.d.ts`（L36 any/AggregateError）+ `static/Promise.static.d.ets`（L181 ArkTS 静态 Promise，独立体系）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
builtins_promise_test（Promise 特性主套件）
├── 1. 接口测试
│   ├── 1.1 constructor(executor)
│   ├── 1.2 Promise.resolve(value)
│   ├── 1.3 Promise.reject(reason)
│   ├── 1.4 then / 1.5 catch / 1.6 finally（实例方法）
│   ├── 1.7 all / 1.8 race（组合器）
│   ├── 1.9 allSettled / 1.10 any（组合器）
│   └── 组合/场景变体（promiseComb 60 + Race 压力/超时/异步操作/多异步/错误，散入各接口 §1.x）
├── 2. 稳定性（PromiseRaceStressTest 压力 / PromiseMultiAsyncOperation 多异步）
├── 3. 性能（race 压力 3 例；无单方法基线基准）
├── 4. 并发安全（PromiseErrorTest async lazy import taskPool 三层嵌套错误；PromiseMultiAsyncOperation）
├── 5. 兼容性与继承（CustomThenable implements PromiseLike 采纳 / thenable 类继承）
└── 6. 资料与文档符合性（无 new→TypeError 契约符合性 / AggregateError.errors 契约 / JS 内建无独立 .md）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 32 文件 / 1356 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | PromiseAllSecondTest.test.ets | 22 | Promise·all 变体 |
| 2 | PromiseAllSettledSecondTest.test.ets | 20 | Promise·allSettled 变体 |
| 3 | PromiseAllSettledTest1.test.ets | 29 | Promise·allSettled 变体 |
| 4 | PromiseAllTest1.test.ets | 29 | Promise·all 变体 |
| 5 | PromiseAnyPortTest.test.ets | 25 | Promise·any 变体 |
| 6 | PromiseAnySecondTest.test.ets | 16 | Promise·any 变体 |
| 7 | PromiseAnyTest1.test.ets | 26 | Promise·any 变体(AggregateError.errors.length) |
| 8 | PromiseAsyncOperationTest.test.ets | 6 | Promise·异步操作 |
| 9 | PromiseErrorTest.test.ets | 8 | Promise·错误(async lazy import taskPool 三层) |
| 10 | PromiseMultiAsyncOperationTest.test.ets | 3 | Promise·多异步操作 |
| 11 | PromiseRaceSecondTest.test.ets | 19 | Promise·race 变体 |
| 12 | PromiseRaceStressTest.test.ets | 3 | Promise·race 压力 |
| 13 | PromiseRaceTest1.test.ets | 26 | Promise·race 变体 |
| 14 | PromiseRejectSecondTest.test.ets | 16 | Promise·reject 变体 |
| 15 | PromiseRejectTest1.test.ets | 20 | Promise·reject 变体 |
| 16 | PromiseResolveSecondTest.test.ets | 3 | Promise·resolve 变体 |
| 17 | PromiseResolveTest1.test.ets | 27 | Promise·resolve 变体 |
| 18 | PromiseSecondTest.test.ets | 17 | Promise·场景变体 |
| 19 | PromiseTest1.test.ets | 20 | Promise·场景变体 |
| 20 | PromiseTimeOutTest.test.ets | 4 | Promise·超时 |
| 21 | promiseAllSettledTest.test.ets | 100 | Promise·allSettled(全类型矩阵) |
| 22 | promiseAllTest.test.ets | 99 | Promise·all(早终止+reason) |
| 23 | promiseAnyTest.test.ets | 82 | Promise·any(AggregateError.errors) |
| 24 | promiseCatchTest.test.ets | 100 | Promise·catch |
| 25 | promiseCombTest.test.ets | 60 | Promise·组合 |
| 26 | promiseFinallyTest.test.ets | 100 | Promise·finally(值保持/throw 覆盖) |
| 27 | promiseRaceTest.test.ets | 78 | Promise·race(fastest settled) |
| 28 | promiseRejectTest.test.ets | 99 | Promise·reject(reason×组合器) |
| 29 | promiseResolveTest.test.ets | 98 | Promise·resolve(thenable 10+ fixture) |
| 30 | promiseTest.test.ets | 100 | Promise·constructor(executor) |
| 31 | promiseThenTest.test.ets | 101 | Promise·then(返回值全类型/PromiseLike) |
| | **合计** | **1356** | 31 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 constructor(executor)

```
constructor(executor)
├── 入参范围覆盖
│   ├── executor 同步执行（resolve/reject 在 executor 内同步调用）
│   ├── 嵌套 new Promise
│   └── Promise pending 不调用 resolve/reject（promiseTest 009）
├── 边界值测试
│   └── 空 resolve / undefined·null reason
├── 异常与非法输入
│   ├── 无 new 调用→TypeError（promiseTest 001）
│   ├── executor 非函数→TypeError（promiseTest 017）
│   └── executor 抛错→reject
├── 返回值与类型验证
│   └── 返回 Promise<T>
├── 组合场景
│   ├── thenable resolved after multiple async operations（promiseTest 049）
│   └── 嵌套 async 函数错误传播（promiseTest 073/081/089）
├── 重复调用/幂等性
│   └── resolve/reject 不可逆（状态固化）
└── 并发跨线程
    └── PromiseErrorTest async lazy import taskPool 三层嵌套错误（间接）
```

- **用例位置**：`promise/promiseTest.test.ets`（100 `SUB_BUILTINS_PROMISE_TEST_*`）+ `PromiseTest1.test.ets`（20）+ `PromiseSecondTest.test.ets`（17）。
- **测了哪些**：executor 同步执行 + 无 new→TypeError 契约符合性 + executor 非函数→TypeError + 嵌套 async 错误传播；无 new→TypeError 为契约核心。

---

## 1.2 Promise.resolve(value)

```
Promise.resolve
├── 入参范围覆盖
│   ├── 非thenable 值（primitive 0001）
│   ├── 已有 Promise 实例（实例复用）
│   ├── thenable（采纳，10+ fixture）
│   └── rejected Promise
├── 边界值测试
│   ├── pending Promise resolve（0009）
│   ├── circular reference object（0017）
│   └── thenable 嵌套
├── 异常与非法输入
│   └── thenable 采纳为 Promise 契约核心（非异常路径）
├── 返回值与类型验证
│   └── resolve 实例复用（已有 Promise 直接返回）
├── 组合场景
│   ├── Promise.resolve in async generator（0025）
│   ├── Promise.resolve with Promise.allSettled（0033）
│   └── 嵌套 Promise.race & Promise.all（0065）
├── 重复调用/幂等性
│   └── resolve/reject 不可逆
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseResolveTest.test.ets`（98 `SUB_BUILTINS_Promise_resolve_TEST_*`：thenable 10+ fixture）+ `PromiseResolveTest1.test.ets`（27）+ `PromiseResolveSecondTest.test.ets`（3）。
- **测了哪些**：非 thenable/已有 Promise/thenable/rejected Promise + thenable 采纳丰富（10+ fixture）+ 实例复用 + 嵌套组合；resolve(thenable) 采纳为 Promise 契约核心。

---

## 1.3 Promise.reject(reason)

```
Promise.reject
├── 入参范围覆盖
│   ├── 直接 reason（null 0100 / string 0300 / boolean 0500 / object 0700 / string[] 0900）
│   ├── Error（1100）/ Promise.resolve（1300）/ new Promise resolve（1500）
│   └── 非 Error / Promise reason
├── 边界值测试
│   └── undefined/null reason
├── 异常与非法输入
│   └── reject 各 reason 类型
├── 返回值与类型验证
│   └── 返回 rejected 状态 Promise
├── 组合场景
│   ├── reject×all/race/allSettled/any/finally/async（1009~1098）
│   ├── Promise.race 早拒绝（1009）
│   └── Promise.all + Promise.any fallback 全 fail 恢复（1098）
├── 重复调用/幂等性
│   └── reject 不可逆（状态固化）
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseRejectTest.test.ets`（99 `SUB_BUILTINS_Promise_reject_TEST_1001~`：reject×全组合器/AggregateError.errors）+ `PromiseRejectTest1.test.ets`（20）+ `PromiseRejectSecondTest.test.ets`（16）。
- **测了哪些**：直接 reason 各类型 + reject×全组合器（all/race/allSettled/any/finally/async）+ AggregateError.errors 内容校验；reject 不可逆。

---

## 1.4 then(onFulfilled, onRejected)

```
then
├── 入参范围覆盖
│   ├── 返回值全类型：normal/无返回/Promise/thenable/boolean/object/array/0/空串/空对象
│   └── onFulfilled/onRejected 省略（状态传播）
├── 边界值测试
│   ├── pending Promise（等待）
│   └── 已 settled
├── 异常与非法输入
│   └── then callback throw→reject
├── 返回值与类型验证
│   ├── 返新 Promise<Awaited<U|E>>
│   └── CustomThenable(PromiseLike) 采纳
├── 组合场景
│   ├── 链式 then / then 嵌套 then 顺序
│   ├── 多次 then 独立执行（009）
│   ├── then 顺序 async 操作（033/041）
│   └── 嵌套 Promise resolution（049）/ 混合 sync/async 错误传播（057）
├── 重复调用/幂等性
│   └── 同 Promise 多次 then 独立执行
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseThenTest.test.ets`（100：返回值全类型/onFulfilled 省略状态传播/CustomThenable(PromiseLike) 采纳/多次 then 独立/pending 等待/嵌套 then 顺序）。
- **测了哪些**：then 返回值全类型 + PromiseLike 采纳 + 多次 then 独立 + 嵌套顺序；无缺口。

---

## 1.5 catch(onRejected)

```
catch
├── 入参范围覆盖
│   ├── executor throw→catch（promiseCatch 001）
│   ├── reject→catch
│   └── onRejected 返值 resolved
├── 边界值测试
│   └── 已 settled
├── 异常与非法输入
│   ├── catch 内抛错需后续 catch 捕获（009）
│   └── 延迟 rejection（017）
├── 返回值与类型验证
│   └── 返 Promise<T|U>
├── 组合场景
│   ├── catch 中段恢复并传播新错误到末尾（041）
│   ├── 链 sync/async 错误一致（049）
│   ├── 嵌套 catch async 恢复（057）
│   ├── Promise.race 异常被 outer catch（065）
│   └── timeout/资源加载失败/微服务链失败（073~097）
├── 重复调用/幂等性
│   └── 同 Promise 多次 catch
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseCatchTest.test.ets`（100 `SUB_BUILTINS_PROMISE_CATCH_TEST_*`）。
- **测了哪些**：executor throw/reject/onRejected 返值 resolved + 链中段恢复 + 嵌套 catch + 真实场景（timeout/资源加载/微服务链）；无缺口。

---

## 1.6 finally(onFinally)

```
finally
├── 入参范围覆盖
│   ├── fulfilled 后执行（001）
│   ├── rejected 后执行
│   └── finally 无参 / 空 callback
├── 边界值测试
│   ├── finally callback 不接收参数（009）
│   └── finally async callback（4900~）
├── 异常与非法输入
│   ├── finally throw 覆盖 fulfilled/rejected
│   └── finally throw 非 Error
├── 返回值与类型验证
│   ├── 返 Promise<Awaited<T>>（值保持，017/025）
│   └── finally 不覆盖 catch 返回值（025）
├── 组合场景
│   ├── 多 finally 顺序（6500~）
│   ├── finally+catch、finally+race/all mixed
│   └── finally+async/await（4100~8100）
├── 重复调用/幂等性
│   └── finally 每实例一次
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseFinallyTest.test.ets`（100 `SUB_BUILTINS_Promise_finally_TEST_*`：fulfilled/rejected/返回值忽略/throw 覆盖/值保持/多 finally 顺序/async callback/race·all mixed）。
- **测了哪些**：finally 全语义 + 值保持 + throw 覆盖 + 多 finally 顺序 + async callback；❌ finally on unhandled rejection 仅测 finally 执行，非宿主事件（见 §7.2）。

---

## 1.7 all(iterable)

```
all
├── 入参范围覆盖
│   ├── 全 resolve（promiseAll 001）
│   ├── 混合 resolve+reject
│   ├── 非 Promise 值 / thenable
│   └── 大数量（009）
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── resolve to null/undefined（017）
├── 异常与非法输入
│   └── 首拒即拒（早终止，reason `err.message==='first'`）
├── 返回值与类型验证
│   └── 返 Promise<Array<Awaited>>（保序）
├── 组合场景
│   ├── catch rethrow 不同 error（025/033）
│   ├── 嵌套 Promise.all + async catches（041）
│   ├── async error transformation chain（049）
│   ├── cascading finally blocks（066）
│   └── Promise.resolve in nested chains（082/090）
├── 重复调用/幂等性
│   └── 同 iterable 多次 all 一致
└── 并发跨线程
    └── PromiseMultiAsyncOperation 多异步（间接）
```

- **用例位置**：`promise/promiseAllTest.test.ets`（99 `SUB_BUILTINS_Promise_all_TEST_*`：首拒即拒+reason identity/thenable/大数量）+ `PromiseAllTest1.test.ets`（29）+ `PromiseAllSecondTest.test.ets`（22）+ `PromiseMultiAsyncOperationTest.test.ets`（3）+ `PromiseAsyncOperationTest.test.ets`（6）。
- **测了哪些**：保序 + 早终止 + reason identity（`err.message==='first'`）+ thenable + 大数量 + 嵌套/catch rethrow/cascading finally 组合；all 早终止+reason identity 覆盖。

---

## 1.8 race(iterable)

```
race
├── 入参范围覆盖
│   ├── fastest resolve（promiseRace 001）
│   ├── fastest reject
│   ├── 非 Promise 值（005）
│   ├── 不同类型 iterable（string|number|boolean|bigint|object|promise，001）
│   └── 立即 vs 延迟（011）
├── 边界值测试
│   ├── 空 iterable（never settles，007）
│   ├── 单元素
│   └── 延迟递增 / 快拒绝慢解析
├── 异常与非法输入
│   ├── 构造期抛错（009）
│   └── fastest拒绝优先
├── 返回值与类型验证
│   └── 返fastest settled
├── 组合场景
│   ├── 链式 promise varying lengths（013）
│   ├── 多 async 步骤 resolve（019）
│   ├── error handlers（026）/ 动态链（055）
│   ├── async retry/backoff（065）/ circuit breakers（085）
│   └── 嵌套 race/any（170~190）
├── 重复调用/幂等性
│   └── race 压力 1000 promises（PromiseRaceStress 4600~4800）
└── 并发跨线程
    └── PromiseMultiAsyncOperation 间接
```

- **用例位置**：`promise/promiseRaceTest.test.ets`（78 `SUB_BUILTINS_Promise_race_TEST_*`：fastest resolve/reject/立即 vs 延迟/非 Promise）+ `PromiseRaceTest1.test.ets`（26）+ `PromiseRaceSecondTest.test.ets`（19）+ `PromiseRaceStressTest.test.ets`（3 压力）+ `PromiseTimeOutTest.test.ets`（4 超时）。
- **测了哪些**：fastest settled + 立即 vs 延迟 + 非 Promise + 压力 1000 + 超时 + thenable 变体；race fastest settled 覆盖。

---

## 1.9 allSettled(iterable)

```
allSettled
├── 入参范围覆盖
│   ├── 全 resolve / 全 reject / 混合（001）
│   ├── 非 Promise 值
│   ├── 空 iterable（→空数组 resolve）
│   ├── Set / generator / 嵌套
│   └── bigint/symbol/date/array/function/class 实例
├── 边界值测试
│   ├── 空数组→空数组 resolve
│   ├── 单 resolve/reject
│   └── 混合延迟 rejected 不同 timing（033）
├── 异常与非法输入
│   └── 全 reject（仍 resolve，非 reject）
├── 返回值与类型验证
│   └── 返 Promise<PromiseSettledResult[]>（fulfilled{status,value}/rejected{status,reason} 保序）
├── 组合场景
│   ├── 多级嵌套 allSettled + async delays（041）
│   ├── timing priority：late resolve vs early reject（049）
│   ├── 4-level nested async generator（081）
│   └── allSettled nested in Promise.race（097）
├── 重复调用/幂等性
│   └── 同 iterable 多次 allSettled 一致
└── 并发跨线程
    └── PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseAllSettledTest.test.ets`（100 `SUB_BUILTINS_Promise_allSettled_TEST_*`：混合/全 resolve/全 reject/非 Promise/空 iterable/对象/function/Set/generator/嵌套/custom-error/symbol/bigint/date）+ `PromiseAllSettledTest1.test.ets`（29）+ `PromiseAllSettledSecondTest.test.ets`（20）。
- **测了哪些**：全类型矩阵 + 保序 + fulfilled{status,value}/rejected{status,reason} + 多级嵌套/timing；allSettled 全类型矩阵覆盖充分。

---

## 1.10 any(iterable)

```
any
├── 入参范围覆盖
│   ├── 全 resolve→首 resolve（001）
│   ├── 部分拒绝
│   ├── 全拒→AggregateError（013/019）
│   ├── 非 Promise 值
│   ├── pending+resolved（007）
│   └── date/bigint/长延迟对象（032/038）
├── 边界值测试
│   ├── 空 iterable→reject AggregateError
│   ├── 单 resolve/reject
│   └── 首 resolve 延后
├── 异常与非法输入
│   └── 全拒→AggregateError（errors 数组内容校验）
├── 返回值与类型验证
│   ├── 返首 resolve
│   └── AggregateError.errors.length + [0].message + instanceof TypeError/CustomError + deepEquals[404,{code:500},null]
├── 组合场景
│   ├── sequential creation affecting resolution order（045）
│   ├── promises in async loop（052）
│   ├── nested Promise.any cascading（082）
│   └── any + allSettled 组合（094）
├── 重复调用/幂等性
│   └── 同 iterable 多次 any 一致
└── 并发跨线程
    └── PromiseAnyPortTest taskpool（25 例）+ PromiseErrorTest 间接
```

- **用例位置**：`promise/promiseAnyTest.test.ets`（82 `SUB_BUILTINS_Promise_any_TEST_*`：全 resolve/部分/全拒 AggregateError/首 resolve 延后/非 Promise/空 reject/AggregateError.errors 内容校验）+ `PromiseAnyTest1.test.ets`（26，AggregateError.errors.length）+ `PromiseAnySecondTest.test.ets`（16）+ `PromiseAnyPortTest.test.ets`（25 taskpool）。
- **测了哪些**：首 resolve + 全拒 AggregateError + errors 内容校验（length/message/instanceof/deepEquals）+ 嵌套 cascading + taskpool 跨线程；AggregateError.errors 数组内容覆盖充分。

> 注：组合场景文件 `promiseCombTest.test.ets`（60 `SUB_BUILTINS_Promise_*_combination/nested/async_combination_*`：AsyncAwaitComb 6~16 级嵌套 / NestedPromise 5~10 级 / PromiseAsyncAwait 2~7 级）覆盖多组合器串联（all/race/allSettled/any/then/catch/finally + async/await 混合），其用例散入上述各接口的「组合场景」分支；`PromiseErrorTest.test.ets`（7 `SUB_PROMISE_ERROR_TEST_*`：async lazy import taskPool 三层嵌套错误）覆盖 Promise 跨线程错误传播，散入各接口的「并发跨线程」分支。

---

# 2. 稳定性
- **用例位置**：`PromiseRaceStressTest`（3 例压力）+ `PromiseMultiAsyncOperationTest`（3 多异步操作）+ 各 100 例深套件隐含稳定性。
- **测了哪些**：race 压力 + 多异步操作稳定性 + 各方法 100 例深套件隐含稳定性；❌ 无独立长时运行/循环创建销毁压测。

# 3. 性能
- **用例位置**：`PromiseRaceStressTest`（race 压力 3 例）。
- **测了哪些**：race 压力性能；❌ Promise 单方法基线性能基准未见（如 then 单次延迟、all 大数量吞吐统计，见 §7.4）。

# 4. 并发安全
- **用例位置**：`PromiseErrorTest`（7 例：async lazy import taskPool 三层嵌套错误）+ `PromiseMultiAsyncOperationTest`（多异步操作）。
- **测了哪些**：async lazy import × taskPool 三层嵌套错误传播 + 多异步操作组合；Promise 跨线程传递语义覆盖较浅（PromiseErrorTest 7 例）。

# 5. 兼容性与继承
- **用例位置**：`promiseThenTest`（CustomThenable implements PromiseLike 行 123 采纳）+ `promiseResolveTest`（level1Thenable/nestedRejectThenable 等 thenable 类继承）。
- **测了哪些**：CustomThenable implements PromiseLike 采纳 + thenable 类继承；❌ 无 Promise 子类化用例（构造器 Species 派生未见）。

# 6. 资料与文档符合性
- **用例位置**：`promiseTest`（无 new→TypeError 契约符合性、executor 同步执行）+ `promiseAnyTest`（AggregateError.errors 契约符合性）+ `static/Promise.static.d.ets`（ArkTS 静态 Promise 形状，独立体系）。
- **测了哪些**：无 new→TypeError 契约符合性 + executor 同步执行 + AggregateError.errors 契约符合性；JS 内建无独立 SDK 文档（.md），契约以 `.d.ts` 为authoritative。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor(executor) | ✅(100) | ✅(空/undefined) | ✅(无 new→TypeError) | ✅(Promise<T>) | ✅(嵌套) | ✅(状态固化) | 🟡(见 §1.5) |
| resolve(静态) | ✅(98+27+3) | ✅(thenable 嵌套) | ✅(thenable 采纳) | ✅(实例复用) | ✅(reject×全组合器) | ✅ | 🟡 |
| reject(静态) | ✅(99+16+20) | ✅(null/undefined) | ✅(各 reason 类型) | ✅(rejected) | ✅(×all/race/...) | ✅(不可逆) | 🟡 |
| then | ✅(100) | ✅(pending/settled) | ✅(callback throw) | ✅(新 Promise/Awaited) | ✅(链式/嵌套) | ✅(多次独立) | 🟡 |
| catch | ✅(100) | ✅(settled) | ✅(executor throw) | ✅(Promise<T|U>) | ✅(finally+catch) | ✅ | 🟡 |
| finally | ✅(100) | ✅(空 callback) | ✅(throw 覆盖) | ✅(值保持) | ✅(多 finally 顺序) | ✅(每实例一次) | 🟡 |
| all | ✅(99+29+22) | ✅(空/单/大数量) | ✅(首拒即拒) | ✅(保序 Array) | ✅(reject×all) | ✅ | 🟡(MultiAsync) |
| race | ✅(78+26+19+3) | ✅(空/立即 vs 延迟) | ✅(fastest拒绝优先) | ✅(fastest settled) | ✅(thenable) | ✅ | 🟡(Stress) |
| allSettled | ✅(100+29+20) | ✅(空→[]) | ✅(全 reject) | ✅(SettledResult[]保序) | ✅(全类型矩阵) | ✅ | 🟡 |
| any | ✅(82+26+16+25) | ✅(空→AggregateError) | ✅(全拒 AggregateError) | ✅(首 resolve) | ✅(errors 内容校验) | ✅ | 🟡 |
| promiseComb | ✅(60) | ✅(空/单/嵌套) | ✅(reject 传播) | ✅(保序/类型) | ✅(多串联) | ✅ | ✅(PromiseError) |

## 7.2 逐接口遗漏确认（对照 `lib.es5/es2015/es2018/es2020/es2021.promise.d.ts`）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ts） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `new Promise(executor)` | executor 同步执行，无 new→TypeError | ✅ 覆盖：executor 同步执行 + 无 new→TypeError 契约符合性。无缺口。 |
| 2 | `Promise.resolve(value)` | thenable 采纳，已有 Promise 实例复用 | ✅ 覆盖：非 thenable/已有 Promise/thenable/rejected Promise + 10+ thenable fixture。无缺口。 |
| 3 | `Promise.reject(reason)` | 返 rejected Promise | ✅ 覆盖：直接 reason/非 Error/Promise reason + ×全组合器。无缺口。 |
| 4 | `then(onFulfilled, onRejected)` | 返新 Promise<Awaited>，PromiseLike 采纳 | ✅ 覆盖：返回值全类型 + onFulfilled 省略状态传播 + CustomThenable(PromiseLike) 采纳 + 多次 then 独立 + 嵌套顺序。无缺口。 |
| 5 | `catch(onRejected)` | 返 Promise<T|U> | ✅ 覆盖：executor throw/reject/onRejected 返值 resolved。无缺口。 |
| 6 | `finally(onFinally)` | 返 Promise<Awaited<T>>（值保持），throw 覆盖 | ✅ 覆盖：fulfilled/rejected/返回值忽略/throw 覆盖/值保持/多 finally 顺序/async callback。❌ **finally on unhandled rejection 仅测 finally 执行，非宿主事件**（宿主 unhandledrejection 事件语义未测，SUP_PROMISE_FINALLY_UNHANDLED_001）。 |
| 7 | `all(iterable)` | 返 Promise<Array<Awaited>>（保序），首拒即拒 | ✅ 覆盖：保序 + 早终止 + reason identity（`err.message==='first'`）+ thenable + 大数量。无缺口。 |
| 8 | `race(iterable)` | 返fastest settled | ✅ 覆盖：fastest resolve/reject + 立即 vs 延迟 + 非 Promise + 压力。无缺口。 |
| 9 | `allSettled(iterable)` | 返 Promise<PromiseSettledResult[]>（保序） | ✅ 覆盖：全类型矩阵 + 保序 + fulfilled{status,value}/rejected{status,reason}。无缺口。 |
| 10 | `any(iterable)` | 返首 resolve，全拒→AggregateError | ✅ 覆盖：首 resolve + 全拒 AggregateError + errors 内容校验（length/message/instanceof/deepEquals）。无缺口。 |
| 11 | `AggregateError` | errors 数组 | ✅ 覆盖：errors.length + [0].message + instanceof TypeError/CustomError + deepEquals[404,{code:500},null]。无缺口。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **finally on unhandled rejection**：finally 在 unhandled rejection 下仅测 finally 执行（promiseFinallyTest），宿主 unhandledrejection 事件语义未测。⚠️ 部分缺口（宿主事件非 Promise 实例方法契约，SUP_PROMISE_FINALLY_UNHANDLED_001）。
2. **Promise 子类化 Species 派生**：then/all/race 等应通过 `[Symbol.species]` 决定返回构造器；本套件无 Promise 子类化用例，species 派生未测。❌ 组合缺口（SUP_PROMISE_SPECIES_001）。
3. **Promise 跨线程传递**：PromiseErrorTest 7 例覆盖 async lazy import taskPool 三层嵌套错误传播，但 Promise 实例跨 Worker/TaskPool 引用传递的 settled 可见性断言较浅。⚠️ 部分缺口。
4. **Promise 静态 vs 动态形状**：`static/Promise.static.d.ets`（L181 ArkTS 静态 Promise）为独立体系，本套件测动态 Promise（`lib.es5.d.ts`）；静态 Promise 形状未在本套件覆盖（属另一套件职责）。⚠️ 范围边界。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **finally unhandled rejection 契约**：`.d.ts` finally 声明返 Promise<Awaited<T>>（值保持），但 unhandledrejection 宿主事件语义未测。建议资料侧在 `.md` 注明 finally 与宿主 unhandledrejection 事件的关系，测试侧补 finally 在 unhandled rejection 下的事件语义用例（SUP_PROMISE_FINALLY_UNHANDLED_001）。
2. **Promise 单方法基线性能基准**：`.md` 无 Promise 性能基准声明，本套件仅 race 压力 3 例，无 then/all 大数量吞吐统计。建议测试侧补单方法基线性能基准（SUP_PROMISE_PERF_BASELINE_001）。
3. **AggregateError.errors 契约符合性**：`promiseAnyTest` 已覆盖 errors.length/message/instanceof/deepEquals，契约符合性充分。建议资料侧保留 errors 数组语义声明，无需补。
4. **JS 内建无独立 `.md`**：Promise 为 JS 内建，无独立 SDK `.md`（动态），契约以 `lib.*.promise.d.ts` 为authoritative；静态 Promise 见 `static/Promise.static.d.ets`（另一体系）。建议保留该契约来源约定。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 1 | SUP_PROMISE_SPECIES_001 | Promise 子类化 Species 派生；契约符号未测，属符合性硬缺口。 |
| **P2** | 3 | SUP_PROMISE_FINALLY_UNHANDLED_001、SUP_PROMISE_PERF_BASELINE_001、Promise 跨线程 settled 可见性 | finally unhandled 事件 / 性能基准 / 跨线程可见性；非阻断但提升套件质量。 |
| **合计** | **4 新增** | | P1=1 / P2=3。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | executor/resolve/reject reason 全类型、then 返回值全类型、all/race/allSettled/any iterable 全形态 | promiseTest executor、promiseThenTest 返回值全类型、promiseAllSettled 全类型矩阵 |
| ②边界值测试 | 空 resolve/undefined/null reason、thenable 嵌套、空数组、单元素、pending/settled、finally 空 callback | promiseResolveTest thenable 嵌套、promiseAllTest 空数组、promiseFinallyTest 空 callback |
| ③异常与非法输入 | 无 new→TypeError、executor throw→reject、then callback throw→reject、finally throw 覆盖、all 首拒即拒、any 全拒 AggregateError | promiseTest 无 new→TypeError、promiseFinallyTest throw 覆盖、promiseAny AggregateError |
| ④返回值与类型验证 | Promise<T>、resolve 实例复用、then 返新 Promise<Awaited>、finally 值保持、all 保序 Array、allSettled SettledResult[]、any 首 resolve | 各深套件返回值断言、AggregateError.errors 内容校验 |
| ⑤组合场景 | resolve(thenable) 采纳、reject×全组合器、链式 then、多 finally 顺序、PromiseChain、promiseComb 多串联、async lazy import taskPool 三层 | promiseResolveTest thenable 采纳、promiseFinallyTest 多 finally、promiseCombTest 60、PromiseErrorTest 三层 |
| ⑥重复调用幂等性 | resolve/reject 不可逆（状态固化）、多次 then 独立执行、finally 每实例一次 | promiseTest 状态固化、promiseThenTest 多次 then 独立 |
| ⑦并发跨线程 | async lazy import × taskPool 三层嵌套错误、PromiseMultiAsyncOperation 多异步 | PromiseErrorTest 7 例、PromiseMultiAsyncOperationTest |
