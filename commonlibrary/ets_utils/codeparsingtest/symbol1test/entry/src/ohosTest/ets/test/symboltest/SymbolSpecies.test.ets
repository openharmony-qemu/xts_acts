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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SymbolSpeciesStandaloneTestUtils } from './symbolSpeciesStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolSpeciesTestTest() {
  describe('SymbolSpeciesTest', () => {
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
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_001
     * @tc.name ArrayDefaultSymbolSpeciesTest001
     * @tc.desc Verify Array's default Symbol.species returns Array instance via map()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayDefaultSymbolSpeciesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test001_ArrayDefaultSymbolSpecies();
      expect(result).assertEqual("Test Passed: ArrayDefaultSymbolSpeciesTest001");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_002
     * @tc.name SubclassOverrideSpeciesReturnParentTest002
     * @tc.desc Verify subclass overrides Symbol.species to return parent Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SubclassOverrideSpeciesReturnParentTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test002_SubclassOverrideSpeciesReturnParent();
      expect(result).assertEqual("Test Passed: SubclassOverrideSpeciesReturnParentTest002");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_003
     * @tc.name SubclassRetainSpeciesAsSelfTest003
     * @tc.desc Verify subclass retains Symbol.species as self, returns subclass instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SubclassRetainSpeciesAsSelfTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test003_SubclassRetainSpeciesAsSelf();
      expect(result).assertEqual("Test Passed: SubclassRetainSpeciesAsSelfTest003");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_004
     * @tc.name NonFunctionSpeciesThrowsTest004
     * @tc.desc Verify non-function Symbol.species throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonFunctionSpeciesThrowsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test004_NonFunctionSpeciesThrows();
      expect(result).assertEqual("Test Passed: NonFunctionSpeciesThrowsTest004");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_005
     * @tc.name PromiseDefaultSymbolSpeciesTest005
     * @tc.desc Verify Promise's default Symbol.species returns Promise instance via then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseDefaultSymbolSpeciesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test005_PromiseDefaultSymbolSpecies();
      expect(result).assertEqual("Test Passed: PromiseDefaultSymbolSpeciesTest005");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_006
     * @tc.name InheritedSymbolSpeciesTest006
     * @tc.desc Verify subclass inherits Symbol.species from parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('InheritedSymbolSpeciesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test006_InheritedSymbolSpecies();
      expect(result).assertEqual("Test Passed: InheritedSymbolSpeciesTest006");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_007
     * @tc.name SpeciesReturnsUnrelatedConstructorTest007
     * @tc.desc Verify Symbol.species returns unrelated constructor, changes derived object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SpeciesReturnsUnrelatedConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test007_SpeciesReturnsUnrelatedConstructor();
      expect(result).assertEqual("Test Passed: SpeciesReturnsUnrelatedConstructorTest007");
    });




    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_013
     * @tc.name MapDefaultSymbolSpeciesTest013
     * @tc.desc Verify Map's default Symbol.species returns Map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapDefaultSymbolSpeciesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test013_MapDefaultSymbolSpecies();
      expect(result).assertEqual("Test Passed: MapDefaultSymbolSpeciesTest013");
    });



    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_016
     * @tc.name FrozenSubclassSpeciesTest016
     * @tc.desc Verify frozen subclass retains Symbol.species functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FrozenSubclassSpeciesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test016_FrozenSubclassSpecies();
      expect(result).assertEqual("Test Passed: FrozenSubclassSpeciesTest016");
    });




    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_019
     * @tc.name SpeciesReturnsDeepSubclassTest019
     * @tc.desc Verify Symbol.species returns deep subclass (subclass of subclass)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SpeciesReturnsDeepSubclassTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test019_SpeciesReturnsDeepSubclass();
      expect(result).assertEqual("Test Passed: SpeciesReturnsDeepSubclassTest019");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_020
     * @tc.name AsyncIteratorDefaultSpeciesTest020
     * @tc.desc Verify AsyncIterator's default Symbol.species returns valid AsyncIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncIteratorDefaultSpeciesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test020_AsyncIteratorDefaultSpecies();
      expect(result).assertEqual("Test Passed: AsyncIteratorDefaultSpeciesTest020");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_021
     * @tc.name ParameterizedSpeciesConstructorTest021
     * @tc.desc Verify parameterized Symbol.species constructor receives correct arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ParameterizedSpeciesConstructorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test021_ParameterizedSpeciesConstructor();
      expect(result).assertEqual("Test Passed: ParameterizedSpeciesConstructorTest021");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_022
     * @tc.name RepeatedDerivedMethodCallsTest022
     * @tc.desc Verify repeated derived method calls retain consistent species behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RepeatedDerivedMethodCallsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test022_RepeatedDerivedMethodCalls();
      expect(result).assertEqual("Test Passed: RepeatedDerivedMethodCallsTest022");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_023
     * @tc.name SpeciesReturnsSealedConstructorTest023
     * @tc.desc Verify sealed constructor as Symbol.species can create derived objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SpeciesReturnsSealedConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test023_SpeciesReturnsSealedConstructor();
      expect(result).assertEqual("Test Passed: SpeciesReturnsSealedConstructorTest023");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_024
     * @tc.name RegExpSubclassSpeciesTest024
     * @tc.desc Verify RegExp subclass overrides Symbol.species to return parent RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RegExpSubclassSpeciesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test024_RegExpSubclassSpecies();
      expect(result).assertEqual("Test Passed: RegExpSubclassSpeciesTest024");
    });




    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_028
     * @tc.name SpeciesInheritanceAfterDeleteTest028
     * @tc.desc Verify deleting subclass Symbol.species triggers parent inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SpeciesInheritanceAfterDeleteTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test028_SpeciesInheritanceAfterDelete();
      expect(result).assertEqual("Test Passed: SpeciesInheritanceAfterDeleteTest028");
    });

    /**
     * @tc.number SUB_SYMBOL_SPECIES_STANDALONE_TEST_029
     * @tc.name NonInstantiableSpeciesTest029
     * @tc.desc Verify non-instantiable function as Symbol.species throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NonInstantiableSpeciesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolSpeciesStandaloneTestUtils.test029_NonInstantiableSpecies();
      expect(result).assertEqual("Test Passed: NonInstantiableSpeciesTest029");
    });




  })
}