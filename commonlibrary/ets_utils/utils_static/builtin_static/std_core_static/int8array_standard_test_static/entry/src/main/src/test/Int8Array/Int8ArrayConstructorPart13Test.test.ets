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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from './../Util.test';

class Int8SrcArrayLike implements ArrayLike<number> {
  private readonly _data: number[];
  private readonly _overrideLen: number;
  private readonly _hasOverride: boolean;

  constructor(data: number[], overrideLength?: number) {
    this._data = [...data];
    if (overrideLength !== undefined) {
      this._overrideLen = overrideLength;
      this._hasOverride = true;
    } else {
      this._overrideLen = 0;
      this._hasOverride = false;
    }
  }

  get length(): int {
    if (!this._hasOverride) {
      return this._data.length;
    }
    if (isNaN(this._overrideLen) || this._overrideLen <= 0 ||
        !isFinite(this._overrideLen)) {
      return 0;
    }
    return this._overrideLen.toInt();
  }

  $_get(index: int): number {
    if (index < 0 || index >= this._data.length) {
      return 0;
    }
    return this._data[index];
  }

  $_set(index: int, value: number): void {
    if (index >= 0 && index < this._data.length) {
      this._data[index] = value;
    }
  }
}

export default function int8ArrayConstructorPart13TestTest(): void {
  describe('Int8ArrayConstructorPart13TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0100
     * @tc.name int8ArrayConstructorPart13Test001
     * @tc.desc Verify 1 (ArrayBuffer) length byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0200
     * @tc.name int8ArrayConstructorPart13Test002
     * @tc.desc Verify 1 (ArrayLike<Number>) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0300
     * @tc.name int8ArrayConstructorPart13Test003
     * @tc.desc Verify ArrayBuffer (byteLength=0) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0400
     * @tc.name int8ArrayConstructorPart13Test004
     * @tc.desc Verify 1 ArrayBuffer length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0500
     * @tc.name int8ArrayConstructorPart13Test005
     * @tc.desc Verify 4 ArrayBuffer 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0600
     * @tc.name int8ArrayConstructorPart13Test006
     * @tc.desc Verify 0x00 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x00);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0700
     * @tc.name int8ArrayConstructorPart13Test007
     * @tc.desc Verify 0x7F 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x7F);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0800
     * @tc.name int8ArrayConstructorPart13Test008
     * @tc.desc Verify 0x80 -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x80);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_0900
     * @tc.name int8ArrayConstructorPart13Test009
     * @tc.desc Verify 0x81 -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x81);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1000
     * @tc.name int8ArrayConstructorPart13Test010
     * @tc.desc Verify 0xFF -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setUint8(0, 0xFF);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1100
     * @tc.name int8ArrayConstructorPart13Test011
     * @tc.desc Verify 4 [0x01,0x02,0x03,0x04] 1:1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x01);
      dv.setUint8(1, 0x02);
      dv.setUint8(2, 0x03);
      dv.setUint8(3, 0x04);
      let arr = new Int8Array(buf);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1200
     * @tc.name int8ArrayConstructorPart13Test012
     * @tc.desc Verify 256 ArrayBuffer length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(256);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1300
     * @tc.name int8ArrayConstructorPart13Test013
     * @tc.desc Verify 0xFF (4 ) -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setUint8(0, 0xFF);
      dv.setUint8(1, 0xFF);
      dv.setUint8(2, 0xFF);
      dv.setUint8(3, 0xFF);
      let arr = new Int8Array(buf);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1400
     * @tc.name int8ArrayConstructorPart13Test014
     * @tc.desc Verify 2 [0x01,0xFE] -2 0xFE=254 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let dv = new DataView(buf);
      dv.setUint8(0, 0x01);
      dv.setUint8(1, 0xFE);
      let arr = new Int8Array(buf);
      expect(arr.$_get(1)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1500
     * @tc.name int8ArrayConstructorPart13Test015
     * @tc.desc Verify Uint8Array 200 (0xC8) Int8Array -56 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let u8 = new Uint8Array(buf);
      u8.$_set(0, 200);
      let arr = new Int8Array(buf);
      expect(arr.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1600
     * @tc.name int8ArrayConstructorPart13Test016
     * @tc.desc Verify arr.buffer buf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1700
     * @tc.name int8ArrayConstructorPart13Test017
     * @tc.desc Verify buffer arr.$_set(0,100) DataView.getInt8(0)===100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let arr = new Int8Array(buf);
      arr.$_set(0, 100);
      let dv = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1800
     * @tc.name int8ArrayConstructorPart13Test018
     * @tc.desc Verify buffer DataView.setInt8(0,-50) arr.$_get(0)===-50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let arr = new Int8Array(buf);
      let dv = new DataView(buf);
      dv.setInt8(0, -50);
      expect(arr.$_get(0)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_1900
     * @tc.name int8ArrayConstructorPart13Test019
     * @tc.desc Verify Int8Array view1.$_set(1,42) view2.$_get(1)===42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let view1 = new Int8Array(buf);
      let view2 = new Int8Array(buf);
      view1.$_set(1, 42);
      expect(view2.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2000
     * @tc.name int8ArrayConstructorPart13Test020
     * @tc.desc Verify Int8Array Uint8Array i8.$_set(0,-1) u8.$_get(0)===255 /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let i8 = new Int8Array(buf);
      let u8 = new Uint8Array(buf);
      i8.$_set(0, -1);
      expect(u8.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2100
     * @tc.name int8ArrayConstructorPart13Test021
     * @tc.desc Verify Int8Array DataView i8.$_set(0,100) dv.getUint8(0)===100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let i8 = new Int8Array(buf);
      i8.$_set(0, 100);
      let dv = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2200
     * @tc.name int8ArrayConstructorPart13Test022
     * @tc.desc Verify Int8Array v1.$_set(0,7) v3.$_get(0)===7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let viewA = new Int8Array(buf);
      let viewB = new Int8Array(buf);
      let viewC = new Int8Array(buf);
      viewA.$_set(0, 7);
      expect(viewC.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2300
     * @tc.name int8ArrayConstructorPart13Test023
     * @tc.desc Verify arr.byteOffset === 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2400
     * @tc.name int8ArrayConstructorPart13Test024
     * @tc.desc Verify arr.byteLength === buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      let arr = new Int8Array(buf);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2500
     * @tc.name int8ArrayConstructorPart13Test025
     * @tc.desc Verify arr.length === buf.byteLength int8 1:1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2600
     * @tc.name int8ArrayConstructorPart13Test026
     * @tc.desc Verify arr Int8Array(buf) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let arr = new Int8Array(buf);
      arr.$_set(0, 42);
      let arr2 = new Int8Array(buf);
      expect(arr2.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2700
     * @tc.name int8ArrayConstructorPart13Test027
     * @tc.desc Verify arr.$_set buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      arr.$_set(0, 100);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2800
     * @tc.name int8ArrayConstructorPart13Test028
     * @tc.desc Verify arr.$_set(0,127) dv.getUint8(0)===127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let arr = new Int8Array(buf);
      arr.$_set(0, INT8_MAX);
      let dv = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_2900
     * @tc.name int8ArrayConstructorPart13Test029
     * @tc.desc Verify buffer arr1 arr2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1 = new ArrayBuffer(2);
      let buf2 = new ArrayBuffer(2);
      let arr1 = new Int8Array(buf1);
      let arr2 = new Int8Array(buf2);
      arr1.$_set(0, 77);
      expect(arr2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3000
     * @tc.name int8ArrayConstructorPart13Test030
     * @tc.desc Verify ArrayLike (length 0) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3100
     * @tc.name int8ArrayConstructorPart13Test031
     * @tc.desc Verify length 1 [5.0] [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([5.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3200
     * @tc.name int8ArrayConstructorPart13Test032
     * @tc.desc Verify length 3 [1.0,2.0,3.0] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3300
     * @tc.name int8ArrayConstructorPart13Test033
     * @tc.desc Verify (arr src ) arr src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      arr.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3400
     * @tc.name int8ArrayConstructorPart13Test034
     * @tc.desc Verify (src arr ) src arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      src.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3500
     * @tc.name int8ArrayConstructorPart13Test035
     * @tc.desc Verify [-128.0] -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-128.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3600
     * @tc.name int8ArrayConstructorPart13Test036
     * @tc.desc Verify [127.0] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([127.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3700
     * @tc.name int8ArrayConstructorPart13Test037
     * @tc.desc Verify [0.0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([0.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3800
     * @tc.name int8ArrayConstructorPart13Test038
     * @tc.desc Verify [-1.0] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-1.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_3900
     * @tc.name int8ArrayConstructorPart13Test039
     * @tc.desc Verify [128.0] -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([128.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4000
     * @tc.name int8ArrayConstructorPart13Test040
     * @tc.desc Verify [-129.0] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-129.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4100
     * @tc.name int8ArrayConstructorPart13Test041
     * @tc.desc Verify [255.0] -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([255.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4200
     * @tc.name int8ArrayConstructorPart13Test042
     * @tc.desc Verify [256.0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([256.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4300
     * @tc.name int8ArrayConstructorPart13Test043
     * @tc.desc Verify [Number.NaN] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([Number.NaN]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4400
     * @tc.name int8ArrayConstructorPart13Test044
     * @tc.desc Verify [1.9] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.9]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4500
     * @tc.name int8ArrayConstructorPart13Test045
     * @tc.desc Verify [-1.9] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-1.9]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4600
     * @tc.name int8ArrayConstructorPart13Test046
     * @tc.desc Verify [129.0] -127 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([129.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4700
     * @tc.name int8ArrayConstructorPart13Test047
     * @tc.desc Verify [1000.0] -24 1000 mod 256=232 -24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1000.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4800
     * @tc.name int8ArrayConstructorPart13Test048
     * @tc.desc Verify [-1000.0] 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-1000.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_4900
     * @tc.name int8ArrayConstructorPart13Test049
     * @tc.desc Verify [1e6] 64 1000000 mod 256=64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1e6]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5000
     * @tc.name int8ArrayConstructorPart13Test050
     * @tc.desc Verify [-1e6] -64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-1e6]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5100
     * @tc.name int8ArrayConstructorPart13Test051
     * @tc.desc Verify [1.0, 2.7, -3.9] -3.9 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.7, -3.9]);
      let arr = new Int8Array(src);
      expect(arr.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5200
     * @tc.name int8ArrayConstructorPart13Test052
     * @tc.desc Verify length=3 index0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([7.0], 3);
      let arr = new Int8Array(src);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5300
     * @tc.name int8ArrayConstructorPart13Test053
     * @tc.desc Verify length=0 index0 length 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([99.0], 0);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5400
     * @tc.name int8ArrayConstructorPart13Test054
     * @tc.desc Verify length=2.9 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0], 2.9);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5500
     * @tc.name int8ArrayConstructorPart13Test055
     * @tc.desc Verify length=1 2 length 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([5.0, 9.0], 1);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5600
     * @tc.name int8ArrayConstructorPart13Test056
     * @tc.desc Verify src Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr1 = new Int8Array(src);
      let arr2 = new Int8Array(src);
      arr1.$_set(0, 99);
      expect(arr2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5700
     * @tc.name int8ArrayConstructorPart13Test057
     * @tc.desc Verify [-128.0, 127.0, -128.0, 127.0] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-128.0, 127.0, -128.0, 127.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5800
     * @tc.name int8ArrayConstructorPart13Test058
     * @tc.desc Verify [Number.MIN_VALUE] (5e-324) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([5e-324]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_5900
     * @tc.name int8ArrayConstructorPart13Test059
     * @tc.desc Verify 100 128.0 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        data.push(128.0);
      }
      let src = new Int8SrcArrayLike(data);
      let arr = new Int8Array(src);
      expect(arr.$_get(99)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6000
     * @tc.name int8ArrayConstructorPart13Test060
     * @tc.desc Verify [0.5] 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([0.5]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6100
     * @tc.name int8ArrayConstructorPart13Test061
     * @tc.desc Verify [Number.MAX_SAFE_INTEGER] -1 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([9007199254740991]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6200
     * @tc.name int8ArrayConstructorPart13Test062
     * @tc.desc Verify [-Number.MAX_SAFE_INTEGER] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([-9007199254740991]);
      let arr = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6300
     * @tc.name int8ArrayConstructorPart13Test063
     * @tc.desc Verify ArrayBuffer arr instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      expect(arr.length).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6400
     * @tc.name int8ArrayConstructorPart13Test064
     * @tc.desc Verify ArrayLike arr instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0]);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6500
     * @tc.name int8ArrayConstructorPart13Test065
     * @tc.desc Verify arr.BYTES_PER_ELEMENT === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let arr = new Int8Array(buf);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6600
     * @tc.name int8ArrayConstructorPart13Test066
     * @tc.desc Verify ArrayLike [1.0,2.0,3.0] arr.toString() === '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6700
     * @tc.name int8ArrayConstructorPart13Test067
     * @tc.desc Verify ArrayBuffer arr.buffer.byteLength === arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int8Array(buf);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6800
     * @tc.name int8ArrayConstructorPart13Test068
     * @tc.desc Verify ArrayLike arr.buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0]);
      let arr = new Int8Array(src);
      expect(arr.buffer.byteLength).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_6900
     * @tc.name int8ArrayConstructorPart13Test069
     * @tc.desc Verify ArrayLike arr.byteLength === arr.length int8 1:1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7000
     * @tc.name int8ArrayConstructorPart13Test070
     * @tc.desc Verify ArrayLike length=-1 length 0 ToLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d, -1);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7100
     * @tc.name int8ArrayConstructorPart13Test071
     * @tc.desc Verify ArrayLike length=NaN length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d, Number.NaN);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7200
     * @tc.name int8ArrayConstructorPart13Test072
     * @tc.desc Verify ArrayLike length=Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d, 9007199254740991);
      try {
        new Int8Array(src);
        expect().assertFail();
      } catch (e) {
        expect(e).not().assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7300
     * @tc.name int8ArrayConstructorPart13Test073
     * @tc.desc Verify ArrayLike length=-Infinity length 0 ToLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d, -Number.POSITIVE_INFINITY);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7400
     * @tc.name int8ArrayConstructorPart13Test074
     * @tc.desc Verify ArrayLike length=0.5 length 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Array<number> = [];
      let src = new Int8SrcArrayLike(d, 0.5);
      let arr = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7500
       * @tc.name int8ArrayConstructorPart13Test075
       * @tc.desc Verify ArrayBuffer arr $_get(length) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart13Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(2);
        let arr = new Int8Array(buf);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7600
       * @tc.name int8ArrayConstructorPart13Test076
       * @tc.desc Verify ArrayLike arr $_get(length) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart13Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src = new Int8SrcArrayLike([1.0, 2.0]);
        let arr = new Int8Array(src);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7700
     * @tc.name int8ArrayConstructorPart13Test077
     * @tc.desc Verify ArrayLike arr.$_set(0,99) arr.$_get(0)===99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7800
     * @tc.name int8ArrayConstructorPart13Test078
     * @tc.desc Verify ArrayBuffer arr.byteLength === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int8Array(buf);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_7900
     * @tc.name int8ArrayConstructorPart13Test079
     * @tc.desc Verify ArrayLike 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8SrcArrayLike([1.0, 2.0, 3.0]);
      let arr = new Int8Array(src);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART13_TEST_8000
     * @tc.name int8ArrayConstructorPart13Test080
     * @tc.desc Verify ArrayBuffer 4 buffer 0x04 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart13Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setUint8(3, 0x04);
      let arr = new Int8Array(buf);
      expect(arr.$_get(3)).assertEqual(4);
    });

  });
}
