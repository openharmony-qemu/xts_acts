# Known Issues

## 语义差异（ArkTS 运行时 ≠ ECMA-262）

```javascript
// ECMA-262 §13.3.9: delete obj?.x 应删除 x 并返回 true
let obj = { x: 42 }
delete obj?.x
// Node.js 结果: obj.x === undefined, delete === true   ✅ ECMA-262 一致
// ArkTS 运行时: obj.x === 42, delete 操作不被支持     ❌ 语义差异
```

| 特性 | ECMA-262 | ArkTS 运行时 |
|---|---|---|
| `delete obj?.x` | 删除属性 x，返回 true | delete 操作不被支持，无法删除属性 |

## 已删除用例

| 用例 | 原因 |
|---|---|
| testDeleteOptionalChain0015 | ArkTS 运行时 delete 操作与 ECMA-262 语义不一致，无法通过正向用例验证 |
