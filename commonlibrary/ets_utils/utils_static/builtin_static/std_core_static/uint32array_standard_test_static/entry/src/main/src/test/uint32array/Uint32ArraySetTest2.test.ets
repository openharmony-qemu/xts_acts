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

export default function uint32ArraySetTest2(): void {
  describe('Uint32ArraySetTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0100
     * @tc.name testUint32ArraySetPartTwo001
     * @tc.desc Verify $_set(0, 10) sets element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 10);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0200
     * @tc.name testUint32ArraySetPartTwo002
     * @tc.desc Verify $_set(1, v) sets element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let v: number = 7;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0300
     * @tc.name testUint32ArraySetPartTwo003
     * @tc.desc Verify $_set 0 void falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      let r = arr.$_set(0, 5);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0400
     * @tc.name testUint32ArraySetPartTwo004
     * @tc.desc Verify $_set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let r1 = arr.$_set(0, 10);
      let r2 = arr.$_set(1, 20);
      expect(r1).assertUndefined();
      expect(r2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0500
     * @tc.name testUint32ArraySetPartTwo005
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, 100);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0600
     * @tc.name testUint32ArraySetPartTwo006
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(2, 999);
      expect(arr.$_get(2)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0700
     * @tc.name testUint32ArraySetPartTwo007
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(1, 555);
      expect(arr.$_get(1)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0800
     * @tc.name testUint32ArraySetPartTwo008
     * @tc.desc Verify $_set(1, 88) -> arr.$_get(1) = 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(1, 88);
      expect(arr.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_0900
     * @tc.name testUint32ArraySetPartTwo009
     * @tc.desc Verify $_set(1, 99) -> arr.$_get(0) = 1; arr.$_get(2) = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1000
     * @tc.name testUint32ArraySetPartTwo010
     * @tc.desc Verify byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const v: byte = 10;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1100
     * @tc.name testUint32ArraySetPartTwo011
     * @tc.desc Verify byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const v: number = 255;
      arr.$_set(2, v);
      expect(arr.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1200
     * @tc.name testUint32ArraySetPartTwo012
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 11);
      arr.$_set(0, 22);
      expect(arr.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1300
     * @tc.name testUint32ArraySetPartTwo013
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(1, 333);
      expect(arr.at(1)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1400
     * @tc.name testUint32ArraySetPartTwo014
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.$_set(0, 42);
      expect(arr.toString()).assertEqual('42,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1500
     * @tc.name testUint32ArraySetPartTwo015
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.$_set(1, 7);
      expect(arr.join('|')).assertEqual('0|7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1600
     * @tc.name testUint32ArraySetPartTwo016
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let before: number = arr.length;
      arr.$_set(0, 100);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1700
     * @tc.name testUint32ArraySetPartTwo017
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let before: number = arr.byteLength;
      arr.$_set(1, 100);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1800
     * @tc.name testUint32ArraySetPartTwo018
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 50);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_1900
     * @tc.name testUint32ArraySetPartTwo019
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let before: number = arr.buffer.byteLength;
      arr.$_set(0, 999);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2000
     * @tc.name testUint32ArraySetPartTwo020
     * @tc.desc Verify byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 4, 3);
      view.$_set(0, 77);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2100
     * @tc.name testUint32ArraySetPartTwo021
     * @tc.desc Verify byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      arr.$_set(2, 123);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2200
     * @tc.name testUint32ArraySetPartTwo022
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 5);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2300
     * @tc.name testUint32ArraySetPartTwo023
     * @tc.desc Verify $_set(0, 10) -> arr.$_get(0) = 10; arr.$_get(1) = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 10);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2400
     * @tc.name testUint32ArraySetPartTwo024
     * @tc.desc Verify $_set/$_get basic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      arr.$_set(0, 9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2500
     * @tc.name testUint32ArraySetPartTwo025
     * @tc.desc Verify $_set(2, 3) -> arr.$_get(0) = 1; arr.$_get(1) = 2; arr.$_get(2) = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2600
     * @tc.name testUint32ArraySetPartTwo026
     * @tc.desc Verify $_set(0,8) arr[0] 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      arr.$_set(0, 8);
      expect(arr[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2700
     * @tc.name testUint32ArraySetPartTwo027
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      let buf: ArrayBuffer = arr.buffer;
      arr.$_set(0, 100);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2800
     * @tc.name testUint32ArraySetPartTwo028
     * @tc.desc Verify subarray $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let sub: Uint32Array = arr.subarray(1, 3);
      sub.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_2900
     * @tc.name testUint32ArraySetPartTwo029
     * @tc.desc Verify $_set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let sub: Uint32Array = arr.subarray(1, 3);
      arr.$_set(1, 77);
      expect(sub.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3000
     * @tc.name testUint32ArraySetPartTwo030
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let writerView: Uint32Array = new Uint32Array(buf, 0, 2);
      let readerView: Uint32Array = new Uint32Array(buf, 0, 2);
      writerView.$_set(0, 4242);
      expect(readerView.$_get(0)).assertEqual(4242);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3100
     * @tc.name testUint32ArraySetPartTwo031
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let offset0View: Uint32Array = new Uint32Array(buf, 0, 4);
      let offset4View: Uint32Array = new Uint32Array(buf, 4, 3);
      offset0View.$_set(1, 1234);
      expect(offset4View.$_get(0)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3200
     * @tc.name testUint32ArraySetPartTwo032
     * @tc.desc Verify subarray $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let sub: Uint32Array = arr.subarray(1, 4);
      sub.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3300
     * @tc.name testUint32ArraySetPartTwo033
     * @tc.desc Verify buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let offset0View: Uint32Array = new Uint32Array(buf, 0, 2);
      let offset8View: Uint32Array = new Uint32Array(buf, 8, 2);
      offset0View.$_set(0, 1);
      offset8View.$_set(0, 2);
      expect(offset0View.byteOffset).assertEqual(0);
      expect(offset8View.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3400
     * @tc.name testUint32ArraySetPartTwo034
     * @tc.desc Verify $_set view.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 0, 2);
      view.$_set(0, 55);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3500
     * @tc.name testUint32ArraySetPartTwo035
     * @tc.desc Verify subarray $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let sub: Uint32Array = arr.subarray(1, 3);
      sub.$_set(0, 9);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3600
     * @tc.name testUint32ArraySetPartTwo036
     * @tc.desc Verify slice $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let copy: Uint32Array = arr.slice(0, 2);
      copy.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3700
     * @tc.name testUint32ArraySetPartTwo037
     * @tc.desc Verify $_set slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let copy: Uint32Array = arr.slice(0, 2);
      arr.$_set(0, 888);
      expect(copy.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3800
     * @tc.name testUint32ArraySetPartTwo038
     * @tc.desc Verify 0o10 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 0o10);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_3900
     * @tc.name testUint32ArraySetPartTwo039
     * @tc.desc Verify 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 0b1010);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4000
     * @tc.name testUint32ArraySetPartTwo040
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 4294967296);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4100
     * @tc.name testUint32ArraySetPartTwo041
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      let before: number = arr.byteLength;
      arr.$_set(0, 4294967296);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4200
     * @tc.name testUint32ArraySetPartTwo042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, -1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4300
     * @tc.name testUint32ArraySetPartTwo043
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let writerView: Uint32Array = new Uint32Array(buf, 0, 2);
      let readerView: Uint32Array = new Uint32Array(buf, 0, 2);
      writerView.$_set(0, -1);
      expect(readerView.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4400
     * @tc.name testUint32ArraySetPartTwo044
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let sub: Uint32Array = arr.subarray(1, 3);
      sub.$_set(0, 4294967296);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4500
     * @tc.name testUint32ArraySetPartTwo045
     * @tc.desc Verify $_set(2, 3.14) -> arr.$_get(0) = 4294967295; arr.$_get(1) = 0; arr.$_get(2) = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, -1);
      arr.$_set(1, 4294967296);
      arr.$_set(2, 3.14);
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4600
     * @tc.name testUint32ArraySetPartTwo046
     * @tc.desc Verify $_set(2, -1) -> arr.$_get(2) = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(2, -1);
      expect(arr.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4700
     * @tc.name testUint32ArraySetPartTwo047
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(1, Number.NaN);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4800
     * @tc.name testUint32ArraySetPartTwo048
     * @tc.desc Verify $_set(0, -1) -> arr.$_get(0) = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 4294967296);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_4900
     * @tc.name testUint32ArraySetPartTwo049
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 10);
      let sum: number = arr.reduce((a: number, b: number): number => a + b, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5000
     * @tc.name testUint32ArraySetPartTwo050
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 4242);
      expect(arr.includes(4242)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5100
     * @tc.name testUint32ArraySetPartTwo051
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(2, 500);
      let r: number = arr.find((x: number): boolean => x > 100)!;
      expect(r).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5200
     * @tc.name testUint32ArraySetPartTwo052
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(1, 777);
      expect(arr.findIndex((x: number): boolean => x === 777)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5300
     * @tc.name testUint32ArraySetPartTwo053
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(1, 42);
      let total: number = 0;
      arr.forEach((x: number): void => { total = total + x; });
      expect(total).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5400
     * @tc.name testUint32ArraySetPartTwo054
     * @tc.desc Verify entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 100);
      let iter = arr.entries();
      let first = iter.next();
      expect(first.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5500
     * @tc.name testUint32ArraySetPartTwo055
     * @tc.desc Verify keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 5);
      let count: number = 0;
      let iter = arr.keys();
      while (!iter.next().done) { count = count + 1; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5600
     * @tc.name testUint32ArraySetPartTwo056
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      arr.$_set(0, 99);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5700
     * @tc.name testUint32ArraySetPartTwo057
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 50);
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5800
     * @tc.name testUint32ArraySetPartTwo058
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 10);
      let mapped: Uint32Array = arr.map((x: number): number => x * 2);
      expect(mapped.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_5900
     * @tc.name testUint32ArraySetPartTwo059
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 100);
      let filtered: Uint32Array = arr.filter((x: number): boolean => x > 50);
      expect(filtered.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6000
     * @tc.name testUint32ArraySetPartTwo060
     * @tc.desc Verify byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 0, 3);
      view.$_set(1, 22);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6100
     * @tc.name testUint32ArraySetPartTwo061
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 0, 4);
      let lenBefore: number = buf.byteLength;
      view.$_set(0, 33);
      expect(buf.byteLength).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6200
     * @tc.name testUint32ArraySetPartTwo062
     * @tc.desc Verify DataView buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint32Array = new Uint32Array(buf, 0, 2);
      let dv: DataView = new DataView(buf);
      view.$_set(0, 4242);
      expect(dv.getUint32(0, true)).assertEqual(4242);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6300
     * @tc.name testUint32ArraySetPartTwo063
     * @tc.desc Verify DataView Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint32Array = new Uint32Array(buf, 0, 2);
      let dv: DataView = new DataView(buf);
      dv.setUint32(4, 1234, true);
      expect(view.$_get(1)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6400
     * @tc.name testUint32ArraySetPartTwo064
     * @tc.desc Verify $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Uint32Array = new Uint32Array(buf, 0, 1);
      view.$_set(0, 1);
      let dv: DataView = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6500
     * @tc.name testUint32ArraySetPartTwo065
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      arr.$_set(1, 99);
      let sub: Uint32Array = arr.subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6600
     * @tc.name testUint32ArraySetPartTwo066
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 5);
      let copy: Uint32Array = arr.slice(0, 2);
      arr.$_set(0, 9);
      expect(copy.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6700
     * @tc.name testUint32ArraySetPartTwo067
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 100);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6800
     * @tc.name testUint32ArraySetPartTwo068
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 1, 9);
      arr.$_set(0, 3);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_6900
     * @tc.name testUint32ArraySetPartTwo069
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 100);
      let rev: Uint32Array = arr.toReversed();
      expect(arr.$_get(0)).assertEqual(100);
      expect(rev.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7000
     * @tc.name testUint32ArraySetPartTwo070
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(9, 1, 5);
      arr.$_set(0, 3);
      let sorted: Uint32Array = arr.toSorted();
      expect(arr.$_get(0)).assertEqual(3);
      expect(sorted.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7100
     * @tc.name testUint32ArraySetPartTwo071
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      let buf: ArrayBuffer = arr.buffer;
      arr.$_set(0, 7);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7200
     * @tc.name testUint32ArraySetPartTwo072
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      for (let i = 0; i < 100; i++) { src.push(i); }
      let arr: Uint32Array = Uint32Array.from(src);
      let lenBefore: number = arr.length;
      arr.$_set(50, 9999);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7300
     * @tc.name testUint32ArraySetPartTwo073
     * @tc.desc Verify byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      for (let i = 0; i < 100; i++) { src.push(0); }
      let arr: Uint32Array = Uint32Array.from(src);
      arr.$_set(0, 1);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7400
     * @tc.name testUint32ArraySetPartTwo074
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(5);
      arr.$_set(0, 1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7500
     * @tc.name testUint32ArraySetPartTwo075
     * @tc.desc Verify $_set(1, 5) -> arr.$_get(0) = 0; arr.$_get(3) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(4);
      arr.$_set(1, 5);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7600
     * @tc.name testUint32ArraySetPartTwo076
     * @tc.desc Verify 5e0 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.$_set(0, 5e0);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7700
     * @tc.name testUint32ArraySetPartTwo077
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint32Array = new Uint32Array(buf, 4, 1);
      let offBefore: number = view.byteOffset;
      view.$_set(0, 4294967295);
      expect(view.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7800
     * @tc.name testUint32ArraySetPartTwo078
     * @tc.desc Verify Infinity length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let lenBefore: number = arr.length;
      arr.$_set(1, Number.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_7900
     * @tc.name testUint32ArraySetPartTwo079
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.$_set(0, -1);
      expect(arr.toString()).assertEqual('4294967295,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8000
     * @tc.name testUint32ArraySetPartTwo080
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.$_set(1, 3.99);
      expect(arr.join(',')).assertEqual('0,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8100
     * @tc.name testUint32ArraySetPartTwo081
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let writerA: Uint32Array = new Uint32Array(buf, 0, 3);
      let writerB: Uint32Array = new Uint32Array(buf, 0, 3);
      let readerView: Uint32Array = new Uint32Array(buf, 0, 3);
      writerA.$_set(0, 10);
      writerB.$_set(1, 20);
      expect(readerView.$_get(0)).assertEqual(10);
      expect(readerView.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8200
     * @tc.name testUint32ArraySetPartTwo082
     * @tc.desc Verify $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let offset0View: Uint32Array = new Uint32Array(buf, 0, 2);
      let offset8View: Uint32Array = new Uint32Array(buf, 8, 2);
      offset0View.$_set(0, 1);
      offset8View.$_set(0, 2);
      expect(offset0View.length).assertEqual(2);
      expect(offset8View.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8300
     * @tc.name testUint32ArraySetPartTwo083
     * @tc.desc Verify subarray $_set byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let before: number = arr.byteLength;
      let sub: Uint32Array = arr.subarray(1, 3);
      sub.$_set(0, 9);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8400
     * @tc.name testUint32ArraySetPartTwo084
     * @tc.desc Verify slice $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let buf: ArrayBuffer = arr.buffer;
      let copy: Uint32Array = arr.slice(0, 2);
      copy.$_set(0, 100);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8500
     * @tc.name testUint32ArraySetPartTwo085
     * @tc.desc Verify subarray $_set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let sub: Uint32Array = arr.subarray(2, 5);
      let off: number = sub.byteOffset;
      sub.$_set(0, 77);
      expect(sub.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8600
     * @tc.name testUint32ArraySetPartTwo086
     * @tc.desc Verify $_set with large positive index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8700
     * @tc.name testUint32ArraySetPartTwo087
     * @tc.desc Verify $_set with large negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.$_set(-2147483648, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTTWO_8800
     * @tc.name testUint32ArraySetPartTwo088
     * @tc.desc Verify $_set with index equal to length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
