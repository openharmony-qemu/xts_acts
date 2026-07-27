# 编译失败分析报告

## 文件: ModuleSyntaxTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 原始代码 |
|---|---|---|---|---|---|
| 1 | 274 | 10605144 | arkts-limited-stdlib | `Object.keys(ns)` |
| 2 | 286 | 10605144 | arkts-limited-stdlib | `Object.isFrozen(ns)` |
| 3 | 312 | 10605066 | arkts-no-in | `'CONST_VAL' in ns` |
| 4 | 313 | 10605066 | arkts-no-in | `'xxx' in ns` |
| 5 | 325 | 10605002 | arkts-no-symbol | `ns[Symbol.toStringTag]` |
| 6 | 337 | 10605144 | arkts-limited-stdlib | `Object.getOwnPropertyDescriptor(ns, 'CONST_VAL')` |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-limited-stdlib` | 部分标准库 API 被限制（`Object.keys`, `Object.isFrozen`, `Object.getOwnPropertyDescriptor`） |
| `arkts-no-in` | `in` 运算符不被支持 |
| `arkts-no-symbol` | `Symbol()` API 不被支持 |

### 处理方案

将 3 个 namespace 属性测试的检测逻辑移动到 `nsPropertyHelper.js` 中，.ets 只做断言调用。

### 无法测试的场景

`import * as ns` 传参到 `.js` helper 后丢失 Module Namespace 身份，`Object.isFrozen`、`Object.getOwnPropertyDescriptor` 等结果不准确。详见 `known_issues.md`。
