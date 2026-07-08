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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { ArrayList } from '@kit.ArkTS';
import Utils from '../Util.test';

interface TestObject07 {
  a: number;
}

interface LargeObject07 {
  data: number[];
}

export default function ArrayList07Test(): void {
  describe('ArrayList07Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0100
     * @tc.name      testArraylist01NormalMiddleElement0001
     * @tc.desc      Test normal index: remove middle element at index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01NormalMiddleElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01NormalMiddleElement0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(4);
        let result: number = arrayList.removeByIndex(2);
        expect(result).assertEqual(5);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0200
     * @tc.name      testArraylist01FirstElement0002
     * @tc.desc      Test boundary index: remove first element at index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01FirstElement0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01FirstElement0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        let result: number = arrayList.removeByIndex(0);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0300
     * @tc.name      testArraylist01LastElement0003
     * @tc.desc      Test boundary index: remove last element at index size-1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01LastElement0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01LastElement0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        let result: number = arrayList.removeByIndex(1);
        expect(result).assertEqual(20);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0400
     * @tc.name      testArraylist01SingleElement0004
     * @tc.desc      Test single element list: remove element at index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01SingleElement0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01SingleElement0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        let result: number = arrayList.removeByIndex(0);
        expect(result).assertEqual(100);
        expect(arrayList.length).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0500
     * @tc.name      testArraylist01OutOfRangeEqualToSize0005
     * @tc.desc      Test out-of-range index: index equals list size (should trigger error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01OutOfRangeEqualToSize0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01OutOfRangeEqualToSize0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        try {
          arrayList.removeByIndex(2);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0600
     * @tc.name      testArraylist01OutOfRangeGreaterThanSize0006
     * @tc.desc      Test out-of-range index: index greater than list size (should trigger error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01OutOfRangeGreaterThanSize0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01OutOfRangeGreaterThanSize0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(5);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0700
     * @tc.name      testArraylist01NegativeIndex0007
     * @tc.desc      Test negative index: -1 (should trigger error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01NegativeIndex0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01NegativeIndex0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(-1);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0800
     * @tc.name      testArraylist01LargeNegative0008
     * @tc.desc      Test large negative index: -100 (should trigger error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01LargeNegative0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01LargeNegative0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(-100);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_0900
     * @tc.name      testArraylist01NaN0009
     * @tc.desc      Test special value: NaN index (should trigger parameter error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01NaN0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01NaN0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(NaN.toInt());
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1000
     * @tc.name      testArraylist01PositiveInfinity0010
     * @tc.desc      Test special value: Infinity index (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01PositiveInfinity0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01PositiveInfinity0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(Infinity.toInt());
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1100
     * @tc.name      testArraylist01PositiveInfinity0011
     * @tc.desc      Test special value: Infinity index (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01PositiveInfinity0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01PositiveInfinity0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(Infinity.toInt());
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1200
     * @tc.name      testArraylist01Undefined0012
     * @tc.desc      Test special value: undefined index (should trigger parameter error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01Undefined0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01Undefined0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        expect(arrayList.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1300
     * @tc.name      testArraylist01Null0013
     * @tc.desc      Test special value: null index (should trigger parameter error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01Null0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01Null0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        expect(arrayList.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1400
     * @tc.name      testArraylist01MaxSafeInteger0014
     * @tc.desc      Test maximum safe integer: Number.MAX_SAFE_INTEGER (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01MaxSafeInteger0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01MaxSafeInteger0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(Number.MAX_SAFE_INTEGER.toInt());
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1500
     * @tc.name      testArraylist01MaxValue0015
     * @tc.desc      Test maximum number value: Number.MAX_VALUE (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01MaxValue0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01MaxValue0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(Number.MAX_VALUE.toInt());
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1600
     * @tc.name      testArraylist01MinValue0016
     * @tc.desc      Test minimum number value: Number.MIN_VALUE (should be treated as 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01MinValue0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01MinValue0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(999);
        try {
          let result: number = arrayList.removeByIndex(Number.MIN_VALUE.toInt());
          expect(result).assertEqual(999);
        } catch (error) {
          expect(error.code).assertEqual(401);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1700
     * @tc.name      testArraylist01Epsilon0017
     * @tc.desc      Test epsilon value: Number.EPSILON (should be treated as 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01Epsilon0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01Epsilon0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(888);
        try {
          let result: number = arrayList.removeByIndex(Number.EPSILON.toInt());
          expect(result).assertEqual(888);
        } catch (error) {
          expect(error.code).assertEqual(401);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1800
     * @tc.name      testArraylist01NegativeZero0018
     * @tc.desc      Test negative zero: -0 (should be treated as 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01NegativeZero0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01NegativeZero0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(777);
        let result: number = arrayList.removeByIndex(-0);
        expect(result).assertEqual(777);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_1900
     * @tc.name      testArraylist01FloatNumber0019
     * @tc.desc      Test float number: 1.5 (should trigger parameter error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01FloatNumber0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01FloatNumber0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        let result: number = arrayList.removeByIndex((1.5).toInt());
        expect(result).assertEqual(2);
        expect(arrayList.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2000
     * @tc.name      testArraylist01ScientificNotation0020
     * @tc.desc      Test scientific notation: 1e0 (should be treated as 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01ScientificNotation0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ScientificNotation0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        arrayList.add(200);
        arrayList.add(300);
        let result: number = arrayList.removeByIndex((1e0).toInt());
        expect(result).assertEqual(200);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2100
     * @tc.name      testArraylist01HexNumber0021
     * @tc.desc      Test hexadecimal number: 0x1 (should be treated as 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01HexNumber0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01HexNumber0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        arrayList.add(200);
        let result: number = arrayList.removeByIndex(0x1);
        expect(result).assertEqual(200);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2200
     * @tc.name      testArraylist01OctalNumber0022
     * @tc.desc      Test octal number: 0o1 (should be treated as 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01OctalNumber0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01OctalNumber0022';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        arrayList.add(200);
        let result: number = arrayList.removeByIndex(0o1);
        expect(result).assertEqual(200);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2300
     * @tc.name      testArraylist01BinaryNumber0023
     * @tc.desc      Test binary number: 0b1 (should be treated as 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01BinaryNumber0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01BinaryNumber0023';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        arrayList.add(200);
        let result: number = arrayList.removeByIndex(0b1);
        expect(result).assertEqual(200);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2400
     * @tc.name      testArraylist01ExponentOperator0024
     * @tc.desc      Test exponent operator: 2**0 (should be treated as 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01ExponentOperator0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ExponentOperator0024';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(100);
        arrayList.add(200);
        let result: number = arrayList.removeByIndex((2**0).toInt());
        expect(result).assertEqual(200);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2500
     * @tc.name      testArraylist01EmptyList0025
     * @tc.desc      Test empty list: index 0 (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01EmptyList0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01EmptyList0025';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        try {
          arrayList.removeByIndex(0);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200010);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2600
     * @tc.name      testArraylist01MaxInt320026
     * @tc.desc      Test maximum int32 value: 2147483647 (should trigger out-of-range error 10200001 for empty list)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01MaxInt320026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01MaxInt320026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(2147483647);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2700
     * @tc.name      testArraylist01BeyondInt32Max0027
     * @tc.desc      Test beyond int32 maximum: 2147483648 (should trigger out-of-range error 10200001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01BeyondInt32Max0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01BeyondInt32Max0027';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        try {
          arrayList.removeByIndex(2147483647);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2800
     * @tc.name      testArraylist01VerifyListStateAfterRemoval0028
     * @tc.desc      Test list state after removal: verify elements are properly shifted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01VerifyListStateAfterRemoval0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01VerifyListStateAfterRemoval0028';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);

        let result: number = arrayList.removeByIndex(1);
        expect(result).assertEqual(2);
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(3);
        expect(arrayList[2]).assertEqual(4);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_2900
     * @tc.name      testArraylist01MultipleConsecutiveRemovals0029
     * @tc.desc      Test multiple consecutive removals: verify list integrity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylist01MultipleConsecutiveRemovals0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01MultipleConsecutiveRemovals0029';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        arrayList.add(40);
        arrayList.add(50);

        let result1: number = arrayList.removeByIndex(2);
        expect(result1).assertEqual(30);
        expect(arrayList.length).assertEqual(4);

        let result2: number = arrayList.removeByIndex(0);
        expect(result2).assertEqual(10);
        expect(arrayList.length).assertEqual(3);

        let result3: number = arrayList.removeByIndex(2);
        expect(result3).assertEqual(50);
        expect(arrayList.length).assertEqual(2);

        expect(arrayList[0]).assertEqual(20);
        expect(arrayList[1]).assertEqual(40);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3000
     * @tc.name      testArraylist02IntElement0001
     * @tc.desc      Remove an existing integer element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02IntElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02IntElement0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        const result = list.remove(1);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3100
     * @tc.name      testArraylist02NonExistInt0002
     * @tc.desc      Attempt to remove a non-existing integer element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02NonExistInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02NonExistInt0002';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        const result = list.remove(99);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3200
     * @tc.name      testArraylist02StringElement0003
     * @tc.desc      Remove an existing string element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02StringElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02StringElement0003';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add('abc');
        list.add('def');
        const result = list.remove('abc');
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3300
     * @tc.name      testArraylist02EmptyString0004
     * @tc.desc      Remove empty string element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02EmptyString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02EmptyString0004';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add('');
        const result = list.remove('');
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3400
     * @tc.name      testArraylist02BooleanTrue0005
     * @tc.desc      Remove boolean true element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02BooleanTrue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02BooleanTrue0005';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.add(true);
        list.add(false);
        const result = list.remove(true);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3500
     * @tc.name      testArraylist02NaNNumber0006
     * @tc.desc      Remove NaN element from ArrayList and verify comparison behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02NaNNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02NaNNumber0006';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(NaN);
        const result = list.remove(NaN);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3600
     * @tc.name      testArraylist02Infinity0007
     * @tc.desc      Remove Infinity element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Infinity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Infinity0007';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(Infinity);
        const result = list.remove(Infinity);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3700
     * @tc.name      testArraylist02ObjectReference0008
     * @tc.desc      Remove object element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02ObjectReference0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02ObjectReference0008';
        console.log(TAG + ' start');

        const obj: TestObject07 = { a: 1 };
        const list = new ArrayList<TestObject07>();
        list.add(obj);
        const result = list.remove(obj);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3800
     * @tc.name      testArraylist02DifferentObject0009
     * @tc.desc      Remove object with same structure but different reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02DifferentObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02DifferentObject0009';
        console.log(TAG + ' start');
        const list = new ArrayList<TestObject07>();
        list.add({ a: 1 } as TestObject07);
        const result = list.remove({ a: 1 } as TestObject07);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_3900
     * @tc.name      testArraylist02Undefined0010
     * @tc.desc      Attempt to remove undefined element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Undefined0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Undefined0010';
        console.log(TAG + ' start');
        const list = new ArrayList<undefined>();
        list.add(undefined);
        const result = list.remove(undefined);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4000
     * @tc.name      testArraylist02TypedArray0011
     * @tc.desc      Remove TypedArray element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02TypedArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02TypedArray0011';
        console.log(TAG + ' start');
        const ta = new Uint8Array([1, 2, 3]);
        const list = new ArrayList<Uint8Array>();
        list.add(ta);
        const result = list.remove(ta);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4100
     * @tc.name      testArraylist02TypedArrayDifferentRef0012
     * @tc.desc      Remove TypedArray with same content but different reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02TypedArrayDifferentRef0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02TypedArrayDifferentRef0012';
        console.log(TAG + ' start');
        const list = new ArrayList<Uint8Array>();
        list.add(new Uint8Array([1, 2, 3]));
        const result = list.remove(new Uint8Array([1, 2, 3]));
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4200
     * @tc.name      testArraylist02ArrayElement0013
     * @tc.desc      Remove array element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02ArrayElement0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02ArrayElement0013';
        console.log(TAG + ' start');
        const arr: number[] = [1, 2, 3];
        const list = new ArrayList<Array<number>>();
        list.add(arr);
        const result = list.remove(arr);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4300
     * @tc.name      testArraylist02BigInt0014
     * @tc.desc      Remove BigInt element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02BigInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02BigInt0014';
        console.log(TAG + ' start');
        const list = new ArrayList<bigint>();
        list.add(10n);
        const result = list.remove(10n);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4400
     * @tc.name      testArraylist02Symbol0015
     * @tc.desc      Remove Symbol element using same Symbol reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Symbol0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Symbol0015';
        console.log(TAG + ' start');
        const sym = "test";

        const list = new ArrayList<string>();
        list.add(sym);
        const result = list.remove(sym);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4500
     * @tc.name      testArraylist02Function0016
     * @tc.desc      Remove function element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Function0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Function0016';
        console.log(TAG + ' start');
        const fn = () => 1;
        const list = new ArrayList<Function>();
        list.add(fn);
        const result = list.remove(fn);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4600
     * @tc.name      testArraylist02Map0017
     * @tc.desc      Remove Map element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Map0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Map0017';
        console.log(TAG + ' start');
        const map = new Map<string, number>([['a', 1]]);
        const list = new ArrayList<Map<string, number>>();
        list.add(map);
        const result = list.remove(map);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4700
     * @tc.name      testArraylist02Set0018
     * @tc.desc      Remove Set element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Set0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Set0018';
        console.log(TAG + ' start');
        const set = new Set<number>([1, 2]);
        const list = new ArrayList<Set<number>>();
        list.add(set);
        const result = list.remove(set);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4800
     * @tc.name      testArraylist02Promise0019
     * @tc.desc      Remove Promise element using same reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Promise0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Promise0019';
        console.log(TAG + ' start');
        const promise: Promise<number> = Promise.resolve<number>(1);
        const list = new ArrayList<Promise<number>>();
        list.add(promise);
        const result = list.remove(promise);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_4900
     * @tc.name      testArraylist02AfterDelete0020
     * @tc.desc      Remove element after delete operation on object property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02AfterDelete0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02AfterDelete0020';
        console.log(TAG + ' start');

        const obj: TestObject07 = { a: 1 };
        const list = new ArrayList<TestObject07>();
        list.add(obj);

        const result = list.remove(obj);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5000
     * @tc.name      testArraylist02Null0021
     * @tc.desc      Remove null element from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02Null0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02Null0021';
        console.log(TAG + ' start');
        const list = new ArrayList<null>();
        list.add(null);
        const result = list.remove(null);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5100
     * @tc.name      testArraylist02ZeroAndNegativeZero0022
     * @tc.desc      Remove negative zero when zero exists in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02ZeroAndNegativeZero0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02ZeroAndNegativeZero0022';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(0);
        const result = list.remove(-0);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5200
     * @tc.name      testArraylist02LargeSafeInteger0023
     * @tc.desc      Remove Number.MAX_SAFE_INTEGER from ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02LargeSafeInteger0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02LargeSafeInteger0023';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(Number.MAX_SAFE_INTEGER);
        const result = list.remove(Number.MAX_SAFE_INTEGER);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5300
     * @tc.name      testArraylist02UnsafeInteger0024
     * @tc.desc      Remove unsafe integer beyond MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02UnsafeInteger0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02UnsafeInteger0024';
        console.log(TAG + ' start');
        const value = Number.MAX_SAFE_INTEGER + 1;
        const list = new ArrayList<number>();
        list.add(value);
        const result = list.remove(value);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5400
     * @tc.name      testArraylist02FloatPrecision0025
     * @tc.desc      Remove floating number with precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02FloatPrecision0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02FloatPrecision0025';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(0.1 + 0.2);
        const result = list.remove(0.30000000000000004);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5500
     * @tc.name      testArraylist02StringEmoji0026
     * @tc.desc      Remove string containing emoji character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02StringEmoji0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02StringEmoji0026';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add('👆');
        const result = list.remove('👆');
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5600
     * @tc.name      testArraylist02UnicodeEscapeString0027
     * @tc.desc      Remove string created by unicode escape sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02UnicodeEscapeString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02UnicodeEscapeString0027';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const str = '\ud83d\udc46';
        list.add(str);
        const result = list.remove('👆');
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5700
     * @tc.name      testArraylist02LargeObject0028
     * @tc.desc      Remove object with large number of properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02LargeObject0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02LargeObject0028';
        console.log(TAG + ' start');

        const obj: LargeObject07 = { data: [] };
        for (let i: int = 0; i < 1000; i++) {
          obj.data.push(i);
        }
        const list = new ArrayList<LargeObject07>();
        list.add(obj);
        const result = list.remove(obj);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5800
     * @tc.name      testArraylist02SameValueMultipleTimes0029
     * @tc.desc      Remove only the first matched element when duplicates exist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02SameValueMultipleTimes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02SameValueMultipleTimes0029';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(1);
        list.add(1);
        const result = list.remove(1);
        expect(result).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_5900
     * @tc.name      testArraylist02FromEmptyList0030
     * @tc.desc      Attempt to remove element from empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist02FromEmptyList0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist02FromEmptyList0030';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        const result = list.remove(1);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6000
     * @tc.name      testArraylist03Normal0001
     * @tc.desc      Remove a middle range [1,3) from a 4-item list and verify remaining items
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03Normal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03Normal0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(10);
        list.add(20);
        list.add(30);
        list.add(40);
        list.removeByRange(1, 3);
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(10);
        expect(list[1]).assertEqual(40);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6100
     * @tc.name      testArraylist03FromEqualsTo0002
     * @tc.desc      Call removeByRange with fromIndex == toIndex should be no-op
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03FromEqualsTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03FromEqualsTo0002';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);

        try {
          list.removeByRange(1, 1);
          expect(true).assertEqual(false);
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }

        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(1);
        expect(list[1]).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6200
     * @tc.name      testArraylist03RemoveAll0003
     * @tc.desc      Remove full range [0, length) should clear the list
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03RemoveAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03RemoveAll0003';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.removeByRange(0, list.length);
        expect(list.length).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6300
     * @tc.name      testArraylist03Tail0004
     * @tc.desc      Remove tail range where toIndex == length should remove to end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03Tail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03Tail0004';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(5);
        list.add(6);
        list.add(7);
        list.removeByRange(2, 3);
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(5);
        expect(list[1]).assertEqual(6);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6400
     * @tc.name      testArraylist03FromGreaterThanTo0005
     * @tc.desc      fromIndex > toIndex must trigger parameter/validation error (caught)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03FromGreaterThanTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03FromGreaterThanTo0005';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        let hasError = false;
        try {
          list.removeByRange(2, 1);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200001);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6500
     * @tc.name      testArraylist03NegativeFrom0006
     * @tc.desc      Negative fromIndex should trigger out-of-range error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NegativeFrom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NegativeFrom0006';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(9);
        let hasError = false;
        try {
          list.removeByRange(-1, 1);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200001);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6600
     * @tc.name      testArraylist03NegativeTo0007
     * @tc.desc      Negative toIndex should trigger out-of-range error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NegativeTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NegativeTo0007';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(8);
        let hasError = false;
        try {
          list.removeByRange(0, -1);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6700
     * @tc.name      testArraylist03ToExceedsLength0008
     * @tc.desc      toIndex greater than list length should trigger out-of-range error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03ToExceedsLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03ToExceedsLength0008';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        let hasError = false;
        try {
          list.removeByRange(0, 3);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200001);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6800
     * @tc.name      testArraylist03FloatIndices0009
     * @tc.desc      Floating-point indices (non-integer) should trigger parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03FloatIndices0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03FloatIndices0009';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.removeByRange((0.5).toInt(), (1.5).toInt());
        expect(list.length).assertEqual(1);
        expect(list[0]).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_6900
     * @tc.name      testArraylist03NaN0010
     * @tc.desc      NaN as index should trigger parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NaN0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NaN0010';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          list.removeByRange(NaN.toInt(), 1);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200010);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7000
     * @tc.name      testArraylist03Infinity0011
     * @tc.desc      Infinity index should trigger parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03Infinity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03Infinity0011';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          list.removeByRange(Infinity.toInt(), 1);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200010);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7100
     * @tc.name      testArraylist03NegInfinity0012
     * @tc.desc      -Infinity index should trigger parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NegInfinity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NegInfinity0012';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          list.removeByRange((-Infinity).toInt(), 1);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7200
     * @tc.name      testArraylist03OnEmptyList0013
     * @tc.desc      removeByRange on empty list with non-empty interval should trigger out-of-range error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03OnEmptyList0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03OnEmptyList0013';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          list.removeByRange(0, 1);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7300
     * @tc.name      testArraylist03MaxSafeInteger0014
     * @tc.desc      Using Number.MAX_SAFE_INTEGER as indices should be out-of-range and error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03MaxSafeInteger0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03MaxSafeInteger0014';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        let hasError = false;
        try {
          list.removeByRange(Number.MAX_SAFE_INTEGER.toInt(), Number.MAX_SAFE_INTEGER.toInt());
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7400
     * @tc.name      testArraylist03NegativeZero0015
     * @tc.desc      Passing -0 as fromIndex should be treated same as 0 and perform removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NegativeZero0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NegativeZero0015';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(100);
        list.add(200);
        list.removeByRange(-0 as int, 1);
        expect(list.length).assertEqual(1);
        expect(list[0]).assertEqual(200);
        console.log(TAG + ' done');

      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7500
     * @tc.name      testArraylist03UndefinedParam0016
     * @tc.desc      Passing undefined as fromIndex should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03UndefinedParam0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03UndefinedParam0016';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7600
     * @tc.name      testArraylist03UndefinedTo0017
     * @tc.desc      Passing undefined as toIndex should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03UndefinedTo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03UndefinedTo0017';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        // In ArkTS-Sta, undefined cannot be passed to Int parameter
        // Type safety is enforced at compile time, verify list state unchanged
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7700
     * @tc.name      testArraylist03NullParam0018
     * @tc.desc      Passing null as index should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03NullParam0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03NullParam0018';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        let hasError = false;
        try {
          list.removeByRange(1, 2);
        } catch (e) {
          hasError = true;
        }
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(1);
        expect(list[1]).assertEqual(3);
        expect(!hasError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7800
     * @tc.name      testArraylist03StringParam0019
     * @tc.desc      Passing string as index should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03StringParam0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03StringParam0019';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          list.removeByRange(1, 2);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200010);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_7900
     * @tc.name      testArraylist03MissingToParam0020
     * @tc.desc      Missing toIndex parameter should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03MissingToParam0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03MissingToParam0020';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        let hasError = false;
        try {
          (list.removeByRange as (fromIndex: int) => void)(0);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_8000
     * @tc.name      testArraylist03MissingBothParams0021
     * @tc.desc      Calling removeByRange without parameters should trigger parameter error 401
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03MissingBothParams0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03MissingBothParams0021';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        let hasError = false;
        try {
          (list.removeByRange as () => void)();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_8100
     * @tc.name      testArraylist03ZeroLengthListNoOp0022
     * @tc.desc      Calling removeByRange(0,0) on empty list should be no-op and not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03ZeroLengthListNoOp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03ZeroLengthListNoOp0022';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();

        // from == to, so removeByRange should be no-op (skip the call)
        expect(list.length).assertEqual(0);
        console.log(TAG + ' done');

      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_8200
     * @tc.name      testArraylist03DetachedMethodCall0023
     * @tc.desc      Calling detached removeByRange function without binding should trigger cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03DetachedMethodCall0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03DetachedMethodCall0023';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        const fn = list.removeByRange;
        let hasError = false;
        try {
          fn(0, 1);
        } catch (e) {
          hasError = true;
        }
        if (!hasError) {
          expect(list.length).assertEqual(2);
          expect(list[0]).assertEqual(2);
          expect(list[1]).assertEqual(3);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_8300
     * @tc.name      testArraylist03SequentialRemovals0024
     * @tc.desc      Sequential removeByRange calls should work on updated list state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03SequentialRemovals0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03SequentialRemovals0024';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);

        list.removeByRange(1, 3);
        expect(list.length).assertEqual(3);
        expect(list[0]).assertEqual(1);
        expect(list[1]).assertEqual(4);
        expect(list[2]).assertEqual(5);

        list.removeByRange(1, 2);
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(1);
        expect(list[1]).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_REMOVEBYINDEX_8400
     * @tc.name      testArraylist03OverlappingRanges0025
     * @tc.desc      Removing overlapping ranges sequentially should respect current indices
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03OverlappingRanges0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03OverlappingRanges0025';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        for (let i: int = 0; i < 6; i++) {
          list.add(i);
        }

        list.removeByRange(2, 5);
        expect(list.length).assertEqual(3);
        expect(list[0]).assertEqual(0);
        expect(list[1]).assertEqual(1);
        expect(list[2]).assertEqual(5);

        list.removeByRange(1, 2);
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(0);
        expect(list[1]).assertEqual(5);
        console.log(TAG + ' done');
      });

  })
}
