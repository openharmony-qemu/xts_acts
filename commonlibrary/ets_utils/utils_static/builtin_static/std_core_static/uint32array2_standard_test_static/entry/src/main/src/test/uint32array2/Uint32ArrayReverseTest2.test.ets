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

export default function uint32ArrayReverseTwoTest(): void {
  describe('Uint32ArrayReverseTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0100
     * @tc.name testUint32ArrayReverseTwo001
     * @tc.desc Verify 1-element reverse() returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7);
      const ret: Uint32Array = arr.reverse();
      expect(ret.length).assertEqual(1);
      expect(ret.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0200
     * @tc.name testUint32ArrayReverseTwo002
     * @tc.desc Verify 65535-length reverse() returns length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(65535);
      arr.$_set(0, 111);
      arr.$_set(65534, 222);
      const ret: Uint32Array = arr.reverse();
      expect(ret.length).assertEqual(65535);
      expect(ret.$_get(0)).assertEqual(222);
      expect(ret.$_get(65534)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0300
     * @tc.name testUint32ArrayReverseTwo003
     * @tc.desc Verify subarray reverse() returns length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(1, 4);
      const ret: Uint32Array = view.reverse();
      expect(ret.length).assertEqual(3);
      expect(ret.$_get(0)).assertEqual(4);
      expect(ret.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0400
     * @tc.name testUint32ArrayReverseTwo004
     * @tc.desc Verify uint32 reverse() returns length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295, 2147483648);
      const ret: Uint32Array = arr.reverse();
      expect(ret.length).assertEqual(3);
      expect(ret.$_get(0)).assertEqual(2147483648);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0500
     * @tc.name testUint32ArrayReverseTwo005
     * @tc.desc Verify 3 reverse() instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 1, 2);
      const ret: Uint32Array = arr.reverse();
      expect(ret === arr).assertTrue();
      expect(ret.length).assertEqual(3);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0600
     * @tc.name testUint32ArrayReverseTwo006
     * @tc.desc Verify reverse() instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      const ret: Uint32Array = arr.reverse();
      expect(ret === arr).assertTrue();
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0700
     * @tc.name testUint32ArrayReverseTwo007
     * @tc.desc Verify ArrayBuffer reverse() instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 4, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret === arr).assertTrue();
      expect(ret.byteOffset).assertEqual(4);
      expect(ret.length).assertEqual(3);
      expect(ret.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0800
     * @tc.name testUint32ArrayReverseTwo008
     * @tc.desc Verify reverse() instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(65535);
      const ret: Uint32Array = arr.reverse();
      expect(ret === arr).assertTrue();
      expect(ret.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_0900
     * @tc.name testUint32ArrayReverseTwo009
     * @tc.desc Verify reverse buffer instanceof ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.buffer.byteLength).assertEqual(12);
      expect(ret.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1000
     * @tc.name testUint32ArrayReverseTwo010
     * @tc.desc Verify reverse [10,20] [20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20);
      const ret: Uint32Array = arr.reverse();
      expect(ret.$_get(0)).assertEqual(20);
      expect(ret.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1100
     * @tc.name testUint32ArrayReverseTwo011
     * @tc.desc Verify reverse of [5,6,7] returns [7,6,5] and mutates in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 6, 7);
      const ret: Uint32Array = arr.reverse();
      expect(ret.toString()).assertEqual('7,6,5');
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1200
     * @tc.name testUint32ArrayReverseTwo012
     * @tc.desc Verify reverse [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const ret: Uint32Array = arr.reverse();
      expect(ret.$_get(0)).assertEqual(5);
      expect(ret.$_get(2)).assertEqual(3);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1300
     * @tc.name testUint32ArrayReverseTwo013
     * @tc.desc Verify reverse $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      const lastBefore: number = arr.$_get(2);
      const ret: Uint32Array = arr.reverse();
      expect(ret.$_get(0)).assertEqual(lastBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1400
     * @tc.name testUint32ArrayReverseTwo014
     * @tc.desc Verify reverse toString join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1500
     * @tc.name testUint32ArrayReverseTwo015
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const ret: Uint32Array = arr.reverse();
      expect(ret.join('|')).assertEqual('30|20|10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1600
     * @tc.name testUint32ArrayReverseTwo016
     * @tc.desc Verify reverse length (3 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: number = arr.length;
      const ret: Uint32Array = arr.reverse();
      expect(ret.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1700
     * @tc.name testUint32ArrayReverseTwo017
     * @tc.desc Verify reverse length*4 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1800
     * @tc.name testUint32ArrayReverseTwo018
     * @tc.desc Verify reverse 4 length*4 byteLength(16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_1900
     * @tc.name testUint32ArrayReverseTwo019
     * @tc.desc Verify reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(0, 3);
      const before: number = view.length;
      view.reverse();
      expect(view.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2000
     * @tc.name testUint32ArrayReverseTwo020
     * @tc.desc Verify reverse 3 byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2100
     * @tc.name testUint32ArrayReverseTwo021
     * @tc.desc Verify reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const before: number = arr.byteLength;
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2200
     * @tc.name testUint32ArrayReverseTwo022
     * @tc.desc Verify reverse byteLength 262140
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(65535);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(262140);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2300
     * @tc.name testUint32ArrayReverseTwo023
     * @tc.desc Verify reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint32Array = new Uint32Array(buf, 8, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2400
     * @tc.name testUint32ArrayReverseTwo024
     * @tc.desc Verify reverse byteLength ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const before: number = arr.byteLength;
      arr.reverse();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2500
     * @tc.name testUint32ArrayReverseTwo025
     * @tc.desc Verify reverse byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2600
     * @tc.name testUint32ArrayReverseTwo026
     * @tc.desc Verify (byteOffset=8) reverse byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint32Array = new Uint32Array(buf, 8, 3);
      const ret: Uint32Array = arr.reverse();
      expect(ret.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2700
     * @tc.name testUint32ArrayReverseTwo027
     * @tc.desc Verify subarray(2) reverse byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(2);
      const ret: Uint32Array = view.reverse();
      expect(ret.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2800
     * @tc.name testUint32ArrayReverseTwo028
     * @tc.desc Verify reverse byteOffset ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Uint32Array = new Uint32Array(buf, 4, 4);
      const before: number = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_2900
     * @tc.name testUint32ArrayReverseTwo029
     * @tc.desc Verify subarray(2,2) reverse byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(2, 2);
      const ret: Uint32Array = view.reverse();
      expect(ret.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3000
     * @tc.name testUint32ArrayReverseTwo030
     * @tc.desc Verify reverse().reverse() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const ret: Uint32Array = arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(ret === arr).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3100
     * @tc.name testUint32ArrayReverseTwo031
     * @tc.desc Verify ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = arr.reverse();
      ret.$_set(0, 888);
      expect(arr.$_get(0)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3200
     * @tc.name testUint32ArrayReverseTwo032
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: ArrayBuffer = arr.buffer;
      arr.reverse();
      const sameBuffer: boolean = arr.buffer === before;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3300
     * @tc.name testUint32ArrayReverseTwo033
     * @tc.desc Verify reverse subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(0, 3);
      base.reverse();
      expect(view.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3400
     * @tc.name testUint32ArrayReverseTwo034
     * @tc.desc Verify reverse buffer( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = base.subarray(1, 3);
      const ret: Uint32Array = view.reverse();
      ret.$_set(0, 777);
      expect(view.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3500
     * @tc.name testUint32ArrayReverseTwo035
     * @tc.desc Verify ArrayBuffer reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const arr: Uint32Array = new Uint32Array(buf, 4, 4);
      const before: number = buf.byteLength;
      arr.reverse();
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3600
     * @tc.name testUint32ArrayReverseTwo036
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const left: Uint32Array = base.subarray(0, 2);
      const right: Uint32Array = base.subarray(4, 6);
      left.reverse();
      expect(right.$_get(0)).assertEqual(5);
      expect(right.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3700
     * @tc.name testUint32ArrayReverseTwo037
     * @tc.desc Verify ArrayBuffer reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0, 2);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3800
     * @tc.name testUint32ArrayReverseTwo038
     * @tc.desc Verify uint32 4294967295 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 1);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_3900
     * @tc.name testUint32ArrayReverseTwo039
     * @tc.desc Verify 0 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 9);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4000
     * @tc.name testUint32ArrayReverseTwo040
     * @tc.desc Verify int32 2147483647 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647, 3);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4100
     * @tc.name testUint32ArrayReverseTwo041
     * @tc.desc Verify -1( 4294967295) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1, 4);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4200
     * @tc.name testUint32ArrayReverseTwo042
     * @tc.desc Verify 3.14( 3) , 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3.14, 8);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4300
     * @tc.name testUint32ArrayReverseTwo043
     * @tc.desc Verify NaN( 0) , 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.NaN, 2);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4400
     * @tc.name testUint32ArrayReverseTwo044
     * @tc.desc Verify Infinity( 0) , 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.POSITIVE_INFINITY, 3);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4500
     * @tc.name testUint32ArrayReverseTwo045
     * @tc.desc Verify MAX 0 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 0, 4294967295, 0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4600
     * @tc.name testUint32ArrayReverseTwo046
     * @tc.desc Verify int32 -2147483648( 2147483648) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-2147483648, 11);
      arr.reverse();
      expect(arr.$_get(1)).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4700
     * @tc.name testUint32ArrayReverseTwo047
     * @tc.desc Verify reverse with MAX element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < arr.length; i++) {
        arr.$_set(i, i);
      }
      const ret: Uint32Array = arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(99)).assertEqual(0);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_TWO_4800
     * @tc.name testUint32ArrayReverseTwo048
     * @tc.desc Verify toReversed() returns a new array and leaves the original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const ret: Uint32Array = arr.toReversed();
      expect(ret === arr).assertFalse();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
      expect(ret.$_get(0)).assertEqual(30);
      expect(ret.$_get(2)).assertEqual(10);
    });


  });
}
