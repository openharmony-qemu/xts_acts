# Known Issues

## .js 验证（Node.js 运行时）

| 语句 | 预期结果 | node 验证 |
|---|---|---|
| 泛型类实例化传 null | `{ value: null }` | ✅ |

## [ARKTS-ONLY] 仅 ArkTS 报错，TypeScript/JavaScript 允许

| 模式 | .ets 错误码 | .ts 结果 | .js 结果 |
|---|---|---|---|
| 内联对象类型 `{ name: string }` | arkts-no-obj-literals-as-types | ✅ 通过 | ✅ 通过 |
| 未类型化对象字面量 `{ name: 'test' }` | arkts-no-untyped-obj-literals | ✅ 通过 | ✅ 通过 |
| 嵌套类 `class Result<T>` 在 `it()` 内 | arkts-no-nested-funcs | ✅ 通过 | ✅ 通过 |

## [SAME-FAIL] ArkTS 和 TypeScript strict 均报错，但 JavaScript 允许

| 模式 | .ets 错误码 | .ts 错误码 | .js 结果 |
|---|---|---|---|
| `new Result(null)` 泛型推断 | 10605999 | TS2322 | ✅ 通过 |

## 已删除用例

| 用例 | 原因 |
|---|---|
| testNonNullableType0004 | `NonNullable<T>` 不属于 ECMA-262，ArkTS 不支持 utility types，.js 无法保留类型语义 |
