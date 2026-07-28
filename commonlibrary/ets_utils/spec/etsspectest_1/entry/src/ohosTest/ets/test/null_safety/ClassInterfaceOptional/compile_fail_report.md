# 编译失败分析报告

## 文件: ClassInterfaceOptionalTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 96 | 10505001 | — | `Object.hasOwn(c, 'optional')` — 编译器 lib 版本低于 ES2022 |

### 新增规则

无。

### 处理方案

将 `Object.hasOwn` 调用原样移动到 `ClassInterfaceOptionalHelper.js` 中。
