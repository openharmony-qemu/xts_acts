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

export default function int8ArrayCopyWithinPart04TestTest(): void {
  describe('Int8ArrayCopyWithinPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0100
     * @tc.name int8ArrayCopyWithinPart04Test001
     * @tc.desc Verify copyWithin this ret
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let ret: Int8Array = arr.copyWithin(0, 2, 4);
      ret.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0200
     * @tc.name int8ArrayCopyWithinPart04Test002
     * @tc.desc Verify copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0300
     * @tc.name int8ArrayCopyWithinPart04Test003
     * @tc.desc Verify copyWithin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0400
     * @tc.name int8ArrayCopyWithinPart04Test004
     * @tc.desc Verify copyWithin buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.copyWithin(0, 2, 4);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0500
     * @tc.name int8ArrayCopyWithinPart04Test005
     * @tc.desc Verify copyWithin byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(8), 2, 4);
      arr.copyWithin(0, 2, 4);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0600
     * @tc.name int8ArrayCopyWithinPart04Test006
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(3, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0700
     * @tc.name int8ArrayCopyWithinPart04Test007
     * @tc.desc Verify target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0800
     * @tc.name int8ArrayCopyWithinPart04Test008
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 3);
      expect(arr.$_get(4)).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0900
     * @tc.name int8ArrayCopyWithinPart04Test009
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(1, 3, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1000
     * @tc.name int8ArrayCopyWithinPart04Test010
     * @tc.desc Verify copyWithin target>=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(4, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1100
     * @tc.name int8ArrayCopyWithinPart04Test011
     * @tc.desc Verify copyWithin start>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 3, 2);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1200
     * @tc.name int8ArrayCopyWithinPart04Test012
     * @tc.desc Verify copyWithin start>=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 4, 4);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1300
     * @tc.name int8ArrayCopyWithinPart04Test013
     * @tc.desc Verify copyWithin watcher
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let watcher: Int8Array = new Int8Array(arr.buffer);
      arr.copyWithin(0, 2, 4);
      expect(watcher.$_get(0)).assertEqual(3);
      expect(watcher.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1400
     * @tc.name int8ArrayCopyWithinPart04Test014
     * @tc.desc Verify copyWithin toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let before: string = arr.toString();
      arr.copyWithin(0, 3, 5);
      let after: string = arr.toString();
      expect(before).assertEqual('1,2,3,4,5');
      expect(after).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1500
     * @tc.name int8ArrayCopyWithinPart04Test015
     * @tc.desc Verify copyWithin $_get(target)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1600
     * @tc.name int8ArrayCopyWithinPart04Test016
     * @tc.desc Verify copyWithin at(target)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.at(0)).assertEqual(30);
      expect(arr.at(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1700
     * @tc.name int8ArrayCopyWithinPart04Test017
     * @tc.desc Verify copyWithin indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.indexOf(30)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1800
     * @tc.name int8ArrayCopyWithinPart04Test018
     * @tc.desc Verify copyWithin includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.includes(40)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1900
     * @tc.name int8ArrayCopyWithinPart04Test019
     * @tc.desc Verify copyWithin $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2000
     * @tc.name int8ArrayCopyWithinPart04Test020
     * @tc.desc Verify copyWithin lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      expect(arr.lastIndexOf(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2100
     * @tc.name int8ArrayCopyWithinPart04Test021
     * @tc.desc Verify copyWithin end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 10);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2200
     * @tc.name int8ArrayCopyWithinPart04Test022
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum = sum + arr.$_get(i);
      }
      expect(sum).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2300
     * @tc.name int8ArrayCopyWithinPart04Test023
     * @tc.desc Verify copyWithin toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.toString()).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2400
     * @tc.name int8ArrayCopyWithinPart04Test024
     * @tc.desc Verify copyWithin join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.join('-')).assertEqual('3-4-3-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2500
     * @tc.name int8ArrayCopyWithinPart04Test025
     * @tc.desc Verify copyWithin indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7, 8]);
      arr.copyWithin(0, 2, 4);
      expect(arr.indexOf(7)).assertEqual(0);
      expect(arr.indexOf(8)).assertEqual(1);
      expect(arr.indexOf(7, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2600
     * @tc.name int8ArrayCopyWithinPart04Test026
     * @tc.desc Verify copyWithin length byteLength int8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      expect(arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2700
     * @tc.name int8ArrayCopyWithinPart04Test027
     * @tc.desc Verify copyWithin slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      let sub: Int8Array = arr.slice(0, 3);
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.$_get(1)).assertEqual(5);
      expect(sub.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2800
     * @tc.name int8ArrayCopyWithinPart04Test028
     * @tc.desc Verify copyWithin reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2900
     * @tc.name int8ArrayCopyWithinPart04Test029
     * @tc.desc Verify copyWithin fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3000
     * @tc.name int8ArrayCopyWithinPart04Test030
     * @tc.desc Verify copyWithin sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 4, 1, 5]);
      arr.copyWithin(0, 2, 5).sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3100
     * @tc.name int8ArrayCopyWithinPart04Test031
     * @tc.desc Verify copyWithin subarray fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).subarray(0, 2).fill(9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3200
     * @tc.name int8ArrayCopyWithinPart04Test032
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 2, 4).copyWithin(4, 0, 2);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(3);
      expect(arr.$_get(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3300
     * @tc.name int8ArrayCopyWithinPart04Test033
     * @tc.desc Verify copyWithin set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      arr.set(new Int8Array([7, 8]), 0);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3400
     * @tc.name int8ArrayCopyWithinPart04Test034
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 2);
      arr.copyWithin(2, 3, 5);
      arr.copyWithin(4, 0, 1);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3500
     * @tc.name int8ArrayCopyWithinPart04Test035
     * @tc.desc Verify copyWithin toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let rev: Int8Array = arr.copyWithin(0, 2, 4).toReversed();
      expect(arr.$_get(0)).assertEqual(3);
      expect(rev.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3600
     * @tc.name int8ArrayCopyWithinPart04Test036
     * @tc.desc Verify copyWithin toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 4, 1]);
      let sorted: Int8Array = arr.copyWithin(0, 2, 4).toSorted();
      expect(arr.$_get(0)).assertEqual(4);
      expect(sorted.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3700
     * @tc.name int8ArrayCopyWithinPart04Test037
     * @tc.desc Verify copyWithin with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let modified: Int8Array = arr.copyWithin(0, 2, 4).with(0, 99);
      expect(arr.$_get(0)).assertEqual(3);
      expect(modified.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3800
     * @tc.name int8ArrayCopyWithinPart04Test038
     * @tc.desc Verify start<target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, 4);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3900
     * @tc.name int8ArrayCopyWithinPart04Test039
     * @tc.desc Verify start=target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(1, 1, 3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4000
     * @tc.name int8ArrayCopyWithinPart04Test040
     * @tc.desc Verify target<start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 5);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4100
     * @tc.name int8ArrayCopyWithinPart04Test041
     * @tc.desc Verify target=0,start=0,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 0, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4200
     * @tc.name int8ArrayCopyWithinPart04Test042
     * @tc.desc Verify target=start+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 1, 4);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4300
     * @tc.name int8ArrayCopyWithinPart04Test043
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(2, 0, 6);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4400
     * @tc.name int8ArrayCopyWithinPart04Test044
     * @tc.desc Verify target+copyLen==start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4500
     * @tc.name int8ArrayCopyWithinPart04Test045
     * @tc.desc Verify -128 MIN copyWithin -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4600
     * @tc.name int8ArrayCopyWithinPart04Test046
     * @tc.desc Verify 127 MAX copyWithin 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4700
     * @tc.name int8ArrayCopyWithinPart04Test047
     * @tc.desc Verify 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 9, 9, 9]);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4800
     * @tc.name int8ArrayCopyWithinPart04Test048
     * @tc.desc Verify 0xFF 255 -1 copyWithin -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0xFF);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4900
     * @tc.name int8ArrayCopyWithinPart04Test049
     * @tc.desc Verify 0x80 128 -128 copyWithin -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x80);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5000
     * @tc.name int8ArrayCopyWithinPart04Test050
     * @tc.desc Verify 0x81 129 -127 copyWithin -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x81);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5100
     * @tc.name int8ArrayCopyWithinPart04Test051
     * @tc.desc Verify 0x100 256 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x100);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5200
     * @tc.name int8ArrayCopyWithinPart04Test052
     * @tc.desc Verify -129 127 copyWithin 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, -129);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5300
     * @tc.name int8ArrayCopyWithinPart04Test053
     * @tc.desc Verify Number.NaN 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, 9.0, 9.0, 9.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5400
     * @tc.name int8ArrayCopyWithinPart04Test054
     * @tc.desc Verify 1.9 1 copyWithin 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5500
     * @tc.name int8ArrayCopyWithinPart04Test055
     * @tc.desc Verify -1.9 -1 copyWithin -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1.9, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5600
     * @tc.name int8ArrayCopyWithinPart04Test056
     * @tc.desc Verify -0.0 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0.0, 9.0, 9.0, 9.0];
      let arr: Int8Array = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5700
     * @tc.name int8ArrayCopyWithinPart04Test057
     * @tc.desc Verify -128,127,0,-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, INT8_MAX, 0, -1, 0, 0]);
      arr.copyWithin(4, 0, 2);
      expect(arr.$_get(4)).assertEqual(-128);
      expect(arr.$_get(5)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5800
     * @tc.name int8ArrayCopyWithinPart04Test058
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 200);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(0)).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5900
     * @tc.name int8ArrayCopyWithinPart04Test059
     * @tc.desc Verify target >length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(10, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6000
     * @tc.name int8ArrayCopyWithinPart04Test060
     * @tc.desc Verify start >length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 10, 12);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6100
     * @tc.name int8ArrayCopyWithinPart04Test061
     * @tc.desc Verify end >length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 100);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6200
     * @tc.name int8ArrayCopyWithinPart04Test062
     * @tc.desc Verify target=0x7FFFFFFF int length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0x7FFFFFFF, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6300
     * @tc.name int8ArrayCopyWithinPart04Test063
     * @tc.desc Verify start=0x7FFFFFFF length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 0x7FFFFFFF, 0x7FFFFFFF);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6400
     * @tc.name int8ArrayCopyWithinPart04Test064
     * @tc.desc Verify end=0x7FFFFFFF length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 0, 0x7FFFFFFF);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6500
     * @tc.name int8ArrayCopyWithinPart04Test065
     * @tc.desc Verify target=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(-1, 0, 2);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6600
     * @tc.name int8ArrayCopyWithinPart04Test066
     * @tc.desc Verify start=-2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6700
     * @tc.name int8ArrayCopyWithinPart04Test067
     * @tc.desc Verify end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6800
     * @tc.name int8ArrayCopyWithinPart04Test068
     * @tc.desc Verify target/start/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-3, -5, -1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6900
     * @tc.name int8ArrayCopyWithinPart04Test069
     * @tc.desc Verify buffer copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      arr.$_set(2, 9);
      arr.$_set(3, 10);
      arr.copyWithin(0, 2, 4);
      let direct: Int8Array = new Int8Array(buf);
      expect(direct.$_get(0)).assertEqual(9);
      expect(direct.$_get(1)).assertEqual(10);
      expect(direct.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7000
     * @tc.name int8ArrayCopyWithinPart04Test070
     * @tc.desc Verify buffer buffer copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let parent: Int8Array = new Int8Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      parent.$_set(4, 5);
      parent.$_set(5, 6);
      let child: Int8Array = new Int8Array(buf, 0, 6);
      child.copyWithin(0, 3, 6);
      expect(parent.$_get(0)).assertEqual(4);
      expect(parent.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7100
     * @tc.name int8ArrayCopyWithinPart04Test071
     * @tc.desc Verify buffer subarray copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(2, 6);
      sub.copyWithin(0, 2, 4);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7200
     * @tc.name int8ArrayCopyWithinPart04Test072
     * @tc.desc Verify buffer subarray copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(0, 4);
      arr.copyWithin(0, 2, 4);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7300
     * @tc.name int8ArrayCopyWithinPart04Test073
     * @tc.desc Verify buffer buffer copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view0: Int8Array = new Int8Array(buf, 0, 2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      let view4: Int8Array = new Int8Array(buf, 4, 2);
      view0.$_set(0, 10);
      view0.$_set(1, 20);
      view2.$_set(0, 30);
      view2.$_set(1, 40);
      view4.$_set(0, 50);
      view4.$_set(1, 60);
      view2.copyWithin(0, 1, 2);
      expect(view4.$_get(0)).assertEqual(50);
      expect(view0.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7400
     * @tc.name int8ArrayCopyWithinPart04Test074
     * @tc.desc Verify buffer byteOffset>0 copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      arr.copyWithin(0, 2, 4);
      let full: Int8Array = new Int8Array(buf);
      expect(full.$_get(2)).assertEqual(3);
      expect(full.$_get(5)).assertEqual(4);
      expect(full.$_get(0)).assertEqual(0);
      expect(full.$_get(6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7500
     * @tc.name int8ArrayCopyWithinPart04Test075
     * @tc.desc Verify buffer copyWithin subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(1, 5);
      sub.copyWithin(0, 0, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7600
     * @tc.name int8ArrayCopyWithinPart04Test076
     * @tc.desc Verify buffer copyWithin slice copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let snapshot: Int8Array = arr.slice();
      arr.copyWithin(0, 2, 4);
      expect(snapshot.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7700
     * @tc.name int8ArrayCopyWithinPart04Test077
     * @tc.desc Verify buffer copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a: Int8Array = new Int8Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      a.$_set(4, 5);
      a.$_set(5, 6);
      a.copyWithin(0, 3, 6);
      let b: Int8Array = new Int8Array(buf, 3, 3);
      expect(b.$_get(0)).assertEqual(4);
      expect(b.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7800
     * @tc.name int8ArrayCopyWithinPart04Test078
     * @tc.desc Verify buffer subarray copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(2, 5);
      sub.copyWithin(0, 1, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7900
     * @tc.name int8ArrayCopyWithinPart04Test079
     * @tc.desc Verify copyWithin length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let ret: Int8Array = arr.copyWithin(0, 0, 0);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_8000
     * @tc.name int8ArrayCopyWithinPart04Test080
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      arr.copyWithin(0, 0, 1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_8100
     * @tc.name int8ArrayCopyWithinPart04Test081
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_8200
     * @tc.name int8ArrayCopyWithinPart04Test082
     * @tc.desc Verify copyWithin end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(5);
    });

  });
}
