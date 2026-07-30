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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FlatNoArgItem005 {
  value: int = 0;
}

export default function ArrayFlat3Test(): void {
  describe('ArrayFlat3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0100
     * @tc.name testArrayFlat3001
     * @tc.desc Verify flat without arguments uses a single default depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(Array.isArray(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0200
     * @tc.name testArrayFlat3002
     * @tc.desc Verify flat without arguments matches flat with depth one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const result1: Array<int | Array<int>> = nested.flat<int | Array<int>>();
      const result2: Array<int | Array<int>> = nested.flat<int | Array<int>>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0300
     * @tc.name testArrayFlat3003
     * @tc.desc Verify flat removes one level from a shallow nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4], [5]];
      const result: Array<int> = nested.flat<int>();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0400
     * @tc.name testArrayFlat3004
     * @tc.desc Verify flat works with empty arrays and empty nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [];
      const result1: Array<int> = arr.flat<int>();
      expect(result1.length).assertEqual(0);

      const nested: Array<Array<int>> = [[], [1, 2], [], [3, 4]];
      const result2: Array<int> = nested.flat<int>();
      expect(result2.length).assertEqual(4);
      expect(result2[0]).assertEqual(1);
      expect(result2[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0500
     * @tc.name testArrayFlat3005
     * @tc.desc Verify flat returns a new array for non-nested input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [1, 2, 3, 4];
      const result: Array<int> = arr.flat<int>();
      expect(result.length).assertEqual(4);
      expect(result === arr).assertFalse();
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0600
     * @tc.name testArrayFlat3006
     * @tc.desc Verify flat works with boolean and char values nested one level deep
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<boolean | char | Array<boolean>> = [true, [false, true], c'A'];
      const result: Array<boolean | char> = nested.flat<boolean | char>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
      expect(result[3]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0700
     * @tc.name testArrayFlat3007
     * @tc.desc Verify flat preserves object elements while flattening one level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FlatNoArgItem005();
      item1.value = 1;
      const item2 = new FlatNoArgItem005();
      item2.value = 2;
      const nested: Array<Array<FlatNoArgItem005>> = [[item1], [item2]];
      const result: Array<FlatNoArgItem005> = nested.flat<FlatNoArgItem005>();
      expect(result.length).assertEqual(2);
      expect(result[0] != undefined).assertTrue();
      expect(result[1] != undefined).assertTrue();
      if (result[0] != undefined && result[1] != undefined) {
        expect(result[0].value).assertEqual(1);
        expect(result[1].value).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0800
     * @tc.name testArrayFlat3008
     * @tc.desc Verify flat leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const originalLength = nested.length;
      const originalSecond = nested[1];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>();
      expect(nested.length).assertEqual(originalLength);
      expect(nested[1] === originalSecond).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0900
     * @tc.name testArrayFlat3009
     * @tc.desc Verify flat can be followed by reduce to combine numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3]];
      const flattened: Array<int> = nested.flat<int>();
      let sum = 0;
      for (let i = 0; i < flattened.length; i++) {
        sum += flattened[i];
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1000
     * @tc.name testArrayFlat3010
     * @tc.desc Verify repeated flat calls can progressively remove remaining nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const result: Array<int> = nested.flat<Array<int>>().flat<int>();
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1100
     * @tc.name testArrayFlat3011
     * @tc.desc Verify null and undefined values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int | null | undefined>> = [[1, null], [undefined, 2]];
      const result: Array<int | null | undefined> = nested.flat<int | null | undefined>();
      expect(result.length).assertEqual(4);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1200
     * @tc.name testArrayFlat3012
     * @tc.desc Verify NaN and Infinity values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<number>> = [[NaN, 1], [Infinity, -Infinity]];
      const result: Array<number> = nested.flat<number>();
      expect(result.length).assertEqual(4);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[2]).assertEqual(Infinity);
      expect(result[3]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1300
     * @tc.name testArrayFlat3013
     * @tc.desc Verify zero values are preserved after flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<number>> = [[0, -0], [1, 2]];
      const result: Array<number> = nested.flat<number>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1400
     * @tc.name testArrayFlat3014
     * @tc.desc Verify empty strings are preserved after flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<string>> = [['', 'a'], ['', 'b']];
      const result: Array<string> = nested.flat<string>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('');
      expect(result[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1500
     * @tc.name testArrayFlat3015
     * @tc.desc Verify flat() matches flat(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const result1: Array<int> = nested.flat<int>();
      const result2: Array<int> = nested.flat<int>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1600
     * @tc.name testArrayFlat3016
     * @tc.desc Verify flat() and flat(2) differ on deep nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const result1: Array<Array<int>> = nested.flat<Array<int>>();
      const result2: Array<int> = nested.flat<int>(2);
      expect(result1.length).assertEqual(2);
      expect(result2.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1700
     * @tc.name testArrayFlat3017
     * @tc.desc Verify flat().flat() progressively removes remaining nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const step1: Array<Array<int>> = nested.flat<Array<int>>();
      const step2: Array<int> = step1.flat<int>();
      expect(step1.length).assertEqual(2);
      expect(step2.length).assertEqual(4);
      expect(step2[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1800
     * @tc.name testArrayFlat3018
     * @tc.desc Verify flat results can be mapped immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const mapped: Array<int> = nested.flat<int>().map((value: int): int => value * 2);
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1900
     * @tc.name testArrayFlat3019
     * @tc.desc Verify flat results can be filtered immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const filtered: Array<int> = nested.flat<int>().filter((value: int): boolean => value > 2);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2000
     * @tc.name testArrayFlat3020
     * @tc.desc Verify flat and flatMap produce the same expanded sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const mapped = source.map((value: int): Array<int> => [value, value * 2]);
      const flatResult: Array<int> = mapped.flat<int>();
      const flatMapResult: Array<int> = source.flatMap<int>((value: int): Array<int> => [value, value * 2]);
      expect(flatResult.length).assertEqual(flatMapResult.length);
      expect(flatResult.toString()).assertEqual(flatMapResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2100
     * @tc.name testArrayFlat3021
     * @tc.desc Verify ReadonlyArray inputs can be flattened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int | Array<int>> = [1, [2, 3]];
      const result: Array<int> = source.flat<int>();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2200
     * @tc.name testArrayFlat3022
     * @tc.desc Verify arrays made entirely of array elements flatten correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4], [5, 6]];
      const result: Array<int> = nested.flat<int>();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2300
     * @tc.name testArrayFlat3023
     * @tc.desc Verify empty array elements are skipped during flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [], [3, 4]];
      const result: Array<int> = nested.flat<int>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2400
     * @tc.name testArrayFlat3024
     * @tc.desc Verify a matrix can be flattened into one dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: Array<Array<int>> = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
      const result: Array<int> = matrix.flat<int>();
      expect(result.length).assertEqual(9);
      expect(result[0]).assertEqual(1);
      expect(result[8]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2500
     * @tc.name testArrayFlat3025
     * @tc.desc Verify grouped string arrays merge into a single sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const groups: Array<Array<string>> = [['a1', 'a2'], ['b1', 'b2'], ['c1', 'c2']];
      const merged: Array<string> = groups.flat<string>();
      expect(merged.length).assertEqual(6);
      expect(merged[0]).assertEqual('a1');
      expect(merged[5]).assertEqual('c2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2600
     * @tc.name testArrayFlat3026
     * @tc.desc Verify batch numeric arrays merge into a single sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const batches:Array<Array<int>> = [[1, 2, 3], [4, 5, 6]];
      const result:Array<int> = batches.flat<int>();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

  });
}
