# 编译失败分析报告

## 文件: FunctionCallTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及代码 |
|---|---|---|---|---|
| 1 | 33 | 10605038 | arkts-no-untyped-obj-literals | `{ value: 10, getValue: ... }` |
| 2 | 35 | 10605046 | arkts-no-func-expressions | `function(): number { return this.value }` |
| 3 | 35 | 10605093 | arkts-no-standalone-this | `this.value` 在独立函数中 |
| 4-7 | 41-45 | 多个 | testCallChangeThis | 对象字面量 + this + 嵌套函数 + any + .call() |
| 8-10 | 49-52 | 多个 | testApplyPassArgs | 嵌套函数 + .apply() |
| 11-15 | 56-60 | 多个 | testBindFixedThis | 对象字面量 + this + 嵌套函数 + any + .bind() |
| 16-17 | 65-68 | 多个 | testBindPartialArgs | 嵌套函数 + any |

### 处理方案

将 5 个函数原样移动到 `functionCallTsHelper.ts` 中：
- `testMethodCallThis`
- `testCallChangeThis`
- `testApplyPassArgs`
- `testBindFixedThis`
- `testBindPartialArgs`
