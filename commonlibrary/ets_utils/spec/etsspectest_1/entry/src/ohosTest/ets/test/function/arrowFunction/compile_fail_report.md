# 编译失败分析报告

## 文件: ArrowFunctionTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 49 | 10605090 | arkts-no-implicit-return-types | 箭头函数缺返回类型 |
| 2 | 50 | 10605029 | arkts-no-props-by-index | `arguments[0]` 索引访问不被支持 |
| 3 | 50 | 10605029 | arkts-no-props-by-index | `arguments[1]` 索引访问不被支持 |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-implicit-return-types` | 函数需要显式返回类型标注 |
| `arkts-no-props-by-index` | 不支持 `arguments[0]` 这类索引访问 |

### 处理方案

将 `captureArgs` 原样移动到 `arrowFunctionTsHelper.ts` 中。
