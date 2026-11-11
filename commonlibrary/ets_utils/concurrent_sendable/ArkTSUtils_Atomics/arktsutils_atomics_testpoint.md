# ArkTSUtils.Atomics 测试点报告（按接口维度·摘要版）

## 0. 脑图总览

### 0.1 文件清单（24 个文件 / 949 用例）

> 计数对账：`grep -c "@tc.name"` 全树合计 = 949，与 it() 解析数逐文件对齐（List.test.ets 为纯重导出文件，0 个 it()，已排除）。

| 文件 | 用例数 | 主要接口 |
|------|--------|----------|
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsAddTest.test.ets` | 58 | add（含 add+load/sub/and/or/xor/exchange/compareExchange/store/isLockFree 组合、Promise/worker 并发） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsAndTest.test.ets` | 83 | and（多 TypedArray、字符串/null/undefined/object/array/function mask 强转、async/Promise 组合） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiSecondTest.test.ets` | 14 | notify + isLockFree + 8 种 TypedArray 构造（ArrayBuffer+length） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiTest.test.ets` | 37 | 全 10 个数据接口 API（add/and/compareExchange/exchange/load/or/store/sub/xor/wait）按 value/index/timeout 维度 |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiThirdlyTest.test.ets` | 5 | exchange（含 ExtendedAtomics 继承包装 + 并发）+ add（内存泄漏 + 循环 + taskpool 并发）+ store/load |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsCombTest.test.ets` | 46 | 全接口组合（load/store/add/sub/exchange/compareExchange/and/or/xor/isLockFree + 多 view/状态机/proxy） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsCompareExchangeTest.test.ets` | 82 | compareExchange（匹配/不匹配/边界值/多 TypedArray/offset view/async retry/CAS 自增） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsExchangeTest.test.ets` | 80 | exchange（多 TypedArray/overflow/underflow/max-min 翻转/async retry/Promise.race） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsFunctionTest.test.ets` | 10 | taskpool 跨线程：store/load/compareExchange/or/xor/and/exchange/sub（Int8/Int16/Int32/Uint8/Uint16/Uint32） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsIsLockFreeTest.test.ets` | 76 | isLockFree（1/2/4/8 字节 + NaN/Infinity/MAX_VALUE/MIN_VALUE/boolean/object/array 入参 + async/Promise） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsLoadTest.test.ets` | 61 | load（多 TypedArray + after and/or/add/xor/sub/store 修改后读 + async/箭头/Promise） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsMultithreadTest.test.ets` | 4 | worker 多线程：SharedCounter.add/sub/and/exchange/load（跨 worker 共享 ArrayBuffer） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsOrTest.test.ets` | 58 | or（多 TypedArray + mask 强转 + async/Promise 组合） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsStoreTest.test.ets` | 59 | store（多 TypedArray + store 后接 add/or/xor/exchange/compareExchange/sub + async/箭头/Promise） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsSubTest.test.ets` | 67 | sub（多 TypedArray + overflow/underflow + CAS 自减到 floor + async/Promise/资源回滚） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsWaitTest.test.ets` | 15 | wait（not-equal/ok/timed-out 返回值 + NaN/Infinity/fractional/negative timeout + 跨 index notify） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsXorTest.test.ets` | 67 | xor（多 TypedArray + 全位翻转 + overflow + async/Promise/状态机） |
| `ArkTSUtilsAtomics/ArkTSUtilsAtomicsSupplementTest.test.ets` | 50 | 源码审计驱动补充：IsLockFree ToInt32 规范偏差(6) + GetAgentCanSuspend(2) + Worker terminate UAF(3) + 非对齐 byteOffset 构造防御(5) + notify 专用(8) + load/store 边界值(12) + 文档符合性(6) + wait timeout=0/-1(2) + 6 类型 wraparound(6) |
| `ArkTSUtilsAtomicsConcurrentTest.test.ets` | 2 | taskpool 并发：64×16 矩阵乘 CAS 重试 + 128 job 八槽有界队列 wait/notify 背压 |
| `ArkTSUtilsAtomicsEntryTest.test.ets` | 3 | 入口契约：拒绝 ordinary TypedArray、forward sendable、保留 global Atomics |
| `ArkTSUtilsAtomicsParameterTest.test.ets` | 45 | 9 接口（add/and/compareExchange/exchange/load/or/store/sub/xor）× 4 维度（index/array/number/offset）+ 6 种 TypedArray width + compareExchange expected 转换 + isLockFree 2 例 |
| `ArkTSUtilsAtomicsWaitNotifyParameterTest.test.ets` | 14 | wait/notify 参数：supported type / reject sendable/native/non-array / invalid index / ToIndex / expected 转换 / timeout / offset view / count 转换 / address isolation / coercible |
| `ArkTSUtilsTypedArrayAtomicsTest.test.ets` | 13 | 6 种 TypedArray 全 RMW + overflow/invalid type/invalid index + wait 结果 + taskpool add/CAS/notify |
| `List.test.ets` | 0 | 纯重导出（已排除） |

**合计**：23 个有效文件 / 949 用例。

### 0.2 接口用例数分布（一行汇总）

| 接口 | 专用文件 | 综合套件补充 | SupplementTest 补充 | 合计（估算，含交叉） |
|------|----------|--------------|---------------------|----------------------|
| add | AddTest 58 | ApiTest 3 + ApiThirdly 2 + Function 1 + Comb + Concurrent + TypedArray + Multithread + Parameter 4 | Doc 1 + Wrap 1 | ~72 |
| sub | SubTest 67 | ApiTest 3 + Function 1 + Comb + TypedArray + Multithread + Parameter 4 | Doc 1 | ~79 |
| and | AndTest 83 | ApiTest 3 + Function 1 + Comb + TypedArray + Multithread + Parameter 4 | Doc 1 | ~95 |
| or | OrTest 58 | ApiTest 3 + Function 1 + Comb + TypedArray + Parameter 4 | Doc 1 | ~68 |
| xor | XorTest 67 | ApiTest 3 + Function 1 + Comb + TypedArray + Parameter 4 | Doc 1 | ~77 |
| exchange | ExchangeTest 80 | ApiTest 4 + ApiThirdly 2 + Function 1 + Comb + TypedArray + Multithread + Parameter 4 | Doc 1 + Align 1 | ~95 |
| compareExchange | CompareExchangeTest 82 | ApiTest 4 + Function 1 + Comb + TypedArray + Concurrent + Parameter 4 | Doc 1 | ~94 |
| load | LoadTest 61 | ApiTest 3 + Function 多 + Comb + TypedArray + Multithread + Parameter 4 | Boundary 4 + Doc 1 | ~80 |
| store | StoreTest 59 | ApiTest 4 + Function 多 + Comb + TypedArray + Parameter 4 | Boundary 8 + Doc 1 | ~78 |
| isLockFree | IsLockFreeTest 76 | ApiSecond 3 + Comb 1 + Parameter 2 + TypedArray | Spec deviation 6 | ~88 |
| wait | WaitTest 15 | ApiTest 7 + WaitNotifyParameter 14 + TypedArray 1 + Concurrent 1 | AgentCanSuspend 2 + terminate UAF 3 + timeout=0/-1 2 | ~44 |
| notify | ApiSecond 3 | WaitTest 内嵌 + WaitNotifyParameter 14 + TypedArray 1 + Concurrent 1 + Function 1 | Dedicated 8 | ~28 |
| 全接口（跨切面） | — | — | Align 5 + Wrap 6 | 11 |

---

## 1. 接口测试

### 1.1 add(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsAddTest.test.ets`（58 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0001/0002/0003）+ `ArkTSUtilsAtomicsApiThirdlyTest.test.ets`（2 例：0003 内存泄漏、0005 循环+gc）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`、`ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsMultithreadTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例：index/array/number/offset）
- 测了哪些：覆盖负值/零值/正值/大数/overflow/underflow/wraparound，以及 add 后接 load/sub/and/or/xor/exchange/compareExchange/store/isLockFree 的组合。
  - 入参范围覆盖：负值（AddTest0001）、零值（AddTest0002/0006/0040）、非零初值（AddTest0007）、大正值（AddTest0028）、大负值（AddTest0029/0014）、Int32Array/Uint32Array/Uint8Array/Uint16Array/Int16Array 多类型（AddTest0003/0004/0026/0027/0055-0058）
  - 边界值测试：Uint8Array wraparound（AddTest0012）、Int32Array overflow（AddTest0024）、ArrayBuffer 最大尺寸（AddTest0039）、大索引（AddTest0045）、负值 underflow（AddTest0005）
  - 异常与非法输入：ParameterTest 拒绝 null/undefined/buffer/ordinary/floating/clamped array（断言 `error instanceof TypeError`），index=-1/length/Infinity/unsafe 整数断言 `error instanceof RangeError`；TypedArrayTest0008 验证不支持类型抛 TypeError、0009 验证越界索引抛 RangeError
  - 返回值与类型验证：AddTest 验证返回操作前旧值（结合 load 断言）；ParameterTest NumberParameters 验证 NaN→0、Infinity/-Infinity、4294967299 overflow 截断、字符串'3'→3、boolean true→1 的 ToInt32 转换
  - 组合场景：add+compareExchange（AddTest0009/0037）、add+exchange（AddTest0010/0047）、add+load（AddTest0019/0035）、add+sub（AddTest0020）、add+and/or/xor（AddTest0021-0023/0049/0051）、add+isLockFree（AddTest0025）、add+store（AddTest0042）、嵌套原子（AddTest0031）
  - 重复调用/幂等性：AddTest0013 同索引多次 add、AddTest0006 零初值多次 add、AddTest0018 循环 add、AddTest0050 嵌套函数重复 add
  - 并发跨线程：AddTest0033 多 worker 同位置安全 add、AddTest0034 Promise.all 协调多 add；ApiThirdlyTest0004/0005 taskpool 多任务 add；FunctionTest taskpool；MultithreadTest SharedCounter.add 跨 worker；ConcurrentTest 矩阵 CAS；TypedArrayTest0011 taskpool add 不丢失（详见 §4）

### 1.2 sub(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsSubTest.test.ets`（67 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0025/0026/0027）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`、`ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsMultithreadTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本减法返回旧值、零值/最大值/最小值/overflow/多 TypedArray、CAS 自减到 floor、资源分配回滚、async/Promise/闭包。
  - 入参范围覆盖：零值（SubTest0002/0007）、负值结果（SubTest0004）、Int32Array 多元素索引（SubTest0003）、Uint32Array 无符号结果（SubTest0012）、Int16Array（SubTest0020）、Uint8Array（SubTest0021）、最大值 0x7FFFFFFF（SubTest0009）、min Int32 0x80000000（SubTest0016）
  - 边界值测试：32 位截断（SubTest0015/0052）、非整数强转（SubTest0008）、箭头函数包装（SubTest0010/0013）
  - 异常与非法输入：ParameterTest SubRejectedArrays 断言 TypeError；SubIndexParameters 断言 RangeError（越界索引保留其余元素）
  - 返回值与类型验证：SubTest0001 验证返回旧值；ParameterTest SubNumberParameters 验证有限/分数/NaN/Infinity/overflow 转换
  - 组合场景：add/sub/load/compareExchange 校验和（SubTest0005）、isLockFree/sub/load/compareExchange（SubTest0011）、sub+exchange 审计（SubTest0048）、CAS 自减到 floor + 最终 sub（SubTest0038）、资源分配回滚 sub/add/exchange（SubTest0065）、sub/load/compareExchange（SubTest0066）、双计数器 load/exchange 快照（SubTest0064/0067）
  - 重复调用/幂等性：SubTest0006 同索引两次 sub、SubTest0018 链式同索引 sub、SubTest0058 counter add+compareExchange
  - 并发跨线程：SubTest 0023-0062 大量 async/Promise.all/Promise.race/Promise.allSettled 闭包跟踪；FunctionTest taskpool；MultithreadTest SharedCounter.sub（详见 §4）

### 1.3 and(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsAndTest.test.ets`（83 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0004/0005/0006）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0008 worker Uint8Array AND）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsMultithreadTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本 AND、返回旧值、多 TypedArray、mask 类型强转（字符串/null/undefined/object/array/function/hex/octal/binary/64 位）、async/Promise 组合。
  - 入参范围覆盖：Uint8Array 基本（AndTest0001）、Int32Array 不同 mask（AndTest0009-0012）、Uint32Array（AndTest0019/0020）、Int16/Uint16/Int8/Uint8（AndTest0038-0041）、零 mask（AndTest0015/0025）、max Int32（AndTest0016）、min Int32（AndTest0017）、mixed bits（AndTest0018）
  - 边界值测试：零值（AndTest0002）、最大值（AndTest0003）、负数（AndTest0007）、max Uint32（AndTest0020）、64 位 mask 截断（AndTest0031/0032）
  - 异常与非法输入：AndTest0004 非整数 TypedArray；ParameterTest AndRejectedArrays 断言 TypeError（null/undefined/buffer/ordinary/floating/clamped）；mask 为 object/array/function 时（AndTest0035/0036/0037）描述为"invalid conversion"——实际 ArkTS 严格模式可能编译期拒绝或运行时 NaN→0；ParameterTest AndIndexParameters 越界断言 RangeError
  - 返回值与类型验证：AndTest0006/0014 验证返回操作前旧值；ParameterTest AndNumberParameters 验证有限/分数/NaN/Infinity/overflow 转换
  - 组合场景：两次连续 and（AndTest0021）、async IIFE（AndTest0049）、Promise.all 混合 Int32+Uint32（AndTest0059）、Promise.allSettled mixed success/failure（AndTest0052）、嵌套 Promise+and+async validation（AndTest0055）、async generator（AndTest0075）、bit masks + memory consistency（AndTest0072）
  - 重复调用/幂等性：AndTest0021 两次连续 and、AndTest0079 Promise.allSettled 两次顺序 and
  - 并发跨线程：AndTest0008 多线程原子性（desc 描述）；FunctionTest0008 worker Uint8Array AND 后主线程 read back；MultithreadTest SharedCounter.and（详见 §4）

### 1.4 or(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsOrTest.test.ets`（58 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0018/0019/0020）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0003 worker Int32Array OR）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本 OR、返回旧值、多 TypedArray、mask 强转、async/Promise 组合（与 and 结构对称）。
  - 入参范围覆盖：Int32Array 多 mask、Uint32Array、Int8/Uint8/Int16/Uint16
  - 边界值测试：零值、最大值、负数、64 位截断、overflow
  - 异常与非法输入：ParameterTest OrRejectedArrays 断言 TypeError；OrIndexParameters 越界断言 RangeError；mask 为 object/array/function 强转
  - 返回值与类型验证：验证返回旧值；OrNumberParameters 验证 NaN/Infinity/overflow 转换
  - 组合场景：or+compareExchange feature bits（XorTest0006 提到）、or+xor+and bitmask 序列（XorTest0041）、store+or（StoreTest0017）
  - 重复调用/幂等性：OrTest 同索引多次 or、链式 or
  - 并发跨线程：FunctionTest0003 worker Int32Array OR 后主线程 load 校验 `i | 2`；MultithreadTest（SharedCounter 未直接含 or）；TypedArrayTest 全 RMW 含 or（详见 §4）

### 1.5 xor(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsXorTest.test.ets`（67 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0028/0029/0030）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0004 taskGroup 含 taskXor）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本 XOR、返回旧值、全位翻转、两次 XOR 回原值、多 TypedArray、async/Promise/状态机。
  - 入参范围覆盖：Int32Array 基本（XorTest0001）、零值（XorTest0002/0008）、索引 1（XorTest0003）、Uint32Array（XorTest0013）、Int8Array（XorTest0015）、Uint16Array（XorTest0016）、Int16Array（XorTest0023）、Uint8Array（XorTest0024）、max Int32 0x7FFFFFFF（XorTest0010）、min Int32 0x80000000（XorTest0019）
  - 边界值测试：全位翻转 0xFFFFFFFF（XorTest0004）、32 位截断（XorTest0018）、overflow 强转（XorTest0054）
  - 异常与非法输入：ParameterTest XorRejectedArrays 断言 TypeError；XorIndexParameters 越界断言 RangeError；非整数 mask 强转（XorTest0009）
  - 返回值与类型验证：XorTest0001 返回旧值；ParameterTest XorNumberParameters 验证 NaN/Infinity/overflow
  - 组合场景：xor+load（XorTest0005）、or/compareExchange feature bits（XorTest0006）、xor+exchange toggle+reset（XorTest0060）、AND/XOR/OR bitmask 序列（XorTest0041）、xor 两次回原值（XorTest0007）、xor toggle 状态 + exchange 版本（XorTest0066）、xor 两次翻转 flag（XorTest0067）
  - 重复调用/幂等性：XorTest0007 两次同索引 XOR 回原值；XorTest0021 链式 XOR；XorTest0067 flag 两次翻转
  - 并发跨线程：FunctionTest0004 taskGroup 含 taskXor；MultithreadTest（SharedCounter 未含 xor）；TypedArrayTest 全 RMW 含 xor（详见 §4）

### 1.6 exchange(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsExchangeTest.test.ets`（80 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（4 例：0011/0012/0013/0014）+ `ArkTSUtilsAtomicsApiThirdlyTest.test.ets`（2 例：0001 ExtendedAtomics 继承、0002 并发 distinct indices）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0009 worker Uint16Array exchange）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsMultithreadTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本交换返回旧值、多 TypedArray、overflow/underflow、max↔min 翻转、async retry/Promise.race。
  - 入参范围覆盖：Int32Array 非零索引（ExchangeTest0001）、零值（ExchangeTest0002）、max Int32（ExchangeTest0004）、min Int32（ExchangeTest0005）、大正值/大负值（ExchangeTest0011/0012）、Int8/Uint8/Int16/Uint16/Uint32 全类型（ExchangeTest0013-0029）
  - 边界值测试：Uint8Array overflow（ExchangeTest0007）、Int8Array underflow（ExchangeTest0008）、max Uint8 255→0（ExchangeTest0020）、min Int8 -128→127（ExchangeTest0021）、max-1 Uint32 4294967294（ExchangeTest0025）、min+1 Int8 -127（ExchangeTest0039）、0↔max（ExchangeTest0040）、max↔min（ExchangeTest0041）
  - 异常与非法输入：ParameterTest ExchangeRejectedArrays 断言 TypeError；ExchangeIndexParameters 越界断言 RangeError
  - 返回值与类型验证：ExchangeTest0003 多次连续返回旧值；ExchangeTest0009 同 old/new 值；ParameterTest ExchangeNumberParameters 验证 NaN/Infinity/overflow
  - 组合场景：exchange+compareExchange lock/relock（ExchangeTest0010）、exchange/load/add 序列（ExchangeTest0019）、state transition idle→processing→completed via compareExchange/add/exchange（ExchangeTest0079）、xor/exchange toggle（XorTest0060）、store+exchange（StoreTest0035/0049）
  - 重复调用/幂等性：ExchangeTest0003 多次连续 exchange
  - 并发跨线程：ApiThirdlyTest0002 taskpool 10 任务并发 exchange 写 distinct indices；FunctionTest0009 worker Uint16Array exchange；MultithreadTest SharedCounter.exchange；ExchangeTest0030-0080 大量 async/Promise.race/Promise.all retry（详见 §4）

### 1.7 compareExchange(typedArray, index, expectedValue, replacementValue): number
- 用例位置：`ArkTSUtilsAtomicsCompareExchangeTest.test.ets`（82 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（4 例：0007/0008/0009/0010）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0002 worker Int16Array CAS）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsConcurrentTest.test.ets`（矩阵 CAS 重试）+ `ArkTSUtilsAtomicsParameterTest.test.ets`（4 例 + CompareExchangeExpectedConversion 1 例）
- 测了哪些：匹配则交换/不匹配保留、返回旧值、多 TypedArray、offset view、CAS 自增/重试、async retry/Promise.race。
  - 入参范围覆盖：匹配交换（CompareExchangeTest0001）、不匹配保留（CompareExchangeTest0002）、零值（CompareExchangeTest0003）、负 expected（CompareExchangeTest0004）、max Int32（CompareExchangeTest0006）、min Int32（CompareExchangeTest0007）、Int8/Uint8/Int16/Uint16/Uint32 全类型 overflow/underflow（CompareExchangeTest0009-0041）、mid-range 值（CompareExchangeTest0015/0025/0032/0035/0036）
  - 边界值测试：Uint8Array overflow（CompareExchangeTest0009）、Int8Array underflow（CompareExchangeTest0010）、max→min（CompareExchangeTest0041）、max-1（CompareExchangeTest0038）、min+1（CompareExchangeTest0039）、0↔max（CompareExchangeTest0015/0040）
  - 异常与非法输入：ParameterTest CompareExchangeRejectedArrays 断言 TypeError；CompareExchangeIndexParameters 越界断言 RangeError；CompareExchangeExpectedConversion 验证 expected/replacement 独立转换、mismatch 保留元素
  - 返回值与类型验证：CompareExchangeTest0001/0002 验证匹配返回旧值且替换、不匹配返回当前值且不替换；ParameterTest CompareExchangeNumberParameters 验证 NaN/Infinity/overflow 转换
  - 组合场景：load+compareExchange（CompareExchangeTest0011）、isLockFree/add/compareExchange（CompareExchangeTest0016）、sub/compareExchange（CompareExchangeTest0023）、exchange/compareExchange（CompareExchangeTest0026）、add/compareExchange/load（CompareExchangeTest0030）、offset view（CompareExchangeTest0034）、CAS 自增+mismatch（CompareExchangeTest0063）、成功+mismatch（CompareExchangeTest0065）
  - 重复调用/幂等性：CompareExchangeTest0005 多次连续 CAS、CompareExchangeTest0029 同索引不同 expected、CompareExchangeTest0013 多索引
  - 并发跨线程：CompareExchangeTest0042-0082 大量 async retry/CAS conflict/Promise.all/Promise.allSettled；ApiThirdlyTest taskpool；FunctionTest0002 worker CAS；ConcurrentTest 矩阵 CAS 重试；TypedArrayTest0012 taskpool CAS retry 不丢失（详见 §4）

### 1.8 load(typedArray, index): number
- 用例位置：`ArkTSUtilsAtomicsLoadTest.test.ets`（61 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（3 例：0015/0016/0017）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（多例 read back）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsMultithreadTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本读取、多 TypedArray、after and/or/add/xor/sub/store 修改后读、async/箭头/Promise、一致性。
  - 入参范围覆盖：async 箭头（LoadTest0001）、嵌套箭头（LoadTest0002）、Int16Array 中间索引（LoadTest0004）、Uint16Array 修改后（LoadTest0007）、Uint8Array 手动修改后（LoadTest0013）、Int8Array 验证器（LoadTest0019）、Int32Array 零初值（LoadTest0011）
  - 边界值测试：零初值（LoadTest0011）、中间索引（LoadTest0004）
  - 异常与非法输入：ParameterTest LoadRejectedArrays 断言 TypeError；LoadIndexParameters 越界断言 RangeError；LoadTest0012 嵌套箭头错误处理 invalid index
  - 返回值与类型验证：LoadTest0006 多次 load 一致性；ParameterTest LoadNumberParameters 验证有限/分数/NaN/Infinity/overflow
  - 组合场景：load after and（LoadTest0003）、load after or（LoadTest0017）、load after add/sub/store/xor/exchange/compareExchange（StoreTest/ExchangeTest/XorTest 多例交叉）、load+store 基本（CombTest0001）
  - 重复调用/幂等性：LoadTest0006 多次一致性检查
  - 并发跨线程：FunctionTest 多例 worker 修改后主线程 load 校验；MultithreadTest SharedCounter.load；ApiThirdly 并发后 load；Concurrent 矩阵 load（详见 §4）

### 1.9 store(typedArray, index, value): number
- 用例位置：`ArkTSUtilsAtomicsStoreTest.test.ets`（59 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（4 例：0021/0022/0023/0024）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0001/0010 worker store）+ `ArkTSUtilsAtomicsCombTest.test.ets`、`ArkTSUtilsTypedArrayAtomicsTest.test.ets`、`ArkTSUtilsAtomicsParameterTest.test.ets`（4 例）
- 测了哪些：基本存储、多 TypedArray、store 后接 add/or/xor/exchange/compareExchange/sub/and、async/箭头/Promise。
  - 入参范围覆盖：async 箭头（StoreTest0001）、嵌套箭头（StoreTest0002）、Int16Array 中间索引（StoreTest0004）、Int32Array 多值顺序（StoreTest0006）、Uint8Array 覆写（StoreTest0013）、Int8Array 范围验证（StoreTest0019）、Uint32Array 转换（StoreTest0021）
  - 边界值测试：零值（StoreTest0011）、Int8Array 范围（StoreTest0019）、Uint8Array 重试 invalid value（StoreTest0058）
  - 异常与非法输入：ParameterTest StoreRejectedArrays 断言 TypeError；StoreIndexParameters 越界断言 RangeError；StoreTest0012 嵌套箭头 invalid index 错误处理；StoreTest0020 invalid index 重试
  - 返回值与类型验证：store 后 load 校验（StoreTest0003）；ParameterTest StoreNumberParameters 验证 NaN/Infinity/overflow
  - 组合场景：store+load（StoreTest0003）、store+add（StoreTest0007/0028）、store+or（StoreTest0017）、store+xor（StoreTest0022/0025）、store+exchange（StoreTest0035/0049）、store+compareExchange（StoreTest0040/0055）、store+sub（StoreTest0037）、store+AND 清低 4 位（StoreTest0059）、store/sub/load（CombTest0046）
  - 重复调用/幂等性：StoreTest0006 多值顺序 store、StoreTest0013 覆写、StoreTest0027 批量 store
  - 并发跨线程：FunctionTest0001/0010 worker store 后主线程 load；Concurrent 矩阵 store 初始化；ApiThirdly store 初始化（详见 §4）

### 1.10 isLockFree(size): boolean
- 用例位置：`ArkTSUtilsAtomicsIsLockFreeTest.test.ets`（76 例）+ `ArkTSUtilsAtomicsApiSecondTest.test.ets`（3 例：0004/0005/0006）+ `ArkTSUtilsAtomicsCombTest.test.ets`（1 例：0008）+ `ArkTSUtilsAtomicsParameterTest.test.ets`（2 例：IsLockFreeByteSizes/IsLockFreeNumberConversion）+ `ArkTSUtilsTypedArrayAtomicsTest.test.ets`
- 测了哪些：1/2/4/8 字节返回 true、其余 false、NaN/Infinity/MAX_VALUE/MIN_VALUE/boolean/object/array 入参强转、async/Promise 组合。
  - 入参范围覆盖：1/2/4/8 字节（IsLockFreeTest 全套分布）、ApiSecondTest0004 验证 1/2/4/8 返回 true、ApiSecondTest0005 验证 -1/0/3/9/MAX_VALUE 返回 false
  - 边界值测试：Number.EPSILON（IsLockFreeTest0012 返回 false）、Number.MIN_VALUE（IsLockFreeTest0053 返回 false）、Number.MAX_VALUE（IsLockFreeTest0075 返回 false）、MAX_SAFE_INTEGER 2^53-1（IsLockFreeTest0071）、MIN_SAFE_INTEGER -2^53+1（IsLockFreeTest0072）、-Infinity（IsLockFreeTest0043）、NaN（IsLockFreeTest0033）
  - 异常与非法输入：ApiSecondTest0006 null/undefined 返回 false；IsLockFreeTest0068 boolean true、0069 object {value:4}、0070 array [4]——验证 ToNumber 强转；ParameterTest IsLockFreeNumberConversion 验证 fractional/NaN 走 ToIndex/ToInt32 转换
  - 返回值与类型验证：IsLockFreeTest0076 验证 isLockFree(8) 返回 boolean；ParameterTest IsLockFreeByteSizes 验证 size 1/2/4/8 成功、不支持字节宽度返回 false；IsLockFreeTest0074 4 字节多次调用一致性
  - 组合场景：isLockFree+add/compareExchange 序列（CompareExchangeTest0016、SubTest0011、XorTest0012）；async function/Promise.resolve/Promise.race/Promise.all/Promise.allSettled/async IIFE/async generator（IsLockFreeTest 全套）
  - 重复调用/幂等性：IsLockFreeTest0074 4 字节多次一致性
  - 并发跨线程：未发现（isLockFree 为纯查询，无共享状态语义，未在 taskpool/worker 文件中出现）

### 1.11 wait(typedArray, index, value, timeout?): string
- 用例位置：`ArkTSUtilsAtomicsWaitTest.test.ets`（15 例）+ `ArkTSUtilsAtomicsApiTest.test.ets`（7 例：0031-0037）+ `ArkTSUtilsAtomicsWaitNotifyParameterTest.test.ets`（14 例，wait+notify 混合）+ `ArkTSUtilsTypedArrayAtomicsTest.test.ets`（1 例：0010 wait 结果）+ `ArkTSUtilsAtomicsConcurrentTest.test.ets`（1 例：bounded queue wait/notify 背压）
- 测了哪些：返回值 not-equal/ok/timed-out、NaN/Infinity/fractional/negative timeout、跨 index notify、worker wait+add+load。
  - 入参范围覆盖：not-equal（WaitTest0001）、ok（WaitTest0002）、timed-out（WaitTest0003）、ApiTest0031-0037 不同 value/index/timeout
  - 边界值测试：NaN timeout（WaitTest0004）、fractional timeout（WaitTest0005）、negative timeout（WaitTest0006）、Infinity timeout（WaitTest0013）、Number.MAX_VALUE timeout（WaitTest0014）、finite timeout（WaitTest0015）、零/负/负无穷 timeout 立即返回（WaitNotifyParameterTest0071）、省略/undefined/NaN/Infinity timeout mismatch 立即返回（WaitNotifyParameterTest0072）
  - 异常与非法输入：WaitNotifyParameterTest0064 Int32Array 接受；0065 其余 collections 整数/浮点/clamped 抛 TypeError；0066 ordinary typed array 抛 TypeError；0067 null/undefined/number/string/object/buffer 抛 TypeError；0068 negative/length/infinite/unsafe index 抛 RangeError；0069 NaN/fractional index 走 ToIndex；WaitTest0012 worker 中越界 index 1 返回 RangeError；TypedArrayTest0008 不支持类型 TypeError、0009 越界 RangeError
  - 返回值与类型验证：WaitTest0001-0003 验证三种返回值字符串；WaitNotifyParameterTest0070 expected 截断 wrap to signed Int32；ApiTest0035 wait 时新值写入；ApiTest0036 wait+notify 唤醒；ApiTest0037 同位置多次 wait
  - 组合场景：wait+notify 跨 index（WaitTest0009 notify index 0 唤醒、index 1 timeout）；wait 唤醒后 add+load in worker（WaitTest0010）；wait+notify+add 多 worker ArrayBuffer（WaitTest0011）；wait+notify bounded queue 背压（ConcurrentTest bounded queue）
  - 重复调用/幂等性：ApiTest0037 同位置多次 wait；WaitNotifyParameterTest0072 多种 timeout 形式
  - 并发跨线程：WaitTest0009-0012 worker wait + 主线程 notify；WaitTest0010 worker wait 唤醒后 add+load；WaitTest0011 多 worker；ConcurrentTest bounded queue wait/notify 背压；TypedArrayTest0013 taskpool notify 唤醒等待任务（详见 §4）

### 1.12 notify(typedArray, index, count?): number
- 用例位置：**无专用文件**。覆盖于 `ArkTSUtilsAtomicsApiSecondTest.test.ets`（3 例：0001/0002/0003）+ `ArkTSUtilsAtomicsWaitTest.test.ets`（内嵌于 0002/0007/0008/0009/0010/0011）+ `ArkTSUtilsAtomicsWaitNotifyParameterTest.test.ets`（NotifyCountConversion/NotifyInfiniteCount/NotifyAddressIsolation 等 ~5 例）+ `ArkTSUtilsTypedArrayAtomicsTest.test.ets`（0013 taskpool notify）+ `ArkTSUtilsAtomicsConcurrentTest.test.ets`（bounded queue notify）+ `ArkTSUtilsAtomicsFunctionTest.test.ets`（0004 worker wait/notify）
- 测了哪些：唤醒数量返回值、不同 index/count、NaN/Infinity count、address isolation。
  - 入参范围覆盖：ApiSecondTest0001 notify 唤醒 wait queue；0002 不同 index（-1/0/length-1）；0003 不同 count（0/1/3）
  - 边界值测试：NaN count（WaitTest0007）、Infinity count（WaitTest0008/WaitNotifyParameterTest0075）、零/负 count 唤醒 nobody（WaitNotifyParameterTest0074）、fractional count 截断+默认唤醒（WaitNotifyParameterTest0074）
  - 异常与非法输入：WaitNotifyParameterTest0065/0066/0067 非 Int32Array/null/undefined 抛 TypeError；0068 越界 index 抛 RangeError；0069 NaN/fractional index 走 ToIndex
  - 返回值与类型验证：ApiSecondTest0001 返回唤醒 agent 数；WaitNotifyParameterTest0074 count 转换
  - 组合场景：notify+wait（WaitTest 全套）；notify address isolation（WaitNotifyParameterTest0076 其余 index/array 无法唤醒、offset alias 可以）；bounded queue notify 背压（ConcurrentTest）
  - 重复调用/幂等性：WaitNotifyParameterTest0075 infinite count 重试唤醒两个 waiter
  - 并发跨线程：WaitTest0009-0011 worker wait + 主线程 notify；FunctionTest0004 worker wait/notify；TypedArrayTest0013 taskpool notify 唤醒等待任务；ConcurrentTest bounded queue（详见 §4）

### 1.13 补充用例（源码审计驱动，ArkTSUtilsAtomicsSupplementTest.test.ets，50 例）

> 基于 `collections_atomics.cpp`（399 行）+ `collections_atomic_helper.cpp`（323 行）+ 父类 `builtins_atomics.cpp` + `atomic_helper.h` 源码逐分支核查，结合 C++ 单元测试（`builtins_atomics_test.cpp` 53 例 + `atomic_helper_test.cpp` 21 例）对照补充。

| 分组 | 用例数 | 优先级 | 覆盖场景 | 对照源码/C++测试 |
|------|--------|--------|----------|-----------------|
| A: IsLockFree ToInt32 规范偏差 | 6 | P0 | `isLockFree(2^32+{1,2,4,8})` → ToInt32 wrap 返回 true（ES2021 规范 ToIntegerOrInfinity 应返回 false） | `builtins_atomics.cpp:140` ToInt32 vs ToIntegerOrInfinity |
| B: GetAgentCanSuspend | 2 | P0 | 主线程调 wait（非阻塞环境）→ GetAgentCanSuspend 检查抛 ParameterError | `collections_atomics.cpp:256-259`；C++ `SharedInt32WaitAndNotify` |
| D: Worker terminate UAF | 3 | P0 | worker wait 期间 terminate → onexit 确认销毁 → notify 返回 0（规格：已销毁线程非等待线程） | `collections_atomics.cpp:322-330` DeleteNode 不执行风险；C++ 无此测试 |
| E: 非对齐 byteOffset 构造防御 | 5 | P0 | Int32Array(sab,1,1)/Int16Array(sab,1,3)/Int32Array(sab,2,1)/Int32Array(sab,3,1) → 构造函数拒绝非 BYTES_PER_ELEMENT 整数倍 byteOffset；Int32Array(sab,4,1) 正常 | 防御 `atomic_helper.h` functor `reinterpret_cast<std::atomic<T>*>` 非对齐 UB |
| F: notify 专用 | 8 | P1 | 无 waiter→0、count=0/-1/1.9 截断、不同 index 隔离、不同 backing 隔离、count=1 精确唤醒 1/2、省略 count 唤醒全部 | C++ `NotifyHonorsCountAndSkipsInactiveWaiters` |
| G: load/store 边界值 | 12 | P1 | Int32 max/min、Int8 max/min、index=length-1、store 各类型返回值(ToInteger) vs 实存值(类型转换)：Uint8 256→0、Uint8 -1→255、Int8 128→-128、Uint16 65536→0、Uint32 4294967296→0 | C++ `SharedIntegerTypedArrayWraparound` + `IntegerStoreLoadConversions` |
| J: 文档符合性 | 6 | P1 | 文档示例逐句验证：add(10+3=13)、store Uint8(257→返回257实存1)、compareExchange(匹配+不匹配)、and(10&3=2)、or(10|3=11)、xor/sub/exchange/load | 接口文档 `arkts-apis-arkts-utils-Atomics.md` |
| K: wait timeout=0/-1 | 2 | P0 | wait timeout=0 + value 匹配 → 'timed-out'；timeout=-1 + value 匹配 → ConvertTimeout(-1)→0 → 'timed-out' | `collections_atomics.cpp:228-231` ConvertTimeout；C++ `SharedWaitTimeoutAndMismatchCombinations` |
| L: 6 类型系统 wraparound | 6 | P0 | Int8 127+1→-128、Uint8 255+1→0、Int16 32767+1→-32768、Uint16 65535+1→0、Int32 MAX+1→MIN、Uint32 MAX+1→0 | C++ `SharedIntegerTypedArrayWraparound` |

---

## 2. 稳定性

`ArkTSUtilsAtomicsApiThirdlyTest.test.ets` 0003 执行 1000 次循环 add 并通过 `MemoryMonitor.takeSnapshot` 检测内存泄漏，0005 执行 1000 次循环 add + 周期 gc。补充用例（SupplementTest Group D）覆盖 worker terminate 期间 wait 的 UAF 风险验证：worker wait → terminate → onexit 确认销毁 → notify 验证 stale node 是否清理（源码 P1/P5：`DeleteNode` 在 `WaitOnNode` 返回后才执行，terminate 直接杀线程可能导致 node 残留）。补充用例 Group E 覆盖非对齐 byteOffset 构造防御验证。

## 3. 性能

未发现独立的性能基准（耗时断言）用例。`ArkTSUtilsAtomicsApiThirdlyTest.test.ets` 0004/0005 用 `Date.now()` 记录 taskpool 10 任务并发 + 1000 次循环 add 的耗时并 `console.info` 输出，但未对耗时做 `expect` 断言（仅断言最终结果 0/1000）。`ArkTSUtilsAtomicsConcurrentTest.test.ets` 矩阵乘 + 128 job 队列属功能并发而非性能基准。

## 4. 并发安全（并发文件用例归类）

> 本节归集跨线程/跨 worker/taskpool 的并发原子性验证用例。

| 用例 | 文件 | 接口 | 并发场景 |
|------|------|------|----------|
| `testArkTSUtilsAtomicsAdd0033` | AddTest | add | 多 worker 同位置安全 add |
| `testArkTSUtilsAtomicsAdd0034` | AddTest | add | Promise.all 协调多 worker add |
| `testArkTSUtilsAtomicsAdd0032` | AddTest | add | Promise 异步原子操作 |
| `testArkTSUtilsAtomicsAdd0036/0038` | AddTest | add | 嵌套 Promise 顺序原子 |
| `testArkTSUtilsAtomicsAdd0041/0046` | AddTest | add | async iteration / async-await 多原子 |
| `testArkTSUtilsAtomicsAdd0043/0048` | AddTest | add | Promise.race / Promise+timeout |
| `testArkTSUtilsAtomicsAdd0054` | AddTest | add | Promise.allSettled |
| `testArkTSUtilsAtomicsAnd0008` | AndTest | and | 多线程 AND 原子性（desc 描述） |
| `testArkTSUtilsAtomicsAnd0042-0083` | AndTest | and | async/Promise.all/Promise.race/allSettled 闭包 |
| `testArkTSUtilsAtomicsExchange0030-0080` | ExchangeTest | exchange | async retry/Promise.race/cross-index/Promise.allSettled |
| `testArkTSUtilsAtomicsCompareExchange0042-0082` | CompareExchangeTest | compareExchange | async retry/CAS conflict/Promise.all/allSettled/race |
| `testArkTSUtilsAtomicsSub0023-0062` | SubTest | sub | async/Promise/闭包/CAS 自减/资源回滚 |
| `testArkTSUtilsAtomicsXor0026-0064` | XorTest | xor | async/Promise/闭包 |
| `testArkTSUtilsAtomicsStore0005/0010/0033-0058` | StoreTest | store | async/Promise.race/Promise.all/批量 |
| `testArkTSUtilsAtomicsLoad0001-0061`（多数） | LoadTest | load | async/Promise 读后校验 |
| `testArkTSUtilsAtomicsFunction0001-0010` | FunctionTest | store/load/compareExchange/or/xor/and/exchange/sub | taskpool 跨任务原子，主线程 read back 校验（Int8/Int16/Int32/Uint8/Uint16/Uint32） |
| `testArkTSUtilsAtomicsMultithread0001-0004` | MultithreadTest | add/sub/and/exchange/load | worker.ThreadWorker 双 worker 共享 ArrayBuffer + SharedCounter 封装 |
| `testArkTSUtilsAtomicsApiThirdly0002` | ApiThirdlyTest | exchange | taskpool 10 任务并发 exchange 写 distinct indices，校验 `sharedArray[i]==i` |
| `testArkTSUtilsAtomicsApiThirdly0004` | ApiThirdlyTest | store/load | taskpool 10 任务 atomicTask 并发，校验最终 0 |
| `testArkTSUtilsAtomicsApiThirdly0005` | ApiThirdlyTest | add/load | 1000 次循环 add + 周期 gc，校验 1000 |
| `testArkTSUtilsAtomicsTaskpoolMatrix0014` | ConcurrentTest | add/compareExchange/load/store | 64×16 × 16×64 矩阵乘，动态行调度 + CAS 最大重试 |
| `testArkTSUtilsAtomicsTaskpoolBoundedQueue0015` | ConcurrentTest | store/load/wait/notify/or/xor | 128 job 八槽有界队列，背压 + wait/notify 协调 |
| `testArkTSUtilsAtomicsWait0009-0012` | WaitTest | wait/notify/add/load | worker wait + 主线程 notify 跨 index |
| `testArkTSUtilsAtomicsWait0010` | WaitTest | wait/notify/add/load | worker wait 唤醒后 add+load |
| `testArkTSUtilsAtomicsWait0011` | WaitTest | wait/notify/add | 多 worker 共享 ArrayBuffer |
| `testArkTSUtilsInt32ArrayTaskpoolAdd0011` | TypedArrayTest | add | taskpool 并发 add 不丢失 |
| `testArkTSUtilsInt32ArrayTaskpoolCas0012` | TypedArrayTest | compareExchange | taskpool CAS retry 不丢失并发更新 |
| `testArkTSUtilsInt32ArrayTaskpoolNotify0013` | TypedArrayTest | notify/wait | taskpool notify 唤醒等待任务 |

并发覆盖较全：RMW 七接口、load/store、wait/notify 均有 taskpool 或 worker 跨线程用例；isLockFree 无并发用例（符合其纯查询语义）。

## 5. 兼容性与继承

| 用例 | 文件 | 场景 |
|------|------|------|
| `testArkTSUtilsAtomicsRejectOrdinaryTypedArrays` | EntryTest | 验证 ArkTSUtils.Atomics 对 ordinary（非 collections）TypedArray 的每个操作均拒绝（TypeError），含 SharedArrayBuffer 包装的 Int32Array |
| `testArkTSUtilsAtomicsForwardSendableOperations` | EntryTest | 验证 ArkTSUtils 导出 Atomics 且 sendable 操作可用、运行时检查生效 |
| `testArkTSUtilsAtomicsKeepsGlobalAtomics` | EntryTest | 验证全局 Atomics 仍接受 ordinary array，isLockFree 结果保留 |
| `testArkTSUtilsAtomicsApiThirdly0001` | ApiThirdlyTest | ExtendedAtomics 静态类继承包装 exchange，验证可被继承调用 |
| `ParameterTest` 6 种 TypedArray width（Int8/Uint8/Int16/Uint16/Int32/Uint32） | ParameterTest | 所有数值操作遵守各类型 signedness/width/modulo 转换 |

未发现：与旧版 global Atomics 的 API 签名差异对比、版本迁移、deprecated 标记用例。

## 6. 资料与文档符合性

未发现直接对照 SDK .d.ts 接口文档逐条核对的用例。`ArkTSUtilsAtomicsEntryTest` 三例验证导出契约（reject ordinary / forward sendable / keep global），间接对应文档中"ArkTSUtils.Atomics 仅接受 collections Sendable TypedArray"的描述。`ArkTSUtilsAtomicsApiTest` 37 例按 API 顺序覆盖 10 个数据接口的 value/index/timeout 维度，与文档接口清单一致，但未显式 assertEqual 文档示例值。

## 7. 覆盖度矩阵与缺口分析（源码审计驱动）

### 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有专用/综合用例覆盖；⚠️ 仅在综合套件中零星覆盖或弱覆盖；❌ 未发现

| 接口 | 入参范围 | 边界值 | 异常非法输入 | 返回值类型 | 组合场景 | 重复幂等 | 并发跨线程 |
|------|----------|--------|--------------|------------|----------|----------|------------|
| add | ✅ AddTest 58 | ✅ overflow/underflow/wraparound/max size | ✅ TypeError+RangeError（ParameterTest） | ✅ 返回旧值 | ✅ 9 接口组合 | ✅ 同索引多次 | ✅ worker/taskpool/CAS |
| sub | ✅ SubTest 67 | ✅ overflow/截断/max/min | ✅ TypeError+RangeError | ✅ 返回旧值 | ✅ add/load/exchange/CAS/回滚 | ✅ 两次/链式 | ✅ worker/taskpool |
| and | ✅ AndTest 83 | ✅ 零/max/min/64 位截断 | ✅ TypeError+RangeError+mask 强转 | ✅ 返回旧值 | ✅ 两次连续/Promise | ✅ 两次连续 | ✅ worker/taskpool |
| or | ✅ OrTest 58 | ✅ 零/max/负/overflow | ✅ TypeError+RangeError | ✅ 返回旧值 | ✅ xor+and bitmask | ✅ 多次 | ✅ worker/taskpool |
| xor | ✅ XorTest 67 | ✅ 全翻转/两次回原/max/min | ✅ TypeError+RangeError | ✅ 返回旧值 | ✅ toggle/exchange/and-or 序列 | ✅ 两次回原 | ✅ worker/taskpool |
| exchange | ✅ ExchangeTest 80 | ✅ max↔min/overflow/underflow | ✅ TypeError+RangeError | ✅ 返回旧值 | ✅ lock/compareExchange/state machine | ✅ 多次连续 | ✅ taskpool 并发 distinct indices |
| compareExchange | ✅ CompareExchangeTest 82 | ✅ max↔min/overflow/underflow/mid-range | ✅ TypeError+RangeError+expected 转换 | ✅ 匹配/不匹配返回 | ✅ load/add/sub/exchange 序列 | ✅ 多次连续/同索引不同 expected | ✅ taskpool CAS retry/矩阵 |
| load | ✅ LoadTest 61 | ⚠️ 零初值/中间索引（较弱） | ✅ TypeError+RangeError | ✅ 一致性 | ✅ after and/or/add/... | ✅ 多次一致性 | ✅ worker read back |
| store | ✅ StoreTest 59 | ⚠️ 零值/Int8 范围（较弱） | ✅ TypeError+RangeError+invalid index retry | ✅ store+load 校验 | ✅ add/or/xor/exchange/CAS/sub/and | ✅ 顺序/覆写/批量 | ✅ worker store+主线程 load |
| isLockFree | ✅ IsLockFreeTest 76 | ✅ EPSILON/MIN_VALUE/MAX_VALUE/MAX_SAFE_INT | ✅ null/undefined/boolean/object/array 强转 | ✅ boolean 返回+一致性 | ✅ 与 add/CAS 序列 | ✅ 多次一致性 | ❌ 未发现（符合查询语义） |
| wait | ✅ WaitTest 15 | ✅ NaN/Infinity/fractional/negative/MAX_VALUE timeout | ✅ TypeError+RangeError+expected 转换 | ✅ not-equal/ok/timed-out 三态 | ✅ wait+notify 跨 index/add/load | ✅ 同位置多次 | ✅ worker wait+主线程 notify/taskpool |
| notify | ⚠️ 无专用文件，ApiSecond 3 例 | ✅ NaN/Infinity/fractional/零负 count | ✅ TypeError+RangeError | ✅ 返回唤醒数 | ✅ wait+notify/address isolation | ✅ infinite count 重试 | ✅ worker/taskpool notify |

### 7.2 逐接口源码分支覆盖核查（源码审计驱动）

> 对照 `collections_atomics.cpp`（399 行）+ `collections_atomic_helper.cpp`（323 行）逐分支核查。详见 `arktsutils_atomics_supplement_testdesign.md` 第二节。

| 接口 | 已覆盖分支 | 未覆盖分支 | 源码稳定性风险 |
|------|-----------|-----------|---------------|
| add/sub/and/or/xor/exchange/compareExchange | B1-B4,B6-B9,B11-B19 ✅ | B5(detached SAB)❌, B10(ValidateAtomicBuffer 第二次)❌, B20(ModifyInteger 第二次 detach)❌ | P3: functor 非对齐 `reinterpret_cast` UB |
| load | L1-L3,L5 ✅ | L4(detached SAB)❌ | 同上 |
| store | S1-S4,S6-S7 ✅ | S5(detached SAB after ToInteger promote)❌ | 同上 |
| isLockFree | I1-I4 ✅ | I5(ToInt32 规范偏差)❌ **源码缺陷** | P4: `ToInt32(2^32+4)`→4→true，规范应 false |
| wait | W1-W9,W12-W17 ✅ | W10(GetAgentCanSuspend)❌, W11(detached)❌ | P1: arrayHandle_ UAF(worker terminate); P2: TOCTOU detach; P5: 线程终止无清理; P6: timeout uint64 溢出 |
| notify | N1-N6,N8-N10,N12-N13 ✅ | N7(detached)❌, N11(waiter backing detached 跳过)❌ | P5: 同 wait（SignalShared 遍历已终止 worker node） |

### 7.3 接口组合遗漏

| 遗漏 | 说明 | 补充用例 |
|------|------|----------|
| detached SAB 全接口 | 12 接口均有 detach 检查分支，0 测试 | 分组 C（7 条，需 NAPI） |
| Worker 终止 + wait/notify | UAF 风险路径无测试 | 分组 D（3 条） |
| 非对齐 byteOffset + RMW | functor 对齐 UB 无测试 | 分组 E（5 条） |
| store 返回值 vs 实存值各类型 | 文档仅验证 Uint8Array 257，缺其余 5 类型 | 分组 G（12 条） |
| notify 多 waiter count 精确唤醒 | 仅 address isolation + infinite count，缺 count=1/2/N 精确 | 分组 F（12 条） |
| GC 期间 wait arrayHandle_ 稳定性 | Barriers 跨线程读取路径无测试 | 分组 H（4 条） |

### 7.4 文档与测试一致性建议

| 文档要点 | 测试状态 | 建议 |
|----------|----------|------|
| store "返回 value 整数化后的值，不包含位宽转换" | ✅ 文档示例 Uint8Array 257 验证 | 补充全 6 类型矩阵（SUP_ATOMICS_STORE_008） |
| wait "调用线程必须允许阻塞等待" | ❌ GetAgentCanSuspend 分支未测试 | 补充 SUP_ATOMICS_WAIT_001/002 |
| notify "等待与通知必须针对同一底层缓冲区的同一字节位置" | ✅ address isolation 测试 | 补充 byteOffset alias 精确验证（SUP_ATOMICS_NOTIFY_009） |
| isLockFree "该值按32位整数转换" | ⚠️ 文档明确说 ToInt32，但 ES2021 规范要求 ToIntegerOrInfinity | 与开发确认是否为有意设计；若为 bug 则源码需修复 |
| compareExchange 4 参数 | ✅ expected/replacement 转换测试 | 补充 detach between expected/replacement（SUP_ATOMICS_DETACH_006） |

### 7.5 优先级建议

| 优先级 | 缺口 | 用例数 | 实施条件 |
|--------|------|--------|----------|
| P0 | IsLockFree 规范偏差（G01） | 6 | 纯 ArkTS，需先确认产品预期 |
| P0 | GetAgentCanSuspend（G02） | 2 | 纯 ArkTS，主线程执行 |
| P0 | Detached SAB（G03） | 7 | 需 NAPI detach 辅助 |
| P0 | Worker 终止 UAF（G04） | 3 | 纯 ArkTS |
| P0 | 非对齐 byteOffset（G05） | 5 | 需确认构造函数支持 |
| P1 | notify 专用（G06） | 12 | 纯 ArkTS |
| P1 | load/store 边界值（G07） | 12 | 纯 ArkTS |
| P1 | Wait 超时/GC（G08/G09） | 4 | 纯 ArkTS |
| P1 | compareExchange detach（G10） | 1 | 需 NAPI |
| P1 | store 返回值矩阵（G11） | 8 | 纯 ArkTS（含在 G07 内） |
| P1 | notify 精确唤醒（G12） | 12 | 纯 ArkTS（含在 G06 内） |
| P1 | 文档符合性 | 6 | 纯 ArkTS |
| P2 | 并发 Fuzz（G13/G14） | 6 | 纯 ArkTS |
| **合计** | | **63** | P0=23, P1=34, P2=6 |

> 补充用例已实现于 `ArkTSUtilsAtomicsSupplementTest.test.ets`（50 条，见 §1.13），源码审计详情见 §7.2。
