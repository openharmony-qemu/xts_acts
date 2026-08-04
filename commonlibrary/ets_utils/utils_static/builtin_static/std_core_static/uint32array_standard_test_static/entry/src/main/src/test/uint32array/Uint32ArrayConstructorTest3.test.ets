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

export default function uint32ArrayConstructorTest3(): void {
  describe('Uint32ArrayConstructorTest3', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testUint32ArrayConstructorThree001
     * @tc.desc Verify constructor(length: number) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 4;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(4);
      expect(values.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testUint32ArrayConstructorThree002
     * @tc.desc Verify constructor(numbers: Array<number>) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2, 3];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testUint32ArrayConstructorThree003
     * @tc.desc Verify constructor(buf, byteOffset, length) arity=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 0, 4);
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testUint32ArrayConstructorThree004
     * @tc.desc Verify length=2.0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2.0;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testUint32ArrayConstructorThree005
     * @tc.desc Verify length=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 0.0;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testUint32ArrayConstructorThree006
     * @tc.desc Verify length=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 100;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testUint32ArrayConstructorThree007
     * @tc.desc Verify length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 1;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testUint32ArrayConstructorThree008
     * @tc.desc Verify length=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const length: number = -1;
        new Uint32Array(length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testUint32ArrayConstructorThree009
     * @tc.desc Verify length=4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 4;
      const values = new Uint32Array(length);
      expect(values[0]).assertEqual(0);
      expect(values[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testUint32ArrayConstructorThree010
     * @tc.desc Verify length=0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 0;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(0);
      expect(values.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testUint32ArrayConstructorThree011
     * @tc.desc Verify length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 8;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testUint32ArrayConstructorThree012
     * @tc.desc Verify numbers [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [5];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testUint32ArrayConstructorThree013
     * @tc.desc Verify numbers uint32.MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [4294967295];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1400
     * @tc.name testUint32ArrayConstructorThree014
     * @tc.desc Verify numbers 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1500
     * @tc.name testUint32ArrayConstructorThree015
     * @tc.desc Verify numbers 2147483647 int32.MAX uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [2147483647];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1600
     * @tc.name testUint32ArrayConstructorThree016
     * @tc.desc Verify numbers -2147483648 int32.MIN uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-2147483648];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1700
     * @tc.name testUint32ArrayConstructorThree017
     * @tc.desc Verify numbers -2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-2];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1800
     * @tc.name testUint32ArrayConstructorThree018
     * @tc.desc Verify numbers 0o777 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0o777];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_1900
     * @tc.name testUint32ArrayConstructorThree019
     * @tc.desc Verify numbers 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0b1010];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2000
     * @tc.name testUint32ArrayConstructorThree020
     * @tc.desc Verify numbers [-5, 5, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-5, 5, -1];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967291);
      expect(values[1]).assertEqual(5);
      expect(values[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2100
     * @tc.name testUint32ArrayConstructorThree021
     * @tc.desc Verify numbers 0 [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0, 0, 0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
      expect(values[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2200
     * @tc.name testUint32ArrayConstructorThree022
     * @tc.desc Verify numbers [7, 7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [7, 7, 7, 7];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(7);
      expect(values[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2300
     * @tc.name testUint32ArrayConstructorThree023
     * @tc.desc Verify numbers 255 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [255, 0xFF];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2400
     * @tc.name testUint32ArrayConstructorThree024
     * @tc.desc Verify numbers 0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0o17, 15];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(15);
      expect(values[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2500
     * @tc.name testUint32ArrayConstructorThree025
     * @tc.desc Verify numbers 0b11111111 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0b11111111, 255];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(255);
      expect(values[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2600
     * @tc.name testUint32ArrayConstructorThree026
     * @tc.desc Verify numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2, 3];
      const values = new Uint32Array(numbers);
      numbers[0] = 999;
      expect(values[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2700
     * @tc.name testUint32ArrayConstructorThree027
     * @tc.desc Verify numbers byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2, 3, 4];
      const values = new Uint32Array(numbers);
      expect(values.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2800
     * @tc.name testUint32ArrayConstructorThree028
     * @tc.desc Verify numbers byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2];
      const values = new Uint32Array(numbers);
      expect(values.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_2900
     * @tc.name testUint32ArrayConstructorThree029
     * @tc.desc Verify constructor(Array<number>) length 2 and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3000
     * @tc.name testUint32ArrayConstructorThree030
     * @tc.desc Verify numbers int32 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-2147483647];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3100
     * @tc.name testUint32ArrayConstructorThree031
     * @tc.desc Verify numbers 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1e3];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3200
     * @tc.name testUint32ArrayConstructorThree032
     * @tc.desc Verify numbers 65535 uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [65535];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3300
     * @tc.name testUint32ArrayConstructorThree033
     * @tc.desc Verify numbers 65536 uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [65536];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3400
     * @tc.name testUint32ArrayConstructorThree034
     * @tc.desc Verify buf=ArrayBuffer(8) byteOffset=0 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      expect(values.length).assertEqual(2);
      expect(values.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3500
     * @tc.name testUint32ArrayConstructorThree035
     * @tc.desc Verify buf=ArrayBuffer(16) byteOffset=4 length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 4, 3);
      expect(values.length).assertEqual(3);
      expect(values.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3600
     * @tc.name testUint32ArrayConstructorThree036
     * @tc.desc Verify buf=ArrayBuffer(16) byteOffset=8 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 8, 2);
      expect(values.length).assertEqual(2);
      expect(values.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3700
     * @tc.name testUint32ArrayConstructorThree037
     * @tc.desc Verify buf=ArrayBuffer(4) byteOffset=0 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const values = new Uint32Array(buf, 0, 1);
      expect(values.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3800
     * @tc.name testUint32ArrayConstructorThree038
     * @tc.desc Verify byteOffset=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_3900
     * @tc.name testUint32ArrayConstructorThree039
     * @tc.desc Verify byteOffset=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 2, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4000
     * @tc.name testUint32ArrayConstructorThree040
     * @tc.desc Verify byteOffset=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4100
     * @tc.name testUint32ArrayConstructorThree041
     * @tc.desc Verify byteOffset=5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4200
     * @tc.name testUint32ArrayConstructorThree042
     * @tc.desc Verify byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 4, 1);
      expect(values.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4300
     * @tc.name testUint32ArrayConstructorThree043
     * @tc.desc Verify length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4400
     * @tc.name testUint32ArrayConstructorThree044
     * @tc.desc Verify byteOffset=4 length=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      try {
        new Uint32Array(buf, 4, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4500
     * @tc.name testUint32ArrayConstructorThree045
     * @tc.desc Verify length=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4600
     * @tc.name testUint32ArrayConstructorThree046
     * @tc.desc Verify length=-100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 0, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4700
     * @tc.name testUint32ArrayConstructorThree047
     * @tc.desc Verify byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4800
     * @tc.name testUint32ArrayConstructorThree048
     * @tc.desc Verify byteOffset=-4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_4900
     * @tc.name testUint32ArrayConstructorThree049
     * @tc.desc Verify byteOffset=8 length=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5000
     * @tc.name testUint32ArrayConstructorThree050
     * @tc.desc Verify byteOffset=12 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 12, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5100
     * @tc.name testUint32ArrayConstructorThree051
     * @tc.desc Verify byteOffset=100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 100, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5200
     * @tc.name testUint32ArrayConstructorThree052
     * @tc.desc Verify buf=ArrayBuffer(20) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const values = new Uint32Array(buf, 0, 5);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5300
     * @tc.name testUint32ArrayConstructorThree053
     * @tc.desc Verify buf=ArrayBuffer(64) 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const values = new Uint32Array(buf, 0, 16);
      expect(values.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5400
     * @tc.name testUint32ArrayConstructorThree054
     * @tc.desc Verify buf=ArrayBuffer(65536) 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65536);
      const values = new Uint32Array(buf, 0, 16384);
      expect(values.length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5500
     * @tc.name testUint32ArrayConstructorThree055
     * @tc.desc Verify constructor(3) length 3 and values[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 3;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5600
     * @tc.name testUint32ArrayConstructorThree056
     * @tc.desc Verify constructor(buf,0,2) length 2 and values[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5700
     * @tc.name testUint32ArrayConstructorThree057
     * @tc.desc Verify constructor(buf,off,len) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const values = new Uint32Array(buf, 12, 2);
      expect(values.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5800
     * @tc.name testUint32ArrayConstructorThree058
     * @tc.desc Verify constructor(length:number) buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 5;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_5900
     * @tc.name testUint32ArrayConstructorThree059
     * @tc.desc Verify constructor(buf,off,len) buf=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(null as Object as ArrayBuffer, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6000
     * @tc.name testUint32ArrayConstructorThree060
     * @tc.desc Verify constructor(numbers) null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(null as Object as Array<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6100
     * @tc.name testUint32ArrayConstructorThree061
     * @tc.desc Verify numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [4294967296, 5, 4294967297];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(5);
      expect(values[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6200
     * @tc.name testUint32ArrayConstructorThree062
     * @tc.desc Verify constructor(buf,off,len) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const firstView = new Uint32Array(buf, 0, 2);
      const secondView = new Uint32Array(buf, 8, 2);
      firstView[0] = 1;
      secondView[0] = 2;
      expect(firstView[0]).assertEqual(1);
      expect(secondView[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6300
     * @tc.name testUint32ArrayConstructorThree063
     * @tc.desc Verify constructor(buf,off,len) byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 8, 2);
      expect(values.byteOffset).assertEqual(8);
      expect(values.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6400
     * @tc.name testUint32ArrayConstructorThree064
     * @tc.desc Verify constructor(buf,off,len) Data View
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      values[0] = 0x11223344;
      const other = new Uint32Array(buf, 0, 1);
      expect(other[0]).assertEqual(0x11223344);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6500
     * @tc.name testUint32ArrayConstructorThree065
     * @tc.desc Verify constructor(buf,off,len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      values[0] = 100;
      values[1] = 200;
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6600
     * @tc.name testUint32ArrayConstructorThree066
     * @tc.desc Verify constructor(buf,off,len) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6700
     * @tc.name testUint32ArrayConstructorThree067
     * @tc.desc Verify constructor(buf,off,len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Uint32Array(buf, 0, 4);
      v1[0] = 5;
      const v2 = new Uint32Array(buf, 0, 1);
      expect(v2[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6800
     * @tc.name testUint32ArrayConstructorThree068
     * @tc.desc Verify constructor(length:number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 3;
      const values = new Uint32Array(length);
      values[0] = 11;
      values[2] = 33;
      expect(values[0]).assertEqual(11);
      expect(values[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_6900
     * @tc.name testUint32ArrayConstructorThree069
     * @tc.desc Verify constructor(buf,off,len) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      expect(values.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7000
     * @tc.name testUint32ArrayConstructorThree070
     * @tc.desc Verify constructor(length:number) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      expect(values.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7100
     * @tc.name testUint32ArrayConstructorThree071
     * @tc.desc Verify constructor(numbers) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2, 3];
      const values = new Uint32Array(numbers);
      expect(values.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7200
     * @tc.name testUint32ArrayConstructorThree072
     * @tc.desc Verify constructor(numbers) 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0, 4294967295];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7300
     * @tc.name testUint32ArrayConstructorThree073
     * @tc.desc Verify constructor(numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-1, -2, -3];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967295);
      expect(values[1]).assertEqual(4294967294);
      expect(values[2]).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7400
     * @tc.name testUint32ArrayConstructorThree074
     * @tc.desc Verify OOB indexed read on buf-constructed array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      try {
        values[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7500
     * @tc.name testUint32ArrayConstructorThree075
     * @tc.desc Verify OOB indexed read on numbers-constructed array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2];
      const values = new Uint32Array(numbers);
      try {
        values[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7600
     * @tc.name testUint32ArrayConstructorThree076
     * @tc.desc Verify OOB indexed write on buf-constructed array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      try {
        values[10] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7700
     * @tc.name testUint32ArrayConstructorThree077
     * @tc.desc Verify constructor(numbers) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1, 2, 3];
      const values = new Uint32Array(numbers);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7800
     * @tc.name testUint32ArrayConstructorThree078
     * @tc.desc Verify constructor(buf,off,len) toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 2);
      values[0] = 5;
      values[1] = 6;
      expect(values.toString()).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_7900
     * @tc.name testUint32ArrayConstructorThree079
     * @tc.desc Verify constructor(length:number) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 5;
      const values = new Uint32Array(length);
      expect(values[0]).assertEqual(0);
      expect(values[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_8000
     * @tc.name testUint32ArrayConstructorThree080
     * @tc.desc Verify constructor(length:number) length=1e1 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 1e1;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_8100
     * @tc.name testUint32ArrayConstructorThree081
     * @tc.desc Verify constructor(buf,off,len) byteOffset=0 length=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const values = new Uint32Array(buf, 0, 0);
      expect(values.length).assertEqual(0);
      expect(values.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_THREE_8200
     * @tc.name testUint32ArrayConstructorThree082
     * @tc.desc Verify constructor(buf,off,len) length=2147483647 length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
