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

export default function Array_03Test() {
  describe('Array_03Test', (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1000
     * @tc.name    testSort0010
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0010";
      try {
        let arr:FixedArray<boolean>=[false,true,false,true,false];
        sort(arr,0,5);
        const excepted:FixedArray<boolean>=[false,false,false,true,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1100
     * @tc.name    testSort0011
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0011";
      try {
        let arr:FixedArray<boolean>=[false,true,false,true,false];
        sort(arr,2,5);
        const excepted:FixedArray<boolean>=[false,true,false,false,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1200
     * @tc.name    testSort0012
     * @tc.desc    Testing sort with negative startIndex.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0012";
      try {
        let arr:FixedArray<boolean>=[true,true,false,true,false];
        sort(arr,-4,4);
        const excepted:FixedArray<boolean>=[true,false,true,true,false];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1300
     * @tc.name    testSort0013
     * @tc.desc    Testing sort with EndIndex greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0013";
      try {
        let arr:FixedArray<boolean>=[true,true,false,true,false];
        sort(arr,0,10086);
        const excepted:FixedArray<boolean>=[false,false,true,true,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1400
     * @tc.name    testSort0014
     * @tc.desc    Testing Startlndex and Endlndex values are the same.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0014";
      try {
        let arr:FixedArray<boolean>=[true,true,false,true,false];
        sort(arr,10086,10086);
        const excepted:FixedArray<boolean>=[true,true,false,true,false];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1500
     * @tc.name    testSort0015
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0015";
      try {
        let arr:FixedArray<boolean>=[];
        sort(arr,0,2);
        const excepted:FixedArray<boolean>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1600
     * @tc.name    testSort0016
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0016";
      try {
        let arr:FixedArray<boolean>=[true];
        sort(arr,0,1);
        const excepted:FixedArray<boolean>=[true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1700
     * @tc.name    testSort0017
     * @tc.desc    Testing sort with Index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0017";
      try {
        let arr:FixedArray<boolean>=[true,false,true];
        sort(arr,-10086,1314);
        const excepted:FixedArray<boolean>=[true,false,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_2700
     * @tc.name    testSort0027
     * @tc.desc    Testing sort with unsorted array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0027";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,0,5);
        const excepted:FixedArray<byte>=[-128,88,99,111,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_2800
     * @tc.name    testSort0028
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0028";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,2,5);
        const excepted:FixedArray<byte>=[127,111,-128,88,99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_2900
     * @tc.name    testSort0029
     * @tc.desc    Testing sort with negative startIndex.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0029";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,-10086,5);
        const excepted:FixedArray<byte>=[-128,88,99,111,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_3000
     * @tc.name    testSort0030
     * @tc.desc    Testing sort with EndIndex greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0030";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,0,10086);
        const excepted:FixedArray<byte>=[-128,88,99,111,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_3100
     * @tc.name    testSort0031
     * @tc.desc    Testing StartIndex and EndIndex values are the same.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0031";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,10,10);
        const excepted:FixedArray<byte>=[127,111,-128,88,99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_ARR_END_BYTE_3200
     * @tc.name    testSort0032
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0032";
      try {
        let arr:FixedArray<byte>=[];
        sort(arr,0,2);
        const excepted:FixedArray<byte>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_3300
     * @tc.name    testSort0033
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0033";
      try {
        let arr:FixedArray<byte>=[127];
        sort(arr,0,2);
        const excepted:FixedArray<byte>=[127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_3400
     * @tc.name    testSort0034
     * @tc.desc    Testing sort with Index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0034";
      try {
        let arr:FixedArray<byte>=[127,1,5,3,2];
        sort(arr,-10086,10086);
        const excepted:FixedArray<byte>=[127,1,5,3,2];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_ARR_END_BYTE_3500
     * @tc.name    testSort0035
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0035";
      try {
        let arr:FixedArray<byte>=[127,127,127,10];
        sort(arr,0,4);
        const excepted:FixedArray<byte>=[10,127,127,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_5100
     * @tc.name    testSort0051
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0051";
      try {
        let arr:FixedArray<char>=[];
        sort(arr,0,2);
        const excepted:FixedArray<char>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6400
     * @tc.name    testSort0064
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0064";
      try {
        let arr:FixedArray<double>=[8, 1, 0.8e-13, 0.8e-16, 0.006];
        sort(arr,0,5);
        const excepted:FixedArray<double>=[0.8e-16,0.8e-13,0.006,1,8];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6500
     * @tc.name    testSort0065
     * @tc.desc    Testing sort with Index in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0065";
      try {
        let arr:FixedArray<double>=[3.14, 9.26, 5.56, 2.25, 9.99];
        sort(arr,2,5);
        const excepted:FixedArray<double>=[3.14, 9.26, 2.25, 5.56, 9.99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6600
     * @tc.name    testSort0066
     * @tc.desc    Testing sort with negative lndex.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0066";
      try {
        let arr:FixedArray<double>=[3.14, 9.26, 5.56, 2.25, 9.99];
        sort(arr,-10086,5);
        const excepted:FixedArray<double>=[2.25, 3.14,  5.56, 9.26, 9.99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6700
     * @tc.name    testSort0067
     * @tc.desc    Testing sort with EndIndex greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0067";
      try {
        let arr:FixedArray<double>=[8, 1, 0.8e-16, 0.8e-13, 0.006];
        sort(arr,0,1008611);
        const excepted:FixedArray<double>=[0.8e-16,0.8e-13,0.006,1,8];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6800
     * @tc.name    testSort0068
     * @tc.desc    Testing StartIndex and EndIndex values are the same.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0068";
      try {
        let arr:FixedArray<double>=[8, 1, 0.8e-13, 0.8e-16, 0.006];
        sort(arr,-10086,-10086);
        const excepted:FixedArray<double>=[8, 1, 0.8e-13, 0.8e-16, 0.006];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6900
    * @tc.name    testSort0069
    * @tc.desc    Testing sort with empty array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSort0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0069";
      try {
        let arr:FixedArray<double>=[];
        sort(arr,0,2);
        const excepted:FixedArray<double>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_7000
     * @tc.name    testSort0070
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0070";
      try {
        let arr:FixedArray<double>=[0.8e-13];
        sort(arr,0,1);
        const excepted:FixedArray<double>=[0.8e-13];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_7100
     * @tc.name    testSort0071
     * @tc.desc    Testing sort with Index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0071";
      try {
        let arr:FixedArray<double>=[8, 1, 10086, 0.8e-16, 0.006];
        sort(arr,-10086,1008611);
        const excepted:FixedArray<double>=[8, 1,10086, 0.8e-16, 0.006];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_7200
     * @tc.name    testSort0072
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0072";
      try {
        let arr:FixedArray<double>=[8, 1, 1,1,1,10086.10086];
        sort(arr,0,6);
        const excepted:FixedArray<double>=[1,1,1,1,8,10086.10086];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_8700
     * @tc.name    testSort0087
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0087";
      try {
        let arr:FixedArray<float>=[];
        sort(arr,0,1);
        const excepted:FixedArray<float>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_8800
     * @tc.name    testSort0088
     * @tc.desc    Testing sort with single element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0088";
      try {
        let arr:FixedArray<float>=[10086.00];
        sort(arr,0,1);
        const excepted:FixedArray<float>=[10086.00];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_8900
     * @tc.name    testSort0089
     * @tc.desc    Testing sort with Index greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0089";
      try {
        let arr:FixedArray<float>=[10086.00];
        sort(arr,-10086,10086);
        const excepted:FixedArray<float>=[10086.00];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1000
     * @tc.name    testSort0100
     * @tc.desc    Sort entire arr from 0 to length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0100";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,0,5);
        const excepted:FixedArray<int>= [-2147483648,1,6,9,2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1010
     * @tc.name    testSort0101
     * @tc.desc    Testing sort with Index in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0101";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,2,4);
        const excepted:FixedArray<int>= [2147483647,6,1,9,-2147483648];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1020
     * @tc.name    testSort0102
     * @tc.desc    Testing sort with negative startIndex out of range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0102";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,-10,4);
        const excepted:FixedArray<int>= [1,6,9,2147483647,-2147483648];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1030
     * @tc.name    testSort0103
     * @tc.desc    Test the IndexEnd_Value that exceeds the range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0103";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,0,10086);
        const excepted:FixedArray<int>= [-2147483648,1,6,9,2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1040
     * @tc.name    testSort0104
     * @tc.desc    Testing StartIndex and EndIndex values are the same
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0104";
      try {
        let arr:FixedArray<int>=[-2,6,9,1,10086];
        sort(arr,2,2);
        const excepted:FixedArray<int>= [-2,6,9,1,10086];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1050
     * @tc.name    testSort0105
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0105";
      try {
        let arr:FixedArray<int>=[];
        sort(arr,0,0);
        const excepted:FixedArray<int>= [];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1060
     * @tc.name    testSort0106
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0106";
      try {
        let arr:FixedArray<int>=[2147483647];
        sort(arr,0,1);
        const excepted:FixedArray<int>= [2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1070
     * @tc.name    testSort0107
     * @tc.desc    Testing sort with negative EndIndex out of range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0107";
      try {
        let arr:FixedArray<int>=[2147483647,3,6,1];
        sort(arr,0,-10086);
        const excepted:FixedArray<int>= [1,3,6,2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1080
     * @tc.name    testSort0108
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0108";
      try {
        let arr:FixedArray<int>=[10086,666,666,666];
        sort(arr,0,3);
        const excepted:FixedArray<int>= [666,666,10086,666];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1180
     * @tc.name    testSort0118
     * @tc.desc    Testing sort with startIndex O on unsorted array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0118";
      try {
        let arr:FixedArray<long> =[9007199254740991,9,6,5];
        sort(arr,0,4);
        const excepted:FixedArray<long>=[5,6,9,9007199254740991];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1190
     * @tc.name    testSort0119
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0119";
      try {
        let arr:FixedArray<long> =[9007199254740991,9,6,5,7];
        sort(arr,2,5);
        const excepted:FixedArray<long>=[9007199254740991,9,5,6,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1200
     * @tc.name    testSort0120
     * @tc.desc    Testing sort with negative startIndex.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0120";
      try {
        let arr:FixedArray<long> =[9007199254740991,9,6,5,7];
        sort(arr,-3,5);
        const excepted:FixedArray<long>=[9007199254740991,9,5,6,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1210
     * @tc.name    testSort0121
     * @tc.desc    Testing sort with Index greater than length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0121";
      try {
        let arr:FixedArray<long> =[-3,9,6,5,7,2];
        sort(arr,0,10086);
        const excepted:FixedArray<long>=[-3,2,5,6,7,9];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1220
     * @tc.name    testSort0122
     * @tc.desc    Testing StartIndex and EndIndex values are the same
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0122";
      try {
        let arr:FixedArray<long> =[864141665,9,6,5,7];
        sort(arr,2,2);
        const excepted:FixedArray<long>=[864141665,9,6,5,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1230
     * @tc.name    testSort0123
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0123";
      try {
        let arr:FixedArray<long> =[];
        sort(arr,0,1);
        const excepted:FixedArray<long>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1240
     * @tc.name    testSort0124
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0124";
      try {
        let arr:FixedArray<long> =[-9007199254740991];
        sort(arr,0,1);
        const excepted:FixedArray<long>=[-9007199254740991];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1250
     * @tc.name    testSort0125
     * @tc.desc    Testing sort with Index out of range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0125";
      try {
        let arr:FixedArray<long> =[1008611,9,6,5,7];
        sort(arr,-10086,10086);
        const excepted:FixedArray<long>=[1008611,9,6,5,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1260
     * @tc.name    testSort0126
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0126";
      try {
        let arr:FixedArray<long> =[6,6,6,6,9,6,5,7];
        sort(arr,0,9);
        const excepted:FixedArray<long>=[5,5,6,6,6,6,6,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1360
     * @tc.name    testSort0136
     * @tc.desc    Testing sort with unsorted array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0136";
      try {
        let arr:FixedArray<short>=[32767,-32768,1];
        sort(arr,0,3);
        const excepted:FixedArray<short>=[-32768,1,32767];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1370
     * @tc.name    testSort0137
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0137";
      try {
        let arr:FixedArray<short>=[32767, -32768, 9, 5, 1];
        sort(arr,2,5);
        const excepted:FixedArray<short>=[32767, -32768, 1, 5, 9];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1380
     * @tc.name    testSort0138
     * @tc.desc    Testing sort with negative startIndex.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0138";
      try {
        let arr:FixedArray<short>=[32767, -32768, -9, 5, 1];
        sort(arr,-3,5);
        const excepted:FixedArray<short>=[32767, -32768, -9, 1, 5];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1390
    * @tc.name    testSort0139
    * @tc.desc    Testing sort with EndIndex greater than array length.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSort0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0139";
      try {
        let arr:FixedArray<short>=[32767, -32768, 9, 5, 1];
        sort(arr,0,10086);
        const excepted:FixedArray<short>=[-32768, 1, 5, 9 ,32767 ];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1400
     * @tc.name    testSort0140
     * @tc.desc    Testing StartIndex and EndIndex values are the same.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0140";
      try {
        let arr:FixedArray<short>=[32767, -32768, 9, 5, 1];
        sort(arr,-10086,-10086);
        const excepted:FixedArray<short>=[32767, -32768, 9, 5, 1];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1410
     * @tc.name    testSort0141
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0141";
      try {
        let arr:FixedArray<short>=[];
        sort(arr,0,2);
        const excepted:FixedArray<short>=[];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1420
     * @tc.name    testSort0142
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0142";
      try {
        let arr:FixedArray<short>=[10086];
        sort(arr,0,2);
        const excepted:FixedArray<short>=[10086];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1430
     * @tc.name    testSort0143
     * @tc.desc    Testing sort with Index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0143";
      try {
        let arr:FixedArray<short>=[1,5,1,3,6,5];
        sort(arr,-1008611,1008611);
        const excepted:FixedArray<short>=[1,5,1,3,6,5];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1440
     * @tc.name    testSort0144
     * @tc.desc    Testing sort with unsorted Index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0144";
      try {
        let arr:FixedArray<short>=[6,6,6,5,9];
        sort(arr,0,5);
        const excepted:FixedArray<short>=[5,6,6,6,9];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1450
     * @tc.name      testSort0145
     * @tc.desc      Testing sort function with various boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0145";
      try {
        let arr1: FixedArray<boolean> = [true, false, true, false];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<boolean> = [false, false, true, true];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1460
     * @tc.name      testSort0146
     * @tc.desc      Testing sort function with empty boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0146";
      try {
        let arr3: FixedArray<boolean> = [];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1470
     * @tc.name      testSort0147
     * @tc.desc      Testing sort function with same boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0147";
      try {
        let arr3: FixedArray<boolean> = [false, false ,false];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [false, false ,false];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1480
     * @tc.name      testSort0148
     * @tc.desc      Testing sort function with same boolean value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0148";
      try {
        let arr1: FixedArray<boolean> = [true, true, true];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<boolean> = [true, true, true];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1490
     * @tc.name      testSort0149
     * @tc.desc      Testing sort function with a single element boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0149";
      try {
        let arr3: FixedArray<boolean> = [true];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [true];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1500
     * @tc.name      testSort0150
     * @tc.desc      Testing sort function with a single element boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0150";
      try {
        let arr3: FixedArray<boolean> = [false];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [false];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1550
     * @tc.name      testSort0155
     * @tc.desc      Testing sort function with byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      let TAG = "testSort0155";
      try {
        let arr1: FixedArray<byte> = [3, 6, -2, -9,-128];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [-128,-9, -2, 3, 6];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1560
     * @tc.name      testSort0156
     * @tc.desc      Testing sort function with an empty byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0156";
      try {
        let arr3: FixedArray<boolean> = [];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1570
     * @tc.name      testSort0157
     * @tc.desc      Testing sort function with a single element byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0157";
      try {
        let arr1: FixedArray<byte> = [127];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [127];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1580
     * @tc.name      testSort0158
     * @tc.desc      Testing sort function with an array containing duplicate elements for byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0158";
      try {
        let arr1: FixedArray<byte> = [9,6,6,6,127];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [6,6,6,9,127];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1590
     * @tc.name      testSort0159
     * @tc.desc      Testing sort with already sorted byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0159";
      try {
        let arr1: FixedArray<byte> = [1,2,3,4,5];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [1,2,3,4,5];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

  })
}