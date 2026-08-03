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

export default function uint16ArrayFindIndex02Test(): void {
  describe('Uint16ArrayFindIndex02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0100
     * @tc.name testUint16ArrayFindIndexTwo001
     * @tc.desc Verify false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0200
     * @tc.name testUint16ArrayFindIndexTwo002
     * @tc.desc Verify findIndex returns the index of an exact value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0300
     * @tc.name testUint16ArrayFindIndexTwo003
     * @tc.desc Verify findIndex returns the first index within a value range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0 && value < 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0400
     * @tc.name testUint16ArrayFindIndexTwo004
     * @tc.desc Verify findIndex returns the first index matching multiple alternatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0 || value === 20;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0500
     * @tc.name testUint16ArrayFindIndexTwo005
     * @tc.desc Verify findIndex locates a matching value in a longer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 40;
      });
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0600
     * @tc.name testUint16ArrayFindIndexTwo006
     * @tc.desc Verify index 5 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0, 0, 0, 99);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0700
     * @tc.name testUint16ArrayFindIndexTwo007
     * @tc.desc Verify int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 2;
      });
      const check: int = result;
      expect(check).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0800
     * @tc.name testUint16ArrayFindIndexTwo008
     * @tc.desc Verify 65536 0 , value===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_0900
     * @tc.name testUint16ArrayFindIndexTwo009
     * @tc.desc Verify -1 65535 , value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = -1;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1000
     * @tc.name testUint16ArrayFindIndexTwo010
     * @tc.desc Verify 0x1FFFF 65535 , value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 0x1FFFF;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1100
     * @tc.name testUint16ArrayFindIndexTwo011
     * @tc.desc Verify NaN 0 , value===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = Number.NaN;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1200
     * @tc.name testUint16ArrayFindIndexTwo012
     * @tc.desc Verify 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0xFF);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 255;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1300
     * @tc.name testUint16ArrayFindIndexTwo013
     * @tc.desc Verify 0o777 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0o777);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 511;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1400
     * @tc.name testUint16ArrayFindIndexTwo014
     * @tc.desc Verify 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0b1010);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1500
     * @tc.name testUint16ArrayFindIndexTwo015
     * @tc.desc Verify 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1e4);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10000;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1600
     * @tc.name testUint16ArrayFindIndexTwo016
     * @tc.desc Verify [0, 65535, 32768] value>0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1700
     * @tc.name testUint16ArrayFindIndexTwo017
     * @tc.desc Verify [0, 65535, 32768] value>=65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value >= 65535;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1800
     * @tc.name testUint16ArrayFindIndexTwo018
     * @tc.desc Verify [0, 65535, 32768] value===32768 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 32768;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_1900
     * @tc.name testUint16ArrayFindIndexTwo019
     * @tc.desc Verify Uint16Array.from FixedArray findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: Array<number> = [10, 20, 30, 40];
      const arr = Uint16Array.from(src);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2000
     * @tc.name testUint16ArrayFindIndexTwo020
     * @tc.desc Verify Uint16Array.from findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src = Uint16Array.of(5, 10, 15, 20);
      const arr = Uint16Array.from(src);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 15;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2100
     * @tc.name testUint16ArrayFindIndexTwo021
     * @tc.desc Verify [65535,65535,0] !=65535 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value !== 65535;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2200
     * @tc.name testUint16ArrayFindIndexTwo022
     * @tc.desc Verify value >= 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value >= 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2300
     * @tc.name testUint16ArrayFindIndexTwo023
     * @tc.desc Verify [0,0,5] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2400
     * @tc.name testUint16ArrayFindIndexTwo024
     * @tc.desc Verify [0,5,0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 5, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2500
     * @tc.name testUint16ArrayFindIndexTwo025
     * @tc.desc Verify [1..10] value===5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2600
     * @tc.name testUint16ArrayFindIndexTwo026
     * @tc.desc Verify [1..10] value>7 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 7;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2700
     * @tc.name testUint16ArrayFindIndexTwo027
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      try {
        arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
          throw new RangeError("out of range");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2800
     * @tc.name testUint16ArrayFindIndexTwo028
     * @tc.desc Verify TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      try {
        arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
          throw new TypeError("type error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_2900
     * @tc.name testUint16ArrayFindIndexTwo029
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const original: string = arr.join(",");
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(arr.join(",")).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3000
     * @tc.name testUint16ArrayFindIndexTwo030
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const original: string = arr.join(",");
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 100;
      });
      expect(arr.join(",")).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3100
     * @tc.name testUint16ArrayFindIndexTwo031
     * @tc.desc Verify findIndex on Uint16Array.from with mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from(Array.of<number>(1.0, 2.0, 3.0), (x: number) => x * 10);
      const result: int = arr.findIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3200
     * @tc.name testUint16ArrayFindIndexTwo032
     * @tc.desc Verify findIndex on Uint16Array.of with multiple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768, 12345);
      const result: int = arr.findIndex((value: number): boolean => value === 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3300
     * @tc.name testUint16ArrayFindIndexTwo033
     * @tc.desc Verify findIndex on array created from ArrayBuffer with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(12);
      const arr = new Uint16Array(buffer, 4, 3);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      const result: int = arr.findIndex((value: number): boolean => value === 200);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3400
     * @tc.name testUint16ArrayFindIndexTwo034
     * @tc.desc Verify findIndex empty receiver returns minus one without callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let result: int = new Uint16Array().findIndex((value: number): boolean => {
        count++;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3500
     * @tc.name testUint16ArrayFindIndexTwo035
     * @tc.desc Verify findIndex first matching index is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(2, 4, 6).findIndex((value: number): boolean => value >= 4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3600
     * @tc.name testUint16ArrayFindIndexTwo036
     * @tc.desc Verify findIndex no match visits the full receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let result: int = Uint16Array.of(1, 2, 3).findIndex((value: number): boolean => {
        count++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3700
     * @tc.name testUint16ArrayFindIndexTwo037
     * @tc.desc Verify findIndex mutation of a later element can create a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = source.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        if (index === 0) {
          array[1] = 20;
        }
        return value > 10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_TWO_3800
     * @tc.name testUint16ArrayFindIndexTwo038
     * @tc.desc Verify findIndex offset view reports a view-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      expect(view.findIndex((value: number): boolean => value === 3)).assertEqual(1);
    });

  })
}