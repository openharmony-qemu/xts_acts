# collections.ArrayBuffer 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/collections_ArrayBuffer/entry/src/ohosTest/ets/test/` 下 10 个 ArrayBuffer `*.test.ets`，共解析 **245** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.collections.d.ets` **L1506–L1544**（`@Sendable class ArrayBuffer`）。
> **文档来源**：`docs/zh-cn/application-dev/reference/apis-arkts/arkts-apis-arkts-collections-ArrayBuffer.md`（仓库内同名列文件 `test/.../apis-arkts/arkts-apis-arkts-collections-ArrayBuffer.md`）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
collections.ArrayBuffer（@Sendable，@since 12，3 个声明成员）
├── 1. 接口测试
│   ├── constructor(byteLength)  （数值入参/取整/0/负数/Infinity/NaN/极大值/超上限 RangeError）
│   ├── byteLength (readonly)    （只读属性，number 类型，slice 后不变）
│   ├── slice(begin, end?)       （正向/负向索引/越界 clamp/end<begin→空/返回新实例/内容拷贝/独立性）
│   └── [非声明表面]              （ArrayBuffer.isView 全局静态 / ArrayBufferLike ∪ SharedArrayBuffer / TypedArray(buffer,off,len) 视图构造）
├── 2. 稳定性                  （1MB/100MB 大缓冲、1000 次循环 slice、GC 存活、跨线程传递）
├── 3. 性能                    （1000 次 slice、10 任务×50 迭代并发、TaskGroup 并发创建）
├── 4. 并发安全                 （TaskPool/TaskGroup 跨线程 create/slice/read/return、并发 slice 容错）
├── 5. 兼容性与继承            （CustomArrayBuffer extends collections.ArrayBuffer + @Sendable、instanceof、typeof）
└── 6. 资料与文档符合性         （@Sendable 装饰、import @kit.ArkTS、2147483647 上限声明、ArrayBufferLike 与 SharedArrayBuffer 区分）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | All/CollectionsArrayBufferConstructorTest.test.ets | 18 | constructor（0/-1/-0/NaN/±Infinity/float 取整/MAX_VALUE/MIN_VALUE/EPSILON/0x 字面量） |
| 2 | All/CollectionsArrayBufferByteLengthTest.test.ets | 3 | byteLength（8→8、0→0） |
| 3 | All/CollectionsArrayBufferSliceTest.test.ets | 24 | slice（正向/负向/越界/NaN/±Infinity/-0/MAX_VALUE/float/end<begin/独立性） |
| 4 | All/CollectionsArrayBufferLikeTest.test.ets | 2 | [非声明] ArrayBufferLike ∪ SharedArrayBuffer（collections.ArrayBuffer 与 SharedArrayBuffer 区分） |
| 5 | All/CollectionsArrayBufferIsViewTest.test.ets | 51 | [非声明] 全局 ArrayBuffer.isView（collections TypedArray→false、DataView→true、各原始值→false） |
| 6 | All/CollectionsArrayBufferViewTest.test.ets | 40 | [非声明] TypedArray(buffer, offset, length) 视图构造 + 负 offset/length 报错 |
| 7 | ArrayBufferBasic.test.ets | 14 | smoke（Int8/16/32/Uint8/16/32/Clamped/Float32 以 ArrayBuffer 为底座 + Array/Set/Map/Json/BigInt/Sendable） |
| 8 | ArrayBufferTest.test.ets | 29 | constructor + slice + TaskPool 并发 + CustomArrayBuffer 继承 + instanceof/typeof |
| 9 | Normal/ArrayBufferNormal.test.ets | 54 | 综合：ctor 全边界 + slice 全索引矩阵 + byteLength 类型/不变 + 跨线程 create/slice/read/return + TaskGroup + 1000 次 stress + GC + 链式 slice + 1MB |
| 10 | TaskPool/ArrayBufferTaskPool.test.ets | 10 | 并发（Normal 的 ctor/slice 0001-0010 场景跨 TaskPool 10× 复跑） |
| | **合计** | **245** | 3 声明接口 + 非声明表面（isView/Like/View） |

**已排除**：`List.test.ets`（collections.List 聚合 smoke，0 条 `@tc.name`，非 ArrayBuffer 用例，不产出测试点）。支持文件 `Util.ets` / `Utils.ets` / `SharedLock.ets` / `TaskPool/ArrayBuffer_function.ets` / `utils/TestUtils.ets` / `All/pages/*` 为工具/页/`@Concurrent` 函数载体，无 `@tc.name`，不计入用例。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/并发/继承文件」标注用例位置；编号段取自解析结果。

## 1.1 constructor(byteLength: number)

```
constructor
├── 入参范围覆盖
│   ├── number 整数(0/1/8/1024/1MB/100MB/65536)
│   ├── 浮点取整(10.5→10、123.456→123、10.0→10、floor(1.5)→1)
│       十六进制字面量(0x0102/0x01020304/0x3/0xcafebabe)、-0→0、NaN→0、Number.MIN_VALUE→0、Number.EPSILON→0
├── 边界值测试
│   ├── 0 长度
│   ├── 1 字节
│   ├── 2147483647 上限附近
│   ├── 2147483648(超上限)→抛错
│   ├── Number.MAX_SAFE_INTEGER→抛错
│       65536/1MB/100MB 大缓冲
├── 异常与非法输入
│   ├── 负数(-1/-Infinity)→RangeError
│   ├── Infinity→RangeError
│   ├── Number.MAX_VALUE→RangeError
│   ├── 0xcafebabe→RangeError
│       2147483648→抛错、MAX_SAFE_INTEGER→抛错
├── 返回值与类型验证
│   ├── typeof==='object'
│   ├── instanceof collections.ArrayBuffer===true
│   └── byteLength===入参(取整后)
├── 组合场景
│   ├── 构造后立即 slice
│   ├── 构造后作为 TypedArray 底座
│   └── CustomArrayBuffer extends super(byteLength)
├── 重复调用幂等性
│   ├── 同长度多次构造 byteLength 一致
│   └── 循环构造 0..1000
└── 并发跨线程
    ├── crossThreadCreateArrayBuffer 跨 TaskPool 构造
    └── TaskGroup 并发构造不同尺寸
```
- **用例位置**：专用 `CollectionsArrayBufferConstructorTest.test.ets`（16 例：`buildinsArrayBufferConstructorTest1001~1016`，编号 `ARRAY_BUFFER_ALL_0052/0057/0003~0016`）+ 综合套件 `ArrayBufferTest`（7 例 `0100~0700` ctor 段）+ `Normal`（ctor 段 `0001~0003/0011/0012/0014/0018`，编号 `NORMAL_0001~0014`）+ `TaskPool`（3 例 `0001~0003` 跨线程 ctor）+ `Basic`（`002~008/011~013` 以 ArrayBuffer 为底座）。
- **测了哪些**：全数值入参矩阵（整数/浮点取整/十六进制/-0/NaN/MIN_VALUE/EPSILON）+ 0/上限/超上限/极大值边界 + 负数/Infinity/MAX_VALUE→RangeError + instanceof/typeof + 大缓冲(65536/1MB/100MB) + 跨线程构造。**❌ 10200012 未测**（声明 "constructor cannot be directly invoked"，无 `new`-less 直接调用测试，见 §7.2）；**❌ 401 未测**（byteLength 错型未注入，见 §7.4）。

## 1.2 byteLength（readonly 属性）

```
byteLength
├── 入参范围覆盖
│   └── 随 0/1/8/10/100/1000/65536/1MB/100MB 构造长度返回对应数值
├── 边界值测试
│   ├── 0 长度→0
│   ├── 1 字节
│   ├── 2147483647 上限
│   └── 大缓冲(1MB/100MB)
├── 异常与非法输入
│   └── （readonly 属性，无 @throws 契约；❌ 只读写入拦截未测，见 §7.2）
├── 返回值与类型验证
│   ├── number 类型(typeof==='number')
│   ├── 构造后等于入参取整值
│   └── slice 后原 buffer 不变
├── 组合场景
│   ├── slice→原 byteLength 不变
│   ├── 跨线程读取 byteLength 一致
│   └── TaskGroup 并发 slice 后原长不变
├── 重复调用幂等性
│   ├── 多次读取 byteLength 一致
│   └── 循环 1000 次 slice 后 byteLength 仍为原值
└── 并发跨线程
    ├── crossThreadReadByteLength 跨 TaskPool 读
    ├── 10 任务×100 迭代一致性
    └── 跨线程返回 buffer 后读 byteLength
```
- **用例位置**：专用 `CollectionsArrayBufferByteLengthTest.test.ets`（2 例：`buildinsArrayBufferByteLengthTest1001~1002`，编号 `ARRAY_BUFFER_ALL_0001/0002`）+ 综合套件 `Normal`（`0034` typeof number、`0035` [0,1,5,10,100,1000] 一致性、`0036` slice 后不变、`0052` 跨线程一致性）+ `ArrayBufferTest`（`0100~0300/2700/2800` 各 ctor 后读 byteLength）+ `TaskPool`（`0002/0003` 跨线程 byteLength）。
- **测了哪些**：number 类型 + 构造正确性 + slice 后不变 + 跨线程一致性 + 大缓冲。**❌ readonly 写入拦截未测**（无 `ab.byteLength = 5` 赋值测试，见 SUP_ARRAYBUFFER_BYTELENGTH_READONLY_001）；无 @throws 契约，无Other缺口。

## 1.3 slice(begin: number, end?: number): ArrayBuffer

```
slice
├── 入参范围覆盖
│   ├── begin 整数/浮点取整(123.456→123)/-0/NaN/±Infinity/MAX_VALUE/MIN_VALUE/EPSILON/0x 字面量/极大±999999；
│       end 同矩阵 + 可选(省略=原长) + undefined(隐式)
├── 边界值测试
│   ├── 空 buffer slice→0
│   ├── begin=0
│   ├── begin=byteLength→0
│   ├── begin>byteLength→0
│   ├── begin<-byteLength→从 0
│       end=byteLength、end>byteLength clamp、end<-byteLength→0、end<begin→0、1MB 大缓冲 slice
├── 异常与非法输入
│   ├── ❌ 10200011 detached bind 未测
│   └── ❌ 10200201 并发修改未测（见 §7.2）
├── 返回值与类型验证
│   ├── 返回新 ArrayBuffer 实例(!== 原)
│   ├── instanceof collections.ArrayBuffer===true
│       byteLength=(end-begin) 经 clamp/取整、内容拷贝正确(view 对比)
├── 组合场景
│   ├── slice→原 buffer 不变(独立性)
│   ├── 链式 slice(slice 的 slice)
│   ├── slice 后 TypedArray view 内容一致
│       跨线程 slice 返回新 buffer
├── 重复调用幂等性
│   ├── 1000 次循环 slice 原长不变
│   └── 多次 slice(0) 各得新实例
└── 并发跨线程
    ├── crossThreadSliceArrayBuffer
    ├── TaskGroup 并发 slice 不同范围
    └── 10 任务×50 迭代并发 slice 容错
```
- **用例位置**：专用 `CollectionsArrayBufferSliceTest.test.ets`（22 例：`buildinsArrayBufferSliceTest1001~1022`，编号 `ARRAY_BUFFER_ALL_0055/0060/0063/0066~0114`）+ 综合套件 `ArrayBufferTest`（11 例 `0800~1800` slice 段）+ `Normal`（slice 段 `0004~0010/0020~0029/0031/0053~0058` + 跨线程 `0038/0040/0042/0044/0048/0049/0051/0059/0060`）+ `TaskPool`（7 例 `0004~0010` 跨线程 slice）。
- **测了哪些**：全索引矩阵（正向/负向/越界/clamp/end<begin/float/NaN/±Infinity/极大值）+ 返回新实例+独立性+内容拷贝+链式+大缓冲+1000 次 stress+跨线程。**❌ 10200011 detached 专用缺失**（无 `const fn=buf.slice; fn(0,4)` 测试，见 SUP_ARRAYBUFFER_SLICE_BIND_001）；**❌ 10200201 并发修改未测**（并发 slice 套件均返回新实例不触发源修改，无 10200201 pin 断言，见 SUP_ARRAYBUFFER_SLICE_10200201_001）；**❌ 401 未测**（begin/end 错型未注入，见 §7.4）。

## 1.4 [非声明表面] ArrayBuffer.isView / ArrayBufferLike / TypedArray-view

> **说明**：`@arkts.collections.d.ets` L1506–1544 的 `class ArrayBuffer` **仅声明 byteLength / constructor / slice 三成员**，**未声明 `static isView`、未声明 `[Symbol.iterator]`、未声明视图构造**。以下 91 例测试的是**全局 ES `ArrayBuffer.isView`** 与 **TypedArray(buffer,offset,length) 视图构造重载**（以 collections.ArrayBuffer 为底座），属"非声明相邻表面"，计入用例总数但非契约覆盖。

```
[非声明表面]
├── ArrayBuffer.isView(data)（全局静态，51 例）
│   ├── collections.Uint8Array/Int8Array/Uint8ClampedArray/Int16Array/Uint16Array/Uint32Array/Int32Array/Float32Array → false
│   ├── DataView(new ArrayBuffer) / DataView(new ArrayBuffer,0,4) → true
│   └── 原始值(0/-0/NaN/±Infinity/MAX_VALUE/MIN_VALUE/EPSILON/123.456/0xcafebabe/BigInt/string/undefined/null/boolean)→ false
├── ArrayBufferLike = ArrayBuffer | SharedArrayBuffer（2 例）
│   ├── collections.ArrayBuffer(12) as ArrayBufferLike → byteLength===12
│   └── new SharedArrayBuffer(12) as ArrayBufferLike → byteLength===12
└── TypedArray(buffer, offset, length) 视图构造重载（40 例）
    ├── 8 类 TypedArray(Uint8/Int8/Uint8Clamped/Int16/Uint16/Uint32/Float32/Int32) × (offset,len 正常 / 负 offset / 负 len)
    └── 负 offset/length → 抛错 "integerIndex < 0 or integerIndex > SAFE_NUMBER"
```
- **用例位置**：`CollectionsArrayBufferIsViewTest.test.ets`（51 例 `IsViewTest1001~1051`）+ `CollectionsArrayBufferLikeTest.test.ets`（2 例 `LikeTest1001~1002`）+ `CollectionsArrayBufferViewTest.test.ets`（40 例 `ViewTest1001~1040`）。
- **测了哪些**：全局 isView 对 collections TypedArray/DataView/原始值的判定 + ArrayBufferLike 与 SharedArrayBuffer 的 union 兼容 + 8 类 TypedArray 视图构造的 byteLength/byteOffset 与负参报错。**⚠️ 非声明表面**：isView/视图构造非 collections.ArrayBuffer 类成员；建议资料侧明确 collections.ArrayBuffer 不暴露 isView（与全局 ES ArrayBuffer 区分），测试侧保留相邻覆盖证据。

---

# 2. 稳定性

- **用例位置**：`Normal`（`0012` 65536 大缓冲基本操作、`0046` 1000 次 slice stress 原长不变、`0047` 跨线程返回后 GC 存活、`0049`/`0055` 1MB 大缓冲 slice 边界、`0050` TaskGroup 并发创建不同尺寸）+ `ArrayBufferTest`（`0200` 1MB、`0300` 100MB、`2400` 5 任务并发 slice 循环）+ `Basic`（`002~008/011~013` TypedArray 以 ArrayBuffer 为底座的大尺寸构造）。
- **测了哪些**：1MB/100MB 大缓冲构造/slice/跨线程传递稳定性 + 1000 次循环 slice 原长不变 + GC 存活 + TaskGroup 并发创建；**未见超大规模(>100MB)或长时间持续创建销毁的稳定性基准**。

# 3. 性能

- **用例位置**：`Normal`（`0046` 1000 次 slice 计 successCount===TOTAL、`0040`/`0045` 10 任务×50 迭代并发、`0052` 10 任务×100 迭代跨线程 byteLength 一致性）+ `ArrayBufferTest`（`2400` 5 任务并发 slice 循环）。
- **测了哪些**：1000 次 slice 吞吐 + 10 任务×50/100 迭代并发容错；**未见单接口基线性能基准(纳秒级)或与 ES ArrayBuffer 的对比基准**。

# 4. 并发安全

- **用例位置**：`ArrayBufferTest`（7 例 `1900~2500`：TaskPool 传递读 byteLength、多任务共享同 buffer 数据、多 TypedArray view 共享、跨线程 TypedArray 修改可见、并发 slice 2/5 任务、空 buffer 跨线程）+ `Normal`（`0037~0040/0042~0045/0048~0052/0059~0060`：crossThreadCreate/Slice/Read/Return、TaskGroup 并发 slice、10 任务×50 迭代 concurrentSliceOps/concurrentAllOpsTryCatch、1MB 跨线程、多 buffer 跨线程）+ `TaskPool/ArrayBufferTaskPool`（10 例 `0001~0010`：Normal ctor/slice 0001~0010 跨 TaskPool 10× 复跑）。
- **测了哪些**：TaskPool/TaskGroup 跨线程 create/slice/read/return + 多 view 共享同 buffer + 跨线程修改可见 + 并发 slice 容错 + 跨线程一致性；**❌ 未 pin 10200201**（并发 slice 均返回新实例，未触发源修改；无 10200201 专属 pin 断言，见 SUP_ARRAYBUFFER_SLICE_10200201_001）；**未发现显式多 Worker 写写冲突下源 buffer 数据一致性逐字节断言**（多为不抛错即通过，见 SUP_ARRAYBUFFER_CONC_VERIFY_001）。

# 5. 兼容性与继承

- **用例位置**：`ArrayBufferTest`（`2600` CustomArrayBuffer extends collections.ArrayBuffer + @Sendable + super(byteLength) + getHalfLength() + instanceof；`2700` instanceof；`2800` typeof==='object'）+ `Normal`（`0041` 原始/slice 后 instanceof、`0042` 跨线程返回 instanceof）+ `CollectionsArrayBufferLikeTest`（`1001` collections.ArrayBuffer as ArrayBufferLike 与 SharedArrayBuffer union 兼容）。
- **测了哪些**：子类化 + @Sendable 继承 + super 构造 + 自定义方法 + instanceof/typeof + ArrayBufferLike union 兼容；**未见二级继承链、子类覆写 slice、子类跨线程传递后调用覆写方法的用例**。

# 6. 资料与文档符合性

- **用例位置**：`ArrayBufferTest`（`0100` required byteLength 参数、`0200`/`0300` 0/2147483647 边界符合 .md 取值范围 [0,2147483647]、`2600`/`2700`/`2800` @Sendable/instanceof/typeof）+ `ConstructorTest`（`1003~1009` 负数/Infinity/MAX_VALUE→抛错符合 .md "否则会抛出异常"）+ `SliceTest`（全索引符合 .md begin/end 负向与 clamp 语义）+ `LikeTest`（SharedArrayBuffer 区分）。
- **测了哪些**：@Sendable 装饰、import @kit.ArkTS、2147483647 上限声明符合性、负向索引与 clamp 语义符合性、ArrayBufferLike 与 SharedArrayBuffer 区分；**⚠️ 未发现与 .md 错误码表逐条断言的符合性用例**（10200012/10200011/10200201 三码均无直接测试，见 §7.2/§7.4）；**⚠️ .md 对 constructor/slice 未声明 401**（资料缺口，见 §7.4）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅(18+7+10) | ✅(0/上限/超上限/大缓冲) | 🟡(RangeError 覆盖；❌10200012/❌401) | ✅(instanceof/typeof) | ✅(底座/super) | ✅(循环构造) | ✅(TaskPool/TaskGroup) |
| byteLength | ✅ | ✅(0/1MB/100MB) | ❌(readonly 写入未测；无 @throws) | ✅(number/不变) | ✅(slice 后不变) | ✅(1000 次) | ✅(跨线程一致) |
| slice | ✅(24+11+20) | ✅(全索引/1MB) | 🟡(❌10200011/❌10200201/❌401) | ✅(新实例/独立性/内容拷贝) | ✅(链式/跨线程) | ✅(1000 次) | ✅(TaskPool/TaskGroup) |
| [非声明] isView/Like/View | ✅(51+2+40) | ✅(空/负参) | ✅(负 offset/length 报错) | ✅(true/false/byteOffset) | ✅(底座) | 🟡 | 🟡(无跨线程) |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.collections.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论均经实际测试代码逐行复核（非仅凭 @tc.desc 推断）。
> **声明口径**：`@arkts.collections.d.ets` L1506–L1544 `@Sendable class ArrayBuffer` 仅声明 `readonly byteLength` / `constructor(byteLength)` / `slice(begin, end?)` 三成员，**未声明 `static isView`、未声明 `[Symbol.iterator]`、未声明视图/resize/transfer**。

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `byteLength`（readonly） | 只读属性，无 @throws | ✅ 覆盖：number 类型（`Normal_0034`）、构造正确性（`Normal_0035` [0,1,5,10,100,1000]）、slice 后不变（`Normal_0036`、`SliceTest` view1/view2、`Main_1000` !==）、跨线程一致（`Normal_0039/0052`、`TaskPool_0002/0003`）。❌ **readonly 写入拦截未测**：无 `ab.byteLength = 5` 赋值测试验证只读性（collections.ArrayBuffer byteLength 声明 `readonly`，需显式断言赋值抛错或被忽略，见 `SUP_ARRAYBUFFER_BYTELENGTH_READONLY_001`）。无 @throws 契约，无Other缺口。 |
| 2 | `constructor(byteLength: number)` | @throws 10200012；.md 取值范围 [0, 2147483647]，否则抛异常 | ✅ 覆盖：全数值矩阵（`ConstructorTest 1001~1016` 16 例 + `Main_0100~0700` 7 例 + `Normal_0001~0014` ctor 段 + `TaskPool_0001~0003` 跨线程 + `Basic_002~008/011~013` 底座）。边界 0/1/1024/1MB/100MB/65536/2147483647；超上限 2147483648、MAX_SAFE_INTEGER、MAX_VALUE→抛错；负数/-Infinity/Infinity→RangeError；NaN/-0/MIN_VALUE/EPSILON→0；浮点取整。instanceof/typeof 覆盖。❌ **10200012 未测且不可达**：声明 "constructor cannot be directly invoked" 为内部直接调用守卫，从 .ets 正常 `new collections.ArrayBuffer()` 不可达；无 `new`-less 直接调用测试（见 `SUP_ARRAYBUFFER_CTOR_10200012_001`）。❌ **401 未测**：byteLength 错型（string/boolean/object）未通过 `as` 注入测试（见 `SUP_ARRAYBUFFER_CTOR_401_001`）。⚠️ **超上限/负数抛 RangeError 未声明**：.md 仅 "否则会抛出异常"，未指明 RangeError 类型与错误码（见 §7.4）。 |
| 3 | `slice(begin, end?)` | @throws 10200011, 10200201；.md 负向索引/clamp/默认 end=原长 | ✅ 覆盖：全索引矩阵（`SliceTest 1001~1022` 22 例 + `Main_0800~1800` 11 例 + `Normal_0004~0010/0020~0029/0031/0053~0058` + `TaskPool_0004~0010`）。begin/end 正向/负向/越界/clamp/end<begin→0/float 取整/NaN/±Infinity/-0/MAX_VALUE/MIN_VALUE/EPSILON/极大±999999；返回新实例+独立性（`Main_1000/1600` !==、`Normal_0036/0054/0055` 不变）；内容拷贝（`SliceTest` view1[i+start]==view2[i]、`Main_1700`、`Normal_0056`）；链式 slice（`Normal_0048/0054`）；空 buffer（`Main_1800`、`Normal_0053`）；1MB 大缓冲（`Normal_0049/0055`）；1000 次 stress（`Normal_0046`）；跨线程（`Normal_0038/0040/0042/0044/0048/0051/0059/0060`、`Main_1900~2500`）。❌ **10200011 detached 专用缺失**：无 `const fn = buf.slice; fn(0,4)` detached 调用测试（见 `SUP_ARRAYBUFFER_SLICE_BIND_001`）。❌ **10200201 并发修改未 pin**：并发 slice 套件（`Normal_0040/0045`、`Main_2300/2400`）均返回新实例不触发源修改，无 10200201 专属 pin 断言（见 `SUP_ARRAYBUFFER_SLICE_10200201_001`）。❌ **401 未测**：begin/end 错型未注入（见 `SUP_ARRAYBUFFER_SLICE_401_001`）。 |
| 4 | `[非声明表面] isView/Like/View` | .d.ets collections.ArrayBuffer **未声明** isView/视图构造 | ✅ 覆盖（相邻表面）：`IsViewTest 1001~1051`（51 例）全局 ArrayBuffer.isView 对 collections 8 类 TypedArray→false、DataView→true、原始值→false；`LikeTest 1001~1002`（2 例）ArrayBufferLike ∪ SharedArrayBuffer union；`ViewTest 1001~1040`（40 例）8 类 TypedArray(buffer,offset,length) 视图构造 + 负 offset/length→"integerIndex < 0 or integerIndex > SAFE_NUMBER" 报错。⚠️ **非声明表面**：isView/视图构造非 collections.ArrayBuffer 类成员，91/245 例（37%）测试全局 ES 表面；建议 .md 明确 collections.ArrayBuffer 不暴露 isView（见 §7.4），测试侧保留相邻覆盖证据。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **slice 返回新对象 + 独立性**：`Main_1000/1600`（slice !== 原、instanceof）、`Normal_0036/0054/0055`（原长不变）、`SliceTest` view1 vs view2 对比、`Main_1700`（Int8Array view 内容拷贝）、`Normal_0056`（Uint8Array view 逐元素对比）。✅ 此项覆盖充分，无缺口。

2. **constructor 取值范围与超上限报错**：[0,2147483647] 范围内构造成功（`ConstructorTest`、`Main_0200/0300`、`Normal_0012`），超上限 2147483648/`MAX_SAFE_INTEGER`/`MAX_VALUE` 抛错（`Normal_0011/0018`、`ConstructorTest_1009`）。✅ 范围覆盖。⚠️ **超上限抛 RangeError 未在 .md 声明具体异常类型**（.md 仅 "否则会抛出异常"，见 §7.4）。

3. **byteLength readonly 只读性**：`readonly` 声明，但无 `ab.byteLength = newValue` 赋值测试验证赋值被拦截（抛错或静默忽略）。❌ 组合缺口（`SUP_ARRAYBUFFER_BYTELENGTH_READONLY_001`）。

4. **slice 并发修改契约（10200201）**：声明 @throws 10200201（concurrent modification error），但并发 slice 套件（`Normal_0040/0045` concurrentSliceOps/concurrentAllOpsTryCatch、`Main_2300/2400`）仅断言 `count===TASK_COUNT`（不抛错即通过），**均返回新实例不触发源 buffer 修改**，无 10200201 pin 断言。若产品停止抛 10200201（如源 buffer 在 slice 拷贝期间被 TypedArray 并发写入返回撕裂数据），现有套件无法检测。❌ 组合缺口（`SUP_ARRAYBUFFER_SLICE_10200201_001`、`SUP_ARRAYBUFFER_CONC_VERIFY_001`）。

5. **10200012 不可达性**：声明 "constructor cannot be directly invoked" 为内部直接调用守卫，从 .ets 正常 `new collections.ArrayBuffer()` 不可达；无 `new`-less 直接调用测试。⚠️ 同 Map 的 10200012 不可达性，建议保留不可达性证据而非强行构造运行期用例（`SUP_ARRAYBUFFER_CTOR_10200012_001`）。

6. **401 覆盖面**：constructor(byteLength) 与 slice(begin, end) 共 2 个带必填 number 参数的成员**无 401 测试**，且声明侧**未声明 401**（⚠️ 文档缺口，见 §7.4）。ArkTS 严格模式下错型为编译期错误，运行期 401 需 `undefined as number` / `as Object as number` 强制转型注入。

7. **并发 slice 内容一致性**：`Normal_0051`（5 任务并发 slice 不同范围，断言每个 result===10）覆盖了并发 slice 的 byteLength 一致性，但**未对 slice 产物做逐字节内容对比**（仅断言 byteLength）。`Normal_0040/0045` 仅断言 count。❌ 掩盖并发拷贝撕裂数据（`SUP_ARRAYBUFFER_CONC_VERIFY_001`）。

8. **SharedArrayBuffer 区分**：`LikeTest` 2 例覆盖 ArrayBufferLike union 兼容，但**未验证 collections.ArrayBuffer ≠ SharedArrayBuffer 实例**、未验证 collections.ArrayBuffer 非 shared-memory 语义（@Sendable 跨线程传递为拷贝/转移，非共享内存）。⚠️ 部分覆盖。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **10200012 不可达性说明**：`.d.ets` constructor 声明 `@throws 10200012 - The ArrayBuffer's constructor cannot be directly invoked.`，该错误码为内部直接调用守卫，从 .ets 正常 `new collections.ArrayBuffer()` 不可达。建议在 `.md` constructor 错误码说明补注"该错误码为内部直接调用守卫，应用层 `new` 构造不可触发"，避免资料侧被误解为可在应用层验证。同步固化不可达性证据（`SUP_ARRAYBUFFER_CTOR_10200012_001`）。

2. **超上限/负数抛 RangeError 未声明（⚠️ 文档缺口）**：`.md` constructor 参数说明注 "取值范围是 [0, 2147483647]，否则会抛出异常"，但**未指明异常类型**。实际产品对负数/Infinity/MAX_VALUE/超上限抛 `RangeError`（`ConstructorTest_1003/1006/1007/1009/1013`、`Normal_0011/0018`）。建议在 `.md` 补注"超出 [0, 2147483647] 范围或为 Infinity/MAX_VALUE 等非法值时抛 RangeError"，与测试一致。

3. **401 未声明（⚠️ 文档缺口）**：`.d.ets`/`.md` 对 constructor(byteLength) 与 slice(begin, end) 共 2 个带必填 number 参数成员**均未 `@throws 401`**。ArkTS 严格模式下错型为编译期错误，运行期 401 需 `undefined as number` / `as Object as number` 强制转型注入。建议在 `.d.ets` 与 `.md` 错误码表为上述 2 成员补 `@throws BusinessError 401 - The parameter check failed.`，与 ArkTS 401 通用规范一致。同步增补测试（`SUP_ARRAYBUFFER_CTOR_401_001`、`SUP_ARRAYBUFFER_SLICE_401_001`）。

4. **10200011 / 10200201 for slice 声明但未测**：`.d.ets` slice 声明 `@throws 10200011`（cannot be bound）与 `@throws 10200201`（concurrent modification），但测试侧**均无直接证据**（见 §7.2 第 3 行）。建议资料侧保留声明，测试侧补齐 detached 10200011 与并发修改 10200201 独立用例（`SUP_ARRAYBUFFER_SLICE_BIND_001`、`SUP_ARRAYBUFFER_SLICE_10200201_001`）。

5. **非声明表面 isView 澄清**：`.d.ets` collections.ArrayBuffer **未声明 `static isView`**，但测试套件 51 例调用全局 `ArrayBuffer.isView`（collections TypedArray→false、DataView→true）。建议在 `.md` 补注"collections.ArrayBuffer 不提供 isView 静态方法；如需视图判定请使用全局 ArrayBuffer.isView"，避免资料侧与全局 ES ArrayBuffer 混淆。测试侧保留相邻覆盖证据。

6. **slice 默认 end=原长 & undefined**：`.md` 注 end 默认为原 ArrayBuffer 长度。测试覆盖省略 end 的场景（`SliceTest` 单参、`Main_0800/1100/1200`）。建议补 `slice(0, undefined)` 显式 undefined 等价省略的证据（次要，可选）。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 2 | SUP_ARRAYBUFFER_SLICE_10200201_001、SUP_ARRAYBUFFER_CONC_VERIFY_001 | slice 声明 10200201 并发修改错误——零直接证据，且并发 slice 套件仅断言 count 不做逐字节内容对比，可能掩盖并发拷贝撕裂数据回归，最高优先。 |
| **P1** | 4 + 1 改造 | A 组 1（SUP_ARRAYBUFFER_SLICE_BIND_001 10200011 detached）+ B 组 3（SUP_ARRAYBUFFER_CTOR_401_001 / SUP_ARRAYBUFFER_SLICE_401_001 / SUP_ARRAYBUFFER_BYTELENGTH_READONLY_001）+ 改造 1（Normal_0011/0018 弱断言强化，2 例共用） | 声明 @throws 但无直接证据、或 readonly 声明无只读性测试、或弱断言（仅"进入 catch"不验异常类型）无法检测回归；属契约符合性硬缺口。 |
| **P2** | 4（2 用例 + 2 资料项） | C 组 2（SUP_ARRAYBUFFER_CTOR_10200012_001 不可达性证据 / SUP_ARRAYBUFFER_SUBCLASS_CHAIN_001 二级继承链）+ D 组 2（资料侧：.md 补 RangeError 类型声明 / .md 澄清 collections.ArrayBuffer 不暴露 isView） | 覆盖已存在但定位弱 / 契约禁用需固化证据 / 资料侧澄清；非阻断但提升套件与文档质量。 |
| **合计** | **8 新增用例 + 2 资料侧建议项 + 1 改造** | | P0=2 / P1=4（+1 改造）/ P2=2 用例+2 资料项；改造项随所属优先级。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参(byteLength/begin/end)遍历合法类型空间 | ConstructorTest 数值矩阵、SliceTest 索引矩阵、IsViewTest 原始值矩阵 |
| ②边界值测试 | 空缓冲、单字节、容量阈值(0/2147483647/超上限)、极值(NaN/±0/±Infinity/MAX_VALUE)、大规模(1MB/100MB) | 0 长度、2147483648 超上限、1MB slice 边界 |
| ③异常与非法输入 | 非法参数(401)、构造守卫(10200012)、detached bind(10200011)、并发修改(10200201)、超上限 RangeError | 负数/Infinity/MAX_VALUE→RangeError、负 offset/length→SAFE_NUMBER 报错 |
| ④返回值与类型验证 | 返回值语义(新 ArrayBuffer 实例)、instanceof、typeof、byteLength 取值、内容拷贝正确性 | slice!==原、instanceof、typeof==='object'、view 内容对比 |
| ⑤组合场景 | 多接口串联(ctor→slice→view)、跨 API 联动、链式 slice、独立性 | slice 后原长不变、链式 slice、TypedArray 底座 |
| ⑥重复调用幂等性 | 同操作连续调用结果稳定、不产生副作用膨胀 | 1000 次循环 slice 原长不变、多次构造 byteLength 一致 |
| ⑦并发跨线程 | TaskPool/TaskGroup 跨线程 create/slice/read/return、多 view 共享、跨线程修改可见 | crossThreadCreate/Slice/Read/Return、TaskGroup 并发、10 任务×50 迭代 |
