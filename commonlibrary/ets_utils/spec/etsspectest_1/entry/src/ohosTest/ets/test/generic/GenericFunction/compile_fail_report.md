# 编译失败分析报告

## 成员: M02 — Generic Function

---

## 编译环境

| 项目 | 信息 |
|---|---|
| 工具链版本 | ArkTS 1.1 / DevEco Studio 6.1.1 |
| 编译命令 | hvigorw assembleHap |
| 编译日期 | 2026-07-23 |

---

## 错误汇总

| # | 文件 | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|---|
| 1 | `generic_return_only_inference_fail_compile.ets` | 41 | — | arkts-no-any-unknown | `const value = onlyReturn()`（T 推断为 any/unknown） |
| 2 | `generic_return_only_inference_fail_compile.ets` | 41 | — | arkts-no-inferred-generic-params | `const value = onlyReturn()`（泛型调用类型推断受限） |
| 3 | `GenericFunctionTest.test.ets` | 269 | 10505001 | unintentional-comparison-no-overlap | `fNum === fStr`（类型无重叠） |

> #1/#2 为 fail_compile 用例 GF-010 的预期诊断，编译失败符合预期。
> #3 为 runtime 用例 GF-012 暴露的编译期差异，已在主测试文件中修正（见根因分析 #3）。

---

## 根因分析

### GF-010: 仅返回位置 T 禁止无依据推断

**核心问题**: 泛型函数 `onlyReturn<T>(): T` 的类型参数 T 只出现在返回类型中，没有值参数提供推断来源。调用 `onlyReturn()` 不提供显式类型实参时，ArkTS 无法推断 T，将其解析为 `any`/`unknown`，触发两条诊断：
- `arkts-no-any-unknown`（禁止隐式 any/unknown）
- `arkts-no-inferred-generic-params`（泛型调用类型推断受限）

诊断与预期"无法推断类型实参"一致，fail_compile 成立。

### GF-011: 泛型箭头函数（已验证通过，改判 boundary）

**核心问题**: 原 GTP-GF-011 标注为 `boundary/fail_compile`，预期 ArkTS 禁止泛型箭头 `<T>(x: T): T => x`（与 `arkts-no-func-expressions` 一致）。

**实际编译结果**: `generic_arrow_function_fail_compile.ets` 在 ArkTS 1.1 / DevEco 6.1.1 下**编译无报错**——ArkTS 1.1 实际**支持**泛型箭头函数。

**结论**: 按 Q3 规则，GF-011 由 `fail_compile` 改判为 `boundary（已验证通过）`，不自行修改 GTP 设计 ID 分类。原 fail_compile 文件已删除，主测试文件 `testgeneric0012` 调用 .ets 内的 `arrowIdentity<number>(42)` 覆盖该行为。

### GF-012: 不同函数类型实例化的 `===` 比较（10505001）

**核心问题**: GF-012 验证"不同类型实参的实例化在运行时共享同一函数（泛型擦除）"。原写法：
```typescript
const fNum: (x: number) => number = myIdentity
const fStr: (x: string) => string = myIdentity
expect(fNum === fStr).assertEqual(true)   // ← 10505001
```
ArkTS 编译期判定 `(x: number) => number` 与 `(x: string) => string` **无类型重叠**，直接 `===` 比较被拒（错误码 10505001, unintentional comparison because the types have no overlap）。这是 TypeScript 的标准行为（TS 同样会对此报错），但导致 runtime 用例无法编译。

**差异**: 该比较在编译期被静态类型系统拦截，无法直接表达"运行时同一函数引用"的擦除语义。

**修正**: 主测试文件新增辅助函数 `sameRef(a: Object, b: Object): boolean { return a === b }`，用 `Object` 参数接收任意类型值，将比较推迟到函数内部运行时执行，绕过编译期重叠检查。两个 GF-012 it 块均改用 `sameRef` 中转：
```typescript
expect(sameRef(fNum, fStr)).assertEqual(true)
expect(sameRef(b1.constructor, b2.constructor)).assertEqual(true)
```
此修正仅改变比较的表达方式，不改变验证的运行时语义（仍验证擦除后同一引用/构造器）。

---

## 处理方案

- **GF-010**: `const value = onlyReturn()` 真实存在于 `generic_return_only_inference_fail_compile.ets` 可执行区域（非注释），编译失败且诊断符合预期。
- **GF-011**: fail_compile 不成立（ArkTS 1.1 支持泛型箭头），删除 `generic_arrow_function_fail_compile.ets`，GF-011 转为 boundary，由主文件 `testgeneric0012` 覆盖。
- **GF-012**: 主文件 `===` 直比改为 `sameRef(Object)` 中转，使主测试文件可编译，运行时仍验证擦除身份。10505001 差异记入 `known_issues.md`。

