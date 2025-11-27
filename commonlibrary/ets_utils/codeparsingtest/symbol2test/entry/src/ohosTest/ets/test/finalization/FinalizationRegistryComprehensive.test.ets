/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

import { FinalizationRegistryComprehensiveUtils } from './finalizationRegistryComprehensiveUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryComprehensiveTest() {
  describe('FinalizationRegistryComprehensiveTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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


    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_001
     * @tc.name ConstructorRegisterGCCallbackTest001
     * @tc.desc Comprehensive: Constructor + register + GC (callback triggers with heldValue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConstructorRegisterGCCallbackTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test001_ConstructorRegisterGCCallback();
      expect(result).assertEqual("Test Passed: ConstructorRegisterGCCallbackTest001");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_002
     * @tc.name RegisterUnregisterGCTest002
     * @tc.desc Comprehensive: Register + unregister + GC (callback not triggered after unregister)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegisterUnregisterGCTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test002_RegisterUnregisterGC();
      expect(result).assertEqual("Test Passed: RegisterUnregisterGCTest002");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_003
     * @tc.name StrongReferenceHeldValueGCTest003
     * @tc.desc Comprehensive: Strong reference to heldValue (accessible after GC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('StrongReferenceHeldValueGCTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test003_StrongReferenceHeldValueGC();
      expect(result).assertEqual("Test Passed: StrongReferenceHeldValueGCTest003");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_004
     * @tc.name MultipleRegisterSameTargetGCTest004
     * @tc.desc Comprehensive: Multiple register same target + GC (last heldValue effective)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleRegisterSameTargetGCTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test004_MultipleRegisterSameTargetGC();
      expect(result).assertEqual("Test Passed: MultipleRegisterSameTargetGCTest004");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_005
     * @tc.name SymbolTargetTokenUnregisterGCTest005
     * @tc.desc Comprehensive: Symbol target + Symbol token + unregister + GC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SymbolTargetTokenUnregisterGCTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test005_SymbolTargetTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SymbolTargetTokenUnregisterGCTest005");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_006
     * @tc.name NoTokenRegisterGCTest006
     * @tc.desc Comprehensive: Register without token + GC (callback triggers, cannot unregister)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NoTokenRegisterGCTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test006_NoTokenRegisterGC();
      expect(result).assertEqual("Test Passed: NoTokenRegisterGCTest006");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_007
     * @tc.name CircularReferenceTargetGCTest007
     * @tc.desc Comprehensive: Circular reference target + GC (target recyclable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CircularReferenceTargetGCTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test007_CircularReferenceTargetGC();
      expect(result).assertEqual("Test Passed: CircularReferenceTargetGCTest007");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_008
     * @tc.name MultipleInstancesGCTest008
     * @tc.desc Comprehensive: Multiple instances + register + GC (independent callbacks)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleInstancesGCTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test008_MultipleInstancesGC();
      expect(result).assertEqual("Test Passed: MultipleInstancesGCTest008");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_009
     * @tc.name TargetLifecycleEndGCTest009
     * @tc.desc Comprehensive: Target lifecycle end + GC (original target recycled)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TargetLifecycleEndGCTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test009_TargetLifecycleEndGC();
      expect(result).assertEqual("Test Passed: TargetLifecycleEndGCTest009");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_010
     * @tc.name FrozenTargetRegisterGCTest010
     * @tc.desc Comprehensive: Frozen object target + register + GC (callback triggers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FrozenTargetRegisterGCTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test010_FrozenTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FrozenTargetRegisterGCTest010");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_011
     * @tc.name MultipleTargetsSameTokenUnregisterGCTest011
     * @tc.desc Comprehensive: Multiple targets + same token + unregister + GC (no trigger)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleTargetsSameTokenUnregisterGCTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test011_MultipleTargetsSameTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleTargetsSameTokenUnregisterGCTest011");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_012
     * @tc.name HeldValueAsNullRegisterGCTest012
     * @tc.desc Comprehensive: HeldValue as null (≠target) + register + GC (receives null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsNullRegisterGCTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test012_HeldValueAsNullRegisterGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNullRegisterGCTest012");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_013
     * @tc.name ClassInstanceTargetRegisterGCTest013
     * @tc.desc Comprehensive: Class instance target + register + GC (recyclable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ClassInstanceTargetRegisterGCTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test013_ClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ClassInstanceTargetRegisterGCTest013");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_014
     * @tc.name RegisterUnregisterReregisterGCTest014
     * @tc.desc Comprehensive: Register + unregister + reregister + GC (triggers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegisterUnregisterReregisterGCTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test014_RegisterUnregisterReregisterGC();
      expect(result).assertEqual("Test Passed: RegisterUnregisterReregisterGCTest014");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_015
     * @tc.name HeldValueAsNonRegisteredSymbolGCTest015
     * @tc.desc Comprehensive: HeldValue as non-registered Symbol + GC (receives Symbol)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsNonRegisteredSymbolGCTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test015_HeldValueAsNonRegisteredSymbolGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNonRegisteredSymbolGCTest015");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_016
     * @tc.name MultipleRoundRegisterUnregisterGCTest016
     * @tc.desc Comprehensive: Multiple rounds register-unregister + GC (no trigger)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleRoundRegisterUnregisterGCTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test016_MultipleRoundRegisterUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleRoundRegisterUnregisterGCTest016");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_017
     * @tc.name WeakSetTargetRegisterGCTest017
     * @tc.desc Comprehensive: WeakSet instance target + register + GC (triggers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetTargetRegisterGCTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test017_WeakSetTargetRegisterGC();
      expect(result).assertEqual("Test Passed: WeakSetTargetRegisterGCTest017");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_018
     * @tc.name CallbackModifyExternalVarGCTest018
     * @tc.desc Comprehensive: Callback modifies external variable + GC (var updated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CallbackModifyExternalVarGCTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test018_CallbackModifyExternalVarGC();
      expect(result).assertEqual("Test Passed: CallbackModifyExternalVarGCTest018");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_019
     * @tc.name DifferentTypeTargetsSameRegistryGCTest019
     * @tc.desc Comprehensive: Different type targets + same registry + GC (independent triggers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('DifferentTypeTargetsSameRegistryGCTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test019_DifferentTypeTargetsSameRegistryGC();
      expect(result).assertEqual("Test Passed: DifferentTypeTargetsSameRegistryGCTest019");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_020
     * @tc.name ClassInstanceTokenUnregisterGCTest020
     * @tc.desc Comprehensive: Class instance token + unregister + GC (no trigger)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ClassInstanceTokenUnregisterGCTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test020_ClassInstanceTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ClassInstanceTokenUnregisterGCTest020");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_021
     * @tc.name ProxyTargetRegisterGCTest021
     * @tc.desc 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProxyTargetRegisterGCTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test021_ProxyTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ProxyTargetRegisterGCTest021");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_022
     * @tc.name ProxyTargetRegisterGCTest022
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsResolvedPromiseGCTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test022_HeldValueAsResolvedPromiseGC();
      expect(result).assertEqual("Test Passed: HeldValueAsResolvedPromiseGCTest022");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_023
     * @tc.name ProxyTargetRegisterGCTest023
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SealedTargetRegisterGCTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test023_SealedTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SealedTargetRegisterGCTest023");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_024
     * @tc.name ProxyTargetRegisterGCTest024
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProxyTokenUnregisterGCTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test024_ProxyTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ProxyTokenUnregisterGCTest024");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_026
     * @tc.name ProxyTargetRegisterGCTest026
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('UnregisterEarlyTokenForSameTargetGCTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test026_UnregisterEarlyTokenForSameTargetGC();
      expect(result).assertEqual("Test Passed: UnregisterEarlyTokenForSameTargetGCTest026");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_027
     * @tc.name ProxyTargetRegisterGCTest027
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ErrorInstanceTargetRegisterGCTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test027_ErrorInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ErrorInstanceTargetRegisterGCTest027");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_029
     * @tc.name ProxyTargetRegisterGCTest029
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ErrorInstanceTokenUnregisterGCTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test029_ErrorInstanceTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ErrorInstanceTokenUnregisterGCTest029");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_030
     * @tc.name ProxyTargetRegisterGCTest030
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetInstanceTargetRegisterGCTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test030_SetInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SetInstanceTargetRegisterGCTest030");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_031
     * @tc.name ProxyTargetRegisterGCTest031
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsBigIntGCTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test031_HeldValueAsBigIntGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBigIntGCTest031");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_034
     * @tc.name ProxyTargetRegisterGCTest034
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsNaNGCTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test034_HeldValueAsNaNGCC();
      expect(result).assertEqual("Test Passed: HeldValueAsNaNGCTest034");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_035
     * @tc.name ProxyTargetRegisterGCTest035
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegExpInstanceTargetRegisterGCTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test035_RegExpInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RegExpInstanceTargetRegisterGCTest035");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_036
     * @tc.name ProxyTargetRegisterGCTest036
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CallbackThrowsErrorGCTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test036_CallbackThrowsErrorGC();
      expect(result).assertEqual("Test Passed: CallbackThrowsErrorGCTest036");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_037
     * @tc.name ProxyTargetRegisterGCTest037
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsInfinityGCTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test037_HeldValueAsInfinityGC();
      expect(result).assertEqual("Test Passed: HeldValueAsInfinityGCTest037");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_038
     * @tc.name ProxyTargetRegisterGCTest038
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedFrozenTargetRegisterGCTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test038_NestedFrozenTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NestedFrozenTargetRegisterGCTest038");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_039
     * @tc.name ProxyTargetRegisterGCTest039
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedSealedTokenUnregisterGCTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test039_NestedSealedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NestedSealedTokenUnregisterGCTest039");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_040
     * @tc.name ProxyTargetRegisterGCTest040
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsNestedObjectGCTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test040_HeldValueAsNestedObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNestedObjectGCTest040");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_041
     * @tc.name ProxyTargetRegisterGCTest041
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RejectedPromiseTargetRegisterGCTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test041_RejectedPromiseTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RejectedPromiseTargetRegisterGCTest041");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_042
     * @tc.name ProxyTargetRegisterGCTest042
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ResolvedPromiseTokenUnregisterGCTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test042_ResolvedPromiseTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ResolvedPromiseTokenUnregisterGCTest042");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_043
     * @tc.name ProxyTargetRegisterGCTest043
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsCircularObjectGCTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test043_HeldValueAsCircularObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCircularObjectGCTest043");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_046
     * @tc.name ProxyTargetRegisterGCTest046
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsParamFunctionGCTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test046_HeldValueAsParamFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsParamFunctionGCTest046");
    });




    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_049
     * @tc.name ProxyTargetRegisterGCTest049
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleRegistriesSameTokenUnregisterGCTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test049_MultipleRegistriesSameTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleRegistriesSameTokenUnregisterGCTest049");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_050
     * @tc.name ProxyTargetRegisterGCTest050
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsUndefinedGCTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test050_HeldValueAsUndefinedGC();
      expect(result).assertEqual("Test Passed: HeldValueAsUndefinedGCTest050");
    });




    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_053
     * @tc.name ProxyTargetRegisterGCTest053
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsRegisteredSymbolGCTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test053_HeldValueAsRegisteredSymbolGC();
      expect(result).assertEqual("Test Passed: HeldValueAsRegisteredSymbolGCTest053");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_055
     * @tc.name ProxyTargetRegisterGCTest055
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TargetReferencedByWeakMapThenReleasedGCTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test055_TargetReferencedByWeakMapThenReleasedGC();
      expect(result).assertEqual("Test Passed: TargetReferencedByWeakMapThenReleasedGCTest055");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_056
     * @tc.name ProxyTargetRegisterGCTest056
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueReferencedByWeakSetGCTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test056_HeldValueReferencedByWeakSetGC();
      expect(result).assertEqual("Test Passed: HeldValueReferencedByWeakSetGCTest056");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_057
     * @tc.name ProxyTargetRegisterGCTest057
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TokenDeepModifiedPropertiesUnregisterGCTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test057_TokenDeepModifiedPropertiesUnregisterGC();
      expect(result).assertEqual("Test Passed: TokenDeepModifiedPropertiesUnregisterGCTest057");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_058
     * @tc.name ProxyTargetRegisterGCTest058
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueReplacePrototypeChainGCTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test058_HeldValueReplacePrototypeChainGC();
      expect(result).assertEqual("Test Passed: HeldValueReplacePrototypeChainGCTest058");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_059
     * @tc.name ProxyTargetRegisterGCTest059
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonExtensibleTargetRegisterGCTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test059_NonExtensibleTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleTargetRegisterGCTest059");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_060
     * @tc.name ProxyTargetRegisterGCTest060
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonExtensibleTokenUnregisterGCTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test060_NonExtensibleTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleTokenUnregisterGCTest060");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_061
     * @tc.name ProxyTargetRegisterGCTest061
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultipleTargetsSequentialReleaseGCTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test061_MultipleTargetsSequentialReleaseGC();
      expect(result).assertEqual("Test Passed: MultipleTargetsSequentialReleaseGCTest061");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_064
     * @tc.name ProxyTargetRegisterGCTest064
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Delayed20msUnregisterGCTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test064_Delayed20msUnregisterGC();
      expect(result).assertEqual("Test Passed: Delayed20msUnregisterGCTest064");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_068
     * @tc.name ProxyTargetRegisterGCTest068
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ComplexIntlDateTimeFormatTargetRegisterGCTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test068_ComplexIntlDateTimeFormatTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ComplexIntlDateTimeFormatTargetRegisterGCTest068");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_070
     * @tc.name ProxyTargetRegisterGCTest070
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ComplexIntlCollatorTokenUnregisterGCTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test070_ComplexIntlCollatorTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ComplexIntlCollatorTokenUnregisterGCTest070");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_071
     * @tc.name ProxyTargetRegisterGCTest071
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultiLangIntlPluralRulesTargetRegisterGCTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test071_MultiLangIntlPluralRulesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: MultiLangIntlPluralRulesTargetRegisterGCTest071");
    });


    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_073
     * @tc.name ProxyTargetRegisterGCTest073
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MultiFormatIntlListFormatTokenUnregisterGCTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test073_MultiFormatIntlListFormatTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultiFormatIntlListFormatTokenUnregisterGCTest073");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_074
     * @tc.name ProxyTargetRegisterGCTest074
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('LargeUint16ArrayTargetRegisterGCTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test074_LargeUint16ArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: LargeUint16ArrayTargetRegisterGCTest074");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_075
     * @tc.name ProxyTargetRegisterGCTest075
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsFilledInt32ArrayGCTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test075_HeldValueAsFilledInt32ArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFilledInt32ArrayGCTest075");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_076
     * @tc.name ProxyTargetRegisterGCTest076
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RandomDataUint32ArrayTokenUnregisterGCTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test076_RandomDataUint32ArrayTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RandomDataUint32ArrayTokenUnregisterGCTest076");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_077
     * @tc.name ProxyTargetRegisterGCTest077
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PrecisionFloat32ArrayTargetRegisterGCTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test077_PrecisionFloat32ArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: PrecisionFloat32ArrayTargetRegisterGCTest077");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_078
     * @tc.name ProxyTargetRegisterGCTest078
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test078_HeldValueAsBigUint64ArrayWithLargeNumbersGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_079
     * @tc.name ProxyTargetRegisterGCTest079
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BigInt64ArrayWithPosNegTokenUnregisterGCTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test079_BigInt64ArrayWithPosNegTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: BigInt64ArrayWithPosNegTokenUnregisterGCTest079");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_080
     * @tc.name ProxyTargetRegisterGCTest080
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferWithSharedDataTargetRegisterGCTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test080_ArrayBufferWithSharedDataTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ArrayBufferWithSharedDataTargetRegisterGCTest080");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_081
     * @tc.name ProxyTargetRegisterGCTest081
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsSharedArrayBufferWithAtomicsGCTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test081_HeldValueAsSharedArrayBufferWithAtomicsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsSharedArrayBufferWithAtomicsGCTest081");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_082
     * @tc.name ProxyTargetRegisterGCTest082
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayBufferWithMultiViewTokenUnregisterGCTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test082_ArrayBufferWithMultiViewTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ArrayBufferWithMultiViewTokenUnregisterGCTest082");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_083
     * @tc.name ProxyTargetRegisterGCTest083
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProxyMapWithInterceptorTargetRegisterGCTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test083_ProxyMapWithInterceptorTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ProxyMapWithInterceptorTargetRegisterGCTest083");
    });


    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_086
     * @tc.name ProxyTargetRegisterGCTest086
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('UnregisterMiddleTokenForSameTargetGCTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test086_UnregisterMiddleTokenForSameTargetGC();
      expect(result).assertEqual("Test Passed: UnregisterMiddleTokenForSameTargetGCTest086");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_087
     * @tc.name ProxyTargetRegisterGCTest087
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsFunctionWithClosureGCTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test087_HeldValueAsFunctionWithClosureGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionWithClosureGCTest087");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_088
     * @tc.name ProxyTargetRegisterGCTest088
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomPrototypeChainTargetRegisterGCTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test088_CustomPrototypeChainTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomPrototypeChainTargetRegisterGCTest088");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_089
     * @tc.name ProxyTargetRegisterGCTest089
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TokenWithModifiedMethodUnregisterGCTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test089_TokenWithModifiedMethodUnregisterGC();
      expect(result).assertEqual("Test Passed: TokenWithModifiedMethodUnregisterGCTest089");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_090
     * @tc.name ProxyTargetRegisterGCTest090
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsWeakSetWithMultiObjectsGCTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test090_HeldValueAsWeakSetWithMultiObjectsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsWeakSetWithMultiObjectsGCTest090");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_091
     * @tc.name ProxyTargetRegisterGCTest091
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test091_AggregateErrorWithMultiErrorTypesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_092
     * @tc.name ProxyTargetRegisterGCTest092
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test092_ReferenceErrorTokenWithModifiedPropsUnregisterGC();
      expect(result).assertEqual("Test Passed: ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_093
     * @tc.name ProxyTargetRegisterGCTest093
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsDateWithModifiedTimeGCTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test093_HeldValueAsDateWithModifiedTimeGC();
      expect(result).assertEqual("Test Passed: HeldValueAsDateWithModifiedTimeGCTest093");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_094
     * @tc.name ProxyTargetRegisterGCTest094
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test094_RegExpWithMULTILINECaseInsensitiveTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_095
     * @tc.name ProxyTargetRegisterGCTest095
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetWithRemovedElementsTokenUnregisterGCTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test095_SetWithRemovedElementsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithRemovedElementsTokenUnregisterGCTest095");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_096
     * @tc.name ProxyTargetRegisterGCTest096
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsMapWithModifiedEntriesGCTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test096_HeldValueAsMapWithModifiedEntriesGC();
      expect(result).assertEqual("Test Passed: HeldValueAsMapWithModifiedEntriesGCTest096");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_097
     * @tc.name ProxyTargetRegisterGCTest097
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakMapWithRemovedKeysTargetRegisterGCTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test097_WeakMapWithRemovedKeysTargetRegisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithRemovedKeysTargetRegisterGCTest097");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_098
     * @tc.name ProxyTargetRegisterGCTest098
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonGlobalSymbolTokenUnregisterGCTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test098_NonGlobalSymbolTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NonGlobalSymbolTokenUnregisterGCTest098");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_099
     * @tc.name ProxyTargetRegisterGCTest099
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsArrowFunctionWithDefaultParamsGCTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test099_HeldValueAsArrowFunctionWithDefaultParamsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsArrowFunctionWithDefaultParamsGCTest099");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_100
     * @tc.name ProxyTargetRegisterGCTest100
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('DynamicMultiMethodObjectTargetRegisterGCTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test100_DynamicMultiMethodObjectTargetRegisterGC();
      expect(result).assertEqual("Test Passed: DynamicMultiMethodObjectTargetRegisterGCTest100");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_101
     * @tc.name ProxyTargetRegisterGCTest101
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FrozenObjectTokenUnregisterGCTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test101_FrozenObjectTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: FrozenObjectTokenUnregisterGCTest101");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_102
     * @tc.name ProxyTargetRegisterGCTest102
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsComplexCircularObjectGCTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test102_HeldValueAsComplexCircularObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsComplexCircularObjectGCTest102");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_103
     * @tc.name ProxyTargetRegisterGCTest103
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectWithGetterSetterTargetRegisterGCTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test103_ObjectWithGetterSetterTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ObjectWithGetterSetterTargetRegisterGCTest103");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_104
     * @tc.name ProxyTargetRegisterGCTest104
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomClassWithStaticMethodTokenUnregisterGCTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test104_CustomClassWithStaticMethodTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: CustomClassWithStaticMethodTokenUnregisterGCTest104");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_105
     * @tc.name ProxyTargetRegisterGCTest105
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsRejectedPromiseErrorGCTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test105_HeldValueAsRejectedPromiseErrorGC();
      expect(result).assertEqual("Test Passed: HeldValueAsRejectedPromiseErrorGCTest105");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_106
     * @tc.name ProxyTargetRegisterGCTest106
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedArrayWithMixedValuesTargetRegisterGCTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test106_NestedArrayWithMixedValuesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NestedArrayWithMixedValuesTargetRegisterGCTest106");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_107
     * @tc.name ProxyTargetRegisterGCTest107
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegExpWithGlobalFlagUsedTokenUnregisterGCTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test107_RegExpWithGlobalFlagUsedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RegExpWithGlobalFlagUsedTokenUnregisterGCTest107");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_108
     * @tc.name ProxyTargetRegisterGCTest108
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsCustomClassSingletonGCTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test108_HeldValueAsCustomClassSingletonGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCustomClassSingletonGCTest108");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_109
     * @tc.name ProxyTargetRegisterGCTest109
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectMethodWithClosureTargetRegisterGCTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test109_ObjectMethodWithClosureTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ObjectMethodWithClosureTargetRegisterGCTest109");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_110
     * @tc.name ProxyTargetRegisterGCTest110
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('UTCDateTokenUnregisterGCTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test110_UTCDateTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: UTCDateTokenUnregisterGCTest110");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_111
     * @tc.name ProxyTargetRegisterGCTest111
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsSetWithSymbolAndObjectsGCTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test111_HeldValueAsSetWithSymbolAndObjectsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsSetWithSymbolAndObjectsGCTest111");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_112
     * @tc.name ProxyTargetRegisterGCTest112
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapWithDateKeysTargetRegisterGCTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test112_MapWithDateKeysTargetRegisterGC();
      expect(result).assertEqual("Test Passed: MapWithDateKeysTargetRegisterGCTest112");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_113
     * @tc.name ProxyTargetRegisterGCTest113
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetWithCustomClassInstancesTokenUnregisterGCTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test113_WeakSetWithCustomClassInstancesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakSetWithCustomClassInstancesTokenUnregisterGCTest113");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_114
     * @tc.name ProxyTargetRegisterGCTest114
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsFunctionWithRestParamsGCTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test114_HeldValueAsFunctionWithRestParamsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionWithRestParamsGCTest114");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_115
     * @tc.name ProxyTargetRegisterGCTest115
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonExtensibleAndSealedTargetRegisterGCTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test115_NonExtensibleAndSealedTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleAndSealedTargetRegisterGCTest115");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_116
     * @tc.name ProxyTargetRegisterGCTest116
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsBoundFunctionGCTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test116_HeldValueAsBoundFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBoundFunctionGCTest116");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_117
     * @tc.name ProxyTargetRegisterGCTest117
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomErrorClassInstanceTargetRegisterGCTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test117_CustomErrorClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomErrorClassInstanceTargetRegisterGCTest117");
    });


    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_119
     * @tc.name ProxyTargetRegisterGCTest119
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsClassPrivateMethodViaClosureGCTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test119_HeldValueAsClassPrivateMethodViaClosureGC();
      expect(result).assertEqual("Test Passed: HeldValueAsClassPrivateMethodViaClosureGCTest119");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_120
     * @tc.name ProxyTargetRegisterGCTest120
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FlattenedNestedArrayTargetRegisterGCTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test120_FlattenedNestedArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FlattenedNestedArrayTargetRegisterGCTest120");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_121
     * @tc.name ProxyTargetRegisterGCTest121
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakMapWithCustomClassKeysTokenUnregisterGCTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test121_WeakMapWithCustomClassKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithCustomClassKeysTokenUnregisterGCTest121");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_122
     * @tc.name ProxyTargetRegisterGCTest122
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsLargeBigIntGCTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test122_HeldValueAsLargeBigIntGC();
      expect(result).assertEqual("Test Passed: HeldValueAsLargeBigIntGCTest122");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_123
     * @tc.name ProxyTargetRegisterGCTest123
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FilledFixedValueArrayTargetRegisterGCTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test123_FilledFixedValueArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FilledFixedValueArrayTargetRegisterGCTest123");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_124
     * @tc.name ProxyTargetRegisterGCTest124
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ObjectWithSymbolPropertiesTokenUnregisterGCTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test124_ObjectWithSymbolPropertiesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ObjectWithSymbolPropertiesTokenUnregisterGCTest124");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_125
     * @tc.name ProxyTargetRegisterGCTest125
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsPromiseFinallyBoundFunctionGCTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test125_HeldValueAsPromiseFinallyBoundFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsPromiseFinallyBoundFunctionGCTest125");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_126
     * @tc.name ProxyTargetRegisterGCTest126
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('InheritedMapCustomClassInstanceTargetRegisterGCTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test126_InheritedMapCustomClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: InheritedMapCustomClassInstanceTargetRegisterGCTest126");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_127
     * @tc.name ProxyTargetRegisterGCTest127
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegExpUnicodeComplexPatternTokenUnregisterGCTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test127_RegExpUnicodeComplexPatternTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RegExpUnicodeComplexPatternTokenUnregisterGCTest127");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_128
     * @tc.name ProxyTargetRegisterGCTest128
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsFilteredArrayGCTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test128_HeldValueAsFilteredArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFilteredArrayGCTest128");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_129
     * @tc.name ProxyTargetRegisterGCTest129
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CustomClassWithStaticPropertiesTargetRegisterGCTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test129_CustomClassWithStaticPropertiesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomClassWithStaticPropertiesTargetRegisterGCTest129");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_130
     * @tc.name ProxyTargetRegisterGCTest130
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakSetWithErrorInstancesTokenUnregisterGCTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test130_WeakSetWithErrorInstancesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakSetWithErrorInstancesTokenUnregisterGCTest130");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_131
     * @tc.name ProxyTargetRegisterGCTest131
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsMappedArrayGCTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test131_HeldValueAsMappedArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsMappedArrayGCTest131");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_132
     * @tc.name ProxyTargetRegisterGCTest132
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayOfDateObjectsTargetRegisterGCTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test132_ArrayOfDateObjectsTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ArrayOfDateObjectsTargetRegisterGCTest132");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_133
     * @tc.name ProxyTargetRegisterGCTest133
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapWithBigIntKeysTokenUnregisterGCTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test133_MapWithBigIntKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MapWithBigIntKeysTokenUnregisterGCTest133");
    });
    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_134
     * @tc.name ProxyTargetRegisterGCTest134
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsReducedArrayResultGCTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test134_HeldValueAsReducedArrayResultGC();
      expect(result).assertEqual("Test Passed: HeldValueAsReducedArrayResultGCTest134");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_135
     * @tc.name ProxyTargetRegisterGCTest135
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('InheritedClassWithPrivateFieldsTargetRegisterGCTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test135_InheritedClassWithPrivateFieldsTargetRegisterGC();
      expect(result).assertEqual("Test Passed: InheritedClassWithPrivateFieldsTargetRegisterGCTest135");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_136
     * @tc.name ProxyTargetRegisterGCTest136
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetWithBigIntSymbolMixedTokenUnregisterGCTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test136_SetWithBigIntSymbolMixedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithBigIntSymbolMixedTokenUnregisterGCTest136");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_137
     * @tc.name ProxyTargetRegisterGCTest137
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsFunctionCallBoundContextGCTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test137_HeldValueAsFunctionCallBoundContextGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionCallBoundContextGCTest137");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_138
     * @tc.name ProxyTargetRegisterGCTest138
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SortedArrayTargetRegisterGCTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test138_SortedArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SortedArrayTargetRegisterGCTest138");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_139
     * @tc.name ProxyTargetRegisterGCTest139
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayWithPrototypeMethodsTokenUnregisterGCTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test139_ArrayWithPrototypeMethodsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ArrayWithPrototypeMethodsTokenUnregisterGCTest139");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_140
     * @tc.name ProxyTargetRegisterGCTest140
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsCustomIteratorGCTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test140_HeldValueAsCustomIteratorGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCustomIteratorGCTest140");
    });


    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_142
     * @tc.name ProxyTargetRegisterGCTest142
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('WeakMapWithDateKeysTokenUnregisterGCTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test142_WeakMapWithDateKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithDateKeysTokenUnregisterGCTest142");
    });

    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_143
     * @tc.name ProxyTargetRegisterGCTest143
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('HeldValueAsArrayJoinedStringGCTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test143_HeldValueAsArrayJoinedStringGC();
      expect(result).assertEqual("Test Passed: HeldValueAsArrayJoinedStringGCTest143");
    });



    /**
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_145
     * @tc.name ProxyTargetRegisterGCTest145
     * @tc.desc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetWithDateObjectsTokenUnregisterGCTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test145_SetWithDateObjectsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithDateObjectsTokenUnregisterGCTest145");
    });
  })
}