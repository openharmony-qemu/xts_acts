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
export default function ArrayIncludesTest() {

  describe("ArrayIncludesTest", (): void => {
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

    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_046
     * @tc.name    test_array_includes_046
     * @tc.desc    Test includes method with empty short array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_046";
      try {
        let arr: FixedArray<short> = [] as FixedArray<short>;
        let result = includes(arr, 10 as short);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_047
     * @tc.name    test_array_includes_047
     * @tc.desc    Test includes method with short array containing minimum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_047";
      try {
        let minVal = -32768 as short;
        let arr: FixedArray<short> = [minVal, 0 as short, 100 as short] as FixedArray<short>;
        let result = includes(arr, minVal);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_048
     * @tc.name    test_array_includes_048
     * @tc.desc    Test includes method with short array containing maximum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_048";
      try {
        let maxVal = 32767 as short;
        let arr: FixedArray<short> = [maxVal, 0 as short, -100 as short] as FixedArray<short>;
        let result = includes(arr, maxVal);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_049
     * @tc.name    test_array_includes_049
     * @tc.desc    Test includes method with short array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_049";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 10 as short, 30 as short] as FixedArray<short>;
        let result = includes(arr, 10 as short);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_050
     * @tc.name    test_array_includes_050
     * @tc.desc    Test includes method with short array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_050";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 20 as short] as FixedArray<short>;
        let result = includes(arr, 20 as short, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_051
     * @tc.name    test_array_includes_051
     * @tc.desc    Test includes method with short array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_051";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short] as FixedArray<short>;
        let result = includes(arr, 30 as short, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_052
     * @tc.name    test_array_includes_052
     * @tc.desc    Test includes method with short array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_052";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short] as FixedArray<short>;
        let result = includes(arr, 20 as short, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_053
     * @tc.name    test_array_indexof_053
     * @tc.desc    Test indexOf method with boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_053";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_054
     * @tc.name    test_array_indexof_054
     * @tc.desc    Test indexOf method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_054";
      try {
        let arr: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_055
     * @tc.name    test_array_indexof_055
     * @tc.desc    Test indexOf method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_055";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_056
     * @tc.name    test_array_indexof_056
     * @tc.desc    Test indexOf method with boolean array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_056";
      try {
        let arr: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_057
     * @tc.name    test_array_indexof_057
     * @tc.desc    Test indexOf method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_057";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_058
     * @tc.name    test_array_indexof_058
     * @tc.desc    Test indexOf method with boolean array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_058";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_059
     * @tc.name    test_array_indexof_059
     * @tc.desc    Test indexOf method with boolean array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_059";
      try {
        let arr: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_060
     * @tc.name    test_array_indexof_060
     * @tc.desc    Test indexOf method with boolean array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_060";
      try {
        let arr: FixedArray<boolean> = [false, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_061
     * @tc.name    test_array_indexof_061
     * @tc.desc    Test indexOf method with boolean array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_061";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true, 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_062
     * @tc.name    test_array_indexof_062
     * @tc.desc    Test indexOf method with boolean array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_062";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_063
     * @tc.name    test_array_indexof_063
     * @tc.desc    Test indexOf method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_063";
      try {
        let arr: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_064
     * @tc.name    test_array_indexof_064
     * @tc.desc    Test indexOf method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_064";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_065
     * @tc.name    test_array_indexof_065
     * @tc.desc    Test indexOf method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_065";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_066
     * @tc.name    test_array_indexof_066
     * @tc.desc    Test indexOf method with boolean array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_066";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_067
     * @tc.name    test_array_includes_067
     * @tc.desc    Test includes method with boolean array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_067";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = includes(arr, true);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_068
     * @tc.name    test_array_includes_068
     * @tc.desc    Test includes method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_068";
      try {
        let arr: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        let result = includes(arr, false);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_069
     * @tc.name    test_array_includes_069
     * @tc.desc    Test includes method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_069";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = includes(arr, false, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_070
     * @tc.name    test_array_includes_070
     * @tc.desc    Test includes method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_070";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = includes(arr, true);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_071
     * @tc.name    test_array_indexof_071
     * @tc.desc    Test indexOf method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_071";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_072
     * @tc.name    test_array_indexof_072
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_072";
      try {
        let arr: FixedArray<byte> = [0x0A as byte, 0x0B as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0xFF as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_073
     * @tc.name    test_array_includes_073
     * @tc.desc    Test includes method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_073";
      try {
        let arr: FixedArray<byte> = [0x10 as byte, 0x20 as byte, 0x30 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x20 as byte);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_074
     * @tc.name    test_array_indexof_074
     * @tc.desc    Test indexOf method with char array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_074";
      try {
        let arr: FixedArray<char> = [97 as char, 98 as char, 99 as char] as FixedArray<char>;
        let result = indexOf(arr, 98 as char);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_075
     * @tc.name    test_array_indexof_075
     * @tc.desc    Test indexOf method with string array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_075";
      try {
        let arr: string[] = ['a', 'b', 'c'];
        let result = arr.indexOf('d');
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_076
     * @tc.name    test_array_includes_076
     * @tc.desc    Test includes method with string array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_076";
      try {
        let arr: string[] = ['a', 'b', 'c'];
        let result = arr.includes('b');
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_077
     * @tc.name    test_array_includes_077
     * @tc.desc    Test includes method with string array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_077";
      try {
        let arr: string[] = ['a', 'b', 'a', 'b'];
        let result = arr.includes('a', 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_078
     * @tc.name    test_array_includes_078
     * @tc.desc    Test includes method with byte array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_078";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x01 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x01 as byte, 1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_079
     * @tc.name    test_array_includes_079
     * @tc.desc    Test includes method with char array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_079";
      try {
        let arr: FixedArray<char> = [65 as char, 66 as char, 67 as char] as FixedArray<char>;
        let result = includes(arr, 68 as char);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_080
     * @tc.name    test_array_indexof_080
     * @tc.desc    Test indexOf method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_080";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        let result = indexOf(arr, 2.2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_081
     * @tc.name    test_array_includes_081
     * @tc.desc    Test includes method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_081";
      try {
        let arr: FixedArray<double> = [0.1, 0.2, 0.3] as FixedArray<double>;
        let result = includes(arr, 0.2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_082
     * @tc.name    test_array_indexof_082
     * @tc.desc    Test indexOf method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_082";
      try {
        let arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.5 as float);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_083
     * @tc.name    test_array_indexof_083
     * @tc.desc    Test indexOf method with float array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_083";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float] as FixedArray<float>;
        let result = indexOf(arr, 3.3 as float);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_084
     * @tc.name    test_array_includes_084
     * @tc.desc    Test includes method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_084";
      try {
        let arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let result = includes(arr, 2.5 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_085
     * @tc.name    test_array_includes_085
     * @tc.desc    Test includes method with double array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_085";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        let result = includes(arr, 4.4);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_086
     * @tc.name    test_array_includes_086
     * @tc.desc    Test includes method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_086";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 1.1 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float, 1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_087
     * @tc.name    test_array_includes_087
     * @tc.desc    Test includes method with double array containing Infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_087";
      try {
        let arr: FixedArray<double> = [1.1, Infinity, 3.3] as FixedArray<double>;
        let result = includes(arr, Infinity);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_088
     * @tc.name    test_array_indexof_088
     * @tc.desc    Test indexOf method with byte array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_088";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_089
     * @tc.name    test_array_indexof_089
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_089";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x05 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_090
     * @tc.name    test_array_indexof_090
     * @tc.desc    Test indexOf method with byte array and fromIndex parameter
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_090";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04, 0x03] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, 3);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_091
     * @tc.name    test_array_indexof_091
     * @tc.desc    Test indexOf method with byte array and fromIndex at array length
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_091";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, arr.length);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_092
     * @tc.name    test_array_indexof_092
     * @tc.desc    Test indexOf method with byte array and fromIndex at 0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_092";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_093
     * @tc.name    test_array_indexof_093
     * @tc.desc    Test indexOf method with empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_093";
      try {
        let arr: FixedArray<byte> = [] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_094
     * @tc.name    test_array_indexof_094
     * @tc.desc    Test indexOf method with byte array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_094";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x02, 0x03] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_095
     * @tc.name    test_array_indexof_095
     * @tc.desc    Test indexOf method with byte array and negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_095";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_096
     * @tc.name   test_array_indexof_096
     * @tc.desc   Test indexOf method with byte array and fromIndex larger than array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("test_array_indexof_096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_096";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, 10);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_097
     * @tc.name    test_array_indexof_097
     * @tc.desc    Test indexOf method with byte array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_097";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_098
     * @tc.name    test_array_indexof_098
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_098";
      try {
        let arr: FixedArray<byte> = [0x0A as byte, 0x0B as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0xFF as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_099
     * @tc.name    test_array_indexof_099
     * @tc.desc    Test indexOf method with byte array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_099";
      try {
        let arr: FixedArray<byte> = [0x10 as byte, 0x20 as byte, 0x10 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x10 as byte, 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_100
     * @tc.name    test_array_indexof_100
     * @tc.desc    Test indexOf method with empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_100";
      try {
        let arr: FixedArray<byte> = [] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_101
     * @tc.name    test_array_indexof_101
     * @tc.desc    Test indexOf method with byte array and negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_101";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte, -2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_102
     * @tc.name    test_array_indexof_102
     * @tc.desc    Test indexOf method with byte array and out of bounds fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_102";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte, 10);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_103
     * @tc.name    test_array_indexof_103
     * @tc.desc    Test indexOf method with byte array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_103";
      try {
        let arr: FixedArray<byte> = [0xFF as byte, 0xEE as byte, 0xDD as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0xFF as byte);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_104
     * @tc.name    test_array_indexof_104
     * @tc.desc    Test indexOf method with byte array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_104";
      try {
        let arr: FixedArray<byte> = [0x11 as byte, 0x22 as byte, 0x33 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x33 as byte);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_105
     * @tc.name    test_array_indexof_105
     * @tc.desc    Test indexOf method with byte array and very negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_105";
      try {
        let arr: FixedArray<byte> = [0x0A as byte, 0x0B as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x0A as byte, -10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_106
     * @tc.name    test_array_indexof_106
     * @tc.desc    Test indexOf method with char array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_106";
      try {
        let arr: FixedArray<char> = [97, 98, 99] as FixedArray<char>;
        let result = indexOf(arr, 98 as char);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_107
     * @tc.name    test_array_indexof_107
     * @tc.desc    Test indexOf method with char array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_107";
      try {
        let arr: FixedArray<char> = [120, 121, 122] as FixedArray<char>;
        let result = indexOf(arr, 97 as char);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_108
     * @tc.name    test_array_indexof_108
     * @tc.desc    Test indexOf method with empty char array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_108";
      try {
        let arr: FixedArray<char> = [] as FixedArray<char>;
        let result = indexOf(arr, 65 as char);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_109
     * @tc.name    test_array_indexof_109
     * @tc.desc    Test indexOf method with char array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_109";
      try {
        let arr: FixedArray<char> = [97, 98] as FixedArray<char>;
        let result = indexOf(arr, 97 as char, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_110
     * @tc.name    test_array_indexof_110
     * @tc.desc    Test indexOf method with char array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_110";
      try {
        let arr: FixedArray<char> = [90, 89, 88] as FixedArray<char>;
        let result = indexOf(arr, 90 as char);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_111
     * @tc.name    test_array_indexof_111
     * @tc.desc    Test indexOf method with char array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_111";
      try {
        let arr: FixedArray<char> = [120, 121, 122] as FixedArray<char>;
        let result = indexOf(arr, 122 as char);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_112
     * @tc.name    test_array_includes_112
     * @tc.desc    Test includes method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_112";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 2.2 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_113
     * @tc.name    test_array_includes_113
     * @tc.desc    Test includes method with float array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_113";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 4.4 as float);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_114
     * @tc.name    test_array_includes_114
     * @tc.desc    Test includes method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_114";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 3.0, 2.0] as FixedArray<float>;
        let result = includes(arr, 2.0 as float, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

  })
}