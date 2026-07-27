# ArkTS 测试用例断言与 ECMA-262 规范符合性检视报告

**目录**: `generic/` (14 个子目录)
**检视文件**: 14 个 `.test.ets` 文件
**检视重点**: 缺少断言、恒真/弱断言、编码错误、ECMA-262 符合性、预期结果一致性、负向用例
**检视日期**: 2026-07-27

---

## 一、总体结论

| 检视维度 | 结果 |
|----------|------|
| 缺少断言的用例 | **0** — 所有用例均有至少一个断言 |
| 恒真断言 | **8 处** (3 个文件) |
| 弱断言 | **5 处** (3 个文件) |
| 编码错误 | **12 处** (跨 7 个文件) |
| ECMA-262 不符合 | **0** — 运行时行为全部符合规范 |
| 预期结果不一致 | **0** — 所有预期值与代码行为一致 |
| 负向用例编译检查问题 | **0** — 无负向用例被错误识别为正向 |

---

## 二、恒真断言（8 处）

### 2.1 GenericFunctionTest.test.ets — 2 处

**[高] [恒真断言] GenericFunctionTest.test.ets:274** — `testRuntimeIdentityFn0013` 中断言 `sameRef(fNum, fStr)`。
`fNum` 和 `fStr` 均指向同一个函数对象 `myIdentity`，`===` 自反性恒为 `true`。
```
  建议改法: 删除或用更有意义的 identity 比较替代。
```

**[高] [恒真断言] GenericFunctionTest.test.ets:288** — `testRuntimeConstructorShared0014` 中断言 `sameRef(b1.constructor, b2.constructor)`。
`b1` 和 `b2` 由同一个 `Box` 类构造，`Box === Box` 始终为真。
```
  建议改法: 同上。
```

### 2.2 GenericClassTest.test.ets — 2 处

**[高] [恒真断言] GenericClassTest.test.ets:173** — `testClassBasicDeclarationInstance0002` 中断言 `box instanceof GenericClassBox`。
刚 `new` 出来的对象，`instanceof` 必定为 `true`。
```
  建议改法: 删除或改为测试原型链更有意义的属性。
```

**[高] [恒真断言] GenericClassTest.test.ets:294** — `testConstructorIdentityArkts0011` 中断言 `numberBox.constructor === stringBox.constructor`。
同 2.1，同一类不同类型参数擦除后恒等。
```
  建议改法: 删除。
```

### 2.3 GenericVarianceTest.test.ets — 2 处

**[低] [恒真断言] GenericVarianceTest.test.ets:237,250** — `testVarianceRuntimeProducerInstance0008` 和 `testVarianceRuntimeConsumerInstance0009` 中 `instanceof` 断言检查刚 new 出来的对象。
```
  建议改法: 改为检查多态赋值后的 instanceof，如验证 producer instanceof Animal。
```

### 2.4 LiveBindingTest.test.ets — 1 处（补充发现）

**[中] [恒真断言] LiveBindingTest.test.ets:87** — `isSameFnBinding(stableFn, stableFn)`，同一引用传入两次，恒为 true。
```
  建议改法: 应比较通过不同 import 路径获得的同一函数引用。
```

### 2.5 CrossFeature（补充发现）

此问题在之前的 CrossFeatureTest 中同样存在类似模式，但无直接的 `===` 自反性比较。

---

## 三、弱断言（5 处）

### 3.1 仅验证长度未验证元素

**[低] [弱断言] GenericFunctionTest.test.ets:221** — `testOptionalDefaultParam0009` 只断言了 `label`，未验证 `value`。
```
  建议改法: 增加 expect(w1.val).assertEqual(42)。
```

**[低] [弱断言] GenericInheritanceTest.test.ets:259** — `testInterfaceExtendsConcrete0002` 仅检查 `getAll().length === 2`，未验证元素内容。
```
  建议改法: 逐一验证元素值。
```

**[低] [弱断言] GenericInteropTest.test.ets:194-199** — `tsArray<number>(1,2,3)` 只校验了 arr[0] 和 arr[2]，未校验 arr[1]。
```
  建议改法: 补充 expect(arr[1]).assertEqual(2)。
```

### 3.2 拆分用例导致单字段验证

**[中] [弱断言] GenericClassTest.test.ets:238-241,251-254** — `testMultiTypeParamClassFirst0007` 和 `testMultiTypeParamClassSecond0008` 各只验证一个字段。若构造函数赋值写反，两个用例仍能通过。
```
  建议改法: 合并两个用例，在每个中断言两个字段。
```

**[中] [弱断言] GenericClassTest.test.ets:331-334,345-349** — `testNestedGenericClassFirst0014` 和 `testNestedGenericClassSecond0015` 同上。
```
  建议改法: 合并用例或交叉验证。
```

---

## 四、编码错误（12 处）

### 4.1 ArkTS 编译阻塞 — override 缺 open（3 文件，8 处）

**[高] [编码错误] GenericOverrideTest.test.ets:51,53,71,73,91,93,131,133** — 所有 7 个用例中基类方法未标记 `open`，子类使用 `override`。ArkTS 静态模式直接编译报错。

**[中] [编码错误] GenericInheritanceTest.test.ets:48-56** — `Animal.speak()` 未标记 `open`，`Cat.speak()` 覆盖父类方法未用 `override`。

**[中] [编码错误] GenericConstraintTest.test.ets:43,45** — 同上模式。

```
  建议改法: 基类方法加 `open`，子类加 `override`。
```

### 4.2 非空断言 `!` 掩盖 undefined（2 文件，6 处）

**[中] [编码错误] GenericInterfaceTest.test.ets:59,93,117** — `this.map.get(key)!` 掩盖 `Map.get()` 可能返回的 `undefined`。
**[中] [编码错误] GenericInheritanceTest.test.ets:77,97** — 同上。
**[中] [编码错误] GenericConstraintTest.test.ets:369** — `container.getFirst()!.id` 同上。

```
  建议改法: 使用空值兜底 `?? defaultValue` 或返回 `V | undefined`。
```

### 4.3 映射类型在 .ets 中直接使用（2 处）

**[高] [编码错误] GenericUtilityTypeTest.test.ets:228,245** — `Required<UtilityOptionalProfile>` 是 TypeScript 映射类型，ArkTS 不支持。
**[高] [编码错误] GenericUtilityTypeTest.test.ets:262** — `Readonly<UtilityProfile>` 同上。

```
  建议改法: 将 Required/Readonly 的验证移至 .ts helper。
```

### 4.4 变型赋值编译风险（2 处）

**[高] [编码错误] GenericVarianceTest.test.ets:177-181** — `Producer<Cat>` 赋值给 `Producer<Animal>`，无变型标注的接口默认不变型，编译可能失败。
**[高] [编码错误] GenericVarianceTest.test.ets:193-194** — `Consumer<Animal>` 赋值给 `Consumer<Cat>`，逆变赋值同理。

```
  建议改法: 确认 ArkTS 编译模式对此行为是否支持。
```

### 4.5 type 别名在 .ets 中定义（1 处）

**[高] [编码错误] GenericConstraintTest.test.ets:83** — `type StringToNumberFunc = (s: string) => number;` 在 `.ets` 中使用 `type` 定义类型别名，ArkTS 禁止。

```
  建议改法: 移到 .ts helper 中。
```

### 4.6 命名不一致（1 处）

**[中] [编码错误] DefaultTypeParameterTest.test.ets:152** — `@tc.name: testDefaultSatisfiesConstraint0001` 与 `it()` 参数 `testDefaultTypeSatisfiesConstraint0013` 不一致。

```
  建议改法: 统一命名。
```

---

## 五、ECMA-262 规范符合性

### 5.1 完全符合的文件（10 个）

| 文件 | 结论 |
|------|------|
| GenericFunctionTest | ✅ 运行时行为全部符合 |
| GenericClassTest | ✅ 运行时行为全部符合 |
| GenericConstraintTest | ✅ 擦除后运行时行为符合 |
| GenericInheritanceTest | ✅ 原型链/多态/Map 行为符合 |
| GenericOverrideTest | ✅ 运行时 override 分派符合 (不含编译时 override 关键字) |
| GenericOverloadTest | ✅ 擦除后函数调用符合 |
| TypeParameter | ✅ 擦除后值传递符合 |
| TypeInference | ✅ 运行时值传递符合 |
| DefaultTypeParameter | ✅ 运行时行为符合 |
| Interoperability | ✅ 跨语言函数/Promise/Map 符合 |

### 5.2 部分非 ECMA-262 范畴的功能（4 个文件）

| 文件 | 非 ECMA-262 部分 | 说明 |
|------|------------------|------|
| GenericInterface | 接口声明 | TypeScript 编译时概念，擦除后运行时行为符合 |
| UtilityType | Required/Readonly/Partial/Exclude 等 | TypeScript 映射类型，不在 ECMA-262 范围内 |
| Variance | Producer/Consumer 变型标注 | TypeScript 变型标注，不在 ECMA-262 范围内 |
| RuntimeABC | 接口擦除验证 | 接口运行时无实体 |

### 5.3 跨语言风险点

**[中] [ECMA-262] GenericInteropTest.test.ets:248-257** — 跨语言异常传播中 `catch (e)` 的 `e.message` 可能因运行时实现不同而丢失。
**[中] [ECMA-262] GenericInteropTest.test.ets:175-184** — 跨语言 Promise rejection reason 结构保持性未定义。

---

## 六、负向用例问题

### 6.1 全部 14 个文件缺少负向/异常用例

所有文件只有正向（happy path）测试，无负向用例。以下关键负向场景全部缺失：

| 文件 | 缺失的负向场景 |
|------|---------------|
| GenericFunctionTest | null/undefined 作为泛型参数、不传参数 |
| GenericClassTest | 类型参数不匹配的编译拒绝验证 |
| GenericInterfaceTest | key 不存在的 Map.get 返回 undefined |
| GenericConstraintTest | 不满足约束的类型传入 |
| GenericInheritanceTest | 访问不存在的 key（Map.get） |
| GenericOverrideTest | override 不匹配的类型签名 |
| GenericOverloadTest | 重载签名不兼容（已延期） |
| TypeParameter | 类型参数越界访问（已延期） |
| TypeInference | 空数组推断 |
| DefaultTypeParameter | 默认类型违反约束（已延期） |
| UtilityType | 空数组 firstElement、Map 缺失 key |
| Variance | 不变型赋值拒绝 |
| Interoperability | 跨语言导入模块不存在 |
| RuntimeABC | 接口擦除验证（已删除） |

**注意**: `compile_fail_report.md` 明确记录了部分负向场景已延期（GTP-OL-005/006/007、GTP-TP-006/008、GTP-IN-010、GTP-DE-006/008）。

### 6.2 负向用例编译检查

**未发现**负向用例被错误地编译通过（识别为正向用例）的情况，因为当前全部用例均为正向用例。对应地，也未发现正向用例被误认为负向用例。

---

## 七、预期结果与运行结果一致性

**所有 14 个文件的预期运行结果均与 ECMA-262 定义的行为一致，未发现预期结果错误。**

具体检查方法：
- 正向追踪每个用例的输入值 → helper/实现函数 → 返回值 → 断言值
- 确认所有断言值与代码路径的实际计算结果一致
- 特别验证了以下易错点：
  - `Box<number>` 与 `Box<string>` 共享构造函数恒等 ✅
  - `Map.get(key)` 返回已 set 的值 ✅
  - `instanceof` 检查类型擦除后的原型链 ✅
  - `async/await` Promise 值传递 ✅
  - 跨语言函数调用返回值 ✅

---

## 八、按文件统计问题数

| 文件 | 恒真断言 | 弱断言 | 编码错误 | ECMA风险 | 缺少异常 | 合计 |
|------|---------|--------|---------|----------|---------|------|
| GenericFunctionTest | 2 | 1 | 0 | 0 | 很多 | 3+ |
| GenericClassTest | 2 | 2 | 0 | 0 | 很多 | 4+ |
| GenericInterfaceTest | 0 | 0 | 3 | 0 | 很多 | 3+ |
| GenericConstraintTest | 0 | 0 | 2 | 0 | 很多 | 2+ |
| GenericInheritanceTest | 0 | 1 | 2 | 0 | 很多 | 3+ |
| GenericOverrideTest | 0 | 0 | 8 | 0 | 很多 | 8+ |
| GenericOverloadTest | 0 | 0 | 0 | 0 | 很多 | 0+ |
| TypeParameter | 0 | 0 | 0 | 0 | 很多 | 0+ |
| TypeInference | 0 | 0 | 0 | 0 | 很多 | 0+ |
| DefaultTypeParameter | 0 | 0 | 1 | 0 | 很多 | 1+ |
| UtilityType | 0 | 0 | 2 | 2 | 很多 | 4+ |
| Variance | 2 | 0 | 2 | 0 | 很多 | 4+ |
| Interoperability | 0 | 1 | 0 | 2 | 很多 | 3+ |
| RuntimeABC | 0 | 0 | 0 | 1 | 很多 | 1+ |

---

## 九、优先修复建议

### 优先修复（编译阻塞）

1. **GenericOverrideTest**: 基类方法缺 `open`（8 处）→ 静态编译直接失败
2. **GenericUtilityTypeTest**: `Required<T>`/`Readonly<T>` 在 `.ets` 中使用 → 编译失败风险
3. **GenericVarianceTest**: 无变型标注下的协/逆变赋值 → 编译失败风险
4. **GenericConstraintTest**: `type` 别名在 `.ets` 中定义 → 编译失败风险

### 建议修复

5. **删除恒真断言**（8 处）：GenericFunctionTest(2) + GenericClassTest(2) + Variance(2) + LiveBinding(1) + CrossFeature(类似模式)
6. **合并拆分用例消除弱断言**（5 处）：GenericClassTest(2) + GenericFunction/Inheritance/Interop(3)
7. **修复非空断言 `!` 掩盖 undefined**（6 处）：GenericInterface(3) + GenericInheritance(2) + GenericConstraint(1)

### 后续补充

8. **补充异常/负向用例**：全部 14 个文件
9. **修复命名不一致**：DefaultTypeParameter

---

*报告生成日期: 2026-07-27*
