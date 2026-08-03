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

export default function uint16ArrayWithPart2Test(): void {

    describe('Uint16ArrayWithPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0100
     * @tc.name testUint16ArrayWithPart001
      * @tc.desc Replaces the middle value in a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2717, 3919, 5323);
      const result: Uint16Array = arr.with(1, 500);
      expect(result.length).assertEqual(3);
      expect(result[1]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0200
     * @tc.name testUint16ArrayWithPart002
      * @tc.desc Replaces the sole value in a single-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(42);
      const result: Uint16Array = arr.with(0, 999);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0300
     * @tc.name testUint16ArrayWithPart003
      * @tc.desc Replaces index zero in a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2734, 3938, 5346);
      const result: Uint16Array = arr.with(0, 99);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0400
     * @tc.name testUint16ArrayWithPart004
      * @tc.desc Replaces the last index of a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2751, 3957, 5369);
      const result: Uint16Array = arr.with(2, 99);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0500
     * @tc.name testUint16ArrayWithPart005
      * @tc.desc Replaces the first value in a two-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20);
      const result: Uint16Array = arr.with(0, 77);
      expect(result[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0600
     * @tc.name testUint16ArrayWithPart006
      * @tc.desc Replaces the first value in a five-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.with(0, 88);
      expect(result[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0700
     * @tc.name testUint16ArrayWithPart007
      * @tc.desc Replaces index zero in a 100-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
for (let i: int = 0;
i < 100;
i++) {
        src.push(i);

      }
      const arr: Uint16Array = Uint16Array.from(src);
      const result: Uint16Array = arr.with(0, 999);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0800
     * @tc.name testUint16ArrayWithPart008
      * @tc.desc Stores zero through a replacement operation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2768, 3976, 5392);
      const result: Uint16Array = arr.with(0, 0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_0900
     * @tc.name testUint16ArrayWithPart009
      * @tc.desc Stores the maximum Uint16 value through replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2785, 3995, 5415);
      const result: Uint16Array = arr.with(0, 65535);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1000
     * @tc.name testUint16ArrayWithPart010
      * @tc.desc Stores one through a replacement operation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2802, 4014, 5438);
      const result: Uint16Array = arr.with(0, 1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1100
     * @tc.name testUint16ArrayWithPart011
      * @tc.desc Stores decimal 32768 through replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2819, 4033, 5461);
      const result: Uint16Array = arr.with(0, 32768);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1200
     * @tc.name testUint16ArrayWithPart012
      * @tc.desc Wraps 131072 to zero during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2836, 4052, 5484);
      const result: Uint16Array = arr.with(0, 131072);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1300
     * @tc.name testUint16ArrayWithPart013
      * @tc.desc Wraps 196608 to zero during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2853, 4071, 5507);
      const result: Uint16Array = arr.with(0, 196608);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1400
     * @tc.name testUint16ArrayWithPart014
      * @tc.desc Wraps negative 65536 to zero during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2870, 4090, 5530);
      const result: Uint16Array = arr.with(0, -65536);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1500
     * @tc.name testUint16ArrayWithPart015
      * @tc.desc Wraps negative 65535 to one during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2887, 4109, 5553);
      const result: Uint16Array = arr.with(0, -65535);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1600
     * @tc.name testUint16ArrayWithPart016
      * @tc.desc Converts negative 32768 to 32768 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2904, 4128, 5576);
      const result: Uint16Array = arr.with(0, -32768);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1700
     * @tc.name testUint16ArrayWithPart017
      * @tc.desc Truncates 3.14 to three during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2921, 4147, 5599);
      const result: Uint16Array = arr.with(0, 3.14);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1800
     * @tc.name testUint16ArrayWithPart018
      * @tc.desc Truncates 65535.9 to the Uint16 maximum.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2938, 4166, 5622);
      const result: Uint16Array = arr.with(0, 65535.9);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_1900
     * @tc.name testUint16ArrayWithPart019
      * @tc.desc Truncates fractional 0.999 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2955, 4185, 5645);
      const result: Uint16Array = arr.with(0, 0.999);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2000
     * @tc.name testUint16ArrayWithPart020
      * @tc.desc Truncates negative fractional minus 0.5 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2972, 4204, 5668);
      const result: Uint16Array = arr.with(0, -0.5);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2100
     * @tc.name testUint16ArrayWithPart021
      * @tc.desc Converts NaN to zero during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2989, 4223, 5691);
      const result: Uint16Array = arr.with(0, Number.NaN);
      expect(result[0]).assertEqual(0);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2200
     * @tc.name testUint16ArrayWithPart022
      * @tc.desc Converts negative infinity to zero during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3006, 4242, 5714);
      const result: Uint16Array = arr.with(0, -Number.POSITIVE_INFINITY);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2300
     * @tc.name testUint16ArrayWithPart023
      * @tc.desc Wraps scientific literal 1e5 to 34464.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3023, 4261, 5737);
      const result: Uint16Array = arr.with(0, 1e5);
      expect(result[0]).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2400
     * @tc.name testUint16ArrayWithPart024
      * @tc.desc Stores hexadecimal 0xFFFF through replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3040, 4280, 5760);
      const result: Uint16Array = arr.with(0, 0xFFFF);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2500
     * @tc.name testUint16ArrayWithPart025
      * @tc.desc Stores the all-ones binary Uint16 literal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3057, 4299, 5783);
      const result: Uint16Array = arr.with(0, 0b1111111111111111);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2600
     * @tc.name testUint16ArrayWithPart026
      * @tc.desc Stores hexadecimal 0x8000 through replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3074, 4318, 5806);
      const result: Uint16Array = arr.with(0, 0x8000);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2700
     * @tc.name testUint16ArrayWithPart027
      * @tc.desc Stores floating-point zero through replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3091, 4337, 5829);
      const result: Uint16Array = arr.with(0, 0.0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2800
     * @tc.name testUint16ArrayWithPart028
      * @tc.desc Truncates 1.5 to one during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3108, 4356, 5852);
      const result: Uint16Array = arr.with(0, 1.5);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_2900
     * @tc.name testUint16ArrayWithPart029
      * @tc.desc Truncates 32768.5 to 32768.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3125, 4375, 5875);
      const result: Uint16Array = arr.with(0, 32768.5);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3000
     * @tc.name testUint16ArrayWithPart030
      * @tc.desc Wraps four Uint16 ranges to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3142, 4394, 5898);
      const result: Uint16Array = arr.with(0, 262144);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3100
     * @tc.name testUint16ArrayWithPart031
      * @tc.desc Wraps five Uint16 ranges to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3159, 4413, 5921);
      const result: Uint16Array = arr.with(0, 327680);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3200
     * @tc.name testUint16ArrayWithPart032
      * @tc.desc Wraps negative 65537 to 65535 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3176, 4432, 5944);
      const result: Uint16Array = arr.with(0, -65537);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3300
     * @tc.name testUint16ArrayWithPart033
      * @tc.desc Wraps minus two to 65534 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3193, 4451, 5967);
      const result: Uint16Array = arr.with(0, -2);
      expect(result[0]).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3400
     * @tc.name testUint16ArrayWithPart034
      * @tc.desc Wraps minus three to 65533 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3210, 4470, 5990);
      const result: Uint16Array = arr.with(0, -3);
      expect(result[0]).assertEqual(65533);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3500
     * @tc.name testUint16ArrayWithPart035
      * @tc.desc Stores hexadecimal 0x100 as 256.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3227, 4489, 6013);
      const result: Uint16Array = arr.with(0, 0x100);
      expect(result[0]).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3600
     * @tc.name testUint16ArrayWithPart036
      * @tc.desc Stores the high-bit binary Uint16 literal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3244, 4508, 6036);
      const result: Uint16Array = arr.with(0, 0b1000000000000000);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3700
     * @tc.name testUint16ArrayWithPart037
      * @tc.desc Wraps 98304 to 32768 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3261, 4527, 6059);
      const result: Uint16Array = arr.with(0, 98304);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3800
     * @tc.name testUint16ArrayWithPart038
      * @tc.desc Wraps 131071 to 65535 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3278, 4546, 6082);
      const result: Uint16Array = arr.with(0, 131071);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_3900
     * @tc.name testUint16ArrayWithPart039
      * @tc.desc Wraps 131073 to one during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3295, 4565, 6105);
      const result: Uint16Array = arr.with(0, 131073);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4000
     * @tc.name testUint16ArrayWithPart040
      * @tc.desc Wraps 0xFFFF plus one to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3312, 4584, 6128);
      const result: Uint16Array = arr.with(0, 0xFFFF + 1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4100
     * @tc.name testUint16ArrayWithPart041
      * @tc.desc Wraps 0xFFFF plus two to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3329, 4603, 6151);
      const result: Uint16Array = arr.with(0, 0xFFFF + 2);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4200
     * @tc.name testUint16ArrayWithPart042
      * @tc.desc Wraps negative 65534 to two during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3346, 4622, 6174);
      const result: Uint16Array = arr.with(0, -65534);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4300
     * @tc.name testUint16ArrayWithPart043
      * @tc.desc Wraps negative 65533 to three during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3363, 4641, 6197);
      const result: Uint16Array = arr.with(0, -65533);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4400
     * @tc.name testUint16ArrayWithPart044
      * @tc.desc Truncates 65535.1 to the Uint16 maximum.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3380, 4660, 6220);
      const result: Uint16Array = arr.with(0, 65535.1);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4500
     * @tc.name testUint16ArrayWithPart045
      * @tc.desc Truncates 65535.5 to the Uint16 maximum.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3397, 4679, 6243);
      const result: Uint16Array = arr.with(0, 65535.5);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4600
     * @tc.name testUint16ArrayWithPart046
      * @tc.desc Truncates fractional 0.1 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3414, 4698, 6266);
      const result: Uint16Array = arr.with(0, 0.1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4700
     * @tc.name testUint16ArrayWithPart047
      * @tc.desc Truncates negative fractional minus 0.001 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3431, 4717, 6289);
      const result: Uint16Array = arr.with(0, -0.001);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4800
     * @tc.name testUint16ArrayWithPart048
      * @tc.desc Truncates Math.E to two during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3448, 4736, 6312);
      const result: Uint16Array = arr.with(0, Math.E);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_4900
     * @tc.name testUint16ArrayWithPart049
      * @tc.desc Truncates Math.PI to three during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3465, 4755, 6335);
      const result: Uint16Array = arr.with(0, Math.PI);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5000
     * @tc.name testUint16ArrayWithPart050
      * @tc.desc Wraps 98305 to 32769 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3482, 4774, 6358);
      const result: Uint16Array = arr.with(0, 98305);
      expect(result[0]).assertEqual(32769);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5100
     * @tc.name testUint16ArrayWithPart051
      * @tc.desc Wraps ten Uint16 ranges to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3499, 4793, 6381);
      const result: Uint16Array = arr.with(0, 655360);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5200
     * @tc.name testUint16ArrayWithPart052
      * @tc.desc Wraps 688128 to 32768 during replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3516, 4812, 6404);
      const result: Uint16Array = arr.with(0, 688128);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5300
     * @tc.name testUint16ArrayWithPart053
      * @tc.desc Replaces index zero with 65535 and preserves the next value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3533, 4831, 6427);
      const result: Uint16Array = arr.with(0, 65535);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(4831);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5400
     * @tc.name testUint16ArrayWithPart054
      * @tc.desc Replaces the final index with zero and preserves the first.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3550, 4850, 6450);
      const result: Uint16Array = arr.with(2, 0);
      expect(result[2]).assertEqual(0);
      expect(result[0]).assertEqual(3550);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5500
     * @tc.name testUint16ArrayWithPart055
      * @tc.desc Wraps 65536 to zero at the final index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3567, 4869, 6473);
      const result: Uint16Array = arr.with(2, 65536);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5600
     * @tc.name testUint16ArrayWithPart056
      * @tc.desc Converts negative 32768 at the final index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3584, 4888, 6496);
      const result: Uint16Array = arr.with(2, -32768);
      expect(result[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5700
     * @tc.name testUint16ArrayWithPart057
      * @tc.desc Replaces a value while leaving the source unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3601, 4907, 6519);
      const result: Uint16Array = arr.with(0, 99);
      expect(result[0]).assertEqual(99);
      expect(arr[0]).assertEqual(3601);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5800
     * @tc.name testUint16ArrayWithPart058
       * @tc.desc Replaces index zero in a distinct result without source mutation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3618, 4926, 6542);
      const result: Uint16Array = arr.with(0, 99);
      expect(result.join(',')).assertEqual('99,4926,6542');
      expect(result).not().assertEqual(arr);
      expect(arr[0]).assertEqual(3618);
      expect(arr[1]).assertEqual(4926);
      expect(arr[2]).assertEqual(6542);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_5900
     * @tc.name testUint16ArrayWithPart059
       * @tc.desc Preserves source contents and uses a distinct result buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3635, 4945, 6565);
      const result: Uint16Array = arr.with(0, 99);
      expect(result.join(',')).assertEqual('99,4945,6565');
      expect(arr.join(',')).assertEqual('3635,4945,6565');
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6000
     * @tc.name testUint16ArrayWithPart060
      * @tc.desc Preserves every non-replaced element in a five-element result.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      const result: Uint16Array = arr.with(2, 999);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(999);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6100
     * @tc.name testUint16ArrayWithPart061
      * @tc.desc Wraps minus one to 65535 at the middle index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3652, 4964, 6588);
      const result: Uint16Array = arr.with(1, -1);
      expect(result[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6200
     * @tc.name testUint16ArrayWithPart062
      * @tc.desc Joins the replaced result into the expected sequence.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3669, 4983, 6611);
      const joined: string = arr.with(0, 99).join(",");
      expect(joined).assertEqual("99,4983,6611");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6300
     * @tc.name testUint16ArrayWithPart063
      * @tc.desc Preserves byte length and isolates later result mutations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3686, 5002, 6634);
      const result: Uint16Array = arr.with(0, 99);
      expect(result.byteLength).assertEqual(6);
      expect(result.join(',')).assertEqual('99,5002,6634');
      expect(arr.join(',')).assertEqual('3686,5002,6634');
      expect(result.buffer).not().assertEqual(arr.buffer);
      result[1] = 77;
      expect(arr[1]).assertEqual(5002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6400
     * @tc.name testUint16ArrayWithPart064
      * @tc.desc Chains replacements while retaining source buffer isolation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3703, 5021, 6657);
      const result: Uint16Array = arr.with(0, 100).with(1, 200);
      expect(result.join(',')).assertEqual('100,200,6657');
      expect(result.buffer).not().assertEqual(arr.buffer);
      expect(arr.join(',')).assertEqual('3703,5021,6657');
      result[2] = 300;
      expect(arr[2]).assertEqual(6657);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6500
     * @tc.name testUint16ArrayWithPart065
      * @tc.desc Reads the replaced value through at after replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3720, 5040, 6680);
      const result: Uint16Array = arr.with(1, 500);
      const val: Number | undefined = result.at(1);
      expect(val).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6600
     * @tc.name testUint16ArrayWithPart066
      * @tc.desc Rejects an index equal to three-element array length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3737, 5059, 6703);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6700
     * @tc.name testUint16ArrayWithPart067
      * @tc.desc Verifies Uint16Array.with replaces the last element for index minus one on a nonempty array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3771, 5097, 6749);
      const result = arr.with(-1, 99);
      expect(result[0]).assertEqual(3771);
      expect(result[1]).assertEqual(5097);
      expect(result[2]).assertEqual(99);
      expect(arr[2]).assertEqual(6749);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6800
     * @tc.name testUint16ArrayWithPart068
      * @tc.desc Verifies Uint16Array.with replaces the first element for index equal to negative three-element length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3788, 5116, 6772);
      const result = arr.with(-3, 99);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(5116);
      expect(result[2]).assertEqual(6772);
      expect(arr[0]).assertEqual(3788);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_6900
     * @tc.name testUint16ArrayWithPart069
      * @tc.desc Rejects an index below negative three-element length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3805, 5135, 6795);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7000
     * @tc.name testUint16ArrayWithPart070
      * @tc.desc Rejects a positive index of 65536.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3822, 5154, 6818);
      try {
        arr.with(65536, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7100
     * @tc.name testUint16ArrayWithPart071
      * @tc.desc Rejects a negative index of minus 65536.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3839, 5173, 6841);
      try {
        arr.with(-65536, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7200
     * @tc.name testUint16ArrayWithPart072
      * @tc.desc Rejects index zero on a zero-length array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0);
      try {
        arr.with(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7300
     * @tc.name testUint16ArrayWithPart073
      * @tc.desc Rejects index minus one on a zero-length array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0);
      try {
        arr.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7400
     * @tc.name testUint16ArrayWithPart074
      * @tc.desc Rejects index one on a single-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(42);
      try {
        arr.with(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7500
     * @tc.name testUint16ArrayWithPart075
      * @tc.desc Rejects a positive index of 100000.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3856, 5192, 6864);
      try {
        arr.with(100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7600
     * @tc.name testUint16ArrayWithPart076
      * @tc.desc Rejects a negative index of minus 100000.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3873, 5211, 6887);
      try {
        arr.with(-100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7700
     * @tc.name testUint16ArrayWithPart077
      * @tc.desc Replaces index one with 99 in a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3890, 5230, 6910);
      const result: Uint16Array = arr.with(1, 99);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7800
     * @tc.name testUint16ArrayWithPart078
      * @tc.desc Wraps 65536 to zero at the first index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3907, 5249, 6933);
      const result: Uint16Array = arr.with(0, 65536);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART2_7900
     * @tc.name testUint16ArrayWithPart079
      * @tc.desc Wraps 65537 to one at the first index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3924, 5268, 6956);
      const result: Uint16Array = arr.with(0, 65537);
      expect(result[0]).assertEqual(1);
    });

  });

}
