# 编译失败分析报告

## 文件: CrossFeatureTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 | 标注 |
|---|---|---|---|---|---|
| 1 | 60 | 10605999 / 10505001 | — | `null + 1` | [ArkTS-COMPILE-LIMIT] |
| 2 | 61 | 10605999 / 10505001 | — | `1 + null` | [ArkTS-COMPILE-LIMIT] |
| 3 | 86 | 10605040 | arkts-no-obj-literals-as-types | `{ user: { name: string } }` | [ArkTS-COMPILE-LIMIT] |
| 4 | 86 | 10605040 | arkts-no-obj-literals-as-types | `{ name: string }` | [ArkTS-COMPILE-LIMIT] |
| 5 | 86 | 10605038 | arkts-no-untyped-obj-literals | `{ user: { name: 'Alice' } }` | [ArkTS-COMPILE-LIMIT] |
| 6 | 86 | 10605038 | arkts-no-untyped-obj-literals | `{ name: 'Alice' }` | [ArkTS-COMPILE-LIMIT] |
| 7 | 89 | 10605040 | arkts-no-obj-literals-as-types | `{ user: { name: string } }` | [ArkTS-COMPILE-LIMIT] |
| 8 | 89 | 10605040 | arkts-no-obj-literals-as-types | `{ name: string }` | [ArkTS-COMPILE-LIMIT] |
| 9 | 90 | 10605999 | — | `let empty: T\|null = null` 后 `empty?.user?.name` | [ArkTS-COMPILE-LIMIT] |
| 10 | 102 | 10605092 | arkts-no-nested-funcs | `function combine()` 在 `it()` 内 | [ArkTS-COMPILE-LIMIT] |
| 11 | 103 | 10605999 | — | `null as string` | [ArkTS-COMPILE-LIMIT] |
| 12 | 115 | 10605092 | arkts-no-nested-funcs | `function lengthOf()` 在 `it()` 内 |
| 13 | 94 | 10505001 | — | `null - 1` |
| 14 | 95 | 10505001 | — | `null * 2` |
| 15 | 96 | 10505001 | — | `null < 1` |
| 16 | 97 | 10505001 | — | `null >= 0` | [ArkTS-COMPILE-LIMIT] |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-obj-literals-as-types` | 对象字面量不能用作类型声明 |
| `arkts-no-untyped-obj-literals` | 对象字面量必须对应已声明的 class 或 interface |
| `arkts-no-nested-funcs` | 函数内不能嵌套定义函数 |

### 标注说明

`[ArkTS-COMPILE-LIMIT]` = 因 ArkTS 编译器规则限制无法在 .ets 中直接编写，将原语句原样移至 `CrossFeatureHelper.ts` 中。运行时行为与 ECMA-262 一致。

### 处理方案

将涉及语句原样移动到 `CrossFeatureHelper.ts` 中。
