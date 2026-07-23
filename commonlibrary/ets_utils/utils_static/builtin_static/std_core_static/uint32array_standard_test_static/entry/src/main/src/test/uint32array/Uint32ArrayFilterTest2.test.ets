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

export default function uint32ArrayFilterTest2(): void {
  describe('Uint32ArrayFilterTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0100
     * @tc.name testUint32ArrayFilterPartTwo001
     * @tc.desc Verify filter keeps value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(7);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0200
     * @tc.name testUint32ArrayFilterPartTwo002
     * @tc.desc Verify filter keeps matching value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(9, 10);
      let r: Uint32Array = src.filter((v: number): boolean => v === 10);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0300
     * @tc.name testUint32ArrayFilterPartTwo003
     * @tc.desc Verify filter index less than 10 from 256 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(256);
      let r: Uint32Array = src.filter((v: number, i: int): boolean => i < 10);
      expect(r.length).assertEqual(10);
      expect(r[0]).assertEqual(0);
      expect(r[9]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0400
     * @tc.name testUint32ArrayFilterPartTwo004
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(2, 4, 5, 6, 7);
      let r: Uint32Array = src.filter((v: number): boolean => v % 2 === 0);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0500
     * @tc.name testUint32ArrayFilterPartTwo005
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(10, 20, 30);
      let r: Uint32Array = src.filter((v: number): boolean => v === 20);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0600
     * @tc.name testUint32ArrayFilterPartTwo006
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(7, 7, 7, 7);
      let r: Uint32Array = src.filter((v: number): boolean => v === 7);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(7);
      expect(r[3]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0700
     * @tc.name testUint32ArrayFilterPartTwo007
     * @tc.desc Verify filter int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(2147483647, 1, 2147483647);
      let r: Uint32Array = src.filter((v: number): boolean => v === 2147483647);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0800
     * @tc.name testUint32ArrayFilterPartTwo008
     * @tc.desc Verify filter 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(2147483648, 1);
      let r: Uint32Array = src.filter((v: number): boolean => v === 2147483648);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_0900
     * @tc.name testUint32ArrayFilterPartTwo009
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 99);
      let r: Uint32Array = src.filter((v: number): boolean => v === 99);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1000
     * @tc.name testUint32ArrayFilterPartTwo010
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(88, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => v === 88);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(88);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1100
     * @tc.name testUint32ArrayFilterPartTwo011
     * @tc.desc Verify filter length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(r.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1200
     * @tc.name testUint32ArrayFilterPartTwo012
     * @tc.desc Verify filter length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(10, 20, 30);
      let r: Uint32Array = src.filter((v: number): boolean => v === 20);
      expect(r.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1300
     * @tc.name testUint32ArrayFilterPartTwo013
     * @tc.desc Verify filter 0 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let r: Uint32Array = src.filter((v: number): boolean => v === 0);
      expect(r.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1400
     * @tc.name testUint32ArrayFilterPartTwo014
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(100);
      let r: Uint32Array = src.filter((v: number): boolean => v === 0);
      expect(r.length).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1500
     * @tc.name testUint32ArrayFilterPartTwo015
     * @tc.desc Verify filter byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => v > 1);
      expect(r.byteOffset).assertEqual(0);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1600
     * @tc.name testUint32ArrayFilterPartTwo016
     * @tc.desc Verify filter byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Uint32Array = new Uint32Array(buf, 8, 4);
      src[0] = 5;
      let r: Uint32Array = src.filter((v: number): boolean => v === 5);
      expect(r.byteOffset).assertEqual(0);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1700
     * @tc.name testUint32ArrayFilterPartTwo017
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(11, 22, 33);
      let r: Uint32Array = src.filter((v: number): boolean => v > 15);
      expect(src[0]).assertEqual(11);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1800
     * @tc.name testUint32ArrayFilterPartTwo018
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 99);
      let r: Uint32Array = src.filter((v: number): boolean => v === 99);
      expect(src[2]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_1900
     * @tc.name testUint32ArrayFilterPartTwo019
     * @tc.desc Verify filter byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let src: Uint32Array = new Uint32Array(buf, 8, 4);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(src.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2000
     * @tc.name testUint32ArrayFilterPartTwo020
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let bufBefore: ArrayBuffer = src.buffer;
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(src.buffer).assertEqual(bufBefore);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2100
     * @tc.name testUint32ArrayFilterPartTwo021
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let r1: Uint32Array = src.filter((v: number): boolean => v > 1);
      let r2: Uint32Array = src.filter((v: number): boolean => v > 2);
      expect(src.length).assertEqual(4);
      expect(src[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2200
     * @tc.name testUint32ArrayFilterPartTwo022
     * @tc.desc Verify filter filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let r: Uint32Array = src.filter((v: number): boolean => v > 2).filter((v: number): boolean => v % 2 === 0);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2300
     * @tc.name testUint32ArrayFilterPartTwo023
     * @tc.desc Verify filter filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let r: Uint32Array = src.filter((v: number): boolean => v > 2)
        .filter((v: number): boolean => v < 7)
        .filter((v: number): boolean => v % 2 === 1);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2400
     * @tc.name testUint32ArrayFilterPartTwo024
     * @tc.desc Verify filter map Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let r: Uint32Array = src.filter((v: number): boolean => v > 1).map((v: number): number => v * 2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(4);
      expect(r[2]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2500
     * @tc.name testUint32ArrayFilterPartTwo025
     * @tc.desc Verify filter reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: Uint32Array = src.filter((v: number): boolean => v > 1).reverse();
      expect(r[0]).assertEqual(5);
      expect(r[3]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2600
     * @tc.name testUint32ArrayFilterPartTwo026
     * @tc.desc Verify filter slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let r: Uint32Array = src.filter((v: number): boolean => v > 1).slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2700
     * @tc.name testUint32ArrayFilterPartTwo027
     * @tc.desc Verify filter subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let mid: Uint32Array = src.filter((v: number): boolean => v > 1);
      let r: Uint32Array = mid.subarray(0, 2);
      r[0] = 99;
      expect(mid[0]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2800
     * @tc.name testUint32ArrayFilterPartTwo028
     * @tc.desc Verify filter find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: number | undefined = src.filter((v: number): boolean => v > 1).find((v: number): boolean => v > 3);
      expect(r).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_2900
     * @tc.name testUint32ArrayFilterPartTwo029
     * @tc.desc Verify filter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: number = src.filter((v: number): boolean => v > 1).findIndex((v: number): boolean => v === 4);
      expect(r).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3000
     * @tc.name testUint32ArrayFilterPartTwo030
     * @tc.desc Verify filter forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let count: number = 0;
      src.filter((v: number): boolean => v % 2 === 0).forEach((v: number): void => { count = count + 1; });
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3100
     * @tc.name testUint32ArrayFilterPartTwo031
     * @tc.desc Verify filter reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: number = src.filter((v: number): boolean => v > 1).reduce((acc: number, v: number): number => acc + v, 0);
      expect(r).assertEqual(14);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3200
     * @tc.name testUint32ArrayFilterPartTwo032
     * @tc.desc Verify filter every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(2, 4, 6, 8);
      let r: boolean = src.filter((v: number): boolean => v > 1).every((v: number): boolean => v % 2 === 0);
      expect(r).assertTrue();
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3300
     * @tc.name testUint32ArrayFilterPartTwo033
     * @tc.desc Verify filter join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r: string = src.filter((v: number): boolean => v > 1).join(',');
      expect(r).assertEqual('2,3,4,5');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3400
     * @tc.name testUint32ArrayFilterPartTwo034
     * @tc.desc Verify filter toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: string = src.filter((v: number): boolean => v > 1).toString();
      expect(r).assertEqual('2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3500
     * @tc.name testUint32ArrayFilterPartTwo035
     * @tc.desc Verify filter length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => v > 100);
      expect(r.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3600
     * @tc.name testUint32ArrayFilterPartTwo036
     * @tc.desc Verify filter byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => v > 100);
      expect(r.byteLength).assertEqual(0);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3700
     * @tc.name testUint32ArrayFilterPartTwo037
     * @tc.desc Verify filter join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: string = src.filter((v: number): boolean => false).join(',');
      expect(r).assertEqual('');
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3800
     * @tc.name testUint32ArrayFilterPartTwo038
     * @tc.desc Verify filter forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let count: number = 0;
      src.filter((v: number): boolean => false).forEach((v: number): void => { count = count + 1; });
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_3900
     * @tc.name testUint32ArrayFilterPartTwo039
     * @tc.desc Verify filter reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let empty: Uint32Array = src.filter((v: number): boolean => false);
      let r: number = empty.reduce((acc: number, v: number): number => acc + v, 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4000
     * @tc.name testUint32ArrayFilterPartTwo040
     * @tc.desc Verify filter val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(11, 22, 33);
      let first: number = 0;
      let r: Uint32Array = src.filter(
        (v: number, i: int, a: Uint32Array): boolean => {
          if (i === 0) { first = v; }
          return true;
        }
      );
      expect(first).assertEqual(11);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4100
     * @tc.name testUint32ArrayFilterPartTwo041
     * @tc.desc Verify filter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number, i: int, a: Uint32Array): boolean => v === 2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4200
     * @tc.name testUint32ArrayFilterPartTwo042
     * @tc.desc Verify filter false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number, i: int, a: Uint32Array): boolean => v !== 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4300
     * @tc.name testUint32ArrayFilterPartTwo043
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(50);
      for (let i = 0; i < 50; i++) { src[i] = i; }
      let r: Uint32Array = src.filter((v: number): boolean => v < 25);
      expect(r.length).assertEqual(25);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4400
     * @tc.name testUint32ArrayFilterPartTwo044
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < 100; i++) { src[i] = i; }
      let r: Uint32Array = src.filter((v: number): boolean => v % 2 === 0);
      expect(r.length).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4500
     * @tc.name testUint32ArrayFilterPartTwo045
     * @tc.desc Verify filter byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(20);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(r.byteLength).assertEqual(80);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4600
     * @tc.name testUint32ArrayFilterPartTwo046
     * @tc.desc Verify filter 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(2);
      src[0] = 4294967296;
      src[1] = 1;
      let r: Uint32Array = src.filter((v: number): boolean => v === 0);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4700
     * @tc.name testUint32ArrayFilterPartTwo047
     * @tc.desc Verify filter uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(2);
      src[0] = -1;
      src[1] = 5;
      let r: Uint32Array = src.filter((v: number): boolean => v === 4294967295);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4800
     * @tc.name testUint32ArrayFilterPartTwo048
     * @tc.desc Verify filter int32.MIN uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(2);
      src[0] = -2147483648;
      src[1] = 1;
      let r: Uint32Array = src.filter((v: number): boolean => v === 2147483648);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_4900
     * @tc.name testUint32ArrayFilterPartTwo049
     * @tc.desc Verify filter length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(5, 5, 5);
      let r: Uint32Array = src.filter((v: number): boolean => v === 5);
      expect(r.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5000
     * @tc.name testUint32ArrayFilterPartTwo050
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 100, 200, 300);
      let r: Uint32Array = src.filter((v: number): boolean => v > 100);
      expect(r.length).assertEqual(2);
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5100
     * @tc.name testUint32ArrayFilterPartTwo051
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let r1: Uint32Array = src.filter((v: number): boolean => v > 2);
      let r2: Uint32Array = src.filter((v: number): boolean => v > 3);
      const sameBuffer: boolean = r1.buffer === r2.buffer;
      expect(sameBuffer).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5200
     * @tc.name testUint32ArrayFilterPartTwo052
     * @tc.desc Verify filter filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let r1: Uint32Array = src.filter((v: number): boolean => v > 1);
      let r2: Uint32Array = r1.filter((v: number): boolean => v > 3);
      expect(r1.length).assertEqual(5);
      expect(r2.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5300
     * @tc.name testUint32ArrayFilterPartTwo053
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      src[0] = 100;
      expect(r[0]).assertEqual(1);
      expect(src[0]).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5400
     * @tc.name testUint32ArrayFilterPartTwo054
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: Uint32Array = src.filter((v: number): boolean => true);
      expect(src.length).assertEqual(3);
      expect(r.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5500
     * @tc.name testUint32ArrayFilterPartTwo055
     * @tc.desc Verify filter ArrayBuffer buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let r: Uint32Array = src.filter((v: number): boolean => v > 1);
      expect(r.byteOffset).assertEqual(0);
      expect(r.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5600
     * @tc.name testUint32ArrayFilterPartTwo056
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Uint32Array = new Uint32Array(buf, 4, 6);
      src[0] = 10;
      src[1] = 20;
      let r: Uint32Array = src.filter((v: number): boolean => v >= 10);
      const sameBuffer: boolean = r.buffer === src.buffer;
      expect(sameBuffer).assertFalse();
      expect(r.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5700
     * @tc.name testUint32ArrayFilterPartTwo057
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let src: Uint32Array = new Uint32Array(buf, 8, 4);
      src[0] = 1;
      src[1] = 2;
      let r: Uint32Array = src.filter((v: number): boolean => v > 1);
      expect(src.byteOffset).assertEqual(8);
      expect(src.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5800
     * @tc.name testUint32ArrayFilterPartTwo058
     * @tc.desc Verify filter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let src: Uint32Array = new Uint32Array(buf, 0, 8);
      for (let i = 0; i < 8; i++) { src[i] = i; }
      let r: Uint32Array = src.filter((v: number): boolean => v >= 4);
      expect(r.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_5900
     * @tc.name testUint32ArrayFilterPartTwo059
     * @tc.desc Verify filter value match on buffer-based Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Uint32Array = new Uint32Array(buf, 0, 4);
      src[0] = 5;
      let r: Uint32Array = src.filter((v: number): boolean => v === 5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_6000
     * @tc.name testUint32ArrayFilterPartTwo060
     * @tc.desc Verify some returns false when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let r: boolean = arr.some((v: number): boolean => v > 100);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_6100
     * @tc.name testUint32ArrayFilterPartTwo061
     * @tc.desc Verify some short-circuits on first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let count: number = 0;
      let r: boolean = arr.some((v: number): boolean => {
        count++;
        return v === 20;
      });
      expect(r).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTTWO_6200
     * @tc.name testUint32ArrayFilterPartTwo062
     * @tc.desc Verify some callback receives value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 10, 15);
      let captured: number = -1;
      let r: boolean = arr.some((v: number, i: int, a: Uint32Array): boolean => {
        captured = i;
        return a[i] === v && v === 10;
      });
      expect(r).assertTrue();
      expect(captured).assertEqual(1);
    });

  });
}
