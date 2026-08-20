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

export default function uint32ArrayReduceTwoTest(): void {
  describe('Uint32ArrayReduceTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0100
     * @tc.name testUint32ArrayReduceTwo001
     * @tc.desc Verify reduce callback arity number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p - c; });
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0200
     * @tc.name testUint32ArrayReduceTwo002
     * @tc.desc Verify callback prev*curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2, 3, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p * c; });
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0300
     * @tc.name testUint32ArrayReduceTwo003
     * @tc.desc Verify callback prev/curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 5);
      const r: number = arr.reduce((p: number, c: number) => { return p / c; });
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0400
     * @tc.name testUint32ArrayReduceTwo004
     * @tc.desc Verify callback Math.max(prev,curr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 7, 2);
      const r: number = arr.reduce((p: number, c: number) => { return Math.max(p, c); });
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0500
     * @tc.name testUint32ArrayReduceTwo005
     * @tc.desc Verify callback Math.min(prev,curr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 1, 3);
      const r: number = arr.reduce((p: number, c: number) => { return Math.min(p, c); });
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0600
     * @tc.name testUint32ArrayReduceTwo006
     * @tc.desc Verify callback curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return c; });
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0700
     * @tc.name testUint32ArrayReduceTwo007
     * @tc.desc Verify callback prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p; });
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0800
     * @tc.name testUint32ArrayReduceTwo008
     * @tc.desc Verify callback 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return 0; });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_0900
     * @tc.name testUint32ArrayReduceTwo009
     * @tc.desc Verify callback prev*curr+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2, 3, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p * c + 1; });
      expect(r).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1000
     * @tc.name testUint32ArrayReduceTwo010
     * @tc.desc Verify callback prev|curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p | c; });
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1100
     * @tc.name testUint32ArrayReduceTwo011
     * @tc.desc Verify callback prev&curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 2);
      const r: number = arr.reduce((p: number, c: number) => { return p & c; });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1200
     * @tc.name testUint32ArrayReduceTwo012
     * @tc.desc Verify callback prev^curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 3, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p ^ c; });
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1300
     * @tc.name testUint32ArrayReduceTwo013
     * @tc.desc Verify callback prev+c uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1400
     * @tc.name testUint32ArrayReduceTwo014
     * @tc.desc Verify callback returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return Number.POSITIVE_INFINITY; });
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1500
     * @tc.name testUint32ArrayReduceTwo015
     * @tc.desc Verify callback curr*10+prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return c * 10 + p; });
      expect(r).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1600
     * @tc.name testUint32ArrayReduceTwo016
     * @tc.desc Verify callback prev prev*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p * 2; });
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1700
     * @tc.name testUint32ArrayReduceTwo017
     * @tc.desc Verify callback curr curr*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return c * 2; });
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1800
     * @tc.name testUint32ArrayReduceTwo018
     * @tc.desc Verify callback idx index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint32Array) => { return i; });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_1900
     * @tc.name testUint32ArrayReduceTwo019
     * @tc.desc Verify callback prev+curr+idx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint32Array) => { return p + c + i; });
      expect(r).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2000
     * @tc.name testUint32ArrayReduceTwo020
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p * c; });
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2100
     * @tc.name testUint32ArrayReduceTwo021
     * @tc.desc Verify const reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const fn: (p: number, c: number) => number = (p: number, c: number) => { return p + c; };
      const r: number = arr.reduce(fn);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2200
     * @tc.name testUint32ArrayReduceTwo022
     * @tc.desc Verify callback const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const bias: number = 100;
      const r: number = arr.reduce((p: number, c: number) => { return p + c + bias; });
      expect(r).assertEqual(206);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2300
     * @tc.name testUint32ArrayReduceTwo023
     * @tc.desc Verify callback let curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let total: number = 0;
      const r: number = arr.reduce((p: number, c: number) => { total = total + c; return p + c; });
      expect(total).assertEqual(5);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2400
     * @tc.name testUint32ArrayReduceTwo024
     * @tc.desc Verify callback reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Uint32Array = Uint32Array.of(1, 2, 3);
      const inner: Uint32Array = Uint32Array.of(10, 20);
      const r: number = outer.reduce((p: number, c: number) => {
        const s: number = inner.reduce((x: number, y: number) => { return x + y; });
        return p + c + s;
      });
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2500
     * @tc.name testUint32ArrayReduceTwo025
     * @tc.desc Verify callback 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5);
      let calls: int = 0;
      const r: number = arr.reduce((p: number, c: number) => { calls = calls + 1; return p + c; });
      expect(calls).assertEqual(0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2600
     * @tc.name testUint32ArrayReduceTwo026
     * @tc.desc Verify callback 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      let calls: int = 0;
      const r: number = arr.reduce((p: number, c: number) => { calls = calls + 1; return p + c; });
      expect(calls).assertEqual(1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2700
     * @tc.name testUint32ArrayReduceTwo027
     * @tc.desc Verify callback 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let calls: int = 0;
      const r: number = arr.reduce((p: number, c: number) => { calls = calls + 1; return p + c; });
      expect(calls).assertEqual(2);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2800
     * @tc.name testUint32ArrayReduceTwo028
     * @tc.desc Verify callback 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let calls: int = 0;
      const r: number = arr.reduce((p: number, c: number) => { calls = calls + 1; return p + c; });
      expect(calls).assertEqual(4);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_2900
     * @tc.name testUint32ArrayReduceTwo029
     * @tc.desc Verify [8] reduce 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(8);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3000
     * @tc.name testUint32ArrayReduceTwo030
     * @tc.desc Verify [0] reduce 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3100
     * @tc.name testUint32ArrayReduceTwo031
     * @tc.desc Verify [4294967295] reduce uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3200
     * @tc.name testUint32ArrayReduceTwo032
     * @tc.desc Verify [0x80000000] 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0x80000000);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3300
     * @tc.name testUint32ArrayReduceTwo033
     * @tc.desc Verify [0o377] 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0o377);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3400
     * @tc.name testUint32ArrayReduceTwo034
     * @tc.desc Verify [0b1010] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0b1010);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3500
     * @tc.name testUint32ArrayReduceTwo035
     * @tc.desc Verify [0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3600
     * @tc.name testUint32ArrayReduceTwo036
     * @tc.desc Verify [0,1] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3700
     * @tc.name testUint32ArrayReduceTwo037
     * @tc.desc Verify [MAX,MAX] 8589934590
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 4294967295);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(8589934590);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3800
     * @tc.name testUint32ArrayReduceTwo038
     * @tc.desc Verify [MAX,1] 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p * c; });
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_3900
     * @tc.name testUint32ArrayReduceTwo039
     * @tc.desc Verify [0,MAX] MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295);
      const r: number = arr.reduce((p: number, c: number) => { return Math.max(p, c); });
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4000
     * @tc.name testUint32ArrayReduceTwo040
     * @tc.desc Verify [MAX,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 0);
      const r: number = arr.reduce((p: number, c: number) => { return Math.min(p, c); });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4100
     * @tc.name testUint32ArrayReduceTwo041
     * @tc.desc Verify [-1 uint32 , 0] 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1, 0);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4200
     * @tc.name testUint32ArrayReduceTwo042
     * @tc.desc Verify [1,2,3,4,5] 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const r: number = arr.reduce((p: number, c: number) => { return p * c; });
      expect(r).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4300
     * @tc.name testUint32ArrayReduceTwo043
     * @tc.desc Verify [5,4,3,2,1] 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 4, 3, 2, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4400
     * @tc.name testUint32ArrayReduceTwo044
     * @tc.desc Verify [5,4,3,2,1] -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 4, 3, 2, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p - c; });
      expect(r).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4500
     * @tc.name testUint32ArrayReduceTwo045
     * @tc.desc Verify [10,20,30] 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: number = arr.reduce((p: number, c: number) => { return Math.max(p, c); });
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4600
     * @tc.name testUint32ArrayReduceTwo046
     * @tc.desc Verify [0,0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4700
     * @tc.name testUint32ArrayReduceTwo047
     * @tc.desc Verify MAX 12884901885
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(12884901885);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4800
     * @tc.name testUint32ArrayReduceTwo048
     * @tc.desc Verify 1000 0..999 499500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: number[] = [];
      for (let i = 0; i < 1000; i++) { data.push(i); }
      const arr: Uint32Array = new Uint32Array(data);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(499500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_4900
     * @tc.name testUint32ArrayReduceTwo049
     * @tc.desc Verify 65535 1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: number[] = [];
      for (let i = 0; i < 65535; i++) { data.push(1); }
      const arr: Uint32Array = new Uint32Array(data);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5000
     * @tc.name testUint32ArrayReduceTwo050
     * @tc.desc Verify [1,2,3] prev*10+curr 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p * 10 + c; });
      expect(r).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5100
     * @tc.name testUint32ArrayReduceTwo051
     * @tc.desc Verify [10,20,30] currentIndex 1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const seen: int[] = [];
      arr.reduce((p: number, c: number, i: int, a: Uint32Array) => { seen.push(i); return p + c; });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5200
     * @tc.name testUint32ArrayReduceTwo052
     * @tc.desc Verify currentIndex length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7, 8, 9, 10);
      let lastIdx: int = -1;
      arr.reduce((p: number, c: number, i: int, a: Uint32Array) => { lastIdx = i; return p + c; });
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5300
     * @tc.name testUint32ArrayReduceTwo053
     * @tc.desc Verify 3 currentIndex 3 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let thirdIdx: int = 0;
      let calls: int = 0;
      arr.reduce((p: number, c: number, i: int, a: Uint32Array) => {
        calls = calls + 1;
        if (calls === 3) { thirdIdx = i; }
        return p + c;
      });
      expect(thirdIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5400
     * @tc.name testUint32ArrayReduceTwo054
     * @tc.desc Verify currentIndex 2 currentValue 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint32Array) => {
        if (i === 2) { expect(c).assertEqual(3); }
        return p + c;
      });
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5500
     * @tc.name testUint32ArrayReduceTwo055
     * @tc.desc Verify [10,20,30,40] currentIndex 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const seen: int[] = [];
      arr.reduce((p: number, c: number, i: int, a: Uint32Array) => { seen.push(i); return p + c; });
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(1);
      expect(seen[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5600
     * @tc.name testUint32ArrayReduceTwo056
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce(
        (p: number, c: number, i: int, a: Uint32Array) => { expect(a === arr).assertTrue(); return p + c; }
      );
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5700
     * @tc.name testUint32ArrayReduceTwo057
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = arr.reduce(
        (p: number, c: number, i: int, a: Uint32Array) => { expect(a.length).assertEqual(4); return p + c; }
      );
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5800
     * @tc.name testUint32ArrayReduceTwo058
     * @tc.desc Verify array BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const r: number = arr.reduce(
        (p: number, c: number, i: int, a: Uint32Array) => { expect(a.BYTES_PER_ELEMENT).assertEqual(4); return p + c; }
      );
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_5900
     * @tc.name testUint32ArrayReduceTwo059
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7, 8, 9);
      const r: number = arr.reduce(
        (p: number, c: number, i: int, a: Uint32Array) => { expect(a.$_get(0)).assertEqual(7); return p + c; }
      );
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6000
     * @tc.name testUint32ArrayReduceTwo060
     * @tc.desc Verify callback currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint32Array) => {
        if (i === 1) { a.$_set(2, 100); }
        return p + c;
      });
      expect(r).assertEqual(107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6100
     * @tc.name testUint32ArrayReduceTwo061
     * @tc.desc Verify callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint32Array) => {
        a.$_set(0, 999);
        return p + c;
      });
      expect(r).assertEqual(6);
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6200
     * @tc.name testUint32ArrayReduceTwo062
     * @tc.desc Verify array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce(
        (p: number, c: number, i: int, a: Uint32Array) => { expect(a.byteLength).assertEqual(12); return p + c; }
      );
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6300
     * @tc.name testUint32ArrayReduceTwo063
     * @tc.desc Verify [10,20,30]=60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6400
     * @tc.name testUint32ArrayReduceTwo064
     * @tc.desc Verify [1,2,3,4]=24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p * c; });
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6500
     * @tc.name testUint32ArrayReduceTwo065
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      arr.$_set(0, 999);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6600
     * @tc.name testUint32ArrayReduceTwo066
     * @tc.desc Verify [1,2,3] reduce sum plus 1 equals 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6700
     * @tc.name testUint32ArrayReduceTwo067
     * @tc.desc Verify number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      const doubled: number = r * 2;
      expect(doubled).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6800
     * @tc.name testUint32ArrayReduceTwo068
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let manual: number = arr.$_get(0);
      for (let i = 1; i < arr.length; i++) { manual = manual + arr.$_get(i); }
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(manual);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_6900
     * @tc.name testUint32ArrayReduceTwo069
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 7, 2, 9, 4);
      let manual: number = arr.$_get(0);
      for (let i = 1; i < arr.length; i++) { if (arr.$_get(i) > manual) { manual = arr.$_get(i); } }
      const r: number = arr.reduce((p: number, c: number) => { return Math.max(p, c); });
      expect(r).assertEqual(manual);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7000
     * @tc.name testUint32ArrayReduceTwo070
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      try {
        arr.reduce((p: number, c: number) => { return p + c; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7100
     * @tc.name testUint32ArrayReduceTwo071
     * @tc.desc Verify callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7200
     * @tc.name testUint32ArrayReduceTwo072
     * @tc.desc Verify callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number) => { calls = calls + 1; throw new Error('first'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(1);
        expect(e.message).assertEqual('first');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7300
     * @tc.name testUint32ArrayReduceTwo073
     * @tc.desc Verify callback 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number) => {
          calls = calls + 1;
          if (calls === 2) { throw new Error('mid'); }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(2);
        expect(e.message).assertEqual('mid');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7400
     * @tc.name testUint32ArrayReduceTwo074
     * @tc.desc Verify callback 5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number) => {
          calls = calls + 1;
          if (calls === 4) { throw new Error('last'); }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(4);
        expect(e.message).assertEqual('last');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7500
     * @tc.name testUint32ArrayReduceTwo075
     * @tc.desc Verify callback 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number) => {
          calls = calls + 1;
          if (calls === 3) { throw new Error('halt3'); }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(3);
        expect(e.message).assertEqual('halt3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7600
     * @tc.name testUint32ArrayReduceTwo076
     * @tc.desc Verify [10,1,1] 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 1, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p - c; });
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7700
     * @tc.name testUint32ArrayReduceTwo077
     * @tc.desc Verify [100,2,5] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 2, 5);
      const r: number = arr.reduce((p: number, c: number) => { return p / c; });
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7800
     * @tc.name testUint32ArrayReduceTwo078
     * @tc.desc Verify reduce prev curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7, 9);
      let calls: int = 0;
      let firstP: number = -1;
      let firstC: number = -1;
      const r: number = arr.reduce(
        (p: number, c: number) => { calls = calls + 1; firstP = p; firstC = c; return p + c; }
      );
      expect(calls).assertEqual(1);
      expect(firstP).assertEqual(7);
      expect(firstC).assertEqual(9);
      expect(r).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_7900
     * @tc.name testUint32ArrayReduceTwo079
     * @tc.desc Verify [1,2,3,4] 1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = arr.reduce((p: number, c: number) => { return p * 10 + c; });
      expect(r).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8000
     * @tc.name testUint32ArrayReduceTwo080
     * @tc.desc Verify currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const order: number[] = [];
      arr.reduce((p: number, c: number, i: int, a: Uint32Array): number => { order.push(c); return p + c; });
      expect(order[0]).assertEqual(2);
      expect(order[1]).assertEqual(3);
      expect(order[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8100
     * @tc.name testUint32ArrayReduceTwo081
     * @tc.desc Verify reduce length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(15);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8200
     * @tc.name testUint32ArrayReduceTwo082
     * @tc.desc Verify [2147483647,1] 2147483648 int32.MAX+1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647, 1);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8300
     * @tc.name testUint32ArrayReduceTwo083
     * @tc.desc Verify [1,5,5] -9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 5, 5);
      const r: number = arr.reduce((p: number, c: number) => { return p - c; });
      expect(r).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8400
     * @tc.name testUint32ArrayReduceTwo084
     * @tc.desc Verify callback 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 3, 1);
      let calls: int = 0;
      const r: number = arr.reduce(
        (p: number, c: number) => { calls = calls + 1; if (calls === 1) { return 0; } return p + c; }
      );
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8500
     * @tc.name testUint32ArrayReduceTwo085
     * @tc.desc Verify 100 uint32 429496729500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: number[] = [];
      for (let i = 0; i < 100; i++) { data.push(4294967295); }
      const arr: Uint32Array = new Uint32Array(data);
      const r: number = arr.reduce((p: number, c: number) => { return p + c; });
      expect(r).assertEqual(429496729500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_TWO_8600
     * @tc.name testUint32ArrayReduceTwo086
     * @tc.desc Verify reduce on two arrays computes identical sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint32Array = Uint32Array.of(1, 2, 3);
      const b: Uint32Array = Uint32Array.of(3, 2, 1);
      const ra: number = a.reduce((p: number, c: number) => { return p + c; });
      const rb: number = b.reduce((p: number, c: number) => { return p + c; });
      expect(ra).assertEqual(rb);
      expect(ra).assertEqual(6);
    });

  });
}
