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

export default function uint32ArrayConstructorTest(): void {
  describe('Uint32ArrayConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0100
     * @tc.name testUint32ArrayConstructorOne001
     * @tc.desc Verify 1 constructor() arity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testUint32ArrayConstructorOne002
     * @tc.desc Verify 5 constructor(Array<number>) arity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testUint32ArrayConstructorOne003
     * @tc.desc Verify 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0);
      arr[0] = 12345;
      expect(arr[0]).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testUint32ArrayConstructorOne004
     * @tc.desc Verify byteLength 0 testUint32ArrayConstructorOne_004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testUint32ArrayConstructorOne005
     * @tc.desc Verify byteOffset 0 testUint32ArrayConstructorOne_005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testUint32ArrayConstructorOne006
     * @tc.desc Verify buffer: arr.buffer.byteLength assertEqual(0);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testUint32ArrayConstructorOne007
     * @tc.desc Verify BYTES_PER_ELEMENT 4 testUint32ArrayConstructorOne_007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testUint32ArrayConstructorOne008
     * @tc.desc Verify [0] throws RangeError on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testUint32ArrayConstructorOne009
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testUint32ArrayConstructorOne010
     * @tc.desc Verify join(',') result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testUint32ArrayConstructorOne011
     * @tc.desc Verify $_set no-op length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array();
      try {
        arr[0] = 10;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1200
     * @tc.name testUint32ArrayConstructorOne012
     * @tc.desc Verify buffer: sameBuffer assertFalse();
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint32Array = new Uint32Array();
      const b: Uint32Array = new Uint32Array();
      const sameBuffer: boolean = a.buffer === b.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1300
     * @tc.name testUint32ArrayConstructorOne013
     * @tc.desc Verify byteLength 0 (src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1400
     * @tc.name testUint32ArrayConstructorOne014
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1500
     * @tc.name testUint32ArrayConstructorOne015
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1600
     * @tc.name testUint32ArrayConstructorOne016
     * @tc.desc Verify 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [255];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1700
     * @tc.name testUint32ArrayConstructorOne017
     * @tc.desc Verify 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0o17];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1800
     * @tc.name testUint32ArrayConstructorOne018
     * @tc.desc Verify 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0b1010];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_1900
     * @tc.name testUint32ArrayConstructorOne019
     * @tc.desc Verify 2147483647 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2000
     * @tc.name testUint32ArrayConstructorOne020
     * @tc.desc Verify -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2100
     * @tc.name testUint32ArrayConstructorOne021
     * @tc.desc Verify -2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-2];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2200
     * @tc.name testUint32ArrayConstructorOne022
     * @tc.desc Verify -2147483648 number 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-2147483648];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2300
     * @tc.name testUint32ArrayConstructorOne023
     * @tc.desc Verify byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2400
     * @tc.name testUint32ArrayConstructorOne024
     * @tc.desc Verify toString 10,20,30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2500
     * @tc.name testUint32ArrayConstructorOne025
     * @tc.desc Verify join('|') result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.join('|')).assertEqual('10|20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2600
     * @tc.name testUint32ArrayConstructorOne026
     * @tc.desc Verify length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0, 0];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2700
     * @tc.name testUint32ArrayConstructorOne027
     * @tc.desc Verify [1000, 0xFF, 0o17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1000, 0xFF, 0o17];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2800
     * @tc.name testUint32ArrayConstructorOne028
     * @tc.desc Verify 100 length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
        20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
        30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
        40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
        50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
        60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
        70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
        80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
        90, 91, 92, 93, 94, 95, 96, 97, 98, 99
      ];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_2900
     * @tc.name testUint32ArrayConstructorOne029
     * @tc.desc Verify length 2 and arr[0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3000
     * @tc.name testUint32ArrayConstructorOne030
     * @tc.desc Verify FixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3100
     * @tc.name testUint32ArrayConstructorOne031
     * @tc.desc Verify 8 offset 0 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3200
     * @tc.name testUint32ArrayConstructorOne032
     * @tc.desc Verify 8 offset 0 byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3300
     * @tc.name testUint32ArrayConstructorOne033
     * @tc.desc Verify 8 offset 4 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 4);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3400
     * @tc.name testUint32ArrayConstructorOne034
     * @tc.desc Verify 8 offset 4 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3500
     * @tc.name testUint32ArrayConstructorOne035
     * @tc.desc Verify 8 offset 4 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3600
     * @tc.name testUint32ArrayConstructorOne036
     * @tc.desc Verify buffer: arr.buffer assertEqual(buf);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3700
     * @tc.name testUint32ArrayConstructorOne037
     * @tc.desc Verify 8 toString 0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr.toString()).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3800
     * @tc.name testUint32ArrayConstructorOne038
     * @tc.desc Verify constructor(Array) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_3900
     * @tc.name testUint32ArrayConstructorOne039
     * @tc.desc Verify constructor(buf,0) length 2 and arr[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint32Array = new Uint32Array(buf, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4000
     * @tc.name testUint32ArrayConstructorOne040
     * @tc.desc Verify 5 byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4100
     * @tc.name testUint32ArrayConstructorOne041
     * @tc.desc Verify 9 13 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Uint32Array = new Uint32Array(buf, 0);
      const b: Uint32Array = new Uint32Array(buf);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4200
     * @tc.name testUint32ArrayConstructorOne042
     * @tc.desc Verify 8 byteOffset 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4300
     * @tc.name testUint32ArrayConstructorOne043
     * @tc.desc Verify 8 byteOffset 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4400
     * @tc.name testUint32ArrayConstructorOne044
     * @tc.desc Verify 8 byteOffset 3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4500
     * @tc.name testUint32ArrayConstructorOne045
     * @tc.desc Verify 16 byteOffset 6 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4600
     * @tc.name testUint32ArrayConstructorOne046
     * @tc.desc Verify 16 byteOffset 13 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 13);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4700
     * @tc.name testUint32ArrayConstructorOne047
     * @tc.desc Verify byteOffset invalid throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 12);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4800
     * @tc.name testUint32ArrayConstructorOne048
     * @tc.desc Verify byteOffset invalid throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_4900
     * @tc.name testUint32ArrayConstructorOne049
     * @tc.desc Verify byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5000
     * @tc.name testUint32ArrayConstructorOne050
     * @tc.desc Verify byteOffset invalid throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5100
     * @tc.name testUint32ArrayConstructorOne051
     * @tc.desc Verify 0 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        new Uint32Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5200
     * @tc.name testUint32ArrayConstructorOne052
     * @tc.desc Verify 4 byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Uint32Array(buf, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5300
     * @tc.name testUint32ArrayConstructorOne053
     * @tc.desc Verify 5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      try {
        new Uint32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5400
     * @tc.name testUint32ArrayConstructorOne054
     * @tc.desc Verify number -3 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-3];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr[0]).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5500
     * @tc.name testUint32ArrayConstructorOne055
     * @tc.desc Verify [0, 0, 0] toString 0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0];
      const arr: Uint32Array = new Uint32Array(src);
      expect(arr.toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5600
     * @tc.name testUint32ArrayConstructorOne056
     * @tc.desc Verify 0xFF 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buf);
      const max: number = 255;
      bytes[0] = max;
      bytes[1] = max;
      bytes[2] = max;
      bytes[3] = max;
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5700
     * @tc.name testUint32ArrayConstructorOne057
     * @tc.desc Verify 0x00 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buf);
      const zero: number = 0;
      bytes[0] = zero;
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5800
     * @tc.name testUint32ArrayConstructorOne058
     * @tc.desc Verify 0xFF 0xFF 0xFF 0x7F 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buf);
      const max: number = 255;
      const high: number = 127;
      bytes[0] = max;
      bytes[1] = max;
      bytes[2] = max;
      bytes[3] = high;
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_5900
     * @tc.name testUint32ArrayConstructorOne059
     * @tc.desc Verify 0x00 0x00 0x00 0x80 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buf);
      const high: number = 128;
      bytes[3] = high;
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6000
     * @tc.name testUint32ArrayConstructorOne060
     * @tc.desc Verify 8 0xFF 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bytes: Uint8Array = new Uint8Array(buf);
      const max: number = 255;
      bytes[0] = max;
      bytes[1] = max;
      bytes[2] = max;
      bytes[3] = max;
      bytes[4] = max;
      bytes[5] = max;
      bytes[6] = max;
      bytes[7] = max;
      const arr: Uint32Array = new Uint32Array(buf);
      expect(arr[1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6100
     * @tc.name testUint32ArrayConstructorOne061
     * @tc.desc Verify 9 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint32Array = new Uint32Array(buf, 0);
      const b: Uint32Array = new Uint32Array(buf, 0);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6200
     * @tc.name testUint32ArrayConstructorOne062
     * @tc.desc Verify offset 8: a[0] assertEqual(0);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Uint32Array = new Uint32Array(buf, 0);
      const b: Uint32Array = new Uint32Array(buf, 8);
      b[0] = 123;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6300
     * @tc.name testUint32ArrayConstructorOne063
     * @tc.desc Verify offset 8: a[2] assertEqual(123);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Uint32Array = new Uint32Array(buf, 0);
      const b: Uint32Array = new Uint32Array(buf, 8);
      b[0] = 123;
      expect(a[2]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6400
     * @tc.name testUint32ArrayConstructorOne064
     * @tc.desc Verify buffer: bytes[0] assertEqual(1);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint32Array = new Uint32Array(buf);
      arr[0] = 1;
      const bytes: Uint8Array = new Uint8Array(buf);
      expect(bytes[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6500
     * @tc.name testUint32ArrayConstructorOne065
     * @tc.desc Verify 5 FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr: Uint32Array = new Uint32Array(src);
      arr[0] = 999;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_ONE_6600
     * @tc.name testUint32ArrayConstructorOne066
     * @tc.desc Verify 5 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const a: Uint32Array = new Uint32Array(src);
      const b: Uint32Array = new Uint32Array(src);
      a[0] = 555;
      expect(b[0]).assertEqual(1);
    });

  });
}
