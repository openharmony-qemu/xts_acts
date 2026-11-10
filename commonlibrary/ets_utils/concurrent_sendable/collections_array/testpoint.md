# collections.Array 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/collections_array/entry/src/ohosTest/ets/test/` 下 **126** 个 `*.test.ets`，共解析 **3071** 条用例（`@tc.name` 计数 3071 与 `it()` 计数逐文件对齐）。解析采用 PYTHON 聚合（正则 `@tc.name`/`@tc.number`/`@tc.desc` + `it()`，`re.DOTALL`，按用例 `@tc.desc` 二级归类到真实方法）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.collections.d.ets` **L293–L1050**（`@Sendable class Array<T> implements ConcatArray<T>`）。
> **文档来源**：`docs/zh-cn/application-dev/reference/apis-arkts/arkts-apis-arkts-collections-Array.md`（仓库内同名列文件 `test/.../apis-arkts/arkts-apis-arkts-collections-Array.md`）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
collections.Array<T>  (@Sendable, implements ConcatArray<T>, since 12)
├── 1. 接口测试
│   ├── 构造与属性            constructor(×3 重载)/length(readonly)/[index]
│   ├── 静态方法              create / from(×4 重载) / isArray / of
│   ├── 原地变更 mutators     push/pop/shift/unshift/splice(×2)/fill/copyWithin/reverse/sort/shrinkTo/extendTo/retainAll(×3)
│   ├── 访问器 accessors      at/indexOf/lastIndexOf/includes/containsAll(×2)/find/findIndex/every/some/join/toString/toLocaleString
│   ├── 返回新数组 return-new slice/concat
│   └── 迭代器 iterators      [Symbol.iterator]/keys/values/entries/forEach/map/filter/reduce(×2)/reduceRight(×2)
├── 2. 稳定性                  （1000/1024/10250 大容量、循环创建销毁、超大 value）
├── 3. 性能                    （大规模 forEach/map/sort/concat 吞吐）
├── 4. 并发安全                 （TaskPool/Worker 跨线程引用、retainAll/containsAll/fill/copyWithin/splice 并发、10200201）
├── 5. 兼容性与继承            （@Sendable 子类化、二级继承链、方法覆写、跨线程 super 构造）
└── 6. 资料与文档符合性         （@Sendable 装饰、import、泛型 Sendable 约束、未声明方法测试越界）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

> **接口规模说明**：`Array<T>` 为大接口，共 **44 个成员**（1 属性 + 3 构造重载 + 7 静态重载 + 33 实例方法/重载），本报告 §1 按方法分组（构造与属性 / 静态 / mutators / accessors / 返回新数组 / 迭代器）给出脑图树 + 用例位置 + 测了哪些（因规模大，"测了哪些"逐方法简述）。

---

## 0.1 文件清单

> 共 126 个 `*.test.ets`（递归含 `All/`、`CollectionsArrayBaseTest/`、`CollectionsArrayConcurrentTest/`、`collections/`、`Normal/`、`TaskPool/`、`Concurrent/`、`concatArray/` 等子目录）。已排除 `List.test.ets`（聚合 re-export，0 条 `@tc.name`）、`Util.test.ets`（工具类，0 条用例且非 Array 用例）。下表按文件名主方法/分组归类。

### constructor（2 文件 / 52 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayConstructorTest.test.ets` | 17 |
| 2 | `CollectionsArrayBaseTest/ArrayConstructor.test.ets` | 35 |

### from（1 文件 / 8 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArraysFromTest.test.ets` | 8 |

### of（1 文件 / 28 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayOf.test.ets` | 28 |

### isArray（1 文件 / 27 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayIsArray.test.ets` | 27 |

### push（1 文件 / 23 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayPush.test.ets` | 23 |

### pop（1 文件 / 8 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayPop.test.ets` | 8 |

### shift（1 文件 / 7 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayShift.test.ets` | 7 |

### unshift（1 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayUnshift.test.ets` | 12 |

### splice（1 文件 / 22 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArraySplicesTest.test.ets` | 22 |

### fill（1 文件 / 35 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayFillsTest.test.ets` | 35 |

### copyWithin（1 文件 / 27 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayCopyWithinTest.test.ets` | 27 |

### reverse（2 文件 / 21 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayReverseTest.test.ets` | 12 |
| 2 | `All/CollectionsArrayToReversedTest.test.ets` | 9 |

### sort（2 文件 / 24 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArraySortsTest.test.ets` | 15 |
| 2 | `All/CollectionsArrayToSortedTest.test.ets` | 9 |

### retainAll（4 文件 / 75 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayContainsRetainAll.test.ets` | 20 |
| 2 | `CollectionsArrayRetainAllBuiltinTest.test.ets` | 18 |
| 3 | `CollectionsArrayRetainAllPredicateTest.test.ets` | 23 |
| 4 | `CollectionsArrayRetainAllSendableTest.test.ets` | 14 |

### at（2 文件 / 27 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayAtTest.test.ets` | 19 |
| 2 | `All/CollectionsArrayFlatTest.test.ets` | 8 |

### indexOf（2 文件 / 57 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayIndexOfTest.test.ets` | 32 |
| 2 | `All/CollectionsArrayLastIndexOfTest.test.ets` | 25 |

### includes（1 文件 / 21 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayIncludesTest.test.ets` | 21 |

### containsAll（2 文件 / 55 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayContainsAllBuiltinTest.test.ets` | 27 |
| 2 | `CollectionsArrayContainsAllSendableTest.test.ets` | 28 |

### find（2 文件 / 25 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayFindsIndexTest.test.ets` | 12 |
| 2 | `All/CollectionsArrayFindsTest.test.ets` | 13 |

### every（1 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayEveryTest.test.ets` | 12 |

### some（1 文件 / 15 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArraySomeTest.test.ets` | 15 |

### join（1 文件 / 17 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayJoinTest.test.ets` | 17 |

### toString（1 文件 / 9 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayToStringTest.test.ets` | 9 |

### toLocaleString（1 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayToLocaleStringTest.test.ets` | 12 |

### slice（1 文件 / 24 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArraySliceTest.test.ets` | 24 |

### concat（1 文件 / 23 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayConcatTest.test.ets` | 23 |

### map（2 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayFlatMapTest.test.ets` | 7 |
| 2 | `All/CollectionsArrayMapTest.test.ets` | 5 |

### filter（1 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayFiltersTest.test.ets` | 12 |

### keys（1 文件 / 3 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayKeysTest.test.ets` | 3 |

### values（1 文件 / 4 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayValues.test.ets` | 4 |

### entries（1 文件 / 14 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayEntriesTest.test.ets` | 14 |

### forEach（4 文件 / 19 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayForEachTest.test.ets` | 10 |
| 2 | `All/CollectionsArrayForEachEdgeTest.test.ets` | 2 |
| 3 | `All/CollectionsArrayThisArgTest.test.ets` | 4 |
| 4 | `All/CollectionsReceiverTypeCheckTest.test.ets` | 3 |

### reduceRight（1 文件 / 12 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayReduceRightTest.test.ets` | 12 |

### reduce（2 文件 / 16 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayReduceTest.test.ets` | 12 |
| 2 | `All/CollectionsArrayReduceEdgeTest.test.ets` | 4 |

### combination 综合（7 文件 / 544 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsArrayCombination1Test.test.ets` | 138 |
| 2 | `All/CollectionsArrayCombination2Test.test.ets` | 139 |
| 3 | `All/CollectionsArrayCombinationTestErr.test.ets` | 2 |
| 4 | `CollectionsArrayCombinationFourthTest.test.ets` | 37 |
| 5 | `CollectionsArrayCombinationSecondTest.test.ets` | 84 |
| 6 | `CollectionsArrayCombinationTest.test.ets` | 55 |
| 7 | `CollectionsArrayCombinationThirdTest.test.ets` | 89 |

### supplement 补充（1 文件 / 92 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArraySupplementTest.test.ets` | 92 |

### concurrent 并发（23 文件 / 187 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `ArrayConcurrent.test.ets` | 40 |
| 2 | `CollectionsArrayBaseTest/ArrayConcurrent.test.ets` | 4 |
| 3 | `CollectionsArrayConcurrentTest/ArrayConcurrentCreateFromTest.test.ets` | 4 |
| 4 | `CollectionsArrayConcurrentTest/ArrayConcurrentDataTypeTest.test.ets` | 5 |
| 5 | `CollectionsArrayConcurrentTest/ArrayConcurrentFillCopyWithinTest.test.ets` | 3 |
| 6 | `CollectionsArrayConcurrentTest/ArrayConcurrentForEachModifyTest.test.ets` | 9 |
| 7 | `CollectionsArrayConcurrentTest/ArrayConcurrentForEachTest.test.ets` | 2 |
| 8 | `CollectionsArrayConcurrentTest/ArrayConcurrentIteratorModifyTest.test.ets` | 6 |
| 9 | `CollectionsArrayConcurrentTest/ArrayConcurrentIteratorsTest.test.ets` | 4 |
| 10 | `CollectionsArrayConcurrentTest/ArrayConcurrentLargeArrayTest.test.ets` | 8 |
| 11 | `CollectionsArrayConcurrentTest/ArrayConcurrentLockTest.test.ets` | 3 |
| 12 | `CollectionsArrayConcurrentTest/ArrayConcurrentNoLockTest.test.ets` | 1 |
| 13 | `CollectionsArrayConcurrentTest/ArrayConcurrentPushPopTest.test.ets` | 7 |
| 14 | `CollectionsArrayConcurrentTest/ArrayConcurrentQueryFindTest.test.ets` | 3 |
| 15 | `CollectionsArrayConcurrentTest/ArrayConcurrentQueryIndexOfTest.test.ets` | 4 |
| 16 | `CollectionsArrayConcurrentTest/ArrayConcurrentSendableDataTest.test.ets` | 4 |
| 17 | `CollectionsArrayConcurrentTest/ArrayConcurrentSortReverseTest.test.ets` | 2 |
| 18 | `CollectionsArrayConcurrentTest/ArrayConcurrentSpliceTest.test.ets` | 3 |
| 19 | `CollectionsArrayConcurrentTest/ArrayConcurrentTraverseModifyTest.test.ets` | 2 |
| 20 | `CollectionsArrayConcurrentTest/ArrayConcurrentUnshiftShiftTest.test.ets` | 3 |
| 21 | `Concurrent/ArrayConcurrent.test.ets` | 46 |
| 22 | `collections/ConcurrentFactorComboTest.test.ets` | 21 |
| 23 | `All/CollectionsArrayConcurrentStrictTest.test.ets` | 3 |

### basic 基础/属性（3 文件 / 110 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `ArrayBasic.test.ets` | 83 |
| 2 | `CollectionsArrayBaseTest/ArrayAnnotation.test.ets` | 10 |
| 3 | `CollectionsArrayBaseTest/ArrayIndexAccess.test.ets` | 17 |

### complete 完整（1 文件 / 97 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `ArrayComplete.test.ets` | 97 |

### extended 扩展（1 文件 / 74 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `ArrayExtended.test.ets` | 74 |

### expand 扩容边界（2 文件 / 39 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayExpand1024Test.test.ets` | 22 |
| 2 | `TypedArrayExpand1024Test.test.ets` | 17 |

### taskpool 跨线程（1 文件 / 211 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `TaskPool/ArrayTaskPool.test.ets` | 211 |

### normal 常规（1 文件 / 286 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `Normal/ArrayNormal.test.ets` | 286 |

### containercombo 容器组合（1 文件 / 17 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `collections/ContainerComboTest.test.ets` | 17 |

### realworldcombo 真实场景（1 文件 / 15 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `collections/RealWorldComboTest.test.ets` | 15 |

### stress 压力稳定（2 文件 / 17 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `collections/StressStabilityComboTest.test.ets` | 15 |
| 2 | `All/CollectionsArrayStabilityTest.test.ets` | 2 |

### modify 原地变更组（1 文件 / 59 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayModify.test.ets` | 59 |

### query 访问器组（1 文件 / 63 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayQuery.test.ets` | 63 |

### transform 返回新数组组（1 文件 / 71 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayTransform.test.ets` | 71 |

### traversal 遍历组（1 文件 / 68 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayTraversal.test.ets` | 68 |

### operation 操作组（1 文件 / 37 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayOperation.test.ets` | 37 |

### add 异常码组（1 文件 / 14 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `ArrayAdd.test.ets` | 14 |

### Other/综合（3 文件 / 61 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `CollectionsArrayBaseTest/ArrayInheritance.test.ets` | 8 |
| 2 | `collections/ArrayInheritanceTest.test.ets` | 49 |
| 3 | `All/CollectionsArrayErrorPathTest.test.ets` | 4 |

### ConcatArray（相关接口）（22 文件 / 250 例）

| # | 文件 | 用例数 |
|---|------|:---:|
| 1 | `All/CollectionsConcatArrayIndexTest.test.ets` | 28 |
| 2 | `All/CollectionsConcatArrayJoinTest.test.ets` | 13 |
| 3 | `All/CollectionsConcatArrayLengthTest.test.ets` | 7 |
| 4 | `All/CollectionsConcatArraySliceTest.test.ets` | 11 |
| 5 | `CollectionsConcatArrayTest/CollectionsConcatArray.test.ets` | 37 |
| 6 | `Normal/ConcatArrayNormal.test.ets` | 25 |
| 7 | `TaskPool/ConcatArrayTaskPool.test.ets` | 25 |
| 8 | `concatArray/CollectionsConcatArrayExpand1024Test.test.ets` | 10 |
| 9 | `concatArray/ConcatArrayConcurrentTest.test.ets` | 7 |
| 10 | `concatArray/ConcatArrayImplTest.test.ets` | 14 |
| 11 | `concatArray/Typetest/ConcatArrayBigintTest.test.ets` | 10 |
| 12 | `concatArray/Typetest/ConcatArrayBooleanTest.test.ets` | 10 |
| 13 | `concatArray/Typetest/ConcatArrayDateTest.test.ets` | 3 |
| 14 | `concatArray/Typetest/ConcatArrayFunctionTest.test.ets` | 2 |
| 15 | `concatArray/Typetest/ConcatArrayMapTest.test.ets` | 2 |
| 16 | `concatArray/Typetest/ConcatArrayNestedTest.test.ets` | 3 |
| 17 | `concatArray/Typetest/ConcatArrayNumberTest.test.ets` | 10 |
| 18 | `concatArray/Typetest/ConcatArrayObjectTest.test.ets` | 6 |
| 19 | `concatArray/Typetest/ConcatArrayRegExpTest.test.ets` | 2 |
| 20 | `concatArray/Typetest/ConcatArraySetTest.test.ets` | 2 |
| 21 | `concatArray/Typetest/ConcatArrayStringTest.test.ets` | 12 |
| 22 | `concatArray/Typetest/ConcatArrayUnionTest.test.ets` | 11 |

| | **合计** | **3071** | 126 文件（已排除 List.test.ets / Util.test.ets） |

> **注**：`All/CollectionsArrayOf.test.ets`（28 例）文件名虽为 "Of"，但其 `@tc.desc` 全部为 "Testing isArray"，实际测试 `isArray`（用例已归入 isArray 计数，文件名误导）；`of` 方法真实专用用例仅 1 条（见 §1.2 与 §7.2）。
> **注**：`All/CollectionsArrayToReversedTest`、`CollectionsArrayToSortedTest`、`CollectionsArrayFillsTest`（with 段）、`CollectionsArrayFlatTest`、`CollectionsArrayFlatMapTest` 测试的 `toReversed`/`toSorted`/`with`/`flat`/`flatMap` **不在 `Array<T>` 接口声明内**（.d.ets L293–1050 与 .md 均无），属测试越界，见 §7.4。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/并发/继承文件」标注用例位置；用例数取自 PYTHON 用例级解析结果（按 `@tc.desc` 真实方法归类，非文件名）。大接口分组呈现。

## 1.1 构造与属性（constructor / length / [index]）

```
constructor & length & [index]
├── 入参范围覆盖
│   ├── constructor() 空构造
│   ├── (first,...left)
│   └── (...items)；length 随类型/增删；[index] 正负/越界
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── 1000/1024/10250 大容量
├── 异常与非法输入
│   └── constructor→10200012（内部不可达守卫）；[index] 越界→10200001；非 Sendable 泛型→运行错误
├── 返回值与类型验证
│   ├── instanceof collections.Array
│   ├── 空构造 length=0
│   └── [index] 元素正确
├── 组合场景
│   ├── from→constructor
│   ├── 子类 super 传参
│   └── 展开/解构
├── 重复调用幂等性
│   └── 相同 items 多次构造一致
└── 并发跨线程
    └── 子类构造体跨 TaskPool/Worker
```
- **用例位置**：`All/CollectionsArrayConstructorTest`（16）+ `CollectionsArrayBaseTest/ArrayConstructor`（35）；`length`/`[index]` 无独立文件，散落 `ArrayComplete`、`ArrayIndexAccess`、`ArrayBasic`、`CollectionsArrayExpand1024`、各综合套件；`[index]` 越界 10200001 专用：`ArrayBasic`（`SUB_..._BASIC_*` 段 `expect(e.code).assertEqual(10200001)`）+ `ArrayIndexAccess` 注释取证。
- **测了哪些**：3 构造重载 + length 增删一致性 + [index] 正/负/越界；10200001 越界覆盖（ArrayBasic 2 段 + IndexAccess）；constructor 10200012 仅 `ArrayComplete`（1 段 `expect(10200012).assertEqual(error.code)`）取证，且该码为内部不可达守卫（见 §7.4）。

## 1.2 静态方法（create / from / isArray / of）

```
static
├── create<T>(len, init)  ①长度×全类型初始值  ②0/负长度异常  ③10200011 bind  ④返回 Array<T>
├── from(arrayLike|iterable[, mapFn])  ①Array/Iterable/Map.values 源  ②空/null 源  ③非 Sendable→'Only accept sendable value'  ④mapFn 映射  ⑤返回新 Array
├── isArray(value)  ①Object/undefined/null/Array/非Array  ②true/false
└── of(...items)  ①变参构造  ②空参→空数组  ③返回新 Array
```
- **用例位置**：`create`（38 例：`ArrayComplete`/`ArrayNormal`/`ArrayConstructor`/`ArrayTaskPool`/`ArrayBasic`/`ConcurrentCreateFrom`）；`from`（42 例：`ArrayComplete`/`ArrayConstructor`/`ArrayNormal`/`ArrayTaskPool`/`ConcurrentCreateFrom` + 专用 `ArraysFromTest` 8）；`isArray`（67 例：`IsArrayTest` 27 + `Of.test` 28【文件名误导，实为 isArray】+ `Supplement` 9）；`of`（**仅 1 例**：`Supplement` 1）。
- **测了哪些**：create 全类型初始值 + 0/负长度 → `Parameter error.Invalid array length.`（Normal_1547/4308/4371）；from 非 Sendable → `Only accept sendable value`（Normal_1633/1742）+ mapFn 映射；isArray 全类型判定；**of 几近未测**（仅 1 例），见 §7.2。

## 1.3 原地变更 mutators（push / pop / shift / unshift / splice / fill / copyWithin / reverse / sort / shrinkTo / extendTo / retainAll）

```
mutators (in-place, return modified array or value)
├── push(...items)→number    pop()→T|undefined    shift()→T|undefined    unshift(...items)→number
├── splice(start[,del,...items])→Array<T>（被删元素新数组；原数组被改）
├── fill(value[,start,end])→Array<T>    copyWithin(target,start[,end])→Array<T>    reverse()→Array<T>（同引用）    sort(cmp?)→Array<T>（新数组）
├── shrinkTo(len)→void    extendTo(len,init)→void    retainAll(Array|readonly T[]|predicate)→boolean
├── ①入参范围：全类型元素（number/string/boolean/null/undefined/Sendable/BigInt）
├── ②边界值：空数组、单元素、负 start、deleteCount 越界、1024 扩容、shrinkTo/extendTo 0/当前长度/超大
├── ③异常：10200011 bind（mutators 多数有专用 detached，见 §7.2）；10200201 并发修改（forEach 内 mutator）
├── ④返回值：push/unshift→新 length；pop/shift→元素|undefined；splice→被删数组；fill/copyWithin/reverse→数组；sort→新数组；shrinkTo/extendTo→void；retainAll→boolean
├── ⑤组合：push→pop→shift→unshift 链；splice 删+插；fill 范围；retainAll 保留/移除
├── ⑥幂等：重复 push 同值 length 递增；重复 splice(0,0) 无变化
└── ⑦并发：retainAll/containsAll/fill/copyWithin/splice 并发（retainAllPredicate 散落 `code===0‖10200201` 弱断言，见 §7.3.8）
```
- **用例位置**：`push`(92 `PushTest`21+`Operation`13+`TaskPool`11+`Normal`9+`ContainerCombo`6)、`pop`(37)、`shift`(34)、`unshift`(36)、`splice`(64 `SplicesTest`20+`Normal`12+`TaskPool`12+`Modify`8+`ConcurrentSplice`3)、`fill`(44 `FillsTest`17+`Normal`10+`TaskPool`7+`Modify`4)、`copyWithin`(39 `CopyWithinTest`24+`Modify`7+`Normal`6)、`reverse`(18 `ReverseTest`9+`Modify`3+`Normal`3)、`sort`(40 `SortsTest`10+`Supplement`9+`Normal`5+`TaskPool`5)、`shrinkTo`(14)、`extendTo`(12)、`retainAll`(63 `RetainAllPredicate`19+`Builtin`18+`Sendable`14+`ContainsRetainAll`12)。
- **测了哪些**：全类型元素矩阵（BaseTest/Modify/Query/Transform/Traversal 5 个分组文件覆盖各 mutator×6 类型）；splice 返回被删数组断言（`SplicesTest_0100` `expect(c.toString()).assertEqual('3,4')`）；sort 返回新数组（.d.ets L481）但**无同引用/独立断言**；reverse 同引用契约**无断言**（见 §7.3.1）；retainAll 三重载 + 并发数据一致性（`RetainAllPredicate` 断言 `length/at(0..2)`，见 §7.3.8）。

## 1.4 访问器 accessors（at / indexOf / lastIndexOf / includes / containsAll / find / findIndex / every / some / join / toString / toLocaleString）

```
accessors (return value, no mutation)
├── at(idx)→T|undefined    indexOf(elt[,from])→number    lastIndexOf(elt[,from])→number    includes(elt[,from])→boolean
├── containsAll(Array|readonly T[])→boolean    find(pred)→T|undefined    findIndex(pred)→number    every(pred)→boolean    some(pred)→boolean
├── join(sep?)→string    toString()→string    toLocaleString()→string
├── ①入参范围：number/string/boolean/null/undefined/Sendable/BigInt/emoji/超长串
├── ②边界值：空数组、单元素、负 index/at(-1)、缺失元素、fromIndex 边界、NaN、±0
├── ③异常：10200011 bind（多数有专用，见 §7.2）；10200201 并发
├── ④返回值：at 越界→undefined；indexOf/lastIndexOf 未命中→-1；includes→false；find→undefined；findIndex→-1；every 空→true；some 空→false；join 默认逗号/空数组→空串
├── ⑤组合：find→value/indexOf 联动；every+some 互补；containsAll+retainAll 联动
├── ⑥幂等：重复 at/indexOf 同结果
└── ⑦并发：跨线程 at/indexOf/includes 查询
```
- **用例位置**：`at`(46 `AtTest`19+`Complete`6+`Normal`5+`TaskPool`5)、`indexOf`(56 `IndexOfTest`30+`Query`8+`Normal`7+`TaskPool`6+`ConcurrentQueryIndexOf`2)、`lastIndexOf`(43 `LastIndexOfTest`24+`Normal`10+`Query`8)、`includes`(49 `IncludesTest`20+`Query`8+`Normal`7)、`containsAll`(63 `ContainsAllSendable`28+`ContainsAllBuiltin`27+`ContainsRetainAll`8)、`find`(43 `FindsTest`12+`Query`8+`Supplement`8)、`findIndex`(34 `FindsIndexTest`12+`Query`8)、`every`(39 `EveryTest`11+`Normal`12+`Supplement`9+`Query`4)、`some`(32 `SomeTest`14+`Normal`12+`Query`4)、`join`(90 `JoinTest`17+`ConcatArrayNormal/TaskPool`各10+`Normal`9)、`toString`(34 `ToStringTest`6+`Transform`11+`Supplement`9)、`toLocaleString`(38 `ToLocaleStringTest`12+`Transform`10+`Supplement`8)。
- **测了哪些**：全类型查询矩阵；NaN 语义**已覆盖**（`Combination1Test_1567/1568` `includes(NaN).assertTrue()` + `indexOf(NaN).assertEqual(-1)`，印证 SameValueZero≠strict）；`at(-1)` 负索引覆盖（AtTest_83、Complete_1429）；空数组 every→true/some→false；containsAll 两重载（Sendable 源 + builtin 源）+ 并发 10200201 报文取证（`ContainsAllSendableTest_555`）。

## 1.5 返回新数组 return-new（slice / concat / map / filter）

```
return-new (non-mutating, return independent new Array)
├── slice(start?,end?)→Array<T>    concat(...items: ConcatArray<T>[])→Array<T>    map<U>(cb)→Array<U>    filter(pred)→Array<T>
├── ①入参范围：全类型元素、NaN/±0 作 start/end、concat 多源（Array/ConcatArray/空）
├── ②边界值：空数组、单元素、负 start/end、slice(NaN)、超长、1024 扩容、稀疏数组[1,,3]
├── ③异常：10200011 bind（slice/map/filter/concat 专用 detached，见 §7.2）；10200201 并发
├── ④返回值：新 Array 实例（**独立性未显式断言**，见 §7.3.1）；map<U> 类型变换；filter 元素保留
├── ⑤组合：slice().sort().reverse() 链；concat 多源拼接；map→filter 管道
├── ⑥幂等：重复 slice/concat/map 同结果
└── ⑦并发：跨线程 slice/concat/map
```
- **用例位置**：`slice`(140 `SliceTest`24+`Normal`17+`TaskPool`13+`ConcatArrayNormal/TaskPool`12+`ConcatArraySliceTest`10)、`concat`(55 `ConcatTest`23+`Transform`12+`Normal`4+`TaskPool`3)、`map`(66 `MapTest`5+`Extended`12+`Traversal`9+`Add`6+`Basic`6+`ThisArgTest`1+`ErrorPathTest`1+`ReduceEdgeTest`1)、`filter`(36 `FiltersTest`13+`Traversal`10+`Normal`4+`Extended`2+`ThisArgTest`1)。
- **测了哪些**：全类型 + 负索引 + NaN + 稀疏数组（`[1,,3]` 覆盖 slice/reduceRight/flatMap）；concat 多源；map 类型变换；filter 保留语义；**map/filter thisArg 上下文绑定**（`ThisArgTest`：@Sendable MultiplierHolder/ThresholdHolder 闭包访问）；**map 回调返回 non-Sendable→401**（`ErrorPathTest_011`）；**map/filter 回调 non-callable(42)→401**（`ErrorPathTest_048`）；**map 回调抛 TypeError 传播 + 原数组不变**（`ReduceEdgeTest_0012`）；**返回新数组的独立性（≠原引用 / 改原数组不影响结果）无显式断言**（grep 全树未见 `assertNotEqual(ref)` 或"改原→slice 不变"用例，见 §7.3.1）。

## 1.6 迭代器 iterators（[Symbol.iterator] / keys / values / entries / forEach / reduce / reduceRight）

```
iterators
├── [Symbol.iterator]()→IterableIterator<T>    keys()→IterableIterator<number>    values()→IterableIterator<T>    entries()→IterableIterator<[number,T]>
├── forEach(cb)→void    reduce(cb|cb+init)→T|U    reduceRight(cb|cb+init)→T|U
├── ①入参范围：全类型元素、回调三参(value,index,array)
├── ②边界值：空数组（forEach 不执行/empty）、单元素、1024 扩容、稀疏数组
├── ③异常：[Symbol.iterator]→10200011 only（无 10200201）；其余 10200011+10200201（forEach 内 mutator 见 §7.3.6）
├── ④返回值：IterableIterator、forEach→void、reduce→累加值、reduceRight 逆向累加
├── ⑤组合：entries→Map 构造；reduce 累加链；forEach→push 副作用
├── ⑥幂等：每次返回新迭代器（entries ⑥ 段 "Verify entries returns new iterator on each call"）
└── ⑦并发：跨线程迭代；10200201（forEach→forEach→sort 嵌套，Extended_0017）
```
- **用例位置**：`[Symbol.iterator]`(6 `Supplement`6)、`keys`(24 `KeysTest`3+`Traversal`8+`Extended`3)、`values`(122 `Modify`20+`Transform`18+`Traversal`14+`Query`12)、`entries`(29 `EntriesTest`14+`Traversal`4)、`forEach`(86 `Traversal`12+`Supplement`11+`ConcurrentForEachModify`9+`ForEachTest`10+`ConcurrentFactorCombo`5+`ForEachEdgeTest`2+`ThisArgTest`2+`ReceiverTypeCheckTest`3+`ConcurrentStrictTest`3+`ReduceEdgeTest`1)、`reduce`(44 `ReduceTest`12+`Traversal`11+`Extended`5+`ReduceEdgeTest`2+`ErrorPathTest`1)、`reduceRight`(25 `ReduceRightTest`12+`Transform`13)。
- **测了哪些**：迭代器新实例语义（entries ⑥ 段）；空 forEach 不执行；reduce 无初值（首元素为初值）+ 带初值 + **空数组无初值→TypeError/401**（`ReduceEdgeTest_0020`，原 SUP_ARRAY_REDUCE_EMPTY_NOINIT_001 缺口已补）+ **单元素无初值回调不调用**（`ReduceEdgeTest_0019`）；reduceRight 逆向；forEach 10200201 嵌套弱模式（`Extended_0017`）+ **严格断言**（`ConcurrentStrictTest_049~051`：跨线程 forEach+push 必报 10200201/10200001、forEach 回调内 push 必报、异常后容器仍可用 forEach+includes）+ **接收者类型检查 10200011**（`ReceiverTypeCheckTest_052~054`：plain object/builtin Array/SendableMap 接收者均拒）；**forEach/map/filter thisArg 上下文绑定**（`ThisArgTest`：@Sendable TagHolder/MultiplierHolder/ThresholdHolder 闭包访问）；**forEach 回调抛 Error 传播 + 异常后数组仍可用**（`ForEachEdgeTest`/`ReduceEdgeTest`）；**map 回调抛 TypeError 传播 + 原数组不变**（`ReduceEdgeTest_0012`）；**forEach→push 直接单路径严格 pin 已补**（`ConcurrentStrictTest_050`），splice/pop/shift/unshift/fill/copyWithin/reverse 单路径仍待补。

---

## 2. 稳定性（Stability）

- **大容量**：`CollectionsArrayExpand1024Test`/`TypedArrayExpand1024Test`（1024 扩容边界）、`Normal`/`TaskPool`（1000 级数组创建/销毁/传递）、`StressStabilityComboTest`（50 任务并发稳定性）。
- **超大 value/深嵌套**：`ContainerComboTest`/`RealWorldComboTest`（嵌套 Array/对象/循环引用承载）。
- **多轮确定性**：`CollectionsArrayStabilityTest.test.ets`（2 例，`STABILITY_0070~0071`）——10000 元素数组 map/filter 各执行 100 轮，每轮结果与第 1 轮 spot check（length + 首/中/末），验证大规模重复操作结果不漂移、无崩溃。

## 3. 性能（Performance）

- **大规模吞吐**：`Normal`/`TaskPool` 内 forEach/map/sort/concat 大循环（10000 级）；`StressStabilityComboTest` 50 任务并发吞吐。
- **大数量查询**：`IndexOfTest`/`LastIndexOfTest` 大数组查询性能（30/24 例）。

## 4. 并发安全（Concurrency Safety）

- **跨线程引用传递**：`TaskPool`/`Normal` 对位场景（Normal→TaskPool 同用例跨线程）、`Concurrent`、`ConcurrentFactorComboTest`。
- **10200201 并发修改**：`ArrayConcurrentForEachModifyTest`（forEach 内 mutator）、`ArrayConcurrentSpliceTest`、`ArrayConcurrentFillCopyWithinTest`、`ArrayConcurrentIteratorsTest`、`ArrayConcurrentCreateFromTest`、`ArrayConcurrentQueryIndexOfTest`、`ArrayConcurrentSortReverseTest`（并发专用套件 18 文件，覆盖 mutator/iterator/accessor/create+from 7 维度）。
- **retainAll/containsAll 并发**：`RetainAllPredicate/Builtin/Sendable`、`ContainsAllBuiltin/Sendable` 含并发段（**弱断言 `code===0‖10200201`**，见 §7.3.8）。
- **严格并发修改断言**：`CollectionsArrayConcurrentStrictTest.test.ets`（3 例，`CONCURRENT_STRICT_0049~0051`）——跨线程 forEach 遍历 + taskpool push 重叠必须报 10200201/10200001（strict：错误必须发生，非"正常完成 OR 错误"）；forEach 回调内 push 必报；异常捕获后容器仍可用（forEach 完成 + includes 正确）。补强原 §7.3.6 forEach→push 直接单路径缺口。

## 5. 兼容性与继承

- **子类化**：`collections/ArrayInheritanceTest`（49 例，子类 instanceof/原型链/super 构造/方法覆写/二级继承链）、`CollectionsArrayBaseTest/ArrayInheritance`（6 例）、`All/ArrayInheritance.test`（8 例）。
- **@Sendable 跨线程继承**：子类实例跨 TaskPool/Worker 共享、`extends collections.Array<T>` + `@Sendable`。
- **方法覆写**：覆写 push/forEach/toString 等，自定义 sumValues/average/doubleAll。

## 6. 资料与文档符合性

- **@Sendable 装饰**：`@Sendable class Array<T> implements ConcatArray<T>`（.d.ets L292–293），`ArrayAnnotation` 验证装饰语义。
- **import 可用性**：`import { collections } from '@kit.ArkTS'`（.md 导入模块段）。
- **泛型 Sendable 约束**：`from` 非 Sendable 泛型 → `Only accept sendable value`（Normal_1633/1742）。
- **未声明方法测试越界**：`toReversed`/`toSorted`/`with`/`flat`/`flatMap` 测试存在但**不在接口声明内**（⚠️/🔴 资料一致性缺口，见 §7.4）。

---

## 7.1 测试覆盖矩阵（接口 × 7 测试逻辑分类）

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor(×3) | ✅(17+35) | ✅(空/1000) | 🟡(10200012 仅1) | ✅(instanceof) | ✅ | 🟡 | ✅(继承) |
| length(readonly) | ✅ | ✅(1024/大容量) | ❌(只读无异常契约) | ✅(number) | ✅ | ✅ | ✅ |
| [index] | ✅ | ✅(负/越界) | ✅(10200001) | ✅(T) | ✅ | ✅ | 🟡 |
| create | ✅(38) | ✅(0/负长度) | ✅(401/10200011) | ✅(Array<T>) | ✅ | ✅ | ✅(ConcurrentCreateFrom) |
| from(×4) | ✅(42) | ✅(空/null源) | ✅(401/非Sendable/10200011) | ✅(新Array/mapFn) | ✅ | ✅ | ✅ |
| isArray | ✅(67) | ✅(null/undef) | 🟡(无异常契约) | ✅(boolean) | ✅ | ✅ | 🟡 |
| of | 🟡(仅1) | ❌ | ❌(无异常契约) | 🟡 | ❌ | ❌ | ❌ |
| push | ✅(94) | ✅(1024) | ✅(10200011/10200201) | ✅(新length) | ✅ | ✅ | ✅ |
| pop | ✅(38) | ✅(空→undef) | ✅(10200011/10200201) | ✅(T\|undef) | ✅ | ✅ | ✅ |
| shift | ✅(34) | ✅(空→undef) | ✅(10200011/10200201) | ✅(T\|undef) | ✅ | ✅ | ✅ |
| unshift | ✅(37) | ✅(1024) | ✅(10200201) | ✅(新length) | ✅ | ✅ | ✅ |
| splice(×2) | ✅(66) | ✅(负start/del越界) | ✅(10200011/10200201) | ✅(被删数组) | ✅ | ✅ | ✅(ConcurrentSplice) |
| fill | ✅(46) | ✅(范围/1024) | ✅(10200011/10200201) | ✅(数组) | ✅ | ✅ | ✅(ConcurrentFillCopyWithin) |
| copyWithin | ✅(42) | ✅(负target/start) | ✅(10200201) | ✅(数组) | ✅ | ✅ | ✅ |
| reverse | ✅(21) | ✅(空/单元素) | ✅(10200201) | 🟡(同引用未断言) | ✅ | ✅ | ✅(ConcurrentSortReverse) |
| sort | ✅(45) | ✅(空/单/已序) | ✅(10200011/10200201) | 🟡(新数组未断言) | ✅ | ✅ | ✅ |
| shrinkTo | ✅(14) | ✅(0/当前/超大) | ✅(401/10200201) | ✅(void) | ✅ | ✅ | 🟡 |
| extendTo | ✅(12) | ✅(0/当前/超大) | ✅(401/10200201) | ✅(void) | ✅ | ✅ | 🟡 |
| retainAll(×3) | ✅(65) | ✅(1024/10250) | ✅(10200011/10200201) | ✅(boolean) | ✅ | ✅ | 🟡(弱断言) |
| at | ✅(46) | ✅(负/越界→undef) | ✅(10200011/10200201) | ✅(T\|undef) | ✅ | ✅ | ✅ |
| indexOf | ✅(59) | ✅(fromIndex/NaN) | ✅(10200201) | ✅(-1) | ✅ | ✅ | ✅(ConcurrentQueryIndexOf) |
| lastIndexOf | ✅(43) | ✅(fromIndex) | ✅(10200201) | ✅(-1) | ✅ | ✅ | 🟡 |
| includes | ✅(50) | ✅(NaN/±0) | ✅(10200011/10200201) | ✅(boolean) | ✅ | ✅ | ✅ |
| containsAll(×2) | ✅(63) | ✅(1024) | ✅(10200011/10200201) | ✅(boolean) | ✅ | ✅ | 🟡(弱断言) |
| find | ✅(44) | ✅(空→undef) | ✅(10200011/10200201) | ✅(T\|undef) | ✅ | ✅ | ✅ |
| findIndex | ✅(34) | ✅(空→-1) | ✅(10200011/10200201) | ✅(-1) | ✅ | ✅ | 🟡 |
| every | ✅(40) | ✅(空→true) | ✅(10200011/10200201) | ✅(boolean) | ✅ | ✅ | 🟡 |
| some | ✅(33) | ✅(空→false) | ✅(10200201) | ✅(boolean) | ✅ | ✅ | 🟡 |
| join | ✅(90) | ✅(空→空串) | ✅(10200011/10200201) | ✅(string) | ✅ | ✅ | ✅ |
| toString | ✅(34) | ✅(空→空串) | ✅(10200011/10200201) | ✅(string) | ✅ | ✅ | 🟡 |
| toLocaleString | ✅(38) | ✅(空→空串) | ✅(10200011/10200201) | ✅(string) | ✅ | ✅ | 🟡 |
| slice | ✅(140) | ✅(负/NaN/稀疏) | ✅(10200011/10200201) | 🟡(独立性未断言) | ✅ | ✅ | ✅ |
| concat | ✅(55) | ✅(空/多源) | ✅(10200011/10200201/401) | 🟡(独立性未断言) | ✅ | ✅ | ✅ |
| [Symbol.iterator] | 🟡(6/间接) | 🟡 | ✅(10200011) | 🟡(IterableIterator) | 🟡 | 🟡 | 🟡 |
| keys | ✅(24) | ✅(空) | ✅(10200011/10200201) | ✅(IterableIterator) | ✅ | ✅ | 🟡 |
| values | ✅(122) | ✅(空) | ✅(10200011/10200201) | ✅(IterableIterator) | ✅ | ✅ | 🟡 |
| entries | ✅(29) | ✅(空/新迭代器) | ✅(10200011/10200201) | ✅(IterableIterator) | ✅ | ✅ | 🟡 |
| forEach | ✅(86) | ✅(空不执行/10000) | ✅(10200011 receiver+10200201 strict) | ✅(void/三参/thisArg) | ✅ | ✅ | ✅(ConcurrentForEachModify) |
| map | ✅(66) | ✅(空/类型变换) | ✅(10200011/10200201/non-Sendable→401/non-callable→401) | 🟡(独立性未断言) | ✅ | ✅ | ✅ |
| filter | ✅(36) | ✅(空/稀疏) | ✅(10200011/10200201/non-callable→401) | 🟡(独立性未断言) | ✅ | ✅ | 🟡 |
| reduce(×2) | ✅(44) | ✅(空无初值→TypeError/单元素无初值/稀疏) | ✅(10200011/10200201/non-callable→401) | ✅(累加值) | ✅ | ✅ | 🟡 |
| reduceRight(×2) | ✅(25) | ✅(空/无初值/稀疏) | ✅(10200011/10200201) | ✅(逆向累加) | ✅ | ✅ | 🟡 |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.collections.d.ets L293–1050）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论经实际测试代码 grep/采样复核（119 文件未逐全读，关键缺口均经定向 grep 取证，标注证据位置）。

### 构造与属性

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `length`（readonly, since 12） | 只读属性，无 @throws | ✅ 覆盖：随增删/clear/扩容/并发一致性（Complete/Supplement/Transform/Expand1024 散落断言）。无异常契约，无缺口。 |
| 2 | `constructor①()` / `②(first,...left)` / `③(...items)` | @throws 10200012 | ✅ 覆盖：3 重载 + 全类型（ConstructorTest 16 + ArrayConstructor 35 + 继承 6 + Normal/TaskPool 各 61）。🔴 **10200012 仅 1 段取证**（`ArrayComplete_132` `expect(10200012).assertEqual(error.code)`）且该码为内部不可达守卫（同 Map，见 §7.4）。❌ **401 未测**（SUP_ARRAY_CTOR_401_001）；⚠️ 401 未声明。 |
| 3 | `[index: number]` | @throws 10200001（越界） | ✅ 覆盖：正/负/越界，10200001 专用（`ArrayBasic` 2 段 `expect(e.code).assertEqual(10200001)` + `ArrayIndexAccess` 注释取证）。无缺口。 |

### 静态方法

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 4 | `static create<T>(len, init)` | @throws 10200011（12-17） | ✅ 覆盖（38 例）。0/负长度→`Parameter error.Invalid array length.`（Normal_1547/4308/4371）；401 专用（`Array create 401` desc）；10200011 专用（desc）。无缺口。 |
| 5 | `static from<T>(arrayLike\|iterable)` / `from<T>(...,mapFn)` / `from<U,T>(...)` ×4 | @throws 10200011（12-17，前两重载） | ✅ 覆盖（42 例）。非 Sendable→`Only accept sendable value`（Normal_1633/1742）；401 专用（`Array from 401`）；mapFn 映射（.md 示例 18+）。❌ **第 3/4 重载(mapFn) 10200011 detached 未独立**（与无 mapFn 重载共享方法对象，SUP_ARRAY_FROM_MAPFN_BIND_001）。 |
| 6 | `static isArray(value)` since 18 | 无 @throws | ✅ 覆盖（67 例，含 `Of.test` 28 例文件名误导）。全类型判定。无异常契约，无缺口。 |
| 7 | `static of<T>(...items)` since 18 | 无 @throws | 🔴 **几乎未测**（仅 1 例 `Supplement`）。变参构造/空参→空数组/返回新 Array 均无独立覆盖（SUP_ARRAY_OF_BASIC_001/002/003）。❌ 401 未测（SUP_ARRAY_OF_401_001）。 |

### 原地变更 mutators

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 8 | `push(...items)→number` | @throws 10200011, 10200201 | ✅ 覆盖（92 例）。新 length 返回、10200201（Concurrent）。❌ **10200011 detached 专用缺失**（desc 仅 21 方法有，push 不在列，SUP_ARRAY_PUSH_BIND_001）；❌ 401 未测；⚠️ 401 未声明。 |
| 9 | `pop()→T\|undefined` | @throws 10200011, 10200201 | ✅ 覆盖（37 例）。空→undefined。❌ **10200011 detached 专用缺失**（SUP_ARRAY_POP_BIND_001）；❌ 401 未测。 |
| 10 | `shift()→T\|undefined` | @throws 10200011, 10200201 | ✅ 覆盖（34 例）。✅ 10200011 专用（desc `Array shift 10200011`）。空→undefined。❌ 401 未测。 |
| 11 | `unshift(...items)→number` | @throws 10200011, 10200201 | ✅ 覆盖（36 例）。❌ **10200011 detached 专用缺失**（SUP_ARRAY_UNSHIFT_BIND_001）；❌ 401 未测。 |
| 12 | `splice(start)→Array<T>` / `splice(start,del,...items)→Array<T>` | @throws 10200011, 10200201；返回被删元素新数组 | ✅ 覆盖（64 例）。返回值断言（`SplicesTest_0100` `expect(c.toString()).assertEqual('3,4')`）；负 start/del 越界。✅ 10200011 专用（desc）。❌ **被删数组独立性（改被删数组不影响原数组）未断言**（SUP_ARRAY_SPLICE_RETURN_INDEP_001）；❌ 401 未测。 |
| 13 | `fill(value,start?,end?)→Array<T>` | @throws 10200011, 10200201；返回填充后数组 | ✅ 覆盖（44 例）。范围填充。✅ 10200011 专用。❌ **返回同引用（in-place）未断言** `result===arr`（SUP_ARRAY_FILL_SAMEREF_001）；❌ 401 未测。 |
| 14 | `copyWithin(target,start,end?)→Array<T>` | @throws 10200011, 10200201；返回修改后数组 | ✅ 覆盖（39 例）。负 target/start。❌ **10200011 detached 专用缺失**（SUP_ARRAY_COPYWITHIN_BIND_001）；❌ **返回同引用未断言**（SUP_ARRAY_COPYWITHIN_SAMEREF_001）；❌ 401 未测。 |
| 15 | `reverse()→Array<T>` | @throws 10200011, 10200201；.d.ets L932 "returns a reference to the same array" | ✅ 覆盖（18 例）。❌ **同引用契约（`result===arr`）未断言**（SUP_ARRAY_REVERSE_SAMEREF_001，grep 全树仅链式 `arr.reverse().filter()`，无 `===` 断言）；❌ 10200011 detached 专用缺失；❌ 401 未测。 |
| 16 | `sort(compareFn?)→Array<T>` | @throws 10200011, 10200201；.d.ets L481 "returns a new array" | ✅ 覆盖（40 例）。✅ 10200011 专用。comparator NaN 返回覆盖（`Combination1Test_647` `sort(() => NaN)`）。❌ **返回新数组独立性（≠原引用 / 原数组不变）未断言**（SUP_ARRAY_SORT_NEWARRAY_001）；❌ **稳定性（等值元素保序）未测**（SUP_ARRAY_SORT_STABILITY_001）；❌ comparator 抛 CustomError/返 ±Infinity/小数 未独立（SUP_ARRAY_SORT_CMP_EDGE_001）；❌ 401 未测。 |
| 17 | `shrinkTo(len)→void` | @throws 10200011, 10200201 | ✅ 覆盖（14 例）。0/当前/超大。✅ 401 专用（`Array shrinkTo 401`）。❌ 10200011 detached 专用缺失。 |
| 18 | `extendTo(len,init)→void` | @throws 10200011, 10200201 | ✅ 覆盖（12 例）。✅ 401 专用（`Array extendTo 401`）。❌ 10200011 detached 专用缺失。 |
| 19 | `retainAll(Array<T>\|readonly T[]\|predicate)→boolean` ×3 since 26.0.1 | @throws 10200011, 10200201 | ✅ 覆盖（63 例，3 重载各有专用文件）。10200011 专用（RetainAll* 3 段）；10200201 报文取证。🔴 **并发弱断言** `code===0‖10200201`（5 处，RetainAllPredicate_162 等，见 §7.3.8）；❌ 401 未测；⚠️ 401 未声明。 |

### 访问器 accessors

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 20 | `at(index)→T\|undefined` | @throws 10200011, 10200201 | ✅ 覆盖（46 例）。负索引 `at(-1)`（AtTest_83/Complete_1429）；越界→undefined。✅ 10200011 专用。❌ 401 未测。 |
| 21 | `indexOf(elt,from?)→number` | @throws 10200011, 10200201 | ✅ 覆盖（56 例）。未命中→-1；fromIndex 边界；**NaN→-1 已覆盖**（`Combination1Test_1568`）。❌ **10200011 detached 专用缺失**（SUP_ARRAY_INDEXOF_BIND_001）；❌ 401 未测。 |
| 22 | `lastIndexOf(elt,from?)→number` since 18 | @throws 10200011, 10200201 | ✅ 覆盖（43 例）。❌ 10200011 detached 专用缺失；❌ 401 未测。 |
| 23 | `includes(elt,from?)→boolean` | @throws 10200011, 10200201 | ✅ 覆盖（49 例）。**NaN→true 已覆盖**（`Combination1Test_1567` `includes(NaN).assertTrue()`，SameValueZero）。✅ 10200011 专用。❌ 401 未测。 |
| 24 | `containsAll(Array<T>)` / `containsAll(readonly T[])` ×2 since 26.0.1 | @throws 10200011, 10200201 | ✅ 覆盖（63 例，2 重载各有专用）。10200011 专用；10200201 报文取证（`ContainsAllSendableTest_555`）。🔴 并发弱断言（§7.3.8）；❌ 401 未测。 |
| 25 | `find(pred)→T\|undefined` | @throws 10200011, 10200201 | ✅ 覆盖（43 例）。空→undefined。✅ 10200011 专用。❌ 401 未测。 |
| 26 | `findIndex(pred)→number` | @throws 10200011, 10200201 | ✅ 覆盖（34 例）。空→-1。✅ 10200011 专用。❌ 401 未测。 |
| 27 | `every(pred)→boolean` since 18 | @throws 10200011, 10200201 | ✅ 覆盖（39 例）。空→true。✅ 10200011 专用。❌ 401 未测。 |
| 28 | `some(pred)→boolean` since 18 | @throws 10200011, 10200201 | ✅ 覆盖（32 例）。空→false。❌ 10200011 detached 专用缺失（SUP_ARRAY_SOME_BIND_001）；❌ 401 未测。 |
| 29 | `join(sep?)→string` | @throws 10200011, 10200201 | ✅ 覆盖（90 例）。默认逗号/空→空串。✅ 10200011 专用。❌ 401 未测。 |
| 30 | `toString()→string` since 18 | @throws 10200011, 10200201 | ✅ 覆盖（34 例）。✅ 10200011 专用。❌ 401 未测。 |
| 31 | `toLocaleString()→string` since 18 | @throws 10200011, 10200201 | ✅ 覆盖（38 例）。✅ 10200011 专用。❌ 401 未测。 |

### 返回新数组 return-new

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 32 | `slice(start?,end?)→Array<T>` | @throws 10200011, 10200201；返回新数组 | ✅ 覆盖（139 例）。负/NaN/稀疏。✅ 10200011 专用。🔴 **返回新数组独立性（≠原引用 / 改原数组不影响 slice 结果）未断言**（grep 全树未见 `assertNotEqual(ref)` 或"改原→slice 不变"用例，SUP_ARRAY_SLICE_INDEP_001）；❌ 401 未测。 |
| 33 | `concat(...items: ConcatArray<T>[])→Array<T>` | @throws 10200011, 10200201；返回新数组 | ✅ 覆盖（54 例）。多源拼接。✅ 401 专用（`Array concat 401`）。🔴 **返回新数组独立性未断言**（SUP_ARRAY_CONCAT_INDEP_001）。 |

### 迭代器 iterators

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 34 | `[Symbol.iterator]()` | @throws 10200011（仅此一码，无 10200201） | 🟡 覆盖（6 例 `Supplement`）。.d.ets 无"禁用 .ets"注明（与 Map 不同，可直接调用）。❌ **10200011 detached 专用缺失**（SUP_ARRAY_SYMBOL_ITER_BIND_001）；❌ for...of 消费/与 entries 一致性弱。 |
| 35 | `keys()→IterableIterator<number>` | @throws 10200011, 10200201 | ✅ 覆盖（24 例）。✅ 10200011 专用。❌ 401 不适用（无参）。 |
| 36 | `values()→IterableIterator<T>` | @throws 10200011, 10200201 | ✅ 覆盖（122 例）。✅ 10200011 专用。 |
| 37 | `entries()→IterableIterator<[number,T]>` | @throws 10200011, 10200201 | ✅ 覆盖（29 例）。✅ 新迭代器语义（⑥ 段 `Verify entries returns new iterator on each call`）。✅ 10200011 专用。 |
| 38 | `forEach(cb)→void` | @throws 10200011, 10200201 | ✅ 覆盖（86 例）。✅ 10200011 专用 + **接收者类型检查**（`ReceiverTypeCheckTest_052~054`：plain object/builtin Array/SendableMap 接收者→10200011）。**10200201 严格断言已补**（`ConcurrentStrictTest_049~051`：跨线程 forEach+push 必报 + 回调内 push 必报 + 异常后容器仍可用）；forEach→push 直接单路径已 pin，splice/pop/shift/unshift/fill/copyWithin/reverse 单路径仍待补（SUP_ARRAY_FOREACH_MOD_*_001，见 §7.3.6）；**401 non-callable callback 已测**（`ErrorPathTest_048`）；**thisArg 上下文绑定**（`ThisArgTest`）；⚠️ 401 已测未声明。 |
| 39 | `map<U>(cb)→Array<U>` | @throws 10200011, 10200201；返回新数组 | ✅ 覆盖（66 例）。✅ 10200011 专用。**401 已测**（`ErrorPathTest_011` 回调返回 non-Sendable→401 + `ErrorPathTest_048` non-callable→401）；**map 回调抛 TypeError 传播 + 原数组不变**（`ReduceEdgeTest_0012`）；**thisArg 上下文绑定**（`ThisArgTest`）；🔴 **返回新数组独立性未断言**（SUP_ARRAY_MAP_INDEP_001）；⚠️ 401 已测未声明。 |
| 40 | `filter(pred)→Array<T>` | @throws 10200011, 10200201；返回新数组 | ✅ 覆盖（36 例）。✅ 10200011 专用。**401 non-callable callback 已测**（`ErrorPathTest_048`）；**thisArg 上下文绑定**（`ThisArgTest`）；🔴 **返回新数组独立性未断言**（SUP_ARRAY_FILTER_INDEP_001）；⚠️ 401 已测未声明。 |
| 41 | `reduce(cb)→T` / `reduce<U>(cb,init)→U` ×2 | @throws 10200011, 10200201 | ✅ 覆盖（44 例）。无初值（首元素为初值）+ 带初值 + **空数组无初值→TypeError/401 已测**（`ReduceEdgeTest_0020`，原 SUP_ARRAY_REDUCE_EMPTY_NOINIT_001 已补）+ **单元素无初值回调不调用**（`ReduceEdgeTest_0019`）；稀疏。✅ 10200011 专用。**401 non-callable callback 已测**（`ErrorPathTest_048`）；⚠️ 401 已测未声明。 |
| 42 | `reduceRight(cb)→T` / `reduceRight<U>(cb,init)→U` ×2 since 18 | @throws 10200011, 10200201 | ✅ 覆盖（24 例）。逆向累加 + 稀疏。❌ **10200011 detached 专用缺失**（SUP_ARRAY_REDUCERIGHT_BIND_001）；❌ 空数组无初值→TypeError 未测；❌ 401 未测。 |

### 未声明方法（测试越界）

| # | 接口 | 契约要点 | 核查结论 |
|---|------|----------|----------|
| 43 | `toReversed`/`toSorted`/`with`/`flat`/`flatMap` | **.d.ets L293–1050 与 .md 均无声明** | 🔴 **测试越界**：`ToReversedTest`(9)/`ToSortedTest`(9)/`FillsTest`(with 段)/`ArraysFromTest`(with 段)/`FlatTest`(8)/`FlatMapTest`(6) 测试这些方法，但接口未声明。要么声明这些方法（若产品支持），要么移除/改造为"方法不存在"负向用例（见 §7.4.1、SUP_ARRAY_UNDECLARED_001）。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **返回新数组独立性（slice/map/filter/concat/sort）**：grep 全树未见任何 `assertNotEqual(ref)` 或"mutate 原数组后 slice/map/filter/concat 结果不变"断言；`slice().sort().reverse()` 链式用例存在（CombinationTest_1099/1117）但 mutate 的是 slice 结果，未断言原数组不变。.d.ets L481 明确 sort "returns a new array"、L465 slice "create an array"、L831 concat "New array generated"、L522 map "New array"、L537 filter "New array"。**5 个返回新数组契约均无独立性显式断言**（SUP_ARRAY_{SLICE,MAP,FILTER,CONCAT,SORT}_INDEP_001）。❌ 组合缺口（P1）。

2. **原地变更同引用返回（reverse/fill/copyWithin）**：.d.ets L932 reverse "returns a reference to the same array"、L775 fill "Filled array"、L911 copyWithin "ArkTS array after being modified"。grep 仅见链式 `arr.reverse().filter()`/`arr.fill(...).forEach()` 用法，**无 `result === arr` 同引用断言**（SUP_ARRAY_{REVERSE,FILL,COPYWITHIN}_SAMEREF_001）。❌ 组合缺口（P1）。

3. **splice 返回独立性**：被删元素数组 `c` 已断言内容（`SplicesTest_0100` `c.toString()==='3,4'`），但**改 `c` 不影响原数组**未断言（SUP_ARRAY_SPLICE_RETURN_INDEP_001）。🟡 部分缺口（P2）。

4. **NaN 语义（indexOf vs includes）**：✅ 已覆盖且印证 SameValueZero≠strict——`includes(NaN).assertTrue()`（Combination1Test_1567）+ `indexOf(NaN).assertEqual(-1)`（Combination1Test_1568）。✅ 全覆盖。

5. **空/稀疏数组**：✅ 空数组 forEach 不执行（ArrayTraversal ⑥ 段）、every→true/some→false/`find→undef`/`findIndex→-1`；稀疏 `[1,,3]` 覆盖 slice（ConcatArraySliceTest_99）/reduceRight（ReduceRightTest_117）/flatMap（FlatMapTest_72）。✅ 全覆盖。

6. **forEach 回调直接 mutator 单路径（10200201）**：`Extended_0017` 嵌套弱断言 + **`ConcurrentStrictTest_050` forEach→push 严格 pin 已补**（`assertEqual(10200201‖10200001)`，回调内 push 必报）；splice/pop/shift/unshift/fill/copyWithin/reverse 7 条直接单路径仍待独立 pin `assertEqual(10200201)`（SUP_ARRAY_FOREACH_MOD_{SPLICE,POP,SHIFT,UNSHIFT,FILL,COPYWITHIN,REVERSE}_001）。.d.ets 对 forEach 声明 10200201。🟡 部分缺口（P1，push 已补）。

7. **sort comparator 边界**：NaN 返回已覆盖（Combination1Test_647）；❌ **稳定性（等值保序）**、comparator 抛 CustomError、返 ±Infinity/小数 未独立（SUP_ARRAY_SORT_{STABILITY,CMP_THROW,CMP_EDGE}_001）。🟡 部分缺口（P2）。

8. **并发写写数据一致性**：`retainAll`/`containsAll` 并发段均断言 `code===0‖code===10200201`（5 处：RetainAllPredicate_162/Sendable_147,294/Builtin_126/ContainsAllSendable_173），"不抛即通过"掩盖真实数据损坏；**仅 RetainAllPredicate_500-503 有逐值 `length/at(0..2)` 断言**，其余多写者写写无逐键值正确性断言（SUP_ARRAY_CONC_{DISTINCT_KEYS,SAME_KEY}_001）。❌ P0 组合缺口。

9. **401 覆盖面**：create/from/concat/shrinkTo/extendTo 测 401（desc 取证）+ **forEach/map/filter/reduce non-callable callback→401 已测**（`ErrorPathTest_048`）+ **map 回调返回 non-Sendable→401 已测**（`ErrorPathTest_011`）；at/indexOf/lastIndexOf/includes/containsAll/find/findIndex/every/some/join/toString/toLocaleString/push/pop/shift/unshift/splice/fill/copyWithin/reverse/sort/retainAll/reduceRight 共 22 个带必填参数成员**仍无 401 测试**，且声明侧**全部未声明 401**（⚠️ 文档缺口，见 §7.4.2）。

10. **10200012 误标/不可达**：`ArrayExtended` 的 "Map 10200012"/"Set 10200012" 段为 Map/Set 越界测试（非 Array）；Array 10200012 仅 `ArrayComplete_132` 1 段取证。10200012 为内部不可达守卫（同 Map），见 §7.4.3。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **未声明方法测试越界（🔴）**：`toReversed`/`toSorted`/`with`/`flat`/`flatMap` 不在 `Array<T>` 接口声明（.d.ets L293–1050、.md 均无），但 `ToReversedTest`/`ToSortedTest`/`FillsTest`(with 段)/`ArraysFromTest`(with 段)/`FlatTest`/`FlatMapTest` 共 ~50 例测试之。建议：若产品支持，在 `.d.ets`+`.md` 补声明（含 @since/@throws）；若不支持，改造为"方法不存在/抛 TypeError"负向用例或移除（SUP_ARRAY_UNDECLARED_001）。

2. **401 未声明（⚠️ 文档缺口）**：`.d.ets` 对 26 个带必填参数成员均未 `@throws 401`，但产品实际对非法参数抛 401（create/from/concat/shrinkTo/extendTo 已验证）。建议在 `.d.ets` 与 `.md` 错误码表为上述成员补 `@throws BusinessError 401 - The parameter check failed.`，与 ArkTS 401 通用规范一致。同步增补测试（SUP_ARRAY_401_*，见补充设计 B 组）。

3. **10200012 不可达性说明**：10200012 "constructor cannot be directly invoked" 为内部守卫，从 .ets 正常 `new collections.Array()` 不可达。建议在 `.md` constructor 错误码说明补注"该错误码为内部直接调用守卫，应用层 `new` 构造不可触发"。Array 仅 1 段取证（ArrayComplete_132），建议补静态符合性证据（SUP_ARRAY_CTOR_10200012_EVIDENCE_001）。

4. **返回值契约语义注明**：`.d.ets` 对 sort（L481 "returns a new array"）与 reverse（L932 "returns a reference to the same array"）语义不对称（sort 新数组 vs reverse 同引用），fill/copyWithin 返回"修改后数组"（同引用）。建议 `.md` 各方法返回值说明显式标注"新数组（独立）/同引用（in-place）"，使测试侧有据可依（SUP_ARRAY_{SORT,REVERSE,FILL,COPYWITHIN}_SAMEREF/INDEP_001）。

5. **[Symbol.iterator] 可用性**：`.d.ets` L601–610 对 Array `[Symbol.iterator]` **无"禁用 .ets"注明**（与 Map L1108 不同），可在 .ets 直接调用。建议测试侧补直接调用 + detached 10200011 证据（SUP_ARRAY_SYMBOL_ITER_BIND_001）。

6. **forEach 并发修改契约**：`.md`/`.d.ets` 对 forEach 声明 10200201。建议测试侧将嵌套弱断言强化为直接单路径 `assertEqual(10200201)`，补 8 条 mutator 路径（F 组）。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 2 | SUP_ARRAY_CONC_DISTINCT_KEYS_001、SUP_ARRAY_CONC_SAME_KEY_001 | 多写者并发写写数据一致性——现有套件"不抛即通过"（`code===0‖10200201`）掩盖真实数据损坏，最高优先。 |
| **P1** | 36 | A 组 11（10200011 detached 补全 push/pop/unshift/copyWithin/reverse/indexOf/lastIndexOf/some/reduceRight/[Symbol.iterator]/from-mapFn）+ B 组 11（401 补全 ctor/of/push/splice/fill/copyWithin/sort/indexOf/includes/find/every）+ C 组 5（返回新数组独立性 slice/map/filter/concat/sort）+ D 组 3（同引用 reverse/fill/copyWithin）+ F 组 3（forEach 直接 mutator splice/pop/shift，**push 已补** `ConcurrentStrictTest_050`）+ G 组 3（of 基础覆盖） | 声明 @throws 但无直接证据、或返回值契约无断言、或弱断言无法检测回归、或方法几近未测；属契约符合性硬缺口。 |
| **P2** | 7 | E 组 3（sort 稳定性/comparator 抛错/comparator 边界）+ B 组 1（reverse 401 不适用标注）+ H 组 1（splice 返回独立性）+ J 组 1（10200012 不可达证据）+ K 组 1（未声明方法一致性）+ ~~I 组 1（reduce 空无初值 TypeError，**已补** `ReduceEdgeTest_0020`）~~ | 覆盖已存在但定位弱 / 契约边界 / 资料一致性；非阻断但提升套件质量。 |
| **合计** | **45 新增** | | P0=2 / P1=36 / P2=7；另有 B 扩展 14 成员、F 扩展 4 路径滚动补全（同模板）。原 47 项中 F 组 push（`ConcurrentStrictTest_050`）与 I 组 reduce 空无初值（`ReduceEdgeTest_0020`）已补。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（元素/回调/源数组/索引）遍历合法类型空间 | BaseTest(Modify/Query/Transform/Traversal) 6 类型矩阵、IndexOf/Includes 全类型查询 |
| ②边界值测试 | 空数组、单元素、容量阈值(1024)、极值(MAX_SAFE/NaN/±0/±Infinity/稀疏[1,,3])、大规模(1000/10250) | Expand1024、空数组、负索引/越界、稀疏数组用例 |
| ③异常与非法输入 | 非法参数(401)、构造失败(10200012)、detached bind(10200011)、并发修改(10200201)、越界(10200001)、非 Sendable | ArrayBasic/Extended/Supplement 异常码段、forEach 内 mutator |
| ④返回值与类型验证 | 返回值语义(undef/-1/boolean/void/新数组/同引用)、instanceof、显式类型捕获 | splice 被删数组、push 新 length、every/some boolean |
| ⑤组合场景 | 多接口串联(push→pop→shift)、跨 API 联动(find↔indexOf)、slice().sort().reverse() 链 | Normal/TaskPool 综合场景、Combination 组合套件 |
| ⑥重复调用幂等性 | 同操作连续调用结果稳定、不产生副作用膨胀 | 重复 push、splice(0,0) 无变化、每次返回新迭代器 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、retainAll/containsAll/fill/copyWithin/splice 并发、多写者竞态 | ArrayConcurrent* 7 专用套件、Concurrent/TaskPool/Normal 对位 |
