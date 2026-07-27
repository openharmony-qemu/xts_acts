# compile_fail_report — GenericOverload

> 新口径：本文件记录 **ArkTS 解决不了、需通过 helper 绕开** 的问题及解决方法。  
> 本阶段只交正向用例；fail_compile 负向点（GTP-OL-005/006/007）后续补。

## 已通过 helper 绕开（正向阶段）

| # | ArkTS 问题 | 涉及语法 | 解决方法 | 对应 GTP | helper 符号 |
|---|---|---|---|---|---|
| 1 | `.ets` 不支持从 `.ts` 导入带多 overload 签名的函数并解析（检视报告 1.8） | `export function f(x: number); export function f(x: string); ...` | overload 签名仅留在 `.ts`；`.ets` 只 import **无重载包装函数**；包装函数自身调用 overloaded 导出本体而非绕过 | GTP-OL-001~004, OL-008 | `callProcessValueNumber` 等 |

## 待补（负向，本阶段不做）

| GTP | 说明 |
|---|---|
| GTP-OL-005 | overload signature 无实现 |
| GTP-OL-006 | signature 与实现不兼容 |
| GTP-OL-007 | 多个 implementation body |

## Helper Playground 核对清单

```typescript
function processValueImpl(x: number | string): number | string {
  return x
}
processValueImpl(3) // 3
processValueImpl('a') // 'a'

function processArrayOrItemImpl(x: number | number[]): number {
  if (Array.isArray(x)) return x[0]
  return x
}
processArrayOrItemImpl([1, 2, 3]) // 1
processArrayOrItemImpl(99) // 99
```
