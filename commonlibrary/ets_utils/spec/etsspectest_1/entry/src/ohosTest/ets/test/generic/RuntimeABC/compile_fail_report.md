# 编译失败分析报告

## 文件: GenericRuntimeTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 174 | ArkTSCheck | — | `'Store' only refers to a type, but is being used as a value here.` |
| 2 | 241 | ArkTSCheck | arkts-limited-stdlib | `Usage of standard library is restricted` — `Object.getPrototypeOf` |
| 3 | — | ArkTSCheck | — | `Importing ArkTS files to JS and TS files is not allowed.` — .ts 文件导入 .ets 文件 |

### 根因分析

**核心问题**: Runtime/ABC 测试涉及的运行时特性在 ArkTS 中受到三类编译限制，导致部分测试无法在 `.ets` 文件中直接实现。

**涉及的规则**:

1.**标准库限制 (arkts-limited-stdlib)**: `Object.getPrototypeOf` 等标准库 API 在 ArkTS 中被限制使用，不可直接调用。

2.**跨语言导入限制**: ArkTS 禁止 `.ts`/`.js` 文件导入 `.ets` 文件，导致 TS/JS helper 无法复用 `.ets` 中定义的类型。

### 处理方案

将 ArkTS 限制的运行时检查代码移动到 `genericRuntimeJsHelper.js` 中，`.ets` 文件通过 import 调用。

| 原始代码 | 说明 | 状态 |
|---|---|---|---|
| `Store as Object` | 接口作为值使用 → 改用实现类 `AnimalShelter` 验证原型链 | **已删除**：黑盒 .ets 测试无法验证 interface 运行时擦除；需 ABC 符号表检查 |
| `Object.getPrototypeOf()` | 标准库限制 → 移至 `comparePrototype()` 函数 | 保留 |
### 编译环境

| 项目 | 信息 |
|---|---|
| 工具链版本 | ArkTS Dynamic（基于 TypeScript） |
| 编译日期 | 2026-07-23 |
