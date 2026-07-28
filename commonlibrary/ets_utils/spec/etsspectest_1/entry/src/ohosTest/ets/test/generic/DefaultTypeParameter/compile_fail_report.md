# compile_fail_report — DefaultTypeParameter

> 新口径：本文件记录 **ArkTS 解决不了、需通过 helper 绕开** 的问题及解决方法。  
> 本阶段只交正向用例；fail_compile 负向点（GTP-DE-006/008）后续补。

## 已通过 helper 绕开（正向阶段）

| # | ArkTS 问题 | 涉及语法 | 解决方法 | 对应 GTP | helper 符号 |
|---|---|---|---|---|---|---|
| 1 | 类/函数默认类型参数、约束默认组合保留在 TS | `<T = number>` / `<T extends C = C>` | 待实测编译，若能编译则逐项移入 `.ets`；不能则更新注释写明当前版本限制 | GTP-DE-001/003/004/005/007/009 | `wrapWithDefault` 等 |

### ✅ 已解决

| 原问题 | 涉及语法 | 对应 GTP | 处理方式 |
|--------|---------|---------|---------|
| 接口默认类型参数可能不被 `.ets` 接受 | `interface X<T = string>` | GTP-DE-002 | 当前版本已支持，`DefaultTypeContainer` 已移回 `.ets` |

## 待补（负向，本阶段不做）

| GTP | 说明 |
|---|---|
| GTP-DE-006 | required 类型参数不得位于 default 之后 |
| GTP-DE-008 | 默认类型违反 constraint |

## Helper Playground 核对清单（需本机打开网站跑）

对 `defaultTypeParameterTsHelper.ts` 中导出函数，在 [TypeScript Playground](https://www.typescriptlang.org/play) 粘贴等价片段，确认返回值与断言一致后再上实机。

```typescript
function wrapWithDefault<T = string>(value: T): { value: T } {
  return { value: value }
}
wrapWithDefault('hello').value // 'hello'
wrapWithDefault<number>(42).value // 42

function echoOrDefault<T = string>(value?: T): T {
  if (value !== undefined) return value
  return 'fallback' as T
}
echoOrDefault(42) // 42
echoOrDefault() // 'fallback'
```
