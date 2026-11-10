# sharedarraybuffertest 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/sharedarraybuffertest/entry/src/ohosTest/ets/test/` 下 **3** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **25** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。本套件为 SharedArrayBuffer 特性主套件（constructor/byteLength/slice + 视图/继承/跨线程/性能/生命周期）。
> **契约来源**：`arkts/builtin/dynamic/lib.es2017.sharedmemory.d.ts`（L24–L42 `new SharedArrayBuffer(byteLength)`/`slice(begin,end?)`/`readonly byteLength`/`[Symbol.species]`/`[Symbol.toStringTag]`）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
sharedarraybuffertest（SharedArrayBuffer 特性主套件）
├── 1. 接口测试
│   ├── 1.1 constructor(byteLength)
│   ├── 1.2 byteLength（只读）
│   └── 1.3 slice(begin, end?)
├── 2. 稳定性（反复创建销毁内存泄漏 / 1000 次 GC 压力 / 10 线程×1000 迭代）
├── 3. 性能（10 线程×1000 迭代性能 / 1000 次组合）
├── 4. 并发安全（跨 worker slice / SAB 作类属性跨线程传递 / 10 线程竞态；❌ 跨 worker 写可见性）
├── 5. 兼容性与继承（SAB 继承 + 方法覆写 CustomSharedArrayBuffer grow）
└── 6. 资料与文档符合性（ArkTS 构造错误消息非标 / JS 内建无独立 .md）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 3 文件 / 25 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | SharedArrayBufferApiTest.test.ets | 14 | SAB·constructor/byteLength/slice(slice 全边界) |
| 2 | SharedArrayBufferTest.test.ets | 11 | SAB·视图访问/继承/跨线程 slice/性能/生命周期 |
| | **合计** | **25** | 2 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 constructor(byteLength)

```
constructor
├── 入参范围覆盖
│   ├── byteLength 取值：0（ApiTest 构造 0→byteLength=0）/1/8/large
│   └── 构造后 Int32/Float64/Uint8 视图访问（Test_0100~0300）
├── 边界值测试
│   ├── byteLength=0→byteLength=0
│   ├── byteLength=-1→抛错（消息 "integerIndex<0 or integerIndex>SAFE_NUMBER"）
│   ├── byteLength=MAX_SAFE_INTEGER→"Out of range"
│   └── byteLength=MAX_SAFE_INTEGER+1→抛错
├── 异常与非法输入
│   └── 负 byteLength / 超 MAX_SAFE（ArkTS 非标错误消息，非 ES RangeError 标准消息）
├── 返回值与类型验证
│   ├── instanceof SharedArrayBuffer
│   └── 构造后 byteLength === 传入值
├── 组合场景
│   └── 构造后 Int32/Float64/Uint8 视图访问验证
├── 重复调用/幂等性
│   └── 相同 byteLength 多次构造一致（Test_0700 反复创建销毁）
└── 并发跨线程
    └── SAB 作类属性跨线程传递（Test_0600）
```

- **用例位置**：`SharedArrayBufferApiTest.test.ets`（constructor 段：-1→抛错 "integerIndex<0 or integerIndex>SAFE_NUMBER"、0→byteLength=0、MAX_SAFE_INTEGER→"Out of range"、MAX_SAFE_INTEGER+1→抛错）+ `SharedArrayBufferTest.test.ets`（`0100/0200/0300` Int32/Float64/Uint8 视图访问、`0600` SAB 作类属性跨线程、`0700` 反复创建销毁）。
- **测了哪些**：byteLength 0/1/8/large + -1/超 MAX_SAFE 边界（含非标错误消息）+ instanceof + 视图访问 + 跨线程传递 + 反复创建销毁；constructor 边界覆盖充分。

---

## 1.2 byteLength（只读属性）

```
byteLength
├── 入参范围覆盖
│   └── 随构造 byteLength 返回对应 number（0/1/8/large 均断言）
├── 边界值测试
│   ├── byteLength=0→byteLength=0
│   └── large→large
├── 返回值与类型验证
│   └── 类型为 number
├── 组合场景
│   └── 构造后/视图访问后 byteLength 一致
└── 重复调用/幂等性
    └── 同 SAB 多次读取 byteLength 一致
```

- **用例位置**：无独立文件，贯穿 `SharedArrayBufferApiTest.test.ets`（constructor 各边界后断言 byteLength）+ `SharedArrayBufferTest.test.ets`（视图访问后断言）。
- **测了哪些**：随构造返回 number、0/large 边界、number 类型、多次读取一致；readonly 无入参无异常契约，无缺口。

---

## 1.3 slice(begin, end?)

```
slice
├── 入参范围覆盖
│   ├── start>end（0100）
│   ├── start<end（0200）
│   ├── start=end（0300）
│   ├── start=0,end=1（0400）/start=0,end=length（0500）/start=0,end=length+1（0600）
│   └── start=length,end=length+1（0700）/start=length-1,end=length（0800）/start=0（0900）/start=length（1000）/start=length+1（1100）/start=length-1（1200/1300）
├── 边界值测试
│   ├── start=0/end=length 全范围
│   ├── start=length/end=length+1 越界
│   └── start=length-1 末尾
├── 异常与非法输入
│   └── 负索引（-1→length-1 回绕）❌ 未见（见 §7.2）
├── 返回值与类型验证
│   └── 返新 SAB 实例（独立拷贝，!== 原 sab）
├── 组合场景
│   └── slice 后视图访问
├── 重复调用/幂等性
│   └── 多次 slice 同范围一致
└── 并发跨线程
    └── 跨 worker slice（Test_0500 主线程构造+worker slice）
```

- **用例位置**：`SharedArrayBufferApiTest.test.ets`（13 `SUB_MODULE_SHAREDARRAYBUFFER_API_TEST_0100~1300`：slice 全 start/end 边界组合）+ `SharedArrayBufferTest.test.ets`（`0500` 跨 worker slice、`0800` 1000 次组合、`0900` 10 线程×1000 迭代）。
- **测了哪些**：slice 全 start/end 边界（>end/<end/=end/0..1/0..length/0..length+1/length..length+1/length-1..length）+ 返新 SAB 独立拷贝 + 跨 worker slice + 1000 次组合/10 线程竞态；❌ 负索引回绕未见、❌ `[Symbol.toStringTag]==="SharedArrayBuffer"` 未断言、❌ `[Symbol.species]` 未测（见 §7.2）。

---

# 2. 稳定性
- **用例位置**：`SharedArrayBufferTest`（`0700` 反复创建销毁内存泄漏 / `1000` 1000 次 GC 压力 / `0900` 10 线程×1000 迭代）。
- **测了哪些**：SAB 反复创建销毁内存泄漏防护 + 1000 次 GC 压力生命周期 + 10 线程×1000 迭代稳定性。

# 3. 性能
- **用例位置**：`SharedArrayBufferTest`（`0900` 10 线程×1000 迭代性能 / `0800` 1000 次组合）。
- **测了哪些**：10 线程×1000 迭代并发性能 + 1000 次 constructor+slice 组合性能。

# 4. 并发安全
- **用例位置**：`SharedArrayBufferTest`（`0500` 主构造+worker slice / `0600` SAB 作类属性跨线程 / `0900` 10 线程竞态）。
- **测了哪些**：跨 worker slice + SAB 作类属性跨线程传递 + 10 线程竞态；❌ 跨 worker 写可见性（worker 写→main 读）未见（写可见性经 Atomics.add/wait 间接覆盖，见 §7.3）。

# 5. 兼容性与继承
- **用例位置**：`SharedArrayBufferTest`（`0400` SAB 继承+方法覆写 CustomSharedArrayBuffer grow/growBuffer）。
- **测了哪些**：SAB 继承 + 自定义方法覆写（grow/growBuffer 为非契约方法，仅验证继承机制可用）。

# 6. 资料与文档符合性
- **用例位置**：`SharedArrayBufferApiTest`（constructor 错误消息非标：-1→"integerIndex<0 or integerIndex>SAFE_NUMBER"、MAX_SAFE→"Out of range"，非 ES 规范 RangeError 标准消息）。
- **测了哪些**：constructor 边界错误消息非标（已记录证据）；JS 内建无独立 SDK 文档（.md），契约以 `lib.es2017.sharedmemory.d.ts` 为authoritative；❌ `[Symbol.toStringTag]`/`[Symbol.species]` 契约符号未断言（见 §7.4）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor(byteLength) | ✅(0/1/8/large) | ✅(-1/MAX_SAFE/+1) | ✅(非标错误消息) | ✅(instanceof) | ✅(视图) | ✅(同 size 一致) | ✅(跨线程传递) |
| byteLength(readonly) | ✅ | ✅(0/large) | ❌(只读无异常) | ✅(number) | ✅(随构造) | ✅ | ✅ |
| slice(begin,end?) | ✅(全 start/end) | ✅(>end/=end/length+1) | 🟡(负索引未见) | ✅(新 SAB 独立拷贝) | ✅(slice 后视图) | ✅(多次 slice) | ✅(跨 worker slice) |
| [Symbol.toStringTag] | ❌ | ❌ | ❌ | ❌(未断言) | ❌ | ❌ | ❌ |
| [Symbol.species] | ❌ | ❌ | ❌ | ❌(未测) | ❌ | ❌ | ❌ |

## 7.2 逐接口遗漏确认（对照 `lib.es2017.sharedmemory.d.ts`）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ts） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `new SharedArrayBuffer(byteLength)` | 构造，byteLength 非负 | ✅ 覆盖：0/1/8/large + -1/超 MAX_SAFE 边界 + 非标错误消息。⚠️ 错误消息非 ES 规范标准 RangeError 消息（已记录证据，见 §6）。 |
| 2 | `readonly byteLength` | 只读属性 | ✅ 覆盖：随构造返回 number，0/large 均断言。无异常契约，无缺口。 |
| 3 | `slice(begin, end?)` | 返回新 SAB 拷贝 | ✅ 覆盖：全 start/end 边界（>end/<end/=end/0..1/0..length/0..length+1/length..length+1/length-1..length）+ 返新 SAB 独立拷贝 + 跨 worker slice。❌ **负索引（-1→length-1 回绕）未见**（SUP_SAB_SLICE_NEGATIVE_001）。 |
| 4 | `[Symbol.toStringTag]` | 应为 "SharedArrayBuffer" | ❌ **未断言**（声明存在但无 `sab[Symbol.toStringTag]==="SharedArrayBuffer"` 用例，SUP_SAB_TOSTRINGTAG_001）。 |
| 5 | `[Symbol.species]` | 构造器 species | ❌ **未测**（声明存在但无 species 相关用例，SUP_SAB_SPECIES_001）。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **跨 worker 写可见性**：worker 内 `Atomics.store`/写视图→main 线程 `Atomics.load`/读视图的显式可见性断言缺失；现有跨线程用例（`0500` 主构造+worker slice、`0600` SAB 作类属性跨线程）仅验证传递/slice，不验证写后读可见性。写可见性经 `Atomics.add/wait`（builtins_atomics_test 套件）间接覆盖。❌ 组合缺口（SUP_SAB_CROSS_WORKER_WRITE_VIS_001）。
2. **slice 负索引回绕**：slice start/end 负值→length+负值 的回绕语义（ES 规范）未见独立用例。❌ 边界缺口。
3. **[Symbol.species] 与派生**：slice 应通过 `[Symbol.species]` 决定返回的构造器（子类化时返回子类实例）。本套件子类化用例（`0400` CustomSharedArrayBuffer）未断言 slice 返回子类实例。❌ 组合缺口。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **constructor 错误消息非标（⚠️）**：`-1`→"integerIndex<0 or integerIndex>SAFE_NUMBER"、`MAX_SAFE_INTEGER`→"Out of range"，非 ES 规范 RangeError 标准消息。建议资料侧统一错误消息措辞，或在 `.md` 注明 ArkTS 实现特定消息。
2. **符号属性契约固化**：`lib.es2017.sharedmemory.d.ts` 声明 `[Symbol.toStringTag]` 与 `[Symbol.species]`，但测试侧零断言。建议补 `sab[Symbol.toStringTag]==="SharedArrayBuffer"` 与子类 slice 经 species 返子类实例的用例（SUP_SAB_TOSTRINGTAG_001/SPECIES_001）。
3. **JS 内建无独立 `.md`**：SharedArrayBuffer 为 JS 内建，无独立 SDK `.md`，契约以 `.d.ts` 为authoritative。建议保留该契约来源约定，不强行补 `.md`。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 2 | SUP_SAB_CROSS_WORKER_WRITE_VIS_001、SUP_SAB_TOSTRINGTAG_001 | 跨 worker 写可见性（核心并发语义）/ 符号属性契约；属契约符合性硬缺口。 |
| **P2** | 3 | SUP_SAB_SLICE_NEGATIVE_001、SUP_SAB_SPECIES_001、错误消息标准化 | 负索引回绕边界 / species 派生 / 资料侧消息统一；非阻断但提升套件质量。 |
| **合计** | **5 新增** | | P1=2 / P2=3。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | byteLength 全取值、slice start/end 全组合、视图类型 | ApiTest constructor byteLength 矩阵、slice start>end/<end/=end 全组合 |
| ②边界值测试 | byteLength=0/-1/超 MAX_SAFE、slice 各 start/end 边界、跨 length 边界 | ApiTest -1/MAX_SAFE/MAX_SAFE+1、slice 0..length+1/length..length+1 |
| ③异常与非法输入 | 负 byteLength、超 MAX_SAFE（非标错误消息） | ApiTest -1→抛错、MAX_SAFE→"Out of range" |
| ④返回值与类型验证 | instanceof SharedArrayBuffer、byteLength number、slice 返新 SAB 独立拷贝 | ApiTest instanceof 断言、Test_0100 视图访问 |
| ⑤组合场景 | 构造+视图、slice+视图、继承+方法覆写、跨 worker slice | Test_0100 Int32/Float64/Uint8 视图、Test_0400 继承、Test_0500 跨 worker slice |
| ⑥重复调用幂等性 | 相同 byteLength 多次构造一致、多次 slice | Test_0700 反复创建销毁、Test_0800 1000 次组合 |
| ⑦并发跨线程 | 跨 worker slice、SAB 作类属性跨线程传递、10 线程竞态 | Test_0500/0600/0900 多线程 taskpool/worker |
