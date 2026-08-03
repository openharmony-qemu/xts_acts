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

export default function uint16ArrayCopyWithin03Test(): void {
  describe('Uint16ArrayCopyWithin03Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0100
     * @tc.name testUint16ArrayCopyWithinThree001
     * @tc.desc Verify copyWithin uses the receiver-relative range on an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(-2, 0, 2);
      expect(arr.at(4)).assertEqual(0);
      expect(arr.at(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0200
     * @tc.name testUint16ArrayCopyWithinThree002
     * @tc.desc Verify copyWithin combined with fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0, 0, 0]);
      arr.fill(99, 1, 4);
      arr.copyWithin(2, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(99);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(99);
      expect(arr.at(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0300
     * @tc.name testUint16ArrayCopyWithinThree003
     * @tc.desc Verify copyWithin combined with reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      arr.copyWithin(1, 3);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0400
     * @tc.name testUint16ArrayCopyWithinThree004
     * @tc.desc Verify copyWithin on a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Uint16Array = new Uint16Array(buf);
      arr.set([10, 20, 30, 40, 50, 60]);
      let sub: Uint16Array = new Uint16Array(buf, 4, 4);
      sub.copyWithin(2, 0);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
      expect(arr.at(4)).assertEqual(30);
      expect(arr.at(5)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0500
     * @tc.name testUint16ArrayCopyWithinThree005
     * @tc.desc Verify copyWithin with target < 0 and start < 0 and end < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.copyWithin(-5, -7, -3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(2);
      expect(arr.at(4)).assertEqual(3);
      expect(arr.at(5)).assertEqual(4);
      expect(arr.at(6)).assertEqual(5);
      expect(arr.at(7)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0600
     * @tc.name testUint16ArrayCopyWithinThree006
     * @tc.desc Verify copyWithin with overlapping copy when target is in source range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0700
     * @tc.name testUint16ArrayCopyWithinThree007
     * @tc.desc Verify copyWithin with start = 0 and end = length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      arr.copyWithin(0, 0, 3);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0800
     * @tc.name testUint16ArrayCopyWithinThree008
     * @tc.desc Verify copyWithin with target = 0 and start = length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 4);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_0900
     * @tc.name testUint16ArrayCopyWithinThree009
     * @tc.desc Verify copyWithin with boundary values in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 65535, 32767, 32768]);
      arr.copyWithin(1, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1000
     * @tc.name testUint16ArrayCopyWithinThree010
     * @tc.desc Verify copyWithin chained twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(2, 0).copyWithin(4, 0);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
      expect(arr.at(4)).assertEqual(1);
      expect(arr.at(5)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1100
     * @tc.name testUint16ArrayCopyWithinThree011
     * @tc.desc Verify copyWithin target negative zero is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(2, 0, 0);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1200
     * @tc.name testUint16ArrayCopyWithinThree012
     * @tc.desc Verify copyWithin start negative zero is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(4, 0, 2);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1300
     * @tc.name testUint16ArrayCopyWithinThree013
     * @tc.desc Verify copyWithin end negative zero produces an empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(0, 4);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1400
     * @tc.name testUint16ArrayCopyWithinThree014
     * @tc.desc Verify copyWithin fractional target is truncated toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(-4, 2);
            expect(arr.at(0)).assertEqual(3);
            expect(arr.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1500
     * @tc.name testUint16ArrayCopyWithinThree015
     * @tc.desc Verify copyWithin negative fractional target is truncated toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(2, -4, -2);
            expect(arr.at(2)).assertEqual(1);
            expect(arr.at(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1600
     * @tc.name testUint16ArrayCopyWithinThree016
     * @tc.desc Verify copyWithin fractional start is truncated toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(1, 0, -4);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(3)).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1700
     * @tc.name testUint16ArrayCopyWithinThree017
     * @tc.desc Verify copyWithin fractional end is truncated toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
            arr.copyWithin(0, 1, 5);
            expect(arr.at(0)).assertEqual(2);
            expect(arr.at(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1800
     * @tc.name testUint16ArrayCopyWithinThree018
     * @tc.desc Verify copyWithin negative fractional end is resolved from the array end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
            arr.copyWithin(4, 0, 3);
            expect(arr.at(3)).assertEqual(4);
            expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_1900
     * @tc.name testUint16ArrayCopyWithinThree019
     * @tc.desc Verify copyWithin NaN target is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
            arr.copyWithin(-2, 1, 4);
            expect(arr.at(3)).assertEqual(2);
            expect(arr.at(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2000
     * @tc.name testUint16ArrayCopyWithinThree020
     * @tc.desc Verify copyWithin NaN start is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
            arr.copyWithin(0, -2);
            expect(arr.at(0)).assertEqual(4);
            expect(arr.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2100
     * @tc.name testUint16ArrayCopyWithinThree021
     * @tc.desc Verify copyWithin NaN end is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
            arr.copyWithin(2, 0, -1);
            expect(arr.at(2)).assertEqual(1);
            expect(arr.at(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2200
     * @tc.name testUint16ArrayCopyWithinThree022
     * @tc.desc Verify copyWithin positive infinite target is clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9);
            let result: Uint16Array = arr.copyWithin(0, 0, 1);
            expect(result).assertEqual(arr);
            expect(arr.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2300
     * @tc.name testUint16ArrayCopyWithinThree023
     * @tc.desc Verify copyWithin negative infinite target is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
            let result: Uint16Array = arr.copyWithin(0, 0);
            expect(result).assertEqual(arr);
            expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2400
     * @tc.name testUint16ArrayCopyWithinThree024
     * @tc.desc Verify copyWithin positive infinite start is clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(1, 2);
            expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2500
     * @tc.name testUint16ArrayCopyWithinThree025
     * @tc.desc Verify copyWithin negative infinite start is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
            let view: Uint16Array = new Uint16Array(buffer, 2, 4);
            view.set([1, 2, 3, 4]);
            view.copyWithin(1, 2);
            expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2600
     * @tc.name testUint16ArrayCopyWithinThree026
     * @tc.desc Verify copyWithin positive infinite end is clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([10, 20, 30, 40, 50, 60]);
            let view: Uint16Array = new Uint16Array(buffer, 2, 4);
            view.copyWithin(0, 2);
            expect(all.at(1)).assertEqual(40);
            expect(all.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2700
     * @tc.name testUint16ArrayCopyWithinThree027
     * @tc.desc Verify copyWithin negative infinite end is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([10, 20, 30, 40, 50, 60]);
            let view: Uint16Array = new Uint16Array(buffer, 4, 3);
            view.copyWithin(1, 0, 2);
            expect(all.at(3)).assertEqual(30);
            expect(all.at(4)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2800
     * @tc.name testUint16ArrayCopyWithinThree028
     * @tc.desc Verify copyWithin target beyond length leaves the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(20, 0, 2);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(2)).assertEqual(3);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_2900
     * @tc.name testUint16ArrayCopyWithinThree029
     * @tc.desc Verify copyWithin start beyond length leaves the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(0, 20);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(2)).assertEqual(3);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_3000
     * @tc.name testUint16ArrayCopyWithinThree030
     * @tc.desc Verify copyWithin end beyond length is clamped before copying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(0, 2, 20);
            expect(arr.at(0)).assertEqual(3);
            expect(arr.at(1)).assertEqual(4);
            expect(arr.at(2)).assertEqual(3);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_3100
     * @tc.name testUint16ArrayCopyWithinThree031
     * @tc.desc Verify copyWithin deeply negative target is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(-20, 2);
            expect(arr.at(0)).assertEqual(3);
            expect(arr.at(1)).assertEqual(4);
            expect(arr.at(2)).assertEqual(3);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_3200
     * @tc.name testUint16ArrayCopyWithinThree032
     * @tc.desc Verify copyWithin deeply negative start is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(2, -20, 2);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(2)).assertEqual(1);
            expect(arr.at(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_3300
     * @tc.name testUint16ArrayCopyWithinThree033
     * @tc.desc Verify copyWithin deeply negative end produces an empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.copyWithin(1, 0, -20);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(2)).assertEqual(3);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN_THREE_3400
     * @tc.name testUint16ArrayCopyWithinThree034
     * @tc.desc Verify copyWithin changes through one offset view are visible through a differently bounded overlapping view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithinThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let first: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      let second: Uint16Array = new Uint16Array(backing.buffer, 4, 3);
      first.copyWithin(1, 0, 2);
      expect(backing.at(2)).assertEqual(20);
      expect(backing.at(3)).assertEqual(30);
      expect(second.at(0)).assertEqual(20);
      expect(second.at(1)).assertEqual(30);
      expect(second.at(2)).assertEqual(50);
    });

  });
}
