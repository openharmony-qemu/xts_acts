# 编译失败分析报告

## 文件: GenericInheritanceTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | — | — | 泛型接口多继承冲突 | `interface CombinedInterface<T> extends InterfaceA<T>, InterfaceB<T>` |
| 2 | — | — | 跨模块泛型继承限制 | `.ets` 文件间直接 `export`/`import` 泛型类并继承 |

### 根因分析

**核心问题 1**: GTP-IH-006 测试点验证泛型接口多继承时的冲突诊断能力。当两个父接口定义同名成员但类型不一致时（`InterfaceA<T>` 的 `value` 类型为 `T`，`InterfaceB<T>` 的 `value` 类型为 `string`），编译器应报告冲突错误。

**核心问题 2**: GTP-IH-009 测试点要求"跨模块 export/import 泛型类并继承"。当前已改用标准 .ets 跨文件 extends 模式（`crossModuleBase.ets` → test file `extends`），若编译通过则说明当前版本已支持。保留此条目以待确认。

**涉及的规则**:

1. **泛型接口多继承冲突**: ArkTS 和 TypeScript 均要求接口继承时同名成员类型必须兼容。当 `CombinedInterface<T>` 同时继承 `InterfaceA<T>` 和 `InterfaceB<T>` 时，`value` 成员类型（`T` vs `string`）无法统一，导致编译失败。

2. **跨模块泛型继承限制**: 已改用标准 `.ets` 跨文件 extends（`crossModuleBase.ets`），若编译通过则当前版本已解除此限制；若仍报错则退回 JS helper 方案。

### 处理方案

将泛型接口多继承冲突的代码移动到 `fail_compile/ih006_conflicting_types_fail.ets` 中，通过编译失败验证负向场景。跨模块继承改用标准 `.ets` 跨文件 extends（`crossModuleBase.ets`），若编译报错则退回 JS helper 方案。

| 原始测试点 | 说明 | 处理方式 |
|---|---|---|---|
| IH-006 多继承冲突诊断 | 验证编译器能检测到同名成员类型冲突 | 移动到 `fail_compile/` 目录 |
| IH-009 跨模块泛型继承 | 验证跨模块 export/import 泛型类并继承 | 改用标准 .ets 跨文件 extends（`crossModuleBase.ets`），待编译确认 |
| IH-016 无 out 标记的泛型赋值协变 | `GenericBase<Cat>` 赋给 `GenericBase<Animal>`，T 未标记 `out`，按 spec 应 invariant 拒绝；但 SDK 26 接受 | 从正向套件移除，登记为 spec/编译器偏差（待确认 SDK 对应规范版本） |