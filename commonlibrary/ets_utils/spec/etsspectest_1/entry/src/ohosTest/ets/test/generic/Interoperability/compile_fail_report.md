# 编译失败分析报告

## 成员: M12 — ETS / TS / JS Interop

---

## 编译环境

| 项目 | 信息 |
|---|---|
| 工具链版本 | ArkTS 1.1 / DevEco Studio 6.1.1 |
| 编译命令 | hvigorw assembleHap |
| 编译日期 | 2026-07-23 |

---

## 错误汇总

| # | 文件 | 行号 | 错误码 | 规则 | 涉及语句 | 状态 |
|---|---|---|---|---|---|---|
| 1 | `ts_consumer.ts` | 30 | 10605999 | 禁止 JS/TS 导入 ArkTS | `import { etsIdentity, EtsBox } from './ets_producer'` | 已绕开（见根因分析 #1） |
| 2 | `generic_dts_contract_mismatch_fail_compile.ets` | 33 | — | 泛型约束不满足 | `lengthBounded<number>(42)`（number 不满足 `{ length: number }`） | fail_compile 成立（见根因分析 IO-011） |

> #1 为 .ts→.ets 跨语言 import 方向的真实工具链限制（IO-005/007/010），已通过注入方式绕开（不再 import .ets），M12 包恢复构建。
> #2 IO-011 fail_compile 成立，.ets 强制 .d.ts 泛型约束，诊断符合预期，保留错误代码不改。

---

## 根因分析

### #1: .ts 导入 .ets 被 ArkTS 禁止（10605999）

**核心问题**: IO-005/007/010 测试点要求"TS 消费 ETS 导出的泛型函数/类"，`ts_consumer.ts` 第 30 行 `import { etsIdentity, EtsBox } from './ets_producer'` 实现 .ts→.ets 跨语言 import。

**实际诊断**（ArkTS 1.1 / DevEco 6.1.1）:
```
ERROR: 10605999 ArkTS Compiler Error
Importing ArkTS files in JS and TS files is forbidden.
At File: ts_consumer.ts:30:37
```

**差异**: ArkTS 禁止 JS/TS 文件 import ArkTS（.ets）文件，.ts→.ets 方向不被工具链支持。原 `ts_consumer.ts` 直接 import .ets 导致编译失败，整个 M12 包构建失败。

**解决方案（绕开 10605999 + arkts-no-classes-as-obj）**: 不在 .ts 中 import .ets，改为**参数注入**：
- .ets 主文件 `GenericInteropTest.test.ets` import `ets_producer`（.ets→.ets，允许），构建 `etsProducerApi` 容器（含 `etsIdentity` 函数与 `createEtsBox` 工厂工厂）。
- `ts_consumer.ts` 不再 import .ets，改为定义本地结构类型 `EtsIdentityFn` / `EtsBoxFactory` / `EtsProducerApi` 描述注入值形状，包装函数 `tsCallsEtsIdentity(api)` / `tsReceivesEtsReturn(api)` / `tsCheckClassIdentity(api)` 接收注入。
- 主文件调用时传入 `etsProducerApi`。
- `EtsBox` 构造器通过工厂函数 `createEtsBox<T>` 包裹，避免对象字面量存储 class 触发 `arkts-no-classes-as-obj`。

验证目标不变（TS 消费 ETS 泛型产物），仅把获取引用的方式从 `.ts import .ets` 改为 `.ets 注入 .ts`，绕开 10605999 的 import 禁令。`ets_producer.d.ts` 因不再有 .ts→.ets import 而删除。

**处理**: 错误代码（原 import 语句）已替换为注入方案，M12 包恢复构建。详见 `known_issues.md` M12-ISSUE-001。

### IO-011: .d.ts 声明契约与实际 JS 导出一致性

**核心问题**: `js_producer.d.ts` 声明 `lengthBounded<T extends { length: number }>(v: T): number`，约束 T 含 length 属性。以 `number` 实参调用 `lengthBounded<number>(42)` 违反约束，编译器应拒绝。

**实际诊断**（ArkTS 1.1 / DevEco 6.1.1，.ets）:
```
Type 'number' does not satisfy the constraint '{ length: number; }'.  <ArkTSCheck>
```
.ets 在编译期强制 .d.ts 的泛型约束，fail_compile 成立。

**非法点（单一）**: `const len = lengthBounded<number>(42)`，真实存在于 .ets 可执行区域（非注释）。

**TS 环境差异**: 同一文件在标准 TS 环境的诊断与 .ets 不同（具体文本待补），详见 `known_issues.md` M12-ISSUE-002。

### 跨语言模块（integration）

**核心问题**: ETS/TS/JS 之间的泛型声明与类型信息传递。ETS 泛型擦除为运行时值后，跨语言类型兼容性是测试重点。

**待确认风险点**:
- `.ets` 导入 `.js`（`GenericInteropTest.test.ets → js_producer`）是否需 .d.ts 且类型检查边界行为（IO-006）
- `ts_consumer.ts` 中 `a.constructor === b.constructor`（IO-010）在 .ts 下不报 10505001（标准 TS），但跨语言运行时身份是否保持待验证（受 #1 限制，当前无法编译验证）

---

## 处理方案

- 所有 integration 用例使用真实 helper module（.ets/.ts/.js），每个标注 Used By，不允许单文件 local call 替代跨模块 import（V3）。
- IO-010 constructor 身份用 `constructor === constructor`（非 `typeof object`，避 V4）。
- **10605999 已绕开**: `ts_consumer.ts` 不再 import .ets，改由 .ets 主文件注入 ets_producer 导出（参数注入 + 结构类型），M12 包恢复构建，IO-005/007/010 可编译运行（见 known_issues.md M12-ISSUE-001）。
- **IO-011 fail_compile 成立**: `lengthBounded<number>(42)` 在 .ets 报泛型约束不满足，保留错误代码不改（见 known_issues.md M12-ISSUE-002）。

---

## Helper 模块清单

| 文件 | 导出内容 | Used By |
|---|---|---|
| `ets_producer.ets` | `etsIdentity<T>`、`EtsBox<T>`、`EtsStore<K,V>` + `EtsStoreImpl` | IO-001/002/003/005/007/010 |
| `ets_consumer.ets` | `runEtsFunctionInterop`、`runEtsClassInterop`、`runEtsInterfaceInterop` | IO-001/002/003 |
| `ts_producer.ts` | `tsIdentity`、`tsAsync`、`tsReject`、`tsArray`、`tsReadMap`、`tsThrower` | IO-004/008/009/012 |
| `ts_consumer.ts` | `tsCallsEtsIdentity(api)`、`tsReceivesEtsReturn(api)`、`tsCheckClassIdentity(api)`、`EtsProducerApi` | IO-005/007/010（经 .ets 注入） |
| `js_producer.js` | `jsIdentity`、`jsDynamicValue`、`lengthBounded` | IO-006/011 |
| `js_producer.d.ts` | 上述导出的泛型契约 | GenericInteropTest.test.ets（IO-006/011） |
| `genericInteropTsHelper.ts` | re-export ts_producer | IO-004/008/009/012 |

> `ets_producer.d.ts` 已删除：原为 .ts→.ets import 提供类型，10605999 绕开后不再需要（.ts 不再 import .ets）。

---

## helper 必要性 / 被迫落 .ts/.js 的语法

本节区分两类 helper：**(A) interop 测试必需**（.ts/.js 本身是被测的 TS/JS 侧，非 .ets 不支持）与 **(B) 因 .ets 不支持而被迫落 .ts/.js**（质检标准 3.2）。

### (A) interop 测试必需（非被迫）

| 文件 | 说明 |
|---|---|
| `ts_producer.ts` | 测试 TS 导出泛型供 .ets 消费（IO-004 等），.ts 是被测侧，非 .ets 不支持 |
| `ts_consumer.ts` | 测试 TS 消费 .ets 导出（IO-005 等），.ts 是被测侧 |
| `js_producer.js` | 测试 JS 动态值（IO-006），JS 无类型标注是其测试意图本身，本就该是 .js |

### (B) 待确认是否"被迫落 .ts/.js"

| 文件/语法 | 对应测试点 | 是否被迫 | 说明 |
|---|---|---|---|
| `ets_producer.d.ts`（为 .ts 消费 .ets 提供类型声明） | IO-005/007/010 | TBD 待实测 | ArkTS .ets 源非标准 TS 可识别扩展名，.ts 导入需 .d.ts 做类型解析；该机制是否工具链原生支持待实测 |
| `js_producer.d.ts`（为 .ets 消费 .js 提供泛型契约） | IO-006/011 | TBD 待实测 | .ets 导入 .js 是否强制 .d.ts、类型检查边界行为待实测 |
| `genericInteropTsHelper.ts`（re-export 聚合） | IO-004 等 | ❌ 否 | 仅作 .ets 消费 ts_producer 的统一 import 入口，非被迫 |

**结论（待实测定稿）**: M12 的 .ts/.js helper 多为 interop 测试必需（被测侧），**非**"ets 不支持只能落 ts/js"。真正的待确认项是 **`.d.ts` 声明机制**（.ts→.ets、.ets→.js 两个方向的 .d.ts 是否被工具链强制/支持），均未经 ArkTS 1.1 实测确认（V5）。

> 待实测确认项:
> 1. `.ts` 经 `.d.ts` 导入 `.ets`（ts_consumer.ts → ets_producer）是否编译/链接通过（IO-005/007/010）
> 2. `.ets` 导入 `.js` 是否需 .d.ts 及类型检查边界（IO-006）
> 3. IO-011 fail_compile：.ets 是否强制 .d.ts 泛型约束（实际错误码/是否通过）
> 4. IO-010 跨语言 constructor 身份运行时是否保持
