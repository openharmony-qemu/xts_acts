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

export default function uint32ArrayToSortedTwoTest(): void {
  describe('Uint32ArrayToSortedTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0100
     * @tc.name testUint32ArrayToSortedTwo001
     * @tc.desc Verify toSorted on empty array returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0200
     * @tc.name testUint32ArrayToSortedTwo002
     * @tc.desc Verify toSorted on single element returns sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = src.toSorted();
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0300
     * @tc.name testUint32ArrayToSortedTwo003
     * @tc.desc Verify toSorted returns ascending order for uint32 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 0, 2147483647);
      const result = src.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0400
     * @tc.name testUint32ArrayToSortedTwo004
     * @tc.desc Verify toSorted preserves already sorted sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.toSorted();
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0500
     * @tc.name testUint32ArrayToSortedTwo005
     * @tc.desc Verify 11. toSorted() preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295);
      const result = src.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0600
     * @tc.name testUint32ArrayToSortedTwo006
     * @tc.desc Verify 12. toSorted() preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(8);
      for (let i = 0; i < 8; i++) {
        src.$_set(i, (7 - i) * 3);
      }
      const result = src.toSorted();
      expect(result.length).assertEqual(8);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(7)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0700
     * @tc.name testUint32ArrayToSortedTwo007
     * @tc.desc Verify 13. toSorted() buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0800
     * @tc.name testUint32ArrayToSortedTwo008
     * @tc.desc Verify 15. toSorted() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const a = src.toSorted();
      const b = src.toSorted();
      const sameBuffer = b.buffer === a.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_0900
     * @tc.name testUint32ArrayToSortedTwo009
     * @tc.desc Verify 18. toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      src.$_set(1, 888);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1000
     * @tc.name testUint32ArrayToSortedTwo010
     * @tc.desc Verify 19. toSorted() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 5, 7);
      const result = src.toSorted();
      result.$_set(2, 777);
      expect(result.$_get(2)).assertEqual(777);
      expect(src.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1100
     * @tc.name testUint32ArrayToSortedTwo011
     * @tc.desc Verify 20. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 2, 1);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1200
     * @tc.name testUint32ArrayToSortedTwo012
     * @tc.desc Verify 22. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 3, 1, 4, 2);
      const result = src.toSorted();
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1300
     * @tc.name testUint32ArrayToSortedTwo013
     * @tc.desc Verify 23. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 4);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1400
     * @tc.name testUint32ArrayToSortedTwo014
     * @tc.desc Verify 24. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 2, 3, 1);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1500
     * @tc.name testUint32ArrayToSortedTwo015
     * @tc.desc Verify 26. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(123);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1600
     * @tc.name testUint32ArrayToSortedTwo016
     * @tc.desc Verify 27. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 3, 1);
      const result = src.toSorted();
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1700
     * @tc.name testUint32ArrayToSortedTwo017
     * @tc.desc Verify 28. uint32.MAX (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 1);
      const result = src.toSorted();
      expect(result.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1800
     * @tc.name testUint32ArrayToSortedTwo018
     * @tc.desc Verify 30. 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0x80000000, 1, 0);
      const result = src.toSorted();
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_1900
     * @tc.name testUint32ArrayToSortedTwo019
     * @tc.desc Verify 32. 0 MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295, 0, 4294967295);
      const result = src.toSorted();
      expect(result.$_get(1)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2000
     * @tc.name testUint32ArrayToSortedTwo020
     * @tc.desc Verify 35. [0, MAX, int32.MAX, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295, 2147483647, 1);
      const result = src.toSorted();
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2100
     * @tc.name testUint32ArrayToSortedTwo021
     * @tc.desc Verify 36. toSorted() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.toSorted();
      expect(result.length).assertEqual(0);
      expect(src.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2200
     * @tc.name testUint32ArrayToSortedTwo022
     * @tc.desc Verify 38. 4294967295 toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2300
     * @tc.name testUint32ArrayToSortedTwo023
     * @tc.desc Verify 39. 0 toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2400
     * @tc.name testUint32ArrayToSortedTwo024
     * @tc.desc Verify 44. toSorted() length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 3, 1, 4, 2);
      const result = src.toSorted();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2500
     * @tc.name testUint32ArrayToSortedTwo025
     * @tc.desc Verify 46. toSorted() byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2600
     * @tc.name testUint32ArrayToSortedTwo026
     * @tc.desc Verify 47. toSorted() byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.toSorted();
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2700
     * @tc.name testUint32ArrayToSortedTwo027
     * @tc.desc Verify 48. toSorted() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = src.toSorted();
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2800
     * @tc.name testUint32ArrayToSortedTwo028
     * @tc.desc Verify 49. toSorted() byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 2, 3, 1);
      const result = src.toSorted();
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_2900
     * @tc.name testUint32ArrayToSortedTwo029
     * @tc.desc Verify 50. toSorted() byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 3, 1, 4, 2);
      const result = src.toSorted();
      expect(result.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3000
     * @tc.name testUint32ArrayToSortedTwo030
     * @tc.desc Verify 52. toSorted() byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted();
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3100
     * @tc.name testUint32ArrayToSortedTwo031
     * @tc.desc Verify 53. toSorted() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.toSorted();
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3200
     * @tc.name testUint32ArrayToSortedTwo032
     * @tc.desc Verify 59. toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 3, 1, 4, 2);
      const result = src.toSorted();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
      expect(src.$_get(2)).assertEqual(1);
      expect(src.length).assertEqual(5);
      expect(src.byteLength).assertEqual(20);
      expect(src.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3300
     * @tc.name testUint32ArrayToSortedTwo033
     * @tc.desc Verify 65. toSorted() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 3, 5);
      const bufBefore = src.buffer;
      src.toSorted();
      const sameBuffer: boolean = src.buffer === bufBefore;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3400
     * @tc.name testUint32ArrayToSortedTwo034
     * @tc.desc Verify 66. toSorted().toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted().toSorted();
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3500
     * @tc.name testUint32ArrayToSortedTwo035
     * @tc.desc Verify 68. toSorted().length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 2, 3, 1);
      expect(src.toSorted().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3600
     * @tc.name testUint32ArrayToSortedTwo036
     * @tc.desc Verify 69. toSorted().slice(0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4, 2, 3, 1);
      const result = src.toSorted().slice(0, 2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3700
     * @tc.name testUint32ArrayToSortedTwo037
     * @tc.desc Verify 71. toSorted().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.toSorted().reverse();
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_TWO_3800
     * @tc.name testUint32ArrayToSortedTwo038
     * @tc.desc Verify 73. toSorted() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, 99 - i);
      }
      const result = src.toSorted();
      expect(result.length).assertEqual(100);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(50)).assertEqual(50);
      expect(result.$_get(99)).assertEqual(99);
      expect(result.byteLength).assertEqual(400);
      expect(src.$_get(0)).assertEqual(99);
      expect(src.$_get(99)).assertEqual(0);
    });

  });
}
