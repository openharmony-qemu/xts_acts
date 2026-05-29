# enum_standard_test_static 测试用例审计报告

**审计日期:** 2026-05-23  
**审计范围:** 全部 5 个测试文件，共 386 条用例  
**审计维度:** JDoc 描述与实现匹配性、无效用例、重复用例、编号连续性

---

## 一、总体概况

| 文件 | 用例数 | 编号跳跃 | JDoc 不匹配 | 无效用例 | 文件内重复 | 跨文件重复 |
|------|--------|----------|-------------|----------|------------|------------|
| BaseEnumTest.test.ets | 159 | 无 | 6 | 8 | 若干 | 大量 |
| BaseEnumConstructorTest.test.ets | 48 | 有 | 1 | 0 | 0 | — |
| BaseEnumGetNameTest.test.ets | 30 | 无 | 0 | 2 | 0 | 大量 |
| BaseEnumToStringTest.test.ets | 70 | 有 | 1 | 0 | 1 | 大量 |
| BaseEnumValueOfTest.test.ets | 86 | 有 | 0 | 0 | 0 | 大量 |

---

## 二、JDoc 描述与代码实现不匹配

### 2.1 BaseEnumTest.test.ets

| 编号 | 用例 | @tc.desc | 问题 |
|------|------|----------|------|
| 014 | testBaseEnum014 | Verify BaseEnum constructor **throws** for out-of-range short value 32768 | 代码**没有** try/catch，直接构造并断言 `Int.toShort(-32768)`，并非测试抛出异常 |
| 054 | testBaseEnum054 | Verify BaseEnum constructor with **single character name** | name 参数为 `"SINGLE_CHAR"`（11个字符），实际测试的是 value `"A"` 的单字符 **value**，不是 name |
| 058 | testBaseEnum058 | Verify BaseEnum constructor with string value containing **spaces** | 代码使用 `​`（零宽空格），应描述为 "zero-width space"，而非普通空格 |
| 071 | testBaseEnum071 | Verify constructor name parameter with **spaces** | 同上，代码使用 `​`（零宽空格），应描述为 "zero-width space" |
| 120 | testBaseEnum120 | Verify toString return value **contains name information** | 代码断言 `str.assertEqual("42")`，这是 value 不是 name；description 应说 "contains value information" |
| 130 | testBaseEnum130 | Verify different instances have **independent names via getName** | 代码实际测试的是 `valueOf()`（验证值为 1/2/3），根本没有调用 `getName()` |

### 2.2 BaseEnumConstructorTest.test.ets

| 编号 | 用例 | @tc.desc | 问题 |
|------|------|----------|------|
| 048 | testBaseEnumConstructor048 | Verify BaseEnum constructor **succeeds in try block** with normal parameters | 代码没有使用 try 块，直接构造并断言 |

### 2.3 BaseEnumToStringTest.test.ets

| 编号 | 用例 | @tc.desc | 问题 |
|------|------|----------|------|
| 001 | testBaseEnumToString001 | Verify BaseEnum toString normal call returns value string **and ignores extra parameters** | 代码没有传递任何额外参数，"ignores extra parameters" 部分未被测试 |

---

## 三、无效用例（无断言或断言无意义）

### 3.1 BaseEnumTest.test.ets

| 编号 | 用例 | @tc.desc | 问题 |
|------|------|----------|------|
| 115 | testBaseEnum115 | Verify getName returns value of type string | 仅声明 `let name: string = e.getName()`，**没有任何 expect 断言** |
| 116 | testBaseEnum116 | Verify getName return value is not null | 仅创建对象 `new BaseEnum<int>(1, "TEST")`，**没有任何断言** |
| 123 | testBaseEnum123 | Verify toString works correctly for short type | 仅调用 `e.toString()`，**没有任何断言** |
| 124 | testBaseEnum124 | Verify toString works correctly for long type | 仅调用 `e.toString()`，**没有任何断言** |
| 125 | testBaseEnum125 | Verify toString works correctly for float type | 仅调用 `e.toString()`，**没有任何断言** |
| 126 | testBaseEnum126 | Verify toString works correctly for double type | 仅调用 `e.toString()`，**没有任何断言** |
| 127 | testBaseEnum127 | Verify toString works correctly for string type | 仅调用 `e.toString()`，**没有任何断言** |
| 128 | testBaseEnum128 | Verify toString returns value of type string | 仅调用 `e.toString()`，**没有任何断言** |

### 3.2 BaseEnumGetNameTest.test.ets

| 编号 | 用例 | @tc.desc | 问题 |
|------|------|----------|------|
| 020 | testBaseEnumGetName020 | Verify BaseEnum getName return value is not null | 仅调用 `e.getName()`，**没有任何断言** |
| 021 | testBaseEnumGetName021 | Verify BaseEnum getName return value is not undefined | 仅调用 `e.getName()`，**没有任何断言** |

> 以上 10 个用例虽然不会导致测试失败（因为没有断言就不会失败），但也无法验证任何行为，属于**无效用例**。合计占全部 386 条的 2.6%。

---

## 四、同文件内重复用例

### 4.1 BaseEnumTest.test.ets

以下用例对功能高度重叠，仅参数名不同：

| 用例 A | 用例 B | 重复功能描述 |
|--------|--------|-------------|
| testBaseEnum001 (byte=12) | testBaseEnum084 (byte=42) | 均测试 byte 类型的 valueOf |
| testBaseEnum005 (byte max 127) | testBaseEnum085 (byte max 127) | 完全相同的边界值测试 |
| testBaseEnum006 (byte min -128) | testBaseEnum086 (byte min -128) | 完全相同的边界值测试 |
| testBaseEnum015 (int=10000) | testBaseEnum090 (int=10000) | 均测试 int 类型 valueOf，数值完全相同 |
| testBaseEnum016 (int=0) | testBaseEnum093 (int=0) | 均测试 int 零值 valueOf |
| testBaseEnum020 (int=-1) | testBaseEnum094 (int=-1) | 均测试 int 负值 valueOf |
| testBaseEnum081 (valueOf 调用) | testBaseEnum090 (valueOf 调用) | 均测试 int valueOf 无参调用 |
| testBaseEnum120 | testBaseEnum121 | 代码逻辑几乎相同（均检查 toString 返回 "42"），描述不同但实现一致 |
| testBaseEnum083 | testBaseEnum119 | 均测试 toString 返回类型为 string |

### 4.2 BaseEnumToStringTest.test.ets

| 用例 A | 用例 B | 重复功能描述 |
|--------|--------|-------------|
| testBaseEnumToString001 (int 404) | testBaseEnumToString011 (int 404) | **完全相同**的测试：同一个值 404、同一个 name "NOT_FOUND"，同样的断言 |

---

## 五、跨文件同功能重复用例

### 5.1 BaseEnumTest vs BaseEnumValueOfTest（valueOf 功能）

BaseEnumTest 中有约 **60 条** valueOf 相关用例（001-060），BaseEnumValueOfTest 中有 **86 条** valueOf 用例。两者覆盖了相同的类型维度（byte/short/int/long/float/double/string）和相同的边界值场景（零值/最大值/最小值/负值/十六进制/NaN/Infinity）。

| BaseEnumTest | BaseEnumValueOfTest | 重复内容 |
|-------------|---------------------|---------|
| 001-008 (byte) | 003-008 (byte) | byte 正常/零/负/十六进制/最大/最小/溢出 |
| 009-014 (short) | 009-014 (short) | short 正常/零/十六进制/最大/最小/溢出 |
| 015-022 (int) | 015-022 (int) | int 正常/零/十六进制/十进制/负/最大/最小 |
| 023-028 (long) | 023-029 (long) | long 正常/零/十六进制/负/最大/最小 |
| 029-038 (float) | 030-036 | float 正常/零/负/科学计数/MAX/MIN/NaN/INF |
| 039-048 (double) | 037-043 | double 正常/零/负/科学计数/MAX/MIN/NaN/INF |
| 049-060 (string) | 045-054 | string 正常/中文/空/数字/长串/Unicode/空格/特殊字符 |

### 5.2 BaseEnumTest vs BaseEnumGetNameTest（getName 功能）

| BaseEnumTest | BaseEnumGetNameTest | 重复内容 |
|-------------|---------------------|---------|
| 061-072 (12条) | 001-030 (30条) | getName 的各种场景：正常名/中文/空串/长串/Unicode/空格/特殊字符 |

### 5.3 BaseEnumTest vs BaseEnumToStringTest（toString 功能）

| BaseEnumTest | BaseEnumToStringTest | 重复内容 |
|-------------|---------------------|---------|
| 119-129 (11条) | 001-072 (70条) | toString 的各种类型和场景 |

> **分析:** BaseEnumTest 作为一个"大而全"的测试文件，覆盖了 valueOf、getName、toString 的基本场景。而 BaseEnumValueOfTest、BaseEnumGetNameTest、BaseEnumToStringTest 三个专项文件又各自独立地重复覆盖了相同功能。总计约 **170+ 条跨文件功能重复**，占全部用例的 44%。

---

## 六、编号连续性检查

### 6.1 BaseEnumTest.test.ets
- 用例索引: 001–159，连续无跳跃
- @tc.number: `SUB_COMMONLIBRARY_UTIL_BASEENUM_0010` ~ `_1590`，步进 10，**无缺失**

### 6.2 BaseEnumConstructorTest.test.ets
- 用例索引: 001–050
- **存在跳跃：**

| 缺失索引 | 缺失 @tc.number |
|----------|----------------|
| 024 | `_2400` |
| 037 | `_3700` |
| 046 | `_4600` |
| 047 | `_4700` |

### 6.3 BaseEnumGetNameTest.test.ets
- 用例索引: 001–030，连续无跳跃
- @tc.number: `_0100` ~ `_3000`，步进 100，**无缺失**

### 6.4 BaseEnumToStringTest.test.ets
- 用例索引: 001–072
- **存在跳跃：**

| 缺失索引 | 缺失 @tc.number |
|----------|----------------|
| 064 | `_6400` |
| 067 | `_6700` |

### 6.5 BaseEnumValueOfTest.test.ets
- 用例索引: 001–091
- **存在跳跃：**

| 缺失索引 | 缺失 @tc.number |
|----------|----------------|
| 044 | `_4400` |
| 063 | `_6300` |
| 064 | `_6400` |
| 065 | `_6500` |
| 066 | `_6600` |
| 067 | `_6700` |
| 086 | `_8600` |
| 087 | `_8700` |
| 088 | `_8800` |
| 089 | `_8900` |

---

## 七、其他发现

### 7.1 命名不一致
- `testBaseEnum019` 的 name 为 `"INT_BIN"`（暗示二进制），但 value 是 `10`（十进制），description 也只说 "int value 10"，name 有误导性

### 7.2 已废弃的测试函数导入
- `BaseEnumGetNameTest`、`BaseEnumToStringTest`、`BaseEnumValueOfTest` 三个文件导入了 `afterAll, afterEach, beforeAll` 但实际未使用

### 7.3 testBaseEnumToString025 断言冗余
- 包含 `expect(result === "SMALL_FLOAT").assertFalse()` — 该断言与 `expect(result).assertEqual(...)` 功能重叠（如果 assertEqual 通过了，这个必然为 true），且 SMALL_FLOAT 是 name 而非 value，这类"toString 不应返回 name"的验证在文件中多处重复出现

---

## 八、统计汇总

| 问题类型 | 数量 | 占比 (of 386) |
|----------|------|---------------|
| JDoc 描述与实现不匹配 | 8 | 2.1% |
| 无效用例（无断言） | 10 | 2.6% |
| 同文件内重复 | ~12 对 | — |
| 跨文件功能重复 | ~170+ 条 | ~44% |
| 编号跳跃 | 3 个文件共缺失 16 个编号 | — |

---

## 九、建议

1. **修复 JDoc 不匹配:** 更正 8 处 description 使其准确反映代码实际行为
2. **补充或删除无效用例:** 10 个无断言的用例应补充有意义的断言，或直接删除
3. **消除同文件重复:** 删除 `testBaseEnumToString011`（与 001 完全重复）；合并 BaseEnumTest 中的重复边界值测试
4. **审视跨文件架构:** BaseEnumTest 作为综合测试与三个专项测试文件大量重叠，建议明确分工——BaseEnumTest 仅保留构造函数基础验证，valueOf/getName/toString 的专项测试集中在对应的专项文件中
5. **补全编号跳跃:** 确认缺失的 16 个编号是否为预留（如功能待实现）还是遗漏，如为遗漏应补全
