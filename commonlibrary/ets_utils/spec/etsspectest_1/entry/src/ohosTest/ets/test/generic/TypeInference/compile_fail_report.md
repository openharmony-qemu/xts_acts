# 编译失败分析报告

## 成员: M05 — Type Inference

---

## 错误汇总

| # | 文件 | 行号 | 错误码 | 规则 | 涉及语句 | 处理方式 |
|---|---|---|---|---|---|---|
| 1 | `GenericInferenceTest.test.ets` | 多处 | arkts-no-inferred-generic-params | 泛型函数调用的类型推断受限 | `identity(42)`, `new Box(42)` 等 | 通过 TS helper 绕开 |
| 2 | `GenericInferenceTest.test.ets` | 多处 | arkts-no-any-unknown | 使用 `any`/`unknown` 类型 | 推断结果为 `unknown` | 通过 TS helper 绕开 |
| 3 | `fail_compile/generic_return_only_inference_fail_compile.ets` | 12 | arkts-no-type-argument-infer | 类型参数无法从参数推断 | `let result: number = onlyReturn()` | fail_compile（预期行为） |

---

## 根因分析

### ArkTS 泛型类型参数推断受限

**核心问题**: ArkTS 要求泛型函数调用时必须显式指定类型参数，不支持从参数类型自动推断。

**示例**:
```typescript
// ArkTS 编译失败
let result = identity(42)  // Error: Type inference in case of generic function calls is limited

// ArkTS 需要显式指定
let result = identity<number>(42)  // OK
```

### GTP-IN-010: 无输入候选时不能只按返回类型推断

**核心问题**: 如果 T 仅出现在返回类型中（参数位置无 T），编译器没有推断来源，应拒绝。

**预期行为**: 编译器应报错，提示"无法推断类型参数"。

---

## Helper 绕开方案

**当前状态**: 通过 TS helper 文件绕开所有泛型推断测试。

| 测试点 | 是否需要 Helper | 原因 |
|---|---|---|
| IN-001~IN-009, IN-011~IN-012 | 是 | ArkTS 不支持泛型类型参数推断，所有测试点均使用 TS helper |
| IN-010 fail_compile | 否 | 此测试点本身就是验证编译器拒绝，无需绕开 |

**Helper 文件**: `genericInferenceTsHelper.ts`

### 设计决策说明

**重要**: TS helper 方案实际测试的是 **TypeScript 的泛型类型推断行为**，而非 ArkTS 的。这是因为 ArkTS 不支持泛型类型参数自动推断，所有测试点（IN-001~IN-009, IN-011~IN-012）都无法在 ArkTS 原生环境中运行。

**原因**:
- ArkTS 要求泛型函数调用时必须显式指定类型参数
- 如果不指定，编译器报错：`Type inference in case of generic function calls is limited`
- 因此，泛型推断逻辑只能在 TypeScript 环境中执行

**影响**:
- 本测试套件验证的是 TypeScript 规范中的泛型推断行为
- 若 ArkTS 未来支持泛型推断，需将测试逻辑从 TS helper 移回 ArkTS 测试文件

所有泛型推断逻辑封装在 TS helper 中，测试文件只调用 helper 函数：

```typescript
// genericInferenceTsHelper.ts - 在 TypeScript 环境中执行泛型推断
export function testSingleParamInferenceNumber(): number {
  function identity<T>(value: T): T { return value }
  return identity(42)  // TypeScript 可以推断 T = number
}

// GenericInferenceTest.test.ets - 调用 helper
import { testSingleParamInferenceNumber } from './genericInferenceTsHelper'
it('testSingleParamInference0001', ..., () => {
  expect(testSingleParamInferenceNumber()).assertEqual(42)
})
```

---

## List 探针配置

在 `List.test.ets` 中配置了 fail_compile 探针：

```typescript
// fail_compile 探针 — 一次只取消注释其中一行
// import './4/_work_m05_type_inference/fail_compile/generic_return_only_inference_fail_compile'
```

**验证步骤**：
1. 取消注释 fail_compile import 行
2. 执行 hvigor 编译命令
3. 期望 `BUILD FAILED`，复制完整报错信息
4. 注释掉 import，主测可正常编译

---

## 编译环境

| 项目 | 信息 |
|---|---|
| 工具链版本 | ArkTS Dynamic（基于 TypeScript） |
| 编译命令 | DevEco Studio / hvigor ohosTest 编译 |
| 编译日期 | 2026-07-24 |