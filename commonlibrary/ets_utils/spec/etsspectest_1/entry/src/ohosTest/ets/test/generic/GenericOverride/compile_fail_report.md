# 编译失败分析报告

## 成员: M13 — Generic Override + 整合者

---

## 验证策略

所有 fail_compile 测试点（OV-003/OV-004/OV-005/OV-006）已通过独立 `.ets` 文件在合并前完成编译验证，验证结果记录如下。主测试文件 `GenericOverrideTest.test.ets` 内仅包含可编译的 pass/boundary/runtime 用例，通过 JSDoc 标注对应 fail_compile 结论。

---

## fail_compile 验证结果

| # | GTP ID | 独立验证文件 | 编译结果 | 错误码 | 涉及语句 |
| --- | --- | --- | --- | --- | --- |
| 1 | OV-003 | `_ov003_verify.ets` | ❌ 编译失败 | ArkTSCheck | `override getData<T>(): string` — 父类返回 T，子类返回 string，类型不兼容 |
| 2 | OV-004 | `_ov004_verify.ets` | ❌ 编译失败 | ArkTSCheck | `override query<T extends HasId & HasName>` — 缩窄约束违反 Liskov 替换原则 |
| 3 | OV-005 | `_ov005_verify.ets` | ❌ 编译失败 | ArkTSCheck | `override method(v: string): string` — T 不可赋值给 string |
| 4 | OV-006 | `_ov006_verify.ets` | ❌ 编译失败 | ArkTSCheck | `override transform(input: string): string` — 泛型/非泛型签名不匹配 |

> OV-005 原分类为 boundary（P1），ArkTS 实际编译结果确认拒绝，已迁移为 fail_compile。

---

## 根因分析

### OV-003: override 返回类型不兼容

**核心问题**: 子类 override 的返回类型必须与父类兼容。`override getData<T>(): string` 将泛型返回固定为 `string`，但 `string` 不可赋值给未约束的 `T`。

### OV-004: override 缩窄约束

**核心问题**: `override query<T extends HasId & HasName>` 比父类的 `<T extends HasId>` 更严格，违反 Liskov 替换原则。

### OV-005: 具体类型方法 override 泛型方法

**核心问题**: 泛型方法 `method<T>(v: T): T` 的契约是接受任意类型，子类 `override method(v: string): string` 收窄了参数类型。ArkTS 编译器明确拒绝（`Type 'T' is not assignable to type 'string'`）。

### OV-006: 签名不匹配

**核心问题**: 泛型方法不能被非泛型方法 override，反之亦然。方法签名必须在类型参数数量上保持一致。

---

## 主测试文件内联测试说明

| GTP ID | 内联方式 | 说明 |
| --- | --- | --- |
| OV-003 | pass — 协变返回类型 | PetStore→CatStore 继承链验证合法 override |
| OV-004 | pass — 相同约束 | 验证 `<T extends HasId>` 约束保持不变时可正常 override |
| OV-005 | boundary | 验证有效泛型 override，@tc.desc 记录已确认的 ArkTS 拒绝行为 |
| OV-006 | pass — 多类型参数 | 验证多类型参数泛型方法正常 override |

---

## 编译环境

| 项目 | 信息 |
|---|---|
| 工具链版本 | （编译后填写） |
| 编译命令 | （编译后填写） |
| 编译日期 | （编译后填写） |
