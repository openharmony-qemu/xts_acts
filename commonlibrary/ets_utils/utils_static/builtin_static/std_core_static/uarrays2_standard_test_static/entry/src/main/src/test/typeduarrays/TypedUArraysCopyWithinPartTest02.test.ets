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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysCopyWithinPartTest02(): void {
  describe('TypedUArraysCopyWithinPartTest02', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0100
     * @tc.name testTypedUArraysCopyWithinPartTestFileB001
     * @tc.desc Verify copyWithin typeof object Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0200
     * @tc.name testTypedUArraysCopyWithinPartTestFileB002
     * @tc.desc Verify copyWithin instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1).copyWithin(2, 3);
      expect(ret instanceof Uint8Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0300
     * @tc.name testTypedUArraysCopyWithinPartTestFileB003
     * @tc.desc Verify copyWithin buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0400
     * @tc.name testTypedUArraysCopyWithinPartTestFileB004
     * @tc.desc Verify copyWithin buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0500
     * @tc.name testTypedUArraysCopyWithinPartTestFileB005
     * @tc.desc Verify copyWithin buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0600
     * @tc.name testTypedUArraysCopyWithinPartTestFileB006
     * @tc.desc Verify copyWithin buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0700
     * @tc.name testTypedUArraysCopyWithinPartTestFileB007
     * @tc.desc Verify copyWithin buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0800
     * @tc.name testTypedUArraysCopyWithinPartTestFileB008
     * @tc.desc Verify copyWithin byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_0900
     * @tc.name testTypedUArraysCopyWithinPartTestFileB009
     * @tc.desc Verify copyWithin byteOffset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1000
     * @tc.name testTypedUArraysCopyWithinPartTestFileB010
     * @tc.desc Verify copyWithin byteOffset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1100
     * @tc.name testTypedUArraysCopyWithinPartTestFileB011
     * @tc.desc Verify copyWithin byteOffset Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1200
     * @tc.name testTypedUArraysCopyWithinPartTestFileB012
     * @tc.desc Verify copyWithin byteOffset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const ret = arr.copyWithin(0, 1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1300
     * @tc.name testTypedUArraysCopyWithinPartTestFileB013
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = arr.copyWithin(0, 0);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1400
     * @tc.name testTypedUArraysCopyWithinPartTestFileB014
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = arr.copyWithin(0, 0);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1500
     * @tc.name testTypedUArraysCopyWithinPartTestFileB015
     * @tc.desc Verify copyWithin(target=0, start=0) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const expected = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 0);
      const val0 = arr[0];
      expect(val0).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1600
     * @tc.name testTypedUArraysCopyWithinPartTestFileB016
     * @tc.desc Verify copyWithin(target=0, start=0) Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const expected = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 0);
      const val1 = arr[0];
      expect(val1).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1700
     * @tc.name testTypedUArraysCopyWithinPartTestFileB017
     * @tc.desc Verify copyWithin(target=0, start=0) Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const expected = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 0);
      const val2 = arr[0];
      expect(val2).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1800
     * @tc.name testTypedUArraysCopyWithinPartTestFileB018
     * @tc.desc Verify copyWithin(target=0, start=0) Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const expected = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 0);
      const val3 = arr[0];
      expect(val3).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_1900
     * @tc.name testTypedUArraysCopyWithinPartTestFileB019
     * @tc.desc Verify copyWithin(target=0, start=0) BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const expected = [1n, 2n, 3n, 4n, 5n];
      arr.copyWithin(0, 0);
      const val4 = arr[0];
      expect(val4).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2000
     * @tc.name testTypedUArraysCopyWithinPartTestFileB020
     * @tc.desc Verify copyWithin(start >= length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const expected = [10, 20, 30, 40];
      arr.copyWithin(0, 10);
      const val5 = arr[0] ;
      expect(val5).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2100
     * @tc.name testTypedUArraysCopyWithinPartTestFileB021
     * @tc.desc Verify copyWithin(end <= start)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const expected = [10, 20, 30, 40];
      arr.copyWithin(0, 2, 2);
      const val6 = arr[0] ;
      expect(val6).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2200
     * @tc.name testTypedUArraysCopyWithinPartTestFileB022
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2300
     * @tc.name testTypedUArraysCopyWithinPartTestFileB023
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      arr.copyWithin(0, 0);
      const val7 = arr[0] ;
      expect(val7).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2400
     * @tc.name testTypedUArraysCopyWithinPartTestFileB024
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret instanceof Uint8Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2500
     * @tc.name testTypedUArraysCopyWithinPartTestFileB025
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret instanceof Uint16Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2600
     * @tc.name testTypedUArraysCopyWithinPartTestFileB026
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret instanceof Uint32Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2700
     * @tc.name testTypedUArraysCopyWithinPartTestFileB027
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret instanceof Uint8ClampedArray).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2800
     * @tc.name testTypedUArraysCopyWithinPartTestFileB028
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(ret instanceof BigUint64Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_2900
     * @tc.name testTypedUArraysCopyWithinPartTestFileB029
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3000
     * @tc.name testTypedUArraysCopyWithinPartTestFileB030
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3100
     * @tc.name testTypedUArraysCopyWithinPartTestFileB031
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3200
     * @tc.name testTypedUArraysCopyWithinPartTestFileB032
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3300
     * @tc.name testTypedUArraysCopyWithinPartTestFileB033
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3400
     * @tc.name testTypedUArraysCopyWithinPartTestFileB034
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1).copyWithin(2, 3);
      const val8 = arr[0] ;
      expect(val8).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3500
     * @tc.name testTypedUArraysCopyWithinPartTestFileB035
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1).copyWithin(2, 3);
      const val9 = arr[0] ;
      expect(val9).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3600
     * @tc.name testTypedUArraysCopyWithinPartTestFileB036
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1).copyWithin(2, 3);
      const val10 = arr[0] ;
      expect(val10).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3700
     * @tc.name testTypedUArraysCopyWithinPartTestFileB037
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1).copyWithin(2, 3);
      const val11 = arr[0] ;
      expect(val11).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3800
     * @tc.name testTypedUArraysCopyWithinPartTestFileB038
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 1).copyWithin(2, 3);
      const val12 = arr[0];
      expect(val12).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_3900
     * @tc.name testTypedUArraysCopyWithinPartTestFileB039
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4000
     * @tc.name testTypedUArraysCopyWithinPartTestFileB040
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4100
     * @tc.name testTypedUArraysCopyWithinPartTestFileB041
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4200
     * @tc.name testTypedUArraysCopyWithinPartTestFileB042
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4300
     * @tc.name testTypedUArraysCopyWithinPartTestFileB043
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4400
     * @tc.name testTypedUArraysCopyWithinPartTestFileB044
     * @tc.desc Verify copyWithin(target=-1) typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, 0);
      expect(ret).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4500
     * @tc.name testTypedUArraysCopyWithinPartTestFileB045
     * @tc.desc Verify copyWithin(target=-1) instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, 0);
      expect(ret instanceof Uint8Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART201_4600
     * @tc.name testTypedUArraysCopyWithinPartTestFileB046
     * @tc.desc Verify copyWithin(target=-1, start=-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPartTestFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, -2);
      expect(ret).assertEqual(arr);
    });
  });
}
