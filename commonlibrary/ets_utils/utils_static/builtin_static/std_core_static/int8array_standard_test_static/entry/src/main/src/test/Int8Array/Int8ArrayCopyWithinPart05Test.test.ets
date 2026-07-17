'use static'


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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayCopyWithinPart05TestTest(): void {
  describe('Int8ArrayCopyWithinPart05TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0100
     * @tc.name int8ArrayCopyWithinPart05Test001
     * @tc.desc Verify 2 target, start end
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
     * @tc.desc Verify 3 target, start, end end length 2
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
     * @tc.desc Verify 2 0
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
     * @tc.desc Verify 3 end=0 no-op
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
     * @tc.desc Verify 3 end start no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 1);
      expect(arr[0]).assertEqual(11);
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0600
     * @tc.name int8ArrayCopyWithinPart05Test006
     * @tc.desc Verify 3 start end no-op
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
     * @tc.desc Verify 2
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
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.copyWithin(1, 0, 2);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_0900
     * @tc.name int8ArrayCopyWithinPart05Test009
     * @tc.desc Verify 2 (t, s) 3 (t, s, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(1, 3);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(1, 3, 5);
      expect(arr1[1]).assertEqual(arr2[1]);
      expect(arr1[2]).assertEqual(arr2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_1000
     * @tc.name int8ArrayCopyWithinPart05Test010
     * @tc.desc Verify 3 target=0 start=0 end=length
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
     * @tc.desc Verify target=0
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
     * @tc.desc Verify target=1
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
     * @tc.desc Verify target=length-2
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
     * @tc.desc Verify target=length-1 count 1
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
     * @tc.desc Verify target=-1 length-1
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
     * @tc.desc Verify target=-2 length-2
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
     * @tc.desc Verify target=-length 0
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
     * @tc.desc Verify target start
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
     * @tc.desc Verify target start
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
     * @tc.desc Verify target=length length count=0 no-op
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
     * @tc.desc Verify target=length+1 length no-op
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
     * @tc.desc Verify target=2147483647 int length no-op
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
     * @tc.desc Verify target=-length-1 0 0
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
     * @tc.desc Verify target=-2147483648 int 0
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
     * @tc.desc Verify target=length+10 length length no-op
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
     * @tc.desc Verify target=-length-10 0
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
     * @tc.desc Verify target count length-target
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
     * @tc.desc Verify start=length-1
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
     * @tc.desc Verify start=-1 length-1
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
     * @tc.desc Verify start=-2 length-2
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
     * @tc.desc Verify start=-length 0
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
     * @tc.desc Verify start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 1);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3300
     * @tc.name int8ArrayCopyWithinPart05Test033
     * @tc.desc Verify start=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 5, 5);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3400
     * @tc.name int8ArrayCopyWithinPart05Test034
     * @tc.desc Verify start=length+1 length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 6, 7);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3500
     * @tc.name int8ArrayCopyWithinPart05Test035
     * @tc.desc Verify start=2147483647 length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2147483647);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3600
     * @tc.name int8ArrayCopyWithinPart05Test036
     * @tc.desc Verify start=-length-1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, -6, 5);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3700
     * @tc.name int8ArrayCopyWithinPart05Test037
     * @tc.desc Verify start=-2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, -2147483648, 5);
      expect(arr[3]).assertEqual(11);
      expect(arr[4]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3800
     * @tc.name int8ArrayCopyWithinPart05Test038
     * @tc.desc Verify start=length+10 length length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 15);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_3900
     * @tc.name int8ArrayCopyWithinPart05Test039
     * @tc.desc Verify end=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4000
     * @tc.name int8ArrayCopyWithinPart05Test040
     * @tc.desc Verify end=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 0);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4100
     * @tc.name int8ArrayCopyWithinPart05Test041
     * @tc.desc Verify end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4200
     * @tc.name int8ArrayCopyWithinPart05Test042
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(3, 0, 1);
      expect(arr[3]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4300
     * @tc.name int8ArrayCopyWithinPart05Test043
     * @tc.desc Verify end=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, 4);
      expect(arr[0]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4400
     * @tc.name int8ArrayCopyWithinPart05Test044
     * @tc.desc Verify end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3, -1);
      expect(arr[0]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4500
     * @tc.name int8ArrayCopyWithinPart05Test045
     * @tc.desc Verify end=-2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -2);
      expect(arr[0]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4600
     * @tc.name int8ArrayCopyWithinPart05Test046
     * @tc.desc Verify end=-length 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -5);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4700
     * @tc.name int8ArrayCopyWithinPart05Test047
     * @tc.desc Verify end=start no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 2);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4800
     * @tc.name int8ArrayCopyWithinPart05Test048
     * @tc.desc Verify end=length+1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 6);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_4900
     * @tc.name int8ArrayCopyWithinPart05Test049
     * @tc.desc Verify end=2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 2147483647);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5000
     * @tc.name int8ArrayCopyWithinPart05Test050
     * @tc.desc Verify end=-length-1 0 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -6);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5100
     * @tc.name int8ArrayCopyWithinPart05Test051
     * @tc.desc Verify end=-2147483648 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -2147483648);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5200
     * @tc.name int8ArrayCopyWithinPart05Test052
     * @tc.desc Verify end=length+10 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, 15);
      expect(arr[0]).assertEqual(33);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5300
     * @tc.name int8ArrayCopyWithinPart05Test053
     * @tc.desc Verify target length+10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(15, 0, 2);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(5, 0, 2);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5400
     * @tc.name int8ArrayCopyWithinPart05Test054
     * @tc.desc Verify target -length-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-15, 3, 5);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(0, 3, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5500
     * @tc.name int8ArrayCopyWithinPart05Test055
     * @tc.desc Verify start length+10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 15);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(0, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5600
     * @tc.name int8ArrayCopyWithinPart05Test056
     * @tc.desc Verify start -length-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(3, -15, 5);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(3, 0, 5);
      expect(arr1[3]).assertEqual(arr2[3]);
      expect(arr1[4]).assertEqual(arr2[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5700
     * @tc.name int8ArrayCopyWithinPart05Test057
     * @tc.desc Verify end length+10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 2, 15);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(0, 2, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[2]).assertEqual(arr2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5800
     * @tc.name int8ArrayCopyWithinPart05Test058
     * @tc.desc Verify end 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2, -15);
      expect(arr[0]).assertEqual(11);
      expect(arr[4]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_5900
     * @tc.name int8ArrayCopyWithinPart05Test059
     * @tc.desc Verify -1 idx+length target=-1 target=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-1, 0, 1);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(4, 0, 1);
      expect(arr1[4]).assertEqual(arr2[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6000
     * @tc.name int8ArrayCopyWithinPart05Test060
     * @tc.desc Verify -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-5, 3, 5);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(0, 3, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6100
     * @tc.name int8ArrayCopyWithinPart05Test061
     * @tc.desc Verify -length-1 0 -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-6, 3, 5);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(-5, 3, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6200
     * @tc.name int8ArrayCopyWithinPart05Test062
     * @tc.desc Verify target=2147483647 length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44, 55]);
      arr.copyWithin(2147483647, 0, 2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6300
     * @tc.name int8ArrayCopyWithinPart05Test063
     * @tc.desc Verify count end-start length-target length-target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(5, 0, 8);
      expect(arr[5]).assertEqual(10);
      expect(arr[6]).assertEqual(20);
      expect(arr[7]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6400
     * @tc.name int8ArrayCopyWithinPart05Test064
     * @tc.desc Verify count end-start length-target end-start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6500
     * @tc.name int8ArrayCopyWithinPart05Test065
     * @tc.desc Verify count min(end-start, length-target)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.copyWithin(3, 0, 5);
      expect(arr[3]).assertEqual(10);
      expect(arr[7]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6600
     * @tc.name int8ArrayCopyWithinPart05Test066
     * @tc.desc Verify int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, INT8_MAX, 0, -1, 1]);
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(-128);
      expect(arr[4]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6700
     * @tc.name int8ArrayCopyWithinPart05Test067
     * @tc.desc Verify int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, -1, 0, -128, 1]);
      arr.copyWithin(3, 0, 1);
      expect(arr[3]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6800
     * @tc.name int8ArrayCopyWithinPart05Test068
     * @tc.desc Verify int8 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, -1, INT8_MAX, -128]);
      arr.copyWithin(3, 0, 1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_6900
     * @tc.name int8ArrayCopyWithinPart05Test069
     * @tc.desc Verify target -3 length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(-3, 0, 2);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(2, 0, 2);
      expect(arr1[2]).assertEqual(arr2[2]);
      expect(arr1[3]).assertEqual(arr2[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART05_TEST_7000
     * @tc.name int8ArrayCopyWithinPart05Test070
     * @tc.desc Verify end -1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([11, 22, 33, 44, 55]);
      arr1.copyWithin(0, 2, -1);
      let arr2 = new Int8Array([11, 22, 33, 44, 55]);
      arr2.copyWithin(0, 2, 4);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

  });
}
