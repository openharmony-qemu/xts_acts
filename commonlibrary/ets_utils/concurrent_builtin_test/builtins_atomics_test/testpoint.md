# builtins_atomics_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/builtins_atomics_test/entry/src/ohosTest/ets/test/` 下 **18** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **1156** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。本套件为 Atomics 特性主套件。
> **契约来源**：`arkts/builtin/dynamic/lib.es2017.sharedmemory.d.ts`（L48–L135 Atomics 全方法）+ `lib.es2020.sharedmemory.d.ts`（L21–L98 BigInt64/BigUint64 重载）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
builtins_atomics_test（Atomics 特性主套件）
├── 1. 接口测试
│   ├── 1.1 add / 1.2 sub / 1.3 and / 1.4 or / 1.5 xor（算术+位运算，返回旧值；全 8 整数类型 + BigInt 重载）
│   ├── 1.6 load / 1.7 store / 1.8 exchange（读写+交换；全类型 + BigInt）
│   ├── 1.9 compareExchange（条件交换；6 整数类型，❌ BigInt 重载 0 覆盖）
│   ├── 1.10 wait / 1.11 notify（阻塞唤醒；Int32Array + BigInt64Array；count 全边界）
│   └── 1.12 isLockFree（全入参类型矩阵；API 矩阵/组合/多线程散入各接口 §1.x）
├── 2. 稳定性（无独立大规模长迭代套件，AtomicsMultithread 仅 4 例）
├── 3. 性能（隐含于各 100 例深套件，无独立基线）
├── 4. 并发安全（AtomicsMultithread 多线程原子性 + wait/notify 跨 worker 唤醒 + 多 worker add on SAB）
├── 5. 兼容性与继承（无子类化场景；BigInt 重载对称性）
└── 6. 资料与文档符合性（JS 内建无独立 SDK .md，契约以 lib.*.d.ts 为authoritative；部分 desc 占位 "Test"）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 18 文件 / 1156 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | AtomicsAPISecondTest.test.ets | 16 | Atomics·notify/isLockFree 边界 |
| 2 | AtomicsAPITest.test.ets | 37 | Atomics·API 矩阵(add/and 值/索引) |
| 3 | AtomicsAPIThirdlyTest.test.ets | 6 | Atomics·API 补充(desc 占位) |
| 4 | AtomicsFunctionTest.test.ets | 18 | Atomics·功能矩阵(desc 占位) |
| 5 | AtomicsMultithreadTest.test.ets | 4 | Atomics·多线程原子性 |
| 6 | atomicAddTest.test.ets | 100 | Atomics·add(BigInt 21) |
| 7 | atomicAndTest.test.ets | 100 | Atomics·and(BigInt 25) |
| 8 | atomicCompareExchangeTest.test.ets | 102 | Atomics·compareExchange(❌BigInt 0) |
| 9 | atomicExchangeTest.test.ets | 100 | Atomics·exchange(BigInt 13) |
| 10 | atomicIsLockFreeTest.test.ets | 100 | Atomics·isLockFree(全入参矩阵) |
| 11 | atomicLoadTest.test.ets | 100 | Atomics·load(BigInt 52) |
| 12 | atomicOrTest.test.ets | 99 | Atomics·or(BigInt 59) |
| 13 | atomicStoreTest.test.ets | 100 | Atomics·store(BigInt 54) |
| 14 | atomicSubTest.test.ets | 100 | Atomics·sub(BigInt 52) |
| 15 | atomicWaitTest.test.ets | 24 | Atomics·wait/notify(Int32+BigInt64) |
| 16 | atomicXorTest.test.ets | 100 | Atomics·xor(BigInt 54) |
| 17 | atomicsCombTest.test.ets | 50 | Atomics·组合(load+store/add/sub/exchange/compareExchange) |
| | **合计** | **1156** | 17 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 Atomics.add(typedArray, index, value)

```
add
├── 入参范围覆盖
│   ├── Int32Array 正值相加（atomicsAddTest001：add 10→old=0/new=10）
│   ├── 负值相加（002：add -5）
│   ├── Uint8/Uint16/Int8/Int16/Int32/Uint32 全 6 整数类型
│   └── BigInt64Array（004）+ BigUint64Array（067，21 处 BigInt 重载）
├── 边界值测试
│   ├── Uint8 溢出回绕（003：250+10→4）
│   ├── Int8 underflow（031）
│   ├── Int32 最大值相加（007）
│   └── BigInt 大值（-9007199254740991 + 1000000000000000，004）
├── 异常与非法输入
│   ├── 负 Infinity value→TypeError（037）
│   ├── Float32Array 不支持→TypeError（079）
│   └── 非共享 buffer→TypeError、OOB/负索引→RangeError、detached
├── 返回值与类型验证
│   └── 返回旧值（操作前值）
├── 组合场景
│   ├── add + load（001/002）
│   ├── add + sub 连续（043）
│   └── add 唤醒 wait（073，async wait+notify）
├── 重复调用/幂等性
│   └── 连续 add 旧值序列（Uint16 multiple additions 055）
└── 并发跨线程
    ├── 多 Worker Atomics.add on SAB（写可见性）
    └── AtomicsMultithreadTest 多线程原子性（4 例）
```

- **用例位置**：`atomics/atomicAddTest.test.ets`（100 `SUB_BUILTINS_Atomics_ADD_TEST_*`，BigInt 21 处）+ `AtomicsAPITest.test.ets`（add 索引边界 -1/0/length/length+1，0300）+ `AtomicsAPIThirdlyTest.test.ets`（6）+ `AtomicsMultithreadTest.test.ets`（多线程 add SAB）+ `atomicsCombTest.test.ets`（add 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 溢出/underflow 回绕 + 全异常码（TypeError/RangeError）+ add+load/sub/notify 组合 + 多 Worker SAB 写可见性；全 BigInt 重载覆盖。

---

## 1.2 Atomics.sub(typedArray, index, value)

```
sub
├── 入参范围覆盖
│   ├── Int32Array 基本减法（atomicsSubTest001）
│   ├── BigInt64Array 最大值相减（9223372036854775807n，019）
│   └── Int16Array/BigUint64Array（043/BigInt 52 处）
├── 边界值测试
│   ├── 同 index 连续减两次（013）
│   ├── BigInt 超 64 位截断（031）
│   └── Int16 16-bit range（043）
├── 异常与非法输入
│   ├── 非共享 ArrayBuffer→TypeError（BigInt64Array，007）
│   └── OOB/负索引→RangeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回旧值（操作前值）
├── 组合场景
│   ├── 箭头函数批量减多 index（025）
│   ├── BigInt64Array 链式 sub（037）
│   └── Promise.all 多 index sub（049）/ Promise.allSettled 有效无效混合（055）
├── 重复调用/幂等性
│   └── 连续 sub 旧值序列
└── 并发跨线程
    └── AtomicsMultithreadTest 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicSubTest.test.ets`（100 `SUB_BUILTINS_Atomics_sub_TEST_*`，BigInt 52 处）+ `AtomicsAPITest.test.ets`（sub 索引边界，2700）+ `atomicsCombTest.test.ets`（sub 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 连续减/截断 + 异常码 + Promise.all/allSettled 组合；全 BigInt 重载覆盖。

---

## 1.3 Atomics.and(typedArray, index, value)

```
and
├── 入参范围覆盖
│   ├── Uint8Array 基本 AND（atomicsAndTest001）
│   ├── Int32Array 全 1 mask（013）/ min Int32（019）
│   └── BigInt64Array async（061，25 处 BigInt 重载）
├── 边界值测试
│   ├── Infinity mask→自动转 0（031）
│   ├── 八进制 string mask 合法转换（037）
│   └── Uint32Array object mask→0（043）
├── 异常与非法输入
│   ├── 非共享 buffer→TypeError（025）
│   └── OOB/负索引→RangeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回旧值（007 验证返回操作前值）
├── 组合场景
│   ├── 嵌套 async（055）
│   ├── async loop with delay（067）
│   └── Promise.race 多 and 同 index 不同 mask（091）
├── 重复调用/幂等性
│   └── 连续 AND 旧值序列
└── 并发跨线程
    └── AtomicsMultithreadTest 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicAndTest.test.ets`（100 `SUB_BUILTINS_Atomics_and_TEST_*`，BigInt 25 处）+ `AtomicsAPITest.test.ets`（and 值边界 -1/0/1/7/MAX/MAX+1，0500）+ `atomicsCombTest.test.ets`（and 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + Infinity/object mask 转换 + 异常码 + async/Promise.race 组合；全 BigInt 重载覆盖。

---

## 1.4 Atomics.or(typedArray, index, value)

```
or
├── 入参范围覆盖
│   ├── Int32Array 基本 OR 返旧值（atomicsOrTest001）
│   ├── BigInt64Array 最大值（2^63-1n，019）/ 单 bit mask（025）
│   └── 超 32 位 mask 截断（031，BigInt 59 处）
├── 边界值测试
│   ├── 同 index OR 两次累积（013）
│   └── Infinity mask→0（049）
├── 异常与非法输入
│   ├── 非共享 ArrayBuffer→TypeError（BigInt64Array，007）
│   └── OOB/负索引→RangeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回旧值（操作前值）
├── 组合场景
│   ├── 箭头函数 mask 来自外层变量（043）
│   ├── 嵌套 async retry on invalid mask（055）
│   └── Promise.allSettled 不同 typed array OR（074）
├── 重复调用/幂等性
│   └── 连续 OR 旧值序列
└── 并发跨线程
    └── AtomicsMultithreadTest 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicOrTest.test.ets`（99 `SUB_BUILTINS_Atomics_or_TEST_*`，BigInt 59 处）+ `AtomicsAPITest.test.ets`（or 值边界 -1/0/1/7/MAX/MIN，1900）+ `atomicsCombTest.test.ets`（or 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 截断/Infinity mask + 异常码 + 嵌套 async/Promise.allSettled 组合；全 BigInt 重载覆盖。

---

## 1.5 Atomics.xor(typedArray, index, value)

```
xor
├── 入参范围覆盖
│   ├── Int32Array 基本 XOR 返旧值（atomicsXorTest001）
│   ├── BigInt64Array 最大值（9223372036854775807n，019）
│   └── 超 64 位截断（031，BigInt 54 处）
├── 边界值测试
│   ├── 同 index XOR 两次恢复原值（013）
│   └── Int16 16-bit range（043）
├── 异常与非法输入
│   ├── 非共享 ArrayBuffer→TypeError（BigInt64Array，007）
│   └── OOB/负索引→RangeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回旧值（操作前值）
├── 组合场景
│   ├── 箭头函数批量 XOR 多 index（025）
│   ├── BigInt64Array 链式 XOR（037）
│   └── Promise.all 多 index XOR（049）/ Promise.race 两 task 不同值（073）
├── 重复调用/幂等性
│   └── 连续 XOR 两次恢复原值（013）
└── 并发跨线程
    └── AtomicsMultithreadTest 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicXorTest.test.ets`（100 `SUB_BUILTINS_Atomics_xor_TEST_*`，BigInt 54 处）+ `AtomicsAPITest.test.ets`（xor 值边界 -1/0/1/7/MAX/MIN，2900）+ `atomicsCombTest.test.ets`（xor 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 两次 XOR 恢复 + 截断 + 异常码 + Promise.all/race 组合；全 BigInt 重载覆盖。

---

## 1.6 Atomics.load(typedArray, index)

```
load
├── 入参范围覆盖
│   ├── Int32Array 有效 index load（atomicsLoadTest001）
│   ├── BigInt64Array load（007，BigInt 52 处）
│   └── BigUint64Array async 嵌套（061）
├── 边界值测试
│   ├── 多次 load 一致性（019）
│   └── 嵌套箭头函数 index mapping（031）
├── 异常与非法输入
│   ├── index > array length→RangeError（Uint16Array，037）
│   ├── index 为 BigInt 非整数→TypeError（079）
│   └── 非共享 buffer→TypeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回当前值
├── 组合场景
│   ├── load 在 Promise.race + 箭头（025/043）
│   ├── load after add/and/exchange（AtomicsAPITest 1700）
│   └── 嵌套箭头 async value transformation（073）
├── 重复调用/幂等性
│   └── 多次 load 一致（019）
└── 并发跨线程
    └── 跨 Worker load、store 后 load 可见性（间接）
```

- **用例位置**：`atomics/atomicLoadTest.test.ets`（100 `SUB_BUILTINS_Atomics_load_TEST_*`，BigInt 52 处）+ `AtomicsAPITest.test.ets`（load 索引边界 + load after add/and/exchange，1500/1700）+ `atomicsCombTest.test.ets`（load+store 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 多次 load 一致 + 异常码（RangeError/TypeError）+ load after Other原子操作组合；全 BigInt 重载覆盖。

---

## 1.7 Atomics.store(typedArray, index, value)

```
store
├── 入参范围覆盖
│   ├── Int32Array 存值返 stored value（atomicsStoreTest001）
│   ├── BigInt64Array 存 BigInt（007，BigInt 54 处）
│   └── BigUint64Array async 嵌套（061）
├── 边界值测试
│   ├── 多次连续存值（019）
│   └── 嵌套箭头 index mapper（031）
├── 异常与非法输入
│   ├── index 超出 length→RangeError（Uint16Array，037）
│   ├── index 为 BigInt 非整数→TypeError（079）
│   └── 非共享 buffer→TypeError、Float32Array 不支持
├── 返回值与类型验证
│   └── 返回新值（stored value）
├── 组合场景
│   ├── store in Promise.race + 箭头（025/043）
│   ├── store→load 组合（atomicsComb load+store）
│   └── 嵌套箭头 async transformation（073）
├── 重复调用/幂等性
│   └── 重复 store/load 一致（019）
└── 并发跨线程
    └── 跨 Worker store、store 后 wait 唤醒（间接）
```

- **用例位置**：`atomics/atomicStoreTest.test.ets`（100 `SUB_BUILTINS_Atomics_store_TEST_*`，BigInt 54 处）+ `AtomicsAPITest.test.ets`（store 索引边界，2100/2300）+ `atomicsCombTest.test.ets`（store+load 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载 + 多次 store 一致 + 异常码 + store→load 组合；全 BigInt 重载覆盖。

---

## 1.8 Atomics.exchange(typedArray, index, value)

```
exchange
├── 入参范围覆盖
│   ├── Int32Array 替换返旧值（atomicsExchangeTest001）
│   ├── BigInt64Array 64-bit BigInt 替换（007，BigInt 13 处）
│   └── BigUint64Array 大正 BigInt（037）
├── 边界值测试
│   ├── Uint8 溢出（019）/ Uint16 溢出（025）
│   ├── Uint32 max-1（04294967294，043）
│   └── Int32 -1 最小负值（049）
├── 异常与非法输入
│   ├── 负 index→RangeError（013）
│   └── 非共享 buffer→TypeError、Float32Array 不支持、detached
├── 返回值与类型验证
│   └── 返回旧值（替换前值）
├── 组合场景
│   ├── 嵌套 exchange async error handling（055）
│   ├── async subclass inherited method（067）
│   └── 嵌套 async lock/unlock（079）
├── 重复调用/幂等性
│   └── 连续 exchange 旧值序列
└── 并发跨线程
    └── AtomicsMultithreadTest 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicExchangeTest.test.ets`（100 `SUB_BUILTINS_Atomics_exchange_TEST_*`，BigInt 13 处，含 BigUint64Array 64-bit BigInt 替换）+ `AtomicsAPITest.test.ets`（exchange 索引边界，1100/1300）+ `atomicsCombTest.test.ets`（exchange 组合）。
- **测了哪些**：全 6 整数类型 + BigInt64/BigUint64 重载（含 BigUint64Array 64-bit 替换专例）+ 溢出 + 异常码 + 嵌套 async/lock 组合；全 BigInt 重载覆盖。

---

## 1.9 Atomics.compareExchange(typedArray, index, expected, replacement)

```
compareExchange
├── 入参范围覆盖
│   ├── 匹配→交换返旧值（atomicsCompareExchangeTest001）
│   ├── Uint32Array/Uint8/Uint16/Int8/Int16/Int32 全 6 整数类型（007~）
│   └── ❌ BigInt64Array/BigUint64Array 重载 0 覆盖（见 §7.2）
├── 边界值测试
│   ├── Uint8 溢出（019）/ Uint16 max（025）/ Uint32 max-1（055）
│   ├── Uint8 zero→max（031）/ Uint32 wrapping（037）
│   └── same expected+new、正负互换
├── 异常与非法输入
│   ├── 负 index→RangeError（013）
│   ├── 缺参→throw（043）
│   └── 非共享 buffer→TypeError、Float32Array 不支持、detached
├── 返回值与类型验证
│   ├── 匹配→交换返回旧值
│   └── 不匹配→不交换返回当前值
├── 组合场景
│   ├── async 多线程 CAS（061）
│   ├── async generator CAS（067）
│   ├── 多 index ordered dependencies（073）
│   └── 嵌套 CAS async timeout fallback（079）/ async class inherited（091）
├── 重复调用/幂等性
│   └── 相同 expected 多次调用
└── 并发跨线程
    └── AtomicsMultithreadTest CAS 多线程原子性（间接）
```

- **用例位置**：`atomics/atomicCompareExchangeTest.test.ets`（100 `SUB_BUILTINS_Atomics_compareExchange_TEST_001~100`）+ `AtomicsAPITest.test.ets`（compareExchange 索引边界，0700/0900）+ `atomicsCombTest.test.ets`（compareExchange 组合）。
- **测了哪些**：6 整数类型 + 匹配/不匹配 + 溢出/回绕 + 全异常码 + 连续/多索引/async CAS 嵌套；❌ BigInt64Array/BigUint64Array 重载 0 覆盖、❌ NaN expected/replacement 未测（见 §7.2）。

---

## 1.10 Atomics.wait(typedArray, index, value, timeout?)

```
wait
├── 入参范围覆盖
│   ├── Int32Array 值不匹配→"not-equal"（atomicsWaitTest001）
│   ├── Int32Array notify 唤醒→"ok"（002）
│   ├── Int32Array 超时→"timed-out"（003）
│   └── BigInt64Array 三返回值（004/005/006）
├── 边界值测试
│   ├── timeout=0→立即 "timed-out"（016）
│   ├── timeout=undefined→Infinity（010，永不超时）
│   ├── timeout=NaN→Infinity（011，BigInt64 被 notify 唤醒）
│   └── timeout 负值→0（012，立即超时）
├── 异常与非法输入
│   ├── Uint32Array wait→TypeError（007）
│   ├── 非 SharedArrayBuffer→TypeError（013）
│   └── OOB index→RangeError（008）/ 负 index→RangeError（009）
├── 返回值与类型验证
│   └── 返 "ok"/"not-equal"/"timed-out"
├── 组合场景
│   ├── wait + notify（002/005）
│   ├── 值变更后 notify 唤醒（014/015）
│   └── wait + add + load（间接）
├── 重复调用/幂等性
│   └── 连续 wait 超时序列
└── 并发跨线程
    ├── Worker 内 wait（020~0023）
    └── notify 唤醒多 worker
```

- **用例位置**：`atomics/atomicWaitTest.test.ets`（23 `SUB_BUILTINS_Atomics_wait_TEST_0001~0023`：wait 部分）+ `AtomicsAPITest.test.ets`（wait 基本语义，3100）。
- **测了哪些**：wait 三返回值×Int32+BigInt64 + 全 timeout 边界（0/undefined/NaN/negative）+ 全 wait 异常码（TypeError/RangeError）+ 值变更后 notify 唤醒 + Worker 内 wait；无缺口。

---

## 1.11 Atomics.notify(typedArray, index, count?)

```
notify
├── 入参范围覆盖
│   ├── notify 唤醒 wait queue（AtomicsAPISecond 3800）
│   ├── notify 不同 index：-1/0/length/length+1（3900）
│   └── notify count：0/1/3（4000）
├── 边界值测试
│   ├── count=NaN/Infinity/MAX_VALUE+1（atomicWaitTest 补充）
│   └── 值变更后 notify（014/015）
├── 异常与非法输入
│   └── ❌ notify 自身 typedArray/index 错误路径（非共享/越界/负索引→RangeError）未见（见 §7.2）
├── 返回值与类型验证
│   └── 返回唤醒数（number）
├── 组合场景
│   ├── notify 唤醒多 worker（020~0023）
│   ├── 多 worker Atomics.add on SAB→notify（022/023）
│   └── notify + add + wait 闭环
├── 重复调用/幂等性
│   └── 连续 notify 唤醒数衰减
└── 并发跨线程
    ├── notify 唤醒多 worker
    └── 多 worker add on SAB
```

- **用例位置**：`atomics/AtomicsAPISecondTest.test.ets`（notify 16 `SUB_ATOMICS_API_TEST_3800~`：notify 唤醒/count=0/1/3/index 边界）+ `atomics/atomicWaitTest.test.ets`（notify 唤醒多 worker 段）。
- **测了哪些**：notify count 全边界（0/1/3/NaN/Infinity/MAX+1）+ 多 worker 唤醒 + 值变更后 notify；❌ notify 自身 typedArray/index 错误路径未见（SUP_ATOMICS_NOTIFY_ERRPATH_001）。

---

## 1.12 Atomics.isLockFree(size)

```
isLockFree
├── 入参范围覆盖
│   ├── size 1/2/4/8→true（atomicsIsLockFreeTest 001/013/4 vs 8 比较 025）
│   ├── size 0/3/16/-1/2.5→false
│   └── string/null/undefined/object/array/boolean/BigInt/NaN/Infinity→false（全入参矩阵）
├── 边界值测试
│   ├── 4 vs 8 比较（025）
│   └── Integer.MAX_VALUE/MAX_VALUE+1→false（AtomicsAPISecond 4200）
├── 异常与非法输入
│   └── 非数值入参→false（null/undefined 4300）
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── 1/2/4/8→true、其余→false
├── 组合场景
│   ├── async/Promise.resolve 内调用（037/043）
│   ├── Promise.all/allSettled/race 内 mixed sizes（049/061/091）
│   └── async generator/batch check（067/085）
├── 重复调用/幂等性
│   └── 多次调用一致（AtomicsAPISecond 4100~4300）
└── 并发跨线程
    └── 同步函数，无跨线程语义（⑦❌ 为契约特性）
```

- **用例位置**：`atomics/atomicIsLockFreeTest.test.ets`（100 `SUB_BUILTINS_Atomics_isLockFree_TEST_*`：全入参矩阵）+ `AtomicsAPISecondTest.test.ets`（isLockFree 1/2/4/8 边界 + null/undefined 4100~4300）。
- **测了哪些**：isLockFree 全入参类型矩阵（1/2/4/8→true；0/3/16/-1/2.5/string/null/undefined/object/array/boolean/BigInt/NaN/Infinity→false）+ 真/假判定 + 异步上下文（Promise.all/race/allSettled/async generator）；无缺口。

> 注：组合场景文件 `atomicsCombTest.test.ets`（50 `SUB_BUILTINS_Atomics_TEST_*`：load+store/exchange/add/sub/compareExchange 序列 + 重叠视图/多 buffer/字节序/状态机/typed array slice 组合）覆盖多方法串联，其用例散入上述各接口的「组合场景」分支；`AtomicsAPITest.test.ets`（37：各方法值/索引边界）、`AtomicsAPIThirdlyTest.test.ets`（6）、`AtomicsFunctionTest.test.ets`（18）、`AtomicsMultithreadTest.test.ets`（4：多线程原子性）按方法散入各接口的对应分支（@tc.desc 多为占位 "Test"/"test"，信息密度低，见 §7.4）。

---

# 2. 稳定性
- **用例位置**：无独立大规模长迭代套件；`AtomicsMultithreadTest`（4 例多线程原子性）+ 各 100 例深套件隐含稳定性。
- **测了哪些**：各方法 100 例深套件隐含稳定性 + 4 例多线程原子性；❌ 无独立长时运行/循环创建销毁压测（见 §7.4）。

# 3. 性能
- **用例位置**：各 100 例深套件隐含吞吐；无独立计时/吞吐基准。
- **测了哪些**：隐含吞吐（100 例全类型矩阵）；❌ 无单方法基线延迟/吞吐基准（如 add 单次延迟、wait 唤醒延迟统计）。

# 4. 并发安全
- **用例位置**：`AtomicsMultithreadTest`（4 例多线程原子性）+ `atomicWaitTest`（`0020~0023` worker wait/多 worker 唤醒/多 worker add on SAB）+ `atomicAddTest`（add+notify 异步 wait、async wait+notify）。
- **测了哪些**：多 Worker Atomics.add on SAB 写可见性 + wait/notify 跨 worker 唤醒 + 多线程原子性（Atomics 核心并发语义覆盖较充分）。

# 5. 兼容性与继承
- **用例位置**：BigInt 重载散见各 100 例深套件（add/sub/and/or/xor/load/store/exchange 八方法 BigInt64/BigUint64 标注）。
- **测了哪些**：BigInt 重载对称性（八方法均覆盖 BigInt64/BigUint64，唯 compareExchange 0 覆盖）；❌ 无子类化场景（Atomics 为静态方法，无实例继承语义）。

# 6. 资料与文档符合性
- **用例位置**：`AtomicsAPIThirdlyTest`/`AtomicsFunctionTest`/`AtomicsMultithreadTest` 的 @tc.desc 多为占位 "Test"/"test"（grep 确认）。
- **测了哪些**：JS 内建 Atomics 无独立 SDK 文档（.md），契约以 `lib.es2017/2020.sharedmemory.d.ts` 为authoritative；⚠️ 部分套件 desc 占位 "Test"（信息密度低，见 §7.4 #3）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| add/sub/and/or/xor | ✅(5×100) | ✅(溢出/回绕) | ✅(TypeError/RangeError) | ✅(旧值) | ✅(add+notify) | ✅(旧值序列) | ✅(多 Worker SAB) |
| load/store/exchange | ✅(3×100) | ✅(索引/极值) | ✅(TypeError/RangeError) | ✅(当前/新/旧值) | ✅(store→load) | ✅ | ✅(跨 Worker) |
| compareExchange | ✅(100,6 类型) | ✅(溢出/正负互换) | ✅(TypeError/RangeError) | ✅(匹配/不匹配) | ✅(连续/多索引) | ✅ | 🟡(间接 CAS) |
| wait | ✅(23,Int32+BigInt64) | ✅(timeout 全边界) | ✅(TypeError/RangeError) | ✅(三返回值) | ✅(wait+notify/add) | ✅(衰减) | ✅(Worker wait) |
| notify | ✅(count 全边界) | ✅ | 🟡(自身 typedArray/index 错误路径❌) | ✅(唤醒数) | ✅(多 worker) | ✅ | ✅(多 worker 唤醒) |
| isLockFree | ✅(100,全入参) | ✅(4 vs 8) | ✅(非数值→false) | ✅(boolean) | ✅(async/组合) | ✅ | 🟡(同步) |
| compareExchange BigInt 重载 | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |

## 7.2 逐接口遗漏确认（对照 `lib.es2017/2020.sharedmemory.d.ts`）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ts） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `add`/`sub`/`and`/`or`/`xor` | 返旧值，全 8 整数类型 + BigInt64/BigUint64 | ✅ 覆盖：5×100 例全类型 + BigInt 重载 + 溢出/回绕 + 全异常码 + 多 Worker SAB 写可见性。无缺口。 |
| 2 | `load`/`store`/`exchange` | 返当前/新/旧值，全类型 + BigInt | ✅ 覆盖：3×100 例全类型 + BigInt + exchange BigUint64Array 64-bit 替换专例。无缺口。 |
| 3 | `compareExchange` | 返旧值/当前值，6 整数类型 + BigInt64/BigUint64 重载 | ✅ 6 整数类型覆盖。❌ **BigInt64Array/BigUint64Array 重载 0 覆盖**（与 add/sub/.../load/store/exchange 八方法 BigInt 全覆盖不对称，SUP_ATOMICS_CAS_BIGINT_001）；❌ **NaN expected/replacement 未测**（SUP_ATOMICS_CAS_NAN_001）。 |
| 4 | `wait` | 返 "ok"/"not-equal"/"timed-out"，Int32Array + BigInt64Array | ✅ 覆盖：23 例三返回值×Int32+BigInt64 + 全 timeout 边界 + 全 wait 异常码（TypeError/RangeError）。无缺口。 |
| 5 | `notify` | 返唤醒数，Int32Array + BigInt64Array | ✅ 覆盖：count=0/1/3/NaN/Infinity/MAX_VALUE+1 全边界 + 多 worker 唤醒。❌ **notify 自身 typedArray/index 错误路径（非共享/越界/负索引→RangeError）未见**（wait 错误路径已覆盖但 notify 未对称，SUP_ATOMICS_NOTIFY_ERRPATH_001）。 |
| 6 | `isLockFree` | 返 boolean，size 1/2/4/8→true | ✅ 覆盖：100 例全入参矩阵（0/3/16/-1/2.5/string/null/undefined/object/array/boolean/BigInt/NaN/Infinity→false）+ 异步上下文。无缺口。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **compareExchange BigInt 重载对称性**：add/sub/and/or/xor/load/store/exchange 八方法均覆盖 BigInt64/BigUint64，唯 compareExchange 0 覆盖（声明 `lib.es2020.sharedmemory.d.ts` L21–L98 有 BigInt 重载）。❌ 对称性缺口（SUP_ATOMICS_CAS_BIGINT_001）。
2. **notify 错误路径对称性**：wait 的非共享/越界/负索引 RangeError 已覆盖，notify 同类错误路径未见。❌ 对称性缺口（SUP_ATOMICS_NOTIFY_ERRPATH_001）。
3. **wait+notify+add 闭环**：`atomicWaitTest0020~0023` 覆盖多 worker add on SAB→notify 唤醒 wait 闭环；✅ 核心并发语义覆盖充分。
4. **atomicsComb 组合**：`atomicsCombTest`（50 例 load+store/add/sub/exchange/compareExchange 组合）覆盖多方法串联；✅ 组合覆盖充分，但 desc 普遍为占位（信息密度低）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **compareExchange BigInt 重载声明对称性**：`lib.es2020.sharedmemory.d.ts` 声明 compareExchange BigInt 重载（与 add/sub/.../load/store/exchange 对称），但测试侧 0 覆盖。建议资料侧保留对称声明，测试侧补 BigInt 重载用例（SUP_ATOMICS_CAS_BIGINT_001）。
2. **notify 错误路径声明对称性**：`lib.es2017.sharedmemory.d.ts` notify 与 wait 声明对称（TypeError/RangeError），但测试侧 notify 错误路径未覆盖。建议测试侧补 notify 非共享/越界/负索引 RangeError 用例（SUP_ATOMICS_NOTIFY_ERRPATH_001）。
3. **@tc.desc 占位 "Test"（⚠️）**：`AtomicsAPIThirdlyTest`/`AtomicsFunctionTest`/`AtomicsMultithreadTest` 的 @tc.desc 多为占位 "Test"/"test"（信息密度低，可追溯性差）。建议补语义化 desc（标注方法名/边界/异常码），与各 100 例深套件（有 `SUB_BUILTINS_Atomics_*` 语义编号）对齐。
4. **JS 内建无独立 `.md`**：Atomics 为 JS 内建，无独立 SDK `.md`，契约以 `lib.*.sharedmemory.d.ts` 为authoritative。建议保留该契约来源约定。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 2 | SUP_ATOMICS_CAS_BIGINT_001、SUP_ATOMICS_NOTIFY_ERRPATH_001 | compareExchange BigInt 重载 / notify 错误路径对称性；声明存在但无证据，属契约符合性硬缺口。 |
| **P2** | 2 | SUP_ATOMICS_CAS_NAN_001、@tc.desc 占位补语义化 | NaN expected/replacement 边界 / desc 信息密度提升；非阻断但提升套件质量。 |
| **合计** | **3 新增 + 1 改造** | | P1=2 新增 / P2=1 新增 + 1 改造。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 全 8 整数类型 + BigInt64/BigUint64 + isLockFree 全入参类型 + wait/notify count 全取值 | 各 100 例深套件全类型矩阵、atomicIsLockFree 0/3/16/-1/2.5/string/null/... |
| ②边界值测试 | 0/正/负/最大/最小/溢出回绕/underflow、索引 0/length-1、timeout 0/undefined/NaN/negative、count NaN/Infinity/MAX+1 | atomicAdd 溢出回绕、atomicWait timeout 全边界 |
| ③异常与非法输入 | 非共享→TypeError、OOB/负索引→RangeError、Float32Array 不支持、非整数 value、detached、Uint32Array wait→TypeError | 各深套件异常码段、atomicWait Uint32Array→TypeError |
| ④返回值与类型验证 | add/sub/.../exchange 返旧值、load 返当前、store 返新、compareExchange 匹配返旧/不匹配返当前、wait 返三值、notify 返唤醒数、isLockFree 返 boolean | 各深套件返回值断言 |
| ⑤组合场景 | add+notify 唤醒 wait、store→load、exchange→load、连续 compareExchange、atomicsComb 50 多方法串联、async/Promise 内 isLockFree | atomicAdd add+notify、atomicsComb 组合 |
| ⑥重复调用幂等性 | 连续相同操作旧值序列、重复 store/load 一致、连续 notify 唤醒数衰减、isLockFree 多次一致 | 各深套件连续调用段 |
| ⑦并发跨线程 | 多 Worker Atomics.add on SAB 写可见性、Worker 内 wait、notify 唤醒多 worker、AtomicsMultithread 多线程原子性 | atomicWaitTest0020~0023、AtomicsMultithreadTest、atomicAdd add+notify async wait |
