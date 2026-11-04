# ASON 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/ArkTSUtils_ASON/entry/src/ohosTest/ets/test/` 下 13 个 `*.test.ets`（ASON 命名空间 + JSON.parseSendable 并行 API + ArkTSUtils.isSendable/JSON），共解析 **1413** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.utils.d.ets` **L433–L578**（`namespace ASON`）+ `JSON.parseSendable`/`JSON.BigIntMode`/`JSON.ParseReturnType`（`@kit.ArkTS` JSON 命名空间扩展）。
> **文档来源**：`test/.../apis-arkts/arkts-apis-arkts-utils-ASON.md`（namespace ASON，@since 12，MAP @since 13，stringify 参数 Object 宽化 @since 18）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
ASON 测试目录（3 个 API 族）
├── A. namespace ASON（ArkTSUtils.ASON）
│   ├── 1. 接口测试
│   │   ├── parse(text, reviver?, options?)        （JSON 串 → ISendable|null，主接口）
│   │   ├── stringify(value)                        （Object → JSON 串，主接口，@since 18 宽化）
│   │   ├── BigIntMode (const enum)                 （DEFAULT/PARSE_AS_BIGINT/ALWAYS_PARSE_AS_BIGINT）
│   │   ├── ParseReturnType (const enum)            （OBJECT / MAP@since13）
│   │   ├── ParseOptions (interface)                （bigIntMode + parseReturnType）
│   │   ├── Transformer (type alias)                （reviver 函数类型，当前仅 undefined 生效）
│   │   └── ISendable (type alias = lang.ISendable) （所有 Sendable 父类型）
│   ├── 2. 稳定性                  （超大 JSON、深嵌套、循环引用、大批量解析）
│   ├── 3. 性能                    （未见单接口基线性能基准用例）
│   ├── 4. 并发安全                 （ASON 结果跨线程传递——声明用途，但实测缺）
│   ├── 5. 兼容性与继承            （@since 18 stringify Object 宽化、Sendable 类型约束）
│   └── 6. 资料与文档符合性         （Transformer 仅 undefined、错误码未声明、mislabeled desc）
├── B. JSON.parseSendable（JSON 命名空间并行 API，619 例）
│   ├── parseSendable(text, reviver?, options?)     （JSON 串 → ISendable|null，JSON 命名空间）
│   ├── JSON.BigIntMode / JSON.ParseReturnType      （与 ASON 枚举对位的 JSON 命名空间枚举）
│   ├── Basic/Compare/RoundTrip/Transform            （与 ASON 同名文件对位的 4 维度覆盖）
│   └── Security                                     （深嵌套/大数组/大对象/throwing getter 安全性）
└── C. ArkTSUtils.isSendable / lang.ISendable / 内置 JSON（69 例）
    ├── ArkTSUtils.isSendable()                      （Sendable 类型判断，跨线程）
    ├── lang.ISendable                               （类型别名可用性）
    └── 内置 JSON.parse/stringify                    （数字键/非数字键/重复键行为）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | API 族 | 接口覆盖 |
|---|------|:---:|:---:|------|
| 1 | ArkTSUtilsASON.test.ets | 29 | A | parse + stringify smoke（含 BigIntMode/ParseReturnType/ParseOptions 矩阵、isSendable） |
| 2 | ASONParseBasic.test.ets | 127 | A | parse（基础类型 BigInt/number/string/array/bool/obj/Map、options、错误、参数/返回值/空串） |
| 3 | ASONParseCompare.test.ets | 100 | A | parse（解析结果行为/值正确性比对） |
| 4 | ASONParseRoundTrip.test.ets | 148 | A | parse↔stringify 往返（含 15 例 SyntaxError 错误） |
| 5 | ASONParseTransform.test.ets | 148 | A | parse（多结构对象解析；文件名 Transform 但**未传 reviver**） |
| 6 | ASONStringify.test.ets | 173 | A | stringify（基础类型/Map/Set/HashMap/HashSet/undefined 值） |
| 7 | JSONParseSendableBasic.test.ets | 121 | B | JSON.parseSendable（基础类型 BigInt/number/string/array/bool/obj/Map、options、错误） |
| 8 | JSONParseSendableCompare.test.ets | 100 | B | JSON.parseSendable（解析结果行为/值正确性比对） |
| 9 | JSONParseSendableRoundTrip.test.ets | 148 | B | JSON.parseSendable↔stringify 往返 |
| 10 | JSONParseSendableTransform.test.ets | 148 | B | JSON.parseSendable（多结构对象解析） |
| 11 | JSONParseSendableSecurity.test.ets | 102 | B | JSON.parseSendable 安全性（深嵌套/大数组/大对象/throwing getter/原型污染） |
| 12 | ArkTSUtilJSON.test.ets | 25 | C | 内置 JSON.parse/stringify（数字键/非数字键/重复键行为） |
| 13 | ArkTSUtilsIsSendable.test.ets | 44 | C | ArkTSUtils.isSendable / lang.ISendable（类型判断、跨线程、SendableClass） |
| | **合计** | **1413** | | A:725（ASON 命名空间）/ B:619（JSON.parseSendable）/ C:69（isSendable+内置JSON） |

**已排除**（非测试文件）：`List.test.ets`（聚合 re-export，0 条 `@tc.name`）、`exportFunc.ets`（工具类，非测试文件）。两者不产出测试点。

> **API 族说明**：A 族（ASON 命名空间，ArkTSUtils.ASON.parse/stringify）为原报告核心范围；B 族（JSON.parseSendable）为 JSON 命名空间并行 API，与 ASON 接口签名对位（parseSendable ↔ parse），619 例覆盖 Basic/Compare/RoundTrip/Transform/Security 五维度；C 族（ArkTSUtils.isSendable + 内置 JSON）覆盖 Sendable 类型判断与内置 JSON 行为。三族共处同一测试目录，合计 1413 例。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件」标注用例位置；编号段取自解析结果。

## 1.1 parse(text, reviver?, options?)

```
parse
├── 入参范围覆盖
│   ├── JSON 全值类型——bigint（PARSE_AS_BIGINT/ALWAYS_PARSE_AS_BIGINT）
│   ├── number（含科学记数）
│   string（含 Unicode/emoji/多行/空串）、array、true/false、object、SendableMap（MAP 返回类型）、嵌套对象/数组
├── 边界值测试
│   ├── 空串 "" / 空对象 "{}" / 空数组 "[]"
│   ├── 2^53=9007199254740992 BigInt 阈值
│   超大 JSON、深嵌套、循环引用承载、大整数 112233445566778899
├── 异常与非法输入
│   ├── 畸形 JSON（'{'、'{"error"}'、'[1,,2]'、'{"num":1e-}'）→ SyntaxError；
│   MAP 模式畸形 → "Unexpected MAP Prop/MAP in JSON"；OBJECT 模式畸形 → "Unexpected Object Prop/Object in JSON"；
│   断言 err.message 或 instanceof SyntaxError（**非 err.code**）
├── 返回值与类型验证
│   ├── ISendable 返回
│   ├── typeof==='object'
│   ├── isSendable()===true
│   collections.Map<string,bigint> 显式转型、collections.Array<number> 显式转型、嵌套 Map/Array 类型
├── 组合场景
│   ├── parse→stringify 往返一致性（RoundTrip 148 例）
│   ├── parse(JSON) 与 stringify(Map) 互转
│   parse 后访问 (obj as object)?.["key"]、parse→reduce 重组
├── 重复调用幂等性
│   └── （仅 RoundTrip 隐式覆盖，无显式同串二次 parse 断言）
└── 并发跨线程
    └── （**未发现**——ASON 声明用途为"跨并发实例引用传递"，但无 TaskPool/Worker 跨线程传递 ASON 结果用例）
```
- **用例位置**：smoke `ArkTSUtilsASON.test.ets`（parse 21 例：`5400`(Transformer 标注/实为 parse) + `5500~5800`(BigIntMode/ParseOptions) + `5900~6500`(7 例) + `6900~7800`(9 例)）+ 专用 `ASONParseBasic.test.ets`（127 例：`BASIC_0001~0127`）+ `ASONParseCompare.test.ets`（100 例：`COMPARE_0001~0100`）+ `ASONParseRoundTrip.test.ets`（148 例：`ROUNDTRIP_0001~0148`，含 15 例 SyntaxError）+ `ASONParseTransform.test.ets`（148 例：`TRANSFORM_0001~0148`，**未传 reviver**）。
- **测了哪些**：全 JSON 值类型解析 + BigIntMode 三模式 + OBJECT/MAP 两返回类型 + 往返一致性 + 畸形 JSON SyntaxError；**reviver 参数从未传真实函数（恒 undefined）**；**parse(null)→null 文档语义未测**；**跨线程传递未测**。

## 1.2 stringify(value)

```
stringify
├── 入参范围覆盖
│   ├── null
│   ├── undefined
│   ├── number
│   ├── boolean
│   ├── string
│   ├── SendableMap（MAP parse 产物）
│   内置 Map/Set、collections.Map/Set、HashMap/HashSet、嵌套对象/数组、SendableTestClass/NormalTestClass
├── 边界值测试
│   ├── 空 Map/Set
│   ├── 含 undefined 值的 Map/Set
│   ├── 空串
│   └── null/undefined 入参
├── 异常与非法输入
│   └── （2 处 try/catch，无错误码断言；非 Object 类型未独立验证）
├── 返回值与类型验证
│   ├── string 返回类型
│   └── 精确串相等断言（'{"k":"v"}'/'[1,2,3]'/'{}'/'null'）
├── 组合场景
│   ├── parse(MAP)→stringify 往返
│   ├── HashMap/HashSet（hashCode 序不确定）→ 串
│   └── Set→数组串
├── 重复调用幂等性
│   └── （隐式覆盖，无显式同对象二次 stringify 断言）
└── 并发跨线程
    └── （**未发现**——stringify 产物（普通 string）虽可跨线程，但无跨线程调用 stringify 用例）
```
- **用例位置**：smoke `ArkTSUtilsASON.test.ets`（stringify 3 例：`6600~6800`，含 `stringify(null)`/`stringify(undefined)`）+ 专用 `ASONStringify.test.ets`（173 例：`STRINGIFY_0001~0173`，含 `0011~0023` Map and Set、`0024~0029` Map and Set undefined、`0030~0173` 类型矩阵）。
- **测了哪些**：全类型→JSON 串 + Map/Set/HashMap/HashSet + undefined 值处理 + 精确串断言 + parse-MAP→stringify 往返；**非 Object/非 Sendable 类型 stringify 的 401/异常未测**；**@since 18 Object 宽化（普通非 Sendable 对象）未独立验证**。

## 1.3 BigIntMode（const enum：DEFAULT=0 / PARSE_AS_BIGINT=1 / ALWAYS_PARSE_AS_BIGINT=2）

```
BigIntMode
├── 入参范围覆盖
│   └── 三枚举值全部经 ParseOptions.bigIntMode 传入 parse（ArkTSUtilsASON 5500~5800、Basic 多例）
├── 边界值测试
│   ├── 2^53=9007199254740992 阈值（5600 PARSE_AS_BIGINT→bigint）
│   └── 大整数 112233445566778899
├── 异常与非法输入
│   └── DEFAULT 模式传入含 'n' 字面的非法串 '{"largeNumber":112233445566778899n}' → 期望失败（5500）
├── 返回值与类型验证
│   └── PARSE_AS_BIGINT/ALWAYS_PARSE_AS_BIGINT→typeof==='bigint'；DEFAULT→number/object
├── 组合场景
│   └── 与 ParseReturnType.OBJECT 组合（BigIntMode×OBJECT 矩阵）
├── 重复调用幂等性
│   └── （隐式）
└── 并发跨线程
    └── （未发现）
```
- **用例位置**：`ArkTSUtilsASON.test.ets`（`5500~5800` 4 例三模式 + isSendable）+ `ASONParseBasic.test.ets`（`0001` BigInt + 散落 options 用例 ~10 处）+ `ASONStringify.test.ets`（parse-MAP setup 中 ~4 处 PARSE_AS_BIGINT）。
- **测了哪些**：三枚举值 + 2^53 阈值 + typeof bigint 验证；**DEFAULT 模式下 >2^53 合法大整数精度损失行为未直接断言**；**ALWAYS_PARSE_AS_BIGINT 对小整数(1)→bigint 已测（5700）**。

## 1.4 ParseReturnType（const enum：OBJECT=0 / MAP=1@since13）

```
ParseReturnType
├── 入参范围覆盖
│   └── OBJECT（默认）+ MAP 两值经 ParseOptions.parseReturnType 传入 parse
├── 边界值测试
│   └── 空 JSON "{}"/"[]" 在两模式下的返回
├── 异常与非法输入
│   └── MAP 模式畸形 JSON → "Unexpected MAP Prop/MAP in JSON"；OBJECT 模式 → "Unexpected Object Prop/Object in JSON"（Basic 015~018）
├── 返回值与类型验证
│   └── OBJECT→ISendable 对象；MAP→collections.Map<string,bigint>（可 .get() 取值）
├── 组合场景
│   ├── MAP parse→stringify 往返（Stringify 011~023）
│   └── MAP 嵌套对象
├── 重复调用幂等性
│   └── （隐式）
└── 并发跨线程
    └── （未发现）
```
- **用例位置**：`ArkTSUtilsASON.test.ets`（`5500~5800` 均用 OBJECT；散落）+ `ASONParseBasic.test.ets`（`0001` BigInt、`0012~0014` Map、`0015~0018` 两模式错误）+ `ASONStringify.test.ets`（`0011~0023` MAP parse→stringify）。
- **测了哪些**：OBJECT/MAP 两返回类型 + MAP 模式独立错误信息 + MAP .get() 取值；**MAP 返回对象的独立可变性（parse→修改 Map→再 stringify）未独立验证**。

## 1.5 ParseOptions（interface：bigIntMode + parseReturnType）

```
ParseOptions
├── 入参范围覆盖
│   ├── 两字段组合矩阵（BigIntMode × ParseReturnType）
│   ├── undefined（默认）
│   └── undefined reviver
├── 边界值测试
│   └── （随 parse 边界）
├── 异常与非法输入
│   └── （畸形串 + options 组合，见 BigIntMode/ParseReturnType）
├── 返回值与类型验证
│   └── options 传 undefined → 默认行为；两字段赋值 → 对应模式生效
├── 组合场景
│   └── options 作为 parse 第三参与 reviver(undefined) 组合
├── 重复调用幂等性
│   └── （隐式）
└── 并发跨线程
    └── （未发现）
```
- **用例位置**：`ArkTSUtilsASON.test.ets`（29 例几乎每例构造 ParseOptions）+ `ASONParseBasic.test.ets`（`0020` undefined reviver、`0021` undefined options、散落 ~9 处）+ `ASONStringify.test.ets`（parse-MAP setup 4 处）。
- **测了哪些**：两字段矩阵 + undefined 默认；**ParseOptions 缺字段/非法枚举值（ArkTS 严格类型下编译期拦截，运行期 401 需 as unknown 注入）未测**。

## 1.6 Transformer（type alias：reviver 函数类型）

```
Transformer
├── 入参范围覆盖
│   └── **❌ 未覆盖**——reviver 参数恒传 undefined，从未传入真实 (this,key,value)=>ISendable 函数
├── 边界值测试
│   └── ❌ 无
├── 异常与非法输入
│   └── ❌ 文档明示"非 undefined 值会被忽略或视为无效"，但**无任何用例验证传入真实函数的忽略/无效行为**
├── 返回值与类型验证
│   └── ❌ 转换结果修改语义未验证（Transformer 声明用途）
├── 组合场景
│   └── ❌
├── 重复调用幂等性
│   └── ❌
└── 并发跨线程
    └── ❌
```
- **用例位置**：**无专用用例**。`ArkTSUtilsASON.test.ets` 的 `5400`（@tc.desc "Test the function of the interface Transformer"）实际代码 `ASON.parse(numberText, undefined, options)`——**reviver 传 undefined，未测 Transformer**（🔴 desc 误标）。
- **测了哪些**：仅证明 `undefined` 作为 reviver 不报错（与文档"默认 undefined"一致）；**Transformer 类型的实际转换行为零覆盖**。

## 1.7 ISendable（type alias = lang.ISendable）

```
ISendable
├── 入参范围覆盖
│   └── （间接）parse 返回值 `as ISendable` 转型遍布全部 parse 用例（ISendable 引用 200+ 处）
├── 边界值测试
│   └── ❌
├── 异常与非法输入
│   └── ❌
├── 返回值与类型验证
│   ├── isSendable(parseResult)===true（5800）
│   └── typeof==='object'
├── 组合场景
│   └── parse 结果 `(obj as object)?.["key"]` 属性访问
├── 重复调用幂等性
│   └── ❌
└── 并发跨线程
    └── ❌
```
- **用例位置**：`ArkTSUtilsASON.test.ets`（`5800` isSendable 断言、29 例 `type ISendable = lang.ISendable` 局部别名）+ 全部 parse 文件的 `as ISendable`/`as lang.ISendable` 转型 + `ArkTSUtilsIsSendable.test.ets`（44 例 isSendable/lang.ISendable 专项覆盖，见 §1.8）。
- **测了哪些**：类型别名可用性 + isSendable 断言 + 属性访问；**ISendable 作为 ASON 重定义类型（= lang.ISendable）的等价性无显式断言**。

---

## 1.8 JSON.parseSendable（B 族，619 例）

> JSON.parseSendable 为 JSON 命名空间并行 API，接口签名与 ASON.parse 对位（text, reviver?, options?），返回 ISendable|null。使用 JSON.BigIntMode / JSON.ParseReturnType 枚举（与 ASON.BigIntMode / ASON.ParseReturnType 对位）。5 个测试文件与 A 族同名文件一一对应。

### 1.8.1 JSON.parseSendable 基础类型（JSONParseSendableBasic，121 例）

- **用例位置**：`JSONParseSendableBasic.test.ets`（121 例）。
- **测了哪些**：基础类型 BigInt/number/string/array/bool/object/SendableMap(MAP) 解析 + BigIntMode 三模式 + OBJECT/MAP 两返回类型 + options 矩阵 + 畸形 JSON 错误。与 `ASONParseBasic` 对位覆盖。

### 1.8.2 JSON.parseSendable 值正确性比对（JSONParseSendableCompare，100 例）

- **用例位置**：`JSONParseSendableCompare.test.ets`（100 例）。
- **测了哪些**：解析结果行为/值正确性比对。与 `ASONParseCompare` 对位覆盖。

### 1.8.3 JSON.parseSendable 往返（JSONParseSendableRoundTrip，148 例）

- **用例位置**：`JSONParseSendableRoundTrip.test.ets`（148 例）。
- **测了哪些**：parseSendable↔stringify 往返一致性。与 `ASONParseRoundTrip` 对位覆盖。

### 1.8.4 JSON.parseSendable 多结构（JSONParseSendableTransform，148 例）

- **用例位置**：`JSONParseSendableTransform.test.ets`（148 例）。
- **测了哪些**：多结构对象解析。与 `ASONParseTransform` 对位覆盖。

### 1.8.5 JSON.parseSendable 安全性（JSONParseSendableSecurity，102 例）

- **用例位置**：`JSONParseSendableSecurity.test.ets`（102 例）。
- **测了哪些**：深嵌套数组/对象（genNestedArrayJson/genNestedObjectJson 生成器）+ 大数组/大对象（genLargeArrayJson/genLargeObjectJson）+ throwing getter options（ThrowingParseReturnTypeOptions/ThrowingBigIntModeOptions，options 字段 getter 抛错时 parseSendable 行为）+ 原型污染/注入安全验证。**ASON 族无对应安全专项文件**——B 族独有覆盖维度。

---

## 1.9 ArkTSUtils.isSendable / lang.ISendable / 内置 JSON（C 族，69 例）

### 1.9.1 ArkTSUtils.isSendable()（ArkTSUtilsIsSendable，44 例）

- **用例位置**：`ArkTSUtilsIsSendable.test.ets`（44 例：`SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_IS_SENDABLE_0001~0044`）。
- **测了哪些**：`ArkTSUtils.isSendable()` 对全类型空间（number/string/boolean/bigint/null/undefined/class/function/enum/Array/Map/Set/TypedArray）的返回值断言 + `lang.ISendable` 类型别名可用性 + `@Sendable` class（SendableClass/NumClass）跨 TaskPool 传递后 isSendable 一致性 + AsyncLock/ConditionVariable/ReadWriteLock 锁场景下 isSendable + ASON.parse 结果 isSendable 验证（顺带覆盖）。**C 族有跨线程并发覆盖**（import taskpool，exclusiveTask/sharedTaskTime 等）——与 A 族"零并发"形成对比。

### 1.9.2 内置 JSON.parse/stringify（ArkTSUtilJSON，25 例）

- **用例位置**：`ArkTSUtilJSON.test.ets`（25 例）。
- **测了哪些**：内置 `JSON.parse`/`JSON.stringify` 对数字键（`"0":"v"`）/非数字键（`"k0":"v"`）/重复键（`"k0":"first"` + `"k0":"last"`）的行为差异 + 大属性对象（buildNumbericKeyJson/buildNonNumbericKeyJson/buildDuplicateKeyJson 生成器，1024+ 属性）+ `lang.ISendable` 转型 + `collections.Map` 互操作。**测内置 JSON 而非 ASON**，为 ArkTSUtils 模块 JSON 行为基线。

---

# 2. 稳定性

- **用例位置**：`ASONParseRoundTrip.test.ets`（148 例含深嵌套/大对象往返）+ `ASONParseTransform.test.ets`（148 例多结构对象）+ `ASONParseBasic.test.ets`（大整数/嵌套 Map/Array）+ `ASONStringify.test.ets`（HashMap/HashSet/嵌套）。
- **测了哪些**：超大/深嵌套 JSON 解析稳定性 + 往返稳定性；**未见显式循环创建销毁/超大批量（10万次）稳定性基准用例**。

# 3. 性能

- **用例位置**：**未发现**专用性能基准用例。
- **测了哪些**：无；**parse/stringify 单接口吞吐基线、大 JSON 解析耗时均无性能用例**。

# 4. 并发安全

- **用例位置**：**ASON 命名空间（A 族）未发现**。`ArkTSUtilsASON.test.ets` import `taskpool` 但仅导入未使用（grep A 族 6 文件 0 处 `TaskPool.execute`/`@Concurrent`/`Worker` 实际调用）。注：C 族 `ArkTSUtilsIsSendable.test.ets` 有跨线程 isSendable 测试（44 例），但测 isSendable 类型判断而非 ASON parse 结果传递。
- **测了哪些**：无；**ASON 声明用途为"用于跨并发实例引用传递"，但 parse 产出的 ISendable/SendableMap 跨 TaskPool/Worker 传递的可见性与正确性零覆盖**——最高优先级缺口（见 §7.3）。

# 5. 兼容性与继承

- **用例位置**：`ASONStringify.test.ets`（`SendableTestClass`/`NormalTestClass` from './exportFunc'，覆盖 Sendable 与非 Sendable 两类）+ `ASONParseRoundTrip/Transform`（多结构对象兼容）。
- **测了哪些**：Sendable 类 + 普通类 stringify 兼容；**@since 18 stringify 参数 Object 宽化（API 18 前仅 ISendable）的版本边界无独立验证**；**ASON 为 namespace（非 class），无继承/子类化场景**。

# 6. 资料与文档符合性

- **用例位置**：`ArkTSUtilsASON.test.ets`（@since 12 smoke、BigIntMode/ParseReturnType 枚举符合性、isSendable）+ `ASONParseBasic.test.ets`（`0020~0025` 参数/返回值/空串符合性）。
- **测了哪些**：枚举值符合性 + 参数默认值 + 返回类型；**🔴 `5400`@tc.desc 误标"Transformer"（实为 parse options）；`5500~5800`@tc.desc 误标"LockAsyncParseOptions"（实为 BigIntMode/ParseOptions，无 AsyncLock）**；**.d.ets 对 parse/stringify 未声明任何 @throws，但产品对畸形 JSON 抛 SyntaxError——文档缺错误码/异常表**；**文档"reviver 仅 undefined 生效"的行为无符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或隐式） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| parse | ✅(544) | ✅(空串/2^53/大整数) | 🟡(SyntaxError/message，无 code/401/null-reviver) | ✅(ISendable\|null) | ✅(往返) | 🟡(隐式) | ❌(无跨线程) |
| stringify | ✅(176) | ✅(空/undefined) | 🟡(2 try/catch，无 401) | ✅(string) | ✅(parse-MAP→stringify) | 🟡(隐式) | ❌(无跨线程) |
| BigIntMode | ✅(3 模式) | ✅(2^53) | 🟡(非法 'n' 串失败) | ✅(typeof bigint) | 🟡(×OBJECT) | 🟡(隐式) | ❌ |
| ParseReturnType | ✅(OBJECT/MAP) | 🟡(空 JSON) | ✅(MAP/Object 错误信息) | ✅(Map.get()) | ✅(MAP→stringify) | 🟡(隐式) | ❌ |
| ParseOptions | ✅(两字段矩阵) | 🟡 | 🟡(随 parse) | ✅(undefined 默认) | 🟡 | 🟡(隐式) | ❌ |
| Transformer | ❌(恒 undefined) | ❌ | ❌(无 invalid-reviver) | ❌ | ❌ | ❌ | ❌ |
| ISendable | 🟡(类型转型间接) | ❌ | ❌ | ✅(isSendable) | 🟡 | ❌ | ❌ |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.utils.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `parse(text, reviver?, options?)` @since 12 | 未声明 @throws；doc 返回 ISendable\|null（入参 null→null）；reviver"仅 undefined 生效，Other忽略/无效" | ✅ 值类型/options/往返覆盖（Basic/Compare/RoundTrip/Transform 544 例）；⚠️ .d.ets 未声明 @throws 但产品对畸形 JSON 抛 SyntaxError（**文档缺错误码/异常表**）；❌ **reviver 恒传 undefined，真实 Transformer 函数行为零覆盖**（SUP_ASON_PARSE_REVIVER_IGNORE_001/_NULL_001）；❌ **parse(null)→null / parse("null") 文档语义未测**（SUP_ASON_PARSE_NULL_ARG_001/_LITERAL_001）；❌ **非 string text 401 未测**（SUP_ASON_PARSE_401_TEXT_001）；🔴 Transform 文件名误导（未传 reviver，见 §7.3）。 |
| 2 | `stringify(value)` @since 12，参数 Object @since 18 | 未声明 @throws；doc 支持 Map/Set/HashMap/HashSet | ✅ 类型覆盖（Stringify 173 + ArkTSUtilsASON 3 = 176 例）；⚠️ .d.ets 未声明 @throws；❌ **非 Object 类型 401 未测**（SUP_ASON_STRINGIFY_401_VALUE_001）；❌ **@since 18 Object 宽化（非 Sendable 普通对象）独立验证弱**（SUP_ASON_STRINGIFY_PLAIN_OBJ_001）；❌ 同对象二次 stringify 幂等无显式断言（SUP_ASON_STRINGIFY_IDEMPOTENT_001）。 |
| 3 | `BigIntMode`（DEFAULT/PARSE_AS_BIGINT/ALWAYS_PARSE_AS_BIGINT） | doc DEFAULT 不支持 BigInt；PARSE_AS_BIGINT 阈值 2^53 | ✅ 三模式覆盖（ArkTSUtilsASON 5500~5800、Basic）；✅ 2^53 阈值 typeof bigint（5600）；❌ **DEFAULT 模式 >2^53 合法大整数精度损失未断言**（5500 用非法 'n' 串，未测合法大数，SUP_ASON_BIGINT_DEFAULT_LOSSY_001）；❌ ALWAYS_PARSE_AS_BIGINT 小整数边界弱（SUP_ASON_BIGINT_ALWAYS_SMALL_001）。 |
| 4 | `ParseReturnType`（OBJECT@12 / MAP@13） | doc OBJECT 返 SendableObject、MAP 返 SendableMap | ✅ 两值覆盖（Basic 012~014、Stringify 011~023）；✅ MAP 模式独立错误信息（Basic 015~018）；✅ MAP .get() 取值；❌ **MAP 返回对象可变性（parse→set/delete→stringify）无独立用例**（SUP_ASON_PARSE_MUTATE_STRINGIFY_001）。 |
| 5 | `ParseOptions`（bigIntMode + parseReturnType） | doc 两字段 | ✅ 两字段矩阵 + undefined 默认（ArkTSUtilsASON 29 例）；❌ **缺字段/非法枚举值 401 未测**（ArkTS 严格类型编译期拦截，需 as unknown 注入，归 SUP_ASON_PARSE_401_TEXT_001 系列）。 |
| 6 | `Transformer`（type alias） | doc reviver"仅 undefined 生效，Other忽略/无效" | ❌ **零行为覆盖**——reviver 恒 undefined，无真实函数用例；🔴 `ArkTSUtilsASON 5400` @tc.desc 误标"Transformer"（实为 parse options，见 E.1 改造）；❌ 文档"忽略/无效"行为无符合性证据（SUP_ASON_PARSE_REVIVER_IGNORE_001/_NULL_001）。 |
| 7 | `ISendable`（= lang.ISendable） | doc 所有 Sendable 父类型 | 🟡 间接覆盖（`as ISendable` 转型遍布 + isSendable 5800）；❌ **ISON 重定义(=lang.ISendable)等价性无显式断言**（低优先，归 §7.4 文档建议）。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **ASON 结果跨线程传递（核心缺口）**：ASON 文档开宗明义"用于跨并发实例引用传递"，即 parse 产出的 ISendable/SendableMap 跨线程共享。但 A 族 6 文件 grep `TaskPool.execute`/`@Concurrent`/`Worker` **0 实际调用**（`ArkTSUtilsASON` import `taskpool` 但未用）。**A 族 725 用例无一验证 ASON 结果跨 TaskPool/Worker 传递的可见性与正确性**——ASON 核心用途未验证。❌ 组合缺口（SUP_ASON_CONC_TASKPOOL_001/_MAP_001/_MULTI_WRITE_001，P0/P1）。

2. **parse↔stringify 往返**：✅ 充分覆盖（RoundTrip 148 例、Transform 148 例、Stringify 011~023 parse-MAP→stringify）。但**仅测不变更往返**，**parse 产出 SendableMap 修改后 stringify 的组合未独立覆盖**（SUP_ASON_PARSE_MUTATE_STRINGIFY_001）。⚠️ 部分缺口。

3. **Transformer reviver 组合**：parse 的 reviver 参数与 options 的组合（reviver 真实函数 × BigIntMode × ParseReturnType）**零覆盖**——reviver 恒 undefined。❌ 组合缺口（SUP_ASON_PARSE_REVIVER_IGNORE_001）。

4. **MAP 返回对象可变性**：parse(MAP)→Map.set/get/delete→stringify 链路仅测 set/get 取值与往返，**delete/set 变更后串化未独立测**（同 SUP_ASON_PARSE_MUTATE_STRINGIFY_001）。❌ 组合缺口。

5. **BigIntMode × 合法大数**：DEFAULT 模式对 >2^53 合法大整数的 number 精度损失路径未与 PARSE_AS_BIGINT bigint 路径对比（SUP_ASON_BIGINT_DEFAULT_LOSSY_001）。❌ 组合缺口。

6. **stringify 类型宽化**：@since 18 参数 Object 宽化后，非 Sendable 普通对象/普通 Map/Set 与 Sendable 对象的 stringify 行为对称性弱（NormalTestClass 部分覆盖，纯普通对象未独立，SUP_ASON_STRINGIFY_PLAIN_OBJ_001）。⚠️ 部分缺口。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **parse/stringify @throws 缺声明（⚠️ 文档缺口）**：`.d.ets` L469/L482 对 parse/stringify **均未声明 @throws**，但产品对畸形 JSON 抛 SyntaxError（RoundTrip 15 例 instanceof SyntaxError 证实）、对非法参数应抛 401。建议在 `.d.ets` 与 `.md` 为 parse 补 `@throws SyntaxError`（畸形 JSON）与 `@throws BusinessError 401`（text 非法类型），为 stringify 补 `@throws BusinessError 401`（value 非法类型）。同步增补测试（SUP_ASON_PARSE_401_TEXT_001、SUP_ASON_STRINGIFY_401_VALUE_001，D 组）。

2. **Transformer 仅 undefined 行为未文档化符合性**：`.md` parse reviver 参数说明已注"该参数目前仅支持传入undefined值，Other值会被忽略或视为无效"。建议在 `.md` 明确"传入真实 Transformer 函数当前被忽略，结果与 undefined 等价"，并在测试侧固化该符合性证据（SUP_ASON_PARSE_REVIVER_IGNORE_001/_NULL_001，A 组），避免 Transformer 类型被误解为可用。

3. **mislabeled @tc.desc 修正（🔴 测试缺陷）**：`ArkTSUtilsASON 5400`（@tc.desc "Transformer"）实为 parse options；`5500~5800`（@tc.desc "LockAsyncParseOptions"）实为 BigIntMode/ParseOptions 矩阵，ASON 命名空间**无 LockAsync 接口**。建议改标（E.1/E.2），消除虚假覆盖信号。

4. **@since 18 stringify Object 宽化说明**：`.md` 已注"从API 18开始参数修改为Object类型，API 18之前参数只支持ISendable"。建议测试侧补非 Sendable 普通对象 stringify 独立用例（SUP_ASON_STRINGIFY_PLAIN_OBJ_001，I 组），使宽化契约有显式证据。

5. **错误断言标准化**：现有错误用例断言 `err.message` 字符串（Basic 015~018）与 `instanceof SyntaxError`（RoundTrip）。err.message 属实现细节，产品改文案即破。建议文档补错误码表后，测试向 `err.code` 断言迁移，message 改 `assertInclude` 容忍文案微调（J.1 改造）。

6. **ParseReturnType.MAP @since 13 标注一致性**：`.d.ets` L546 与 `.md` 一致标注 MAP `@since 13`。测试侧 MAP 覆盖充分（Basic/Stringify），无需补，保留符合性。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 2 | SUP_ASON_CONC_TASKPOOL_001、SUP_ASON_CONC_TASKPOOL_MAP_001 | ASON 结果跨 TaskPool 传递——ASON 声明核心用途"跨并发实例引用传递"，A 族 725 用例无一跨线程，最高优先。 |
| **P1** | 5 新增 + 2 改造 = 7 | A×2（reviver 真实函数行为）+ B×2（parse null 文档语义）+ C_MULTI_WRITE×1（并发 parse 线程安全）+ 改造 E.1（5400 误标）/E.2（5500~5800 误标） | 声明类型/文档明示行为但零证据，或 mislabeled desc 虚假覆盖信号；属契约符合性硬缺口。 |
| **P2** | 8 新增 + 1 改造 = 9 | D×2（401 错误码）+ F×2（BigInt DEFAULT 精度）+ G×2（幂等）+ H×1（parse-mutate-stringify）+ I×1（@since18 Object 宽化）+ 改造 J.1（错误断言强化） | 覆盖已存在但定位弱 / 无声明 @throws 的契约边界；非阻断但提升套件质量与防回归。 |
| **合计** | **15 新增 + 3 改造** | | P0=2 / P1=7（5 新+2 改）/ P2=9（8 新+1 改）。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（text/value/options/reviver）遍历合法类型空间 | Basic 001~014 全 JSON 类型、Stringify 类型矩阵、BigIntMode 三模式 |
| ②边界值测试 | 空串/空容器/"{}"/"[]"、2^53 BigInt 阈值、超大 JSON、深嵌套、null/undefined 入参 | Basic 023~025 空串/空对象/空数组、ArkTSUtilsASON 5600 2^53 |
| ③异常与非法输入 | 畸形 JSON SyntaxError、MAP/OBJECT 模式错误信息、非 undefined reviver（文档"忽略/无效"）、401（需 as unknown 注入） | Basic 015~018 畸形串、RoundTrip 15 例 instanceof SyntaxError |
| ④返回值与类型验证 | ISendable\|null、string、bigint/number typeof、Map.get()、isSendable() | Basic 022 返回类型、ArkTSUtilsASON 5800 isSendable、Stringify 精确串断言 |
| ⑤组合场景 | parse↔stringify 往返、parse-MAP→stringify、JSON↔Map 互转、嵌套结构重组 | RoundTrip 148 例、Transform 多结构、Stringify 011~023 Map/Set |
| ⑥重复调用幂等性 | 同 text 二次 parse 一致、同 value 二次 stringify 一致 | （仅 RoundTrip 隐式覆盖，无显式断言） |
| ⑦并发跨线程 | ASON 结果 ISendable/SendableMap 跨 TaskPool/Worker 传递可见性与正确性 | （未发现——ASON 声明用途但零覆盖） |
