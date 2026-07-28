# 编译失败分析报告

## 文件: OptionalChainingTest.test.ets

### 错误汇总

| # | 行号 | 错误码 | 规则 | 涉及语句 |
|---|---|---|---|---|
| 1 | 71 | 10605999 | — | `let obj: Box\|null = null` 后 `obj?.value` → 类型收窄为 never |
| 2 | 87 | 10605999 | — | `let empty: Greeter\|null = null` 后 `empty?.greet()` → 类型收窄为 never |
| 3 | 123 | 10605999 | — | `let obj: ...\|null = null` 后 `obj?.nested?.val` → 类型收窄为 never |
| 4 | 104 | 10605029 | arkts-no-props-by-index | `empty?.[0]` — nullable 不支持索引访问 |
| 5 | 117 | 10605092 | arkts-no-nested-funcs | `function trigger()` 在 `it()` 内 |
| 6-7 | 122 | 10605040 | arkts-no-obj-literals-as-types | `{ nested: { val: number } }` 作为类型声明 |
| 8-9 | 137 | 10605040 | arkts-no-obj-literals-as-types | `{ inner: { x: number } }` 作为类型声明 |
| 10-11 | 137 | 10605038 | arkts-no-untyped-obj-literals | `{ inner: { x: 7 } }` 对象字面量 |
| 12 | 151 | 10605029 | arkts-no-props-by-index | `obj?.['prop']` — nullable 不支持索引访问 |
| 13 | 164 | 10605999 | — | `fn?.()` — `let fn: (() => number) \| null = null` 后类型收窄为 never + inline 函数类型 |
| 14 | 176 | 10605040 | arkts-no-obj-literals-as-types | `{ x: number }` 作为类型声明 |
| 15 | 177 | 10605999 | — | `obj?.x` — `let obj: { x: number } \| null = null` 后收窄为 never |

### 新增规则

| 规则 | 说明 |
|---|---|
| `arkts-no-props-by-index` | 不支持通过索引访问 nullable 对象的属性 |

### 处理方案

将涉及语句原样移动到 `OptionalChainingHelper.js` 中。
