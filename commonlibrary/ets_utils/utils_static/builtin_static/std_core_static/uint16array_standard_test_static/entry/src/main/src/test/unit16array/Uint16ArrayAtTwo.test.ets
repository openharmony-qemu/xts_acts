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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0100
     * @tc.name testUint16ArrayAt02_001
     * @tc.desc Verify reverse() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      arr.reverse();
      expect(arr.at(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0200
     * @tc.name testUint16ArrayAt02_002
     * @tc.desc Verify reverse() at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      arr.reverse();
      expect(arr.at(-1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0300
     * @tc.name testUint16ArrayAt02_003
     * @tc.desc Verify sort() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(50, 10, 30, 20, 40);
      arr.sort();
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0400
     * @tc.name testUint16ArrayAt02_004
     * @tc.desc Verify sort() at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(50, 10, 30, 20, 40);
      arr.sort();
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0500
     * @tc.name testUint16ArrayAt02_005
     * @tc.desc Verify set([99, 100], 0) at(0) 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.set([99, 100], 0);
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0600
     * @tc.name testUint16ArrayAt02_006
     * @tc.desc Verify set([99, 100], 0) at(1) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.set([99, 100], 0);
      expect(arr.at(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0700
     * @tc.name testUint16ArrayAt02_007
     * @tc.desc Verify copyWithin(0, 1) at(0) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let original = 20;
      arr.copyWithin(0, 1);
      expect(arr.at(0)).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0800
     * @tc.name testUint16ArrayAt02_008
     * @tc.desc Verify copyWithin(0, 2) at(0) at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let original = 30;
      arr.copyWithin(0, 2);
      expect(arr.at(0)).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_0900
     * @tc.name testUint16ArrayAt02_009
     * @tc.desc Verify subarray(1, 3) at(0) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 3);
      expect(sub.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_1000
     * @tc.name testUint16ArrayAt02_010
     * @tc.desc Verify subarray(1, 3) at(-1) at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 3);
      expect(sub.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_1100
     * @tc.name testUint16ArrayAt02_011
     * @tc.desc Verify map(x => x * 2) at(0) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let mapped = arr.map((x: number): number => x * 2);
      expect(mapped.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_1200
     * @tc.name testUint16ArrayAt02_012
     * @tc.desc Verify map(x => x + 1) at(-1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let mapped = arr.map((x: number): number => x + 1);
      expect(mapped.at(-1)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT02_1300
     * @tc.name testUint16ArrayAt02_013
     * @tc.desc Verify at reads DataView mutations within an offset view and rejects backing elements outside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

  });
}
