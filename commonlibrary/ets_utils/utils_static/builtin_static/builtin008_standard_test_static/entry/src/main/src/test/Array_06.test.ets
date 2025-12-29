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

export default function Array_06Test() {
  describe('Array_06Test', (): void => {
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
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0100
     * @tc.name    testReduceRightWithBooleanArray0001
     * @tc.desc    Test reduceRight with logical AND on boolean array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithBooleanArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithBooleanArray0001";
      try {
        const array: FixedArray<boolean> = [true, true, false, true];
        const callbackfn =
          (previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>): boolean => {
            return previousValue && currentValue;
          }
        const initialValue: boolean = true;
        const result = reduceRight<boolean>(array, callbackfn, initialValue);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0200
     * @tc.name    testReduceRightWithBooleanArray0002
     * @tc.desc    Test reduceRight with logical OR on boolean array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithBooleanArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithBooleanArray0002";
      try {
        const array: FixedArray<boolean> = [true, true, false, true];
        const callbackfn =
          (previousValue: boolean, currentValue: boolean, index: number, array: FixedArray<boolean>): boolean => {
            return previousValue || currentValue;
          }
        const initialValue: boolean = true;
        const result = reduceRight<boolean>(array, callbackfn, initialValue);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0300
     * @tc.name    testReduceRightWithEmptyBooleanArray0003
     * @tc.desc    Test reduceRight on empty array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyBooleanArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyBooleanArray0003";
      try {
        const array: FixedArray<boolean> = [];
        const callbackfn =
          (previousValue: number, currentValue: boolean, index: number, array: FixedArray<boolean>): number => {
            return previousValue + (currentValue ? 1 : 0);
          }
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0400
     * @tc.name    testReduceRightWithByteArray0004
     * @tc.desc    Test reduceRight to sum all bytes in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithByteArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithByteArray0004";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callbackfn =
          (previousValue: number, currentValue: byte, index: number, array: FixedArray<byte>): number => {
            return previousValue + currentValue;
          }
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0500
     * @tc.name    testReduceRightWithByteArray0005
     * @tc.desc    Test reduceRight to poor all bytes in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithByteArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithByteArray0005";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callbackfn =
          (previousValue: number, currentValue: byte, index: number, array: FixedArray<byte>): number => {
            return previousValue - currentValue;
          }
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0600
     * @tc.name    testReduceRightWithByteArray0006
     * @tc.desc    Test reduceRight to multiply all bytes in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithByteArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithByteArray0006";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4];
        const callbackfn =
          (previousValue: number, currentValue: byte, index: number, array: FixedArray<byte>): number => {
            return previousValue * currentValue;
          }
        const initialValue: number = 1;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(24);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0700
     * @tc.name    testReduceRightWithEmptyByteArray0007
     * @tc.desc    Test reduceRight on empty array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyByteArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyByteArray0007";
      try {
        const array: FixedArray<byte> = [];
        const callbackfn =
          (previousValue: number, currentValue: byte, index: number, array: FixedArray<byte>): number => {
            return previousValue + currentValue;
          }
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_0800
     * @tc.name    testReduceRightWithCharConcat0008
     * @tc.desc    reduceRight<string> concatenates char array from right
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithCharConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReduceRightWithCharConcat0008';
      try {
        const array: FixedArray<char> = [0x61, 0x62, 0x63];
        const callbackfn =
          (previousValue: string, currentValue: char, index: number, array: FixedArray<char>): string => {
            return previousValue + currentValue;
          };
        const initialValue: string = '';
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual('cba');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_CHAR_0900
     * @tc.name    testReduceRightWithEmptyCharArray0009
     * @tc.desc    Test reduceRight with empty char array returns initialValue.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testReduceRightWithEmptyCharArray0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG = "testReduceRightWithEmptyCharArray0009";
      try {
        const array: FixedArray<char> = [];
        const callbackfn =
          (previousValue: number, currentValue: char, index: number, array: FixedArray<char>): number => {
            return previousValue + 1;
          };
        const initialValue: number = 42;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(42);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1000
     * @tc.name    testReduceRightWithDoubleSum0010
     * @tc.desc    Test reduceRight to sum all doubles in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithDoubleSum0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithDoubleSum0010";
      try {
        const array: FixedArray<double> = [1.5 as double, 2.5 as double, 3.5 as double, 4.5 as double];
        const callbackfn = (prev: number, curr: double, idx: number, arr: FixedArray<double>): number => prev + curr;
        const initialValue: number = 0 as double;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(12.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1100
     * @tc.name    testReduceRightWithDoubleSubtract0011
     * @tc.desc    Test reduceRight to subtract all doubles in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithDoubleSubtract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithDoubleSubtract0011";
      try {
        const array: FixedArray<double> = [1.0 as double, 2.0 as double, 3.0 as double, 4.0 as double];
        const callbackfn = (prev: number, curr: double, idx: number, arr: FixedArray<double>): number => prev - curr;
        const initialValue: number = 0.0 as double;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1200
     * @tc.name    testReduceRightWithDoubleMultiply0012
     * @tc.desc    Test reduceRight to multiply all doubles in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithDoubleMultiply0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithDoubleMultiply0012";
      try {
        const array: FixedArray<double> = [2.0 as double, 3.0 as double, 4.0 as double];
        const callbackfn = (prev: number, curr: double, idx: number, arr: FixedArray<double>): number => prev * curr;
        const initialValue: number = 1.0 as double;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(24.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1300
     * @tc.name    testReduceRightWithEmptyDoubleArray0013
     * @tc.desc    Test reduceRight on empty double array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyDoubleArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyDoubleArray0013";
      try {
        const array: FixedArray<double> = [];
        const callbackfn = (prev: number, curr: double, idx: number, arr: FixedArray<double>): number => prev + curr;
        const initialValue: number = 100.0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(100.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1400
     * @tc.name    testReduceRightWithSingleDoubleArray0014
     * @tc.desc    Test reduceRight with single-element double array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithSingleDoubleArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithSingleDoubleArray0014";
      try {
        const array: FixedArray<double> = [9.9 as double];
        const callbackfn = (prev: string, curr: double, idx: number, arr: FixedArray<double>): string =>
        `(${prev}+${curr})`;
        const initialValue: string = "init";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("(init+9.9)");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1500
     * @tc.name    testReduceRightWithNaNInDoubleArray0015
     * @tc.desc    Test reduceRight propagates NaN when encountered.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testReduceRightWithNaNInDoubleArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = "testReduceRightWithNaNInDoubleArray0015";
      try {
        const array: FixedArray<double> = [1.0 as double, NaN, 3.0 as double];
        const callbackfn = (prev: number, curr: double, idx: number, arr: FixedArray<double>): number => prev + curr;
        const initialValue: number = 0.0 as double;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(isNaN(result)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1600
     * @tc.name    testReduceRightWithFloatSum0016
     * @tc.desc    Test reduceRight to sum all floats in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithFloatSum0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithFloatSum0016";
      try {
        const array: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float, 4.5 as float];
        const callbackfn = (prev: number, curr: float): number => prev + curr;
        const initialValue: number = 0.0 as float;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(12.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1700
     * @tc.name    testReduceRightWithFloatSubtract0017
     * @tc.desc    Test reduceRight to subtract all floats in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithFloatSubtract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithFloatSubtract0017";
      try {
        const array: FixedArray<float> = [1.0 as float, 2.0 as float, 3.0 as float, 4.0 as float];
        const callbackfn = (prev: number, curr: float): number => prev - curr;
        const initialValue: number = 0.0 as float;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1800
     * @tc.name    testReduceRightWithFloatMultiply0018
     * @tc.desc    Test reduceRight to multiply all floats in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithFloatMultiply0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithFloatMultiply0018";
      try {
        const array: FixedArray<float> = [2.0 as float, 3.0 as float, 4.0 as float];
        const callbackfn = (prev: number, curr: float): number => prev * curr;
        const initialValue: number = 1.0 as float;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(24.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_1900
     * @tc.name    testReduceRightWithEmptyFloatArray0019
     * @tc.desc    Test reduceRight on empty float array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyFloatArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyFloatArray0019";
      try {
        const array: FixedArray<float> = [];
        const callbackfn = (prev: number, curr: float): number => prev + curr;
        const initialValue: number = 42.0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(42.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2000
     * @tc.name    testReduceRightWithSingleFloatArray0020
     * @tc.desc    Test reduceRight with single-element float array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithSingleFloatArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithSingleFloatArray0020";
      try {
        const array: FixedArray<float> = [9.9 as float];
        const callbackfn = (prev: string, curr: float): string => `(${prev}+${curr})`;
        const initialValue: string = "init";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("(init+9.9)");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2100
     * @tc.name    testReduceRightWithIntSum0021
     * @tc.desc    Test reduceRight to sum all ints in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithIntSum0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithIntSum0021";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4];
        const callbackfn = (prev: number, curr: int): number => prev + curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2200
     * @tc.name    testReduceRightWithIntSubtract0022
     * @tc.desc    Test reduceRight to subtract all ints in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithIntSubtract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithIntSubtract0022";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4];
        const callbackfn = (prev: number, curr: int): number => prev - curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2300
     * @tc.name    testReduceRightWithIntMultiply0023
     * @tc.desc    Test reduceRight to multiply all ints in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithIntMultiply0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithIntMultiply0023";
      try {
        const array: FixedArray<int> = [2, 3, 4];
        const callbackfn = (prev: number, curr: int): number => prev * curr;
        const initialValue: number = 1;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(24);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2400
     * @tc.name    testReduceRightWithEmptyIntArray0024
     * @tc.desc    Test reduceRight on empty int array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyIntArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyIntArray0024";
      try {
        const array: FixedArray<int> = [];
        const callbackfn = (prev: number, curr: int): number => prev + curr;
        const initialValue: number = 42;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(42);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2500
     * @tc.name    testReduceRightWithSingleIntArray0025
     * @tc.desc    Test reduceRight with single-element int array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithSingleIntArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithSingleIntArray0025";
      try {
        const array: FixedArray<int> = [9];
        const callbackfn = (prev: string, curr: int): string => `(${prev}+${curr})`;
        const initialValue: string = "init";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("(init+9)");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2600
     * @tc.name    testReduceRightWithNegativeIntArray0026
     * @tc.desc    Test reduceRight handles negative numbers correctly.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithNegativeIntArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithNegativeIntArray0026";
      try {
        const array: FixedArray<int> = [-1, -2, -3];
        const callbackfn = (prev: number, curr: int): number => prev + curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2700
     * @tc.name    testReduceRightWithLongSum0027
     * @tc.desc    Test reduceRight to sum all longs in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithLongSum0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithLongSum0027";
      try {
        const array: FixedArray<long> = [1000000000, 2000000000, 3000000000];
        const callbackfn = (prev: bigint, curr: long): bigint => prev + BigInt(curr);
        const initialValue: bigint = 0n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(6000000000n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2800
     * @tc.name    testReduceRightWithLongSubtract0028
     * @tc.desc    Test reduceRight to subtract all longs in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithLongSubtract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithLongSubtract0028";
      try {
        const array: FixedArray<long> = [10, 5, 2];
        const callbackfn = (prev: bigint, curr: long): bigint => prev - BigInt(curr);
        const initialValue: bigint = 0n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(-17n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_2900
     * @tc.name    testReduceRightWithLongMultiply0029
     * @tc.desc    Test reduceRight to multiply all longs in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithLongMultiply0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithLongMultiply0029";
      try {
        const array: FixedArray<long> = [2, 3, 4];
        const callbackfn = (prev: bigint, curr: long): bigint => prev * BigInt(curr);
        const initialValue: bigint = 1n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(24n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3000
     * @tc.name    testReduceRightWithEmptyLongArray0030
     * @tc.desc    Test reduceRight on empty long array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyLongArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyLongArray0030";
      try {
        const array: FixedArray<long> = [];
        const callbackfn = (prev: string, curr: long): string => prev + curr;
        const initialValue: string = "empty";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("empty");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3100
     * @tc.name    testReduceRightWithSingleLongArray0031
     * @tc.desc    Test reduceRight with single-element long array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithSingleLongArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithSingleLongArray0031";
      try {
        const array: FixedArray<long> = [9876543210];
        const callbackfn = (prev: string, curr: long): string => `${prev}+${curr}`;
        const initialValue: string = "start";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("start+9876543210");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3200
     * @tc.name    testReduceRightWithLongNegative0032
     * @tc.desc    Test reduceRight handles negative longs correctly.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithLongNegative0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithLongNegative0032";
      try {
        const array: FixedArray<long> = [-5, -4, -3];
        const callbackfn = (prev: bigint, curr: long): bigint => prev + BigInt(curr);
        const initialValue: bigint = 0n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(-12n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3300
     * @tc.name    testReduceRightWithLongMaxMin0033
     * @tc.desc    Test reduceRight with Long.MAX_VALUE and Long.MIN_VALUE.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithLongMaxMin0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = "testReduceRightWithLongMaxMin0033";
      try {
        const array: FixedArray<long> = [9223372036854775807, 99, -9223372036854775808];
        const callbackfn = (prev: bigint, curr: long): bigint => prev + BigInt(curr);
        const initialValue: bigint = 0n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(99n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3400
     * @tc.name    testReduceRightWithShortSum0034
     * @tc.desc    Test reduceRight to sum all shorts in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithShortSum0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithShortSum0034";
      try {
        const array: FixedArray<short> = [1000, 2000, 3000];
        const callbackfn = (prev: number, curr: short): number => prev + curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(6000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3500
     * @tc.name    testReduceRightWithShortSubtract0035
     * @tc.desc    Test reduceRight to subtract all shorts in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithShortSubtract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithShortSubtract0035";
      try {
        const array: FixedArray<short> = [10, 5, 2];
        const callbackfn = (prev: number, curr: short): number => prev - curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-17);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3600
     * @tc.name    testReduceRightWithShortMultiply0036
     * @tc.desc    Test reduceRight to multiply all shorts in descending order.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithShortMultiply0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithShortMultiply0036";
      try {
        const array: FixedArray<short> = [2, 3, 4];
        const callbackfn = (prev: number, curr: short): number => prev * curr;
        const initialValue: number = 1;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(24);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3700
     * @tc.name    testReduceRightWithEmptyShortArray0037
     * @tc.desc    Test reduceRight on empty short array returns initial value.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithEmptyShortArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithEmptyShortArray0037";
      try {
        const array: FixedArray<short> = [];
        const callbackfn = (prev: string, curr: short): string => prev + curr;
        const initialValue: string = "empty";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("empty");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3800
     * @tc.name    testReduceRightWithSingleShortArray0038
     * @tc.desc    Test reduceRight with single-element short array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithSingleShortArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithSingleShortArray0038";
      try {
        const array: FixedArray<short> = [32767];
        const callbackfn = (prev: string, curr: short): string => `${prev}+${curr}`;
        const initialValue: string = "start";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("start+32767");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_3900
     * @tc.name    testReduceRightWithShortNegative0039
     * @tc.desc    Test reduceRight handles negative shorts correctly.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithShortNegative0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithShortNegative0039";
      try {
        const array: FixedArray<short> = [-1000, -2000, -3000];
        const callbackfn = (prev: number, curr: short): number => prev + curr;
        const initialValue: number = 0;
        const result = reduceRight<number>(array, callbackfn, initialValue);
        expect(result).assertEqual(-6000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_4000
     * @tc.name    testReduceRightWithShortMaxMin0040
     * @tc.desc    Test reduceRight with Short.MAX_VALUE and Short.MIN_VALUE.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testReduceRightWithShortMaxMin0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const TAG = "testReduceRightWithShortMaxMin0040";
      try {
        const array: FixedArray<short> = [32767, -32768];
        const callbackfn = (prev: bigint, curr: short): bigint => prev + BigInt(curr);
        const initialValue: bigint = 0n;
        const result = reduceRight<bigint>(array, callbackfn, initialValue);
        expect(result).assertEqual(-1n);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_REDUCE_RIGHT_4100
     * @tc.name    testReduceRightWithShortStringConcat0041
     * @tc.desc    Test reduceRight converts shorts to string and concatenates.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testReduceRightWithShortStringConcat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testReduceRightWithShortStringConcat0041";
      try {
        const array: FixedArray<short> = [5, 4, 3];
        const callbackfn = (prev: string, curr: short): string => prev + curr;
        const initialValue: string = "v";
        const result = reduceRight<string>(array, callbackfn, initialValue);
        expect(result).assertEqual("v345");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0100
     * @tc.name    testSomeFunctionWithBooleanArray0001
     * @tc.desc    Testing some function with a predicate that returns true for at least one element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithBooleanArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithBooleanArray0001";
      try {
        const array: FixedArray<boolean> = [false, false, true, false, true];
        const predicate = (value: boolean, index: number, array: FixedArray<boolean>) => value == true;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0200
     * @tc.name    testSomeFunctionWithBooleanArray0002
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithBooleanArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithBooleanArray0002";
      try {
        const array: FixedArray<boolean> = [false, false, false, false, false];
        const predicate = (value: boolean, index: number, array: FixedArray<boolean>) => value == true;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0300
     * @tc.name    testSomeFunctionWithBooleanArray0003
     * @tc.desc    Testing some function on an empty FixedArray<boolean>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithBooleanArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithBooleanArray0003";
      try {
        const array: FixedArray<boolean> = [];
        const predicate = (value: boolean, index: number, array: FixedArray<boolean>) => value == true;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0400
     * @tc.name    testSomeFunctionWithByteArray0004
     * @tc.desc    Testing some function with a predicate that returns true for at least one element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithByteArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithByteArray0004";
      try {
        const array: FixedArray<byte> = [0, 1, 2, 3, 4];
        const predicate = (value: byte, index: number, array: FixedArray<byte>) => value == 2;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0500
     * @tc.name    testSomeFunctionWithByteArray0005
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithByteArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithByteArray0005";
      try {
        const array: FixedArray<byte> = [0, 1, 2, 3, 4];
        const predicate = (value: byte, index: number, array: FixedArray<byte>) => value == 10;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0600
     * @tc.name    testSomeFunctionWithByteArray0006
     * @tc.desc    Testing some function on an empty FixedArray<byte>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithByteArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithByteArray0006";
      try {
        const array: FixedArray<byte> = [];
        const predicate = (value: byte, index: number, array: FixedArray<byte>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0700
     * @tc.name    testSomeFunctionWithDoubleArray0007
     * @tc.desc    Testing some function with a predicate that returns true for at least one element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithDoubleArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithDoubleArray0007";
      try {
        const array: FixedArray<double> = [1.1 as double, 2.2 as double, 3.3 as double, 4.4 as double, 5.5 as double];
        const predicate = (value: double, index: number, array: FixedArray<double>) => value == 3.3;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0800
     * @tc.name    testSomeFunctionWithDoubleArray0008
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithDoubleArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithDoubleArray0008";
      try {
        const array: FixedArray<double> = [1.1 as double, 2.2 as double, 3.3 as double, 4.4 as double, 5.5 as double];
        const predicate = (value: double, index: number, array: FixedArray<double>) => value == 10.0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_0900
     * @tc.name    testSomeFunctionWithDoubleArray0009
     * @tc.desc    Testing some function on an empty FixedArray<double>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithDoubleArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithDoubleArray0009";
      try {
        const array: FixedArray<double> = [];
        const predicate = (value: double, index: number, array: FixedArray<double>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1000
     * @tc.name    testSomeFunctionWithFloatArray0010
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithFloatArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithFloatArray0010";
      try {
        const array: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float, 5.5 as float];
        const predicate = (value: float, index: number, array: FixedArray<float>) => value == 10.0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1100
     * @tc.name    testSomeFunctionWithFloatArray0011
     * @tc.desc    Testing some function on an empty FixedArray<float>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithFloatArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithFloatArray0011";
      try {
        const array: FixedArray<float> = [];
        const predicate = (value: float, index: number, array: FixedArray<float>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1200
     * @tc.name    testSomeFunctionWithIntArray0012
     * @tc.desc    Testing some function with a predicate that returns true for at least one element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithIntArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithIntArray0012";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const predicate = (value: int, index: number, array: FixedArray<int>) => value == 3;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1300
     * @tc.name    testSomeFunctionWithIntArray0013
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithIntArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithIntArray0013";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const predicate = (value: int, index: number, array: FixedArray<int>) => value == 10;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1400
     * @tc.name    testSomeFunctionWithIntArray0014
     * @tc.desc    Testing some function on an empty FixedArray<int>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithIntArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithIntArray0014";
      try {
        const array: FixedArray<int> = [];
        const predicate = (value: int, index: number, array: FixedArray<int>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1500
     * @tc.name    testSomeFunctionWithLongArray0015
     * @tc.desc    Testing some function with a predicate that returns true for at least one element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithLongArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithLongArray0015";
      try {
        const array: FixedArray<long> = [-9223372036854775808, 99, 9223372036854775807];
        const predicate = (value: long, index: number, array: FixedArray<long>) => value == 99;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1600
     * @tc.name    testSomeFunctionWithLongArray0016
     * @tc.desc    Testing some function with a predicate that returns false for all elements.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithLongArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithLongArray0016";
      try {
        const array: FixedArray<long> = [-9223372036854775808, 985, 9223372036854775807];
        const predicate = (value: long, index: number, array: FixedArray<long>) => value == 1111111111111111111;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_1700
     * @tc.name    testSomeFunctionWithLongArray0017
     * @tc.desc    Testing some function on an empty FixedArray<long>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithLongArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithLongArray0017";
      try {
        const array: FixedArray<long> = [];
        const predicate = (value: long, index: number, array: FixedArray<long>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_SHORT_180
     * @tc.name    testSomeFunctionWithShortArray0018
     * @tc.desc    Testing some function with a predicate that returns true for at least one element in a short array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithShortArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithShortArray0018";
      try {
        const array: FixedArray<short> = [-32768, 100, 32767];
        const predicate = (value: short, index: number, array: FixedArray<short>) => value == 100;
        const result = some(array, predicate);
        expect(result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_SHORT_1900
     * @tc.name    testSomeFunctionWithShortArray0019
     * @tc.desc    Testing some function with a predicate that returns false for all elements in a short array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithShortArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithShortArray0019";
      try {
        const array: FixedArray<short> = [-32768, 0, 32767];
        const predicate = (value: short, index: number, array: FixedArray<short>) => value == 88;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SOME_SHORT_2000
     * @tc.name    testSomeFunctionWithShortArray0020
     * @tc.desc    Testing some function on an empty FixedArray<short>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSomeFunctionWithShortArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSomeFunctionWithShortArray0020";
      try {
        const array: FixedArray<short> = [];
        const predicate = (value: short, index: number, array: FixedArray<short>) => value == 0;
        const result = some(array, predicate);
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}