# 编译失败分析报告

## 成员: M06 — Generic Constraints

---

## 1. 概述

本报告针对泛型约束（Generic Constraints）相关的编译失败测试用例进行分析。共发现 **2** 个编译错误，均属于 `TS2345` 类型不匹配错误，涉及泛型约束违反的场景。

| 项目 | 信息 |
|---|---|
| 报告日期 | 2026-07-24 |
| 分析人员 | M06 团队 |
| 涉及用例数 | 2 |
| 错误类型 | 泛型约束违反 (TS2345) |

---

## 2. 错误汇总

| # | 文件 | 行号 | 错误码 | 严重级别 | 规则 | 涉及语句 |
|---|---|---|---|---|---|---|
| 1 | `generic_constraint_co003_fail_compile.ets` | 32 | TS2345 | P0 | `arkts-strict-typing` / Generic Constraints | `readId(new NoIdObj());` |
| 2 | `generic_constraint_co005_fail_compile.ets` | 31 | TS2345 | P1 | `arkts-strict-typing` / Generic Constraints | `getAnimalName(new NotAnimal());` |

---

## 3. 根因分析

### 3.1 GTP-CO-003: 不满足接口约束的实参

**测试用例**: `SUB_GENERIC_0503`

**错误详情**:TS2345: Argument of type 'NoIdObj' is not assignable to parameter of type 'HasId'.
Property 'id' is missing in type 'NoIdObj' but required in type 'HasId'.

**核心问题**:
- 泛型函数 `readId<T extends HasId>(value: T): number` 要求传入的实参必须满足 `HasId` 接口约束（即包含 `id: number` 属性）
- 传入的 `NoIdObj` 类仅包含 `name: string` 属性，缺少必需的 `id` 属性
- 编译器在类型检查阶段正确识别并拦截此错误

**代码示例**:
```typescript
interface HasId {
  id: number;  // 必需属性
}

function readId<T extends HasId>(value: T): number {
  return value.id;
}

class NoIdObj {
  name: string = 'no id';  // ❌ 缺少 id 属性
}

readId(new NoIdObj());  // ❌ TS2345 编译错误
3.2 GTP-CO-005: 不满足类继承约束的实参
测试用例: SUB_GENERIC_0506

错误详情:

text
TS2345: Argument of type 'NotAnimal' is not assignable to parameter of type 'Animal'.
  Type 'NotAnimal' is missing the following properties from type 'Animal': name
核心问题:

泛型函数 getAnimalName<T extends Animal>(animal: T): string 要求实参必须是 Animal 类型或其子类

传入的 NotAnimal 类与 Animal 无继承关系，也不满足其结构要求（缺少 name 属性）

编译器正确识别类型不兼容并报错

代码示例:

typescript
interface HasName {
  name: string;
}

interface Animal extends HasName {
  name: string;
}

function getAnimalName<T extends Animal>(animal: T): string {
  return animal.name;
}

class NotAnimal {
  weight: number = 0;  // ❌ 缺少 name 属性，且无继承关系
}

getAnimalName(new NotAnimal());  // ❌ TS2345 编译错误