# 编译失败分析报告

## 文件: FunctionTypeTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 41 | 10605046 | arkts-no-func-expressions | `function(x: number): number { return x * factor }` 作为返回值 |
| 2 | 108 | 10605046 | arkts-no-func-expressions | `function(): number { return 1 }` 赋值给变量 |
| 3 | 110 | 10605046 | arkts-no-func-expressions | `function(): number { return 2 }` 重新赋值 |
| 4 | 140 | 10605046 | arkts-no-func-expressions | `function(x: number): number { return x + 1 }` 嵌套 callback |
| 5 | 141 | 10605046 | arkts-no-func-expressions | `function(x: number): number { return x * 2 }` 嵌套 callback |

### 处理方案

将 `makeMultiplier`、`testReassignFirst`、`testReassignSecond`、`nestedAdd1`、`nestedDouble` 原样移动到 `functionTypeTsHelper.ts` 中。
