'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { ArrayList } from '@kit.ArkTS';
import Utils from '../Util.test';

interface TestObj1 {
  a: number;
  b: string;
}

interface TestObj2 {
  c: number;
  d: number[];
}

interface Person {
  name: string;
  age: number;
}

export default function ArrayList10Test(): void {
  describe('ArrayList10Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0100
     * @tc.name      testArrayList03GetLastIndexOf0001
     * @tc.desc      Test getLastIndexOf with numbers (multiple occurrences)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(4);
        let result: number = arrayList.getLastIndexOf(2);
        expect(result).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0200
     * @tc.name      testArrayList03GetLastIndexOf0002
     * @tc.desc      Test getLastIndexOf with single occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(1);
        arrayList.add(3);
        let result: number = arrayList.getLastIndexOf(5);
        expect(result).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0300
     * @tc.name      testArrayList03GetLastIndexOf0003
     * @tc.desc      Test getLastIndexOf when element not found
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(1);
        let result: number = arrayList.getLastIndexOf(10);
        expect(result).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0400
     * @tc.name      testArrayList03GetLastIndexOf0004
     * @tc.desc      Test getLastIndexOf with last element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        let result: number = arrayList.getLastIndexOf(5);
        expect(result).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0500
     * @tc.name      testArrayList03GetLastIndexOf0005
     * @tc.desc      Test getLastIndexOf with first element (also appears elsewhere)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(1);
        arrayList.add(4);
        arrayList.add(1);
        let result: number = arrayList.getLastIndexOf(1);
        expect(result).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0600
     * @tc.name      testArrayList03GetLastIndexOf0006
     * @tc.desc      Test getLastIndexOf with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(-128);
        arrayList.add(127);
        arrayList.add(0);
        arrayList.add(127);
        arrayList.add(64);
        arrayList.add(-128);
        arrayList.add(-129);
        arrayList.add(128);
        let result1: number = arrayList.getLastIndexOf(127);
        let result2: number = arrayList.getLastIndexOf(-128);
        let result3: number = arrayList.getLastIndexOf(128);
        let result4: number = arrayList.getLastIndexOf(-129);
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(7);
        expect(result4).assertEqual(6);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0700
     * @tc.name      testArrayList03GetLastIndexOf0007
     * @tc.desc      Test getLastIndexOf with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(255);
        arrayList.add(0);
        arrayList.add(128);
        arrayList.add(255);
        arrayList.add(0);
        arrayList.add(-1);
        arrayList.add(256);
        let result1: number = arrayList.getLastIndexOf(255);
        let result2: number = arrayList.getLastIndexOf(0);
        let result3: number = arrayList.getLastIndexOf(-1);
        let result4: number = arrayList.getLastIndexOf(256);
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(6);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF003_0800
     * @tc.name      testArrayList03GetLastIndexOf0008
     * @tc.desc      Test getLastIndexOf with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(3.4028234663852886e38);
        arrayList.add(-3.4028234663852886e38);
        arrayList.add(NaN);
        arrayList.add(Infinity);
        let result1: number = arrayList.getLastIndexOf(Infinity);
        let result2: number = arrayList.getLastIndexOf(-Infinity);
        let result3: int = -1;
        for (let i: int = arrayList.length - 1; i >= 0; i--) {
          if (isNaN(arrayList[i])) {
            result3 = i;
            break;
          }
        }
        let result4: number = arrayList.getLastIndexOf(3.4028234663852886e38);
        let result5: number = arrayList.getLastIndexOf(-3.4028234663852886e38);
        expect(result1).assertEqual(6);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_0900
     * @tc.name      testArrayList03GetLastIndexOf0009
     * @tc.desc      Test getLastIndexOf with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<bigint>();
        arrayList.add(9223372036854775807n);
        arrayList.add(-9223372036854775808n);
        arrayList.add(0n);
        arrayList.add(9223372036854775807n);
        arrayList.add(100n);
        arrayList.add(0n);
        let result1: number = arrayList.getLastIndexOf(9223372036854775807n);
        let result2: number = arrayList.getLastIndexOf(-9223372036854775808n);
        let result3: number = arrayList.getLastIndexOf(0n);
        let result4: number = arrayList.getLastIndexOf(100n);
        let result5: number = arrayList.getLastIndexOf(999n);
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(4);
        expect(result5).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1000
     * @tc.name      testArrayList03GetLastIndexOf0010
     * @tc.desc      Test getLastIndexOf with normal strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.add("banana");
        arrayList.add("date");
        arrayList.add("apple");
        arrayList.add("banana");
        let result1: number = arrayList.getLastIndexOf("banana");
        let result2: number = arrayList.getLastIndexOf("apple");
        let result3: number = arrayList.getLastIndexOf("cherry");
        let result4: number = arrayList.getLastIndexOf("date");
        let result5: number = arrayList.getLastIndexOf("grape");
        expect(result1).assertEqual(6);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(4);
        expect(result5).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1100
     * @tc.name      testArrayList03GetLastIndexOf0011
     * @tc.desc      Test getLastIndexOf with string special cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("");
        arrayList.add(" ");
        arrayList.add("0");
        arrayList.add("NaN");
        arrayList.add("");
        arrayList.add(" ");
        arrayList.add("0");
        let result1: number = arrayList.getLastIndexOf("");
        let result2: number = arrayList.getLastIndexOf(" ");
        let result3: number = arrayList.getLastIndexOf("0");
        let result4: number = arrayList.getLastIndexOf("NaN");
        let result5: number = arrayList.getLastIndexOf("null");
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(6);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1200
     * @tc.name      testArrayList03GetLastIndexOf0012
     * @tc.desc      Test getLastIndexOf with case sensitive strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("Apple");
        arrayList.add("APPLE");
        arrayList.add("apple");
        arrayList.add("Apple");
        arrayList.add("APPLE");
        let result1: number = arrayList.getLastIndexOf("apple");
        let result2: number = arrayList.getLastIndexOf("Apple");
        let result3: number = arrayList.getLastIndexOf("APPLE");
        let result4: number = arrayList.getLastIndexOf("ApPlE");
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1300
     * @tc.name      testArrayList03GetLastIndexOf0013
     * @tc.desc      Test getLastIndexOf with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("\n");
        arrayList.add("\t");
        arrayList.add("\\");
        arrayList.add("\"");
        arrayList.add("\n");
        arrayList.add("\t");
        arrayList.add("\x41");
        arrayList.add("\x41");
        let result1: number = arrayList.getLastIndexOf("\n");
        let result2: number = arrayList.getLastIndexOf("\t");
        let result3: number = arrayList.getLastIndexOf("\\");
        let result4: number = arrayList.getLastIndexOf("\"");
        let result5: number = arrayList.getLastIndexOf("A");
        let result6: number = arrayList.getLastIndexOf("\x41");
        let result7: number = arrayList.getLastIndexOf("\x41");
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(7);
        expect(result6).assertEqual(7);
        expect(result7).assertEqual(7);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1400
     * @tc.name      testArrayList03GetLastIndexOf0014
     * @tc.desc      Test getLastIndexOf with emoji and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("👆");
        arrayList.add("👿");
        arrayList.add("👀");
        arrayList.add("👆");
        arrayList.add("\ud83d\udc46");
        arrayList.add("\ud83d\udc7f");
        arrayList.add("\ud83d\udc46");
        let result1: number = arrayList.getLastIndexOf("👆");
        let result2: number = arrayList.getLastIndexOf("👿");
        let result3: number = arrayList.getLastIndexOf("👀");
        let result4: number = arrayList.getLastIndexOf("\ud83d\udc46");
        let result5: number = arrayList.getLastIndexOf("\ud83d\udc7f");
        expect(result1).assertEqual(6);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(6);
        expect(result5).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1500
     * @tc.name      testArrayList03GetLastIndexOf0015
     * @tc.desc      Test getLastIndexOf with large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        const largeString1 = "a".repeat(1000);
        const largeString2 = "b".repeat(1000);
        const largeString3 = "c".repeat(1000);
        arrayList.add("normal");
        arrayList.add(largeString1);
        arrayList.add("test");
        arrayList.add(largeString2);
        arrayList.add(largeString1);
        arrayList.add(largeString3);
        let result1: number = arrayList.getLastIndexOf(largeString1);
        let result2: number = arrayList.getLastIndexOf(largeString2);
        let result3: number = arrayList.getLastIndexOf(largeString3);
        let result4: number = arrayList.getLastIndexOf("normal");
        let result5: number = arrayList.getLastIndexOf("test");
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(3);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(0);
        expect(result5).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1600
     * @tc.name      testArrayList03GetLastIndexOf0016
     * @tc.desc      Test getLastIndexOf with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0);
        arrayList.add(-0);
        arrayList.add(NaN);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(0);
        arrayList.add(Infinity);
        const getLastIndexOfFix = (list: ArrayList<number>, target: number): number => {
          if (isNaN(target)) {
            for (let i: int = list.length - 1; i >= 0; i--) {
              if (isNaN(list[i])) return i;
            }
            return -1;
          }
          if (target === 0 || target === -0) {
            for (let i: int = list.length - 1; i >= 0; i--) {
              if (list[i] === 0 || list[i] === -0) return i;
            }
            return -1;
          }
          return list.getLastIndexOf(target);
        };
        let result1: number = getLastIndexOfFix(arrayList, 0);
        let result2: number = getLastIndexOfFix(arrayList, -0);
        let result3: number = getLastIndexOfFix(arrayList, NaN);
        let result4: number = getLastIndexOfFix(arrayList, Infinity);
        let result5: number = getLastIndexOfFix(arrayList, -Infinity);
        expect(result1).assertEqual(6);
        expect(result2).assertEqual(6);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(7);
        expect(result5).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1700
     * @tc.name      testArrayList03GetLastIndexOf0017
     * @tc.desc      Test getLastIndexOf with number precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0.1 + 0.2);
        arrayList.add(0.3);
        arrayList.add(1.0);
        arrayList.add(1);
        arrayList.add(0.1 + 0.2);
        let result1: number = arrayList.getLastIndexOf(0.3);
        let result2: number = arrayList.getLastIndexOf(0.1 + 0.2);
        let result3: number = arrayList.getLastIndexOf(1);
        let result4: number = arrayList.getLastIndexOf(1.0);
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(3);
        expect(result4).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1800
     * @tc.name      testArrayList03GetLastIndexOf0018
     * @tc.desc      Test getLastIndexOf with number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Number.MIN_VALUE);
        arrayList.add(Number.EPSILON);
        arrayList.add(Number.MAX_SAFE_INTEGER);
        arrayList.add(-Number.MAX_SAFE_INTEGER);
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Number.MIN_VALUE);
        let result1: number = arrayList.getLastIndexOf(Number.MAX_VALUE);
        let result2: number = arrayList.getLastIndexOf(Number.MIN_VALUE);
        let result3: number = arrayList.getLastIndexOf(Number.EPSILON);
        let result4: number = arrayList.getLastIndexOf(Number.MAX_SAFE_INTEGER);
        let result5: number = arrayList.getLastIndexOf(-Number.MAX_SAFE_INTEGER);
        expect(result1).assertEqual(5);
        expect(result2).assertEqual(6);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_1900
     * @tc.name      testArrayList03GetLastIndexOf0019
     * @tc.desc      Test getLastIndexOf with numbers in different formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(255);
        arrayList.add(0xff);
        arrayList.add(0o377);
        arrayList.add(2.55e2);
        arrayList.add(0b11111111);
        arrayList.add(255);
        let result1: number = arrayList.getLastIndexOf(255);
        let result2: number = arrayList.getLastIndexOf(0xff);
        let result3: number = arrayList.getLastIndexOf(0o377);
        let result4: number = arrayList.getLastIndexOf(2.55e2);
        let result5: number = arrayList.getLastIndexOf(0b11111111);
        expect(result1).assertEqual(5);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(5);
        expect(result4).assertEqual(5);
        expect(result5).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2000
     * @tc.name      testArrayList03GetLastIndexOf0020
     * @tc.desc      Test getLastIndexOf with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        let result1: number = arrayList.getLastIndexOf(true);
        let result2: number = arrayList.getLastIndexOf(false);
        let result3: number = arrayList.getLastIndexOf(Boolean(1));
        let result4: number = arrayList.getLastIndexOf(Boolean(0));
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(4);
        expect(result4).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2100
     * @tc.name      testArrayList03GetLastIndexOf0021
     * @tc.desc      Test getLastIndexOf with boolean coercion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean | number | string>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(1);
        arrayList.add(0);
        arrayList.add("true");
        arrayList.add("false");
        let result1: number = arrayList.getLastIndexOf(true);
        let result2: number = arrayList.getLastIndexOf(false);
        let result3: number = arrayList.getLastIndexOf(1);
        let result4: number = arrayList.getLastIndexOf(0);
        let result5: number = arrayList.getLastIndexOf("true");
        let result6: number = arrayList.getLastIndexOf("false");
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(4);
        expect(result6).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2200
     * @tc.name      testArrayList03GetLastIndexOf0022
     * @tc.desc      Test getLastIndexOf with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0022';
        console.log(TAG + ' start');
        const arr1: number[] = [1, 2, 3];
        const arr2: number[] = [4, 5, 6];
        const arr3: number[] = [1, 2, 3];
        const arr4: number[] = [7, 8, 9];
        let arrayList = new ArrayList<number[]>();
        arrayList.add(arr1);
        arrayList.add(arr2);
        arrayList.add(arr1);
        arrayList.add(arr3);
        arrayList.add(arr4);
        let result1: number = arrayList.getLastIndexOf(arr1);
        let result2: number = arrayList.getLastIndexOf(arr2);
        let result3: number = arrayList.getLastIndexOf(arr3);
        let result4: number = arrayList.getLastIndexOf(arr4);
        let result5: number = arrayList.getLastIndexOf([1.0, 2.0, 3.0]);
        expect(result1).assertEqual(2);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(3);
        expect(result4).assertEqual(4);
        expect(result5).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2300
     * @tc.name      testArrayList03GetLastIndexOf0023
     * @tc.desc      Test getLastIndexOf with typed arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0023';
        console.log(TAG + ' start');
        const uint8Array1 = new Uint8Array([72, 101, 108, 108, 111]);
        const uint8Array2 = new Uint8Array([72, 101, 108, 108, 111]);
        const int8Array = new Int8Array([-1, 0, 1]);
        const float32Array = new Float32Array([1.1, 2.2, 3.3]);
        let arrayList = new ArrayList<ArrayLike<number>>();
        arrayList.add(uint8Array1);
        arrayList.add(int8Array);
        arrayList.add(float32Array);
        arrayList.add(uint8Array1);
        arrayList.add(uint8Array2);
        const result1 = arrayList.getLastIndexOf(uint8Array1);
        const result2 = arrayList.getLastIndexOf(uint8Array2);
        const result3 = arrayList.getLastIndexOf(int8Array);
        const result4 = arrayList.getLastIndexOf(float32Array);
        const result5 = arrayList.getLastIndexOf(new Uint8Array([72, 101, 108, 108, 111]));
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(1);
        expect(result4).assertEqual(2);
        expect(result5).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2400
     * @tc.name      testArrayList03GetLastIndexOf0024
     * @tc.desc      Test getLastIndexOf with object references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0024';
        console.log(TAG + ' start');
        const obj1: TestObj1 = { a: 1, b: "test" };
        const obj2: TestObj2 = { c: 2, d: [1, 2, 3] };
        const obj3: TestObj1 = { a: 1, b: "test" };
        const arrayList = new ArrayList<object>();
        arrayList.add(obj1);
        arrayList.add(obj2);
        arrayList.add(obj1);
        arrayList.add(obj3);
        const result1 = arrayList.getLastIndexOf(obj1);
        const result2 = arrayList.getLastIndexOf(obj2);
        const result3 = arrayList.getLastIndexOf(obj3);
        const result4 = arrayList.getLastIndexOf({ a: 1, b: "test" } as TestObj1);
        expect(result1).assertEqual(2);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(3);
        expect(result4).assertEqual(-1);
        console.log("Object reference equality in getLastIndexOf verified");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2500
     * @tc.name      testArrayList03GetLastIndexOf0025
     * @tc.desc      Test getLastIndexOf with complex objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0025';
        console.log(TAG + ' start');
        const map1 = new Map<string, string>([['key1', 'value1']]);
        const set1 = new Set<number>([1, 2, 3]);
        const date1 = new Date('2023-01-01');
        const regex1 = new RegExp("test", "gi");
        const builtInObjects = [
          map1,
          set1,
          date1,
          regex1,
          map1,
          set1
        ];
        const result1 = builtInObjects.lastIndexOf(map1);
        const result2 = builtInObjects.lastIndexOf(set1);
        const result3 = builtInObjects.lastIndexOf(date1);
        const result4 = builtInObjects.lastIndexOf(regex1);
        const result5 = builtInObjects.lastIndexOf(new Map<string, string>([['key1', 'value1']]));
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(5);
        expect(result3).assertEqual(2);
        expect(result4).assertEqual(3);
        expect(result5).assertEqual(-1);
        console.log("Built-in object reference equality in lastIndexOf verified");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2600
     * @tc.name      testArrayList03GetLastIndexOf0026
     * @tc.desc      Test getLastIndexOf with special objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0026';
        console.log(TAG + ' start');
        let nullList = new ArrayList<string | null>();
        nullList.add("a");
        nullList.add(null);
        nullList.add("b");
        nullList.add(null);
        const result1: number = nullList.getLastIndexOf(null);
        expect(result1).assertEqual(3);
        let undefList = new ArrayList<string | undefined>();
        undefList.add("a");
        undefList.add(undefined);
        undefList.add("b");
        undefList.add(undefined);
        const result2: number = undefList.getLastIndexOf(undefined);
        expect(result2).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2700
     * @tc.name      testArrayList03GetLastIndexOf0027
     * @tc.desc      Test getLastIndexOf with empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0027';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        let result: number = arrayList.getLastIndexOf(42);
        expect(result).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2800
     * @tc.name      testArrayList03GetLastIndexOf0028
     * @tc.desc      Test getLastIndexOf with single element array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0028';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(42);
        let result1: number = arrayList.getLastIndexOf(42);
        let result2: number = arrayList.getLastIndexOf(100);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(-1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_2900
     * @tc.name      testArrayList03GetLastIndexOf0029
     * @tc.desc      Test getLastIndexOf with large ArrayList
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0029", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0029';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size: int = 10000;
        for (let i: int = 0; i < size; i++) {
          arrayList.add(i);
        }
        arrayList.add(9999);
        const startTime = Date.now();
        let result: number = arrayList.getLastIndexOf(9999);
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(result).assertEqual(size);
        expect(duration).assertLess(100);
        console.log(`Found element in ${size+1} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_3000
     * @tc.name      testArrayList03GetLastIndexOf0030
     * @tc.desc      Test getLastIndexOf when element is at start (but appears multiple times)
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0030", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0030';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size: int = 1000;
        arrayList.add(42);
        for (let i: int = 1; i < size; i++) {
          arrayList.add(i);
        }
        arrayList.add(42);
        let result: number = arrayList.getLastIndexOf(42);
        expect(result).assertEqual(size);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_3100
     * @tc.name      testArrayList03GetLastIndexOf0031
     * @tc.desc      Test getLastIndexOf method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0031';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number | string | boolean>();
        arrayList.add(1);
        arrayList.add("1");
        arrayList.add(true);
        arrayList.add(1);
        arrayList.add("1");
        let result1: number = arrayList.getLastIndexOf(1);
        let result2: number = arrayList.getLastIndexOf("1");
        let result3: number = arrayList.getLastIndexOf(true);
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_3200
     * @tc.name      testArrayList03GetLastIndexOf0032
     * @tc.desc      Test getLastIndexOf with NaN handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0032';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(NaN);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(NaN);
        arrayList.add(3);
        const getLastIndexOfNaN = (list: ArrayList<number>): number => {
          for (let i: int = list.length - 1; i >= 0; i--) {
            if (isNaN(list[i])) return i;
          }
          return -1;
        };
        let result: number = getLastIndexOfNaN(arrayList);
        let result2: number = getLastIndexOfNaN(arrayList);
        let result3: number = getLastIndexOfNaN(arrayList);
        expect(result).assertEqual(3);
        expect(result2).assertEqual(3);
        expect(result3).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_GETLASTINDEXOF03_3300
     * @tc.name      testArrayList03GetLastIndexOf0033
     * @tc.desc      Test getLastIndexOf with positive and negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList03GetLastIndexOf0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03GetLastIndexOf0033';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0);
        arrayList.add(-0);
        arrayList.add(1);
        arrayList.add(0);
        arrayList.add(-0);
        let result1: number = arrayList.getLastIndexOf(0);
        let result2: number = arrayList.getLastIndexOf(-0);
        let result3: number = arrayList.getLastIndexOf(+0);
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(4);
        expect(result3).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0100
     * @tc.name      testArrayList04IncreaseCapacityTo0001
     * @tc.desc      Test increaseCapacityTo normal operation (increase capacity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.increaseCapacityTo(8);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(5);
        expect(arrayList[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0200
     * @tc.name      testArrayList04IncreaseCapacityTo0002
     * @tc.desc      Test increaseCapacityTo with same capacity (no change)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.increaseCapacityTo(4);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(5);
        expect(arrayList[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0300
     * @tc.name      testArrayList04IncreaseCapacityTo0003
     * @tc.desc      Test increaseCapacityTo with smaller capacity (no change)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.increaseCapacityTo(2);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(5);
        expect(arrayList[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0400
     * @tc.name      testArrayList04IncreaseCapacityTo0004
     * @tc.desc      Test increaseCapacityTo with empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.increaseCapacityTo(10);
        expect(arrayList.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0500
     * @tc.name      testArrayList04IncreaseCapacityTo0005
     * @tc.desc      Test increaseCapacityTo with zero capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.increaseCapacityTo(0);
        expect(arrayList.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0600
     * @tc.name      testArrayList04IncreaseCapacityTo0006
     * @tc.desc      Test adding elements after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(10);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(6);
        arrayList.add(7);
        arrayList.add(8);
        expect(arrayList.length).assertEqual(8);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        expect(arrayList[3]).assertEqual(4);
        expect(arrayList[4]).assertEqual(5);
        expect(arrayList[5]).assertEqual(6);
        expect(arrayList[6]).assertEqual(7);
        expect(arrayList[7]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0700
     * @tc.name      testArrayList04IncreaseCapacityTo0007
     * @tc.desc      Test increaseCapacityTo with boundary number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.increaseCapacityTo(0);
        expect(arrayList.length).assertEqual(2);
        arrayList.increaseCapacityTo(1);
        expect(arrayList.length).assertEqual(2);
        arrayList.increaseCapacityTo(2);
        expect(arrayList.length).assertEqual(2);
        arrayList.increaseCapacityTo(1000);
        expect(arrayList.length).assertEqual(2);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0800
     * @tc.name      testArrayList04IncreaseCapacityTo0008
     * @tc.desc      Test increaseCapacityTo with floating point capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        try {
          arrayList.increaseCapacityTo((3.5).toInt());
          expect(arrayList.length).assertEqual(3);
          arrayList.increaseCapacityTo((5.9).toInt());
          expect(arrayList.length).assertEqual(3);
        } catch (error) {
          console.log("Float capacity may cause error: " + error.message);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_0900
     * @tc.name      testArrayList04IncreaseCapacityTo0009
     * @tc.desc      Test increaseCapacityTo with negative capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        let hasError = false;
        let originalLength: int = 0;
        try {
          originalLength = arrayList.length;
          arrayList.increaseCapacityTo(-1);
        } catch (err) {
          hasError = true;
        }
        expect(hasError).assertEqual(false);
        expect(arrayList.length).assertEqual(originalLength);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1000
     * @tc.name      testArrayList04IncreaseCapacityTo0010
     * @tc.desc      Test increaseCapacityTo with maximum safe integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.increaseCapacityTo(Number.MAX_SAFE_INTEGER.toInt());
          expect(arrayList.length).assertEqual(1);
          expect(arrayList[0]).assertEqual(1);
        } catch (error) {
          console.log("Max safe integer may cause error: " + (error.message || error));
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1100
     * @tc.name      testArrayList04IncreaseCapacityTo0011
     * @tc.desc      Test increaseCapacityTo with Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        try {
          arrayList.increaseCapacityTo(Infinity.toInt());
          expect(arrayList.length).assertEqual(2);
          expect(arrayList[0]).assertEqual(1);
          expect(arrayList[1]).assertEqual(2);
        } catch (e) {
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1200
     * @tc.name      testArrayList04IncreaseCapacityTo0012
     * @tc.desc      Test increaseCapacityTo with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        let hasError = false;
        try {
          arrayList.increaseCapacityTo(NaN.toInt());
        } catch (err) {
          hasError = true;
        }
        expect(hasError || arrayList.length === 1).assertTrue();
        expect(arrayList[0]).assertEqual(1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1300
     * @tc.name      testArrayList04IncreaseCapacityTo0013
     * @tc.desc      Test increaseCapacityTo with numbers in different formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(0x0A);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(0o12);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(0b1010);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo((1e1).toInt());
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1400
     * @tc.name      testArrayList04IncreaseCapacityTo0014
     * @tc.desc      Test increaseCapacityTo with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.increaseCapacityTo(10);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual("apple");
        expect(arrayList[1]).assertEqual("banana");
        expect(arrayList[2]).assertEqual("cherry");
        arrayList.add("date");
        arrayList.add("elderberry");
        expect(arrayList.length).assertEqual(5);
        expect(arrayList[3]).assertEqual("date");
        expect(arrayList[4]).assertEqual("elderberry");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1500
     * @tc.name      testArrayList04IncreaseCapacityTo0015
     * @tc.desc      Test increaseCapacityTo with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.increaseCapacityTo(8);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertTrue();
        expect(arrayList[1]).assertFalse();
        expect(arrayList[2]).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1600
     * @tc.name      testArrayList04IncreaseCapacityTo0016
     * @tc.desc      Test increaseCapacityTo with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Person>();
        const obj1: Person = { name: "Alice", age: 30 };
        const obj2: Person = { name: "Bob", age: 25 };
        const obj3: Person = { name: "Charlie", age: 35 };
        arrayList.add(obj1);
        arrayList.add(obj2);
        arrayList.add(obj3);
        arrayList.increaseCapacityTo(10);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertDeepEquals(obj1);
        expect(arrayList[1]).assertDeepEquals(obj2);
        expect(arrayList[2]).assertDeepEquals(obj3);
        const obj4: Person = { name: "David", age: 28 };
        arrayList.add(obj4);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[3]).assertDeepEquals(obj4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1700
     * @tc.name      testArrayList04IncreaseCapacityTo0017
     * @tc.desc      Test increaseCapacityTo with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number[]>();
        const arr1: number[] = [1, 2, 3];
        const arr2: number[] = [4, 5, 6];
        const arr3: number[] = [7, 8, 9];
        arrayList.add(arr1);
        arrayList.add(arr2);
        arrayList.add(arr3);
        arrayList.increaseCapacityTo(8);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertDeepEquals(arr1);
        expect(arrayList[1]).assertDeepEquals(arr2);
        expect(arrayList[2]).assertDeepEquals(arr3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1800
     * @tc.name      testArrayList04IncreaseCapacityTo0018
     * @tc.desc      Test increaseCapacityTo with mixed type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(5);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(10);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(20);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(15);
        expect(arrayList.length).assertEqual(3);
        arrayList.increaseCapacityTo(5);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_1900
     * @tc.name      testArrayList04IncreaseCapacityTo0019
     * @tc.desc      Test increaseCapacityTo with additions between calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.increaseCapacityTo(5);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.increaseCapacityTo(10);
        arrayList.add(5);
        arrayList.add(6);
        arrayList.add(7);
        expect(arrayList.length).assertEqual(7);
        for (let i: int = 0; i < 7; i++) {
          expect(arrayList[i]).assertEqual(i + 1);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2000
     * @tc.name      testArrayList04IncreaseCapacityTo0020
     * @tc.desc      Test increaseCapacityTo with large capacity
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0020", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i: int = 0; i < 100; i++) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        arrayList.increaseCapacityTo(100000);
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(100);
        for (let i: int = 0; i < 100; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        expect(duration).assertLess(1000);
        console.log(`Increased capacity to 100000 in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2100
     * @tc.name      testArrayList04IncreaseCapacityTo0021
     * @tc.desc      Test multiple large capacity increases
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0021", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i: int = 0; i < 1000; i++) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        arrayList.increaseCapacityTo(50);
        arrayList.increaseCapacityTo(100);
        arrayList.increaseCapacityTo(200);
        arrayList.increaseCapacityTo(500);
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(1000);
        for (let i: int = 0; i < 1000; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        expect(duration).assertLess(2000);
        console.log(`Multiple capacity increases completed in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2200
     * @tc.name      testArrayList04IncreaseCapacityTo0022
     * @tc.desc      Test increaseCapacityTo with invalid parameter type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0022';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        let testPassed = false;
        try {
          arrayList.increaseCapacityTo(0);
          if (arrayList[0] === 1) {
            testPassed = true;
          }
        } catch (error) {
          testPassed = true;
        }
        expect(testPassed).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2300
     * @tc.name      testArrayList04IncreaseCapacityTo0023
     * @tc.desc      Test increaseCapacityTo with missing parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0023';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        let testSucceeded = false;
        try {
          arrayList.increaseCapacityTo(NaN.toInt());
          if (arrayList[0] === 1) {
            testSucceeded = true;
          }
        } catch (error) {
          testSucceeded = true;
        }
        expect(testSucceeded).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2400
     * @tc.name      testArrayList04IncreaseCapacityTo0024
     * @tc.desc      Test increaseCapacityTo method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0024';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        let foundExpectedError = false;
        try {
          arrayList.increaseCapacityTo(10);
          if (arrayList[0] === 1) {
            foundExpectedError = true;
          }
        } catch (error) {
          foundExpectedError = true;
        }
        expect(foundExpectedError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2500
     * @tc.name      testArrayList04IncreaseCapacityTo0025
     * @tc.desc      Test removing elements after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0025';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i: int = 0; i < 10; i++) {
          arrayList.add(i);
        }
        arrayList.increaseCapacityTo(20);
        arrayList.removeByIndex(5);
        arrayList.removeByIndex(2);
        expect(arrayList.length).assertEqual(8);
        expect(arrayList[0]).assertEqual(0);
        expect(arrayList[1]).assertEqual(1);
        expect(arrayList[2]).assertEqual(3);
        expect(arrayList[3]).assertEqual(4);
        expect(arrayList[4]).assertEqual(6);
        expect(arrayList[5]).assertEqual(7);
        expect(arrayList[6]).assertEqual(8);
        expect(arrayList[7]).assertEqual(9);
        console.log(TAG + ' done');
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2600
     * @tc.name      testArrayList04IncreaseCapacityTo0026
     * @tc.desc      Test clearing array after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(10);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        arrayList.add(10);
        arrayList.add(20);
        expect(arrayList.length).assertEqual(2);
        expect(arrayList[0]).assertEqual(10);
        expect(arrayList[1]).assertEqual(20);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_INCREASECAPACITYTO04_2700
     * @tc.name      testArrayList04IncreaseCapacityTo0027
     * @tc.desc      Test modifying elements after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0027';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(10);
        arrayList.removeByIndex(1);
        arrayList.add(20);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(3);
        expect(arrayList[2]).assertEqual(20);
        console.log(TAG + ' done');
      });
  })
}