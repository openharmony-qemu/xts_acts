# 编译失败分析报告

## 文件: ReturnTypeTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 47 | 10605092 | arkts-no-nested-funcs | `function f(): number { throw ... }` 嵌套在 `throwAndCatch` 内 |
| 2 | 75 | 10505001 | 类型错误 | `expect(noReturn())` — `void` 不能赋值给 `Object` |

### 根因分析

1. `throwAndCatch` 内部包含嵌套函数声明 `function f()`，ArkTS 禁止嵌套函数。
2. `noReturn()` 返回值类型为 `void`，ArkTS 不允许 `void` 类型传参给 `expect()` 的 `Object` 参数。

### 处理方案

将 `noReturnResult`、`throwAndCatch` 原样移动到 `returnTypeTsHelper.ts` 中。

### .ts 辅助文件仍有错误

`returnTypeTsHelper.ts` 中 `noReturnResult` 函数报错:
- **错误**: `Type 'void' is not assignable to type 'undefined'`
- **原因**: TypeScript strict 模式下 `void` 不可赋值给 `undefined`
- **处理**: 已记录到 `issues/known_issues.md`，代码保留原样
