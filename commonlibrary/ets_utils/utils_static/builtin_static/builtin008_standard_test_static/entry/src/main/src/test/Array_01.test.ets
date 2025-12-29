/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function Array_01Test() {
  describe('Array_01Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0100
     * @tc.name    testReverse0001
     * @tc.desc    Opposite arrangement of boolean types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0001";
      try {
        let array : FixedArray<boolean> = [true, false];
        let result = reverse(array);
        let expected : FixedArray<boolean> = [false, true];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0200
     * @tc.name    testReverse0002
     * @tc.desc    The opposite arrangement of Boolean type null values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0002";
      try {
        let array: FixedArray<boolean> = [];
        let result = reverse(array);
        expect(result.length).assertEqual(0);
        expect(array.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0300
     * @tc.name    testReverse0003
     * @tc.desc    Opposite arrangement of single elements of Boolean type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0003";
      try {
        let array: FixedArray<boolean> = [true];
        let result = reverse(array);
        expect(result[0]).assertEqual(true);
        expect(array[0]).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0400
     * @tc.name    testReverse0004
     * @tc.desc    Opposite permutations of odd length of Boolean type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0004";
      try {
        let array: FixedArray<boolean> = [true, false, true];
        let expected: FixedArray<boolean> = [true, false, true];
        let result = reverse(array);
        for (let i = 0; i < expected.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
        expect(result[1]).assertEqual(array[1]);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0500
     * @tc.name    testReverse0005
     * @tc.desc    opposite permutation of boolean type all true
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0005";
      try {
        let array : FixedArray<boolean> = [true, true, true];
        let result = reverse(array);
        let expected : FixedArray<boolean> = [true, true, true];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0600
     * @tc.name    testReverse0006
     * @tc.desc    opposite permutation of boolean type all false
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0006";
      try {
        let array : FixedArray<boolean> = [false, false, false];
        let result = reverse(array);
        let expected : FixedArray<boolean> = [false, false, false];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0700
     * @tc.name    testReverse0007
     * @tc.desc    Opposite arrangement of byte types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0007";
      try {
        let array: FixedArray<byte> = [-128, 0, 127];
        let result = reverse(array);
        let expected: FixedArray<byte> = [127, 0, -128];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_0800
     * @tc.name    testReverse0008
     * @tc.desc    Opposite arrangement of byte type null values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0008";
      try {
        let array: FixedArray<byte> = [];
        let result = reverse(array);
        let expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_1000
     * @tc.name    testReverse0010
     * @tc.desc    Opposite arrangement of byte type odd length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0010";
      try {
        let array: FixedArray<byte> = [1, 2, 3, 4, 5];
        let expected: FixedArray<byte> = [5, 4, 3, 2, 1];
        let result = reverse(array);
        for (let i = 0; i < expected.length; i++) {
          expect(result[i]).assertEqual(expected[i]);
        }
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_1200
     * @tc.name    testReverse0012
     * @tc.desc    Opposite permutation of null values of char type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0012";
      try {
        let array: FixedArray<char> = [];
        let result = reverse(array);
        let expected: FixedArray<char> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2000
     * @tc.name    testReverse0020
     * @tc.desc    Opposite arrangement of double types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0020";
      try {
        let array: FixedArray<double> = [-1.1, 0, 1.1];
        let result = reverse(array);
        let expected: FixedArray<double> = [1.1, 0, -1.1];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2100
     * @tc.name    testReverse0021
     * @tc.desc    Opposite arrangement of null values of double type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0021";
      try {
        let array: FixedArray<double> = [];
        let result = reverse(array);
        let expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2200
     * @tc.name    testReverse0022
     * @tc.desc    The opposite arrangement of special values of double type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0022";
      try {
        let array: FixedArray<double> = [NaN, Infinity, -Infinity, 0];
        let result = reverse(array);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(-Infinity);
        expect(result[2]).assertEqual(Infinity);
        expect(Number.isNaN(result[3])).assertTrue();
        expect(Number.isFinite(result[0])).assertTrue();
        expect(Number.isFinite(result[1])).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2300
     * @tc.name    testReverse0023
     * @tc.desc    Opposite Arrangement of Extremum Boundary of Double Type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0023";
      try {
        const MAX = Number.MAX_VALUE;
        const MIN = Number.MIN_VALUE;
        let array: FixedArray<double> = [MAX, MIN, 0];
        let result = reverse(array);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(MIN);
        expect(result[2]).assertEqual(MAX);
        expect(result[1]).assertEqual(MIN);
        expect(result[2]).assertEqual(MAX);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2500
     * @tc.name    testReverse0025
     * @tc.desc    Opposite permutations of null values of floating-point type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0025";
      try {
        let array: FixedArray<float> = [];
        let result = reverse(array);
        let expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2700
     * @tc.name    testReverse0027
     * @tc.desc    Opposite permutation of odd length of floating-point type null value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0027";
      try {
        let oddArray: FixedArray<float> = [0.5, 1.5, 2.5];
        let result = reverse(oddArray);
        expect(oddArray[1]).assertEqual(1.5);
        let expected: FixedArray<float> = [2.5, 1.5, 0.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2800
     * @tc.name    testReverse0028
     * @tc.desc    Opposite arrangement of int types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0028";
      try {
        let array: FixedArray<int> = [-2147483648, 0, 2147483647];
        let result = reverse(array);
        let expected: FixedArray<int> = [2147483647, 0, -2147483648];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_2900
     * @tc.name    testReverse0029
     * @tc.desc    inverse arrangement of null values of type int
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0029";
      try {
        let array: FixedArray<int> = [];
        let result = reverse(array);
        let expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3100
     * @tc.name    testReverse0031
     * @tc.desc    int type even opposite permutation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0031";
      try {
        let array: FixedArray<int> = [1, 2, 3, 4];
        let result = reverse(array);
        let expected: FixedArray<int> = [4, 3, 2, 1];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3200
     * @tc.name    testReverse0032
     * @tc.desc    int the opposite arrangement of repeating elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0032";
      try {
        let array: FixedArray<int> = [5, 5, 5, 5];
        let result = reverse(array);
        let expected: FixedArray<int> = [5, 5, 5, 5];
        expect(result.toString()).assertDeepEquals(expected.toString());
        let mixed: FixedArray<int> = [1, 2, 2, 1];
        reverse(mixed);
        let test: FixedArray<int> = [1, 2, 2, 1];
        expect(mixed.toString()).assertDeepEquals(test.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3300
     * @tc.name    testReverse0033
     * @tc.desc    Opposite arrangement of long types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0033";
      try {
        let array: FixedArray<long> = [-9223372036854775808, 0, 9223372036854775807];
        let result = reverse(array);
        let expected: FixedArray<long> = [9223372036854775807, 0, -9223372036854775808];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3400
     * @tc.name    testReverse0034
     * @tc.desc    Opposite arrangement of long type null values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0034";
      try {
        let array: FixedArray<long> = [];
        let result = reverse(array);
        let expected: FixedArray<long> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3600
     * @tc.name    testReverse0036
     * @tc.desc    Opposite arrangement of even length of long type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0036";
      try {
        let array: FixedArray<long> = [-4, 0, 3, 5];
        let result = reverse(array);
        let expected: FixedArray<long> = [5, 3, 0, -4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3700
     * @tc.name    testReverse0037
     * @tc.desc    Opposite arrangement of short types
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0037";
      try {
        let array: FixedArray<short> = [-32768, 0, 32767];
        let result = reverse(array);
        let expected: FixedArray<short> = [32767, 0, -32768];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_3800
     * @tc.name    testReverse0038
     * @tc.desc    Opposite arrangement of short type null values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0038";
      try {
        let array: FixedArray<short> = [];
        let result = reverse(array);
        let expected: FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REVERSE_4000
     * @tc.name    testReverse0040
     * @tc.desc    Opposite arrangement of short type even length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReverse0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReverse0040";
      try {
        let array: FixedArray<short> = [-1, 0, 3, 6];
        let result = reverse(array);
        let expected: FixedArray<short> = [6, 3, 0, -1];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

   /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0100
     * @tc.name    testReduceRight0001
     * @tc.desc    Boolean right-to-left accumulation condition '&&'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0001";
      try {
        const array: FixedArray<boolean> = [true, false, true, true];
        const andCallback = (acc: boolean, curr: boolean)=> acc && curr;
        const result = reduceRight(array, andCallback);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0200
     * @tc.name    testReduceRight0002
     * @tc.desc    Boolean right-to-left accumulation condition '||'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
    */
    it('testReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0002";
      try {
        const array: FixedArray<boolean> = [true, false, true, true];
        const andCallback = (acc: boolean, curr: boolean)=> acc || curr;
        const result = reduceRight(array, andCallback);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0300
     * @tc.name    testReduceRight0003
     * @tc.desc    Boolean right-to-left accumulation condition '||', array is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0003";
      try {
        const array: FixedArray<boolean> = [];
        const andCallback = (acc: boolean, curr: boolean)=> acc || curr;
        const result = reduceRight(array, andCallback);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_4000
     * @tc.name    testReduceRight0004
     * @tc.desc    Byte type right-to-left accumulation condition'+'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0004";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callback = (acc: number, curr: byte, index: number, arr: FixedArray<byte>): number => {
          return acc + curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0500
     * @tc.name    testReduceRight0005
     * @tc.desc    Byte type right-to-left accumulation condition '-'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0005";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callback = (acc: number, curr: byte, index: number, arr: FixedArray<byte>): number => {
          return acc - curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual(-10);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0600
     * @tc.name    testReduceRight0006
     * @tc.desc    Byte type right-to-left accumulation condition '*'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0006";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callback = (acc: number, curr: byte, index: number, arr: FixedArray<byte>): number => {
          return acc * curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0700
     * @tc.name    testReduceRight0007
     * @tc.desc    Byte type accumulates condition '*' from right to left, array is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0007";
      try {
        const array: FixedArray<byte> = [];
        const callback = (acc: number, curr: byte, index: number, arr: FixedArray<byte>): number => {
          return acc * curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_0900
     * @tc.name    testReduceRight0009
     * @tc.desc    Character type right-to-left accumulation condition '+'array is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0009";
      try {
        const array: FixedArray<char> = [];
        const callback = (acc: string, curr: char, index: number, arr: FixedArray<char>): string => {
          return acc + curr;
        };
        const Value: string = "";
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1000
     * @tc.name    testReduceRight0010
     * @tc.desc    Double type right-to-left accumulation condition'+'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0010";
      try {
        const array: FixedArray<double> = [1.2, 2.3, 3.4, 4.5];
        const callback = (acc: double, curr: double, index: number, arr: FixedArray<double>): double => {
          return acc + curr;
        };
        const result = reduceRight(array, callback);
        const expected: double = 11.399999999999999;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1100
     * @tc.name    testReduceRight0011
     * @tc.desc    Double type right-to-left accumulation condition'-'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0011";
      try {
        const array: FixedArray<double> = [1.2, 2.3, 3.4, 4.5];
        const callback = (acc: double, curr: double, index: number, arr: FixedArray<double>): double => {
          return acc - curr;
        };
        const result = reduceRight(array, callback);
        const expected: double = -2.3999999999999995;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1200
     * @tc.name    testReduceRight0012
     * @tc.desc    Double type right-to-left accumulation condition'*'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0012";
      try {
        const array: FixedArray<double> = [1.2, 2.3, 3.4, 4.5];
        const callback = (acc: double, curr: double, index: number, arr: FixedArray<double>): double => {
          return acc * curr;
        };
        const result = reduceRight(array, callback);
        const expected: double = 42.227999999999994;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1300
     * @tc.name    testReduceRight0013
     * @tc.desc    Double type accumulates condition '+'from right to left, array is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0013";
      try {
        const array: FixedArray<double> = [];
        const callback = (acc: double, curr: double, index: number, arr: FixedArray<double>): double => {
          return acc + curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1600
     * @tc.name    testReduceRight0016
     * @tc.desc    int type right-to-left accumulates condition '+'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0016";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4];

        const callback = (acc: int, curr: int, index: number, arr: FixedArray<int>): int => {
          return acc + curr;
        };
        const result = reduceRight(array, callback);
        const expected: int = 10;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1700
     * @tc.name    testReduceRight0017
     * @tc.desc    long type right-to-left accumulates condition '+'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0017";
      try {
        const array: FixedArray<long> = [1, 2, 3, 4];

        const callback = (acc: long, curr: long, index: number, arr: FixedArray<long>): long => {
          return acc + curr;
        };
        const result = reduceRight(array, callback);
        const expected: long = 10;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REDUCE_RIGHT_1800
     * @tc.name    testReduceRight0018
     * @tc.desc    short type right-to-left accumulates condition '+'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRight0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testReduceRight0018";
      try {
        const array: FixedArray<short> = [1, 2, 3, 4];

        const callback = (acc: number, curr: short, index: number, arr: FixedArray<short>): number => {
          return acc + curr;
        };
        const Value: number = 0;
        const result = reduceRight(array, callback, Value);
        const expected: long = 10;
        expect(result).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });
  })
}