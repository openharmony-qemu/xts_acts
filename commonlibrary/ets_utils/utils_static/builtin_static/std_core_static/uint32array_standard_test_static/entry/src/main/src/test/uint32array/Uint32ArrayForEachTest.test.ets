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

export default function uint32ArrayForEachTest(): void {
  describe('Uint32ArrayForEachTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0100
     * @tc.name testUint32ArrayForEachPartOne001
     * @tc.desc Verify forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      let sum: number = 0;
      arr.forEach((v: number) => { sum = sum + v; });
      expect(sum).assertEqual(18);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0200
     * @tc.name testUint32ArrayForEachPartOne002
     * @tc.desc Verify forEach undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.forEach((v: number) => {});
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0300
     * @tc.name testUint32ArrayForEachPartOne003
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      let last: number = 0;
      arr.forEach((v: number) => { last = v; });
      expect(last).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0400
     * @tc.name testUint32ArrayForEachPartOne004
     * @tc.desc Verify function callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastVal: number = 0;
      const arr = Uint32Array.of(10, 20);
      arr.forEach((v: number): void => { lastVal = v; });
      expect(lastVal).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0500
     * @tc.name testUint32ArrayForEachPartOne005
     * @tc.desc Verify const callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      let seen: number = 0;
      const cb = (v: number): void => { seen = v; };
      arr.forEach(cb);
      expect(seen).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0600
     * @tc.name testUint32ArrayForEachPartOne006
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: number = 0;
      arr.forEach(() => { count = count + 1; });
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0700
     * @tc.name testUint32ArrayForEachPartOne007
     * @tc.desc Verify 1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      let got: number = 0;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0800
     * @tc.name testUint32ArrayForEachPartOne008
     * @tc.desc Verify 2 value, index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 4);
      let lastIdx: number = -1;
      arr.forEach((v: number, i: int) => { lastIdx = i; });
      expect(lastIdx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_0900
     * @tc.name testUint32ArrayForEachPartOne009
     * @tc.desc Verify 3 value, index, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9);
      let gotLen: number = 0;
      arr.forEach((v: number, i: int, a: Uint32Array) => { gotLen = a.length; });
      expect(gotLen).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1000
     * @tc.name testUint32ArrayForEachPartOne010
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1100
     * @tc.name testUint32ArrayForEachPartOne011
     * @tc.desc Verify value 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b11111111);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1200
     * @tc.name testUint32ArrayForEachPartOne012
     * @tc.desc Verify value 0b1111 =15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b1111);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1300
     * @tc.name testUint32ArrayForEachPartOne013
     * @tc.desc Verify value 0x7FFFFFFE int32.MAX - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x7FFFFFFE);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(2147483646);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1400
     * @tc.name testUint32ArrayForEachPartOne014
     * @tc.desc Verify value 0xFFFFFFFD MAX - 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFD);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(4294967293);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1500
     * @tc.name testUint32ArrayForEachPartOne015
     * @tc.desc Verify value 0xFF00 =65280
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFF00);
      let got: number = -1;
      arr.forEach((v: number) => { got = v; });
      expect(got).assertEqual(65280);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1600
     * @tc.name testUint32ArrayForEachPartOne016
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let firstIdx: number = 99;
      arr.forEach((v: number, i: int) => { if (i === 0) { firstIdx = i; } });
      expect(firstIdx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1700
     * @tc.name testUint32ArrayForEachPartOne017
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let i0: number = -1;
      let i1: number = -1;
      let i2: number = -1;
      arr.forEach((v: number, i: int) => {
        if (i === 0) { i0 = i; }
        if (i === 1) { i1 = i; }
        if (i === 2) { i2 = i; }
      });
      expect(i0).assertEqual(0);
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1800
     * @tc.name testUint32ArrayForEachPartOne018
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      let idx: number = -1;
      arr.forEach((v: number, i: int) => { idx = i; });
      expect(idx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_1900
     * @tc.name testUint32ArrayForEachPartOne019
     * @tc.desc Verify index [0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      let a0: number = -1;
      let a1: number = -1;
      arr.forEach((v: number, i: int) => {
        if (i === 0) { a0 = i; }
        if (i === 1) { a1 = i; }
      });
      expect(a0).assertEqual(0);
      expect(a1).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2000
     * @tc.name testUint32ArrayForEachPartOne020
     * @tc.desc Verify index length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let maxIdx: number = -1;
      arr.forEach((v: number, i: int) => { if (i > maxIdx) { maxIdx = i; } });
      expect(maxIdx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2100
     * @tc.name testUint32ArrayForEachPartOne021
     * @tc.desc Verify index length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let count: number = 0;
      arr.forEach((v: number, i: int) => { count = count + 1; });
      expect(count).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2200
     * @tc.name testUint32ArrayForEachPartOne022
     * @tc.desc Verify array Uint32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.forEach((v: number, i: int, a: Uint32Array) => { a[i] = 999; });
      expect(arr[0]).assertEqual(999);
      expect(arr[1]).assertEqual(999);
      expect(arr[2]).assertEqual(999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2300
     * @tc.name testUint32ArrayForEachPartOne023
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let len: number = 0;
      arr.forEach((v: number, i: int, a: Uint32Array) => { len = a.length; });
      expect(len).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2400
     * @tc.name testUint32ArrayForEachPartOne024
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42, 43, 44);
      let first: number = 0;
      arr.forEach((v: number, i: int, a: Uint32Array) => { first = a[0]; });
      expect(first).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2500
     * @tc.name testUint32ArrayForEachPartOne025
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let l1: number = 0;
      let l2: number = 0;
      let l3: number = 0;
      arr.forEach((v: number, i: int, a: Uint32Array) => {
        if (i === 0) { l1 = a.length; }
        if (i === 1) { l2 = a.length; }
        if (i === 2) { l3 = a.length; }
      });
      expect(l1).assertEqual(3);
      expect(l2).assertEqual(3);
      expect(l3).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2600
     * @tc.name testUint32ArrayForEachPartOne026
     * @tc.desc Verify array.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      let bpe: number = 0;
      arr.forEach((v: number, i: int, a: Uint32Array) => { bpe = a.BYTES_PER_ELEMENT; });
      expect(bpe).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2700
     * @tc.name testUint32ArrayForEachPartOne027
     * @tc.desc Verify forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let count: number = 0;
      arr.forEach((v: number) => { count = count + 1; });
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2800
     * @tc.name testUint32ArrayForEachPartOne028
     * @tc.desc Verify return; forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let count: number = 0;
      arr.forEach((v: number) => { count = count + 1; return; });
      expect(count).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_2900
     * @tc.name testUint32ArrayForEachPartOne029
     * @tc.desc Verify return;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 10, 15);
      let acc: number = 0;
      arr.forEach((v: number) => { if (v === 10) { return; } acc = acc + v; });
      expect(acc).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_3000
     * @tc.name testUint32ArrayForEachPartOne030
     * @tc.desc Verify return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: number = 0;
      arr.forEach((v: number) => { count = count + 1; });
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_3100
     * @tc.name testUint32ArrayForEachPartOne031
     * @tc.desc Verify return;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: number = 0;
      arr.forEach((v: number) => { count = count + 1; if (v === 3) { return; } });
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTONE_3200
     * @tc.name testUint32ArrayForEachPartOne032
     * @tc.desc Verify return; forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let collected: number = 0;
      arr.forEach((v: number) => { collected = collected + v; return; });
      expect(collected).assertEqual(6);
    });

  });
}
