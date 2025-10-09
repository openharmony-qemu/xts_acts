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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  SetConstructorTest002,
  SetConstructorTest003,
  SetConstructorTest007,
  SetConstructorTest0071,
  setConstructorTest008,
  SetConstructorTest011,
  SetConstructorTest0111,
  SetConstructorTest012,
  SetConstructorTest013,
  SetConstructorTest014,
  SetConstructorTest020,
  SetConstructorTest021,
  SetConstructorTest023,
  SetConstructorTest024,
  SetConstructorTest025,
  SetConstructorTest031,
  SetConstructorTest032,
  SetConstructorTest033,
  SetConstructorTest034,
  SetConstructorTest036,
  SetConstructorTest039,
  SetConstructorTest040,
  SetConstructorTest041,
  SetConstructorTest042,
  SetConstructorTest044,
  SetConstructorTest045,
  SetConstructorTest046,
  SetConstructorTest047,
  SetConstructorTest048,
  SetConstructorTest049,
  SetConstructorTest055,
  SetConstructorTest056,
  SetConstructorTest057,
  SetConstructorTest059,
  SetConstructorTest060,
  SetConstructorTest061,
  SetConstructorTest064,
  SetConstructorTest065,
  SetConstructorTest066,
  SetConstructorTest067,
  SetConstructorTest068,
  SetConstructorTest074,
  SetConstructorTest076,
  SetConstructorTest077,
  SetConstructorTest078,
  SetConstructorTest080,
  SetConstructorTest081,
  SetConstructorTest082,
  SetConstructorTest084,
  SetConstructorTest085,
  SetConstructorTest0851,
  SetConstructorTest086,
  SetConstructorTest087,
  SetConstructorTest088,
  SetConstructorTest091,
  SetConstructorTest092
} from './SetConstructor';
import { buffer } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function SetConstructorTest() {
  describe('SetConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_SET_TEST_0100
     * @tc.name SetConstructorTest001
     * @tc.desc Calling new Set() with no parameters should create an empty Set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<object>();
      expect(s.size).assertEqual(0);
      expect(s instanceof Set).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0200
     * @tc.name SetConstructorTest002
     * @tc.desc Calling Set() without new keyword should throw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest002();
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0300
     * @tc.name SetConstructorTest003
     * @tc.desc Passing array parameter should automatically remove duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([1, 2, 2, 3]);
      expect(SetConstructorTest003(s, ',')).assertEqual('1,2,3');
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0400
     * @tc.name SetConstructorTest004
     * @tc.desc Passing null as parameter should create an empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<object>(null);
      expect(s.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0500
     * @tc.name SetConstructorTest005
     * @tc.desc Passing string parameter should automatically remove duplicate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set('abba');
      expect(SetConstructorTest003(s, '')).assertEqual('ab');
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0600
     * @tc.name SetConstructorTest006
     * @tc.desc Passing Set instance as parameter should copy elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s1 = new Set([1, 2]);
      const s2 = new Set(s1);
      expect(SetConstructorTest003(s2, ',')).assertEqual('1,2');
      expect(s2.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0700
     * @tc.name SetConstructorTest007
     * @tc.desc undefined and null should be treated as different elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([undefined, null, undefined]);
      expect(SetConstructorTest007(s)).assertEqual(true);
      expect(SetConstructorTest0071(s)).assertEqual(true);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0800
     * @tc.name SetConstructorTest008
     * @tc.desc Reference type objects should not be automatically deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = setConstructorTest008();
      const s = new Set(result);
      expect(s.size).assertEqual(2);
    });


    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1000
     * @tc.name SetConstructorTest010
     * @tc.desc Passing empty iterable object should create an empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([]);
      expect(s.size).assertEqual(0);
    });
    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1100
     * @tc.name SetConstructorTest011
     * @tc.desc Passing number as parameter (non-iterable) should create Set with that number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest011()).assertEqual(1);
      expect(SetConstructorTest0111()[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1200
     * @tc.name SetConstructorTest012
     * @tc.desc Passing boolean true as parameter should create Set with true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest012()[0]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1300
     * @tc.name SetConstructorTest013
     * @tc.desc Passing boolean false as parameter should create Set with false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest013()[0]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1400
     * @tc.name SetConstructorTest014
     * @tc.desc Set should handle NaN as a single unique value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest014().includes(NaN)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1500
     * @tc.name SetConstructorTest015
     * @tc.desc Set should distinguish between 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([0, -0]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1600
     * @tc.name SetConstructorTest016
     * @tc.desc Passing Date objects with same time should be considered equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const s = new Set([date, new Date(date.getTime())]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1700
     * @tc.name SetConstructorTest017
     * @tc.desc Passing same Date object twice should be deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const s = new Set([date, date]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1800
     * @tc.name SetConstructorTest018
     * @tc.desc Set should handle empty string and whitespace string as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set(['', ' ']);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1900
     * @tc.name SetConstructorTest019
     * @tc.desc Set should store different regex patterns as separate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([/a/, /a/, /b/]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2000
     * @tc.name SetConstructorTest020
     * @tc.desc Set created from arguments object should contain all arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest020()).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2100
     * @tc.name SetConstructorTest021
     * @tc.desc Set should handle typed arrays as iterable input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest021()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2300
     * @tc.name SetConstructorTest023
     * @tc.desc Set created from generator function should contain generated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetConstructorTest023()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2400
     * @tc.name SetConstructorTest024
     * @tc.desc Set should handle Symbol values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest024()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2500
     * @tc.name SetConstructorTest025
     * @tc.desc Set should handle BigInt values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest025().toString()).assertEqual([1n, 2n, 3n].toString());
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2600
     * @tc.name SetConstructorTest026
     * @tc.desc Set should distinguish between number and string representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([1, '1']);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2800
     * @tc.name SetConstructorTest028
     * @tc.desc Set should handle same array reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1];
      const s = new Set([arr, arr]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2900
     * @tc.name SetConstructorTest029
     * @tc.desc Set should handle iterable with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([1, '1', true, 1, false, true]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3000
     * @tc.name SetConstructorTest030
     * @tc.desc Set created from another Set should not reference the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s1 = new Set([1, 2, 3]);
      const s2 = new Set(s1);
      s1.delete(1);
      expect(s2.has(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3100
     * @tc.name SetConstructorTest031
     * @tc.desc Set should handle empty iterable from generator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest031()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3200
     * @tc.name SetConstructorTest032
     * @tc.desc Set should process iterable that modifies itself during iteration
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest032', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      expect(SetConstructorTest032()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3300
     * @tc.name SetConstructorTest033
     * @tc.desc Set should handle non-iterable objects with Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetConstructorTest033()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3400
     * @tc.name SetConstructorTest034
     * @tc.desc Set should throw error when iterator is not a function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest034();
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3500
     * @tc.name SetConstructorTest035
     * @tc.desc Set should process iterable with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([null, null, undefined, null]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3600
     * @tc.name SetConstructorTest036
     * @tc.desc Set should handle very large arrays efficiently
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest036();
      expect(s.size).assertEqual(1000);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3700
     * @tc.name SetConstructorTest037
     * @tc.desc Set should handle sparse arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sparseArray = [1, , 2, , 1];
      const s = new Set(sparseArray);
      expect(s.size).assertEqual(3);
      expect(s.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3800
     * @tc.name SetConstructorTest038
     * @tc.desc Set should not modify the original iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const original = [1, 2, 3];
      const s = new Set(original);
      s.delete(1);
      expect(original).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3900
     * @tc.name SetConstructorTest039
     * @tc.desc Set should handle objects with custom toString methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest039();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4000
     * @tc.name SetConstructorTest040
     * @tc.desc Set should contain all unique elements from a Set-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest040()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4100
     * @tc.name SetConstructorTest041
     * @tc.desc Set should handle iterable that throws during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest041();
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4200
     * @tc.name SetConstructorTest042
     * @tc.desc Set should process iterable with multiple value types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest042()).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4300
     * @tc.name SetConstructorTest043
     * @tc.desc Set should handle RegExp objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex1 = /test/;
      const regex2 = /test/;
      const regex3 = regex1;
      const s = new Set([regex1, regex2, regex3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4400
     * @tc.name SetConstructorTest044
     * @tc.desc Set should handle Function objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest044()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4500
     * @tc.name SetConstructorTest045
     * @tc.desc Set should handle Map entries correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest045()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4600
     * @tc.name SetConstructorTest046
     * @tc.desc Set should handle Map keys correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest046()).assertDeepEquals(['key1', 'key2']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4700
     * @tc.name SetConstructorTest047
     * @tc.desc Set should handle Map values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest047()).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4800
     * @tc.name SetConstructorTest048
     * @tc.desc Set should handle Set keys correctly when passed as iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest048()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4900
     * @tc.name SetConstructorTest049
     * @tc.desc Set should handle Set values correctly when passed as iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest049()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5000
     * @tc.name SetConstructorTest050
     * @tc.desc Set should handle Set entries correctly when passed as iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s1 = new Set(['a', 'b']);
      const s2 = new Set(s1.entries());
      expect(s2.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5100
     * @tc.name SetConstructorTest051
     * @tc.desc Set should process iterable with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([Infinity, Infinity, -Infinity, Infinity]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5200
     * @tc.name SetConstructorTest052
     * @tc.desc Set should distinguish between Infinity and other numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([Infinity, 1000000, Infinity]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5400
     * @tc.name SetConstructorTest054
     * @tc.desc Set should handle iterable with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 1);
      const date3 = date1;
      const s = new Set([date1, date2, date3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5500
     * @tc.name SetConstructorTest055
     * @tc.desc Set should handle Proxy objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const s = SetConstructorTest055();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5600
     * @tc.name SetConstructorTest056
     * @tc.desc Set should handle frozen objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest056();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5700
     * @tc.name SetConstructorTest057
     * @tc.desc Set should handle sealed objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest057();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5900
     * @tc.name SetConstructorTest059
     * @tc.desc Set should handle WeakMap (non-iterable) as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest059()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6000
     * @tc.name SetConstructorTest060
     * @tc.desc Set should handle WeakSet (non-iterable) as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest060()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6100
     * @tc.name SetConstructorTest061
     * @tc.desc Set should handle iterable with mixed Symbols and strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest061();
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6200
     * @tc.name SetConstructorTest062
     * @tc.desc Set should handle BigInt and Number with same value as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([1n, 1, 2n, 2]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6300
     * @tc.name SetConstructorTest063
     * @tc.desc Set should handle multiple NaN values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set([NaN, Number('not a number'), NaN]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6400
     * @tc.name SetConstructorTest064
     * @tc.desc Set should handle iterable with Symbol.iterator that returns non-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest064();
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6500
     * @tc.name SetConstructorTest065
     * @tc.desc Set should handle iterable with next method that returns non-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest065();
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6600
     * @tc.name SetConstructorTest066
     * @tc.desc Set should handle iterable that returns done:true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest066()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6700
     * @tc.name SetConstructorTest067
     * @tc.desc Set should process async iterable as a single value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(SetConstructorTest067()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6800
     * @tc.name SetConstructorTest068
     * @tc.desc Set should handle iterable with null prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest068()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6900
     * @tc.name SetConstructorTest069
     * @tc.desc Set should handle Number objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const numObj1 = new Number(10);
      const numObj2 = new Number(10);
      const s = new Set([numObj1, numObj2, 10, 10]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7000
     * @tc.name SetConstructorTest070
     * @tc.desc Set should handle String objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const strObj1 = new String('test');
      const strObj2 = new String('test');
      const s = new Set([strObj1, strObj2, 'test', 'test']);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7100
     * @tc.name SetConstructorTest071
     * @tc.desc Set should handle Boolean objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const boolObj1 = new Boolean(true);
      const boolObj2 = new Boolean(true);
      const s = new Set([boolObj1, boolObj2, true, true]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7200
     * @tc.name SetConstructorTest072
     * @tc.desc Set should handle empty Buffer objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buf1 = buffer.from('');
      const buf2 = buffer.from('');
      const s = new Set([buf1, buf2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7300
     * @tc.name SetConstructorTest073
     * @tc.desc Set should handle Buffer objects with same content as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buf1 = buffer.from('test');
      const buf2 = buffer.from('test');
      const s = new Set([buf1, buf2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7400
     * @tc.name SetConstructorTest074
     * @tc.desc Set should process iterable with getter properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest074()).assertDeepEquals([1, 2]);
    });


    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7600
     * @tc.name SetConstructorTest076
     * @tc.desc Set should handle iterable with dynamic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest076()).assertDeepEquals([0, 1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7700
     * @tc.name SetConstructorTest077
     * @tc.desc Set should handle iterable that returns same value multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = SetConstructorTest077();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7800
     * @tc.name SetConstructorTest078
     * @tc.desc Set should handle iterable with increasing numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(SetConstructorTest078()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7900
     * @tc.name SetConstructorTest079
     * @tc.desc Set should handle iterable with random unique values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const uniqueNumbers = new Set<number>();
      while (uniqueNumbers.size < 5) {
        uniqueNumbers.add(Math.floor(Math.random() * 100));
      }
      const s = new Set(uniqueNumbers);
      expect(s.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8000
     * @tc.name SetConstructorTest080
     * @tc.desc Set should handle iterable with function returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest080()).assertDeepEquals(['test', 'another']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8100
     * @tc.name SetConstructorTest081
     * @tc.desc Set should handle iterable with conditional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest081()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8200
     * @tc.name SetConstructorTest082
     * @tc.desc Set should handle nested iterables when explicitly iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SetConstructorTest082()).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8400
     * @tc.name SetConstructorTest084
     * @tc.desc Set should handle iterable with error-throwing accessors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let errorThrown = false;
      try {
        SetConstructorTest084();
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8500
     * @tc.name SetConstructorTest085
     * @tc.desc Set should handle iterable with return method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const s = SetConstructorTest085();
      expect(SetConstructorTest0851()).assertEqual(false);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8600
     * @tc.name SetConstructorTest086
     * @tc.desc Set should handle iterable with throw method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetConstructorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const s = SetConstructorTest086();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8700
     * @tc.name SetConstructorTest087
     * @tc.desc Set should handle objects with custom valueOf methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest087();
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8800
     * @tc.name SetConstructorTest088
     * @tc.desc Set should handle objects with custom Symbol.toPrimitive methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest088();
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8900
     * @tc.name SetConstructorTest089
     * @tc.desc Set should handle very long strings as values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest089', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const longStr = 'a'.repeat(10000);
      const s = new Set([longStr, longStr, 'b'.repeat(10000)]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9000
     * @tc.name SetConstructorTest090
     * @tc.desc Set should handle numbers with high precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const num1 = 0.1 + 0.2;
      const num2 = 0.3;
      const s = new Set([num1, num2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9100
     * @tc.name SetConstructorTest091
     * @tc.desc Set should handle iterable with Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest091();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9200
     * @tc.name SetConstructorTest092
     * @tc.desc Set should handle iterable with named Symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = SetConstructorTest092();
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9300
     * @tc.name SetConstructorTest093
     * @tc.desc Set should handle iterable with various whitespace characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([' ', '\t', '\n', '\r', ' ', '\t']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9400
     * @tc.name SetConstructorTest094
     * @tc.desc Set should handle Unicode characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set(['a', 'á', 'à', 'a', 'á']);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9500
     * @tc.name SetConstructorTest095
     * @tc.desc Set should handle surrogate pairs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const emoji1 = '😊';
      const emoji2 = '😊';
      const emoji3 = '😂';
      const s = new Set([emoji1, emoji2, emoji3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9600
     * @tc.name SetConstructorTest096
     * @tc.desc Set should handle iterable with mixed Unicode and ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set(['a', 'á', 'b', 'a', '😂']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9700
     * @tc.name SetConstructorTest097
     * @tc.desc Set should handle iterable with zero-width characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zeroWidthSpace = '\u200B';
      const zeroWidthJoiner = '\u200D';
      const s = new Set([zeroWidthSpace, zeroWidthJoiner, zeroWidthSpace]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9800
     * @tc.name SetConstructorTest098
     * @tc.desc Set should handle iterable with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set([String.fromCharCode(0), String.fromCharCode(1), String.fromCharCode(0)]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9900
     * @tc.name SetConstructorTest099
     * @tc.desc Set should handle iterable with mixed letter cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set(['A', 'a', 'B', 'b', 'A']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_10000
     * @tc.name SetConstructorTest100
     * @tc.desc Set should handle iterable with numeric strings and numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set(['1', 1, '2', 2, '1']);
      expect(s.size).assertEqual(4);
    });


  });
}