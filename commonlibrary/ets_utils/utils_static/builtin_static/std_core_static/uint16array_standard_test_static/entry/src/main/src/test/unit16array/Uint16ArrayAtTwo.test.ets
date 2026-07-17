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

export default function uint16ArrayAt02Test(): void {
  describe('Uint16ArrayAt02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0001
     * @tc.name testUint16ArrayAtTwo001
     * @tc.desc Verify reverse() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      arr.reverse();
      expect(arr.at(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0002
     * @tc.name testUint16ArrayAtTwo002
     * @tc.desc Verify reverse() at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      arr.reverse();
      expect(arr.at(-1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0003
     * @tc.name testUint16ArrayAtTwo003
     * @tc.desc Verify sort() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(50, 10, 30, 20, 40);
      arr.sort();
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0004
     * @tc.name testUint16ArrayAtTwo004
     * @tc.desc Verify sort() at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(50, 10, 30, 20, 40);
      arr.sort();
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0005
     * @tc.name testUint16ArrayAtTwo005
     * @tc.desc Verify set([99, 100], 0) at(0) 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.set([99, 100], 0);
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0006
     * @tc.name testUint16ArrayAtTwo006
     * @tc.desc Verify copyWithin(0, 1) at(0) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let original = 20;
      arr.copyWithin(0, 1);
      expect(arr.at(0)).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0007
     * @tc.name testUint16ArrayAtTwo007
     * @tc.desc Verify subarray(1, 3) at(0) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 3);
      expect(sub.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0008
     * @tc.name testUint16ArrayAtTwo008
     * @tc.desc Verify subarray(1, 3) at(-1) at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 3);
      expect(sub.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0009
     * @tc.name testUint16ArrayAtTwo009
     * @tc.desc Verify map(x => x * 2) at(0) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let mapped = arr.map((x: number): number => x * 2);
      expect(mapped.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0010
     * @tc.name testUint16ArrayAtTwo010
     * @tc.desc Verify map(x => x + 1) at(-1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let mapped = arr.map((x: number): number => x + 1);
      expect(mapped.at(-1)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0011
     * @tc.name testUint16ArrayAtTwo011
     * @tc.desc Verify at reads DataView mutations within an offset view and rejects backing elements outside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
      let dataView: DataView = new DataView(buffer);
      dataView.setUint16(4, 123, true);
      dataView.setUint16(6, 456, true);
      dataView.setUint16(8, 789, true);
      let view: Uint16Array = new Uint16Array(buffer, 4, 2);
      expect(view.at(0)).assertEqual(123);
      expect(view.at(1)).assertEqual(456);
      expect(view.at(-1)).assertEqual(456);
      expect(view.at(2)).assertUndefined();
      expect(view.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0012
     * @tc.name testUint16ArrayAtTwo012
     * @tc.desc Verify at returns undefined outside the bounds of a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 3);
      expect(sub.at(0)).assertEqual(20);
      expect(sub.at(1)).assertEqual(30);
      expect(sub.at(2)).assertUndefined();
      expect(sub.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0013
     * @tc.name testUint16ArrayAtTwo013
     * @tc.desc Verify at reads values written by set with a nonzero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      arr.set([99, 100], 1);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(99);
      expect(arr.at(2)).assertEqual(100);
      expect(arr.at(-1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0014
     * @tc.name testUint16ArrayAtTwo014
     * @tc.desc Verify negative at indices read the tail after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(0, 2);
      expect(arr.at(0)).assertEqual(30);
      expect(arr.at(2)).assertEqual(50);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(-2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0015
     * @tc.name testUint16ArrayAtTwo015
     * @tc.desc Verify at reads sorted Uint16 boundary values in numeric order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535, 0, 1, 32768, 65534);
      arr.sort();
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(-1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0016
     * @tc.name testUint16ArrayAtTwo016
     * @tc.desc Verify at reads zero after map results overflow the Uint16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3);
      let mapped = arr.map((value: number): number => value * 65536);
      expect(mapped.at(0)).assertEqual(0);
      expect(mapped.at(1)).assertEqual(0);
      expect(mapped.at(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_TWO_0017
     * @tc.name testUint16ArrayAtTwo017
     * @tc.desc Verify the middle element remains at the same index after reversing an odd-length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      arr.reverse();
      expect(arr.at(0)).assertEqual(50);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(-1)).assertEqual(10);
    });

  });
}
