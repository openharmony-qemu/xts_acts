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

export default function int8ArrayCopyWithinPart03TestTest(): void {
  describe('Int8ArrayCopyWithinPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0100
     * @tc.name int8ArrayCopyWithinPart03Test001
     * @tc.desc Verify 2 copyWithin(target, start) end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0200
     * @tc.name int8ArrayCopyWithinPart03Test002
     * @tc.desc Verify 3 copyWithin(target, start, end) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0300
     * @tc.name int8ArrayCopyWithinPart03Test003
     * @tc.desc Verify target=-1 length-1=4 start=0 end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, 0, 3);
      expect(arr.$_get(4)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0400
     * @tc.name int8ArrayCopyWithinPart03Test004
     * @tc.desc Verify target=-length(=-5) 0 start=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-5, 3, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0500
     * @tc.name int8ArrayCopyWithinPart03Test005
     * @tc.desc Verify target=-length-1(=-6) -1 0 target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-6, 3, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0600
     * @tc.name int8ArrayCopyWithinPart03Test006
     * @tc.desc Verify target=length(=5) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(5, 0, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0700
     * @tc.name int8ArrayCopyWithinPart03Test007
     * @tc.desc Verify target=length+1(=6) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(6, 0, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0800
     * @tc.name int8ArrayCopyWithinPart03Test008
     * @tc.desc Verify target=2147483647(int ) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2147483647, 0, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_0900
     * @tc.name int8ArrayCopyWithinPart03Test009
     * @tc.desc Verify target=-2147483648(int ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-2147483648, 3, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1000
     * @tc.name int8ArrayCopyWithinPart03Test010
     * @tc.desc Verify target=0 start/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2, -1);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1100
     * @tc.name int8ArrayCopyWithinPart03Test011
     * @tc.desc Verify start=-1 length-1=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -1);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1200
     * @tc.name int8ArrayCopyWithinPart03Test012
     * @tc.desc Verify start=-length(=-5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, -5);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1300
     * @tc.name int8ArrayCopyWithinPart03Test013
     * @tc.desc Verify start=-length-1(=-6) -1 0 start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, -6);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1400
     * @tc.name int8ArrayCopyWithinPart03Test014
     * @tc.desc Verify start=length(=5) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1500
     * @tc.name int8ArrayCopyWithinPart03Test015
     * @tc.desc Verify start=length+1(=6) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 6);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1600
     * @tc.name int8ArrayCopyWithinPart03Test016
     * @tc.desc Verify start=2147483647(int ) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1700
     * @tc.name int8ArrayCopyWithinPart03Test017
     * @tc.desc Verify start=-2147483648(int ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, -2147483648);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1800
     * @tc.name int8ArrayCopyWithinPart03Test018
     * @tc.desc Verify end=-1 length-1=4 start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, -1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_1900
     * @tc.name int8ArrayCopyWithinPart03Test019
     * @tc.desc Verify end=-length(=-5) 0 start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2000
     * @tc.name int8ArrayCopyWithinPart03Test020
     * @tc.desc Verify end=-length-1(=-6) -1 0 start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -6);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2100
     * @tc.name int8ArrayCopyWithinPart03Test021
     * @tc.desc Verify end=length(=5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2200
     * @tc.name int8ArrayCopyWithinPart03Test022
     * @tc.desc Verify end=length+1(=6) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 6);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2300
     * @tc.name int8ArrayCopyWithinPart03Test023
     * @tc.desc Verify end=2147483647(int ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 2147483647);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2400
     * @tc.name int8ArrayCopyWithinPart03Test024
     * @tc.desc Verify end=-2147483648(int ) 0 start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2500
     * @tc.name int8ArrayCopyWithinPart03Test025
     * @tc.desc Verify end=0 start=0 start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2600
     * @tc.name int8ArrayCopyWithinPart03Test026
     * @tc.desc Verify end=undefined undefined end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, undefined);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2700
     * @tc.name int8ArrayCopyWithinPart03Test027
     * @tc.desc Verify target>=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(5, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2800
     * @tc.name int8ArrayCopyWithinPart03Test028
     * @tc.desc Verify start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_2900
     * @tc.name int8ArrayCopyWithinPart03Test029
     * @tc.desc Verify start>=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 5, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3000
     * @tc.name int8ArrayCopyWithinPart03Test030
     * @tc.desc Verify start==end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3100
     * @tc.name int8ArrayCopyWithinPart03Test031
     * @tc.desc Verify start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -1, -2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3200
     * @tc.name int8ArrayCopyWithinPart03Test032
     * @tc.desc Verify copyWithin(0, 0, 0) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.copyWithin(0, 0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3300
     * @tc.name int8ArrayCopyWithinPart03Test033
     * @tc.desc Verify copyWithin(-1, -1) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.copyWithin(-1, -1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3400
     * @tc.name int8ArrayCopyWithinPart03Test034
     * @tc.desc Verify copyWithin(5, 0) target no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3500
     * @tc.name int8ArrayCopyWithinPart03Test035
     * @tc.desc Verify [7] copyWithin(0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      arr.copyWithin(0, 0);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3600
     * @tc.name int8ArrayCopyWithinPart03Test036
     * @tc.desc Verify [7] copyWithin(0, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      arr.copyWithin(0, 0, 1);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3700
     * @tc.name int8ArrayCopyWithinPart03Test037
     * @tc.desc Verify [7] copyWithin(-1, -1) (0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      arr.copyWithin(-1, -1);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3800
     * @tc.name int8ArrayCopyWithinPart03Test038
     * @tc.desc Verify [7] copyWithin(1, 0) target>=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      arr.copyWithin(1, 0);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_3900
     * @tc.name int8ArrayCopyWithinPart03Test039
     * @tc.desc Verify [5,5,5,5,5] copyWithin(0, 2) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5, 5]);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4000
     * @tc.name int8ArrayCopyWithinPart03Test040
     * @tc.desc Verify [5,5,5,5,5] copyWithin(0, 2, 4) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4100
     * @tc.name int8ArrayCopyWithinPart03Test041
     * @tc.desc Verify [0,0,0,0] copyWithin(0, 1, 3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      arr.copyWithin(0, 1, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4200
     * @tc.name int8ArrayCopyWithinPart03Test042
     * @tc.desc Verify -128(int8 ) copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -128, 3, 4, 5]);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4300
     * @tc.name int8ArrayCopyWithinPart03Test043
     * @tc.desc Verify 127(int8 ) copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, INT8_MAX, 3, 4, 5]);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4400
     * @tc.name int8ArrayCopyWithinPart03Test044
     * @tc.desc Verify $_set(1, 128) -128 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, 128);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4500
     * @tc.name int8ArrayCopyWithinPart03Test045
     * @tc.desc Verify $_set(2, 255) -1 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(2, 255);
      arr.copyWithin(0, 2, 3);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4600
     * @tc.name int8ArrayCopyWithinPart03Test046
     * @tc.desc Verify $_set(1, 200) -56 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, 200);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4700
     * @tc.name int8ArrayCopyWithinPart03Test047
     * @tc.desc Verify $_set(1, -129) 127 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, -129);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4800
     * @tc.name int8ArrayCopyWithinPart03Test048
     * @tc.desc Verify $_set(1, 129) -127 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, 129);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_4900
     * @tc.name int8ArrayCopyWithinPart03Test049
     * @tc.desc Verify $_set(1, 256) 0 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, 256);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5000
     * @tc.name int8ArrayCopyWithinPart03Test050
     * @tc.desc Verify $_set(1, 300) 44 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(1, 300);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5100
     * @tc.name int8ArrayCopyWithinPart03Test051
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.$_set(0, 200);
      arr.$_set(1, 255);
      arr.copyWithin(1, 0, 3);
      expect(arr.$_get(1)).assertEqual(-56);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5200
     * @tc.name int8ArrayCopyWithinPart03Test052
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, 200);
      arr.$_set(1, 255);
      arr.$_set(2, 128);
      arr.$_set(3, -129);
      arr.$_set(4, 300);
      arr.copyWithin(0, 2, 5);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(44);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
      expect(arr.$_get(4)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5300
     * @tc.name int8ArrayCopyWithinPart03Test053
     * @tc.desc Verify no-op this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(10, 0, 2);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5400
     * @tc.name int8ArrayCopyWithinPart03Test054
     * @tc.desc Verify no-op this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.copyWithin(0, 0);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5500
     * @tc.name int8ArrayCopyWithinPart03Test055
     * @tc.desc Verify target this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.copyWithin(-2147483648, 0, 2);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5600
     * @tc.name int8ArrayCopyWithinPart03Test056
     * @tc.desc Verify this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 4);
      expect(result).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5700
     * @tc.name int8ArrayCopyWithinPart03Test057
     * @tc.desc Verify target=-1 start=-2 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, -2, -1);
      expect(arr.$_get(4)).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5800
     * @tc.name int8ArrayCopyWithinPart03Test058
     * @tc.desc Verify target=-1 start=-3 end=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, -3, -2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_5900
     * @tc.name int8ArrayCopyWithinPart03Test059
     * @tc.desc Verify target + start length + end start no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, 100);
      expect(arr.$_get(4)).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6000
     * @tc.name int8ArrayCopyWithinPart03Test060
     * @tc.desc Verify target=0 start=-2 end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6100
     * @tc.name int8ArrayCopyWithinPart03Test061
     * @tc.desc Verify target=100 length + start=0 end=2 target no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(100, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6200
     * @tc.name int8ArrayCopyWithinPart03Test062
     * @tc.desc Verify target=0 start=0 end=100 end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 100);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6300
     * @tc.name int8ArrayCopyWithinPart03Test063
     * @tc.desc Verify target=3 start=0 end=100 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(3, 0, 100);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6400
     * @tc.name int8ArrayCopyWithinPart03Test064
     * @tc.desc Verify target=0 start=length-1 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 4, 5);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6500
     * @tc.name int8ArrayCopyWithinPart03Test065
     * @tc.desc Verify target=length-1 start=0 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(4, 0, 1);
      expect(arr.$_get(4)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6600
     * @tc.name int8ArrayCopyWithinPart03Test066
     * @tc.desc Verify target=1 start=0 end=length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 5);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6700
     * @tc.name int8ArrayCopyWithinPart03Test067
     * @tc.desc Verify target=0 start=0 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6800
     * @tc.name int8ArrayCopyWithinPart03Test068
     * @tc.desc Verify 1000 copyWithin(0, 500, 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1000);
      arr.$_set(500, 42);
      arr.$_set(999, 99);
      arr.copyWithin(0, 500, 1000);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(499)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_6900
     * @tc.name int8ArrayCopyWithinPart03Test069
     * @tc.desc Verify 1000 copyWithin(999, 0) target 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1000);
      arr.$_set(0, 77);
      arr.copyWithin(999, 0);
      expect(arr.$_get(999)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_7000
     * @tc.name int8ArrayCopyWithinPart03Test070
     * @tc.desc Verify target + start + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-2, 0, -1);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_7100
     * @tc.name int8ArrayCopyWithinPart03Test071
     * @tc.desc Verify target + start + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(3, -4, 3);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_7200
     * @tc.name int8ArrayCopyWithinPart03Test072
     * @tc.desc Verify target=start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 2, 4);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_7300
     * @tc.name int8ArrayCopyWithinPart03Test073
     * @tc.desc Verify target start length end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(100, 200);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART03_TEST_7400
     * @tc.name int8ArrayCopyWithinPart03Test074
     * @tc.desc Verify 2 copyWithin(-1, 0, 2) target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      arr.copyWithin(-1, 0, 2);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(0)).assertEqual(10);
    });

  });
}
