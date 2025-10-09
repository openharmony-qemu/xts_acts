import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { WeakSetTestUtils } from './WeakSetTestUtils.js'; // 导入JS验证工具



export default function WeakSetTest() {
  describe('WeakSetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })
    // Predefine enums in advance (ignore if already existing in the project):
    // const TestType = { FUNCTION: 1, COMPATIBILITY: 2, SCENARIO: 3 };
    // const Size = { SMALLTEST: 1, MEDIUMTEST: 2, LARGETEST: 3 };
    // const Level = { LEVEL1: 1, LEVEL2: 2, LEVEL3: 3 };


    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_001
     * @tc.name WeakSetPrimitiveKeyThrowErrorTest001
     * @tc.desc Verify WeakSet throws TypeError when adding primitive values (number/string/symbol/null/undefined/BigInt) as keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetPrimitiveKeyThrowErrorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test001_PrimitiveKeyThrowError();
      expect(result).assertEqual("Test Passed: WeakSetPrimitiveKeyThrowErrorTest001");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_002
     * @tc.name WeakSetWeakRefKeyGCTest002
     * @tc.desc Verify WeakSet holds weak references: key is GC'd when no strong references exist, has() returns false.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetWeakRefKeyGCTest002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test002_WeakRefKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetWeakRefKeyGCTest002");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_003
     * @tc.name WeakSetAddDuplicateKeyTest003
     * @tc.desc Verify WeakSet.add() does not throw error or duplicate entries when adding the same key (same reference) multiple times.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetAddDuplicateKeyTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test003_AddDuplicateKey();
      expect(result).assertEqual("Test Passed: WeakSetAddDuplicateKeyTest003");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_004
     * @tc.name WeakSetDeleteReturnTest004
     * @tc.desc Verify WeakSet.delete() returns true for existing keys and false for non-existing/deleted keys.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetDeleteReturnTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test004_DeleteReturnCorrectness();
      expect(result).assertEqual("Test Passed: WeakSetDeleteReturnTest004");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_005
     * @tc.name WeakSetHasDetectionTest005
     * @tc.desc Verify WeakSet.has() correctly detects key presence (true after add, false after delete).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetHasDetectionTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test005_HasCorrectDetection();
      expect(result).assertEqual("Test Passed: WeakSetHasDetectionTest005");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_006
     * @tc.name WeakSetNoSizePropertyTest006
     * @tc.desc Verify WeakSet has no 'size' property (returns undefined, cannot be assigned, not in own properties).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetNoSizePropertyTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test006_NoSizeProperty();
      expect(result).assertEqual("Test Passed: WeakSetNoSizePropertyTest006");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_007
     * @tc.name WeakSetNotIterableTest007
     * @tc.desc Verify WeakSet is not iterable: no [Symbol.iterator]/forEach/entries/keys/values methods, for...of throws TypeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetNotIterableTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test007_NotIterable();
      expect(result).assertEqual("Test Passed: WeakSetNotIterableTest007");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_008
     * @tc.name WeakSetAddChainingTest008
     * @tc.desc Verify WeakSet.add() returns the WeakSet instance itself, supporting method chaining (add multiple keys in sequence).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetAddChainingTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test008_AddChaining();
      expect(result).assertEqual("Test Passed: WeakSetAddChainingTest008");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_009
     * @tc.name WeakSetNullKeyThrowErrorTest009
     * @tc.desc Verify WeakSet throws TypeError when adding null as a key (null is typeof 'object' but invalid for WeakSet).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetNullKeyThrowErrorTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test009_NullKeyThrowError();
      expect(result).assertEqual("Test Passed: WeakSetNullKeyThrowErrorTest009");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_010
     * @tc.name WeakSetClosurePrivateStorageTest010
     * @tc.desc Verify WeakSet works as closure-private storage: external code cannot access the WeakSet, only internal class methods can operate it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetClosurePrivateStorageTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test010_ClosurePrivateStorage();
      expect(result).assertEqual("Test Passed: WeakSetClosurePrivateStorageTest010");
    });



    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_012
     * @tc.name WeakSetFrozenKeyPrototypeModTest012
     * @tc.desc Verify frozen object keys retain WeakSet association after prototype modification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetFrozenKeyPrototypeModTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test012_FrozenKeyPrototypeMod();
      expect(result).assertEqual("Test Passed: WeakSetFrozenKeyPrototypeModTest012");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_013
     * @tc.name WeakSetSealedKeyOperationsTest013
     * @tc.desc Verify sealed object keys support normal WeakSet operations (add/has/delete) despite sealed restrictions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetSealedKeyOperationsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test013_SealedKeyOperations();
      expect(result).assertEqual("Test Passed: WeakSetSealedKeyOperationsTest013");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_014
     * @tc.name WeakSetClassInstanceProtoModTest014
     * @tc.desc Verify class instance keys retain WeakSet association after prototype chain modification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetClassInstanceProtoModTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test014_ClassInstanceProtoMod();
      expect(result).assertEqual("Test Passed: WeakSetClassInstanceProtoModTest014");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_015
     * @tc.name WeakSetEmptyObjectKeyPropsTest015
     * @tc.desc Verify empty object keys retain WeakSet association after adding properties.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetEmptyObjectKeyPropsTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test015_EmptyObjectKeyProps();
      expect(result).assertEqual("Test Passed: WeakSetEmptyObjectKeyPropsTest015");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_016
     * @tc.name WeakSetSharedKeyMultiSetsGCTest016
     * @tc.desc Verify shared keys across multiple WeakSets are GC'd in all WeakSets when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetSharedKeyMultiSetsGCTest016', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test016_SharedKeyMultiWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetSharedKeyMultiSetsGCTest016");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_017
     * @tc.name WeakSetKeyInWeakMapGCTest017
     * @tc.desc Verify keys in both WeakSet and WeakMap are GC'd in both when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetKeyInWeakMapGCTest017', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test017_KeyInWeakMapWeakSetGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInWeakMapGCTest017");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_018
     * @tc.name WeakSetWithFinalizationRegistryTest018
     * @tc.desc Verify WeakSet key GC triggers FinalizationRegistry callback.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetWithFinalizationRegistryTest018', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test018_WeakSetWithFinalizationRegistry();
      expect(result).assertEqual("Test Passed: WeakSetWithFinalizationRegistryTest018");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_019
     * @tc.name WeakSetComplexAddChainingTest019
     * @tc.desc Verify complex add() chaining (add → delete → add) returns WeakSet instance consistently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetComplexAddChainingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test019_ComplexAddChaining();
      expect(result).assertEqual("Test Passed: WeakSetComplexAddChainingTest019");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_020
     * @tc.name WeakSetHasGCdKeyTest020
     * @tc.desc Verify has() returns false (no error) for GC'd keys.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetHasGCdKeyTest020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test020_HasGCdKey();
      expect(result).assertEqual("Test Passed: WeakSetHasGCdKeyTest020");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_021
     * @tc.name WeakSetDeleteGCdKeyTest021
     * @tc.desc Verify delete() returns false (no error) for GC'd keys.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetDeleteGCdKeyTest021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test021_DeleteGCdKey();
      expect(result).assertEqual("Test Passed: WeakSetDeleteGCdKeyTest021");
    });



    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_023
     * @tc.name WeakSetCrossScopeTest023
     * @tc.desc Verify WeakSet maintains consistent state across different function scopes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetCrossScopeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test023_CrossScopeWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetCrossScopeTest023");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_024
     * @tc.name WeakSetStaticClassTest024
     * @tc.desc Verify static class WeakSet tracks instances consistently across class methods.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetStaticClassTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test024_StaticClassWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetStaticClassTest024");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_025
     * @tc.name WeakSetBatchKeyGCTest025
     * @tc.desc Verify 10+ batch keys are GC'd when all strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetBatchKeyGCTest025', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test025_BatchKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetBatchKeyGCTest025");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_026
     * @tc.name WeakSetCircularRefKeyGCTest026
     * @tc.desc Verify circular reference keys are GC'd when external strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetCircularRefKeyGCTest026', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test026_CircularRefKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetCircularRefKeyGCTest026");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_027
     * @tc.name WeakSetWrappedSymbolKeyTest027
     * @tc.desc Verify wrapped Symbol objects (Object(Symbol())) are valid WeakSet keys, while primitive Symbols are not.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetWrappedSymbolKeyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test027_WrappedSymbolAsKey();
      expect(result).assertEqual("Test Passed: WeakSetWrappedSymbolKeyTest027");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_028
     * @tc.name WeakSetOverriddenProtoMethodsTest028
     * @tc.desc Verify overridden WeakSet prototype methods affect instance behavior (e.g., add() call tracking).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetOverriddenProtoMethodsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test028_OverriddenProtoMethods();
      expect(result).assertEqual("Test Passed: WeakSetOverriddenProtoMethodsTest028");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_029
     * @tc.name WeakSetMethodThisBindingTest029
     * @tc.desc Verify WeakSet methods (add/has/delete) throw when called with non-WeakSet `this` (via call()).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetMethodThisBindingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test029_MethodThisBinding();
      expect(result).assertEqual("Test Passed: WeakSetMethodThisBindingTest029");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_031
     * @tc.name WeakSetTypedArrayAsKeyTest031
     * @tc.desc Verify TypedArray instances as WeakSet keys: modifying buffer does not break association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetTypedArrayAsKeyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test031_TypedArrayAsKey();
      expect(result).assertEqual("Test Passed: WeakSetTypedArrayAsKeyTest031");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_032
     * @tc.name WeakSetErrorInstanceAsKeyTest032
     * @tc.desc Verify Error instances as WeakSet keys: modifying message/stack does not break association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetErrorInstanceAsKeyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test032_ErrorInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetErrorInstanceAsKeyTest032");
    });



    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_034
     * @tc.name WeakSetKeyInMultipleArraysGCTest034
     * @tc.desc Verify key referenced by multiple arrays is GC'd when all arrays are cleared.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetKeyInMultipleArraysGCTest034', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test034_KeyInMultipleArraysGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInMultipleArraysGCTest034");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_035
     * @tc.name WeakSetAddMultipleArgsTest035
     * @tc.desc Verify WeakSet.add() with multiple arguments processes only the first (valid) argument.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetAddMultipleArgsTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test035_AddMultipleArguments();
      expect(result).assertEqual("Test Passed: WeakSetAddMultipleArgsTest035");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_036
     * @tc.name WeakSetJsonStringifyTest036
     * @tc.desc Verify JSON.stringify(WeakSet) throws TypeError (WeakSet cannot be serialized).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetJsonStringifyTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test036_WeakSetJsonStringify();
      expect(result).assertEqual("Test Passed: WeakSetJsonStringifyTest036");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_037
     * @tc.name WeakSetKeyWithNullPrototypeTest037
     * @tc.desc Verify key objects with null prototype (Object.create(null)) work normally in WeakSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetKeyWithNullPrototypeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test037_KeyWithNullPrototype();
      expect(result).assertEqual("Test Passed: WeakSetKeyWithNullPrototypeTest037");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_038
     * @tc.name WeakSetTrackEventListenersTest038
     * @tc.desc Verify WeakSet tracks event listeners to avoid duplicate bindings (practical use case).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetTrackEventListenersTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test038_WeakSetTrackEventListeners();
      expect(result).assertEqual("Test Passed: WeakSetTrackEventListenersTest038");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_039
     * @tc.name WeakSetSameKeyTwoSetsGCTest039
     * @tc.desc Verify same key in two WeakSets is GC'd in both when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetSameKeyTwoSetsGCTest039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test039_SameKeyTwoWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetSameKeyTwoSetsGCTest039");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_040
     * @tc.name WeakSetDeleteNonObjectTest040
     * @tc.desc Verify WeakSet.delete() with non-object arguments returns false and does not throw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetDeleteNonObjectTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test040_DeleteNonObject();
      expect(result).assertEqual("Test Passed: WeakSetDeleteNonObjectTest040");
    });



    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_042
     * @tc.name WeakSetAsyncFunctionKeyGCTest042
     * @tc.desc Verify AsyncFunction instances as WeakSet keys are GC'd when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetAsyncFunctionKeyGCTest042', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test042_AsyncFunctionAsKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetAsyncFunctionKeyGCTest042");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_043
     * @tc.name WeakSetBatchSameStructKeysGCTest043
     * @tc.desc Verify batch same-structure (different references) keys are all GC'd when references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetBatchSameStructKeysGCTest043', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test043_BatchSameStructKeysGC();
      expect(result).assertEqual("Test Passed: WeakSetBatchSameStructKeysGCTest043");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_044
     * @tc.name WeakSetInPromiseAllTest044
     * @tc.desc Verify WeakSet maintains consistent state when modified in parallel via Promise.all.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetInPromiseAllTest044', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test044_WeakSetInPromiseAll();
      expect(result).assertEqual("Test Passed: WeakSetInPromiseAllTest044");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_045
     * @tc.name WeakSetProxyWrappedKeyTest045
     * @tc.desc Verify Proxy-wrapped keys retain WeakSet association when their target is modified.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetProxyWrappedKeyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test045_ProxyWrappedKeyTargetMod();
      expect(result).assertEqual("Test Passed: WeakSetProxyWrappedKeyTest045");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_046
     * @tc.name WeakSetAsTemporaryCacheGCTest046
     * @tc.desc Verify WeakSet used as temporary cache releases objects via GC (avoids memory leaks).
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetAsTemporaryCacheGCTest046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test046_WeakSetAsTemporaryCacheGC();
      expect(result).assertEqual("Test Passed: WeakSetAsTemporaryCacheGCTest046");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_047
     * @tc.name WeakSetInStrictModeTest047
     * @tc.desc Verify WeakSet behaves consistently in strict mode (no unexpected errors).
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetInStrictModeTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test047_WeakSetInStrictMode();
      expect(result).assertEqual("Test Passed: WeakSetInStrictModeTest047");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_048
     * @tc.name WeakSetGeneratorFunctionKeyGCTest048
     * @tc.desc Verify GeneratorFunction instances as WeakSet keys are GC'd when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetGeneratorFunctionKeyGCTest048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test048_GeneratorFunctionAsKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetGeneratorFunctionKeyGCTest048");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_049
     * @tc.name WeakSetAddImmediateDeleteTest049
     * @tc.desc Verify WeakSet.add() followed by immediate delete() results in the key not being present.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetAddImmediateDeleteTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test049_AddImmediateDelete();
      expect(result).assertEqual("Test Passed: WeakSetAddImmediateDeleteTest049");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_050
     * @tc.name WeakSetKeyWithFrozenPropsTest050
     * @tc.desc Verify key objects with partially frozen properties (not full object) retain WeakSet association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetKeyWithFrozenPropsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test050_KeyWithFrozenProps();
      expect(result).assertEqual("Test Passed: WeakSetKeyWithFrozenPropsTest050");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_051
     * @tc.name WeakSetMapInstanceAsKeyTest051
     * @tc.desc Verify Map instances as WeakSet keys: modifying entries (add/delete/update) does not break association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetMapInstanceAsKeyTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test051_MapInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetMapInstanceAsKeyTest051");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_052
     * @tc.name WeakSetSetInstanceAsKeyTest052
     * @tc.desc Verify Set instances as WeakSet keys: modifying values (add/delete) does not break association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetSetInstanceAsKeyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test052_SetInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetSetInstanceAsKeyTest052");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_053
     * @tc.name WeakSetKeyInternalCircularRefGCTest053
     * @tc.desc Verify keys with internal circular references (obj.self = obj) are GC'd when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetKeyInternalCircularRefGCTest053', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test053_KeyWithInternalCircularRefGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInternalCircularRefGCTest053");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_054
     * @tc.name WeakSetFrozenKeyMultiSetsGCTest054
     * @tc.desc Verify frozen keys shared across 3+ WeakSets are GC'd in all WeakSets when strong references are released.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetFrozenKeyMultiSetsGCTest054', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test054_FrozenKeyMultiWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetFrozenKeyMultiSetsGCTest054");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_055
     * @tc.name WeakSetSubclassInstanceAsKeyTest055
     * @tc.desc Verify subclass instances as WeakSet keys: parent method modifications do not break association.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetSubclassInstanceAsKeyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test055_SubclassInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetSubclassInstanceAsKeyTest055");
    });

    /**
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_056
     * @tc.name WeakSetBigIntObjectAsKeyTest056
     * @tc.desc Verify wrapped BigInt objects (Object(BigInt())) are valid WeakSet keys; primitive BigInt throws.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('WeakSetBigIntObjectAsKeyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test056_BigIntObjectAsKey();
      expect(result).assertEqual("Test Passed: WeakSetBigIntObjectAsKeyTest056");
    });

    /**
     * @tc.n