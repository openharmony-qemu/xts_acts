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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayoverallthreeTest(): void {
  describe('Uint16Arrayoverallthree', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0100
     * @tc.name testUint16Arrayoverallthree001
      * @tc.desc Throws RangeError when $_get receives index negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(19, 246, 73);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0200
     * @tc.name testUint16Arrayoverallthree002
      * @tc.desc Throws RangeError when $_get receives index three on a three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(184, 37, 91);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0300
     * @tc.name testUint16Arrayoverallthree003
      * @tc.desc Throws RangeError when $_get receives a large negative index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(127, 44, 239);
      try {
        arr.$_get(-100000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0400
     * @tc.name testUint16Arrayoverallthree004
      * @tc.desc Throws RangeError and preserves data for a large negative $_set index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(83, 5, 176);
      try {
        arr.$_set(-100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0500
     * @tc.name testUint16Arrayoverallthree005
      * @tc.desc Throws IndexOutOfBoundsError when with receives index four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(221, 64, 12);
      try {
        arr.with(4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0600
     * @tc.name testUint16Arrayoverallthree006
      * @tc.desc Throws IndexOutOfBoundsError when with receives index negative four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(35, 198, 112);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0700
     * @tc.name testUint16Arrayoverallthree007
      * @tc.desc Throws RangeError for a negative source set offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      const src = Uint16Array.of(1, 2);
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0800
     * @tc.name testUint16Arrayoverallthree008
      * @tc.desc Throws RangeError when a source set offset equals the destination length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      const src = Uint16Array.of(1);
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_0900
     * @tc.name testUint16Arrayoverallthree009
      * @tc.desc Throws RangeError when a source set offset exceeds the destination length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      const src = Uint16Array.of(1);
      try {
        arr.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1000
     * @tc.name testUint16Arrayoverallthree010
      * @tc.desc Copies elements up to the final excluded index with copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 1, -1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1100
     * @tc.name testUint16Arrayoverallthree011
      * @tc.desc Leaves the final element unchanged when fill ends at negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.fill(99, 0, -1);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1200
     * @tc.name testUint16Arrayoverallthree012
      * @tc.desc Leaves the array unchanged when fill starts at its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.fill(99, 4);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1300
     * @tc.name testUint16Arrayoverallthree013
      * @tc.desc Clamps a large negative fill start to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.fill(99, -100, 2);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1400
     * @tc.name testUint16Arrayoverallthree014
      * @tc.desc Returns false when includes starts far beyond the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(146, 28, 207);
      const result = arr.includes(146, 100000);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1500
     * @tc.name testUint16Arrayoverallthree015
      * @tc.desc Clamps an overly negative indexOf start to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(17, 159, 88);
      const result = arr.indexOf(17, -4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1600
     * @tc.name testUint16Arrayoverallthree016
      * @tc.desc Returns negative one when indexOf starts far beyond the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(232, 49, 104);
      const result = arr.indexOf(232, 100000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1700
     * @tc.name testUint16Arrayoverallthree017
      * @tc.desc Clamps a length-sized lastIndexOf start to the final index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 10);
      const result = arr.lastIndexOf(10, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1800
     * @tc.name testUint16Arrayoverallthree018
      * @tc.desc Clamps an oversized lastIndexOf start to the final index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 10);
      const result = arr.lastIndexOf(10, 100000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_1900
     * @tc.name testUint16Arrayoverallthree019
      * @tc.desc Slices the final element into an independent copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(66, 175, 23);
      const result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(23);
      result.$_set(0, 99);
      expect(arr.$_get(2)).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2000
     * @tc.name testUint16Arrayoverallthree020
      * @tc.desc Slices through the penultimate element into an independent copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(193, 42, 118);
      const result = arr.slice(0, -1);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(193);
      expect(result.$_get(1)).assertEqual(42);
      result.$_set(1, 99);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2100
     * @tc.name testUint16Arrayoverallthree021
      * @tc.desc Returns an empty slice when begin equals the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(9, 154, 67);
      const result = arr.slice(3);
      expect(result.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2200
     * @tc.name testUint16Arrayoverallthree022
      * @tc.desc Clamps an oversized slice end and returns an independent full copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(214, 31, 96);
      const result = arr.slice(0, 10);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(214);
      expect(result.$_get(2)).assertEqual(96);
      result.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(214);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2300
     * @tc.name testUint16Arrayoverallthree023
      * @tc.desc Creates a final-element subarray that shares the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(72, 11, 187);
      const result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(187);
      result.$_set(0, 99);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2400
     * @tc.name testUint16Arrayoverallthree024
      * @tc.desc Creates a subarray through the penultimate element sharing the buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(136, 59, 224);
      const result = arr.subarray(0, -1);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(136);
      expect(result.$_get(1)).assertEqual(59);
      result.$_set(1, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2500
     * @tc.name testUint16Arrayoverallthree025
      * @tc.desc Returns an empty subarray when begin equals the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(25, 201, 77);
      const result = arr.subarray(3);
      expect(result.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(25);
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2600
     * @tc.name testUint16Arrayoverallthree026
      * @tc.desc Clamps a large negative subarray begin to zero and shares the buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(167, 14, 109);
      const result = arr.subarray(-100, 2);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(167);
      expect(result.$_get(1)).assertEqual(14);
      result.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2700
     * @tc.name testUint16Arrayoverallthree027
      * @tc.desc Throws TypeError when reduce lacks an initial value on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint16Array();
      try {
        empty.reduce((acc, val) => acc + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2800
     * @tc.name testUint16Arrayoverallthree028
      * @tc.desc Throws TypeError when reduceRight lacks an initial value on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint16Array();
      try {
        empty.reduceRight((acc, val) => acc + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_2900
     * @tc.name testUint16Arrayoverallthree029
      * @tc.desc Propagates an Error thrown by a forEach callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(52, 190, 8);
      try {
        arr.forEach((value, index) => {
          if (index === 1) {
            throw new Error("callback error");
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3000
     * @tc.name testUint16Arrayoverallthree030
      * @tc.desc Propagates an Error thrown by a map callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(245, 36, 121);
      try {
        arr.map((value, index) => {
          if (index === 1) {
            throw new Error("callback error");
          }
          return value + 1;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3100
     * @tc.name testUint16Arrayoverallthree031
      * @tc.desc Propagates an Error thrown by a filter callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(89, 163, 27);
      try {
        arr.filter((value, index) => {
          if (index === 1) {
            throw new Error("callback error");
          }
          return value > 10;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3200
     * @tc.name testUint16Arrayoverallthree032
      * @tc.desc Propagates an Error thrown by an every callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(208, 47, 135);
      try {
        arr.every((value, index) => {
          if (index === 1) {
            throw new Error("callback error");
          }
          return value > 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3300
     * @tc.name testUint16Arrayoverallthree033
      * @tc.desc Propagates an Error thrown by a reduce callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(13, 221, 74);
      try {
        arr.reduce<number>((acc, val, idx) => {
          if (idx === 1) {
            throw new Error("callback error");
          }
          return acc + val;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3400
     * @tc.name testUint16Arrayoverallthree034
      * @tc.desc Propagates an Error thrown by a sort comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(30, 10, 20);
      try {
        arr.sort((a: number, b: number): int => {
          if (a === 10) {
            throw new Error("callback error");
          }
          return (a - b).toInt();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3500
     * @tc.name testUint16Arrayoverallthree035
      * @tc.desc Returns false when some is called on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint16Array();
      const result = empty.some((value) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3600
     * @tc.name testUint16Arrayoverallthree036
      * @tc.desc Returns an empty Uint16Array when map is called on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint16Array();
      const result = empty.map((value) => value + 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3700
     * @tc.name testUint16Arrayoverallthree037
      * @tc.desc Reduces right-to-left without an initial value using callback indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint16Array = Uint16Array.of(1, 2, 3);
      let previousValues: number[] = [];
      let currentValues: number[] = [];
      let indexes: int[] = [];
      const result: number = values.reduceRight((prev: number, curr: number, idx: int, a: Uint16Array): number => {
        previousValues.push(prev);
        currentValues.push(curr);
        indexes.push(idx);
        expect(a).assertEqual(values);
        return prev * 10 + curr;
      });
      expect(result).assertEqual(321);
      expect(previousValues[0]).assertEqual(3);
      expect(currentValues[0]).assertEqual(2);
      expect(indexes.join(',')).assertEqual('1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3800
     * @tc.name testUint16Arrayoverallthree038
      * @tc.desc Returns true when some finds a filled value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.fill(7);
      const result = arr.some((value) => value === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_3900
     * @tc.name testUint16Arrayoverallthree039
      * @tc.desc Returns zero for the first occurrence of a filled value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.fill(7);
      const result = arr.indexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4000
     * @tc.name testUint16Arrayoverallthree040
      * @tc.desc Wraps 65536 to zero when assigned with $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.$_set(0, 65536);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4100
     * @tc.name testUint16Arrayoverallthree041
      * @tc.desc Truncates a fractional value when assigned with $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr.$_set(0, 3.14);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4200
     * @tc.name testUint16Arrayoverallthree042
      * @tc.desc Wraps 65536 to zero when filling every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.fill(65536);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4300
     * @tc.name testUint16Arrayoverallthree043
      * @tc.desc Wraps negative one to 65535 when filling every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(65535);
      expect(arr.$_get(1)).assertEqual(65535);
      expect(arr.$_get(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4400
     * @tc.name testUint16Arrayoverallthree044
      * @tc.desc Sums all Uint16Array values with forEach
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(155, 22, 196);
      let sum: number = 0;
      arr.forEach((value) => {
        sum = sum + value;
      });
      expect(sum).assertEqual(373);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4500
     * @tc.name testUint16Arrayoverallthree045
      * @tc.desc Maps each element to twice its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(38, 172, 85);
      const mapped = arr.map((value) => value * 2);
      expect(mapped.$_get(0)).assertEqual(76);
      expect(mapped.$_get(1)).assertEqual(344);
      expect(mapped.$_get(2)).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4600
     * @tc.name testUint16Arrayoverallthree046
      * @tc.desc Filters values above twenty then reduces them to their sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const filtered = arr.filter((value) => value > 20);
      const result = filtered.reduce<number>((acc, val) => acc + val, 0);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4700
     * @tc.name testUint16Arrayoverallthree047
      * @tc.desc Joins values with a hyphen separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(118, 7, 203);
      const result = arr.join("-");
      expect(result).assertEqual("118-7-203");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4800
     * @tc.name testUint16Arrayoverallthree048
      * @tc.desc Iterates entries whose values match their source indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(241, 63, 16);
      let count: number = 0;
      for (const entry of arr.entries()) {
        expect(entry[1]).assertEqual(arr.$_get(entry[0]));
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_4900
     * @tc.name testUint16Arrayoverallthree049
      * @tc.desc Iterates sequential numeric keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(94, 184, 33);
      let idx: number = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(idx);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5000
     * @tc.name testUint16Arrayoverallthree050
      * @tc.desc Iterates values in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(219, 45, 128);
      const expected: FixedArray<number> = [219, 45, 128];
      let idx: int = 0;
      for (const value of arr.values()) {
        expect(value).assertEqual(expected[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5100
     * @tc.name testUint16Arrayoverallthree051
      * @tc.desc Iterates Uint16Array values with the default iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(61, 197, 24);
      let sum: number = 0;
      for (const value of arr) {
        sum = sum + value;
      }
      expect(sum).assertEqual(282);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5200
     * @tc.name testUint16Arrayoverallthree052
      * @tc.desc Throws RangeError for a large positive $_get index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(131, 29, 205);
      try {
        arr.$_get(100000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5300
     * @tc.name testUint16Arrayoverallthree053
      * @tc.desc Throws RangeError for $_set at index negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(48, 158, 82);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5400
     * @tc.name testUint16Arrayoverallthree054
      * @tc.desc Throws RangeError for $_set at the exact source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(227, 71, 15);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5500
     * @tc.name testUint16Arrayoverallthree055
      * @tc.desc Throws RangeError for a large positive $_set index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(173, 12, 99);
      try {
        arr.$_set(100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5600
     * @tc.name testUint16Arrayoverallthree056
      * @tc.desc Returns undefined for at at the exact source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(116, 26, 191);
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5700
     * @tc.name testUint16Arrayoverallthree057
      * @tc.desc Returns undefined for at beyond the source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(7, 162, 84);
      const result = arr.at(4);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5800
     * @tc.name testUint16Arrayoverallthree058
      * @tc.desc Returns undefined for at below the negative source bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(201, 57, 132);
      const result = arr.at(-4);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_5900
     * @tc.name testUint16Arrayoverallthree059
      * @tc.desc Returns undefined for at with a large positive index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(43, 225, 69);
      const result = arr.at(100000);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6000
     * @tc.name testUint16Arrayoverallthree060
      * @tc.desc Returns undefined for at with a large negative index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(157, 34, 108);
      const result = arr.at(-100000);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6100
     * @tc.name testUint16Arrayoverallthree061
      * @tc.desc Verifies Uint16Array.with replaces the last element for index negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(92, 183, 21);
      const result = arr.with(-1, 99);
      expect(result[0]).assertEqual(92);
      expect(result[1]).assertEqual(183);
      expect(result[2]).assertEqual(99);
      expect(arr[2]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6200
     * @tc.name testUint16Arrayoverallthree062
      * @tc.desc Throws IndexOutOfBoundsError for with at the exact source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(238, 46, 125);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6300
     * @tc.name testUint16Arrayoverallthree063
      * @tc.desc Throws IndexOutOfBoundsError for with below the negative source bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(149, 62, 214);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6400
     * @tc.name testUint16Arrayoverallthree064
      * @tc.desc Throws RangeError when scalar set targets index negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      try {
        arr.set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6500
     * @tc.name testUint16Arrayoverallthree065
      * @tc.desc Throws RangeError when scalar set targets a large positive index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      try {
        arr.set(100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_03_6600
     * @tc.name testUint16Arrayoverallthree066
      * @tc.desc Throws RangeError when an oversized source does not fit the destination
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayoverallthree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      const src = Uint16Array.of(1, 2, 3);
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
