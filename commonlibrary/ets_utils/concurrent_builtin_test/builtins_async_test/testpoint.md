# builtins_async_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/builtins_async_test/entry/src/ohosTest/ets/test/` 下 **19** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **1304** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。本套件为 async/await 主套件，并承载 Promise/SharedArrayBuffer 的 type 守卫与链式生态（跨特性归位）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
builtins_async_test（async/await 主套件 + Promise/SAB 生态归位）
├── 1. 接口测试
│   ├── 1.1 async function / await（含 AsyncFir/asyncFunction/Generics/Boundary/Interop/Sec/Advanced/RealWorld/Performance/Nesting）
│   ├── 1.2 async generator（async function*，yield/throw/return）
│   ├── 1.3 async iterator / for await...of
│   ├── 1.4 type.isAsyncFunction
│   ├── 1.5 promisify
│   ├── 1.6 callbackWrapper
│   ├── 1.7 type.isPromise（跨特性归位）
│   ├── 1.8 PromiseChain（跨特性归位）
│   └── 1.9 type.isSharedArrayBuffer（跨特性归位）
├── 2. 稳定性（深嵌套 10 层/100 并发/50 顺序 await/rapid re-exec/内存清理）
├── 3. 性能（sequential-100/memory/rapid-creation/chain/complex-object）
├── 4. 并发安全（AsyncNesting lazy import × TaskPool 三层嵌套）
├── 5. 兼容性与继承（async 类方法继承/泛型约束/全语言源 .ets/.ts/.js/namespace/generic/re-export/interface-abstract）
└── 6. 资料与文档符合性（async 语法门禁为编译期；type 守卫契约见 @arkts.utils.d.ets）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 19 文件 / 1304 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | AsyncNestingTest.test.ets | 7 | async/await·嵌套(lazy import×TaskPool) |
| 2 | AsyncAdvancedTest.test.ets | 3 | async/await·高级类型 |
| 3 | AsyncBoundaryTest.test.ets | 16 | async/await·边界/错误传播/稳定性 |
| 4 | AsyncFirTest.test.ets | 80 | async/await·语法声明强制校验 |
| 5 | AsyncGenericsTest.test.ets | 23 | async/await·泛型 |
| 6 | AsyncInteropTest.test.ets | 17 | async/await·互操作 |
| 7 | AsyncPerformanceTest.test.ets | 17 | async/await·性能 |
| 8 | AsyncRealWorldTest.test.ets | 16 | async/await·真实世界场景 |
| 9 | AsyncSecTest.test.ets | 55 | async/await·安全/错误 bubbling |
| 10 | asyncFunctionTest.test.ets | 100 | async/await·函数语法+await |
| 11 | asyncGeneratorTest.test.ets | 100 | async/await·generator(yield/throw/return) |
| 12 | asyncIteratorTest.test.ets | 100 | async/await·iterator(for-await) |
| 13 | CallbackWrapper.test.ets | 70 | async 生态·callbackWrapper |
| 14 | IsAsyncFunction.test.ets | 135 | async 生态·type.isAsyncFunction |
| 15 | IsPromise.test.ets | 137 | Promise 生态·type.isPromise(跨特性归位) |
| 16 | IsSharedArrayBuffer.test.ets | 114 | SAB 生态·type.isSharedArrayBuffer(跨特性归位) |
| 17 | PromiseChain.test.ets | 218 | Promise 生态·PromiseChain(跨特性归位) |
| 18 | Promisify.test.ets | 96 | async 生态·promisify |
| | **合计** | **1304** | 18 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 async function / await

> 语法特性：`async function`/`async () =>`/`async method`/`await`/`try-catch-finally`+await/错误传播。无独立 `.d.ets`（语法语义）。本节聚合 async/await 在语法/泛型/边界/互操作/安全/高级/真实世界/性能/嵌套各场景文件。

```
async function / await
├── 入参范围覆盖
│   ├── 无参/带参/默认参/剩余参/泛型参（asyncFunctionTest 001~ / AsyncFirTest 0007/0019/0031）
│   ├── await 被等待对象：Promise/同步值/thenable/多个（asyncFunctionTest 041/049）
│   └── async 箭头/IIFE/类实例·静态方法（AsyncFirTest 0002~0006）
├── 边界值测试
│   ├── 无返回→Promise.resolve(undefined)
│   ├── 返回 BigInt/Symbol/对象/数组/typed-array
│   ├── 深嵌套 10 层（AsyncBoundary 001）/100 并发（003）/50 顺序 await（004）
│   └── 超长串（007）/深对象（008）/循环 Promise 链（010）
├── 异常与非法输入
│   ├── async 内 throw→reject、await 抛错（AsyncSec 0017）
│   ├── rejected Promise await→reject
│   ├── 深嵌套层错误（AsyncBoundary 005）/Promise.all 内 rejection（012）
│   ├── uncaught 异常 bubbling（AsyncSec，被 outer 捕获非宿主事件）
│   └── 未声明 async 用 await→编译错（语法门禁，AsyncFirTest 0001）
├── 返回值与类型验证
│   ├── 返回 Promise<T>、await 解包
│   ├── 多返回路径/立即解析（AsyncBoundary）
│   └── uncaught 异常对象 Type & Properties（AsyncSec）
├── 组合场景
│   ├── Promise.all/race/allSettled in async（asyncFunctionTest 057/081）
│   ├── 嵌套 async 调 async、条件 await（asyncFunctionTest 025）
│   ├── then/catch 混用、Promise 构造器包装 async（AsyncInterop 005/006）
│   ├── setTimeout/reduce/filter 互操作（AsyncInterop 007/008/010）
│   ├── 真实世界：caching/pipeline/batch/debounce/rate-limit（AsyncRealWorld 002~016）
│   └── 高级类型 Partial/Required/递归类型（AsyncAdvanced 004/006/011）
├── 重复调用/幂等性
│   ├── rapid re-execution（AsyncBoundary 006）
│   ├── 内存清理多 Promise（AsyncBoundary 013）
│   └── sequential-100/memory/rapid-creation/chain/complex（AsyncPerformance 002~014）
└── 并发跨线程
    └── AsyncNesting lazy import × asyncLock/promise/async/setTimeout/taskPool 三层嵌套（7 例 0100~0800）
```

- **用例位置**：`async/asyncFunctionTest.test.ets`（100 `SUB_BUILTINS_asyncFunction_TEST_001~100`）+ `async/AsyncFirTest.test.ets`（80 `ASYNC_FIR_TEST_0001~0080`）+ `async/AsyncGenericsTest.test.ets`（23）+ `async/AsyncBoundaryTest.test.ets`（16）+ `async/AsyncInteropTest.test.ets`（17）+ `async/AsyncSecTest.test.ets`（54）+ `async/AsyncAdvancedTest.test.ets`（3）+ `async/AsyncRealWorldTest.test.ets`（16）+ `async/AsyncPerformanceTest.test.ets`（17）+ `AsyncNestingTest.test.ets`（7 `SUB_ASYNC_NESTING_TEST_0100~0800`）。
- **测了哪些**：语法声明强制（必须显式 async 才能 await，编译期门禁）+ 返回值解包 + await 各被等待对象 + 泛型类型流 + 错误传播链/uncaught bubbling + 深嵌套 10 层/100 并发/50 顺序 await + 真实世界 pipeline + 性能 sequential-100/rapid-creation + lazy import ×5 异步原语三层嵌套；性能/稳定性覆盖充分。

---

## 1.2 async generator（async function*，yield/throw/return）

```
async generator
├── 入参范围覆盖
│   ├── yield 值 / yield Promise
│   └── yield 多种值类型
├── 边界值测试
│   ├── 空 generator
│   ├── 单 yield
│   └── 深嵌套（4 层）、多状态
├── 异常与非法输入
│   ├── generator throw() 注入错误并被 outer catch
│   └── uncaught 错误传播
├── 返回值与类型验证
│   ├── AsyncGenerator<T>
│   └── next()/return()/throw() 返回 {value, done}
├── 组合场景
│   ├── errorPropagationChain
│   ├── returnValuePropagation
│   └── uncaughtErrorGenerator
├── 重复调用/幂等性
│   ├── 连续 throw 序列
│   └── return 后再调用
└── 并发跨线程
    └── 间接（generator 跨 TaskPool 较少）
```

- **用例位置**：`async/asyncGeneratorTest.test.ets`（100 `SUB_BUILTINS_AsyncGenerator_TEST_001~100`）。
- **测了哪些**：yield 产出、throw() 注入错误并被 outer catch、return() 提前终止、连续 throw 序列、uncaught 错误、多级状态传播；desc 多为占位 "test"（信息密度低，见 §7.4）。

---

## 1.3 async iterator / for await...of

```
async iterator / for-await
├── 入参范围覆盖
│   ├── for-await 各种可迭代源
│   └── yield* 委托
├── 边界值测试
│   ├── 空可迭代
│   ├── 单元素
│   └── 深嵌套可迭代
├── 异常与非法输入
│   └── 迭代中 throw 传播
├── 返回值与类型验证
│   ├── AsyncIterator<T>
│   └── next() 返回 {value, done}
├── 组合场景
│   └── for-await 内 await 异步源
├── 重复调用/幂等性
│   └── 多次遍历同一可迭代
└── 并发跨线程
    └── 间接
```

- **用例位置**：`async/asyncIteratorTest.test.ets`（100 `SUB_BUILTINS_AsyncIterator_TEST_001~100`）。
- **测了哪些**：for-await 覆盖较全（100 例）；desc 多为占位 "test"（信息密度低，见 §7.4）。

---

## 1.4 type.isAsyncFunction(value)

```
type.isAsyncFunction
├── 入参范围覆盖
│   ├── async 声明/箭头/类方法（getter/setter 后）
│   └── 全语言源：.ets/.ts/.js/namespace/generic/re-export/interface-abstract
├── 边界值测试
│   ├── 同步函数→false
│   ├── getter/setter 干扰
│   └── 多 getter/setter + async 方法
├── 异常与非法输入
│   └── 非函数入参
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── true 仅 async 函数
├── 组合场景
│   └── @Sendable async 箭头 / Sendable 静态方法 / 抽象实现 async 方法（0100/1020/0890）
├── 重复调用/幂等性
│   └── 同一函数多次检测一致
└── 并发跨线程
    └── 同步守卫，无跨线程语义（⑦❌ 为契约特性，非缺口）
```

- **用例位置**：`isAsyncFunction/IsAsyncFunction.test.ets`（135 `SUB_COMMONLIBRARY_UTIL_ISASYNCFUNCTION_0100~`：全语言源矩阵）。
- **测了哪些**：type 守卫对 async 函数判定 + getter/setter 干扰 + 全语言源（.ets/.ts/.js/namespace/generic/re-export/interface-abstract）× 全返回类型矩阵；无缺口。

---

## 1.5 promisify(fn)

```
promisify
├── 入参范围覆盖
│   ├── BasicCallbackConversion（0100）/ ThreeParamCallback（0200）
│   ├── ObjectLiteralMethod（2000）/ AssignedFunction（2800）
│   └── 全语言源：TS/namespace/Map 参数（TSCallbackClassMethod 10200/NamespaceImport 15600/MapParam 20100）
├── 边界值测试
│   ├── AsyncAwait 转换（4900）
│   ├── CustomErrorFirst（5900）
│   └── TaskPoolPromisify（7700）/ SendableReturnType（8900）
├── 异常与非法输入
│   └── 非法回调签名/回调抛错异常路径未见显式断言（⚠️ SUP_ASYNC_PROMISIFY_ERR_001）
├── 返回值与类型验证
│   └── 返回 Promise（回调→Promise 转换）
├── 组合场景
│   ├── 回调→Promise 转换链
│   └── concurrent calls 10 并发（19100）
├── 重复调用/幂等性
│   └── 同函数多次 promisify 一致
└── 并发跨线程
    └── TaskPoolPromisify（7700）跨 TaskPool
```

- **用例位置**：`promisify/Promisify.test.ets`（96 `SUB_COMMONLIBRARY_UTIL_PROMISIFY_0100~` + `SUB_COMMONLIBRARY_UTIL_PROMISIFY_NODEJS_*`）。
- **测了哪些**：回调→Promise 转换 + 全返回类型 + 全语言源 + TaskPool 并发 + Map 参数；🟡 异常路径（非法回调签名/回调抛错）未见显式断言（SUP_ASYNC_PROMISIFY_ERR_001）。

---

## 1.6 callbackWrapper(fn)

```
callbackWrapper
├── 入参范围覆盖
│   └── async 函数返回 number/object/array/boolean 全返回类型
├── 边界值测试
│   └── 各返回类型边界
├── 异常与非法输入
│   └── 异常路径未见显式断言（⚠️ SUP_ASYNC_CALLBACKWRAPPER_ERR_001）
├── 返回值与类型验证
│   └── 包裹后返回各类型值
├── 组合场景
│   └── async 函数 + 回调包装组合
├── 重复调用/幂等性
│   └── 同函数多次包裹一致
└── 并发跨线程
    └── 同步守卫/包装，无跨线程语义
```

- **用例位置**：`callbackWrapper/CallbackWrapper.test.ets`（70 `SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_*`）。
- **测了哪些**：async 函数返回 number/object/array/boolean 全返回类型包裹；🟡 异常路径未见显式断言（SUP_ASYNC_CALLBACKWRAPPER_ERR_001）。

---

## 1.7 type.isPromise(value)（跨特性归位于本套件）

```
type.isPromise
├── 入参范围覆盖
│   ├── Pending 态 Promise（0100）
│   ├── Fulfilled 态（Resolve/ResolveChained 0980/1090）
│   └── Rejected 态（Reject）
├── 边界值测试
│   ├── NormalMethodAfterGetSet（0210）
│   ├── MultiLevelThen（0540）
│   ├── AllSinglePromise（0650）
│   └── MultiDecoratorStack（0870）
├── 异常与非法输入
│   └── 非 Promise（Undefined 0430）→false
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── Promise→true、非 Promise→false
├── 组合场景
│   ├── FromFunctionReturn（0320）
│   └── GenericClass（1200）/ SingleThen（1310）
├── 重复调用/幂等性
│   └── 同 Promise 多次 isPromise 一致
└── 并发跨线程
    └── 同步守卫，无跨线程语义
```

- **用例位置**：`isPromise/IsPromise.test.ets`（137 `SUB_COMMONLIBRARY_UTIL_ISPROMISE_0100~`：Pending/Fulfilled/Rejected/Resolve/Reject 全态）。
- **测了哪些**：type.isPromise 全态判定（Pending/Fulfilled/Rejected）+ 非 Promise→false + 多场景（MultiLevelThen/AllSinglePromise/MultiDecoratorStack/GenericClass）；无缺口。

---

## 1.8 PromiseChain（跨特性归位于本套件）

```
PromiseChain
├── 入参范围覆盖
│   └── 全值类型链：string/number/object/array/boolean 逐层传递
├── 边界值测试
│   ├── 空链
│   ├── 单层
│   └── 深链
├── 异常与非法输入
│   └── 非 Promise 值入链行为
├── 返回值与类型验证
│   └── 链每层入参类型校验
├── 组合场景
│   └── string/number/object/array/boolean 值传递每层（全值类型矩阵）
├── 重复调用/幂等性
│   └── 同链多次执行一致
└── 并发跨线程
    └── 同步守卫，无跨线程语义
```

- **用例位置**：`promise/PromiseChain.test.ets`（218 `SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0100~`：全值类型逐层传递）。
- **测了哪些**：全值类型（string/number/object/array/boolean）逐层传递；无缺口。

---

## 1.9 type.isSharedArrayBuffer(value)（跨特性归位于本套件）

```
type.isSharedArrayBuffer
├── 入参范围覆盖
│   ├── SAB create / 特定 size
│   ├── zero / large size
│   ├── slice
│   └── view.buffer（int8/16/uint8）
├── 边界值测试
│   ├── zero size→true
│   ├── large→true
│   └── slice→true
├── 异常与非法输入
│   ├── DataView→false
│   └── ArrayBuffer→false
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── SAB→true、非 SAB→false
├── 组合场景
│   ├── view.buffer 链
│   └── export/re-export/namespace/generic/interface-abstract 源
├── 重复调用/幂等性
│   └── 同 SAB 多次检测一致
└── 并发跨线程
    └── 同步守卫，无跨线程语义
```

- **用例位置**：`isSharedArrayBuffer/IsSharedArrayBuffer.test.ets`（114 `SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0100~`：create/size/zero/large/slice/view.buffer/DataView→false + TS/JS/export/re-export/namespace/generic/interface-abstract 源）。
- **测了哪些**：SAB 各形态→true + DataView/ArrayBuffer→false + 全语言源矩阵；zero-size SAB→true 专例；无缺口。

---

# 2. 稳定性
- **用例位置**：`AsyncBoundaryTest`（深嵌套 10 层/超大数组/100 并发/50 顺序 await/recursive Promise 链/cyclic chain/内存清理多 Promise）+ `AsyncPerformanceTest`（sequential-100/memory/rapid creation/chain/complex）+ `AsyncNestingTest`（lazy import 三层嵌套 ×5 异步原语）+ `AsyncRealWorldTest`（批量/限流/防抖）。
- **测了哪些**：深嵌套 10 层错误传播稳定性 + 100 并发/50 顺序 await + recursive/cyclic Promise 链 + 内存清理多 Promise + rapid re-execution；稳定性覆盖充分。

# 3. 性能
- **用例位置**：`AsyncPerformanceTest`（17 例：sequential-100/memory/rapid-creation/chain/complex-object）+ `AsyncRealWorldTest`（rate-limit/debounce/batch）+ 各 100 例深套件隐含吞吐。
- **测了哪些**：sequential-100 顺序 await 吞吐 + rapid creation 内存 + chain/complex-object 性能 + rate-limit/debounce/batch 真实世界场景性能。

# 4. 并发安全
- **用例位置**：`AsyncNestingTest`（7 例：lazy import × asyncLock/promise/async/setTimeout/taskPool 三层嵌套）。
- **测了哪些**：lazy import × TaskPool 三层嵌套下 async 原语（asyncLock/promise/async/setTimeout/taskPool）的并发组合安全；type 守卫为同步，无跨线程语义。

# 5. 兼容性与继承
- **用例位置**：`AsyncInteropTest`（async 函数+类继承）+ `AsyncGenericsTest`（泛型约束）+ `isAsyncFunction`/`promisify`/`callbackWrapper`/`isPromise`/`isSharedArrayBuffer`（interface-abstract/namespace/generic/re-export/export 源矩阵：.ets/.ts/.js）。
- **测了哪些**：async 函数类继承 + 泛型约束 + 多语言源矩阵（.ets/.ts/.js/namespace/generic/re-export/interface-abstract）× 全返回类型；type 守卫对多语言源 async 函数判定一致性。

# 6. 资料与文档符合性
- **用例位置**：`asyncFirTest`（must-declare-async 语法门禁）+ `IsAsyncFunction`/`Promisify`/`CallbackWrapper`（`@arkts.utils.d.ets` 契约）。
- **测了哪些**：async 语法门禁为编译期（must-declare-async 非运行期可捕获）；type 守卫/promisify/callbackWrapper 契约见 `@arkts.utils.d.ets`；JS 内建无独立 SDK 文档（.md），契约以 `.d.ts`/语言规范为authoritative。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| async function/await | ✅(100+80+23) | ✅(无返回/BigInt/loop) | ✅(throw/reject/编译错) | ✅(Promise<T>/解包) | ✅(all/race/嵌套) | ✅(rapid re-exec) | ✅(AsyncNesting) |
| async generator/iterator | ✅(100+100) | ✅(空/单/深嵌套) | ✅(throw/uncaught) | ✅(AsyncGenerator/next) | ✅(errorProp/returnProp) | ✅(连续 throw) | 🟡(间接) |
| 错误传播/边界/interop/perf/nesting | ✅(16+17+54+3+16+17) | ✅(10 层/100 并发) | ✅(深嵌套错误/bubbling) | ✅(多返回/uncaught Type) | ✅(then/catch/setTimeout) | ✅(rapid/内存) | ✅(lazy import×3 层) |
| type.isAsyncFunction | ✅(135) | ✅(同步→false/getter) | ✅(非函数) | ✅(boolean) | ✅(全语言源) | ✅(多次一致) | ❌(同步无跨线程) |
| promisify | ✅(96) | ✅(回调类型) | 🟡 | ✅(Promise) | ✅(回调→Promise) | ✅ | ❌(同步) |
| callbackWrapper | ✅(70) | ✅(返回类型) | 🟡 | ✅(number/object/array/boolean) | ✅ | ✅ | ❌(同步) |
| type.isPromise | ✅(137) | ✅(三态) | ✅(非 Promise→false) | ✅(boolean) | ✅(全态) | ✅ | ❌(同步) |
| PromiseChain | ✅(218) | ✅(空/单/深链) | 🟡 | ✅(每层入参) | ✅(全值类型逐层) | ✅ | ❌(同步) |
| type.isSharedArrayBuffer | ✅(114) | ✅(zero/large/slice) | ✅(DataView/ArrayBuffer→false) | ✅(boolean) | ✅(view.buffer/全源) | ✅ | ❌(同步) |

## 7.2 逐接口遗漏确认（对照 `@arkts.utils.d.ets` / 语言规范）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ts / 语言规范） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `async function` / `await` | 返 Promise<T>，await 解包，must-declare-async 语法门禁 | ✅ 覆盖：语法声明强制 + 返回值解包 + await 各被等待对象 + 泛型类型流。编译期门禁已验证。无缺口。 |
| 2 | `async function*` / `for await...of` | AsyncGenerator<T>，next/return/throw | ✅ 覆盖：yield 产出 + throw() 注入 + return() 终止 + 连续 throw 序列 + uncaught 错误。🟡 **generator 跨 TaskPool 较少**（⑦间接）。 |
| 3 | 错误传播 / 边界 / 互操作 / 性能 / 嵌套 | uncaught bubbling、深嵌套错误、async×TaskPool | ✅ 覆盖：错误传播链 + uncaught bubbling（被 outer 捕获非宿主事件）+ 深嵌套 10 层 + 100 并发/50 顺序 await + cyclic chain。无缺口。 |
| 4 | `type.isAsyncFunction(fn)` | boolean，true 仅 async 函数 | ✅ 覆盖：135 例全语言源矩阵 + getter/setter 干扰 + 同步函数→false。无缺口。 |
| 5 | `promisify(fn)` | 回调→Promise | ✅ 覆盖：96 例回调→Promise + 全返回类型。🟡 **异常路径（非法回调签名）未见显式断言**（SUP_ASYNC_PROMISIFY_ERR_001）。 |
| 6 | `callbackWrapper(fn)` | async 函数返回 number/object/array/boolean | ✅ 覆盖：70 例全返回类型。🟡 **异常路径未见显式断言**（SUP_ASYNC_CALLBACKWRAPPER_ERR_001）。 |
| 7 | `type.isPromise(value)` | boolean，三态判定 | ✅ 覆盖：137 例 Pending/Fulfilled/Rejected/Resolve/Reject 全态 + 非 Promise→false。无缺口。 |
| 8 | `PromiseChain` | 全值类型逐层传递 | ✅ 覆盖：218 例全值类型（string/number/object/array/boolean）逐层传递。无缺口。 |
| 9 | `type.isSharedArrayBuffer(value)` | boolean，SAB→true | ✅ 覆盖：114 例全形态 + DataView/ArrayBuffer→false + 全语言源。无缺口。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **type 守卫跨线程语义**：type.isAsyncFunction/isPromise/isSharedArrayBuffer 为同步守卫，无跨线程语义（⑦❌ 为契约特性，非缺口）。✅ 符合契约。
2. **promisify/callbackWrapper 异常路径**：promisify/callbackWrapper 主路径覆盖充分，但非法回调签名/回调抛错的异常路径未见显式断言（catch 行为未明确）。⚠️ 部分缺口（SUP_ASYNC_PROMISIFY_ERR_001/SUP_ASYNC_CALLBACKWRAPPER_ERR_001）。
3. **async generator 跨 TaskPool**：generator/iterator 跨 TaskPool 用例较少（⑦🟡 间接）。⚠️ 部分缺口，但 async generator 跨线程非典型场景。
4. **跨特性归位一致性**：Promise/SAB 生态（type.isPromise/PromiseChain/type.isSharedArrayBuffer）归位于本套件，与 builtins_promise_test/sharedarraybuffertest 主套件分工明确（type 守卫 vs 实例方法）。✅ 范围边界清晰。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **async 语法门禁**：must-declare-async 为编译期门禁（`AsyncFirTest` 已验证非运行期可捕获）。建议资料侧在 `.md` 注明"未声明 async 用 await 为编译期错误"，测试侧保留编译期符合性证据。
2. **promisify/callbackWrapper 异常路径**：`@arkts.utils.d.ets` 声明 promisify/callbackWrapper，但非法回调签名/回调抛错的异常路径未见显式断言。建议资料侧补 `@throws` 说明（若契约），测试侧补异常路径用例（SUP_ASYNC_PROMISIFY_ERR_001/SUP_ASYNC_CALLBACKWRAPPER_ERR_001）。
3. **type 守卫契约**：`@arkts.utils.d.ets` 声明 type.isAsyncFunction/isPromise/isSharedArrayBuffer 返 boolean，本套件三守卫均 135/137/114 例全语言源矩阵覆盖充分。建议资料侧保留契约声明，无需补。
4. **JS 内建无独立 `.md`**：async/await 语法无独立 SDK `.md`（语言规范），type 守卫/promisify/callbackWrapper 见 `@arkts.utils.d.ets`。建议保留该契约来源约定。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P2** | 2 | SUP_ASYNC_PROMISIFY_ERR_001、SUP_ASYNC_CALLBACKWRAPPER_ERR_001 | promisify/callbackWrapper 异常路径显式断言；非阻断但提升契约符合性。 |
| **合计** | **2 新增** | | P2=2。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | async 函数入参（无参/带参/默认/剩余/泛型）、await 被等待对象（Promise/同步值/thenable）、type 守卫全语言源（.ets/.ts/.js/namespace/generic/re-export/interface-abstract） | asyncFunctionTest 入参矩阵、IsAsyncFunction 全语言源 135 例 |
| ②边界值测试 | 无返回→Promise.resolve(undefined)、返回 BigInt/Symbol/typed-array、空 generator/深嵌套 10 层、100 并发/50 顺序 await、同步函数→false、zero-size SAB→true | AsyncBoundaryTest 深嵌套 10 层、IsSharedArrayBuffer zero→true |
| ③异常与非法输入 | async 内 throw→reject、await 抛错、rejected await→reject、未声明 async→编译错、generator throw() 注入、uncaught bubbling、非函数→type 守卫 | AsyncSecTest uncaught bubbling、asyncGeneratorTest throw()、IsAsyncFunction 非函数 |
| ④返回值与类型验证 | async 返 Promise<T>/await 解包、AsyncGenerator next/return/throw 返 {value,done}、type 守卫返 boolean、PromiseChain 每层入参 | asyncFunctionTest Promise<T>、IsPromise boolean、PromiseChain 逐层 |
| ⑤组合场景 | Promise.all/race in async、嵌套 async、then/catch 混用、Promise 构造器包装 async、pipeline 组合、PromiseChain 全值类型逐层、callbackWrapper 全返回类型、lazy import×3 层嵌套 | AsyncRealWorldTest pipeline、PromiseChain 218、AsyncNesting lazy import×5 原语 |
| ⑥重复调用幂等性 | rapid re-execution、相同入参多次调用一致、连续 throw 序列、return 后再调用、同一函数多次 type 守卫一致、内存清理多 Promise | AsyncPerformanceTest rapid creation、IsAsyncFunction 多次检测一致 |
| ⑦并发跨线程 | AsyncNesting lazy import × asyncLock/promise/async/setTimeout/taskPool 三层嵌套；type 守卫同步无跨线程语义 | AsyncNestingTest 7 例 lazy import×3 层 |
