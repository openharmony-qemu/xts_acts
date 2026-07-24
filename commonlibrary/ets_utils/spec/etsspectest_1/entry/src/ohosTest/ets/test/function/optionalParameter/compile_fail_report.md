# 编译失败分析报告

## 文件: OptionalParameterTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 133 | 10605999 | 类型错误 | `nullNoTrigger(null)` — `null` 不能赋值给 `number` |
| 2 | 28 | 10605008 | arkts-no-any-unknown | `getOptional(...): any` — 不允许 `any` 类型 |
| 3 | 117 | 10605092 | arkts-no-nested-funcs | `function f(...)` 嵌套在 `it()` 内 |
| 4 | 117 | 10605071 | arkts-no-comma-outside-loops | `(order.push(1), 10)` 逗号运算符 |
| 5 | 117 | 10605071 | arkts-no-comma-outside-loops | `(order.push(2), 20)` 逗号运算符 |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-any-unknown` | 不能使用 `any` / `unknown` 类型，必须用具体类型 |
| `arkts-no-comma-outside-loops` | 逗号运算符 `(a, b)` 只在 for 循环中可用 |

### 处理方案

将 `getOptional`、`nullNoTrigger`、`testDefaultEvalOrder` 原样移动到 `optionalParameterTsHelper.ts` 中。
