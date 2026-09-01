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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArraySort2Test(): void {
  describe('Float32ArraySort2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0010
     * @tc.name testFloat32ArraySortTwo001
     * @tc.desc Verify sort with no compareFn sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      const element001 = r.$_get(0);
      expect(element001).assertEqual(1.0);
      const element001Part2 = r.$_get(1);
      expect(element001Part2).assertEqual(2.0);
      const element001Part3 = r.$_get(2);
      expect(element001Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0020
     * @tc.name testFloat32ArraySortTwo002
     * @tc.desc Verify 1-argument compareFn sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      const element002 = r.$_get(0);
      expect(element002).assertEqual(1);
      const element002Part2 = r.$_get(2);
      expect(element002Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0030
     * @tc.name testFloat32ArraySortTwo003
     * @tc.desc Verify 1-argument compareFn sorts descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.sort((a: number, b: number): int => { return a > b ? -1 : (a < b ? 1 : 0); });
      const element003 = r.$_get(0);
      expect(element003).assertEqual(3);
      const element003Part2 = r.$_get(2);
      expect(element003Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0040
     * @tc.name testFloat32ArraySortTwo004
     * @tc.desc Verify sort on empty array returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0050
     * @tc.name testFloat32ArraySortTwo005
     * @tc.desc Verify compareFn returning 0 keeps original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort((a: number, b: number): int => { return 0; });
      expect(r).assertEqual(arr);
      const element005 = r.$_get(0);
      expect(element005).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0060
     * @tc.name testFloat32ArraySortTwo006
     * @tc.desc Verify compareFn returning 1 preserves array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.sort((a: number, b: number): int => { return 1; });
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0070
     * @tc.name testFloat32ArraySortTwo007
     * @tc.desc Verify compareFn returning -1 keeps original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 1.0);
      const r = arr.sort((a: number, b: number): int => { return -1; });
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0080
     * @tc.name testFloat32ArraySortTwo008
     * @tc.desc Verify compareFn observes the maximum value while sorting [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seen: number = -1e9;
      const cmp = (a: number, b: number): int => { const m = a > b ? a : b; if (m > seen) { seen = m; } return a < b ? -1 : (a > b ? 1 : 0); };
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort(cmp);
      expect(r).assertEqual(arr);
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0090
     * @tc.name testFloat32ArraySortTwo009
     * @tc.desc Verify sort with undefined compareFn sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort(undefined);
      expect(r).assertEqual(arr);
      const element009 = r.$_get(0);
      expect(element009).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0100
     * @tc.name testFloat32ArraySortTwo010
     * @tc.desc Verify compareFn sorts 5, 4, 6 ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 4.0, 6.0);
      const r = arr.sort((a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); });
      expect(r).assertEqual(arr);
      const element010 = r.$_get(0);
      expect(element010).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0110
     * @tc.name testFloat32ArraySortTwo011
     * @tc.desc Verify sort returns sorted element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0120
     * @tc.name testFloat32ArraySortTwo012
     * @tc.desc Verify BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0130
     * @tc.name testFloat32ArraySortTwo013
     * @tc.desc Verify sort preserves length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0140
     * @tc.name testFloat32ArraySortTwo014
     * @tc.desc Verify sort on 3-element array preserves length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0150
     * @tc.name testFloat32ArraySortTwo015
     * @tc.desc Verify byteLength is 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0160
     * @tc.name testFloat32ArraySortTwo016
     * @tc.desc Verify byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(12);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0170
     * @tc.name testFloat32ArraySortTwo017
     * @tc.desc Verify buffer.byteLength equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.buffer.byteLength).assertEqual(12);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0180
     * @tc.name testFloat32ArraySortTwo018
     * @tc.desc Verify sorted first element is 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      const element018 = r.$_get(0);
      expect(element018).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0190
     * @tc.name testFloat32ArraySortTwo019
     * @tc.desc Verify sort returns the same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const observedValue019 = arr.sort();
      expect(observedValue019).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0200
     * @tc.name testFloat32ArraySortTwo020
     * @tc.desc Verify sort with compareFn returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const cmp = (a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); };
      const observedValue020 = arr.sort(cmp);
      expect(observedValue020).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0210
     * @tc.name testFloat32ArraySortTwo021
     * @tc.desc Verify sort modifies the array in-place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      r.$_set(0, 999);
      const element021 = arr.$_get(0);
      expect(element021).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0220
     * @tc.name testFloat32ArraySortTwo022
     * @tc.desc Verify chained sort() calls return the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const observedValue022 = arr.sort().sort();
      expect(observedValue022).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0230
     * @tc.name testFloat32ArraySortTwo023
     * @tc.desc Verify sort then reverse produces descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.sort().reverse();
      expect(r).assertEqual(arr);
      const element023 = r.$_get(0);
      expect(element023).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0240
     * @tc.name testFloat32ArraySortTwo024
     * @tc.desc Verify triple sort chaining returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const observedValue024 = arr.sort().sort().sort();
      expect(observedValue024).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0250
     * @tc.name testFloat32ArraySortTwo025
     * @tc.desc Verify sort on already sorted array returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const observedValue025 = arr.sort();
      expect(observedValue025).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0260
     * @tc.name testFloat32ArraySortTwo026
     * @tc.desc Verify sort on single-element array returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const observedValue026 = arr.sort();
      expect(observedValue026).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0270
     * @tc.name testFloat32ArraySortTwo027
     * @tc.desc Verify length is 0 after sort on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r = arr.sort();
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0280
     * @tc.name testFloat32ArraySortTwo028
     * @tc.desc Verify length is 1 after sort on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const r = arr.sort();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0290
     * @tc.name testFloat32ArraySortTwo029
     * @tc.desc Verify length is 10 after sort on 10-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0);
      const r = arr.sort();
      expect(r.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0300
     * @tc.name testFloat32ArraySortTwo030
     * @tc.desc Verify sort() orders a four-element array with the maximum value at the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 3.0, 7.0, 1.0);
      const last = arr.sort()[3];
      expect(last).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0310
     * @tc.name testFloat32ArraySortTwo031
     * @tc.desc Verify byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0320
     * @tc.name testFloat32ArraySortTwo032
     * @tc.desc Verify byteOffset is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0330
     * @tc.name testFloat32ArraySortTwo033
     * @tc.desc Verify length is 3 after sort with compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const cmp = (a: number, b: number): int => { return a > b ? -1 : (a < b ? 1 : 0); };
      const r = arr.sort(cmp);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0340
     * @tc.name testFloat32ArraySortTwo034
     * @tc.desc Verify byteLength is 12 after sort with compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const cmp = (a: number, b: number): int => { return a < b ? -1 : (a > b ? 1 : 0); };
      const r = arr.sort(cmp);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0350
     * @tc.name testFloat32ArraySortTwo035
     * @tc.desc Verify length is preserved after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const beforeLen = arr.length;
      const r = arr.sort();
      expect(r.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0360
     * @tc.name testFloat32ArraySortTwo036
     * @tc.desc Verify byteOffset is preserved after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 8, 2);
      const beforeOff = arr.byteOffset;
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(beforeOff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0370
     * @tc.name testFloat32ArraySortTwo037
     * @tc.desc Verify byteLength is 20 for 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 3.0, 4.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0380
     * @tc.name testFloat32ArraySortTwo038
     * @tc.desc Verify buffer is the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0390
     * @tc.name testFloat32ArraySortTwo039
     * @tc.desc Verify buffer is the same as the constructed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      const r = arr.sort();
      expect(r.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0400
     * @tc.name testFloat32ArraySortTwo040
     * @tc.desc Verify buffer byteLength is unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      const before = buf.byteLength;
      arr.sort();
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0410
     * @tc.name testFloat32ArraySortTwo041
     * @tc.desc Verify subarray byteOffset is preserved after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(9.0, 8.0, 7.0, 6.0, 5.0);
      const sub = base.subarray(1, 4);
      const r = sub.sort();
      expect(r.byteOffset).assertEqual(base.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0420
     * @tc.name testFloat32ArraySortTwo042
     * @tc.desc Verify sort on shared buffer affects all views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Float32Array(buf, 0, 2);
      a.$_set(0, 3); a.$_set(1, 1);
      const b = new Float32Array(buf, 0, 2);
      a.sort();
      const element045 = b.$_get(0);
      expect(element045).assertEqual(1);
      const element045Part2 = b.$_get(1);
      expect(element045Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0430
     * @tc.name testFloat32ArraySortTwo043
     * @tc.desc Verify byteOffset is 4 and sort works on offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 3); arr.$_set(1, 1); arr.$_set(2, 2);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(4);
      const element046 = r.$_get(0);
      expect(element046).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0440
     * @tc.name testFloat32ArraySortTwo044
     * @tc.desc Verify buffer is unchanged after chained sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const b0 = arr.buffer;
      arr.sort().sort();
      expect(arr.buffer).assertEqual(b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0450
     * @tc.name testFloat32ArraySortTwo045
     * @tc.desc Verify byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 8, 2);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0460
     * @tc.name testFloat32ArraySortTwo046
     * @tc.desc Verify buffer byteLength is unchanged after sort and modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort();
      r.$_set(1, 100);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0470
     * @tc.name testFloat32ArraySortTwo047
     * @tc.desc Verify sort on parent array affects child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const parent = new Float32Array(buf);
      parent.$_set(0, 3); parent.$_set(1, 1); parent.$_set(2, 2);
      const child = new Float32Array(buf, 0, 3);
      parent.sort();
      const element051 = child.$_get(0);
      expect(element051).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0480
     * @tc.name testFloat32ArraySortTwo048
     * @tc.desc Verify byteOffset plus length times 4 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      const r = arr.sort();
      const lengthValue052 = r.byteOffset + r.length * 4;
      expect(lengthValue052).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0490
     * @tc.name testFloat32ArraySortTwo049
     * @tc.desc Verify descending array 5,4,3,2,1 sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0);
      const r = arr.sort();
      const element053 = r.$_get(0);
      expect(element053).assertEqual(1);
      const element053Part2 = r.$_get(4);
      expect(element053Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0500
     * @tc.name testFloat32ArraySortTwo050
     * @tc.desc Verify sort on already sorted array preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.sort();
      const element055 = r.$_get(0);
      expect(element055).assertEqual(1);
      const element055Part2 = r.$_get(2);
      expect(element055Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0510
     * @tc.name testFloat32ArraySortTwo051
     * @tc.desc Verify sort on reversed array sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 2.0, 1.0);
      const r = arr.sort();
      const element056 = r.$_get(0);
      expect(element056).assertEqual(1);
      const element056Part2 = r.$_get(2);
      expect(element056Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0520
     * @tc.name testFloat32ArraySortTwo052
     * @tc.desc Verify sort on array with equal values preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const r = arr.sort();
      const element057 = r.$_get(0);
      expect(element057).assertEqual(5);
      const element057Part2 = r.$_get(2);
      expect(element057Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0530
     * @tc.name testFloat32ArraySortTwo053
     * @tc.desc Verify sort on negative values sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -3.0, -2.0);
      const r = arr.sort();
      const element058 = r.$_get(0);
      expect(element058).assertEqual(-3);
      const element058Part2 = r.$_get(2);
      expect(element058Part2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0540
     * @tc.name testFloat32ArraySortTwo054
     * @tc.desc Verify sort on mixed negative and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 0.0, 1.0);
      const r = arr.sort();
      const element059 = r.$_get(0);
      expect(element059).assertEqual(-1);
      const element059Part2 = r.$_get(1);
      expect(element059Part2).assertEqual(0);
      const element059Part3 = r.$_get(2);
      expect(element059Part3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0550
     * @tc.name testFloat32ArraySortTwo055
     * @tc.desc Verify sort on 2-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 1.0);
      const r = arr.sort();
      const element060 = r.$_get(0);
      expect(element060).assertEqual(1);
      const element060Part2 = r.$_get(1);
      expect(element060Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0560
     * @tc.name testFloat32ArraySortTwo056
     * @tc.desc Verify sort on array with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0);
      const r = arr.sort();
      const element061 = r.$_get(0);
      expect(element061).assertEqual(1);
      const element061Part2 = r.$_get(1);
      expect(element061Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0570
     * @tc.name testFloat32ArraySortTwo057
     * @tc.desc Verify sort on alternating values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 1.0, 2.0, 1.0);
      const r = arr.sort();
      const element062 = r.$_get(0);
      expect(element062).assertEqual(1);
      const element062Part2 = r.$_get(1);
      expect(element062Part2).assertEqual(1);
      const element062Part3 = r.$_get(2);
      expect(element062Part3).assertEqual(2);
      const element062Part4 = r.$_get(3);
      expect(element062Part4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0580
     * @tc.name testFloat32ArraySortTwo058
     * @tc.desc Verify sort on 10-element descending array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0);
      const r = arr.sort();
      const element063 = r.$_get(0);
      expect(element063).assertEqual(1);
      const element063Part2 = r.$_get(9);
      expect(element063Part2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0590
     * @tc.name testFloat32ArraySortTwo059
     * @tc.desc Verify sort on decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 0.5, 2.5);
      const r = arr.sort();
      const element064 = r.$_get(0);
      expect(element064).assertEqual(0.5);
      const element064Part2 = r.$_get(2);
      expect(element064Part2).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0600
     * @tc.name testFloat32ArraySortTwo060
     * @tc.desc Verify sort on mixed positive and negative decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.5, -1.5, 0.5);
      const r = arr.sort();
      const element065 = r.$_get(0);
      expect(element065).assertEqual(-1.5);
      const element065Part2 = r.$_get(2);
      expect(element065Part2).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0610
     * @tc.name testFloat32ArraySortTwo061
     * @tc.desc Verify sort on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const r = arr.sort();
      const element066 = r.$_get(0);
      expect(element066).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0620
     * @tc.name testFloat32ArraySortTwo062
     * @tc.desc Verify sort modifies the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const element068 = arr.$_get(0);
      expect(element068).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0630
     * @tc.name testFloat32ArraySortTwo063
     * @tc.desc Verify sort modifies array accessible via reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const snap = arr;
      arr.sort();
      expect(snap[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0640
     * @tc.name testFloat32ArraySortTwo064
     * @tc.desc Verify sort changes element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const firstBefore = arr.$_get(0);
      arr.sort();
      expect(firstBefore).assertEqual(3);
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0650
     * @tc.name testFloat32ArraySortTwo065
     * @tc.desc Verify sort produces consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.0, 1.0, 2.0);
      const b = Float32Array.of(3.0, 1.0, 2.0);
      a.sort();
      a.sort();
      b.sort();
      const element071 = a.$_get(0);
      expect(element071).assertEqual(b.$_get(0));
      const element071Part2 = a.$_get(2);
      expect(element071Part2).assertEqual(b.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0660
     * @tc.name testFloat32ArraySortTwo066
     * @tc.desc Verify length, byteLength, and byteOffset are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const len0 = arr.length;
      const bl0 = arr.byteLength;
      const bo0 = arr.byteOffset;
      arr.sort();
      expect(arr.length).assertEqual(len0);
      expect(arr.byteLength).assertEqual(bl0);
      expect(arr.byteOffset).assertEqual(bo0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0670
     * @tc.name testFloat32ArraySortTwo067
     * @tc.desc Verify sum of elements is preserved after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const sumBefore = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const sumAfter = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      expect(sumAfter).assertEqual(sumBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0680
     * @tc.name testFloat32ArraySortTwo068
     * @tc.desc Verify BYTES_PER_ELEMENT is unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const bpe = arr.BYTES_PER_ELEMENT;
      arr.sort();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(bpe);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0690
     * @tc.name testFloat32ArraySortTwo069
     * @tc.desc Verify sort().length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const lengthValue075 = arr.sort().length;
      expect(lengthValue075).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0700
     * @tc.name testFloat32ArraySortTwo070
     * @tc.desc Verify sort().reverse() returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const observedValue076 = arr.sort().reverse();
      expect(observedValue076).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0710
     * @tc.name testFloat32ArraySortTwo071
     * @tc.desc Verify sort() then sort with compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const cmp = (a: number, b: number): int => { return a > b ? -1 : (a < b ? 1 : 0); };
      const r = arr.sort().sort(cmp);
      expect(r).assertEqual(arr);
      const element077 = r.$_get(0);
      expect(element077).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0720
     * @tc.name testFloat32ArraySortTwo072
     * @tc.desc Verify sort().subarray shares the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const sub = arr.sort().subarray(0);
      expect(sub.buffer).assertEqual(arr.buffer);
      const element078 = sub.$_get(0);
      expect(element078).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0730
     * @tc.name testFloat32ArraySortTwo073
     * @tc.desc Verify sort().fill(0) fills array with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const r = arr.sort().fill(0);
      expect(r).assertEqual(arr);
      const element079 = arr.$_get(0);
      expect(element079).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0740
     * @tc.name testFloat32ArraySortTwo074
     * @tc.desc Verify sort().indexOf(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const indexValue080 = arr.sort().indexOf(1);
      expect(indexValue080).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0750
     * @tc.name testFloat32ArraySortTwo075
     * @tc.desc Verify sort()[0] accesses first sorted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const observedValue081 = arr.sort()[0];
      expect(observedValue081).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0760
     * @tc.name testFloat32ArraySortTwo076
     * @tc.desc Verify sort().slice creates an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const s = arr.sort().slice(0);
      s.$_set(0, 999);
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(1);
      const element082Part2 = s.$_get(0);
      expect(element082Part2).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0770
     * @tc.name testFloat32ArraySortTwo077
     * @tc.desc Verify sort().values() iterator yields sorted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const it = arr.sort().values();
      const iteratorValue083 = it.next().value;
      expect(iteratorValue083).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0780
     * @tc.name testFloat32ArraySortTwo078
     * @tc.desc Verify sort().join outputs comma-separated sorted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const joinedValue084 = arr.sort().join(',');
      expect(joinedValue084).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0790
     * @tc.name testFloat32ArraySortTwo079
     * @tc.desc Verify NaN values are sorted to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0, Number.NaN, 2.0);
      const r = arr.sort();
      const element085 = r.$_get(0);
      expect(element085).assertEqual(1);
      const element085Part2 = r.$_get(3);
      expect(element085Part2).assertNaN();
      const element085Part3 = r.$_get(4);
      expect(element085Part3).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0800
     * @tc.name testFloat32ArraySortTwo080
     * @tc.desc Verify NaN values are sorted to the end with numbers first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 2.0, Number.NaN, 1.0);
      const r = arr.sort();
      const element086 = r.$_get(0);
      expect(element086).assertEqual(1);
      const element086Part2 = r.$_get(1);
      expect(element086Part2).assertEqual(2);
      const element086Part3 = r.$_get(2);
      expect(element086Part3).assertNaN();
      const element086Part4 = r.$_get(3);
      expect(element086Part4).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0810
     * @tc.name testFloat32ArraySortTwo081
     * @tc.desc Verify Infinity is sorted to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.POSITIVE_INFINITY, 3.0, 2.0);
      const r = arr.sort();
      const element087 = r.$_get(0);
      expect(element087).assertEqual(1);
      const element087Part2 = r.$_get(3);
      expect(element087Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0820
     * @tc.name testFloat32ArraySortTwo082
     * @tc.desc Verify -Infinity is sorted to the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -Number.POSITIVE_INFINITY, 3.0, 2.0);
      const r = arr.sort();
      const element088 = r.$_get(0);
      expect(element088).assertEqual(-Number.POSITIVE_INFINITY);
      const element088Part2 = r.$_get(3);
      expect(element088Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0830
     * @tc.name testFloat32ArraySortTwo083
     * @tc.desc Verify 0 and -0 are treated as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0, 5.0);
      const r = arr.sort();
      let negativeZeroCount = 0;
      let positiveZeroCount = 0;
      for (let index = 0; index < 2; index++) {
        const inverse = 1.0 / r.$_get(index);
        if (inverse === -Number.POSITIVE_INFINITY) {
          negativeZeroCount = negativeZeroCount + 1;
        } else if (inverse === Number.POSITIVE_INFINITY) {
          positiveZeroCount = positiveZeroCount + 1;
        }
      }
      expect(negativeZeroCount).assertEqual(1);
      expect(positiveZeroCount).assertEqual(1);
      const element089Part3 = r.$_get(2);
      expect(element089Part3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0840
     * @tc.name testFloat32ArraySortTwo084
     * @tc.desc Verify -0 and 0 sort with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0, 0.0, -5.0);
      const r = arr.sort();
      const element090 = r.$_get(0);
      expect(element090).assertEqual(-5);
      const element090Part2 = 1.0 / r.$_get(1);
      expect(element090Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element090Part3 = 1.0 / r.$_get(2);
      expect(element090Part3).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0850
     * @tc.name testFloat32ArraySortTwo085
     * @tc.desc Verify Float32 max value sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: number = 3.4028234663852886e+38;
      const arr = Float32Array.of(1.0, max, 3.0);
      const r = arr.sort();
      const element091 = r.$_get(0);
      expect(element091).assertEqual(1);
      const element091Part2 = r.$_get(2);
      expect(element091Part2).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0860
     * @tc.name testFloat32ArraySortTwo086
     * @tc.desc Verify negative Float32 max value sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nmax: number = -3.4028234663852886e+38;
      const arr = Float32Array.of(1.0, nmax, 3.0);
      const r = arr.sort();
      const element092 = r.$_get(0);
      expect(element092).assertEqual(nmax);
      const element092Part2 = r.$_get(2);
      expect(element092Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0870
     * @tc.name testFloat32ArraySortTwo087
     * @tc.desc Verify minimum positive float32 value sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minn: number = 1.1754943508222875e-38;
      const arr = Float32Array.of(0.0, minn, 1.0);
      const r = arr.sort();
      const element093 = r.$_get(0);
      expect(element093).assertEqual(0);
      const element093Part2 = r.$_get(1);
      expect(element093Part2).assertEqual(minn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0880
     * @tc.name testFloat32ArraySortTwo088
     * @tc.desc Verify subnormal float32 value sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minv: number = 1.401298464324817e-45;
      const arr = Float32Array.of(1.0, minv, 0.0);
      const r = arr.sort();
      const element094 = r.$_get(0);
      expect(element094).assertEqual(0);
      const element094Part2 = r.$_get(1);
      expect(element094Part2).assertEqual(minv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0890
     * @tc.name testFloat32ArraySortTwo089
     * @tc.desc Verify 2^24 float32 precision boundary sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0, 1.0, 16777216.0);
      const r = arr.sort();
      const element095 = r.$_get(0);
      expect(element095).assertEqual(1);
      const element095Part2 = r.$_get(1);
      expect(element095Part2).assertEqual(16777216);
      const element095Part3 = r.$_get(2);
      expect(element095Part3).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0900
     * @tc.name testFloat32ArraySortTwo090
     * @tc.desc Verify values 0.1, 0.2, 0.3 sort correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = Float32Array.of(0.1);
      const arr = Float32Array.of(0.3, 0.1, 0.2);
      const r = arr.sort();
      const element096 = r.$_get(0);
      expect(element096).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0910
     * @tc.name testFloat32ArraySortTwo091
     * @tc.desc Verify 1e40 overflows to Infinity in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1e40, 3.0);
      const r = arr.sort();
      const element097 = r.$_get(2);
      expect(element097).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0920
     * @tc.name testFloat32ArraySortTwo092
     * @tc.desc Verify -1e40 overflows to -Infinity in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -1e40, 3.0);
      const r = arr.sort();
      const element098 = r.$_get(0);
      expect(element098).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0930
     * @tc.name testFloat32ArraySortTwo093
     * @tc.desc Verify 1e-46 underflows to 0 in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1e-46, 0.0);
      const r = arr.sort();
      const element099 = r.$_get(0);
      expect(element099).assertEqual(0);
      const element099Part2 = r.$_get(1);
      expect(element099Part2).assertEqual(0);
      const element099Part3 = r.$_get(2);
      expect(element099Part3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0940
     * @tc.name testFloat32ArraySortTwo094
     * @tc.desc Verify 1.0e3 sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2000.0, 1.0e3, 1500.0);
      const r = arr.sort();
      const element100 = r.$_get(0);
      expect(element100).assertEqual(1000);
      const element100Part2 = r.$_get(2);
      expect(element100Part2).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0950
     * @tc.name testFloat32ArraySortTwo095
     * @tc.desc Verify middle element is 9.0 after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 9.0, 8.0);
      const r = arr.sort();
      const element101 = r.$_get(1);
      expect(element101).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0960
     * @tc.name testFloat32ArraySortTwo096
     * @tc.desc Verify subnormal and normal float32 values sort correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub: number = 1.401298464324817e-45;
      const nor: number = 1.1754943508222875e-38;
      const arr = Float32Array.of(nor, sub, 0.0);
      const r = arr.sort();
      const element102 = r.$_get(1);
      expect(element102).assertEqual(sub);
      const element102Part2 = r.$_get(2);
      expect(element102Part2).assertEqual(nor);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0970
     * @tc.name testFloat32ArraySortTwo097
     * @tc.desc Verify values 1.0, 1.0000001, and 1.1 sort correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = Float32Array.of(1.1);
      const arr = Float32Array.of(1.0000001, 1.1, 1.0);
      const r = arr.sort();
      const element103 = r.$_get(0);
      expect(element103).assertEqual(1.0);
      const element103Part2 = r.$_get(2);
      expect(element103Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0980
     * @tc.name testFloat32ArraySortTwo098
     * @tc.desc Verify MAX_SAFE_INTEGER values sort in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: number = 9007199254740991;
      const arr = Float32Array.of(big + 1, 1.0, big - 1);
      const r = arr.sort();
      const element104 = r.$_get(0);
      expect(element104).assertEqual(1);
      const element104Part2 = r.$_get(1);
      expect(element104Part2).assertEqual(r.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_0990
     * @tc.name testFloat32ArraySortTwo099
     * @tc.desc Verify -Infinity, Infinity, and NaN sort correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -Number.POSITIVE_INFINITY, Number.NaN, 3.0, Number.POSITIVE_INFINITY, 2.0);
      const r = arr.sort();
      const element105 = r.$_get(0);
      expect(element105).assertEqual(-Number.POSITIVE_INFINITY);
      const element105Part2 = r.$_get(1);
      expect(element105Part2).assertEqual(1);
      const element105Part3 = r.$_get(5);
      expect(element105Part3).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1000
     * @tc.name testFloat32ArraySortTwo100
     * @tc.desc Verify float epsilon sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eps: number = 1.1920928955078125e-07;
      const arr = Float32Array.of(1.0, eps, 0.0);
      const r = arr.sort();
      const element106 = r.$_get(0);
      expect(element106).assertEqual(0);
      const element106Part2 = r.$_get(1);
      expect(element106Part2).assertEqual(eps);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1010
     * @tc.name testFloat32ArraySortTwo101
     * @tc.desc Verify 0 and -0 sort together with positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0, 1.0);
      const r = arr.sort();
      let negativeZeroCount = 0;
      let positiveZeroCount = 0;
      for (let index = 0; index < 2; index++) {
        const inverse = 1.0 / r.$_get(index);
        if (inverse === -Number.POSITIVE_INFINITY) {
          negativeZeroCount = negativeZeroCount + 1;
        } else if (inverse === Number.POSITIVE_INFINITY) {
          positiveZeroCount = positiveZeroCount + 1;
        }
      }
      expect(negativeZeroCount).assertEqual(1);
      expect(positiveZeroCount).assertEqual(1);
      const element107Part3 = r.$_get(2);
      expect(element107Part3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1020
     * @tc.name testFloat32ArraySortTwo102
     * @tc.desc Verify 2^24 precision boundary sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 1.0, 16777215.0);
      const r = arr.sort();
      const element108 = r.$_get(0);
      expect(element108).assertEqual(1);
      const element108Part2 = r.$_get(2);
      expect(element108Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1030
     * @tc.name testFloat32ArraySortTwo103
     * @tc.desc Verify negative subnormal float32 value sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nsub: number = -1.401298464324817e-45;
      const arr = Float32Array.of(0.0, nsub, -1.0);
      const r = arr.sort();
      const element109 = r.$_get(0);
      expect(element109).assertEqual(-1);
      const element109Part2 = r.$_get(1);
      expect(element109Part2).assertEqual(nsub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1040
     * @tc.name testFloat32ArraySortTwo104
     * @tc.desc Verify count of duplicate values is preserved after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 1.0, 2.0, 1.0, 2.0);
      const r = arr.sort();
      let cnt: number = 0;
      for (let i = 0; i < r.length; i++) { if (r.$_get(i) === 2) { cnt = cnt + 1; } }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1050
     * @tc.name testFloat32ArraySortTwo105
     * @tc.desc Verify sort on array with equal values preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 7.0, 7.0, 7.0);
      const r = arr.sort();
      expect(r.length).assertEqual(4);
      const element111 = r.$_get(0);
      expect(element111).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1060
     * @tc.name testFloat32ArraySortTwo106
     * @tc.desc Verify compareFn returning 0 preserves original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 3.0, 4.0, 3.0);
      const r = arr.sort((a: number, b: number): int => { return 0; });
      const element112 = r.$_get(0);
      expect(element112).assertEqual(4);
      const element112Part2 = r.$_get(3);
      expect(element112Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1070
     * @tc.name testFloat32ArraySortTwo107
     * @tc.desc Verify sort on all-equal array preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      const element113 = r.$_get(0);
      expect(element113).assertEqual(5);
      const element113Part2 = r.$_get(2);
      expect(element113Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1080
     * @tc.name testFloat32ArraySortTwo108
     * @tc.desc Verify compareFn throwing Error propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1090
     * @tc.name testFloat32ArraySortTwo109
     * @tc.desc Verify compareFn throwing RangeError propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      try {
        arr.sort((a: number, b: number): int => { throw new RangeError('out'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1100
     * @tc.name testFloat32ArraySortTwo110
     * @tc.desc Verify compareFn throwing TypeError propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      try {
        arr.sort((a: number, b: number): int => { throw new TypeError('bad'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1110
     * @tc.name testFloat32ArraySortTwo111
     * @tc.desc Verify sort with compareFn returning a-b (direct subtraction) sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SORT_TWO_1120
     * @tc.name testFloat32ArraySortTwo112
     * @tc.desc Verify sort with compareFn returning b-a (direct subtraction) sorts descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySortTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 3.0, 2.0);
      arr.sort((a: number, b: number): int => (b - a).toInt());
      expect(arr.$_get(0)).assertEqual(3.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(1.0);
    });

  });
}
