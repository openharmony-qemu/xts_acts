# 编译失败分析报告

## 文件: FunctionParamReturnTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 | 标注 |
|---|---|---|---|---|---|
| 1 | 57 | 10505001 | — | `expect(noReturn()).assertEqual(undefined)` — void 不能传给 expect() | [ArkTS-COMPILE-LIMIT] |
| 2 | 129 | 10605999 | — | `null as string` | [ArkTS-COMPILE-LIMIT] |

### 新增规则

无。

### 处理方案

将 `noReturn()` 和 `null as string` 相关语句原样移动到 `FunctionParamReturnHelper.ts` 中。
