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

export default function uint32ArrayPropertyThreeTest(): void {
  describe('Uint32ArrayPropertyThreeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0100
     * @tc.name testUint32ArrayPropertyThree001
     * @tc.desc Verify BYTES_PER_ELEMENT equals 4 for length-0 constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0200
     * @tc.name testUint32ArrayPropertyThree002
     * @tc.desc Verify subarray BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(arr.length);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0300
     * @tc.name testUint32ArrayPropertyThree003
     * @tc.desc Verify subarray(begin=length+1) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(arr.length + 1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0400
     * @tc.name testUint32ArrayPropertyThree004
     * @tc.desc Verify subarray(begin=-1) 1 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(-1);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0500
     * @tc.name testUint32ArrayPropertyThree005
     * @tc.desc Verify subarray(begin=-length) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(-arr.length);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0600
     * @tc.name testUint32ArrayPropertyThree006
     * @tc.desc Verify subarray(begin=-length-1) clamps to length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(-arr.length - 1);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0700
     * @tc.name testUint32ArrayPropertyThree007
     * @tc.desc Verify subarray(1, 0) begin end length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(1, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0800
     * @tc.name testUint32ArrayPropertyThree008
     * @tc.desc Verify slice(begin=length) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(arr.length);
      expect(copy.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_0900
     * @tc.name testUint32ArrayPropertyThree009
     * @tc.desc Verify slice(begin=-1) 1 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(-1);
      expect(copy.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1000
     * @tc.name testUint32ArrayPropertyThree010
     * @tc.desc Verify slice(begin=-length) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(-arr.length);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1100
     * @tc.name testUint32ArrayPropertyThree011
     * @tc.desc Verify slice(begin=-length-1) clamps to length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(-arr.length - 1);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1200
     * @tc.name testUint32ArrayPropertyThree012
     * @tc.desc Verify subarray(-1) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(-1);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1300
     * @tc.name testUint32ArrayPropertyThree013
     * @tc.desc Verify subarray(-length) byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(-arr.length);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1400
     * @tc.name testUint32ArrayPropertyThree014
     * @tc.desc Verify slice(-1) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(-1);
      expect(copy.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1500
     * @tc.name testUint32ArrayPropertyThree015
     * @tc.desc Verify reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1600
     * @tc.name testUint32ArrayPropertyThree016
     * @tc.desc Verify byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      expect(arr.byteLength).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1700
     * @tc.name testUint32ArrayPropertyThree017
     * @tc.desc Verify byteOffset equals 0 for length-4 constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(4);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1800
     * @tc.name testUint32ArrayPropertyThree018
     * @tc.desc Verify typed array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      let arr: Uint32Array = new Uint32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_1900
     * @tc.name testUint32ArrayPropertyThree019
     * @tc.desc Verify ArrayBuffer byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 4, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2000
     * @tc.name testUint32ArrayPropertyThree020
     * @tc.desc Verify ArrayBuffer byteOffset=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2100
     * @tc.name testUint32ArrayPropertyThree021
     * @tc.desc Verify ArrayBuffer byteOffset=28 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 28, 1);
      expect(arr.byteOffset).assertEqual(28);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2200
     * @tc.name testUint32ArrayPropertyThree022
     * @tc.desc Verify ArrayBuffer byteOffset=byteLength length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 32);
      expect(arr.byteOffset).assertEqual(32);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2300
     * @tc.name testUint32ArrayPropertyThree023
     * @tc.desc Verify subarray(1) byteOffset increases by 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let view: Uint32Array = arr.subarray(1);
      expect(view.byteOffset).assertEqual(arr.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2400
     * @tc.name testUint32ArrayPropertyThree024
     * @tc.desc Verify subarray(1) on offset-8 base returns byteOffset 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let view: Uint32Array = arr.subarray(1);
      expect(view.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2500
     * @tc.name testUint32ArrayPropertyThree025
     * @tc.desc Verify subarray(length) byteOffset length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let view: Uint32Array = arr.subarray(arr.length);
      expect(view.byteOffset).assertEqual(24);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2600
     * @tc.name testUint32ArrayPropertyThree026
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let copy: Uint32Array = arr.slice(1, 3);
      expect(copy.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2700
     * @tc.name testUint32ArrayPropertyThree027
     * @tc.desc Verify fill byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      arr.fill(99);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2800
     * @tc.name testUint32ArrayPropertyThree028
     * @tc.desc Verify subarray(0) byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 12, 4);
      let view: Uint32Array = arr.subarray(0);
      expect(view.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_2900
     * @tc.name testUint32ArrayPropertyThree029
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let view: Uint32Array = arr.subarray(1, 3);
      arr.$_set(1, 99);
      expect(view.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3000
     * @tc.name testUint32ArrayPropertyThree030
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let copy: Uint32Array = arr.slice(1, 3);
      arr.$_set(1, 99);
      expect(copy.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3100
     * @tc.name testUint32ArrayPropertyThree031
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(arr.length);
      arr.$_set(0, 77);
      expect(view.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3200
     * @tc.name testUint32ArrayPropertyThree032
     * @tc.desc Verify slice buffer byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let copy: Uint32Array = arr.slice(arr.length + 1);
      expect(copy.buffer.byteLength).assertEqual(0);
      expect(copy.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3300
     * @tc.name testUint32ArrayPropertyThree033
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let v1: Uint32Array = arr.subarray(0, 2);
      let v2: Uint32Array = arr.subarray(0, 2);
      v1.$_set(0, 55);
      expect(v2.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3400
     * @tc.name testUint32ArrayPropertyThree034
     * @tc.desc Verify subarray byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let view: Uint32Array = arr.subarray(2);
      expect(view.byteOffset).assertEqual(16);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3500
     * @tc.name testUint32ArrayPropertyThree035
     * @tc.desc Verify byteLength buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      expect(arr.byteLength).assertEqual(16);
      expect(arr.buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3600
     * @tc.name testUint32ArrayPropertyThree036
     * @tc.desc Verify name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      expect(arr.name).assertEqual('Uint32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3700
     * @tc.name testUint32ArrayPropertyThree037
     * @tc.desc Verify subarray name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let view: Uint32Array = arr.subarray(1);
      expect(view.name).assertEqual('Uint32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3800
     * @tc.name testUint32ArrayPropertyThree038
     * @tc.desc Verify byteOffset=byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint32Array = new Uint32Array(buf, 16);
      expect(arr.byteOffset).assertEqual(16);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_3900
     * @tc.name testUint32ArrayPropertyThree039
     * @tc.desc Verify typed array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint32Array = new Uint32Array(0);
      let arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4000
     * @tc.name testUint32ArrayPropertyThree040
     * @tc.desc Verify ArrayBuffer length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8);
      expect(arr.length).assertEqual(6);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4100
     * @tc.name testUint32ArrayPropertyThree041
     * @tc.desc Verify fill(start>end) no-op length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      arr.fill(99, 3, 1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4200
     * @tc.name testUint32ArrayPropertyThree042
     * @tc.desc Verify copyWithin(start>end) no-op length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 3, 1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4300
     * @tc.name testUint32ArrayPropertyThree043
     * @tc.desc Verify set(src, offset=3) throws RangeError, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let src: Uint32Array = Uint32Array.of(10, 20);
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4400
     * @tc.name testUint32ArrayPropertyThree044
     * @tc.desc Verify set(source ) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let src: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4500
     * @tc.name testUint32ArrayPropertyThree045
     * @tc.desc Verify subarray(999999) length 0 byteOffset 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let view: Uint32Array = arr.subarray(999999);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4600
     * @tc.name testUint32ArrayPropertyThree046
     * @tc.desc Verify subarray(-999999) clamps to begin 0, length 4 byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      let view: Uint32Array = arr.subarray(-999999);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4700
     * @tc.name testUint32ArrayPropertyThree047
     * @tc.desc Verify copyWithin no-op byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.copyWithin(0, 3, 1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4800
     * @tc.name testUint32ArrayPropertyThree048
     * @tc.desc Verify set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Uint32Array = new Uint32Array(buf, 8, 4);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      let src: Uint32Array = Uint32Array.of(10, 20);
      try {
        arr.set(src, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_4900
     * @tc.name testUint32ArrayPropertyThree049
     * @tc.desc Verify sort compareFn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(30, 10, 20);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5000
     * @tc.name testUint32ArrayPropertyThree050
     * @tc.desc Verify map mapFn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      try {
        arr.map((v: number, index: int, array: Uint32Array): number => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5100
     * @tc.name testUint32ArrayPropertyThree051
     * @tc.desc Verify reduce length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      try {
        arr.reduce((acc: number, v: number, index: int, array: Uint32Array): number => { throw new Error('boom'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5200
     * @tc.name testUint32ArrayPropertyThree052
     * @tc.desc Verify reduce initialValue TypeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      try {
        arr.reduce((acc: number, v: number, index: int, array: Uint32Array): number => { return acc + v; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5300
     * @tc.name testUint32ArrayPropertyThree053
     * @tc.desc Verify length/byteLength/byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5400
     * @tc.name testUint32ArrayPropertyThree054
     * @tc.desc Verify length=1 byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(4294967295);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5500
     * @tc.name testUint32ArrayPropertyThree055
     * @tc.desc Verify of(0,0,0,0,0) length 5 byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0, 0);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5600
     * @tc.name testUint32ArrayPropertyThree056
     * @tc.desc Verify of(4294967295,4294967295,4294967295) length 3 byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(4294967295, 4294967295, 4294967295);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5700
     * @tc.name testUint32ArrayPropertyThree057
     * @tc.desc Verify buffer.byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7, 7, 7, 7);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5800
     * @tc.name testUint32ArrayPropertyThree058
     * @tc.desc Verify subarray(-1) length 1 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(42);
      let view: Uint32Array = arr.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_THREE_5900
     * @tc.name testUint32ArrayPropertyThree059
     * @tc.desc Verify subarray(0) length 0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      let view: Uint32Array = arr.subarray(0);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(0);
    });

  });
}
