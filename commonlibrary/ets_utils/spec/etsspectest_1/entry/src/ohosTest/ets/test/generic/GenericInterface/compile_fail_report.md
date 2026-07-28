# 编译失败分析报告

## 成员: M04 — Generic Interface

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
| 1 | `generic_interface_implementation_mismatch_fail_compile.ets` | 48 | — | implements 成员类型不匹配 | `get(key: number): number`（接口要求返回 string） |
| 2 | `GenericInterfaceTest.test.ets`（call signature 接口，已移 .ts） | — | — | arkts-no-call-signatures | `interface CallbackIface<T> { (value: T): void }` |

> GI-009 fail_compile 成立，编译失败，诊断与预期一致。
> GI-006 call signature 接口在 .ets 报 arkts-no-call-signatures，被迫移至 .ts helper（见根因分析 GI-006）。
> 主测试文件 `GenericInterfaceTest.test.ets` 编译通过（call signature 已移出 .ets）。

---

## 根因分析

### GI-009: implements 具体成员类型不匹配

**核心问题**: `class BadStore implements Store<number, string>` 要求 `get(key: number): string`（V=string），但实现类 `get` 返回 `number`，与接口契约不兼容，编译器拒绝。

**实际诊断**（ArkTS 1.1 / DevEco 6.1.1，.ets）:
```
Property 'get' in type 'BadStore' is not assignable to the same property in base type 'Store<number, string>'.
Type '(key: number) => number' is not assignable to type '(key: number) => string'.
Type 'number' is not assignable to type 'string'.  <ArkTSCheck>
```

**非法点（单一）**: `get(key: number): number { return 0 }`，真实存在于 .ets 可执行区域（非注释）。

**TS 环境差异**: 本文件现已将 `Store<K,V>` 内联声明于文件内（不再 `import` 外部 `.ets` 夹具），故原先标准 TS 环境因无法解析 `.ets` 夹具而报 `Cannot find name 'Store'` 的差异已消除——两环境现均能解析本地 `Store`，预期都报 implements 成员类型不匹配。原差异记录见 `known_issues.md` M04-ISSUE-001（已标记为随内联解决）。

### GI-006: call signature 接口在 .ets 被拒（被迫落 .ts）

**核心问题**: call signature 接口 `interface CallbackIface<T> { (value: T): void }` 在 .ets 原生声明被 ArkTS 拒绝。

**实际诊断**（ArkTS 1.1 / DevEco 6.1.1，.ets）:
```
Use "class" instead of a type with call signature (arkts-no-call-signatures)  <ArkTSCheck>
```

**处理**: CallbackIface 及 invokeCallbackIface 移至 `genericInterfaceTsHelper.ts`（.ts 按标准 TS 编译，支持 call signature 接口），.ets 通过 import `invokeCallbackIface` 调用做运行时断言。此为 .ets 不支持、被迫落 .ts 的语法（质检标准 3.2）。

---

## 处理方案

- **GI-009**: `get(key: number): number` 真实存在于 fail_compile 文件可执行区域，编译失败且诊断符合预期，保留错误代码不改。
- **GI-006**: call signature 接口在 .ets 报 arkts-no-call-signatures，移至 .ts helper，主文件 import 调用。保留错误代码不改。
- GI-008 默认类型参数 `interface DefaultContainer<T = string>` .ets 支持，直接声明于主文件，无需 helper。
- 主测试文件编译通过。
