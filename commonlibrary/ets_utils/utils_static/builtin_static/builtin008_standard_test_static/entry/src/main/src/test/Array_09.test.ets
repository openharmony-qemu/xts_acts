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

export default function Array_09Test() {

  describe("Array_09Test", (): void => {
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
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0100
     * @tc.name     testToLocaleString0001
     * @tc.desc     Verify that toLocaleString correctly converts a standard short-type array with positive and negative values, including thousand separators
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0001';
      try {
        let arr: FixedArray<short> = [1234 as short, -567 as short, 890 as short];
        expect(toLocaleString(arr)).assertEqual("1234,-567,890");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0200
     * @tc.name     testToLocaleString0002
     * @tc.desc     Verify the behavior of toLocaleString when handling an empty array; should return an empty string
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0002';
      try {
        let emptyArr: FixedArray<short> = [];
        expect(toLocaleString(emptyArr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0400
     * @tc.name     testToLocaleString0004
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on empty short array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0004';
      try {
        let arr: FixedArray<short> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0500
     * @tc.name     testToLocaleString0005
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on empty short array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0005';
      try {
        let arr: FixedArray<short> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0600
     * @tc.name     testToLocaleString0006
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0006';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0700
     * @tc.name     testToLocaleString0007
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0007';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0800
     * @tc.name     testToLocaleString0008
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on empty short array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0008';
      try {
        let arr: FixedArray<short> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0900
     * @tc.name     testToLocaleString0009
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0009';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1000
     * @tc.name     testToLocaleString0010
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0010';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1100
     * @tc.name     testToLocaleString0011
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and 'currency' options on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0011';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1200
     * @tc.name     testToLocaleString0012
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on short array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0012';
      try {
        let arr: FixedArray<short> = [1000 as short];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1300
     * @tc.name     testToLocaleString0013
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on empty short array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0013';
      try {
        let arr: FixedArray<short> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1400
     * @tc.name     testToLocaleString0014
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on empty short array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0014';
      try {
        let arr: FixedArray<short> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1500
     * @tc.name     testToLocaleString0015
     * @tc.desc     Verify that toLocaleString correctly converts an empty long-type array to empty string
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0015';
      try {
        let arr: FixedArray<long> = [];
        expect(toLocaleString(arr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1600
     * @tc.name     testToLocaleString0016
     * @tc.desc     Verify that toLocaleString converts long-type array with min, zero, max values correctly
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0016';
      try {
        let arr: FixedArray<long> = [-9223372036854775808, 0, 9223372036854775807];
        expect(toLocaleString(arr)).assertEqual("-9223372036854775808,0,9223372036854775807");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1700
     * @tc.name     testToLocaleString0017
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on empty long array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0017';
      try {
        let arr: FixedArray<long> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1800
     * @tc.name     testToLocaleString0018
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on empty long array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0018';
      try {
        let arr: FixedArray<long> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_1900
     * @tc.name     testToLocaleString0019
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0019';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2000
     * @tc.name     testToLocaleString0020
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0020';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2100
     * @tc.name     testToLocaleString0021
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on empty long array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0021';
      try {
        let arr: FixedArray<long> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2200
     * @tc.name     testToLocaleString0022
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0022';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2300
     * @tc.name     testToLocaleString0023
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0023';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2400
     * @tc.name     testToLocaleString0024
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and 'currency' options on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0024';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2500
     * @tc.name     testToLocaleString0025
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on long array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0025';
      try {
        let arr: FixedArray<long> = [1000 as long];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2600
     * @tc.name     testToLocaleString0026
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on empty long array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0026';
      try {
        let arr: FixedArray<long> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2700
     * @tc.name     testToLocaleString0027
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on empty long array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0027';
      try {
        let arr: FixedArray<long> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2700
     * @tc.name     testToLocaleString0027
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on empty int array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0027';
      try {
        let arr: FixedArray<int> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2800
     * @tc.name     testToLocaleString0028
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on empty int array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0028';
      try {
        let arr: FixedArray<int> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_2900
     * @tc.name     testToLocaleString0029
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0029';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3000
     * @tc.name     testToLocaleString0030
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0030';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3100
     * @tc.name     testToLocaleString0031
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on empty int array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0031';
      try {
        let arr: FixedArray<int> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3200
     * @tc.name     testToLocaleString0032
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0032';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3300
     * @tc.name     testToLocaleString0033
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0033';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3400
     * @tc.name     testToLocaleString0034
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and 'currency' options on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0034';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3500
     * @tc.name     testToLocaleString0035
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on int array with one element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0035';
      try {
        let arr: FixedArray<int> = [1000 as int];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3600
     * @tc.name     testToLocaleString0036
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on empty int array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0036';
      try {
        let arr: FixedArray<int> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_3700
     * @tc.name     testToLocaleString0037
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' options on empty int array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0037';
      try {
        let arr: FixedArray<int> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0380
     * @tc.name     testToLocaleString0038
     * @tc.desc     Verify that toLocaleString correctly converts empty float-type array to empty string without error
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0038';
      try {
        let arr: FixedArray<float> = [];
        expect(toLocaleString(arr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0390
     * @tc.name     testToLocaleString0039
     * @tc.desc     Verify that toLocaleString correctly converts float-type arrays with smallest positive, largest positive, and largest negative float values
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0039';
      try {
        let arr: FixedArray<float> = [
          1.401298464324817E-45 as float,
          3.4028234663852886E38 as float,
          -3.4028234663852886E38 as float
        ];
        let expectd = "1e-45,3.4028235e+38,-3.4028235e+38";
        expect(toLocaleString(arr)).assertEqual(expectd);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0400
     * @tc.name     testToLocaleString0040
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale parameter on empty float-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0040';
      try {
        let arr: FixedArray<float> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0410
     * @tc.name     testToLocaleString0041
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' on empty float-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0041';
      try {
        let arr: FixedArray<float> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0420
     * @tc.name     testToLocaleString0042
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale parameter on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0042';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0430
     * @tc.name     testToLocaleString0043
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0043';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0440
     * @tc.name     testToLocaleString0044
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and options parameters on empty float-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0044';
      try {
        let arr: FixedArray<float> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0450
     * @tc.name     testToLocaleString0045
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and options parameters on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0045';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0460
     * @tc.name     testToLocaleString0046
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and empty options on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0046';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0470
     * @tc.name     testToLocaleString0047
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and 'currency' option on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0047';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0480
     * @tc.name     testToLocaleString0048
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and 'currency' option on float-type array with one smallest positive float element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0048';
      try {
        let arr: FixedArray<float> = [1.401298464324817E-45 as float];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0490
     * @tc.name     testToLocaleString0049
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and empty options on empty float-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0049';
      try {
        let arr: FixedArray<float> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0500
     * @tc.name     testToLocaleString0050
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and 'currency' option on empty float-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0050';
      try {
        let arr: FixedArray<float> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0510
     * @tc.name     testToLocaleString0051
     * @tc.desc     Verify that toLocaleString correctly converts empty double-type array to empty string
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0051';
      try {
        let arr: FixedArray<double> = [];
        expect(toLocaleString(arr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0520
     * @tc.name     testToLocaleString0052 ----无效用例
     * @tc.desc     Verify that toLocaleString correctly converts double-type arrays with smallest positive, largest positive, and largest negative double values
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0052';
      try {
        let arr: FixedArray<double> = [
          4.9406564584124654e-324 as double,
          1.7976931348623157e+308 as double,
          -1.7976931348623157e+308 as double
        ];
        let expected =
          "0,179,769,313,486,231,570,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,-179,769,313,486,231,570,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000";
        expect(toLocaleString(arr)).assertEqual(expected);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0530
     * @tc.name     testToLocaleString0053
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale parameter on empty double-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0053';
      try {
        let arr: FixedArray<double> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0540
     * @tc.name     testToLocaleString0054
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' on empty double-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0054';
      try {
        let arr: FixedArray<double> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0550
     * @tc.name     testToLocaleString0055
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale parameter on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0055';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0560
     * @tc.name     testToLocaleString0056
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0056';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0570
     * @tc.name     testToLocaleString0057
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and options parameters on empty double-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0057';
      try {
        let arr: FixedArray<double> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0580
     * @tc.name     testToLocaleString0058
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and options parameters on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0058';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0590
     * @tc.name     testToLocaleString0059
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and empty options parameters on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0059';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0600
     * @tc.name     testToLocaleString0060
     * @tc.desc     Verify that toLocaleString throws an error when called with empty locale and 'currency' option on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0060';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0610
     * @tc.name     testToLocaleString0061
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and 'currency' option on double-type array with one smallest positive element
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0061';
      try {
        let arr: FixedArray<double> = [4.9406564584124654E-324 as double];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0620
     * @tc.name     testToLocaleString0062
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and empty options parameters on empty double-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0062';
      try {
        let arr: FixedArray<double> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0630
     * @tc.name     testToLocaleString0063
     * @tc.desc     Verify that toLocaleString throws an error when called with locale 'en-US' and 'currency' option on empty double-type array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0063';
      try {
        let arr: FixedArray<double> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0640
     * @tc.name     testToLocaleString0064
     * @tc.desc     Verify toLocaleString converts empty char array to empty string
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0064';
      try {
        let arr: FixedArray<char> = [];
        expect(toLocaleString(arr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0670
     * @tc.name     testToLocaleString0067
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale parameter on empty char array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0067';
      try {
        let arr: FixedArray<char> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0680
     * @tc.name     testToLocaleString0068
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' on empty char array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0068';
      try {
        let arr: FixedArray<char> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0710
     * @tc.name     testToLocaleString0071
     * @tc.desc     Verify that toLocaleString throws error when called with empty locale and options parameters on empty char array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0071';
      try {
        let arr: FixedArray<char> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0760
     * @tc.name     testToLocaleString0076
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and empty options on empty char array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0076';
      try {
        let arr: FixedArray<char> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0770
     * @tc.name     testToLocaleString0077
     * @tc.desc     Verify that toLocaleString throws error when called with locale 'en-US' and 'currency' option on empty char array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0077';
      try {
        let arr: FixedArray<char> = [];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0780
     * @tc.name     testToLocaleString0078
     * @tc.desc     Verify toLocaleString converts empty byte array to empty string
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0078';
      try {
        let arr: FixedArray<byte> = [];
        expect(toLocaleString(arr)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0790
     * @tc.name     testToLocaleString0079
     * @tc.desc     Verify toLocaleString converts byte array [1,2,3,4] to comma separated string "1,2,3,4"
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0079';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        expect(toLocaleString(arr)).assertEqual("1,2,3,4");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0800
     * @tc.name     testToLocaleString0080
     * @tc.desc     Verify toLocaleString throws error when called with empty locale parameter on empty byte array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0080';
      try {
        let arr: FixedArray<byte> = [];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0810
     * @tc.name     testToLocaleString0081
     * @tc.desc     Verify toLocaleString throws error when called with locale 'en-US' on empty byte array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0081';
      try {
        let arr: FixedArray<byte> = [];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0820
     * @tc.name     testToLocaleString0082
     * @tc.desc     Verify toLocaleString throws error when called with empty locale parameter on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0082';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0830
     * @tc.name     testToLocaleString0083
     * @tc.desc     Verify toLocaleString throws error when called with locale 'en-US' on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0083';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, 'en-US');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0840
     * @tc.name     testToLocaleString0084
     * @tc.desc     Verify toLocaleString throws error when called with empty locale and options on empty byte array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0084';
      try {
        let arr: FixedArray<byte> = [];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0850
     * @tc.name     testToLocaleString0085
     * @tc.desc     Verify toLocaleString throws error when called with empty locale and options on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0085';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, '', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0860
     * @tc.name     testToLocaleString0086
     * @tc.desc     Verify toLocaleString throws error when called with locale 'en-US' and empty options on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0086';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0870
     * @tc.name     testToLocaleString0087
     * @tc.desc     Verify toLocaleString throws error when called with empty locale and 'currency' option on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0087';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, '', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0880
     * @tc.name     testToLocaleString0088
     * @tc.desc     Verify toLocaleString throws error when called with locale 'en-US' and 'currency' option on byte array [1,2,3,4]
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0088';
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        toLocaleString(arr, 'en-US', 'currency');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_TO_LOCALE_STRING_0890
     * @tc.name     testToLocaleString0089
     * @tc.desc     Verify toLocaleString throws error when called with locale 'en-US' and empty options on empty byte array
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testToLocaleString0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testToLocaleString0089';
      try {
        let arr: FixedArray<byte> = [];
        toLocaleString(arr, 'en-US', '');
        expect().assertFail();
      } catch (err: Error) {
        console.error(`${TAG} is fail,err is ${err.message}`);
        expect(`${err.message}`).assertEqual('Array.toLocaleString: not implemented');
      }
    });

  })
}