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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayToReversedTwoTest(): void {
  describe('Uint32ArrayToReversedTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0100
     * @tc.name testUint32ArrayToReversedTwo001
     * @tc.desc Verify toReversed() reverses element order for a 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.toReversed();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(30);
      expect(result.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0200
     * @tc.name testUint32ArrayToReversedTwo002
     * @tc.desc Verify toReversed() preserves length for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(99);
      const result = src.toReversed();
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0300
     * @tc.name testUint32ArrayToReversedTwo003
     * @tc.desc Verify toReversed() reverses order for a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 6);
      const result = src.toReversed();
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(6);
      expect(result.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0400
     * @tc.name testUint32ArrayToReversedTwo004
     * @tc.desc Verify toReversed() preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295);
      const result = src.toReversed();
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0500
     * @tc.name testUint32ArrayToReversedTwo005
     * @tc.desc Verify toReversed() preserves length for a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.toReversed();
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0600
     * @tc.name testUint32ArrayToReversedTwo006
     * @tc.desc Verify toReversed() returns a new buffer independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed();
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0700
     * @tc.name testUint32ArrayToReversedTwo007
     * @tc.desc Verify toReversed() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const a = src.toReversed();
      const b = src.toReversed();
      const sameBuffer = b.buffer === a.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0800
     * @tc.name testUint32ArrayToReversedTwo008
     * @tc.desc Verify toReversed() result mutation does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed();
      result.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_0900
     * @tc.name testUint32ArrayToReversedTwo009
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed();
      src.$_set(1, 888);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1000
     * @tc.name testUint32ArrayToReversedTwo010
     * @tc.desc Verify toReversed() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const result = src.toReversed();
      result.$_set(2, 777);
      expect(result.$_get(2)).assertEqual(777);
      expect(src.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1100
     * @tc.name testUint32ArrayToReversedTwo011
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33);
      const result = src.toReversed();
      expect(result.$_get(1)).assertEqual(22);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1200
     * @tc.name testUint32ArrayToReversedTwo012
     * @tc.desc Verify toReversed() i length-1-i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.toReversed();
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1300
     * @tc.name testUint32ArrayToReversedTwo013
     * @tc.desc Verify uint32.MAX (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 4294967295);
      const result = src.toReversed();
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1400
     * @tc.name testUint32ArrayToReversedTwo014
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 2);
      const result = src.toReversed();
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1500
     * @tc.name testUint32ArrayToReversedTwo015
     * @tc.desc Verify 2147483647 (int32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2147483647);
      const result = src.toReversed();
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1600
     * @tc.name testUint32ArrayToReversedTwo016
     * @tc.desc Verify toReversed() on four-element array with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295, 1);
      const result = src.toReversed();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1700
     * @tc.name testUint32ArrayToReversedTwo017
     * @tc.desc Verify toReversed() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1800
     * @tc.name testUint32ArrayToReversedTwo018
     * @tc.desc Verify 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295, 0, 4294967295);
      const result = src.toReversed();
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_1900
     * @tc.name testUint32ArrayToReversedTwo019
     * @tc.desc Verify toReversed() length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.toReversed();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2000
     * @tc.name testUint32ArrayToReversedTwo020
     * @tc.desc Verify toReversed() byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed();
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2100
     * @tc.name testUint32ArrayToReversedTwo021
     * @tc.desc Verify toReversed() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = src.toReversed();
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2200
     * @tc.name testUint32ArrayToReversedTwo022
     * @tc.desc Verify toReversed() byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.toReversed();
      expect(result.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2300
     * @tc.name testUint32ArrayToReversedTwo023
     * @tc.desc Verify toReversed() byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed();
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2400
     * @tc.name testUint32ArrayToReversedTwo024
     * @tc.desc Verify toReversed() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      const result = src.toReversed();
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2500
     * @tc.name testUint32ArrayToReversedTwo025
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300);
      src.toReversed();
      expect(src.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2600
     * @tc.name testUint32ArrayToReversedTwo026
     * @tc.desc Verify toReversed().slice(0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.toReversed().slice(0, 2);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2700
     * @tc.name testUint32ArrayToReversedTwo027
     * @tc.desc Verify toReversed().join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      expect(src.toReversed().join()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2800
     * @tc.name testUint32ArrayToReversedTwo028
     * @tc.desc Verify toReversed().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.toReversed().reverse();
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_2900
     * @tc.name testUint32ArrayToReversedTwo029
     * @tc.desc Verify toReversed() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      const result = src.toReversed();
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_3000
     * @tc.name testUint32ArrayToReversedTwo030
     * @tc.desc Verify toReversed() byteLength 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      const result = src.toReversed();
      expect(result.byteLength).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_3100
     * @tc.name testUint32ArrayToReversedTwo031
     * @tc.desc Verify toReversed() on a subarray view returns an independent copy with a separate buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const view = src.subarray(1, 3);
      const result = view.toReversed();
      expect(result.buffer === view.buffer).assertFalse();
      expect(result.$_get(0)).assertEqual(30);
      expect(result.$_get(1)).assertEqual(20);
      result.$_set(0, 999);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_TWO_3200
     * @tc.name testUint32ArrayToReversedTwo032
     * @tc.desc Verify toReversed() fully reverses a boundary value array 0 int32.MAX uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295);
      const result = src.toReversed();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(2147483647);
      expect(result.$_get(2)).assertEqual(0);
    });

  });
}
