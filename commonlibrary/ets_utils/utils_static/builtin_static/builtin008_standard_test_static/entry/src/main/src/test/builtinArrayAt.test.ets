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

export default function BuiltinArrayAtTest() {
  describe("BuiltinArrayAtTest", (): void => {
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0001
     * @tc.name     testBuiltinArrayAt0001
     * @tc.desc     Test at() with a valid positive index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0001";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_200
     * @tc.name     testBuiltinArrayAt0002
     * @tc.desc     Test at() with a valid negative index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0002";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_01
     * @tc.name     testBuiltinArrayAt0003
     * @tc.desc     Test at() with an out-of-bound positive index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0003";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 3);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400
     * @tc.name     testBuiltinArrayAt0004
     * @tc.desc     Test at() with an out-of-bound negative index.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0004";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -4);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0500_01
     * @tc.name     testBuiltinArrayAt0005
     * @tc.desc     Test at() with an empty array.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0005";
      try {
        let arr: FixedArray<boolean> = [];
        let result = at(arr, 0);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0600_01
     * @tc.name     testBuiltinArrayAt0006
     * @tc.desc     Test at() with index 0 on a single-element array.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0006";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, 0);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0700_01
     * @tc.name     testBuiltinArrayAt0007
     * @tc.desc     Test at() with index -1 on a single-element array.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0007";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_080
     * @tc.name     testBuiltinArrayAt0008
     * @tc.desc     Test at() with index 1 on a single-element array (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0008";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, 1);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0900_01
     * @tc.name     testBuiltinArrayAt0009
     * @tc.desc     Test at() with index -2 on a single-element array (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0009";
      try {
        let arr: FixedArray<boolean> = [true];
        let result = at(arr, -2);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1000_1
     * @tc.name     testBuiltinArrayAt00010
     * @tc.desc     Test at() with index -0 (treated as 0).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00010";
      try {
        let arr: FixedArray<boolean> = [false, true];
        let result = at(arr, -0);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1100_01
     * @tc.name     testBuiltinArrayAt00011
     * @tc.desc     Test at() with a large positive index within bounds.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00011";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let result = at(arr, 4);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1200_01
     * @tc.name     testBuiltinArrayAt00012
     * @tc.desc     Test at() with a large negative index within bounds.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00012";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let result = at(arr, -3);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1300_01
     * @tc.name     testBuiltinArrayAt00013
     * @tc.desc     Test at() with index equals to length (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00013";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 3);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1400_01
     * @tc.name     testBuiltinArrayAt00014
     * @tc.desc     Test at() with index equals to negative length (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00014";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -3);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1500_01
     * @tc.name     testBuiltinArrayAt00015
     * @tc.desc     Test at() with index equals to negative length minus one (out-of-bound).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00015";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -4);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1600
     * @tc.name     testBuiltinArrayAt00016
     * @tc.desc     Test at() with index = Int32.MAX_VALUE on a small array (overflow scenario).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00016";
      try {
        let arr: FixedArray<boolean> = [true, false];
        let result = at(arr, 2147483647);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1700
     * @tc.name     testBuiltinArrayAt00017
     * @tc.desc     Test at() with index = Int32.MIN_VALUE on a small array (negative overflow).
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00017";
      try {
        let arr: FixedArray<boolean> = [true, false];
        let result = at(arr, -2147483648);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1800
     * @tc.name     testBuiltinArrayAt00018
     * @tc.desc     Test at() with non-integer index (float 1.9) to verify truncation behavior.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt00018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt00018";
      try {
        let arr: FixedArray<boolean> = [false, true, false];
        let result = at(arr, 1.9);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_01
     * @tc.name     testBuiltinArrayAt10001_01
     * @tc.desc     Test at() with positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10001_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10001_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_01
     * @tc.name     testBuiltinArrayAt10002_01
     * @tc.desc     Test at() with negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10002_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10002_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result = at(arr, -1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0300_01
     * @tc.name     testBuiltinArrayAt10003_01
     * @tc.desc     Test at() with out-of-range index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10003_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10003_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let result1 = at(arr, 3);
        let result2 = at(arr, -4);
        expect(result1).assertUndefined();
        expect(result2).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_400
     * @tc.name     testBuiltinArrayAt10004_01
     * @tc.desc     Test at() with boundary conditions
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10004_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10004_01";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let first = at(arr, 0);
        let last = at(arr, -1);
        expect(first).assertEqual(true);
        expect(last).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0500_01
     * @tc.name     testBuiltinArrayAt10005_01
     * @tc.desc     Test at() with empty array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10005_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt10005_01";
      try {
        let arr: FixedArray<boolean> = [];
        let result = at(arr, 0);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_1100
     * @tc.name     testBuiltinArrayAt10011
     * @tc.desc     Test at() with non-primitive value (Boolean object wrapper)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayAt10011';
      try {
        const arr: Boolean[] = [new Boolean(true), new Boolean(false)];
        expect(arr.at(0)?.valueOf()).assertTrue();
        expect(arr.at(-1)?.valueOf()).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0100
     * @tc.name     testBuiltinArrayAt20001
     * @tc.desc     Test basic functionality of at() with positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20001";
      try {
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        let result = at(arr, 2);
        expect(result).assertEqual(30);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0200
     * @tc.name     testBuiltinArrayAt20002
     * @tc.desc     Test at() with negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20002";
      try {
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        let result = at(arr, -1);
        expect(result).assertEqual(40);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0300
     * @tc.name     testBuiltinArrayAt20003
     * @tc.desc     Test at() with out-of-bounds index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20003";
      try {
        let arr: FixedArray<byte> = [10, 20, 30];
        expect(at(arr, 3)).assertUndefined();
        expect(at(arr, -4)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0400
     * @tc.name     testBuiltinArrayAt20004
     * @tc.desc     Test at() with edge case indices
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20004";
      try {
        let arr: FixedArray<byte> = [10, 20];
        expect(at(arr, 0)).assertEqual(10);
        expect(at(arr, -1)).assertEqual(20);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_0500
     * @tc.name     testBuiltinArrayAt20005
     * @tc.desc     Test at() with empty array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20005";
      try {
        let emptyArr: FixedArray<byte> = [];
        expect(at(emptyArr, 0)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1100
     * @tc.name     testBuiltinArrayAt20011
     * @tc.desc     Verify at() works with very large negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20011";
      try {
        let arr: FixedArray<byte> = [0, 1, 2];
        expect(at(arr, -999999)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1200
     * @tc.name     testBuiltinArrayAt20012
     * @tc.desc     Verify at() handles concurrent use across multiple arrays
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20012";
      try {
        let a1: FixedArray<byte> = [10, 20];
        let a2: FixedArray<byte> = [30, 40, 50];
        expect(at(a1, 1)).assertEqual(20);
        expect(at(a2, -1)).assertEqual(50);
        expect(at(a1, -2)).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1300
     * @tc.name     testBuiltinArrayAt20013
     * @tc.desc     Verify at() with positive index on single-element array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20013";
      try {
        let arr: FixedArray<byte> = [42];
        expect(at(arr, 0)).assertEqual(42);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1400
     * @tc.name     testBuiltinArrayAt20014
     * @tc.desc     Verify at() with negative index on single-element array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20014";
      try {
        let arr: FixedArray<byte> = [42];
        expect(at(arr, -1)).assertEqual(42);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1500
     * @tc.name     testBuiltinArrayAt20015
     * @tc.desc     Verify at() returns undefined on empty array with any index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20015";
      try {
        let emptyArr: FixedArray<byte> = [];
        expect(at(emptyArr, 0)).assertUndefined();
        expect(at(emptyArr, -1)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1600
     * @tc.name     testBuiltinArrayAt20016
     * @tc.desc     Verify at() with index one beyond the upper bound
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20016";
      try {
        let arr: FixedArray<byte> = [7, 8, 9];
        expect(at(arr, 3)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1700
     * @tc.name     testBuiltinArrayAt20017
     * @tc.desc     Verify at() with index one beyond the lower bound
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20017";
      try {
        let arr: FixedArray<byte> = [7, 8, 9];
        expect(at(arr, -4)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_AT_1800
     * @tc.name     testBuiltinArrayAt20018
     * @tc.desc     Verify at() works with very large positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt20018";
      try {
        let arr: FixedArray<byte> = [0, 1, 2];
        expect(at(arr, 999999)).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_01
     * @tc.name     testBuiltinArrayAt30001
     * @tc.desc     Test at() with valid positive index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30001";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        let result = at(arr, 1);
        expect(result).assertEqual(50);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_020
     * @tc.name     testBuiltinArrayAt30002
     * @tc.desc     Test at() with valid negative index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30002";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        let result = at(arr, -1);
        expect(result).assertEqual(100);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_02
     * @tc.name     testBuiltinArrayAt30003
     * @tc.desc     Test at() with out-of-bounds index
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30003";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        let result1 = at(arr, 3);
        let result2 = at(arr, -4);
        expect(result1).assertUndefined();
        expect(result2).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_01
     * @tc.name     testBuiltinArrayAt30004
     * @tc.desc     Test at() with edge cases (first and last elements)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testBuiltinArrayAt30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt30004";
      try {
        let arr: FixedArray<byte> = [10, 50, 100];
        expect(at(arr, 0)).assertEqual(10);
        expect(at(arr, -3)).assertEqual(10);
        expect(at(arr, 2)).assertEqual(100);
        expect(at(arr, -1)).assertEqual(100);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_800
   * @tc.name     testBuiltinArrayAt30008
   * @tc.desc     Test at() with +0 and -0 indices
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt30008";
    try {
      let arr: FixedArray<byte> = [10, 50, 100];
      expect(at(arr, +0)).assertEqual(10);
      expect(at(arr, -0)).assertEqual(10);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1100_02
   * @tc.name     testBuiltinArrayAt30011
   * @tc.desc     Test at() with single-element array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt30011";
    try {
      let arr: FixedArray<byte> = [42];
      expect(at(arr, 0)).assertEqual(42);
      expect(at(arr, -1)).assertEqual(42);
      expect(at(arr, 1)).assertUndefined();
      expect(at(arr, -2)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1300_02
   * @tc.name     testBuiltinArrayAt30013
   * @tc.desc     Test at() with concurrent-like read (read-only stability)
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt30013";
    try {
      let arr: FixedArray<byte> = [1, 2, 3, 4, 5];
      for (let i = 0; i < 10; i++) {
        expect(at(arr, -2)).assertEqual(4);
      }
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1400_02
   * @tc.name     testBuiltinArrayAt30014
   * @tc.desc     Test at() with index exceeding int32 range
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt30014";
    try {
      let arr: FixedArray<byte> = [1, 2];
      expect(at(arr, 0x8000000)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

   /**
    * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_1500_02
    * @tc.name     testBuiltinArrayAt30015
    * @tc.desc     Test at() with index being array length (boundary)
    * @tc.level    LEVEL1
    * @tc.size     MEDIUMTEST
    * @tc.type     FUNCTION
    */
  it('testBuiltinArrayAt30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt30015";
    try {
      let arr: FixedArray<byte> = [10, 20];
      expect(at(arr, arr.length)).assertUndefined();
      expect(at(arr, -arr.length - 1)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0500_03
   * @tc.name     testBuiltinArrayAt40005
   * @tc.desc     Test at() with empty array (should return undefined for any index)
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt40005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt40005";
    try {
      let arr: FixedArray<char> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_03
   * @tc.name     testBuiltinArrayAt50001
   * @tc.desc     Testing at() with positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt50001";
    try {
      let arr: FixedArray<number> = [1, 2, 3];
      let result = at(arr, 1);
      expect(result).assertEqual(2);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_02
   * @tc.name     testBuiltinArrayAt50002
   * @tc.desc     Testing at() with negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt50002";
    try {
      let arr: FixedArray<number> = [1, 2, 3];
      let result = at(arr, -1);
      expect(result).assertEqual(3);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_04
   * @tc.name     testBuiltinArrayAt50003
   * @tc.desc     Testing at() with out-of-bound index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt50003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt50003";
    try {
      let arr: FixedArray<number> = [1, 2, 3];
      let result = at(arr, 5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_03
   * @tc.name     testBuiltinArrayAt50004
   * @tc.desc     Test at() with edge case indices (first, last, negative indices, and out-of-bounds)
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt50004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt50004";
    try {
      let arr: FixedArray<number> = [1, 2, 3];
      let firstElement = at(arr, 0);
      let lastElement = at(arr, 2);
      let lastElementNeg = at(arr, -1);
      let firstElementNeg = at(arr, -3);
      let justOutOfBounds = at(arr, 3);
      let justOutOfBoundsNeg = at(arr, -4);
      expect(firstElement).assertEqual(1);
      expect(lastElement).assertEqual(3);
      expect(lastElementNeg).assertEqual(3);
      expect(firstElementNeg).assertEqual(1);
      expect(justOutOfBounds).assertUndefined();
      expect(justOutOfBoundsNeg).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_04
   * @tc.name     testBuiltinArrayAt50005
   * @tc.desc     Testing at() with empty array.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt50005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt50005";
    try {
      let arr: FixedArray<char> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_04
   * @tc.name     testBuiltinArrayAt60001
   * @tc.desc     Testing at() with valid positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt60001";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
      let result = at(arr, 2);
      expect(result).assertEqual(3.3);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_03
   * @tc.name     testBuiltinArrayAt60002
   * @tc.desc     Testing at() with valid negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt60002";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
      let result = at(arr, -1);
      expect(result).assertEqual(4.4);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_05
   * @tc.name     testBuiltinArrayAt60003
   * @tc.desc     Testing at() with out-of-bounds positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt60003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt60003";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
      let result = at(arr, 4);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_05
   * @tc.name     testBuiltinArrayAt60004
   * @tc.desc     Testing at() with out-of-bounds negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt60004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt60004";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
      let result = at(arr, -5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0500_04
   * @tc.name     testBuiltinArrayAt60005
   * @tc.desc     Testing at() with empty array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt60005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt60005";
    try {
      let arr: FixedArray<double> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0100
   * @tc.name     testBuiltinArrayAt70001
   * @tc.desc     Testing at() with positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt70001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt70001";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3];
      let result = at(arr, 1);
      expect(result).assertEqual(2.2);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0200
   * @tc.name     testBuiltinArrayAt70002
   * @tc.desc     Testing at() with negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt70002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt70002";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3];
      let result = at(arr, -1);
      expect(result).assertEqual(3.3);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0300
   * @tc.name     testBuiltinArrayAt70003
   * @tc.desc     Testing at() with out-of-bound index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt70003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt70003";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3];
      let result = at(arr, 5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0400
   * @tc.name     testBuiltinArrayAt70004
   * @tc.desc     Testing at() with empty array.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt70004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt70004";
    try {
      let arr: FixedArray<double> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_FIXEDARRAY_AT_0500
   * @tc.name     testBuiltinArrayAt70005
   * @tc.desc     Testing at() with boundary conditions (first/last element, length boundaries).
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt70005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt70005";
    try {
      let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
      let length = arr.length;
      expect(at(arr, 0)).assertEqual(1.1);
      expect(at(arr, length - 1)).assertEqual(5.5);
      expect(at(arr, length)).assertUndefined();
      expect(at(arr, -length)).assertEqual(1.1);
      expect(at(arr, -length - 1)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_02
   * @tc.name     testBuiltinArrayAt80001
   * @tc.desc     Test at() with positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt80001";
    try {
      let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = at(arr, 4);
      expect(result).assertEqual(5.5);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_02
   * @tc.name     testBuiltinArrayAt80002
   * @tc.desc     Test at() with negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt80002";
    try {
      let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
      let result = at(arr, -1);
      expect(result).assertEqual(5.5);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0300_02
   * @tc.name     testBuiltinArrayAt80003
   * @tc.desc     Test at() with out-of-bound positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt80003";
    try {
      let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result = at(arr, 5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0400_01
   * @tc.name     testBuiltinArrayAt80004
   * @tc.desc     Test at() with out-of-bound negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt80004";
    try {
      let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f];
      let result = at(arr, -5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0600_02
   * @tc.name     testBuiltinArrayAt80005
   * @tc.desc     Test at() with empty array (should always return undefined)
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt80005";
    try {
      let emptyArr: FixedArray<float> = [];
      expect(at(emptyArr, 0)).assertUndefined();
      expect(at(emptyArr, -1)).assertUndefined();
      expect(at(emptyArr, 1)).assertUndefined();
      expect(at(emptyArr, -2)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_03
   * @tc.name     testBuiltinArrayAt90001
   * @tc.desc     Test at() with positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt90001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt90001";
    try {
      let arr: FixedArray<float> = [5.1f, 5.2f, 5.0f, 5.4f, 5.5f];
      let result = at(arr, 2);
      expect(result).assertEqual(5.0f);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_03
   * @tc.name     testBuiltinArrayAt90002
   * @tc.desc     Test at() with negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt90002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt90002";
    try {
      let arr: FixedArray<float> = [5.1f, 5.2f, 5.3f, 5.4f, 5.5f];
      let result = at(arr, -1);
      expect(result).assertEqual(5.5f);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0300_03
   * @tc.name     testBuiltinArrayAt90003
   * @tc.desc     Test at() with out-of-range index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt90003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt90003";
    try {
      let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f];
      let result1 = at(arr, 4);
      expect(result1).assertUndefined();
      let result2 = at(arr, -5);
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0400_02
   * @tc.name     testBuiltinArrayAt90004
   * @tc.desc     Test at() with boundary index values
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt90004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt90004";
    try {
      let arr: FixedArray<float> = [5.0f, 5.2f, 5.3f, 5.4f, 5.5f];
      let result1 = at(arr, 0);
      expect(result1).assertEqual(5.0f);
      let result2 = at(arr, -1);
      expect(result2).assertEqual(5.5f);
      let result3 = at(arr, arr.length);
      expect(result3).assertUndefined();
      let result4 = at(arr, -(arr.length + 1));
      expect(result4).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0500_02
   * @tc.name     testBuiltinArrayAt90005
   * @tc.desc     Test at() with empty array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt90005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt90005";
    try {
      let arr: FixedArray<float> = [];
      let result1 = at(arr, 0);
      expect(result1).assertUndefined();
      let result2 = at(arr, -1);
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_04
   * @tc.name     testBuiltinArrayAt10001
   * @tc.desc     Test at() with valid positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10001";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, 1);
      expect(result).assertEqual(20);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_04
   * @tc.name     testBuiltinArrayAt10002
   * @tc.desc     Test at() with valid negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10002";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, -1);
      expect(result).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0300_04
   * @tc.name     testBuiltinArrayAt10003_02
   * @tc.desc     Test at() with out-of-range positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10003_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10003_02";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, 4);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0400_03
   * @tc.name     testBuiltinArrayAt10004
   * @tc.desc     Test at() with out-of-range negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10004";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, -5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0500
   * @tc.name     testBuiltinArrayAt10005
   * @tc.desc     Test at() with zero index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10005";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, 0);
      expect(result).assertEqual(10);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0600_03
   * @tc.name     testBuiltinArrayAt10006
   * @tc.desc     Test at() with empty array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt10006";
    try {
      let arr: FixedArray<int> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_05
   * @tc.name     testBuiltinArrayAt110001
   * @tc.desc     Test `at()` with a valid positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt110001";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, 1);
      expect(result).assertEqual(20);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail, err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_04
   * @tc.name     testBuiltinArrayAt110002
   * @tc.desc     Test `at()` with a valid negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt110002";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, -1);
      expect(result).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail, err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_06
   * @tc.name     testBuiltinArrayAt110003
   * @tc.desc     Test `at()` with an out-of-bounds positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt110003";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, 4);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail, err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_06
   * @tc.name     testBuiltinArrayAt110004
   * @tc.desc     Test `at()` with an out-of-bounds negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt110004";
    try {
      let arr: FixedArray<int> = [10, 20, 30, 40];
      let result = at(arr, -5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail, err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0500_05
   * @tc.name     testBuiltinArrayAt110005
   * @tc.desc     Test `at()` with an empty array.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt110005";
    try {
      let arr: FixedArray<int> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail, err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0100
   * @tc.name     testBuiltinArrayAt120001
   * @tc.desc     Testing at() with positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt120001";
    try {
      let arr: FixedArray<long> = [10, 20, 30, 40];
      let result = at(arr, 1);
      expect(result).assertEqual(20);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0200
   * @tc.name     testBuiltinArrayAt120002
   * @tc.desc     Testing at() with negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt120002";
    try {
      let arr: FixedArray<long> = [10, 20, 30, 40];
      let result = at(arr, -1);
      expect(result).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0300
   * @tc.name     testBuiltinArrayAt120003
   * @tc.desc     Testing at() with positive out-of-bound index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt120003";
    try {
      let arr: FixedArray<long> = [10, 20, 30, 40];
      let result = at(arr, 4);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0400_01
   * @tc.name     testBuiltinArrayAt120004
   * @tc.desc     Testing at() with negative out-of-bound index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt120004";
    try {
      let arr: FixedArray<long> = [10, 20, 30, 40];
      let result = at(arr, -5);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_ARRAY_AT_0400
   * @tc.name     testBuiltinArrayAt120005
   * @tc.desc     Testing at() with empty array.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt120005";
    try {
      let arr: FixedArray<long> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0100_05
   * @tc.name     testBuiltinArrayAt130001
   * @tc.desc     Test at() with positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt130001";
    try {
      let arr: FixedArray<long> = [100, 200, 300];
      let result = at(arr, 1);
      expect(result).assertEqual(200);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0200_05
   * @tc.name     testBuiltinArrayAt130002
   * @tc.desc     Test at() with negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt130002";
    try {
      let arr: FixedArray<long> = [100, 200, 300];
      let result = at(arr, -1);
      expect(result).assertEqual(300);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0300_05
   * @tc.name     testBuiltinArrayAt130003
   * @tc.desc     Test at() with positive out-of-bounds index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt130003";
    try {
      let arr: FixedArray<long> = [100, 200, 300];
      expect(at(arr, 3)).assertUndefined();
      expect(at(arr, 100)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0400_04
   * @tc.name     testBuiltinArrayAt130004
   * @tc.desc     Test at() with negative out-of-bounds index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt130004";
    try {
      let arr: FixedArray<long> = [100, 200, 300];
      expect(at(arr, -4)).assertUndefined();
      expect(at(arr, -100)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_ARRAY_AT_0400_05
   * @tc.name     testBuiltinArrayAt130005
   * @tc.desc     Test at() with empty array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt130005";
    try {
      let arr: FixedArray<long> = [];
      expect(at(arr, 0)).assertUndefined();
      expect(at(arr, -1)).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_06
   * @tc.name     testBuiltinArrayAt140001
   * @tc.desc     Testing at() with positive index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt140001";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40];
      let result = at(arr, 1);
      expect(result).assertEqual(20);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200_05
   * @tc.name     testBuiltinArrayAt140002
   * @tc.desc     Testing at() with negative index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt140002";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40];
      let result = at(arr, -1);
      expect(result).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0300_07
   * @tc.name     testBuiltinArrayAt140003
   * @tc.desc     Testing at() with out-of-range index.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt140003";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40];
      let result1 = at(arr, 4);
      let result2 = at(arr, -5);
      expect(result1).assertUndefined();
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_07
   * @tc.name     testBuiltinArrayAt140004
   * @tc.desc     Testing at() with boundary index values.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt140004";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40];
      let first = at(arr, 0);
      let last = at(arr, -1);
      let justBeforeFirst = at(arr, -4);
      let justAfterLast = at(arr, 3);
      expect(first).assertEqual(10);
      expect(last).assertEqual(40);
      expect(justBeforeFirst).assertEqual(10);
      expect(justAfterLast).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0500_06
   * @tc.name     testBuiltinArrayAt140005
   * @tc.desc     Testing at() with empty array.
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt140005";
    try {
      let arr: FixedArray<short> = [];
      let result1 = at(arr, 0);
      let result2 = at(arr, -1);
      expect(result1).assertUndefined();
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0100_07
   * @tc.name     testBuiltinArrayAt150001
   * @tc.desc     Testing at() with valid positive index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt150001";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = at(arr, 2);
      expect(result).assertEqual(30);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0200
   * @tc.name     testBuiltinArrayAt150002
   * @tc.desc     Testing at() with valid negative index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt150002";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40, 50];
      let result = at(arr, -2);
      expect(result).assertEqual(40);
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0301
   * @tc.name     testBuiltinArrayAt150003
   * @tc.desc     Testing at() with positive out-of-range index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt150003";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40, 50];
      let result1 = at(arr, 5);
      expect(result1).assertUndefined();
      let result2 = at(arr, 10);
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0302
   * @tc.name     testBuiltinArrayAt150004
   * @tc.desc     Testing at() with negative out-of-range index
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt150004";
    try {
      let arr: FixedArray<short> = [10, 20, 30, 40, 50];
      let result1 = at(arr, -6);
      expect(result1).assertUndefined();
      let result2 = at(arr, -10);
      expect(result2).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });

  /**
   * @tc.number   SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0400_08
   * @tc.name     testBuiltinArrayAt150005
   * @tc.desc     Testing at() with empty array
   * @tc.level    LEVEL1
   * @tc.size     MEDIUMTEST
   * @tc.type     FUNCTION
   */
  it('testBuiltinArrayAt150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    let TAG = "testBuiltinArrayAt150005";
    try {
      let arr: FixedArray<short> = [];
      let result = at(arr, 0);
      expect(result).assertUndefined();
    } catch (err: BusinessError) {
      console.error(`${TAG} is fail,err is ${err}`);
      expect().assertFail();
    }
  });
  
      /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0100_-2
     * @tc.name    testBuiltinArrayconcat0001
     * @tc.desc    Testing basic concatenation of two boolean arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
     it('testBuiltinArrayconcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
       let TAG = "testBuiltinArrayconcat0001";
       try {
         let arr1: FixedArray<boolean> = [true, false];
         let arr2: FixedArray<boolean> = [false, true];
         let result = concat(arr1, arr2);
         expect(result.length).assertEqual(4);
         expect(result[0]).assertEqual(true);
         expect(result[1]).assertEqual(false);
         expect(result[2]).assertEqual(false);
         expect(result[3]).assertEqual(true);
       } catch (err: BusinessError) {
         console.error(`${TAG} is fail,err is ${err}`);
         expect().assertFail();
       }
     });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_13800
     * @tc.name   testBuiltinArrayAt0138
     * @tc.desc   Test at() with index equal to array length (should return undefined)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0138";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let result = at(arr, arr.length);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_13900
     * @tc.name   testBuiltinArrayAt0139
     * @tc.desc   Testing at() with empty array.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0139";
      try {
        let arr: FixedArray<number> = [];
        let result = at(arr, 0);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14500
     * @tc.name   testBuiltinArrayAt0145
     * @tc.desc   Testing at() with single-element array.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0145";
      try {
        let arr: FixedArray<number> = [5];
        let result = at(arr, 0);
        expect(Number(result)).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14600
     * @tc.name   testBuiltinArrayAt0146
     * @tc.desc   Testing at() with index 0 on single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0146";
      try {
        let arr: FixedArray<double> = [9.9];
        let result = at(arr, 0);
        expect(result).assertEqual(9.9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_14700
     * @tc.name   testBuiltinArrayAt0147
     * @tc.desc   Testing at() with index -1 on single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0147";
      try {
        let arr: FixedArray<double> = [9.9];
        let result = at(arr, -1);
        expect(result).assertEqual(9.9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_15300
     * @tc.name   testBuiltinArrayAt0153
     * @tc.desc   Testing at() with index -0 (should behave like 0)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0153";
      try {
        let arr: FixedArray<double> = [42.0, 43.0];
        let result = at(arr, -0);
        expect(result).assertEqual(42.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_15400
     * @tc.name   testBuiltinArrayAt0154
     * @tc.desc   Testing at() with index just below 32-bit signed int max
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0154";
      try {
        let arr: FixedArray<double> = [1.0, 2.0];
        let result = at(arr, 2147483646);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_15500
     * @tc.name   testBuiltinArrayAt0155
     * @tc.desc   Testing at() with index just above 32-bit signed int min
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt0155";
      try {
        let arr: FixedArray<double> = [1.0, 2.0];
        let result = at(arr, -2147483648);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}