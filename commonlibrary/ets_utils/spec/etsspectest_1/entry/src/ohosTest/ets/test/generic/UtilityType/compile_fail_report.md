# 编译失败分析报告

## 成员: M10 — Utility / Advanced Types

> 本报告只记录 3 个负向用例：UT-008、UT-009、UT-010。主测试入口不承载 fail_compile 用例，负向代码保留在独立 `.ets` 文件中。

---

## 错误汇总

| # | 负向用例 | 文件 | 行号 | 规则 | 涉及语句 | 结论 |
|---|---|---|---|---|---|---|
| 1 | UT-008 Pick / Omit | `fail_compile/GenericUtilityTypeTest_pick_omit_fail_compile.ets` | 19、23 | arkts-no-utility-types | `Pick<UtilityProfile, 'id' \| 'name'>`、`Omit<UtilityProfile, 'enabled'>` | ArkTS 不支持该类 utility types，预期编译失败 |
| 2 | UT-009 conditional / mapped / infer | `fail_compile/GenericUtilityTypeTest_conditional_mapped_infer_fail_compile.ets` | 17、18、19 | arkts-no-conditional-types、arkts-no-mapped-types、arkts-no-aliases-by-index | `T extends string ? string : number`、`{ [P in keyof T]: T[P] }`、`T extends Array<infer Item> ? Item : never` | ArkTS 不支持条件类型、映射类型及 infer 相关写法，预期编译失败 |
| 3 | UT-010 indexed access / typeof type query | `fail_compile/GenericUtilityTypeTest_keyof_indexed_access_fail_compile.ets` | 18、19 | arkts-no-aliases-by-index、arkts-no-type-query | `UtilityBox<number>['value']`、`typeof typeQuerySource` | ArkTS 不支持索引访问类型和类型位置的 typeof 查询，预期编译失败 |

---

## 根因分析

### UT-008: Pick / Omit

TypeScript 支持通过 `Pick<T, K>` 从对象类型中选取指定属性，也支持通过 `Omit<T, K>` 排除指定属性。ArkTS 当前对这类 utility types 支持受限，编译时会触发 `arkts-no-utility-types`。因此该用例不能放入正常可运行的主测试中，需要作为负向编译用例单独保存。

### UT-009: conditional / mapped / infer

TypeScript 支持条件类型、映射类型以及 `infer` 推断类型，例如 `T extends U ? X : Y`、`{ [P in keyof T]: T[P] }` 和 `T extends Array<infer Item> ? Item : never`。ArkTS 对这些高级类型能力不支持，编译时会分别触发 `arkts-no-conditional-types`、`arkts-no-mapped-types` 和 `arkts-no-aliases-by-index`。该用例用于证明 ArkTS 与 TypeScript 在高级类型系统能力上的差异。

### UT-010: indexed access / typeof type query

TypeScript 支持索引访问类型和类型位置的 `typeof` 查询，例如 `UtilityBox<number>['value']` 和 `typeof typeQuerySource`。ArkTS 中索引访问类型会触发 `arkts-no-aliases-by-index`，类型位置的 `typeof` 会触发 `arkts-no-type-query`。因此该用例只作为负向编译证据保留，不进入主测试入口。

---

## 处理方案

- 3 个负向用例分别保留在独立的 fail_compile 文件中。
- 非法语句保留为真实代码，不写在注释中，确保能够稳定触发 ArkTSCheck 诊断。
- `GenericUtilityTypeTest.test.ets` 只保留可运行测试，不直接包含 UT-008、UT-009、UT-010 的非法写法。
- 如需验证 TypeScript 原始语义，通过 TS helper 或 TypeScript Playground 记录对照结果，不改变 fail_compile 文件职责。

---

## 编译环境

| 项目 | 信息 |
|---|---|
| IDE | DevEco Studio 1.1 |
| 编译方式 | ArkTSCheck / Problems 面板 |
| 编译日期 | 2026-07-23 |
| 负向用例数量 | 3 |
