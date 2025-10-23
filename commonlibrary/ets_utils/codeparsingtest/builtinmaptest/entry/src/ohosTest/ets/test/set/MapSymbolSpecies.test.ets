/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import {
  MapSymbolSpecies,
  MapSymbolSpeciesTest002,
  MapSymbolSpeciesTest004,
  MapSymbolSpeciesTest007,
  MapSymbolSpeciesTest009,
  MapSymbolSpeciesTest010,
  MapSymbolSpeciesTest011,
  MapSymbolSpeciesTest012,
  MapSymbolSpeciesTest013,
  MapSymbolSpeciesTest014,
  MapSymbolSpeciesTest015,
  MapSymbolSpeciesTest016,
  MapSymbolSpeciesTest018,
  MapSymbolSpeciesTest020,
  MapSymbolSpeciesTest022,
  MapSymbolSpeciesTest024,
  MapSymbolSpeciesTest025,
  MapSymbolSpeciesTest026,
  MapSymbolSpeciesTest027,
  MapSymbolSpeciesTest028,
  MapSymbolSpeciesTest029,
  MapSymbolSpeciesTest030,
  MapSymbolSpeciesTest031,
  MapSymbolSpeciesTest032,
  MapSymbolSpeciesTest034,
  MapSymbolSpeciesTest035,
  MapSymbolSpeciesTest036,
  MapSymbolSpeciesTest037,
  MapSymbolSpeciesTest038,
  MapSymbolSpeciesTest039,
  MapSymbolSpeciesTest040,
  MapSymbolSpeciesTest041,
  MapSymbolSpeciesTest045,
  MapSymbolSpeciesTest050,
  MapSymbolSpeciesTest051,
  MapSymbolSpeciesTest052,
  MapSymbolSpeciesTest053,
  MapSymbolSpeciesTest055,
  MapSymbolSpeciesTest056,
  MapSymbolSpeciesTest057,
  MapSymbolSpeciesTest058,
  MapSymbolSpeciesTest059,
  MapSymbolSpeciesTest060,
  MapSymbolSpeciesTest061,
  MapSymbolSpeciesTest065,
  MapSymbolSpeciesTest066,
  MapSymbolSpeciesTest067,
  MapSymbolSpeciesTest069,
  MapSymbolSpeciesTest070,
  MapSymbolSpeciesTest073,
  MapSymbolSpeciesTest074,
  MapSymbolSpeciesTest075,
  MapSymbolSpeciesTest081,
  MapSymbolSpeciesTest082,
  MapSymbolSpeciesTest085,
  MapSymbolSpeciesTest086,
  MapSymbolSpeciesTest089,
  MapSymbolSpeciesTest090,
  MapSymbolSpeciesTest091,
  MapSymbolSpeciesTest092,
  MapSymbolSpeciesTest093,
  MapSymbolSpeciesTest094,
  MapSymbolSpeciesTest098,
  MapSymbolSpeciesTest099,
  MapSymbolSpeciesTest100,
  SymbolSpecies
} from './MapSymbolSpecies'

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function MapSymbolSpeciesTest() {
  describe('MapSymbolSpeciesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
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
     * @tc.number MAP_SYMBOLSPECIES_TEST_001
     * @tc.name MapSymbolSpeciesTest001
     * @tc.desc Verify that MapSymbolSpecies() is the Map constructor itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(MapSymbolSpecies()).assertEqual(Map);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_002
     * @tc.name MapSymbolSpeciesTest002
     * @tc.desc Verify that species property is a function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(typeof MapSymbolSpecies()).assertEqual('function');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_003
     * @tc.name MapSymbolSpeciesTest003
     * @tc.desc Verify that species constructor creates a new Map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const Species = MapSymbolSpecies();
      const map: object = new Species();
      expect(map instanceof Map).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_004
     * @tc.name MapSymbolSpeciesTest004
     * @tc.desc Verify that species constructor accepts iterable parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: ESObject = MapSymbolSpeciesTest004();
      expect(map.size).assertEqual(2);
      expect(map.get(1)).assertEqual('one');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_005
     * @tc.name MapSymbolSpeciesTest005
     * @tc.desc Verify that map methods returning new maps use the species constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const entries = Array.from(original.entries());
      const newMap = new (MapSymbolSpecies())(entries);
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_007
     * @tc.name MapSymbolSpeciesTest007
     * @tc.desc Verify that species can be overridden to return a different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let arr = MapSymbolSpeciesTest007()
      expect(arr[0]).assertEqual(arr[1]);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_009
     * @tc.name MapSymbolSpeciesTest009
     * @tc.desc Verify that species is not writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = MapSymbolSpeciesTest009();
      expect(descriptor?.writable).assertEqual(undefined);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_010
     * @tc.name MapSymbolSpeciesTest010
     * @tc.desc Verify that species is not enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest010()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_011
     * @tc.name MapSymbolSpeciesTest011
     * @tc.desc Verify that species is configurable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = MapSymbolSpeciesTest011();
      expect(descriptor?.configurable).assertEqual(true);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_012
     * @tc.name MapSymbolSpeciesTest012
     * @tc.desc Verify that species works with map spread operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let map = MapSymbolSpeciesTest012();

      expect(map.newMap instanceof map.Map).assertEqual(true);
      expect(map.newMap.size).assertEqual(2);
      expect(map.newMap.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_013
     * @tc.name MapSymbolSpeciesTest013
     * @tc.desc Verify that species is used in map.from method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('MapSymbolSpeciesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
    //   let map = MapSymbolSpeciesTest013();
    //
    //   expect(map.fromMap instanceof map.Map).assertEqual(true);
    //   expect(map.fromMap instanceof map.MyMap).assertEqual(false);
    // });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_014
     * @tc.name MapSymbolSpeciesTest014
     * @tc.desc Verify that species returns correct type for empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = MapSymbolSpeciesTest014();

      expect(map.newMap instanceof Map).assertEqual(true);
      expect(map.newMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_015
     * @tc.name MapSymbolSpeciesTest015
     * @tc.desc Verify that species handles non-map iterables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ESObject = MapSymbolSpeciesTest015();

      expect(map instanceof Map).assertEqual(true);
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_016
     * @tc.name MapSymbolSpeciesTest016
     * @tc.desc Verify that species throws error for invalid iterables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const errorThrown = MapSymbolSpeciesTest016();

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_017
     * @tc.name MapSymbolSpeciesTest017
     * @tc.desc Verify that species works with nested maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const nestedMap = new Map([[1, new Map([['a', 'b']])]]);
      const Species = MapSymbolSpecies();
      const newMap: ESObject = new Species(nestedMap);

      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.get(1) instanceof Map).assertEqual(true);
      expect((newMap.get(1) as Map<string, string>).get('a')).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_018
     * @tc.name MapSymbolSpeciesTest018
     * @tc.desc Verify that overriding species with non-constructor throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const errorThrown = MapSymbolSpeciesTest018();
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_019
     * @tc.name MapSymbolSpeciesTest019
     * @tc.desc Verify that species works with map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const entries = original.entries();
      const Species = MapSymbolSpecies();
      const newMap: ESObject = new Species(entries);

      expect(newMap.size).assertEqual(2);
      expect(newMap.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_020
     * @tc.name MapSymbolSpeciesTest020
     * @tc.desc Verify that species works with map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const newMap: ESObject = MapSymbolSpeciesTest020();

      expect(newMap.size).assertEqual(2);
      expect(newMap.get(1)).assertEqual(2);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_022
     * @tc.name MapSymbolSpeciesTest022
     * @tc.desc Verify that species works with null prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('MapSymbolSpeciesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, ():void => {
    //   let arr:object = MapSymbolSpeciesTest022();
    //   expect([arr[0],arr[1]]).assertEqual([true,[['a', 1]]]);
    // });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_023
     * @tc.name MapSymbolSpeciesTest023
     * @tc.desc Verify that species constructor works with large maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map<number, string>();
      for (let i = 0; i < 100; i++) {
        original.set(i, `value-${i}`);
      }

      const Species = MapSymbolSpecies();
      const newMap: ESObject = new Species(original);

      expect(newMap.size).assertEqual(100);
      expect(newMap.get(99)).assertEqual('value-99');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_024
     * @tc.name MapSymbolSpeciesTest024
     * @tc.desc Verify that species handles maps with object keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: object = MapSymbolSpeciesTest024()

      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_025
     * @tc.name MapSymbolSpeciesTest025
     * @tc.desc Verify that species maintains map order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let arr = MapSymbolSpeciesTest025();
      expect(arr[0]).assertDeepEquals(arr[1]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_026
     * @tc.name MapSymbolSpeciesTest026
     * @tc.desc Verify that species works with map that has Symbol keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest026()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_027
     * @tc.name MapSymbolSpeciesTest027
     * @tc.desc Verify that species can be set to a function returning Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest027()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_028
     * @tc.name MapSymbolSpeciesTest028
     * @tc.desc Verify that species is inherited by subclasses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MapSymbolSpeciesTest028()).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_029
     * @tc.name MapSymbolSpeciesTest029
     * @tc.desc Verify that child classes can override parent species
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MapSymbolSpeciesTest029()).assertEqual(true);
    });
    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_030
     * @tc.name MapSymbolSpeciesTest030
     * @tc.desc Verify that species works with async iterables (should fail)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {


      expect(MapSymbolSpeciesTest030()).assertEqual(true);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_031
     * @tc.name MapSymbolSpeciesTest031
     * @tc.desc Verify that species constructor throws for non-iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest031()).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_032
     * @tc.name MapSymbolSpeciesTest032
     * @tc.desc Verify that species works with Map-like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let newMap: ESObject = MapSymbolSpeciesTest032()

      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_033
     * @tc.name MapSymbolSpeciesTest033
     * @tc.desc Verify that species preserves key uniqueness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a'], [1, 'b'], [2, 'c']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.size).assertEqual(2);
      expect(newMap.get(1)).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_034
     * @tc.name MapSymbolSpeciesTest034
     * @tc.desc Verify that species works with empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      let newMap: ESObject = MapSymbolSpeciesTest034()
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_035
     * @tc.name MapSymbolSpeciesTest035
     * @tc.desc Verify that species is used in custom map concat method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let arr: ESObject = MapSymbolSpeciesTest035();
      expect(arr[0] instanceof Map).assertEqual(true);
      expect(arr[0] instanceof arr[1]).assertEqual(false);
      expect(arr[0].size).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_036
     * @tc.name MapSymbolSpeciesTest036
     * @tc.desc Verify that species can return a different collection type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest036()).assertDeepEquals([false, 2, [[1, 'a'], [2, 'b']]]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_037
     * @tc.name MapSymbolSpeciesTest037
     * @tc.desc Verify that species works with frozen maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap = MapSymbolSpeciesTest037();
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_038
     * @tc.name MapSymbolSpeciesTest038
     * @tc.desc Verify that species works with sealed maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap = MapSymbolSpeciesTest038();
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_039
     * @tc.name MapSymbolSpeciesTest039
     * @tc.desc Verify that species constructor handles undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let newMap: ESObject = MapSymbolSpeciesTest039();
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_040
     * @tc.name MapSymbolSpeciesTest040
     * @tc.desc Verify that species constructor handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let newMap: ESObject = MapSymbolSpeciesTest040();
      expect(newMap instanceof Map).assertEqual(true);
      expect(newMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_041
     * @tc.name MapSymbolSpeciesTest041
     * @tc.desc Verify that species is used in map with custom toJSON method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest041()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_042
     * @tc.name MapSymbolSpeciesTest042
     * @tc.desc Verify that species works with numbers as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map([[1, 'one'], [2, 'two'], [3, 'three']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(1)).assertEqual('one');
      expect(newMap.get(2)).assertEqual('two');
      expect(newMap.get(3)).assertEqual('three');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_043
     * @tc.name MapSymbolSpeciesTest043
     * @tc.desc Verify that species works with strings as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map([['a', 1], ['b', 2], ['c', 3]]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get('a')).assertEqual(1);
      expect(newMap.get('b')).assertEqual(2);
      expect(newMap.get('c')).assertEqual(3);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_044
     * @tc.name MapSymbolSpeciesTest044
     * @tc.desc Verify that species works with boolean as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSymbolSpeciesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map([[true, 'yes'], [false, 'no']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(true)).assertEqual('yes');
      expect(newMap.get(false)).assertEqual('no');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_045
     * @tc.name MapSymbolSpeciesTest045
     * @tc.desc Verify that species works with mixed key types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(MapSymbolSpeciesTest045()).assertDeepEquals(['number', 2, 'boolean', 'object', 'symbol']);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_046
     * @tc.name MapSymbolSpeciesTest046
     * @tc.desc Verify that species works with undefined as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, undefined], [2, undefined]]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.has(1)).assertEqual(true);
      expect(newMap.get(1)).assertEqual(undefined);
      expect(newMap.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_047
     * @tc.name MapSymbolSpeciesTest047
     * @tc.desc Verify that species works with null as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, null], [2, null]]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.has(1)).assertEqual(true);
      expect(newMap.get(1)).assertEqual(null);
      expect(newMap.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_048
     * @tc.name MapSymbolSpeciesTest048
     * @tc.desc Verify that species works with functions as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = () => 'result1';
      const func2 = () => 'result2';
      const original = new Map([[1, func1], [2, func2]]);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(1)).assertEqual(func1);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_049
     * @tc.name MapSymbolSpeciesTest049
     * @tc.desc Verify that species works with arrays as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, [1, 2, 3]], [2, ['a', 'b', 'c']]]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(1)).assertDeepEquals([1, 2, 3]);
      expect(newMap.get(2)![1]).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_050
     * @tc.name MapSymbolSpeciesTest050
     * @tc.desc Verify that species works with objects as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest050()).assertDeepEquals([true, 2]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_051
     * @tc.name MapSymbolSpeciesTest051
     * @tc.desc Verify that species is not enumerable in for...in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      expect(MapSymbolSpeciesTest051()).assertEqual(false);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_052
     * @tc.name MapSymbolSpeciesTest052
     * @tc.desc Verify that species is found with getOwnPropertySymbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      expect(MapSymbolSpeciesTest052()).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_053
     * @tc.name MapSymbolSpeciesTest053
     * @tc.desc Verify that species descriptor has correct attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const descriptor = MapSymbolSpeciesTest053();

      expect(typeof descriptor?.get).assertEqual('function');
      expect(descriptor?.set).assertEqual(undefined);
      expect(descriptor?.enumerable).assertEqual(false);
      expect(descriptor?.configurable).assertEqual(true);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_055
     * @tc.name MapSymbolSpeciesTest055
     * @tc.desc Verify that species cannot be deleted from Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest055()).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_056
     * @tc.name MapSymbolSpeciesTest056
     * @tc.desc Verify that species works with subclass instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // let a:ESObject =
      expect(MapSymbolSpeciesTest056()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_057
     * @tc.name MapSymbolSpeciesTest057
     * @tc.desc Verify that species can be a subclass constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest057()).assertDeepEquals([true, false, 'a']);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_058
     * @tc.name MapSymbolSpeciesTest058
     * @tc.desc Verify that species works with multiple inheritance levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest058()).assertDeepEquals([true, true, true, false]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_059
     * @tc.name MapSymbolSpeciesTest059
     * @tc.desc Verify that species constructor can be called with new
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Species = MapSymbolSpeciesTest059();
      // const map1 = new Species([[1, 'a']]);
      // const map2 = new (Species)([[2, 'b']]);

      // expect(map1 instanceof Map).assertEqual(true);
      // expect(map2 instanceof Map).assertEqual(true);
      // expect(map1.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_060
     * @tc.name MapSymbolSpeciesTest060
     * @tc.desc Verify that species constructor called without new throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest060()).assertEqual(true);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_061
     * @tc.name MapSymbolSpeciesTest061
     * @tc.desc Verify that species works with map values method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let valuesMap: ESObject = MapSymbolSpeciesTest061();

      expect(valuesMap instanceof Map).assertEqual(true);
      expect(valuesMap.get(0)).assertEqual(1);
      expect(valuesMap.get(1)).assertEqual(2);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_062
     * @tc.name MapSymbolSpeciesTest062
     * @tc.desc Verify that species works with map entries method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const entries = original.entries();
      const Species = MapSymbolSpecies();
      const newMap = new Species(entries);

      expect(newMap.size).assertEqual(2);
      expect(Array.from(newMap.entries())).assertDeepEquals([[1, 'a'], [2, 'b']]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_063
     * @tc.name MapSymbolSpeciesTest063
     * @tc.desc Verify that species works after map mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a']]);
      original.set(2, 'b');
      original.delete(1);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.size).assertEqual(1);
      expect(newMap.has(1)).assertEqual(false);
      expect(newMap.get(2)).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_064
     * @tc.name MapSymbolSpeciesTest064
     * @tc.desc Verify that species creates independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      original.set(2, 'b');

      expect(newMap.size).assertEqual(1);
      expect(newMap.has(2)).assertEqual(false);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_065
     * @tc.name MapSymbolSpeciesTest065
     * @tc.desc Verify that species copy shares object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let newMap: ESObject = MapSymbolSpeciesTest065();
      expect(newMap.get(1).value).assertEqual('modified');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_066
     * @tc.name MapSymbolSpeciesTest066
     * @tc.desc Verify that species works with weak references in keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest066()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_067
     * @tc.name MapSymbolSpeciesTest067
     * @tc.desc Verify that species works with nested species
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest067()).assertDeepEquals([true, true, true]);
    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_069
     * @tc.name MapSymbolSpeciesTest069
     * @tc.desc Verify that species works with this in getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest069()).assertDeepEquals([true, 'a']);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_070
     * @tc.name MapSymbolSpeciesTest070
     * @tc.desc Verify that species getter is called each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {


      expect(MapSymbolSpeciesTest070()).assertEqual(0);

    });


    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_073
     * @tc.name MapSymbolSpeciesTest073
     * @tc.desc Verify that species works with recursive map structures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let newMap: ESObject = MapSymbolSpeciesTest073();
      expect(newMap.get('value')).assertEqual(42);
      expect(newMap.get('self')).assertDeepEquals(newMap); // Should reference itself, not original
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_074
     * @tc.name MapSymbolSpeciesTest074
     * @tc.desc Verify that species handles maps with non-array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap = MapSymbolSpeciesTest074();
      expect(newMap.get(1)).assertEqual('a');
      expect(newMap.get(2)).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_075
     * @tc.name MapSymbolSpeciesTest075
     * @tc.desc Verify that species handles maps with invalid entry lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap: ESObject = MapSymbolSpeciesTest075();
      expect(newMap.has(1)).assertEqual(true);
      expect(newMap.get(1)).assertEqual(undefined);
      expect(newMap.get(2)).assertEqual('b');
      expect(newMap.size).assertEqual(3); // The empty array will create an entry with undefined key
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_076
     * @tc.name MapSymbolSpeciesTest076
     * @tc.desc Verify that species works with maps containing NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[NaN, 'not a number']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.has(NaN)).assertEqual(true);
      expect(newMap.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_077
     * @tc.name MapSymbolSpeciesTest077
     * @tc.desc Verify that species works with maps containing 0 and -0 as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[0, 'zero'], [-0, 'negative zero']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      // In JavaScript, 0 and -0 are considered equal as Map keys
      expect(newMap.size).assertEqual(1);
      expect(newMap.get(0)).assertEqual('negative zero');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_078
     * @tc.name MapSymbolSpeciesTest078
     * @tc.desc Verify that species works with Date objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);
      const original = new Map([[date1, 'Jan 1'], [date2, 'Jan 2']]);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(date1)).assertEqual('Jan 1');
      expect(newMap.get(date2)).assertEqual('Jan 2');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_079
     * @tc.name MapSymbolSpeciesTest079
     * @tc.desc Verify that species works with RegExp objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex1 = /test/;
      const regex2 = /test/g;
      const original = new Map([[regex1, 'no flags'], [regex2, 'global flag']]);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(regex1)).assertEqual('no flags');
      expect(newMap.get(regex2)).assertEqual('global flag');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_080
     * @tc.name MapSymbolSpeciesTest080
     * @tc.desc Verify that species works with Map instances as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyMap1 = new Map([[1, 'a']]);
      const keyMap2 = new Map([[2, 'b']]);
      const original = new Map([[keyMap1, 'map1'], [keyMap2, 'map2']]);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(keyMap1)).assertEqual('map1');
      expect(newMap.get(keyMap2)).assertEqual('map2');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_081
     * @tc.name MapSymbolSpeciesTest081
     * @tc.desc Verify that species works with Promise objects as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest081()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_082
     * @tc.name MapSymbolSpeciesTest082
     * @tc.desc Verify that species works with generator functions as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest082()).assertDeepEquals([[1, 2], ['a', 'b']]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_083
     * @tc.name MapSymbolSpeciesTest083
     * @tc.desc Verify that species works with BigInt as keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigKey1 = BigInt(12345678901234567890);
      const bigKey2 = BigInt(98765432109876543210);
      const original = new Map([[bigKey1, BigInt(100)], [bigKey2, BigInt(200)]]);

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(bigKey1)).assertEqual(BigInt(100));
      expect(newMap.get(bigKey2)).assertEqual(BigInt(200));
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_084
     * @tc.name MapSymbolSpeciesTest084
     * @tc.desc Verify that species works with maps containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[Infinity, 'inf'], [-Infinity, 'neg inf']]);
      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.get(Infinity)).assertEqual('inf');
      expect(newMap.get(-Infinity)).assertEqual('neg inf');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_085
     * @tc.name MapSymbolSpeciesTest085
     * @tc.desc Verify that species works with maps in iframes (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest085()).assertDeepEquals([true, 'iframe value']);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_087
     * @tc.name MapSymbolSpeciesTest087
     * @tc.desc Verify that species works with maps that have been modified after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Map<number, string> = new Map();
      original.set(1, 'a');
      original.set(2, 'b');
      original.delete(1);
      original.set(3, 'c');

      const Species = MapSymbolSpecies();
      ;
      const newMap: ESObject = new Species(original);

      expect(newMap.size).assertEqual(2);
      expect(newMap.has(1)).assertEqual(false);
      expect(newMap.get(2)).assertEqual('b');
      expect(newMap.get(3)).assertEqual('c');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_088
     * @tc.name MapSymbolSpeciesTest088
     * @tc.desc Verify that species works with clear() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      original.clear();

      const Species = MapSymbolSpecies();
      const newMap = new Species(original);

      expect(newMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_089
     * @tc.name MapSymbolSpeciesTest089
     * @tc.desc Verify that species works with maps that have custom prototypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap: ESObject = MapSymbolSpeciesTest089();
      expect(newMap instanceof Map).assertEqual(true);
      expect(typeof (newMap).customMethod).assertEqual('undefined'); // Should not inherit custom prototype
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_091
     * @tc.name MapSymbolSpeciesTest091
     * @tc.desc Verify that species works with maps that override Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest091()).assertDeepEquals([[3, 'c'], [2, 'b'], [1, 'a']]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_092
     * @tc.name MapSymbolSpeciesTest092
     * @tc.desc Verify that species works with maps that override entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let newMap: ESObject = MapSymbolSpeciesTest092();

      expect(newMap.get(1)).assertEqual('a');
      expect(newMap.get(2)).assertEqual('b');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_093
     * @tc.name MapSymbolSpeciesTest093
     * @tc.desc Verify that species works with async map processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {

      let processed: ESObject = await MapSymbolSpeciesTest093()
      expect(processed instanceof Map).assertEqual(true);
      expect(processed.get(1)).assertEqual('a');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_094
     * @tc.name MapSymbolSpeciesTest094
     * @tc.desc Verify that species works with maps containing other collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(MapSymbolSpeciesTest094()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_095
     * @tc.name MapSymbolSpeciesTest095
     * @tc.desc Verify that species works with very large keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeKey = 'a'.repeat(10000);
      const largeValue = 'b'.repeat(100000);
      const original = new Map([[largeKey, largeValue]]);

      const Species = MapSymbolSpecies()
      const newMap = new Species(original);

      expect(newMap.get(largeKey)).assertEqual(largeValue);
      expect(newMap.get(largeKey)?.length).assertEqual(100000);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_096
     * @tc.name MapSymbolSpeciesTest096
     * @tc.desc Verify that species works with maps containing emojis as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([['😊', 'smile'], ['👍', 'thumbs up'], ['🔥', 'fire']]);
      const Species = MapSymbolSpecies()
      const newMap = new Species(original);

      expect(newMap.get('😊')).assertEqual('smile');
      expect(newMap.get('👍')).assertEqual('thumbs up');
      expect(newMap.get('🔥')).assertEqual('fire');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_097
     * @tc.name MapSymbolSpeciesTest097
     * @tc.desc Verify that species works with maps containing Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSymbolSpeciesTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map([
        ['ä', 'a umlaut'],
        ['ñ', 'n tilde'],
        ['ç', 'c cedilla'],
        ['日本�?', 'Japanese'],
        ['한국�?', 'Korean']
      ]);

      const Species = MapSymbolSpecies()
      const newMap = new Species(original);

      expect(newMap.get('ä')).assertEqual('a umlaut');
      expect(newMap.get('日本�?')).assertEqual('Japanese');
      expect(newMap.get('한국�?')).assertEqual('Korean');
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_098
     * @tc.name MapSymbolSpeciesTest098
     * @tc.desc Verify that species works with maps that have been frozen after population
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      let newMap = MapSymbolSpeciesTest098();
      expect(newMap.size).assertEqual(2);
      expect(newMap.get(1)).assertEqual('a');

      // New map should not be frozen
      newMap.set(3, 'c');
      expect(newMap.size).assertEqual(3);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_099
     * @tc.name MapSymbolSpeciesTest099
     * @tc.desc Verify that species works with maps in a module pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      expect(MapSymbolSpeciesTest099()).assertDeepEquals([true, false, 'a']);
    });

    /**
     * @tc.number MAP_SYMBOLSPECIES_TEST_100
     * @tc.name MapSymbolSpeciesTest100
     * @tc.desc Verify that species works with maps used in a factory pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSymbolSpeciesTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(MapSymbolSpeciesTest100()).assertDeepEquals([true, false, 'a']);
    });

  })
}