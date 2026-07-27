# 编译失败分析报告

## 文件: FunctionScopeTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 35 | 10605092 | arkts-no-nested-funcs | `function inner(): number { return a + 3 }` 嵌套在 `getNestedValue` 内 |

### 根因分析

**ArkTS 规则 `arkts-no-nested-funcs`**: 禁止在函数内部使用 `function` 关键字声明嵌套函数。在标准 ECMAScript 中，嵌套函数声明是合法的（§15.2.6），且会在每次外层函数调用时创建新的函数对象。

### 处理方案

将包含嵌套函数声明的 `getNestedValue` 原样移动到 `functionScopeTsHelper.ts` 中。
