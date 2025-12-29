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

export default function Array_07Test() {
  describe('Array_07Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_9800
     * @tc.name    testSliceFloat9800
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat9800";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 0;
        const result = slice(array, 0);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_9900
     * @tc.name    testSliceFloat9900
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat9900";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 2;
        const result = slice(array, 2);
        const expected: FixedArray<float> = [3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1000
     * @tc.name    testSliceFloat1000
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1000";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 4;
        const result = slice(array, 4);
        const expected: FixedArray<float> = [5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1010
     * @tc.name    testSliceFloat1010
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1010";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 5;
        const result = slice(array, 5);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1020
     * @tc.name    testSliceFloat1020
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1020";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 8;
        const result = slice(array, 8);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1030
     * @tc.name    testSliceFloat1030
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1030";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = -1;
        const result = slice(array, -1);
        const expected: FixedArray<float> = [5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1040
     * @tc.name    testSliceFloat1040
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1040";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = -3;
        const result = slice(array, -3);
        const expected: FixedArray<float> = [3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1050
     * @tc.name    testSliceFloat1050
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1050";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = -10;
        const result = slice(array, -10);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1060
     * @tc.name    testSliceFloat1060
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1060";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = undefined;
        const result = slice(array, undefined);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1070
     * @tc.name    testSliceFloat1070
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1070";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const start = 1.5;
        const result = slice(array, 1.5);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1080
     * @tc.name    testSliceFloat1080
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1080";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        const start = 1;
        const result = slice(array, 1);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1090
     * @tc.name    testSliceFloat1090
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloat1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloat1090";
      try {
        const array: FixedArray<float> = [];
        const start = 0;
        const result = slice(array, 0);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1100
     * @tc.name    testSliceFloatInt1100
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1100";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 0;
        const relEnd: int = 4;
        const result = slice(array, 0, 4);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1110
     * @tc.name    testSliceFloatInt1110
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1110";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 2;
        const relEnd: int = 4;
        const result = slice(array, 2, 4);
        const expected: FixedArray<float> = [3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1120
     * @tc.name    testSliceFloatInt1120
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1120";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 2;
        const relEnd: int = 5;
        const result = slice(array, 2, 5);
        const expected: FixedArray<float> = [3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1130
     * @tc.name    testSliceFloatInt1130
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1130";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 2;
        const relEnd: int = 2;
        const result = slice(array, 2, 2);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1140
     * @tc.name    testSliceFloatInt1140
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1140";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 3;
        const relEnd: int = 1;
        const result = slice(array, 3, 1);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1150
     * @tc.name    testSliceFloatInt1150
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1150";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = -2;
        const relEnd: int = 5;
        const result = slice(array, -2, 5);
        const expected: FixedArray<float> = [4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1160
     * @tc.name    testSliceFloatInt1160
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1160";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 1;
        const relEnd: int = -1;
        const result = slice(array, 1, -1);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1170
     * @tc.name    testSliceFloatInt1170
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1170";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = -3;
        const relEnd: int = -1;
        const result = slice(array, -3, -1);
        const expected: FixedArray<float> = [3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1180
     * @tc.name    testSliceFloatInt1180
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1180";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 0;
        const relEnd: int = 10;
        const result = slice(array, 0, 10);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1190
     * @tc.name    testSliceFloatInt1190
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1190";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = -10;
        const relEnd: int = 3;
        const result = slice(array, -10, 3);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1200
     * @tc.name    testSliceFloatInt1200
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1200";
      try {
        const array: FixedArray<float> = [];
        const relStart: int = 0;
        const relEnd: int = 0;
        const result = slice(array, 0, 0);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1210
     * @tc.name    testSliceFloatInt1210
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1210";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 5;
        const relEnd: int = 10;
        const result = slice(array, 5, 10);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1220
     * @tc.name    testSliceFloatInt1220
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1220";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 0;
        const relEnd: int = Number.NEGATIVE_INFINITY as int;
        const result = slice(array, 0, Number.NEGATIVE_INFINITY);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1230
     * @tc.name    testSliceFloatInt1230
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1230";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 1.5 as int;
        const relEnd: int = 4;
        const result = slice(array, 1.5, 4);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1240
     * @tc.name    testSliceFloatInt1240
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1240";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int = 1;
        const relEnd: int = 3.5 as int;
        const result = slice(array, 1, 3.5);
        const expected: FixedArray<float> = [2.0, 3.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1250
     * @tc.name    testSliceFloatInt1250
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1250";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const relStart: int | undefined = undefined;
        const relEnd: int = 4;
        const result = slice(array, undefined, 4);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1260
     * @tc.name    testSliceFloatInt1260
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatInt1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatInt1260";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        const relStart: int = 1;
        const relEnd: int = 5;
        const result = slice(array, 1, 5);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1270
     * @tc.name    testSliceFloatNumber1270
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1270";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 0;
        const asIntOrDefaultend: number = 4;
        const result = slice(array, 0, 4);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1280
     * @tc.name    testSliceFloatNumber1280
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1280";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 2;
        const asIntOrDefaultend: number = 4;
        const result = slice(array, 2, 4);
        const expected: FixedArray<float> = [3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1290
     * @tc.name    testSliceFloatNumber1290
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1290";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 2;
        const asIntOrDefaultend: number = 5;
        const result = slice(array, 2, 5);
        const expected: FixedArray<float> = [3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1300
     * @tc.name    testSliceFloatNumber1300
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1300";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 2;
        const asIntOrDefaultend: number = 2;
        const result = slice(array, 2, 2);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1310
     * @tc.name    testSliceFloatNumber1310
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1310";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 3;
        const asIntOrDefaultend: number = 1;
        const result = slice(array, 3, 1);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1320
     * @tc.name    testSliceFloatNumber1320
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1320";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = -2;
        const asIntOrDefaultend: number = 5;
        const result = slice(array, -2, 5);
        const expected: FixedArray<float> = [4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1330
     * @tc.name    testSliceFloatNumber1330
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1330";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 1;
        const asIntOrDefaultend: number = -1;
        const result = slice(array, 1, -1);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1340
     * @tc.name    testSliceFloatNumber1340
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1340";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = -3;
        const asIntOrDefaultend: number = -1;
        const result = slice(array, -3, -1);
        const expected: FixedArray<float> = [3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1350
     * @tc.name    testSliceFloatNumber1350
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1350";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 0;
        const asIntOrDefaultend: number = 10;
        const result = slice(array, 0, 10);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1360
     * @tc.name    testSliceFloatNumber1360
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1360";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = -10;
        const asIntOrDefaultend: number = 3;
        const result = slice(array, -10, 3);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1370
     * @tc.name    testSliceFloatNumber1370
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1370";
      try {
        const array: FixedArray<float> = [];
        const asIntOrDefaultstart: number = 0;
        const asIntOrDefaultend: number = 0;
        const result = slice(array, 0, 0);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1380
     * @tc.name    testSliceFloatNumber1380
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1380";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 5;
        const asIntOrDefaultend: number = 10;
        const result = slice(array, 5, 10);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1390
     * @tc.name    testSliceFloatNumber1390
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1390";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 2147483648;
        const asIntOrDefaultend: number = 4;
        const result = slice(array, 214748364, 4);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1400
     * @tc.name    testSliceFloatNumber1400
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1400";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 0;
        const asIntOrDefaultend: number = Number.NEGATIVE_INFINITY;
        const result = slice(array, 0, Number.NEGATIVE_INFINITY);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1410
     * @tc.name    testSliceFloatNumber1410
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1410";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 1.5;
        const asIntOrDefaultend: number = 4;
        const result = slice(array, 1.5, 4);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1420
     * @tc.name    testSliceFloatNumber1420
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1420";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 1;
        const asIntOrDefaultend: number = 3.5;
        const result = slice(array, 1, 3.5);
        const expected: FixedArray<float> = [2.0, 3.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1430
     * @tc.name    testSliceFloatNumber1430
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1430";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number | undefined = undefined;
        const asIntOrDefaultend: number = 4;
        const result = slice(array, undefined, 4);
        const expected: FixedArray<float> = [1.0, 2.0, 3.0, 4.0];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1440
     * @tc.name    testSliceFloatNumber1440
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1440";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        const asIntOrDefaultstart: number = 1;
        const asIntOrDefaultend: number = 5;
        const result = slice(array, 1, 5);
        const expected: FixedArray<float> = [2.0, 3.0, 4.0, 4.4028235 * 10 ^ 38];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1450
     * @tc.name    testSliceFloatNumber1450
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFloatNumber1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceFloatNumber1450";
      try {
        const array: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        const asIntOrDefaultstart: number = 10;
        const asIntOrDefaultend: number = 15;
        const result = slice(array, 10, 15);
        const expected: FixedArray<float> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1460
     * @tc.name    testSliceInt1460
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1460";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 0;
        const result = slice(array, 0);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1470
     * @tc.name    testSliceInt1470
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1470";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 2;
        const result = slice(array, 2);
        const expected: FixedArray<int> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1480
     * @tc.name    testSliceInt1480
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1480";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 4;
        const result = slice(array, 4);
        const expected: FixedArray<int> = [5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1490
     * @tc.name    testSliceInt1490
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1490";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 5;
        const result = slice(array, 5);
        const expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1500
     * @tc.name    testSliceInt1500
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1500";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 8;
        const result = slice(array, 8);
        const expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1510
     * @tc.name    testSliceInt1510
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1510";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = -1;
        const result = slice(array, -1);
        const expected: FixedArray<int> = [5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1520
     * @tc.name    testSliceInt1520
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1520";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = -3;
        const result = slice(array, -3);
        const expected: FixedArray<int> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1530
     * @tc.name    testSliceInt1530
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1530";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = -10;
        const result = slice(array, -10);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1540
     * @tc.name    testSliceInt1540
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1540";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = undefined;
        const result = slice(array, undefined);
        const expected: FixedArray<int> = [1, 2, 3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1550
     * @tc.name    testSliceInt1550
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1550";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const start = 1.5;
        const result = slice(array, 1.5);
        const expected: FixedArray<int> = [2, 3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1560
     * @tc.name    testSliceInt1560
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1560";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 2147483647];
        const start = 1;
        const result = slice(array, 1);
        const expected: FixedArray<int> = [2, 3, 4, 2147483647];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1570
     * @tc.name    testSliceInt1570
     * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceInt1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceInt1570";
      try {
        const array: FixedArray<int> = [];
        const start = 0;
        const result = slice(array, 0);
        const expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1580
     * @tc.name    testSliceIntInt1580
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1580";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 0;
        const relEnd: int = 4;
        const result = slice(array, 0, 4);
        const expected: FixedArray<int> = [1, 2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1590
     * @tc.name    testSliceIntInt1590
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1590";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 2;
        const relEnd: int = 4;
        const result = slice(array, 2, 4);
        const expected: FixedArray<int> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1600
     * @tc.name    testSliceIntInt1600
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1600";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 2;
        const relEnd: int = 5;
        const result = slice(array, 2, 5);
        const expected: FixedArray<int> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1610
     * @tc.name    testSliceIntInt1610
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1610";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 2;
        const relEnd: int = 2;
        const result = slice(array, 2, 2);
        const expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1620
     * @tc.name    testSliceIntInt1620
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1620";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 3;
        const relEnd: int = 1;
        const result = slice(array, 3, 1);
        const expected: FixedArray<int> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1630
     * @tc.name    testSliceIntInt1630
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1630";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = -2;
        const relEnd: int = 5;
        const result = slice(array, -2, 5);
        const expected: FixedArray<int> = [4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1640
     * @tc.name    testSliceIntInt1640
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1640";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = 1;
        const relEnd: int = -1;
        const result = slice(array, 1, -1);
        const expected: FixedArray<int> = [2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_1650
     * @tc.name    testSliceIntInt1650
     * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceIntInt1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceIntInt1650";
      try {
        const array: FixedArray<int> = [1, 2, 3, 4, 5];
        const relStart: int = -3;
        const relEnd: int = -1;
        const result = slice(array, -3, -1);
        const expected: FixedArray<int> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

  });
}