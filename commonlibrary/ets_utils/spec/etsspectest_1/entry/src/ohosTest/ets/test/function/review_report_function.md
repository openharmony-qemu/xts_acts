# ArkTS 测试用例检视报告 — function 模块

检视日期: 2026-07-23
检视范围: `E:\1.1demo\specDyn\entry\src\ohosTest\ets\test\function\` 下 10 个子目录

---

## 一、高严重度问题

### [高] [编码错误] functionCall/FunctionCallTest.test.ets:176 - 使用了 ArkTS 不支持的 `!` 非空断言运算符
`fn!()` 中的 `!` 非空断言运算符在 ArkTS 中不被支持，会导致编译错误。
```
let threw: boolean = false
try {
  fn!()     // <-- 此处编译错误
} catch (e) {
  threw = true
}
```
**建议改法**: 将提取方法的调用移至 .ts helper 中处理，或使用类型守卫替代非空断言。例如将 `fn!()` 改为在 helper 中包装 try-catch 并返回 boolean。

---

### [高] [@tc.number 重复] functionCall/FunctionCallTest.test.ets:163,190 - 两个用例使用相同的 `SUB_FUNCTION_CALL_0900`
- 第 163 行: `testExtractMethodThis0001` 标注 `@tc.number SUB_FUNCTION_CALL_0900`
- 第 190 行: `testTaggedTemplate0001` 也标注 `@tc.number SUB_FUNCTION_CALL_0900`

**建议改法**: `testTaggedTemplate0001` 应改为 `SUB_FUNCTION_CALL_1000`，与下方的 `@tc.desc Verify spread call expands array as arguments` 对应。同时将孤立 JSDoc 中的 1000 替换。

---

### [高] [JSDoc 孤立] functionCall/FunctionCallTest.test.ets:183-188 - `SUB_FUNCTION_CALL_1000` 无对应测试用例
存在一个 JSDoc 注释块标注了 `@tc.number SUB_FUNCTION_CALL_1000` 和 `@tc.desc Verify spread call expands array as arguments`，但没有 `@tc.name`、也没有关联的 `it()` 测试块。紧随其后的是另一个 `@tc.number SUB_FUNCTION_CALL_0900` 的注释块。

```
/**
 * @tc.number    SUB_FUNCTION_CALL_1000
 * @tc.desc      Verify spread call expands array as arguments (§13.3.6.2)
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
/**                                                    <-- 紧接着另一个 JSDoc
 * @tc.number    SUB_FUNCTION_CALL_0900
 * @tc.name      testTaggedTemplate0001
```

**建议改法**: 
1. 补写 `testSpreadCall0001` 用例实现 spread 调用测试
2. 或将此 JSDoc 块移除（如果 spread call 在 ArkTS 中不支持）

---

### [高] [类型可用性] functionCall/FunctionCallTest.test.ets:50 - `TemplateStringsArray` 类型在 ArkTS 中可能不可用
```typescript
function tag(strings: TemplateStringsArray, ...values: number[]): string {
```
`TemplateStringsArray` 是 TypeScript 内置类型，如果 ArkTS 运行环境不包含此类型定义，会导致编译错误。

**建议改法**: 确认 ArkTS 是否支持此类型。如不支持，将 `tag` 函数移到 .ts helper 中，或使用 `string[]` 替代。

---

## 二、中严重度问题

### [中] [tc.number 跳号] functionExpression/FunctionExpressionTest.test.ets - 缺少 `SUB_FUNCTION_EXPRESSION_0200`
编号序列为: `0100` → `0300` → `0400` → `0500` → `0600` → `0700` → `0800` → `0900` → `1000`，缺少 `0200`。

**建议改法**: 补充编号为 `0200` 的用例，或将后续编号前移保持连续。

---

### [中] [tc.number 顺序颠倒] returnType/ReturnTypeTest.test.ets:135,147 - `0800` 出现在 `0700` 之前
- 第 135 行: `@tc.number SUB_FUNCTION_RETURN_0800` (testReturnASI0001)
- 第 147 行: `@tc.number SUB_FUNCTION_RETURN_0700` (testGeneratorReturn0001)

编号顺序应为 0100→0200→0300→0400→0500→0600→**0700→0800**，但实际为 0600→**0800→0700**。

**建议改法**: 交换两个注释块/用例的顺序，使 0700 在 0800 之前。

---

### [中] [缺少负向用例] 多个文件 - 大部分测试文件仅覆盖正向场景
以下文件缺少异常/边界/负向测试用例：
- `ArrowFunctionTest.test.ets` — 8 个用例全部为正向下，缺少 `new` 调用箭头函数会抛错、箭头函数不能用作构造函数等负向场景
- `FunctionDeclarationTest.test.ets` — 4 个用例全部为正向下，缺少递归栈溢出、无效参数等场景
- `FunctionTypeTest.test.ets` — 缺少类型不匹配、参数个数不匹配等负向场景
- `RestParameterTest.test.ets` — 缺少非数组参数传入 rest 的场景

**建议改法**: 按 ECMA 规范补充每个特性的异常路径测试。

---

### [中] [@tc.desc 与用例不完全相符] functionScope/FunctionScopeTest.test.ets:117-119
`testParameterShadowing0001` 的 `@tc.desc` 为 "Verify parameter shadows outer variable with same name"，但测试代码仅验证了 `getParamValue(5)` 返回 `5`，没有验证参数名 `x` 与外部变量 `x` 的 shadowing 关系。

```typescript
let x: number = 99
expect(getParamValue(5)).assertEqual(5)
```
这测试的是参数传递而非 shadowing。

**建议改法**: 修正 `@tc.desc` 描述为 "Verify function parameter is accessible and returns passed value"，或增加真正验证 shadowing 的代码。

---

### [中] [缺少边界值测试] optionalParameter/OptionalParameterTest.test.ets - 缺少以下场景
- 多个可选参数的部分省略组合
- 默认参数值为函数调用的副作用顺序
- 默认参数中抛出异常
- 默认参数引用后续参数（应报错，但规范中有定义）

**建议改法**: 补充上述边界场景。

---

## 三、低严重度问题

### [低] [@tc.desc 不准确] functionDeclaration/FunctionDeclarationTest.test.ets:62-65
`testHoistedCall0001` 的 `@tc.desc` 为 "Verify function declaration is hoisted and callable before definition (§15.2.6)"，但 `makeAdder` 函数定义在行 28-30，实际位于测试代码之前。该测试未真正验证 hoisting（函数在定义之前被调用）。

要测试 hoisting，需要在 `makeAdder` 定义之前的位置调用它。

**建议改法**: 修正 `@tc.desc` 描述，反映实际测试内容（函数声明模块级可调用性），或在同一作用域内将调用置于声明之前以真正验证 hoisting。

---

### [低] [命名/设计] returnType/ReturnTypeTest.test.ets:154 - Generator 测试不属于返回值测试范畴
`testGeneratorReturn0001` 测试 `function*` generator 的 yield/return 行为，但 generator 的返回语义与普通函数不同。此测试更符合 "Iterators and Generators" 模块。且 ArkTS 不支持 generator 函数（通过 .ts helper 绕过）。

**建议改法**: 将此用例移入独立的 Generator 测试模块，或确保 ReturnType 模块只测试普通函数的返回类型。

---

### [低] [缺乏 copyright header] 多个 .ts helper 文件缺少标准 Apache 版权头
以下文件仅有简单注释，缺少标准 Apache 2.0 版权声明 Header：
- `arrowFunctionTsHelper.ts`
- `functionCallTsHelper.ts`
- `functionExpressionTsHelper.ts`
- `functionScopeTsHelper.ts`
- `functionTypeTsHelper.ts`
- `optionalParameterTsHelper.ts`
- `restParameterTsHelper.ts`
- `returnTypeTsHelper.ts`

**建议改法**: 在所有 .ts helper 文件中补充与 .ets 文件相同的 Apache 2.0 版权头。

---

### [低] [缺少断言类型多样性] 多个用例仅使用 `assertEqual`
大部分用例仅使用 `assertEqual` 进行断言，缺少 `assertTrue`、`assertFalse`、`assertNull`、`assertUndefined`、`assertThrowError` 等更具语义化的断言方法，降低测试可读性。

例如：
- `ClosureTest.test.ets:71`: `expect(fn()).assertEqual(10)` → 可用 `expect(fn()).assertTrue()`
- `ReturnTypeTest.test.ets:143`: `expect(returnASI()).assertEqual(undefined)` → 可用 `expect(returnASI()).assertUndefined()`

**建议改法**: 根据语义选用更合适的断言方法。

---

## 四、总结

| 类别 | 高 | 中 | 低 | 合计 |
|------|----|----|----|------|
| 编码错误（非空断言、类型不可用） | 2 | - | - | 2 |
| @tc.number 重复/跳号/顺序错误 | 2 | 2 | - | 4 |
| JSDoc 孤立无对应用例 | 1 | - | - | 1 |
| @tc.desc 描述不准确 | - | 1 | 1 | 2 |
| 缺少负向/边界用例 | - | 2 | - | 2 |
| 缺乏版权头 | - | - | 1 | 1 |
| 断言风格/命名设计 | - | - | 2 | 2 |
| **合计** | **5** | **5** | **4** | **14** |

### 最需优先处理
1. **FunctionCallTest.test.ets** — 3 个高严重度问题（非空断言、@tc.number 重复、孤立 JSDoc）
2. **FunctionExpressionTest** — @tc.number 跳号
3. **ReturnTypeTest** — @tc.number 顺序颠倒
4. **所有 .ts helper** — 补充版权头
