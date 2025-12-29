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

export default function Array_04Test() {
  describe('Array_04Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0100
     * @tc.name    testJoin0001
     * @tc.desc    Testing join function with a single element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0001";
      try {
        let array: FixedArray<long> = [123];
        let result = join(array);
        expect(result).assertEqual("123");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0200
     * @tc.name    testJoin0002
     * @tc.desc    Testing join function with multiple elements and default separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0002";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array);
        expect(result).assertEqual("123,456,789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0300
     * @tc.name    testJoin0003
     * @tc.desc    Testing join function with multiple elements and custom separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0003";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array, "-");
        expect(result).assertEqual("123-456-789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0400
     * @tc.name    testJoin0004
     * @tc.desc    Testing join function with undefined separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0004";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array, undefined);
        expect(result).assertEqual("123,456,789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0500
     * @tc.name    testJoin0005
     * @tc.desc    Testing join function with an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0005";
      try {
        let array: FixedArray<long> = [];
        let result = join(array);
        expect(result).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0600
     * @tc.name    testJoin0006
     * @tc.desc    Testing join function with a single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0006";
      try {
        let self: FixedArray<short> = [1];
        let result = join(self);
        expect(result).assertEqual("1");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0700
     * @tc.name    testJoin0007
     * @tc.desc    Testing join function with a multi-element array and default separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0007";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self);
        expect(result).assertEqual("1,2,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0800
     * @tc.name    testJoin0008
     * @tc.desc    Testing join function with a multi-element array and custom separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0008";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self, "-");
        expect(result).assertEqual("1-2-3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0900
     * @tc.name    testJoin0009
     * @tc.desc    Testing join function with a multi-element array and undefined separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0009";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self, undefined);
        expect(result).assertEqual("1,2,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_1000
     * @tc.name    testJoin0010
     * @tc.desc    Testing join function with an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0010";
      try {
        let self: FixedArray<short> = [];
        let result = join(self);
        expect(result).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0100
     * @tc.name    testLastIndexOf0001
     * @tc.desc    Testing lastIndexOf with normal values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0001";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = 3;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0200
     * @tc.name    testLastIndexOf0002
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0002";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = false;
        let fromIndex = 2;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0300
     * @tc.name    testLastIndexOf0003
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0003";
      try {
        let arr: FixedArray<boolean> = [];
        let element = true;
        let fromIndex = 0;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0400
     * @tc.name    testLastIndexOf0004
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0004";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = -2;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0500
     * @tc.name    testLastIndexOf0005
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0005";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = 10;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0600
     * @tc.name    testLastIndexOf0006
     * @tc.desc    Testing lastIndexOf with all elements matching
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0006";
      try {
        let arr: FixedArray<boolean> = [true, true, true, true, true];
        let element = true;
        let fromIndex = 3;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0700
     * @tc.name    testLastIndexOf0007
     * @tc.desc    Testing lastIndexOf with no elements matching
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0007";
      try {
        let arr: FixedArray<boolean> = [false, false, false, false, false];
        let element = true;
        let fromIndex = 4;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0800
     * @tc.name    testLastIndexOf0008
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0008";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0900
     * @tc.name    testLastIndexOf0009
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is in the array and fromIndex to 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0009";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true, 2);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1000
     * @tc.name    testLastIndexOf0010
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is not in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0010";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('-1');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1100
     * @tc.name    testLastIndexOf0011
     * @tc.desc    Test the lastIndexOf interface with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0011";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true, -2);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1200
     * @tc.name    testLastIndexOf0012
     * @tc.desc    Test the lastIndexOf interface with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0012";
      try {
        let arr: FixedArray<boolean> = [];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('-1');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1300
     * @tc.name    testLastIndexOf0013
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0013";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 2, 5];
        const result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1400
     * @tc.name    testLastIndexOf0014
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0014";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1500
     * @tc.name    testLastIndexOf0015
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0015";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1600
     * @tc.name    testLastIndexOf0016
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0016";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1700
     * @tc.name    testLastIndexOf0017
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0017";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1800
     * @tc.name    testLastIndexOf0018
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0018";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1900
     * @tc.name    testLastIndexOf0019
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0019";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, -2);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1900
     * @tc.name    testLastIndexOf0019
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0019";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, 10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2000
     * @tc.name    testLastIndexOf0020
     * @tc.desc    The default element is compatible with the array type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0020";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, 10.1);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2100
     * @tc.name    testLastIndexOf0021
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0021";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, 2);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2200
     * @tc.name    testLastIndexOf0022
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0022";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2300
     * @tc.name    testLastIndexOf0023
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0023";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = lastIndexOf(arr, 6.6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2400
     * @tc.name    testLastIndexOf0024
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0024";
      try {
        let arr: FixedArray<double> = [];
        let result = lastIndexOf(arr, 1.1, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2500
     * @tc.name    testLastIndexOf0025
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0025";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2600
     * @tc.name    testLastIndexOf0026
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0026";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2700
     * @tc.name    testLastIndexOf0027
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0027";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2800
     * @tc.name    testLastIndexOf0028
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0028";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2900
     * @tc.name    testLastIndexOf0029
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0029";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3000
     * @tc.name    testLastIndexOf0030
     * @tc.desc    Testing lastIndexOf with default fromIndex (no fromIndex parameter)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0030";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3100
     * @tc.name    testLastIndexOf0031
     * @tc.desc    Testing lastIndexOf with type conversion of fromIndex parameter_double
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0031";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3.8);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3200
     * @tc.name    testLastIndexOf0032
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0032";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3300
     * @tc.name    testLastIndexOf0033
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0033";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3400
     * @tc.name    testLastIndexOf0034
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0034";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 2.2, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3500
     * @tc.name    testLastIndexOf0035
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0035";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 1.1, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3600
     * @tc.name    testLastIndexOf0036
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0036";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3700
     * @tc.name    testLastIndexOf0037
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0037";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3800
     * @tc.name    testLastIndexOf0038
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0038";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3900
     * @tc.name    testLastIndexOf0039
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0039";
      try {
        let arr: FixedArray<number> = [3.0, 9.0, 3.0, 2.0, 8.0];
        let result = lastIndexOf(arr, 2.0, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4000
     * @tc.name    testLastIndexOf0040
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0040";
      try {
        let arr: FixedArray<number> = [8.0, 9.0, 1.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4100
     * @tc.name    testLastIndexOf0041
     * @tc.desc    Testing lastIndexOf with default fromIndex (no fromIndex parameter)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0041";
      try {
        let arr: FixedArray<number> = [6.0, 9.0, 8.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4200
     * @tc.name    testLastIndexOf0042
     * @tc.desc    Testing lastIndexOf with type conversion of fromIndex parameter_double
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0042";
      try {
        let arr: FixedArray<number> = [6.0, 9.0, 8.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3.8);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4300
     * @tc.name    testLastIndexOf0043
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0043";
      try {
        let arr: FixedArray<number> = [6.0, 9.0, 8.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4400
     * @tc.name    testLastIndexOf0044
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0044";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4500
     * @tc.name    testLastIndexOf0045
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0045";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4600
     * @tc.name    testLastIndexOf0046
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0046";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4700
     * @tc.name    testLastIndexOf0047
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0047";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4800
     * @tc.name    testLastIndexOf0048
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0048";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4900
     * @tc.name    testLastIndexOf0049
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0049";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5000
     * @tc.name    testLastIndexOf0050
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0050";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5100
     * @tc.name    testLastIndexOf0051
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0051";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5200
     * @tc.name    testLastIndexOf0052
     * @tc.desc    The default element is compatible with the array type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0052";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10.1);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5300
     * @tc.name    testLastIndexOf0053
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0053";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5400
     * @tc.name    testLastIndexOf0054
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0054";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5500
     * @tc.name    testLastIndexOf0055
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0055";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5600
     * @tc.name    testLastIndexOf0056
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0056";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5700
     * @tc.name    testLastIndexOf0057
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0057";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5800
     * @tc.name    testLastIndexOf0058
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0058";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5900
     * @tc.name    testLastIndexOf0059
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0059";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6000
     * @tc.name    testLastIndexOf0060
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0060";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6100
     * @tc.name    testLastIndexOf0061
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0061";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6200
     * @tc.name    testLastIndexOf0062
     * @tc.desc    The default element is compatible with the array type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0062";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10.1);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6300
     * @tc.name    testLastIndexOf0063
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0063";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6400
     * @tc.name    testLastIndexOf0064
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0064";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 3);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6500
     * @tc.name    testLastIndexOf0065
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0065";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 6000, 3);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_7800
     * @tc.name    testLastIndexOf0078
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0078";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 3000, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_7900
     * @tc.name    testLastIndexOf0079
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0079";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8000
     * @tc.name    testLastIndexOf0080
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0080";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 10);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8100
     * @tc.name    testLastIndexOf0081
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0081";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 4);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8200
     * @tc.name    testLastIndexOf0082
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0082";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 6000, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8300
     * @tc.name    testLastIndexOf0083
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0083";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 6000, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8400
     * @tc.name    testLastIndexOf84
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0084";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8500
     * @tc.name    testLastIndexOf0085
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0085";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 10);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8600
     * @tc.name    testLastIndexOf0086
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0086";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0100
     * @tc.name    testLowerBoundSearch0001
     * @tc.desc    Testing lowerBoundSearch with key found in array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0001";
      try {
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0200
     * @tc.name    testLowerBoundSearch0002
     * @tc.desc    Testing lowerBoundSearch with key not found (all elements < key)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0002";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

  });
}