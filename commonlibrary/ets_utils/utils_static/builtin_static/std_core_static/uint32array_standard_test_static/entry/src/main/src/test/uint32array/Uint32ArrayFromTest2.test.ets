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

export default function uint32ArrayFromTest2(): void {
  describe('Uint32ArrayFromTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0100
     * @tc.name testUint32ArrayFromPartTwo001
     * @tc.desc Verify arity 1 - Set length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0200
     * @tc.name testUint32ArrayFromPartTwo002
     * @tc.desc Verify arity 1 - Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(10);
      src.add(20);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0300
     * @tc.name testUint32ArrayFromPartTwo003
     * @tc.desc Verify Set byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      const result = Uint32Array.from(src);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0400
     * @tc.name testUint32ArrayFromPartTwo004
     * @tc.desc Verify Set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(0);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0500
     * @tc.name testUint32ArrayFromPartTwo005
     * @tc.desc Verify Set -2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-2);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0600
     * @tc.name testUint32ArrayFromPartTwo006
     * @tc.desc Verify Set -100 4294967196
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-100);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(4294967196);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0700
     * @tc.name testUint32ArrayFromPartTwo007
     * @tc.desc Verify Set int32.MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(2147483647);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0800
     * @tc.name testUint32ArrayFromPartTwo008
     * @tc.desc Verify Set int32.MIN 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      const min: int = -2147483647 - 1;
      src.add(min);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_0900
     * @tc.name testUint32ArrayFromPartTwo009
     * @tc.desc Verify Set -2147483647 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-2147483647);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1000
     * @tc.name testUint32ArrayFromPartTwo010
     * @tc.desc Verify Set 0o777 ( 511)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(0o777);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1100
     * @tc.name testUint32ArrayFromPartTwo011
     * @tc.desc Verify Set 0b1010 ( 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(0b1010);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1200
     * @tc.name testUint32ArrayFromPartTwo012
     * @tc.desc Verify Set - add 1,1,2 [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1300
     * @tc.name testUint32ArrayFromPartTwo013
     * @tc.desc Verify Set -1,-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-1);
      src.add(-2);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1400
     * @tc.name testUint32ArrayFromPartTwo014
     * @tc.desc Verify Set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(0);
      src.add(-1);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1500
     * @tc.name testUint32ArrayFromPartTwo015
     * @tc.desc Verify Set int32 MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(2147483647);
      const min: int = -2147483647 - 1;
      src.add(min);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(2147483647);
      expect(result.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1600
     * @tc.name testUint32ArrayFromPartTwo016
     * @tc.desc Verify Set 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      for (let i = 0; i < 100; i++) {
        src.add(i);
      }
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(100);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1700
     * @tc.name testUint32ArrayFromPartTwo017
     * @tc.desc Verify Set 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(42);
      src.add(42);
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1800
     * @tc.name testUint32ArrayFromPartTwo018
     * @tc.desc Verify Set MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(2147483647);
      src.add(0);
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(2147483647);
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_1900
     * @tc.name testUint32ArrayFromPartTwo019
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2000
     * @tc.name testUint32ArrayFromPartTwo020
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      expect(result.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2100
     * @tc.name testUint32ArrayFromPartTwo021
     * @tc.desc Verify - Set (add)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      src.add(3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2200
     * @tc.name testUint32ArrayFromPartTwo022
     * @tc.desc Verify - clear Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      src.clear();
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2300
     * @tc.name testUint32ArrayFromPartTwo023
     * @tc.desc Verify - result Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(1);
      src.add(2);
      const result = Uint32Array.from(src);
      result.$_set(0, 99);
      expect(src.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2400
     * @tc.name testUint32ArrayFromPartTwo024
     * @tc.desc Verify Set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-1);
      src.add(-100);
      const min: int = -2147483647 - 1;
      src.add(min);
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2500
     * @tc.name testUint32ArrayFromPartTwo025
     * @tc.desc Verify Set -1 join "4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(-1);
      const result = Uint32Array.from(src);
      expect(result.join()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2600
     * @tc.name testUint32ArrayFromPartTwo026
     * @tc.desc Verify Set toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<int>();
      src.add(10);
      src.add(20);
      const result = Uint32Array.from(src);
      expect(result.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2700
     * @tc.name testUint32ArrayFromPartTwo027
     * @tc.desc Verify arity 1 - Array length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2800
     * @tc.name testUint32ArrayFromPartTwo028
     * @tc.desc Verify arity 1 - Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_2900
     * @tc.name testUint32ArrayFromPartTwo029
     * @tc.desc Verify [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42];
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3000
     * @tc.name testUint32ArrayFromPartTwo030
     * @tc.desc Verify Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3100
     * @tc.name testUint32ArrayFromPartTwo031
     * @tc.desc Verify Array 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1e3];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3200
     * @tc.name testUint32ArrayFromPartTwo032
     * @tc.desc Verify Array 0o777 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0o777];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3300
     * @tc.name testUint32ArrayFromPartTwo033
     * @tc.desc Verify Array 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0b1010];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3400
     * @tc.name testUint32ArrayFromPartTwo034
     * @tc.desc Verify Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, -1, 4294967295, 3.14];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(4294967295);
      expect(result.$_get(2)).assertEqual(4294967295);
      expect(result.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3500
     * @tc.name testUint32ArrayFromPartTwo035
     * @tc.desc Verify Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0, 0, 0];
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(5);
      expect(result.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3600
     * @tc.name testUint32ArrayFromPartTwo036
     * @tc.desc Verify Array 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [7, 7, 7];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3700
     * @tc.name testUint32ArrayFromPartTwo037
     * @tc.desc Verify Array 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(100);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3800
     * @tc.name testUint32ArrayFromPartTwo038
     * @tc.desc Verify Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1, 1, -2, 2];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(4294967294);
      expect(result.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_3900
     * @tc.name testUint32ArrayFromPartTwo039
     * @tc.desc Verify Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.9, 2.1, 3.99];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4000
     * @tc.name testUint32ArrayFromPartTwo040
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from(src);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4100
     * @tc.name testUint32ArrayFromPartTwo041
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from(src);
      expect(result.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4200
     * @tc.name testUint32ArrayFromPartTwo042
     * @tc.desc Verify - Array (push)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from(src);
      src.push(3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4300
     * @tc.name testUint32ArrayFromPartTwo043
     * @tc.desc Verify - result Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from(src);
      result.$_set(0, 99);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4400
     * @tc.name testUint32ArrayFromPartTwo044
     * @tc.desc Verify result join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const result = Uint32Array.from(src);
      expect(result.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4500
     * @tc.name testUint32ArrayFromPartTwo045
     * @tc.desc Verify result toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const result = Uint32Array.from(src);
      expect(result.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4600
     * @tc.name testUint32ArrayFromPartTwo046
     * @tc.desc Verify Array 0 MAX join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 4294967295];
      const result = Uint32Array.from(src);
      expect(result.join()).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4700
     * @tc.name testUint32ArrayFromPartTwo047
     * @tc.desc Verify Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 6, 7, 8];
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4800
     * @tc.name testUint32ArrayFromPartTwo048
     * @tc.desc Verify Array 4294967295 4294967296 (MAX )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967295, 4294967296];
      const result = Uint32Array.from(src);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_4900
     * @tc.name testUint32ArrayFromPartTwo049
     * @tc.desc Verify Array indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const result = Uint32Array.from(src);
      expect(result.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5000
     * @tc.name testUint32ArrayFromPartTwo050
     * @tc.desc Verify arity 2 - ArrayLike<number> + identity mapfn length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5100
     * @tc.name testUint32ArrayFromPartTwo051
     * @tc.desc Verify arity 2 - mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v + 10;
      });
      expect(result.$_get(0)).assertEqual(11);
      expect(result.$_get(1)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5200
     * @tc.name testUint32ArrayFromPartTwo052
     * @tc.desc Verify ArrayLike length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5300
     * @tc.name testUint32ArrayFromPartTwo053
     * @tc.desc Verify ArrayLike + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v * 2;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5400
     * @tc.name testUint32ArrayFromPartTwo054
     * @tc.desc Verify ArrayLike<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.length).assertEqual(4);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5500
     * @tc.name testUint32ArrayFromPartTwo055
     * @tc.desc Verify ArrayLike<string> (U=string) parseInt length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['1', '2', '3'];
      const result = Uint32Array.from<string>(src, (v: string, k: number): number => {
        return parseInt(v);
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5600
     * @tc.name testUint32ArrayFromPartTwo056
     * @tc.desc Verify ArrayLike 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.length).assertEqual(100);
      expect(result.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5700
     * @tc.name testUint32ArrayFromPartTwo057
     * @tc.desc Verify mapfn 2147483647 (int32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return 2147483647;
      });
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5800
     * @tc.name testUint32ArrayFromPartTwo058
     * @tc.desc Verify mapfn 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return 1e3;
      });
      expect(result.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_5900
     * @tc.name testUint32ArrayFromPartTwo059
     * @tc.desc Verify mapfn 9007199254740991 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return 9007199254740991;
      });
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6000
     * @tc.name testUint32ArrayFromPartTwo060
     * @tc.desc Verify mapfn k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return k;
      });
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6100
     * @tc.name testUint32ArrayFromPartTwo061
     * @tc.desc Verify mapfn v + k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v + k;
      });
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(21);
      expect(result.$_get(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6200
     * @tc.name testUint32ArrayFromPartTwo062
     * @tc.desc Verify mapfn v * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 10, 15];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v * 2;
      });
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6300
     * @tc.name testUint32ArrayFromPartTwo063
     * @tc.desc Verify mapfn k * 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return k * 10;
      });
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6400
     * @tc.name testUint32ArrayFromPartTwo064
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        if (k === 0) {
          return 100;
        }
        if (k === 1) {
          return 200;
        }
        return 300;
      });
      expect(result.$_get(0)).assertEqual(100);
      expect(result.$_get(1)).assertEqual(200);
      expect(result.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6500
     * @tc.name testUint32ArrayFromPartTwo065
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const base: number = 100;
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v + base;
      });
      expect(result.$_get(0)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6600
     * @tc.name testUint32ArrayFromPartTwo066
     * @tc.desc Verify mapfn ( counter)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let counter: number = 0;
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        counter = counter + 1;
        return v;
      });
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6700
     * @tc.name testUint32ArrayFromPartTwo067
     * @tc.desc Verify mapfn ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const collected: Array<number> = [];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        collected.push(v);
        return v;
      });
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6800
     * @tc.name testUint32ArrayFromPartTwo068
     * @tc.desc Verify U=string parseInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['10', '20'];
      const result = Uint32Array.from<string>(src, (v: string, k: number): number => {
        return parseInt(v);
      });
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_6900
     * @tc.name testUint32ArrayFromPartTwo069
     * @tc.desc Verify U=number v * v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2, 3, 4];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v * v;
      });
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(9);
      expect(result.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7000
     * @tc.name testUint32ArrayFromPartTwo070
     * @tc.desc Verify mapfn (v===2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        Uint32Array.from<number>(src, (v: number, k: number): number => {
          if (v === 2) {
            throw new Error('value throw');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7100
     * @tc.name testUint32ArrayFromPartTwo071
     * @tc.desc Verify byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7200
     * @tc.name testUint32ArrayFromPartTwo072
     * @tc.desc Verify BYTES_PER_ELEMENT = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v;
      });
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7300
     * @tc.name testUint32ArrayFromPartTwo073
     * @tc.desc Verify mapfn result join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v + 1;
      });
      expect(result.join()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7400
     * @tc.name testUint32ArrayFromPartTwo074
     * @tc.desc Verify ArrayLike + mapfn (mapfn ) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        if (v > 0) {
          throw new Error('never called');
        }
        return v;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTTWO_7500
     * @tc.name testUint32ArrayFromPartTwo075
     * @tc.desc Verify mapfn ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const result = Uint32Array.from<number>(src, (v: number, k: number): number => {
        return v + 1;
      });
      expect(result.$_get(0)).assertEqual(11);
      expect(result.$_get(1)).assertEqual(21);
      expect(result.$_get(2)).assertEqual(31);
    });

  });
}
