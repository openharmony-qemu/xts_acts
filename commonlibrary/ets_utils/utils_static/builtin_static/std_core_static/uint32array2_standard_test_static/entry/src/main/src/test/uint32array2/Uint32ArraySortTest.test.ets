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

export default function uint32ArraySortOneTest(): void {
  describe('Uint32ArraySortOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0100
     * @tc.name testUint32ArraySortOne001
     * @tc.desc Verify sort() with no comparator sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 3, 4);
      values.sort();
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(1)).assertEqual(4);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0200
     * @tc.name testUint32ArraySortOne002
     * @tc.desc Verify sort with a comparator that always returns 0 keeps original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2, 1, 3);
      values.sort((a: number, b: number): int => 0);
      expect(values.length).assertEqual(3);
      expect(values.$_get(0)).assertEqual(2);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0300
     * @tc.name testUint32ArraySortOne003
     * @tc.desc Verify sort 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      values.sort((a: number, b: number): int => 1);
      expect(values.length).assertEqual(3);
      values.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0400
     * @tc.name testUint32ArraySortOne004
     * @tc.desc Verify sort() this 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const ret = values.sort();
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0500
     * @tc.name testUint32ArraySortOne005
     * @tc.desc Verify sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(42);
      values.sort();
      expect(values.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0600
     * @tc.name testUint32ArraySortOne006
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 1, 3, 2);
      values.sort();
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
      expect(values.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0700
     * @tc.name testUint32ArraySortOne007
     * @tc.desc Verify compareFn 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 1);
      values.sort((a: number, b: number): int => a === b ? 0 : 1);
      expect(values.length).assertEqual(3);
      values.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0800
     * @tc.name testUint32ArraySortOne008
     * @tc.desc Verify compareFn a-b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      values.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_0900
     * @tc.name testUint32ArraySortOne009
     * @tc.desc Verify compareFn b-a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 3, 2);
      values.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1000
     * @tc.name testUint32ArraySortOne010
     * @tc.desc Verify compareFn 0 this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      const ret = values.sort((a: number, b: number): int => 0);
      const sameRef: boolean = ret === values;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1100
     * @tc.name testUint32ArraySortOne011
     * @tc.desc Verify [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1200
     * @tc.name testUint32ArraySortOne012
     * @tc.desc Verify [7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7, 7);
      values.sort();
      expect(values.$_get(0)).assertEqual(7);
      expect(values.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1300
     * @tc.name testUint32ArraySortOne013
     * @tc.desc Verify [3,1,2] [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1400
     * @tc.name testUint32ArraySortOne014
     * @tc.desc Verify 0 uint32.MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1500
     * @tc.name testUint32ArraySortOne015
     * @tc.desc Verify uint32.MAX 4294967295 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 1, 4294967295);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1600
     * @tc.name testUint32ArraySortOne016
     * @tc.desc Verify -1 4294967295 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(-1, 1, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1700
     * @tc.name testUint32ArraySortOne017
     * @tc.desc Verify 2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483647, 0, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1800
     * @tc.name testUint32ArraySortOne018
     * @tc.desc Verify -2147483648 2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(-2147483648, 2147483648, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(2147483648);
      expect(values.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_1900
     * @tc.name testUint32ArraySortOne019
     * @tc.desc Verify 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3.14, 1, 2);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2000
     * @tc.name testUint32ArraySortOne020
     * @tc.desc Verify NaN 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(Number.NaN, 5, 3);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2100
     * @tc.name testUint32ArraySortOne021
     * @tc.desc Verify 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(9007199254740991, 0, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2200
     * @tc.name testUint32ArraySortOne022
     * @tc.desc Verify 0xFF 0o17 0b101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0xFF, 0o17, 0b101);
      values.sort();
      expect(values.$_get(0)).assertEqual(0b101);
      expect(values.$_get(1)).assertEqual(0o17);
      expect(values.$_get(2)).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2300
     * @tc.name testUint32ArraySortOne023
     * @tc.desc Verify [4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 3, 2, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2400
     * @tc.name testUint32ArraySortOne024
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < values.length; i++) {
        values.$_set(i, 100 - i);
      }
      values.sort();
      let ordered: boolean = true;
      for (let i = 1; i < values.length; i++) {
        if (values.$_get(i - 1) > values.$_get(i)) {
          ordered = false;
        }
      }
      expect(ordered).assertTrue();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(99)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2500
     * @tc.name testUint32ArraySortOne025
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 5, 0, 3, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(3);
      expect(values.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2600
     * @tc.name testUint32ArraySortOne026
     * @tc.desc Verify 65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(65535);
      for (let i = 0; i < values.length; i++) {
        values.$_set(i, 65535 - i);
      }
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(65534)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2700
     * @tc.name testUint32ArraySortOne027
     * @tc.desc Verify 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 0, 1, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2800
     * @tc.name testUint32ArraySortOne028
     * @tc.desc Verify int32.MAX int32.MAX+1(2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483648, 2147483647);
      values.sort();
      expect(values.$_get(0)).assertEqual(2147483647);
      expect(values.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_2900
     * @tc.name testUint32ArraySortOne029
     * @tc.desc Verify compareFn with descending sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const desc: boolean = true;
      const values: Uint32Array = Uint32Array.of(1, 3, 2);
      values.sort((a: number, b: number): int => desc ? (a > b ? -1 : 1) : (a < b ? -1 : 1));
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3000
     * @tc.name testUint32ArraySortOne030
     * @tc.desc Verify compareFn call count with ascending sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: int = 0;
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      values.sort((a: number, b: number): int => {
        calls = calls + 1;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(calls).assertEqual(4);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3100
     * @tc.name testUint32ArraySortOne031
     * @tc.desc Verify compareFn with strict equality ascending sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 1, 3);
      values.sort((a: number, b: number): int => a < b ? -1 : (a === b ? 0 : 1));
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3200
     * @tc.name testUint32ArraySortOne032
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 2, 9, 1, 7);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(5);
      expect(values.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3300
     * @tc.name testUint32ArraySortOne033
     * @tc.desc Verify compareFn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2, 4, 5);
      try {
        values.sort((a: number, b: number): int => {
          if (a === 1 && b === 3) { throw new Error('sort-mid-throw'); }
          return a < b ? -1 : (a > b ? 1 : 0);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3400
     * @tc.name testUint32ArraySortOne034
     * @tc.desc Verify compareFn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      try {
        values.sort((a: number, b: number): int => { throw new Error('sort-len-throw'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3500
     * @tc.name testUint32ArraySortOne035
     * @tc.desc Verify 4294967296 0 sort 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967296, 5, 3);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3600
     * @tc.name testUint32ArraySortOne036
     * @tc.desc Verify 4294967295 0 sort 0 (MAX )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295, 0, 100);
      values.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3700
     * @tc.name testUint32ArraySortOne037
     * @tc.desc Verify Infinity 0 0 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(Number.POSITIVE_INFINITY, 0);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3800
     * @tc.name testUint32ArraySortOne038
     * @tc.desc Verify ( i<=i+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2, 2, 1, 1, 3, 3);
      values.sort();
      let ordered: boolean = true;
      for (let i = 1; i < values.length; i++) {
        if (values.$_get(i - 1) > values.$_get(i)) {
          ordered = false;
        }
      }
      expect(ordered).assertTrue();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_3900
     * @tc.name testUint32ArraySortOne039
     * @tc.desc Verify [2,2,1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2, 2, 1, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(2);
      expect(values.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_4000
     * @tc.name testUint32ArraySortOne040
     * @tc.desc Verify -0.5 0 0 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(-0.5, 0, 1);
      values.sort();
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_4100
     * @tc.name testUint32ArraySortOne041
     * @tc.desc Verify sort() is stable when the comparator returns 0 for equal-key elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(21, 12, 22, 11, 23, 13);
      values.sort((a: number, b: number): int => {
        const ta: number = (a - a % 10) / 10;
        const tb: number = (b - b % 10) / 10;
        if (ta < tb) {
          return -1;
        }
        if (ta > tb) {
          return 1;
        }
        return 0;
      });
      expect(values.$_get(0)).assertEqual(12);
      expect(values.$_get(1)).assertEqual(11);
      expect(values.$_get(2)).assertEqual(13);
      expect(values.$_get(3)).assertEqual(21);
      expect(values.$_get(4)).assertEqual(22);
      expect(values.$_get(5)).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_4200
     * @tc.name testUint32ArraySortOne042
     * @tc.desc Verify sort() on a subarray view only sorts the view range and leaves the rest of the buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(5, 3, 8, 1, 9);
      const view: Uint32Array = base.subarray(1, 4);
      view.sort();
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(1)).assertEqual(3);
      expect(view.$_get(2)).assertEqual(8);
      expect(base.$_get(0)).assertEqual(5);
      expect(base.$_get(1)).assertEqual(1);
      expect(base.$_get(2)).assertEqual(3);
      expect(base.$_get(3)).assertEqual(8);
      expect(base.$_get(4)).assertEqual(9);
    });

  });
}
