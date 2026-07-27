# 编译失败分析报告

## 文件: RestParameterTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 44 | 10605092 | arkts-no-nested-funcs | `function f(...)` 嵌套在 `restLength` 内 |
| 2 | 49 | 10605092 | arkts-no-nested-funcs | `function sum(...)` 嵌套在 `sumArrayViaApply` 内 |
| 3 | 56 | 10605152 | arkts-no-func-apply-call | `sum.apply(null, numbers)` — `.apply()` 不被支持 |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-func-apply-call` | `Function.apply` 和 `Function.call` 方法不被支持 |

### 处理方案

将 `restLength`、`sumArrayViaApply` 原样移动到 `restParameterTsHelper.ts` 中。
