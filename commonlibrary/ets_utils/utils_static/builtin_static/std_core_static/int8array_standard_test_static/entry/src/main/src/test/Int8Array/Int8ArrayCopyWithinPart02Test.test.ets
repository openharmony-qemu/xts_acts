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

export default function int8ArrayCopyWithinPart02TestTest(): void {
  describe('Int8ArrayCopyWithinPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0100
     * @tc.name int8ArrayCopyWithinPart02Test001
     * @tc.desc Verify typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0200
     * @tc.name int8ArrayCopyWithinPart02Test002
     * @tc.desc Verify copyWithin typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0300
     * @tc.name int8ArrayCopyWithinPart02Test003
     * @tc.desc Verify copyWithin typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7]);
      let ret = arr.copyWithin(0, 0, 1);
      expect(ret).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0400
     * @tc.name int8ArrayCopyWithinPart02Test004
     * @tc.desc Verify typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(-1, -3, -2);
      expect(ret).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0500
     * @tc.name int8ArrayCopyWithinPart02Test005
     * @tc.desc Verify typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let ret = arr.copyWithin(-2, -3, -1);
      expect(ret).not().assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0600
     * @tc.name int8ArrayCopyWithinPart02Test006
     * @tc.desc Verify instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(0, 1, 2);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0700
     * @tc.name int8ArrayCopyWithinPart02Test007
     * @tc.desc Verify copyWithin instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0800
     * @tc.name int8ArrayCopyWithinPart02Test008
     * @tc.desc Verify copyWithin instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0900
     * @tc.name int8ArrayCopyWithinPart02Test009
     * @tc.desc Verify copyWithin instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 0, 6);
      view.$_set(0, 5);
      view.$_set(1, 6);
      view.$_set(2, 7);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret.length).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1000
     * @tc.name int8ArrayCopyWithinPart02Test010
     * @tc.desc Verify target instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(100, 0, 1);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1100
     * @tc.name int8ArrayCopyWithinPart02Test011
     * @tc.desc Verify instanceof Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(0, 1, 2);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1200
     * @tc.name int8ArrayCopyWithinPart02Test012
     * @tc.desc Verify [1,3) target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1300
     * @tc.name int8ArrayCopyWithinPart02Test013
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret.$_get(3)).assertEqual(4);
      expect(ret.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1400
     * @tc.name int8ArrayCopyWithinPart02Test014
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 3);
      expect(ret.$_get(0)).assertEqual(4);
      expect(ret.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1500
     * @tc.name int8ArrayCopyWithinPart02Test015
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(3, 0, 2);
      expect(ret.$_get(3)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1600
     * @tc.name int8ArrayCopyWithinPart02Test016
     * @tc.desc Verify target=0 start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 0, 2);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1700
     * @tc.name int8ArrayCopyWithinPart02Test017
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([9, 8, 7, 6]);
      let ret = arr.copyWithin(3, 0, 1);
      expect(ret.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1800
     * @tc.name int8ArrayCopyWithinPart02Test018
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2, 100);
      expect(ret.$_get(0)).assertEqual(3);
      expect(ret.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1900
     * @tc.name int8ArrayCopyWithinPart02Test019
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(100, 0, 2);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2000
     * @tc.name int8ArrayCopyWithinPart02Test020
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(-2, 0, 2);
      expect(ret.$_get(3)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2100
     * @tc.name int8ArrayCopyWithinPart02Test021
     * @tc.desc Verify start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, -2);
      expect(ret.$_get(0)).assertEqual(4);
      expect(ret.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2200
     * @tc.name int8ArrayCopyWithinPart02Test022
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, -1);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(1)).assertEqual(3);
      expect(ret.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2300
     * @tc.name int8ArrayCopyWithinPart02Test023
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let ret = arr.copyWithin(-3, -4, -2);
      expect(ret.$_get(2)).assertEqual(20);
      expect(ret.$_get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2400
     * @tc.name int8ArrayCopyWithinPart02Test024
     * @tc.desc Verify target=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(-4, 2, 4);
      expect(ret.$_get(0)).assertEqual(3);
      expect(ret.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2500
     * @tc.name int8ArrayCopyWithinPart02Test025
     * @tc.desc Verify start=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7, 8]);
      let ret = arr.copyWithin(2, -4, -2);
      expect(ret.$_get(2)).assertEqual(5);
      expect(ret.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2600
     * @tc.name int8ArrayCopyWithinPart02Test026
     * @tc.desc Verify start<target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(1, 0, 4);
      expect(ret.$_get(1)).assertEqual(1);
      expect(ret.$_get(2)).assertEqual(2);
      expect(ret.$_get(3)).assertEqual(3);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2700
     * @tc.name int8ArrayCopyWithinPart02Test027
     * @tc.desc Verify start>target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 4);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(1)).assertEqual(3);
      expect(ret.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2800
     * @tc.name int8ArrayCopyWithinPart02Test028
     * @tc.desc Verify start===target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(1, 1, 3);
      expect(ret.$_get(1)).assertEqual(2);
      expect(ret.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2900
     * @tc.name int8ArrayCopyWithinPart02Test029
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(2, 0, 3);
      expect(ret.$_get(2)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(2);
      expect(ret.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3000
     * @tc.name int8ArrayCopyWithinPart02Test030
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(2, 1, 5);
      expect(ret.$_get(2)).assertEqual(2);
      expect(ret.$_get(3)).assertEqual(3);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3100
     * @tc.name int8ArrayCopyWithinPart02Test031
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 3, 5);
      expect(ret.$_get(4)).assertEqual(5);
      expect(ret.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3200
     * @tc.name int8ArrayCopyWithinPart02Test032
     * @tc.desc Verify start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 100, 200);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3300
     * @tc.name int8ArrayCopyWithinPart02Test033
     * @tc.desc Verify start>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 3, 1);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3400
     * @tc.name int8ArrayCopyWithinPart02Test034
     * @tc.desc Verify length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3500
     * @tc.name int8ArrayCopyWithinPart02Test035
     * @tc.desc Verify copyWithin length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3600
     * @tc.name int8ArrayCopyWithinPart02Test036
     * @tc.desc Verify copyWithin length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7]);
      let ret = arr.copyWithin(0, 0, 1);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3700
     * @tc.name int8ArrayCopyWithinPart02Test037
     * @tc.desc Verify target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(100, 0, 2);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3800
     * @tc.name int8ArrayCopyWithinPart02Test038
     * @tc.desc Verify start length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 100, 200);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3900
     * @tc.name int8ArrayCopyWithinPart02Test039
     * @tc.desc Verify end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 1, 1000);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4000
     * @tc.name int8ArrayCopyWithinPart02Test040
     * @tc.desc Verify copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4100
     * @tc.name int8ArrayCopyWithinPart02Test041
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(-3, -5, -1);
      expect(ret.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4200
     * @tc.name int8ArrayCopyWithinPart02Test042
     * @tc.desc Verify byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4300
     * @tc.name int8ArrayCopyWithinPart02Test043
     * @tc.desc Verify copyWithin byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4400
     * @tc.name int8ArrayCopyWithinPart02Test044
     * @tc.desc Verify copyWithin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 0, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 2, 4);
      expect(ret.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4500
     * @tc.name int8ArrayCopyWithinPart02Test045
     * @tc.desc Verify copyWithin byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 1, 3);
      expect(ret.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4600
     * @tc.name int8ArrayCopyWithinPart02Test046
     * @tc.desc Verify copyWithin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 4);
      expect(ret.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4700
     * @tc.name int8ArrayCopyWithinPart02Test047
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4800
     * @tc.name int8ArrayCopyWithinPart02Test048
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4900
     * @tc.name int8ArrayCopyWithinPart02Test049
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([9]);
      let ret = arr.copyWithin(0, 0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5000
     * @tc.name int8ArrayCopyWithinPart02Test050
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(-1, -3, -2);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5100
     * @tc.name int8ArrayCopyWithinPart02Test051
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(100, 0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5200
     * @tc.name int8ArrayCopyWithinPart02Test052
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 0, 6);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5300
     * @tc.name int8ArrayCopyWithinPart02Test053
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5400
     * @tc.name int8ArrayCopyWithinPart02Test054
     * @tc.desc Verify copyWithin reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5500
     * @tc.name int8ArrayCopyWithinPart02Test055
     * @tc.desc Verify copyWithin fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).fill(0, 0, 2);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5600
     * @tc.name int8ArrayCopyWithinPart02Test056
     * @tc.desc Verify copyWithin sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 2]);
      let ret = arr.copyWithin(0, 2).sort();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5700
     * @tc.name int8ArrayCopyWithinPart02Test057
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 1).copyWithin(2, 4).copyWithin(3, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5800
     * @tc.name int8ArrayCopyWithinPart02Test058
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0).copyWithin(0, 0, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5900
     * @tc.name int8ArrayCopyWithinPart02Test059
     * @tc.desc Verify copyWithin buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6000
     * @tc.name int8ArrayCopyWithinPart02Test060
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6100
     * @tc.name int8ArrayCopyWithinPart02Test061
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 0, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 2, 4);
      expect(ret.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6200
     * @tc.name int8ArrayCopyWithinPart02Test062
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 1, 3);
      expect(ret.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6300
     * @tc.name int8ArrayCopyWithinPart02Test063
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.copyWithin(0, 2, 4);
      let reader = new Int8Array(buf);
      expect(reader.$_get(0)).assertEqual(30);
      expect(reader.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6400
     * @tc.name int8ArrayCopyWithinPart02Test064
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6500
     * @tc.name int8ArrayCopyWithinPart02Test065
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let outside = new Int8Array(buf, 0, 2);
      outside.$_set(0, 90);
      outside.$_set(1, 91);
      view.copyWithin(0, 2, 4);
      expect(outside.$_get(0)).assertEqual(90);
      expect(outside.$_get(1)).assertEqual(91);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6600
     * @tc.name int8ArrayCopyWithinPart02Test066
     * @tc.desc Verify copyWithin byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 4, 2);
      view.$_set(0, 5);
      view.$_set(1, 6);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6700
     * @tc.name int8ArrayCopyWithinPart02Test067
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 4, 2);
      view.$_set(0, 5);
      view.$_set(1, 6);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6800
     * @tc.name int8ArrayCopyWithinPart02Test068
     * @tc.desc Verify subarray copyWithin byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub = base.subarray(2, 5);
      let ret = sub.copyWithin(0, 1, 3);
      expect(ret.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6900
     * @tc.name int8ArrayCopyWithinPart02Test069
     * @tc.desc Verify 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7000
     * @tc.name int8ArrayCopyWithinPart02Test070
     * @tc.desc Verify -129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7100
     * @tc.name int8ArrayCopyWithinPart02Test071
     * @tc.desc Verify 0x81 -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x81, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7200
     * @tc.name int8ArrayCopyWithinPart02Test072
     * @tc.desc Verify 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7300
     * @tc.name int8ArrayCopyWithinPart02Test073
     * @tc.desc Verify 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7400
     * @tc.name int8ArrayCopyWithinPart02Test074
     * @tc.desc Verify Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NaN, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7500
     * @tc.name int8ArrayCopyWithinPart02Test075
     * @tc.desc Verify 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1.9, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7600
     * @tc.name int8ArrayCopyWithinPart02Test076
     * @tc.desc Verify -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1.9, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7700
     * @tc.name int8ArrayCopyWithinPart02Test077
     * @tc.desc Verify 0x100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x100, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7800
     * @tc.name int8ArrayCopyWithinPart02Test078
     * @tc.desc Verify start<target end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(2, 0, 100);
      expect(ret.$_get(2)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(2);
      expect(ret.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_7900
     * @tc.name int8ArrayCopyWithinPart02Test079
     * @tc.desc Verify target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(1, 0, 5);
      expect(ret.$_get(1)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_8000
     * @tc.name int8ArrayCopyWithinPart02Test080
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(-2, -5, -1);
      expect(ret.$_get(4)).assertEqual(2);
      expect(ret.$_get(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_8100
     * @tc.name int8ArrayCopyWithinPart02Test081
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 3, 5);
      expect(ret.at(-1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_8200
     * @tc.name int8ArrayCopyWithinPart02Test082
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      let sub = ret.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_8300
     * @tc.name int8ArrayCopyWithinPart02Test083
     * @tc.desc Verify copyWithin typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret).not().assertEqual(undefined);
    });

  });
}
