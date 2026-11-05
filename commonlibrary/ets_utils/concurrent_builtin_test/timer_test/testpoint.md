# timer_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/timer_test/entry/src/ohosTest/ets/test/` 下 **8** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **50** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；与 `concurrent_builtin_test_dedup_report.md` 完全一致，0 definite-dup）。本套件为 timer 全局内建特性主套件。
> **契约来源**：`interface/sdk-js/api/@internal/ets/global.d.ts` L287–L371（`setTimeout`/`setInterval`/`clearTimeout`/`clearInterval` 全局内建声明）。`setImmediate` 经全仓 grep 确认未声明。
> **文档来源**：timer 全局内建无独立 `.md`（`js-apis-arkts-lang.md` 经 grep 无 setTimeout/setInterval 任何条目），仅以 `global.d.ts` 声明为契约。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
timer_test（timer 全局内建定时器）
├── 1. 接口测试
│   ├── setTimeout(handler, delay?, ...args)        ✓TESTED
│   ├── setInterval(handler, delay, ...args)       ✓TESTED
│   ├── clearTimeout(timeoutID?)                    ✓TESTED
│   └── clearInterval(intervalID?)                  ✓TESTED
├── 2. 稳定性（1000 次循环创建+清除 + 长延时占用稳定性）
├── 3. 性能（长耗时回调 2000/3000ms 不丢失触发）
├── 4. 并发安全（timer 跨线程创建/清除、跨线程清除 no-op/undefined）
├── 5. 兼容性与继承（timer 无继承/类形态，全局函数，不适用）
└── 6. 资料与文档符合性（timer 无独立 .md；声明 vs 测试对齐）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 8 文件 / 50 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | TimerClearIntervalTest.test.ets | 11 | clearInterval(各时机+无参 no-op+setTimeout ID) |
| 2 | TimerClearTimeoutTest.test.ets | 7 | clearTimeout(未执行/执行中/已完成/不存在/null/setInterval ID) |
| 3 | TimerFunctionsTest.test.ets | 4 | setTimeout 回调场景(耗时/嵌套/抛异常/native uv) |
| 4 | TimerMemoryTest.test.ets | 6 | timer 内存/生命周期(创建+清除/嵌套/泄漏防护) |
| 5 | TimerMultiThreadTest.test.ets | 6 | timer 跨线程(main/subThread/overThread/subTimerClear/mainTimerClear) |
| 6 | TimerSetIntervalTest.test.ets | 9 | setInterval(delay 0/100/2000/3000、长耗时回调、args 透传、精度≥99ms) |
| 7 | TimerSetTimeoutTest.test.ets | 7 | setTimeout(string/null handler、delay -1/0/100/200.1/2147483647/null) |
| | **合计** | **50** | 7 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 setTimeout(handler, delay?, ...args)

```
setTimeout
├── 入参范围覆盖
│   ├── handler 矩阵：Function（0200）/string（0100·0600）/null（0400）
│   ├── delay 取值：-1（0100）/0（0200）/100（0300）/200.1（0400）/2147483647（0500）/null·undefined（0600）
│   └── args 透传：delay=100 透传 string 参数（0300）
├── 边界值测试
│   ├── delay<1→0：-1（0100）、0（0200）
│   ├── delay=null/undefined→0（0600）
│   ├── delay=MAX(2^31-1)（0500）
│   └── delay 小数 200.1（0400）
├── 异常与非法输入
│   ├── handler=null/空串→无附加处理（doc 契约）
│   └── native uv 线程异常路径：Functions_0300 抛错
├── 返回值与类型验证
│   ├── 返回 number（timer ID，从 0 递增）
│   └── 进程内 ID 共享递增
├── 组合场景
│   ├── 嵌套异步：Functions_0200 函数内嵌套
│   ├── 耗时任务：Functions_0100 不同耗时任务
│   └── native 调用：Functions_0400
├── 重复调用/幂等性
│   └── 连续 setTimeout ID 递增
└── 并发跨线程
    └── TimerMultiThread 间接（跨线程载体为 setInterval；setTimeout 本身未直接跨线程调用）
```

- **用例位置**：`TimerSetTimeoutTest.test.ets`（6 `setTimeoutTest0100~0600`）+ `TimerFunctionsTest.test.ets`（4 `functionsInTimerTest0100~0400`）+ `TimerClearTimeoutTest.test.ets`（6，setTimeout 产生 ID 后 clearTimeout）+ `TimerMemoryTest.test.ets`（`0100/0400/0500/0600` 涉及）+ `TimerClearIntervalTest.test.ets`（`1100` setTimeout ID 经 clearInterval）。
- **测了哪些**：handler 类型矩阵（Function/string/null）+ delay 全边界（-1/0/小数/MAX/null）+ args 透传 + 嵌套/耗时/native 场景；❌ 未见 delay>2^31-1（→0）与 delay 省略（1 参形式）独立用例（见 §7.2）。

---

## 1.2 setInterval(handler, delay, ...args)

```
setInterval
├── 入参范围覆盖
│   ├── handler 矩阵：Function/string/空串/null
│   ├── delay 取值：0/100/2000/3000/-1/null/小数 200.1
│   └── args 透传
├── 边界值测试
│   ├── delay<1→0：-1、0
│   ├── delay=null→0
│   ├── delay 小数 200.1
│   └── 长延时 2000/3000ms（0600/0700/0800）
├── 异常与非法输入
│   ├── handler=null/空串→无附加处理（doc）
│   └── delay 省略（声明 delay 必填）未测 401
├── 返回值与类型验证
│   └── 返回 number（timer ID）
├── 组合场景
│   ├── 长耗时回调占用：0600/0700/0800 回调内 2~3s 阻塞验证不丢失触发
│   └── 嵌套 setInterval：Memory_0500
├── 重复调用/幂等性
│   └── 自清除：createTimer 计数达阈值后 clearInterval 自身
└── 并发跨线程
    ├── createTimer/mainTimer 在 main/taskpool/overThread
    └── 跨线程清除→undefined（timer 须在创建线程清除）
```

- **用例位置**：`TimerSetIntervalTest.test.ets`（8 `TimerSetIntervalTest0100~0800`）+ `TimerMultiThreadTest.test.ets`（5 `timerMultiThreadTest1001~1006`，经 `createTimer`/`mainTimer` 间接）+ `TimerClearIntervalTest.test.ets`（11，前 10 例 setInterval 产生 ID）+ `TimerMemoryTest.test.ets`（`0200/0300/0500/0600`）+ `TimerClearTimeoutTest.test.ets`（`0600`）。
- **测了哪些**：handler/delay 矩阵 + 长耗时回调 + 精度（`time2-time1 >= 99`）+ 跨线程创建/清除；❌ 未见 `setInterval(fn)` delay 省略（必填参数）的 401 用例（见 §7.2）。

---

## 1.3 clearTimeout(timeoutID?)

```
clearTimeout
├── 入参范围覆盖
│   ├── timeoutID=未执行 ID（0100）
│   ├── timeoutID=执行中 ID（0200）
│   ├── timeoutID=已完成 ID（0300）
│   ├── timeoutID=不存在 ID（0400）
│   └── timeoutID=null（0500）
├── 边界值测试
│   └── 各清除时机（未执行/执行中/已完成/不存在/null）
├── 异常与非法输入
│   ├── 不存在 ID→no-op（0400）
│   └── null→no-op（0500，doc）
├── 返回值与类型验证
│   └── void
├── 组合场景
│   └── 清除 setInterval 产生的 ID（clearTimeoutTest0600）
├── 重复调用/幂等性
│   └── 重复清除 no-op
└── 并发跨线程
    └── 跨线程清除→no-op（MultiThread 1001/1002/1004/1005，timer 须在创建线程清除）
```

- **用例位置**：`TimerClearTimeoutTest.test.ets`（6 `clearTimeoutTest0100~0600`）+ `TimerMemoryTest.test.ets`（`0100` setTimeout+clearTimeout 生命周期）+ `TimerMultiThreadTest.test.ets`（`1001/1002/1004/1005` 跨线程清除验证）+ `TimerClearIntervalTest.test.ets`（`0200`）。
- **测了哪些**：5 种清除时机（未执行/执行中/已完成/不存在/null）+ setInterval ID 清除 + 跨线程清除 no-op；❌ 未见 `clearTimeout()`（无参）独立用例（与 `clearInterval()` 无参在 `TimerClearIntervalTest0500` 已覆盖对照，见 §7.2）。

---

## 1.4 clearInterval(intervalID?)

```
clearInterval
├── 入参范围覆盖
│   ├── intervalID=各时机 ID（0100~0400）
│   ├── intervalID=不存在 ID
│   ├── 无参 clearInterval()（0500）
│   └── setTimeout 产生的 ID（1100）
├── 边界值测试
│   └── 各清除时机
├── 异常与非法输入
│   ├── 不存在→no-op
│   └── 无参→no-op（doc：参数可省，0500 唯一覆盖）
├── 返回值与类型验证
│   └── void
├── 组合场景
│   └── 清除 setTimeout 产生的 ID（clearIntervalTest1100）
├── 重复调用/幂等性
│   └── 重复清除 no-op
└── 并发跨线程
    └── 跨线程清除→undefined（attemptClearTimer 在 overThread 返回 undefined，证实 timer 须在创建线程清除）
```

- **用例位置**：`TimerClearIntervalTest.test.ets`（11 `TimerClearIntervalTest0100~1100`，含 `0500` 无参 `clearInterval()`）+ `TimerMemoryTest.test.ets`（`0200/0300/0500/0600`）+ `TimerMultiThreadTest.test.ets`（`1001~1006` 全部经 createTimer/mainTimer/attemptClearTimer）+ `TimerSetIntervalTest.test.ets`（8 例均末尾 clearInterval）。
- **测了哪些**：清除时机全覆盖 + 无参 `clearInterval()` no-op（0500 唯一覆盖）+ setTimeout ID 清除 + 跨线程清除返回 undefined（1004）；timer 跨线程清除契约验证最完整。

---

# 2. 稳定性
- **用例位置**：`TimerMemoryTest`（`0100` 创建+清除反复、`0500/0600` 嵌套 timer、`0400` 泄漏防护）+ `TimerSetIntervalTest0600/0700/0800` 长延时占用不丢失触发。
- **测了哪些**：timer 1000 次循环创建+清除稳定性 + 嵌套 timer + 长延时占用下不丢失触发。

# 3. 性能
- **用例位置**：`TimerSetIntervalTest0600/0700/0800`（回调内 2~3s 阻塞，验证不丢失触发，间接体现 timer 调度性能）。
- **测了哪些**：长耗时回调 2000/3000ms 占用下不丢失触发；❌ 未见单方法基线延迟/吞吐基准（如 setTimeout 平均触发延迟统计）。

# 4. 并发安全
- **用例位置**：`TimerMultiThreadTest.test.ets`（5 `timerMultiThreadTest1001~1006`：main/subThread/overThread/subTimerClear/mainTimerClear，经 `createTimer`/`mainTimer`/`attemptClearTimer`）。
- **测了哪些**：timer 跨线程创建/清除 + 跨线程清除返回 undefined/no-op（`attemptClearTimer` 在 overThread 验证 timer 须在创建线程清除，符合 doc "stored in the thread where created"）。

# 5. 兼容性与继承
- **用例位置**：无（timer 无继承/类形态，全局函数）。
- **测了哪些**：不适用——timer 为全局函数，无子类化/继承语义。

# 6. 资料与文档符合性
- **用例位置**：`global.d.ts` L287–L371 声明 4 函数；`js-apis-arkts-lang.md` 经 grep 无 setTimeout/setInterval 任何条目。
- **测了哪些**：声明 vs 测试对齐（4 函数均 TESTED，`setImmediate` 经 grep 确认未声明）；❌ timer 无独立 `.md`，契约仅以 `global.d.ts` 为authoritative（见 §7.4）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| setTimeout | ✅(6+4) | ✅(delay 全边界) | 🟡(native uv) | ✅(number ID) | ✅(嵌套/耗时/native) | ✅(ID 递增) | 🟡(间接) |
| setInterval | ✅(8) | ✅(delay 全边界) | 🟡(delay 省略 401 缺) | ✅(number ID) | ✅(长耗时/嵌套) | ✅(自清除) | ✅(跨线程) |
| clearTimeout | ✅(6) | ✅(5 时机) | ✅(no-op/null) | ✅(void) | ✅(setInterval ID) | ✅(重复 no-op) | ✅(跨线程 no-op) |
| clearInterval | ✅(11) | ✅(各时机) | ✅(no-op/无参) | ✅(void) | ✅(setTimeout ID) | ✅(重复 no-op) | ✅(跨线程→undefined) |

## 7.2 逐接口遗漏确认（对照 `global.d.ts`）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（global.d.ts） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `setTimeout(handler, delay?, ...args)` | delay 可选，缺省→0；handler=string→不执行 | ✅ 覆盖：handler 类型矩阵 + delay 全边界（-1/0/小数/MAX/null）+ args 透传 + 嵌套/异常/native。❌ **delay > 2^31-1（→0）独立用例缺失**；❌ **delay 省略（1 参 `setTimeout(fn)`）独立用例缺失**（SUP_TIMER_SETTIMEOUT_DELAY_OMIT_001）。 |
| 2 | `setInterval(handler, delay, ...args)` | delay 必填 | ✅ 覆盖：handler/delay 矩阵 + 长耗时回调 + 精度 + 跨线程。❌ **`setInterval(fn)` delay 省略的 401 用例缺失**（声明 delay 为必填，应抛 401，SUP_TIMER_SETINTERVAL_401_001）；⚠️ 401 未声明。 |
| 3 | `clearTimeout(timeoutID?)` | 参数可选，缺省→no-op | ✅ 覆盖：5 种清除时机 + setInterval ID + 跨线程 no-op。❌ **`clearTimeout()`（无参）独立用例缺失**（与 `clearInterval()` 无参在 0500 已覆盖对照，SUP_TIMER_CLEARTIMEOUT_NOARG_001）。 |
| 4 | `clearInterval(intervalID?)` | 参数可选，缺省→no-op | ✅ 覆盖：清除时机全覆盖 + 无参 `clearInterval()` no-op（0500 唯一）+ setTimeout ID + 跨线程→undefined（1004）。最完整。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **无参 clear 语义对称性**：`clearInterval()` 无参 no-op 在 `TimerClearIntervalTest0500` 唯一覆盖；`clearTimeout()` 无参无独立用例（与 setInterval 对照缺失）。⚠️ 部分缺口。
2. **必填参数 401**：`setInterval` delay 为必填参数，但 `setInterval(fn)`（省略 delay）的 401 用例缺失，且声明侧未 `@throws 401`。❌ 组合缺口。
3. **delay 极值**：`setTimeout` delay=MAX(2^31-1) 已测（`setTimeoutTest0500`），但 delay > 2^31-1（→0）的回绕边界未见。❌ 边界缺口。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **timer 无独立 `.md`（⚠️ 文档缺口）**：`global.d.ts` L287–L371 声明 4 函数，但 `js-apis-arkts-lang.md` 经 grep 无 setTimeout/setInterval/clearTimeout/clearInterval 任何条目。建议资料侧补 timer 专节，列出 4 函数签名、delay 语义（<1→0、缺省→0、MAX 行为）、跨线程清除契约（timer 须在创建线程清除）。
2. **setInterval delay 必填的 401 声明**：声明 delay 为必填，但未 `@throws 401`。建议在 `.d.ts` 与 `.md` 为 setInterval 补 `@throws BusinessError 401`，并同步增补测试（SUP_TIMER_SETINTERVAL_401_001）。
3. **跨线程清除契约固化**：`TimerMultiThreadTest1004` 验证跨线程 `attemptClearTimer` 返回 undefined（timer 须在创建线程清除）。建议资料侧在 timer 专节显式注明该契约，测试侧已覆盖无需补。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 2 | SUP_TIMER_SETINTERVAL_401_001、SUP_TIMER_SETTIMEOUT_DELAY_OMIT_001 | 必填参数 401 / delay 省略独立用例缺失；属契约符合性硬缺口。 |
| **P2** | 2 | SUP_TIMER_CLEARTIMEOUT_NOARG_001、delay>2^31-1 回绕边界 | 对称性补齐 / 边界补强；非阻断但提升套件质量。 |
| **合计** | **4 新增** | | P1=2 / P2=2。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | handler 类型（Function/string/null/空串）、delay 全取值、args 透传、clear 的各 ID 形态 | TimerSetTimeoutTest/TimerSetIntervalTest handler×delay 矩阵、TimerClearTimeoutTest 5 时机 ID |
| ②边界值测试 | delay <1→0、null/undefined→0、小数、MAX(2^31-1)、各清除时机、无参 clear | setTimeoutTest0200/0500、TimerClearIntervalTest0500 无参 |
| ③异常与非法输入 | handler=null/空串→无附加处理、不存在 ID→no-op、native uv 异常、delay 省略→401（缺） | TimerFunctionsTest0300 native uv、TimerClearTimeoutTest 不存在 ID |
| ④返回值与类型验证 | setTimeout/setInterval 返 number（timer ID 递增）、clear 返 void、跨线程清除返 undefined | setTimeoutTest 返 ID 递增、TimerMultiThreadTest1004 undefined |
| ⑤组合场景 | 嵌套异步、耗时任务、native 调用、长耗时回调、clear 对方 ID、跨线程清除 | TimerFunctionsTest0200 嵌套、TimerSetIntervalTest0600~0800 长耗时 |
| ⑥重复调用幂等性 | 连续 setTimeout ID 递增、重复 clear no-op、setInterval 自清除、createTimer 计数达阈值 | TimerClearTimeoutTest 重复清除、TimerSetIntervalTest 自清除 |
| ⑦并发跨线程 | timer 跨线程创建/清除、overThread 清除→undefined、timer 须在创建线程清除 | TimerMultiThreadTest main/subThread/overThread/subTimerClear/mainTimerClear |
