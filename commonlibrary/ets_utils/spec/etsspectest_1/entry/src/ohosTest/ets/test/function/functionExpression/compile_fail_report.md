# 编译失败分析报告

## 文件: FunctionExpressionTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 33 | 10605046 | arkts-no-func-expressions | `function(a, b) { ... }` |
| 2 | 42 | 10605046 | arkts-no-func-expressions | `function() { return 1 }` |
| 3 | 50 | 10605046 | arkts-no-func-expressions | `function() {}` 赋值给变量 |
| 4 | 53 | 10605046 | arkts-no-func-expressions | `function fact() {}` 具名函数表达式 |
| 5 | 58 | 10605046 | arkts-no-func-expressions | `function factorial(n) { ... }` 递归 |
| 6 | 65 | 10605038 | arkts-no-untyped-obj-literals | `{ multiply: ... }` 对象字面量 |
| 7 | 66 | 10605046 | arkts-no-func-expressions | `function(a, b) { ... }` 作为属性值 |
| 8 | 80 | 10605046 | arkts-no-func-expressions | IIFE `(function() { ... })()` |
| 9 | 90 | 10605046 | arkts-no-func-expressions | `function(x = thrower()) { ... }` |
| 10 | 102 | 10605038 | arkts-no-untyped-obj-literals | `{ value: 42, getValue: ... }` 对象字面量 |
| 11 | 104 | 10605046 | arkts-no-func-expressions | `function() { return this.value }` |
| 12 | 104 | 10605093 | arkts-no-standalone-this | `this.value` 在独立函数中 |

### 根因分析

**核心问题**: ArkTS 编译器禁止函数表达式（`arkts-no-func-expressions`），而本章所有 10 个测试用例的核心测试对象就是函数表达式。函数表达式被禁用意味着本章几乎全部正向用例在 `.ets` 中无法编译。

**涉及的三条规则**:

1. **arkts-no-func-expressions**（12 处错误）: ArkTS 强制使用箭头函数替代 `function` 关键字表达式。但 ECMA-262 §15.2.3 定义的 FunctionExpression 语义（包括具名函数表达式的内部名称绑定、IIFE、this 动态绑定等）与箭头函数语义完全不同，无法用箭头函数替代。

2. **arkts-no-untyped-obj-literals**（2 处错误）: ArkTS 要求对象字面量必须对应显式声明的 class 或 interface。但 ECMA-262 允许纯运行时对象字面量。

3. **arkts-no-standalone-this**（1 处错误）: ArkTS 禁止在独立函数（非方法）中使用 `this`。但 ECMA-262 允许函数表达式的 `this` 由调用方式动态决定。

### 处理方案

将所有包含函数表达式的代码**原样**移动到 `functionExpressionTsHelper.ts` 中，`.ets` 文件通过 import 调用。

| 原始函数 | 说明 |
|---|---|
| `testExpressionAssign` | 函数表达式赋值后调用 |
| `testExpressionNoHoisting` | 函数表达式不提升 |
| `anonymousFunc` | 匿名函数 name 推断 |
| `testNamedInternalBindingName` | 具名函数表达式内部名称绑定 |
| `testNamedRecursive` | 具名函数递归 |
| `calculator` | 对象属性函数表达式 |
| `testIIFEResult` | IIFE |
| `testEvalThrow` | 函数表达式参数抛异常 |
| `objWithThis` | 函数表达式 this 绑定 |
