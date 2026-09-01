'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayCopyWithinPart05Test(): void {
  describe('Int8ArrayCopyWithinPart05Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0100
     * @tc.name int8ArrayCopyWithinPart05Test001
     * @tc.desc Verify copyWithin(0, 3) copies [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0200
     * @tc.name int8ArrayCopyWithinPart05Test002
     * @tc.desc Verify copyWithin(0, 3, 5) copies [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0300
     * @tc.name int8ArrayCopyWithinPart05Test003
     * @tc.desc Verify copyWithin target=0 start=0 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([77]);
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0400
     * @tc.name int8ArrayCopyWithinPart05Test004
     * @tc.desc Verify copyWithin(0, 1, 0) is a no-op since start(1) > end(0), keeps arr[0] 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 1, 0);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0500
     * @tc.name int8ArrayCopyWithinPart05Test005
     * @tc.desc Verify copyWithin(0, 3, 1) with start>end is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 1);
      expect(arr[0]).assertEqual(11);
      expect(arr[2]).assertEqual(33);
      let r1: number = arr[4];
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0600
     * @tc.name int8ArrayCopyWithinPart05Test006
     * @tc.desc Verify copyWithin(0, 2, 2) with start=end is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 2);
      expect(arr[0]).assertEqual(11);
      expect(arr[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0700
     * @tc.name int8ArrayCopyWithinPart05Test007
     * @tc.desc Verify copyWithin(0, 3) on [11,22,33,44,55] returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      let result = arr.copyWithin(0, 3);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0800
     * @tc.name int8ArrayCopyWithinPart05Test008
     * @tc.desc Verify copyWithin target=1 start=0 end=2 copies [10,20] to result[1,2] and returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.copyWithin(1, 0, 2);
      expect(result).assertEqual(arr);
      let r1: number = arr[1];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr[2];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0900
     * @tc.name int8ArrayCopyWithinPart05Test009
     * @tc.desc Verify copyWithin target=1 start=3 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(1, 3);
      let r1: number = arr1[1];
      let e1: int = 44;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1000
     * @tc.name int8ArrayCopyWithinPart05Test010
     * @tc.desc Verify copyWithin(0, 0, 5) copies whole array onto itself keeping [11,55] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 0, 5);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1100
     * @tc.name int8ArrayCopyWithinPart05Test011
     * @tc.desc Verify copyWithin(0, 2, 4) copies [33,44] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(33);
      expect(arr[1]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1200
     * @tc.name int8ArrayCopyWithinPart05Test012
     * @tc.desc Verify copyWithin(1, 3, 5) copies [44,55] to result[1,2] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(1, 3, 5);
      expect(arr[1]).assertEqual(44);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1300
     * @tc.name int8ArrayCopyWithinPart05Test013
     * @tc.desc Verify copyWithin(3, 0, 2) copies [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1400
     * @tc.name int8ArrayCopyWithinPart05Test014
     * @tc.desc Verify copyWithin(4, 0, 2) copies 11 to result[4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(4, 0, 2);
      expect(arr[4]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1500
     * @tc.name int8ArrayCopyWithinPart05Test015
     * @tc.desc Verify copyWithin(-1, 0, 2) via negative target copies 11 to result[4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-1, 0, 2);
      expect(arr[4]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1600
     * @tc.name int8ArrayCopyWithinPart05Test016
     * @tc.desc Verify copyWithin(-2, 0, 2) via negative target copies [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-2, 0, 2);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1700
     * @tc.name int8ArrayCopyWithinPart05Test017
     * @tc.desc Verify copyWithin(-5, 3, 5) clamps target to 0 copying [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-5, 3, 5);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1800
     * @tc.name int8ArrayCopyWithinPart05Test018
     * @tc.desc Verify copyWithin(2, 0, 4) copies [11,22,33] to result[2,3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(2, 0, 4);
      expect(arr[2]).assertEqual(11);
      expect(arr[3]).assertEqual(22);
      expect(arr[4]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1900
     * @tc.name int8ArrayCopyWithinPart05Test019
     * @tc.desc Verify copyWithin(2, 2, 4) copies [33,44] to result[2,3] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(2, 2, 4);
      expect(arr[2]).assertEqual(33);
      expect(arr[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2000
     * @tc.name int8ArrayCopyWithinPart05Test020
     * @tc.desc Verify copyWithin(5, 0, 2) with target at length is a no-op keeping [11,22] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(5, 0, 2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2100
     * @tc.name int8ArrayCopyWithinPart05Test021
     * @tc.desc Verify copyWithin(6, 0, 2) clamps target beyond length as no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(6, 0, 2);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2200
     * @tc.name int8ArrayCopyWithinPart05Test022
     * @tc.desc Verify copyWithin(2147483647, 0, 2) clamps huge target to length as no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(2147483647, 0, 2);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2300
     * @tc.name int8ArrayCopyWithinPart05Test023
     * @tc.desc Verify copyWithin(-6, 3, 5) clamps negative target to 0 copying [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-6, 3, 5);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2400
     * @tc.name int8ArrayCopyWithinPart05Test024
     * @tc.desc Verify copyWithin(-2147483648, 3, 5) clamps INT_MIN target to 0 copying [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-2147483648, 3, 5);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2500
     * @tc.name int8ArrayCopyWithinPart05Test025
     * @tc.desc Verify copyWithin(15, 0, 2) clamps huge target to length as no-op keeping [11,55] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(15, 0, 2);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2600
     * @tc.name int8ArrayCopyWithinPart05Test026
     * @tc.desc Verify copyWithin(-15, 3, 5) clamps negative target to 0 copying [44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(-15, 3, 5);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2700
     * @tc.name int8ArrayCopyWithinPart05Test027
     * @tc.desc Verify copyWithin(3, 0, 4) copies [11,22] to result[3,4] keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, 0, 4);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2800
     * @tc.name int8ArrayCopyWithinPart05Test028
     * @tc.desc Verify copyWithin(0, 4, 5) copies 55 to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 4, 5);
      expect(arr[0]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_2900
     * @tc.name int8ArrayCopyWithinPart05Test029
     * @tc.desc Verify copyWithin target=0 start=-1 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, -1);
      expect(arr[0]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3000
     * @tc.name int8ArrayCopyWithinPart05Test030
     * @tc.desc Verify copyWithin target=0 start=-2 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, -2);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3100
     * @tc.name int8ArrayCopyWithinPart05Test031
     * @tc.desc Verify copyWithin(3, -5, 5) clamps start to 0 copying [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, -5, 5);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3200
     * @tc.name int8ArrayCopyWithinPart05Test032
     * @tc.desc Verify copyWithin(0, 5, 5) with start=end=length is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 5, 5);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3300
     * @tc.name int8ArrayCopyWithinPart05Test033
     * @tc.desc Verify copyWithin(0, 6, 7) with out-of-range start is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 6, 7);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3400
     * @tc.name int8ArrayCopyWithinPart05Test034
     * @tc.desc Verify copyWithin target=0 start=2147483647 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2147483647);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3500
     * @tc.name int8ArrayCopyWithinPart05Test035
     * @tc.desc Verify copyWithin(3, -6, 5) clamps start to 0 copying [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, -6, 5);
      let r1: number = arr[3];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr[4];
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3600
     * @tc.name int8ArrayCopyWithinPart05Test036
     * @tc.desc Verify copyWithin(3, -2147483648, 5) clamps INT_MIN start to 0 copying [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, -2147483648, 5);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3700
     * @tc.name int8ArrayCopyWithinPart05Test037
     * @tc.desc Verify copyWithin(0, 15) clamps start to length as no-op keeping [11,55] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 15);
      let r1: number = arr[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr[4];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3800
     * @tc.name int8ArrayCopyWithinPart05Test038
     * @tc.desc Verify copyWithin target=0 start=2 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2);
      let r1: number = arr[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3900
     * @tc.name int8ArrayCopyWithinPart05Test039
     * @tc.desc Verify copyWithin(0, 2, 0) with start>end is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 0);
      let r1: number = arr[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4000
     * @tc.name int8ArrayCopyWithinPart05Test040
     * @tc.desc Verify copyWithin(0, 2, 5) copies [33,44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 5);
      let r1: number = arr[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4100
     * @tc.name int8ArrayCopyWithinPart05Test041
     * @tc.desc Verify copyWithin(3, 0, 1) copies 11 to result[3] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, 0, 1);
      let r1: number = arr[3];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4200
     * @tc.name int8ArrayCopyWithinPart05Test042
     * @tc.desc Verify copyWithin(0, 3, 4) copies 44 to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 4);
      let r1: number = arr[0];
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4300
     * @tc.name int8ArrayCopyWithinPart05Test043
     * @tc.desc Verify copyWithin(0, 3, -1) clamps end to 4 copying 44 to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, -1);
      expect(arr[0]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4400
     * @tc.name int8ArrayCopyWithinPart05Test044
     * @tc.desc Verify copyWithin(0, 2, -2) clamps end to 3 copying 33 to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -2);
      let r1: number = arr[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4500
     * @tc.name int8ArrayCopyWithinPart05Test045
     * @tc.desc Verify copyWithin(0, 2, -5) with end clamped to 0 is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -5);
      let r1: number = arr[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4600
     * @tc.name int8ArrayCopyWithinPart05Test046
     * @tc.desc Verify copyWithin(0, 2, 2) no-op keeps arr[0] 11, on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 2);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4700
     * @tc.name int8ArrayCopyWithinPart05Test047
     * @tc.desc Verify copyWithin(0, 2, 6) clamps end to length copying [33,44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 6);
      let r1: number = arr[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4800
     * @tc.name int8ArrayCopyWithinPart05Test048
     * @tc.desc Verify copyWithin(0, 2, 2147483647) clamps huge end to length copying [33,44,55] to head on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 2147483647);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4900
     * @tc.name int8ArrayCopyWithinPart05Test049
     * @tc.desc Verify copyWithin(0, 2, -6) with end clamped to 0 is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -6);
      let r1: number = arr[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5000
     * @tc.name int8ArrayCopyWithinPart05Test050
     * @tc.desc Verify copyWithin(0, 2, -2147483648) with INT_MIN end clamped to 0 is a no-op keeping arr[0] 11 on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -2147483648);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5100
     * @tc.name int8ArrayCopyWithinPart05Test051
     * @tc.desc Verify copyWithin(0, 2, 15) copies 33 to arr[0], on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 15);
      let r1: number = arr[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5200
     * @tc.name int8ArrayCopyWithinPart05Test052
     * @tc.desc Verify copyWithin(15, 0, 2) clamps target to length and is a no-op keeping [11,22,33,44,55]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(15, 0, 2);
      let r1: number = arr1[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[1];
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5300
     * @tc.name int8ArrayCopyWithinPart05Test053
     * @tc.desc Verify copyWithin(-15, 3, 5) clamps target to 0 copying [44,55] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-15, 3, 5);
      let r1: number = arr1[0];
      let e1: int = 44;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[1];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5400
     * @tc.name int8ArrayCopyWithinPart05Test054
     * @tc.desc Verify copyWithin(0, 15) clamps start to length and is a no-op keeping [11,22,33,44,55]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 15);
      let r1: number = arr1[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5500
     * @tc.name int8ArrayCopyWithinPart05Test055
     * @tc.desc Verify copyWithin(3, -15, 5) clamps start to 0 copying [11,22] to result[3,4] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(3, -15, 5);
      let r1: number = arr1[3];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[4];
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5600
     * @tc.name int8ArrayCopyWithinPart05Test056
     * @tc.desc Verify copyWithin(0, 2, 15) clamps end to length copying [33,44,55] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 2, 15);
      let r1: number = arr1[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[2];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5700
     * @tc.name int8ArrayCopyWithinPart05Test057
     * @tc.desc Verify copyWithin(0, 2, -15) with end clamped to 0 is a no-op keeping [11,55] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -15);
      let r1: number = arr[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr[4];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5800
     * @tc.name int8ArrayCopyWithinPart05Test058
     * @tc.desc Verify copyWithin(-1, 0, 1) copies 11 to result[4] via negative target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-1, 0, 1);
      let r1: number = arr1[4];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5900
     * @tc.name int8ArrayCopyWithinPart05Test059
     * @tc.desc Verify copyWithin(-5, 3, 5) clamps target to 0 copying [44,55] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-5, 3, 5);
      let r1: number = arr1[0];
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6000
     * @tc.name int8ArrayCopyWithinPart05Test060
     * @tc.desc Verify copyWithin(-6, 3, 5) clamps target to 0 copying [44,55] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-6, 3, 5);
      let r1: number = arr1[0];
      let e1: int = 44;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[1];
      let e2: int = 55;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6100
     * @tc.name int8ArrayCopyWithinPart05Test061
     * @tc.desc Verify copyWithin(2147483647, 0, 2) clamps huge target as no-op keeping [11,22] on new Int8Array([11, 22, 33, 44, 55])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(2147483647, 0, 2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6200
     * @tc.name int8ArrayCopyWithinPart05Test062
     * @tc.desc Verify copyWithin(5, 0, 8) copies [10,20,30] to result[5,6,7] on new Int8Array([10, 20, 30, 40, 50, 60, 70, 80])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(5, 0, 8);
      expect(arr[5]).assertEqual(10);
      expect(arr[6]).assertEqual(20);
      expect(arr[7]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6300
     * @tc.name int8ArrayCopyWithinPart05Test063
     * @tc.desc Verify copyWithin(0, 3, 5) copies 40,50 to head of [10,20,30,40,50,60,70,80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6400
     * @tc.name int8ArrayCopyWithinPart05Test064
     * @tc.desc Verify copyWithin(3, 0, 5) copies [10,20,30,40,50] to result[3..7] on new Int8Array([10, 20, 30, 40, 50, 60, 70, 80])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(3, 0, 5);
      expect(arr[3]).assertEqual(10);
      expect(arr[7]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6500
     * @tc.name int8ArrayCopyWithinPart05Test065
     * @tc.desc Verify copyWithin(3, 0, 2) on [-128, INT8_MAX, 0, -1, 1] copies -128, INT8_MAX to result[3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, INT8_MAX, 0, -1, 1]);
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(-128);
      expect(arr[4]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6600
     * @tc.name int8ArrayCopyWithinPart05Test066
     * @tc.desc Verify copyWithin(3, 0, 1) on [INT8_MAX, -1, 0, -128, 1] copies INT8_MAX to result[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, -1, 0, -128, 1]);
      arr.copyWithin(3, 0, 1);
      expect(arr[3]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6700
     * @tc.name int8ArrayCopyWithinPart05Test067
     * @tc.desc Verify copyWithin(3, 0, 1) on [0, 1, -1, INT8_MAX, -128] copies 0 to result[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, -1, INT8_MAX, -128]);
      arr.copyWithin(3, 0, 1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6800
     * @tc.name int8ArrayCopyWithinPart05Test068
     * @tc.desc Verify copyWithin(-3, 0, 2) clamps target to 2 copying [11,22] to result[2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-3, 0, 2);
      let r1: number = arr1[2];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[3];
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6900
     * @tc.name int8ArrayCopyWithinPart05Test069
     * @tc.desc Verify copyWithin(0, 2, -1) clamps end to 4 copying [33,44] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 2, -1);
      let r1: number = arr1[0];
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = arr1[1];
      let e2: int = 44;
      expect(r2).assertEqual(e2);
    });
  });
}
