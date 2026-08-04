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

export default function uint32ArrayJoinTest2(): void {
  describe('Uint32ArrayJoinTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0100
     * @tc.name testUint32ArrayJoinPartTwo001
     * @tc.desc Verify join() typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(2);
      arr[0] = 4294967296;
      arr[1] = -1;
      const result: string = arr.join();
      expect(result).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0200
     * @tc.name testUint32ArrayJoinPartTwo002
     * @tc.desc Verify [2147483647] join() '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647);
      expect(arr.join()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0300
     * @tc.name testUint32ArrayJoinPartTwo003
     * @tc.desc Verify 4294967296 join() '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = 4294967296;
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0400
     * @tc.name testUint32ArrayJoinPartTwo004
     * @tc.desc Verify -1 join() '4294967295'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = -1;
      expect(arr.join()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0500
     * @tc.name testUint32ArrayJoinPartTwo005
     * @tc.desc Verify -2147483648 join() '2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = -2147483648;
      expect(arr.join()).assertEqual('2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0600
     * @tc.name testUint32ArrayJoinPartTwo006
     * @tc.desc Verify 3.14 join() '3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = 3.14;
      expect(arr.join()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0700
     * @tc.name testUint32ArrayJoinPartTwo007
     * @tc.desc Verify Number.NaN join() '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = Number.NaN;
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0800
     * @tc.name testUint32ArrayJoinPartTwo008
     * @tc.desc Verify Number.POSITIVE_INFINITY join() '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = Number.POSITIVE_INFINITY;
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_0900
     * @tc.name testUint32ArrayJoinPartTwo009
     * @tc.desc Verify Number.NEGATIVE_INFINITY join() '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = Number.NEGATIVE_INFINITY;
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1000
     * @tc.name testUint32ArrayJoinPartTwo010
     * @tc.desc Verify uint32 MAX 0 [4294967295,0] join() '4294967295,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 0);
      expect(arr.join()).assertEqual('4294967295,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1100
     * @tc.name testUint32ArrayJoinPartTwo011
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const sep: string = '----------';
      expect(arr.join(sep)).assertEqual('1----------2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1200
     * @tc.name testUint32ArrayJoinPartTwo012
     * @tc.desc Verify join() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1300
     * @tc.name testUint32ArrayJoinPartTwo013
     * @tc.desc Verify join(',') toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 200);
      expect(arr.join(',')).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1400
     * @tc.name testUint32ArrayJoinPartTwo014
     * @tc.desc Verify join() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      expect(arr.join().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1500
     * @tc.name testUint32ArrayJoinPartTwo015
     * @tc.desc Verify [5] join() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5);
      expect(arr.join().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1600
     * @tc.name testUint32ArrayJoinPartTwo016
     * @tc.desc Verify [0] join() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0);
      expect(arr.join().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1700
     * @tc.name testUint32ArrayJoinPartTwo017
     * @tc.desc Verify [uint32 MAX] join() length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295);
      expect(arr.join().length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1800
     * @tc.name testUint32ArrayJoinPartTwo018
     * @tc.desc Verify [1,2] join() length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      expect(arr.join().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_1900
     * @tc.name testUint32ArrayJoinPartTwo019
     * @tc.desc Verify [1,2] join('|') length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      expect(arr.join('|').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2000
     * @tc.name testUint32ArrayJoinPartTwo020
     * @tc.desc Verify [1,2] join('') length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      expect(arr.join('').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2100
     * @tc.name testUint32ArrayJoinPartTwo021
     * @tc.desc Verify [10,20,30] join() length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(arr.join().length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2200
     * @tc.name testUint32ArrayJoinPartTwo022
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 22, 333);
      expect(arr.join('-').length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2300
     * @tc.name testUint32ArrayJoinPartTwo023
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      expect(arr.join('ABC').length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2400
     * @tc.name testUint32ArrayJoinPartTwo024
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: number = arr.length;
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2|3');
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2500
     * @tc.name testUint32ArrayJoinPartTwo025
     * @tc.desc Verify join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: number = arr.byteLength;
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2|3');
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2600
     * @tc.name testUint32ArrayJoinPartTwo026
     * @tc.desc Verify join size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const before: number = arr.length;
      const result: string = arr.join('-');
      expect(result).assertEqual('1-2-3-4');
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2700
     * @tc.name testUint32ArrayJoinPartTwo027
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      const result: string = arr.join('|');
      expect(result).assertEqual('11|22|33');
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2800
     * @tc.name testUint32ArrayJoinPartTwo028
     * @tc.desc Verify join byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 4, 2);
      arr[0] = 1;
      arr[1] = 2;
      const before: number = arr.byteOffset;
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_2900
     * @tc.name testUint32ArrayJoinPartTwo029
     * @tc.desc Verify join buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr: Uint32Array = new Uint32Array(buf);
      arr[0] = 1;
      arr[1] = 2;
      const before: number = buf.byteLength;
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2|0');
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3000
     * @tc.name testUint32ArrayJoinPartTwo030
     * @tc.desc Verify join Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3100
     * @tc.name testUint32ArrayJoinPartTwo031
     * @tc.desc Verify join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const first: string = arr.join('|');
      const second: string = arr.join('|');
      expect(first).assertEqual('1|2|3');
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3200
     * @tc.name testUint32ArrayJoinPartTwo032
     * @tc.desc Verify join $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 200);
      const result: string = arr.join('|');
      expect(result).assertEqual('100|200');
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3300
     * @tc.name testUint32ArrayJoinPartTwo033
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(5);
      arr[0] = 9;
      const result: string = arr.join('|');
      expect(result).assertEqual('9|0|0|0|0');
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3400
     * @tc.name testUint32ArrayJoinPartTwo034
     * @tc.desc Verify join $_set join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2');
      arr[0] = 99;
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3500
     * @tc.name testUint32ArrayJoinPartTwo035
     * @tc.desc Verify join BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2');
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3600
     * @tc.name testUint32ArrayJoinPartTwo036
     * @tc.desc Verify join Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const result: string = arr.join('|');
      expect(result).assertEqual('10|20|30');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3700
     * @tc.name testUint32ArrayJoinPartTwo037
     * @tc.desc Verify ArrayBuffer join isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf);
      arr[0] = 1;
      arr[1] = 2;
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3800
     * @tc.name testUint32ArrayJoinPartTwo038
     * @tc.desc Verify ArrayBuffer join byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 8, 2);
      arr[0] = 5;
      arr[1] = 6;
      const before: number = arr.byteOffset;
      arr.join('|');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_3900
     * @tc.name testUint32ArrayJoinPartTwo039
     * @tc.desc Verify join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf);
      arr[0] = 1;
      arr[1] = 2;
      arr.join('|');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4000
     * @tc.name testUint32ArrayJoinPartTwo040
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const sub: Uint32Array = base.subarray(1, 3);
      sub.join('|');
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4100
     * @tc.name testUint32ArrayJoinPartTwo041
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const sub: Uint32Array = base.subarray(1, 3);
      expect(sub.join('|')).assertEqual('20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4200
     * @tc.name testUint32ArrayJoinPartTwo042
     * @tc.desc Verify buffer join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint32Array = new Uint32Array(buf, 0, 2);
      const b: Uint32Array = new Uint32Array(buf, 0, 2);
      a[0] = 7;
      a[1] = 8;
      expect(a.join('-')).assertEqual('7-8');
      expect(b.join('-')).assertEqual('7-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4300
     * @tc.name testUint32ArrayJoinPartTwo043
     * @tc.desc Verify join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr: Uint32Array = new Uint32Array(buf, 4, 2);
      arr[0] = 1;
      arr[1] = 2;
      const before: number = arr.byteLength;
      arr.join('|');
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4400
     * @tc.name testUint32ArrayJoinPartTwo044
     * @tc.desc Verify byteOffset join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const full: Uint32Array = new Uint32Array(buf);
      full[0] = 100;
      full[1] = 200;
      full[2] = 300;
      full[3] = 400;
      const sub: Uint32Array = new Uint32Array(buf, 8, 2);
      expect(sub.join(',')).assertEqual('300,400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4500
     * @tc.name testUint32ArrayJoinPartTwo045
     * @tc.desc Verify byteOffset + length join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const full: Uint32Array = new Uint32Array(buf);
      full[0] = 11;
      full[1] = 22;
      full[2] = 33;
      full[3] = 44;
      full[4] = 55;
      const sub: Uint32Array = new Uint32Array(buf, 4, 3);
      expect(sub.join('-')).assertEqual('22-33-44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4600
     * @tc.name testUint32ArrayJoinPartTwo046
     * @tc.desc Verify join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint32Array = new Uint32Array(buf, 0, 2);
      const b: Uint32Array = new Uint32Array(buf, 0, 2);
      a[0] = 42;
      a[1] = 43;
      a.join('|');
      expect(b[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4700
     * @tc.name testUint32ArrayJoinPartTwo047
     * @tc.desc Verify [9007199254740991 ] join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1);
      arr[0] = 9007199254740991;
      expect(arr.join()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4800
     * @tc.name testUint32ArrayJoinPartTwo048
     * @tc.desc Verify 0 join() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      expect(arr.join()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_4900
     * @tc.name testUint32ArrayJoinPartTwo049
     * @tc.desc Verify join('') length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(arr.join('').length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5000
     * @tc.name testUint32ArrayJoinPartTwo050
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      expect(arr.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5100
     * @tc.name testUint32ArrayJoinPartTwo051
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 4, 5);
      const expected: string = '3' + '|' + '4' + '|' + '5';
      expect(arr.join('|')).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5200
     * @tc.name testUint32ArrayJoinPartTwo052
     * @tc.desc Verify join sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 1, 2);
      arr.join('|');
      arr.sort();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5300
     * @tc.name testUint32ArrayJoinPartTwo053
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7, 8);
      const result: string = 'prefix-' + arr.join('-') + '-suffix';
      expect(result).assertEqual('prefix-7-8-suffix');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5400
     * @tc.name testUint32ArrayJoinPartTwo054
     * @tc.desc Verify toLocaleString default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1000, 2000, 3000);
      const result: string = arr.toLocaleString();
      const formattedDiffersFromRaw: boolean = result !== arr.join(',');
      expect(formattedDiffersFromRaw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5500
     * @tc.name testUint32ArrayJoinPartTwo055
     * @tc.desc Verify toLocaleString empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      const result: string = arr.toLocaleString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5600
     * @tc.name testUint32ArrayJoinPartTwo056
     * @tc.desc Verify toLocaleString single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(42);
      const result: string = arr.toLocaleString();
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5700
     * @tc.name testUint32ArrayJoinPartTwo057
     * @tc.desc Verify toLocaleString with MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295);
      const result: string = arr.toLocaleString();
      const isNonEmpty: boolean = result.length > 0;
      expect(isNonEmpty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_JOIN_PARTTWO_5800
     * @tc.name testUint32ArrayJoinPartTwo058
     * @tc.desc Verify toLocaleString does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayJoinPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: string = arr.join(',');
      arr.toLocaleString();
      expect(arr.join(',')).assertEqual(before);
    });

  });
}
