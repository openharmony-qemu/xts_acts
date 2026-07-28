# 编译失败分析报告

## 文件: GenericBoundaryTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 47 | 10605138 | arkts-no-utility-types | `NonNullable<T>` |
| 2 | 93 | 10605040 | arkts-no-obj-literals-as-types | `{ name: string }` 作为类型声明 |
| 3 | 93 | 10605038 | arkts-no-untyped-obj-literals | `{ name: 'test' }` 对象字面量 |
| 4 | 98 | 10605038 | arkts-no-untyped-obj-literals | `processObject({ name: 'test' })` 参数中字面量无对应类型 |
| 5 | 157 | 10605999 | — | `new Result(null)` 泛型推断为 `Result<null>` 而非 `Result<string>` |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-utility-types` | 不支持 TypeScript 工具类型（如 `NonNullable<T>`） |

### 处理方案

- 错误 1: 因 `NonNullable<T>` 不属于 ECMA-262，且 ArkTS 不支持 utility types，.js 无法保留类型语义，**删除该用例**
- 错误 2-4: 将对象字面量提前赋给 IName 类型变量再传参
- 错误 5: 泛型类在 .js 中退化为普通类，无用例价值，**删除该用例**
