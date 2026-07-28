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

export default function uint32ArraySortTwoTest(): void {
  describe('Uint32ArraySortTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0100
     * @tc.name testUint32ArraySortTwo001
     * @tc.desc Verify sort( compareFn) name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort(
        (a: number, b: number): int => { if (a < b) { return -1; } if (a > b) { return 1; } return 0; }
      );
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0200
     * @tc.name testUint32ArraySortTwo002
     * @tc.desc Verify sort() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const result = values.sort();
      const same: boolean = result === values;
      expect(same).assertTrue();
      expect(result.name).assertEqual('Uint32Array');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0300
     * @tc.name testUint32ArraySortTwo003
     * @tc.desc Verify sort() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const result = values.sort();
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0400
     * @tc.name testUint32ArraySortTwo004
     * @tc.desc Verify sort name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0500
     * @tc.name testUint32ArraySortTwo005
     * @tc.desc Verify sort() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 3, 8);
      const result = values.sort();
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0600
     * @tc.name testUint32ArraySortTwo006
     * @tc.desc Verify sort( compareFn) BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 3, 8);
      const result = values.sort(
        (a: number, b: number): int => { if (a < b) { return -1; } if (a > b) { return 1; } return 0; }
      );
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0700
     * @tc.name testUint32ArraySortTwo007
     * @tc.desc Verify sort().sort() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 4, 7);
      const result = values.sort().sort();
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0800
     * @tc.name testUint32ArraySortTwo008
     * @tc.desc Verify from(Array) sort() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9.0, 3.0, 7.0];
      const values = Uint32Array.from(src);
      const result = values.sort();
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_0900
     * @tc.name testUint32ArraySortTwo009
     * @tc.desc Verify from(Uint32Array) sort( ) name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(8, 2, 6);
      const values = Uint32Array.from(src);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(8);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1000
     * @tc.name testUint32ArraySortTwo010
     * @tc.desc Verify subarray sort() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(9, 5, 7, 1);
      const view = base.subarray(1, 3);
      const result = view.sort();
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1100
     * @tc.name testUint32ArraySortTwo011
     * @tc.desc Verify buffer sort( ) name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Uint32Array(buf, 0, 3);
      view.$_set(0, 7); view.$_set(1, 3); view.$_set(2, 5);
      const result = view.sort(
        (a: number, b: number): int => { if (a < b) { return -1; } if (a > b) { return 1; } return 0; }
      );
      expect(result.name).assertEqual('Uint32Array');
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1200
     * @tc.name testUint32ArraySortTwo012
     * @tc.desc Verify new Uint32Array(5) sort() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const result = values.sort();
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1300
     * @tc.name testUint32ArraySortTwo013
     * @tc.desc Verify of(100,200,50) sort( ) BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 50);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
      expect(result.$_get(0)).assertEqual(200);
      expect(result.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1400
     * @tc.name testUint32ArraySortTwo014
     * @tc.desc Verify compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 3, 8);
      const result = values.sort((a: number, b: number): int => { return 0; });
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1500
     * @tc.name testUint32ArraySortTwo015
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 1, 2, 1);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1600
     * @tc.name testUint32ArraySortTwo016
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 7, 7, 7);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(3)).assertEqual(7);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1700
     * @tc.name testUint32ArraySortTwo017
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(20, 10);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1800
     * @tc.name testUint32ArraySortTwo018
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_1900
     * @tc.name testUint32ArraySortTwo019
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [50, 10, 40, 20, 30, 60, 80, 70, 90, 100];
      const values = Uint32Array.from(src);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(9)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2000
     * @tc.name testUint32ArraySortTwo020
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort();
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2100
     * @tc.name testUint32ArraySortTwo021
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2200
     * @tc.name testUint32ArraySortTwo022
     * @tc.desc Verify sort indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const result = values.sort();
      expect(result.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2300
     * @tc.name testUint32ArraySortTwo023
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const result = values.sort();
      expect(result.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2400
     * @tc.name testUint32ArraySortTwo024
     * @tc.desc Verify sort at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const result = values.sort();
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2500
     * @tc.name testUint32ArraySortTwo025
     * @tc.desc Verify sort at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const result = values.sort();
      expect(result.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2600
     * @tc.name testUint32ArraySortTwo026
     * @tc.desc Verify sort lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20, 10);
      const result = values.sort();
      expect(result.lastIndexOf(10)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2700
     * @tc.name testUint32ArraySortTwo027
     * @tc.desc Verify sort find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 10, 20);
      const result = values.sort();
      expect(result.find((v: number, i: int, a: Uint32Array): boolean => v === 10)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2800
     * @tc.name testUint32ArraySortTwo028
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 1, 9);
      const result = values.sort(
        (a: number, b: number): int => { if (a < b) { return -2147483648; } return 2147483647; }
      );
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_2900
     * @tc.name testUint32ArraySortTwo029
     * @tc.desc Verify calling sort() then sort(compareFn) returns descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort();
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3000
     * @tc.name testUint32ArraySortTwo030
     * @tc.desc Verify sort entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort();
      let firstVal: number = -1;
      for (const entry of values.entries()) {
        firstVal = entry[1];
        break;
      }
      expect(firstVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3100
     * @tc.name testUint32ArraySortTwo031
     * @tc.desc Verify sort reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort();
      const sum = result.reduce<number>((s: number, v: number, i: int, a: Uint32Array): number => s + v, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3200
     * @tc.name testUint32ArraySortTwo032
     * @tc.desc Verify sort valueOf().join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort();
      expect(values.valueOf().join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3300
     * @tc.name testUint32ArraySortTwo033
     * @tc.desc Verify sort(compareFn) keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 2, 8, 1);
      const result = values.sort(
        (a: number, b: number): int => { if (a < b) { return -1; } if (a > b) { return 1; } return 0; }
      );
      expect(result.byteLength).assertEqual(16);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3400
     * @tc.name testUint32ArraySortTwo034
     * @tc.desc Verify sort() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const result = values.sort();
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3500
     * @tc.name testUint32ArraySortTwo035
     * @tc.desc Verify sort() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const result = values.sort();
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3600
     * @tc.name testUint32ArraySortTwo036
     * @tc.desc Verify sort() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9, 3, 7, 1, 8, 2, 6, 4, 5, 0];
      const values = Uint32Array.from(src);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(9)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3700
     * @tc.name testUint32ArraySortTwo037
     * @tc.desc Verify sort() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(5, 4, 3, 2, 1);
      const view = base.subarray(1, 4);
      const result = view.sort();
      expect(result.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3800
     * @tc.name testUint32ArraySortTwo038
     * @tc.desc Verify sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5);
      const result = values.sort();
      const same: boolean = result === values;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_3900
     * @tc.name testUint32ArraySortTwo039
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort().reverse();
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4000
     * @tc.name testUint32ArraySortTwo040
     * @tc.desc Verify sort().subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2, 0);
      const result = values.sort().subarray(0, 2);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4100
     * @tc.name testUint32ArraySortTwo041
     * @tc.desc Verify sort().valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort().valueOf();
      const same: boolean = result === values;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4200
     * @tc.name testUint32ArraySortTwo042
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 3, 1);
      const r1 = values.sort();
      expect(r1.$_get(0)).assertEqual(1);
      expect(r1.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4300
     * @tc.name testUint32ArraySortTwo043
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort();
      result.$_set(0, 100);
      expect(values.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4400
     * @tc.name testUint32ArraySortTwo044
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(9, 5, 7, 1, 3);
      const view = base.subarray(0, 3);
      view.sort();
      expect(base.$_get(0)).assertEqual(5);
      expect(base.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4500
     * @tc.name testUint32ArraySortTwo045
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(8, 6, 4, 2, 0);
      const view = base.subarray(1, 4);
      view.sort();
      expect(base.$_get(1)).assertEqual(2);
      expect(base.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4600
     * @tc.name testUint32ArraySortTwo046
     * @tc.desc Verify buffer sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const view = new Uint32Array(buf, 4, 3);
      view.$_set(0, 30); view.$_set(1, 10); view.$_set(2, 20);
      const result = view.sort();
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4700
     * @tc.name testUint32ArraySortTwo047
     * @tc.desc Verify buffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const view = new Uint32Array(buf, 4, 3);
      view.$_set(0, 30); view.$_set(1, 10); view.$_set(2, 20);
      view.sort();
      const parent = new Uint32Array(buf, 0, 5);
      expect(parent.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4800
     * @tc.name testUint32ArraySortTwo048
     * @tc.desc Verify buffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(5, 3, 1);
      const v1 = base.subarray(0, 3);
      const v2 = base.subarray(0, 3);
      v1.sort();
      expect(v2.$_get(0)).assertEqual(1);
      expect(v2.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_4900
     * @tc.name testUint32ArraySortTwo049
     * @tc.desc Verify sort on [4,2,6] ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 2, 6);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5000
     * @tc.name testUint32ArraySortTwo050
     * @tc.desc Verify sort on [4,2,6] descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 2, 6);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.$_get(0)).assertEqual(6);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5100
     * @tc.name testUint32ArraySortTwo051
     * @tc.desc Verify sort uint32 MAX (4294967295) MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295, 0);
      const result = values.sort();
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5200
     * @tc.name testUint32ArraySortTwo052
     * @tc.desc Verify sort 0 (uint32 MIN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 0, 3);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5300
     * @tc.name testUint32ArraySortTwo053
     * @tc.desc Verify sort 0x100000000 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 0x100000000);
      values.$_set(1, 5);
      values.$_set(2, 3);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5400
     * @tc.name testUint32ArraySortTwo054
     * @tc.desc Verify sort -1 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -1);
      values.$_set(1, 5);
      values.$_set(2, 3);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(5);
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5500
     * @tc.name testUint32ArraySortTwo055
     * @tc.desc Verify sort -2147483648 2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -2147483648);
      values.$_set(1, 0);
      values.$_set(2, 2147483647);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(2147483647);
      expect(result.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5600
     * @tc.name testUint32ArraySortTwo056
     * @tc.desc Verify sort -Infinity 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -Number.POSITIVE_INFINITY);
      values.$_set(1, 7);
      values.$_set(2, 2);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5700
     * @tc.name testUint32ArraySortTwo057
     * @tc.desc Verify sort 3.14 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 3.14);
      values.$_set(1, 5);
      values.$_set(2, 1);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5800
     * @tc.name testUint32ArraySortTwo058
     * @tc.desc Verify sort 0o777 ( 511) 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0o777, 0, 1000);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(511);
      expect(result.$_get(2)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_5900
     * @tc.name testUint32ArraySortTwo059
     * @tc.desc Verify sort 0b1111 ( 15) 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0b1111, 0, 20);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(15);
      expect(result.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6000
     * @tc.name testUint32ArraySortTwo060
     * @tc.desc Verify sort 1e3 ( 1000) 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e3, 0, 500);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(500);
      expect(result.$_get(2)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6100
     * @tc.name testUint32ArraySortTwo061
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 0, 1);
      const result = values.sort();
      expect(result.join(',')).assertEqual('0,1,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6200
     * @tc.name testUint32ArraySortTwo062
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 4294967295);
      const result = values.sort(
        (a: number, b: number): int => { if (a > b) { return -1; } if (a < b) { return 1; } return 0; }
      );
      expect(result.join(',')).assertEqual('4294967295,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6300
     * @tc.name testUint32ArraySortTwo063
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      values.$_set(0, -1);
      values.$_set(1, 0x100000000);
      values.$_set(2, 5);
      values.$_set(3, -2147483648);
      values.$_set(4, 3);
      const result = values.sort();
      expect(result.join(',')).assertEqual('0,3,5,2147483648,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6400
     * @tc.name testUint32ArraySortTwo064
     * @tc.desc Verify sort byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const b1: byte = 10;
      const b2: byte = 5;
      const b3: byte = 20;
      values.$_set(0, b1); values.$_set(1, b2); values.$_set(2, b3);
      const result = values.sort();
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(1)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6500
     * @tc.name testUint32ArraySortTwo065
     * @tc.desc Verify sort() sorts in place and returns the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.sort();
      expect(result === values).assertTrue();
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SORT_TWO_6600
     * @tc.name testUint32ArraySortTwo066
     * @tc.desc Verify toSorted() returns a new array and leaves the original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySortTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.toSorted();
      expect(result === values).assertFalse();
      expect(values.$_get(0)).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
    });

  });
}
