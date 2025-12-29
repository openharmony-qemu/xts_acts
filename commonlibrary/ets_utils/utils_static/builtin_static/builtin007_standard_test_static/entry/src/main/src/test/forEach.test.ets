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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ForEachTest() {
  describe("ForEachTest", (): void => {
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
     * @tc.number FOR_EACH_0100
     * @tc.name   testForEachbyte0001
     * @tc.desc   Test the basic functions of forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachbyte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachbyte0001";
      try {
        const testArray: FixedArray<byte> = [1, 2, 3, 4, 5] as FixedArray<byte>;
        let sum = 0;
        let callCount = 0;
        forEach(testArray, (value: byte, index: number, array: FixedArray<byte>) => {
          sum += value;
          callCount++;
          expect(array).assertEqual(testArray);
          expect(index).assertEqual(callCount - 1);
        });
        expect(sum).assertEqual(15);
        expect(callCount).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_0200
     * @tc.name   testForEachbyte0002
     * @tc.desc   Test the forEach operation on an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachbyte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachbyte0002";
      try {
        const emptyArray: FixedArray<byte> = [] as FixedArray<byte>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0100
     * @tc.name   testForEachnumber0001
     * @tc.desc   Test the basic functionality of forEach for FixedArray<number>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0001";
      try {
        let numberArray: FixedArray<number> = [1, 2, 3, 4];
        let sum = 0;
        let indexes: Array<number> = [];
        forEach(numberArray, (value: number, index: number) => {
          sum += value;
          indexes.push(index);
        });
        expect(sum).assertEqual(10);
        const expectedIndexes = [0, 1, 2, 3];
        expect(indexes.length).assertEqual(expectedIndexes.length);
        for (let i = 0; i < expectedIndexes.length; i++) {
          expect(indexes[i]).assertEqual(expectedIndexes[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0200
     * @tc.name   testForEachnumber0002
     * @tc.desc   Test the forEach behavior of empty FixedArray<number>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0002";
      try {
        let emptyArray: FixedArray<number> = [];
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0300
     * @tc.name   testForEachnumber0003
     * @tc.desc   Test FixedArray<number> containing special values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0003";
      try {
        let specialNumbers: FixedArray<number> = [0, -1, 1.5, 100];
        let results: Array<number> = [];
        forEach(specialNumbers, (value: number) => {
          results.push(value);
        });
        const expected = [0, -1, 1.5, 100];
        expect(results.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(results[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0400
     * @tc.name   testForEachnumber0004
     * @tc.desc   Testing basic forEach functionality with number array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0004";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let sum = 0;
        forEach(arr, (value: number, index: number) => {
          sum += value * index;
        });
        expect(sum).assertEqual(8);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0500
     * @tc.name   testForEachnumber0005
     * @tc.desc   Testing forEach with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0005";
      try {
        let arr: FixedArray<number> = [];
        let count = 0;
        forEach(arr, () => {
          count++;
        });
        expect(count).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0600
     * @tc.name   testForEachnumber0006
     * @tc.desc   Testing forEach callback receives original array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0006";
      try {
        let arr: FixedArray<number> = [7, 8, 9];
        let sameArray = true;
        forEach(arr, (value: number, index: number, array: FixedArray<number>) => {
          if (array !== arr) {
            sameArray = false;
          }
        });
        expect(sameArray).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0700
     * @tc.name   testForEachnumber0007
     * @tc.desc   Testing forEach with array modification during iteration
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0007";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let sum = 0;
        forEach(arr, (value: number, index: number) => {
          sum += value;
          if (index === 1) {
            arr[2] = 4;
          }
        });
        expect(sum).assertEqual(7);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0800
     * @tc.name   testForEachnumber0008
     * @tc.desc   Testing forEach callback index parameter type
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0008";
      try {
        let arr: FixedArray<number> = [1, 2];
        let indexTypesCorrect = true;
        forEach(arr, (value: number, index: number) => {
          if (typeof index !== 'number') {
            indexTypesCorrect = false;
          }
        });
        expect(indexTypesCorrect).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0100
     * @tc.name   testForEachdouble0001
     * @tc.desc   Test empty double precision floating-point array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachdouble0001";
      try {
        const emptyArray: FixedArray<double> = [] as FixedArray<double>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0200
     * @tc.name   testForEachdouble0002
     * @tc.desc   Testing Double Precision Floating Point Boundary Value Processing
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachdouble0002";
      try {
        const arr: FixedArray<double> = [
          Number.MIN_VALUE,
          Number.MAX_VALUE,
          Number.POSITIVE_INFINITY,
          Number.NEGATIVE_INFINITY
        ] as FixedArray<double>;
        const results: double[] = [];
        forEach(arr, (value) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(Number.MIN_VALUE);
        expect(results[1]).assertEqual(Number.MAX_VALUE);
        expect(results[2]).assertEqual(Number.POSITIVE_INFINITY);
        expect(results[3]).assertEqual(Number.NEGATIVE_INFINITY);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0300
     * @tc.name   testForEachdouble0003
     * @tc.desc   Testing basic forEach functionality with double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0003";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let sum: double = 0.0;
        forEach(arr, (value: double) => {
          sum += value;
        });
        expect(sum).assertClose(6.6, 0.0001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0400
     * @tc.name   testForEachdouble0004
     * @tc.desc   Testing index parameter in forEach callback
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0004";
      try {
        let arr: FixedArray<double> = [10.5, 20.5, 30.5];
        let indexSum: number = 0;
        forEach(arr, (value: double, index: number) => {
          indexSum += index;
        });
        expect(indexSum).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0500
     * @tc.name   testForEachdouble0005
     * @tc.desc   Testing callback receives original array reference
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0005";
      try {
        let arr: FixedArray<double> = [0.1, 0.2, 0.3];
        let isSameArray: boolean = true;
        forEach(arr, (value: double, index: number, array: FixedArray<double>) => {
          if (array !== arr) {
            isSameArray = false;
          }
        });
        expect(isSameArray).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0600
     * @tc.name   testForEachdouble0006
     * @tc.desc   Testing forEach with empty double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0006";
      try {
        let arr: FixedArray<double> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0700
     * @tc.name   testForEachdouble0007
     * @tc.desc   Testing double precision handling in forEach
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0007";
      try {
        let arr: FixedArray<double> = [0.3, 0.3333333333333333, 3.141592653589793];
        let results: Array<double> = new Array<double>(arr.length);
        let index = 0;
        forEach(arr, (value: double) => {
          results[index++] = value;
        });
        expect(results[0]).assertClose(0.3, 0.0000001);
        expect(results[1]).assertClose(0.333333, 0.000001);
        expect(results[2]).assertClose(3.141593, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0100
     * @tc.name   testForEachfloat0001
     * @tc.desc   Test the basic floating-point array traversal function
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG: string = "testForEachfloat0001";
      try {
        const arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let sum: float = 0.0 as float;
        forEach(arr, (value: float): void => {
          sum = (sum + value) as float;
        });
        expect(Math.abs(sum - 7.5) < 0.0001).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0200
     * @tc.name   testForEachfloat0002
     * @tc.desc   Verify the correctness of index parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG: string = "testForEachfloat0002";
      try {
        const arr: FixedArray<float> = [0.1 as float, 0.2 as float] as FixedArray<float>;
        const indexes: number[] = [];
        forEach(arr, (_: float, index: number): void => {
          indexes.push(index);
        });
        expect(indexes.toString()).assertEqual([0, 1].toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0300
     * @tc.name   testForEachfloat0003
     * @tc.desc   Test empty single precision floating-point array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachfloat0003";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0400
     * @tc.name   testForEachfloat004
     * @tc.desc   Verify basic iteration over float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat004";
      try {
        let arr: FixedArray<float> = [1.5f, 2.5f, 3.5f];
        let sum: number = 0.0;
        forEach(arr, (value: float) => {
          sum += value as number;
        });
        expect(sum).assertClose(7.5, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0500
     * @tc.name   testForEachfloat005
     * @tc.desc   Verify index parameter correctness
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat005";
      try {
        let arr: FixedArray<float> = [10.1f, 20.2f, 30.3f];
        let indices: FixedArray<number> = new Array<number>(3) as FixedArray<number>;
        let count = 0;
        forEach(arr, (value: float, index: number) => {
          indices[count++] = index;
        });
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0600
     * @tc.name   testForEachfloat006
     * @tc.desc   Verify original array reference in callback
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat006";
      try {
        let arr: FixedArray<float> = [0.1f, 0.2f, 0.3f];
        let isOriginal: boolean = true;
        forEach(arr, (value: float, index: number, array: FixedArray<float>) => {
          if (array !== arr) {
            isOriginal = false;
          }
        });
        expect(isOriginal).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0700
     * @tc.name   testForEachfloat007
     * @tc.desc   Verify behavior with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat007";
      try {
        let arr: FixedArray<float> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0800
     * @tc.name   testForEachfloat008
     * @tc.desc   Verify float precision handling
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat008";
      try {
        let arr: FixedArray<float> = [0.5f, 1.5f, 2.5f];
        let sum: float = 0.0f;
        forEach(arr, (value: float) => {
          sum += value;
        });
        expect(sum as number).assertClose(4.5, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_INT_0100
     * @tc.name   testForEachint007
     * @tc.desc   Verify behavior with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachint007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachint007";
      try {
        let arr: FixedArray<int> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_INT_0200
     * @tc.name   testForEachint008
     * @tc.desc   Verify array modification during iteration
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachint008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachint008";
      try {
        let arr: FixedArray<int> = [5, 10, 15];
        let result: string = '';
        forEach(arr, (value: int, index: number) => {
          result += `${value}`;
          if (index === 1) {
            arr[2] = 20;
          }
        });
        expect(result).assertEqual('51020');
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0100
     * @tc.name   testForEachlong001
     * @tc.desc   Test the basic functionality of long integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachlong001";
      try {
        const longArray: FixedArray<long> = [10000000000, 20000000000, 30000000000] as FixedArray<long>;
        let sum = 0n;
        let callCount = 0;
        forEach(longArray, (value: long, index: number, array: FixedArray<long>) => {
          sum += BigInt(value);
          callCount++;
          expect(array).assertEqual(longArray);
          expect(index).assertEqual(callCount - 1);
        });
        expect(sum).assertEqual(60000000000n);
        expect(callCount).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0200
     * @tc.name   testForEachlong002
     * @tc.desc   Test the empty length integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachlong002";
      try {
        const emptyArray: FixedArray<long> = [] as FixedArray<long>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0300
     * @tc.name   testForEachlong003
     * @tc.desc   Testing forEach with boundary long values (min, max, zero)
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong003', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachlong003";
      try {
        const longMin = -9223372036854775808;
        const longMax = 9223372036854775807;
        const zero = 0;
        const arr: FixedArray<long> = [longMin, longMax, zero] as FixedArray<long>;
        const results: long[] = [];
        forEach(arr, (value: long, index: number): void => {
          results.push(value);
        });
        expect(results.length).assertEqual(3);
        expect(results[0]).assertEqual(longMin);
        expect(results[1]).assertEqual(longMax);
        expect(results[2]).assertEqual(zero);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0400
     * @tc.name   testForEachlong004
     * @tc.desc   Verify index parameter correctness with long values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachlong004";
      try {
        let arr: FixedArray<long> = [9999999999 as long, -9999999999 as long];
        let indices: FixedArray<number> = new Array<number>(2) as FixedArray<number>;
        let count = 0;
        forEach(arr, (value: long, index: number) => {
          indices[count++] = index;
        });
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0500
     * @tc.name   testForEachlong005
     * @tc.desc   Verify original array reference in callback
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachlong005";
      try {
        let arr: FixedArray<long> = [123456789 as long, 987654321 as long];
        let isOriginal: boolean = true;
        forEach(arr, (value: long, index: number, array: FixedArray<long>) => {
          if (array !== arr) {
            isOriginal = false;
          }
        });
        expect(isOriginal).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0600
     * @tc.name   testForEachlong006
     * @tc.desc   Verify array modification during iteration
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong006', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachlong006";
      try {
        let arr: FixedArray<long> = [1000 as long, 2000 as long, 3000 as long];
        let result: string = '';
        forEach(arr, (value: long, index: number) => {
          result += `${value}`;
          if (index === 0) {
            arr[1] = 9999 as long;
          }
        });
        expect(result).assertEqual("100099993000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0100
     * @tc.name   testForEachshort001
     * @tc.desc   Test the basic function of short integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachshort001";
      try {
        const shortArray: FixedArray<short> = [100, 200, 300, 400] as FixedArray<short>;
        let sum = 0;
        let callCount = 0;
        forEach(shortArray, (value: short, index: number, array: FixedArray<short>) => {
          sum += value;
          callCount++;
          expect(array).assertEqual(shortArray);
          expect(index).assertEqual(callCount - 1);
        });
        expect(sum).assertEqual(1000);
        expect(callCount).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0200
     * @tc.name   testForEachshort002
     * @tc.desc   Test the empty short integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachshort002";
      try {
        const emptyArray: FixedArray<short> = [] as FixedArray<short>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0300
     * @tc.name   testForEachshort003
     * @tc.desc   Test negative short integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachshort003";
      try {
        const negativeArray: FixedArray<short> = [-100, -200, -300] as FixedArray<short>;
        let sum = 0;
        forEach(negativeArray, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(-600);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0400
     * @tc.name   testForEachshort0004
     * @tc.desc   Testing basic functionality of forEach with FixedArray<short>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0004";
      try {
        let arr: FixedArray<short> = [1, 2, 3] as FixedArray<short>;
        let sum: number = 0;
        forEach(arr, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0500
     * @tc.name   testForEachshort0005
     * @tc.desc   Testing forEach with index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0005";
      try {
        let arr: FixedArray<short> = [10, 20, 30] as FixedArray<short>;
        let indices: Array<number> = [];
        forEach(arr, (value: short, index: number) => {
          indices.push(index);
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0600
     * @tc.name   testForEachshort0006
     * @tc.desc   Testing forEach with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0006";
      try {
        let arr: FixedArray<short> = [] as FixedArray<short>;
        let count: number = 0;
        forEach(arr, (value: short) => {
          count++;
        });
        expect(count).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0700
     * @tc.name   testForEachshort0007
     * @tc.desc   Testing forEach with array containing negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0007";
      try {
        let arr: FixedArray<short> = [-1, -2, -3] as FixedArray<short>;
        let sum: number = 0;
        forEach(arr, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(-6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}