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
import Utils from '../Util.test';

export default function int8ArrayConstructorPart02TestTest(): void {
  describe('Int8ArrayConstructorPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0100
     * @tc.name int8ArrayConstructorPart02Test001
     * @tc.desc Verify int arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0200
     * @tc.name int8ArrayConstructorPart02Test002
     * @tc.desc Verify length=0 buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0300
     * @tc.name int8ArrayConstructorPart02Test003
     * @tc.desc Verify length=0 buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0400
     * @tc.name int8ArrayConstructorPart02Test004
     * @tc.desc Verify length=0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      let count: int = 0;
      arr.forEach((v: number) => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0500
     * @tc.name int8ArrayConstructorPart02Test005
     * @tc.desc Verify length=0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0600
     * @tc.name int8ArrayConstructorPart02Test006
     * @tc.desc Verify length=0 at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(0)).assertUndefined();
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0700
       * @tc.name int8ArrayConstructorPart02Test007
       * @tc.desc Verify length=0 $_set(0,10) no-op
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const len: int = 0;
        let arr: Int8Array = new Int8Array(len);
        try {
          arr.$_set(0, 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0800
     * @tc.name int8ArrayConstructorPart02Test008
     * @tc.desc Verify length=1 buffer.byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 1;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0900
     * @tc.name int8ArrayConstructorPart02Test009
     * @tc.desc Verify length=1 $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 1;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1000
     * @tc.name int8ArrayConstructorPart02Test010
     * @tc.desc Verify length=1 at(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 1;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1100
     * @tc.name int8ArrayConstructorPart02Test011
     * @tc.desc Verify length=1 $_set(0,127) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1200
     * @tc.name int8ArrayConstructorPart02Test012
     * @tc.desc Verify length=5 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1300
     * @tc.name int8ArrayConstructorPart02Test013
     * @tc.desc Verify length=5 buffer.byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1400
     * @tc.name int8ArrayConstructorPart02Test014
     * @tc.desc Verify (new Int8Array(1)).BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new Int8Array(1)).BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1500
     * @tc.name int8ArrayConstructorPart02Test015
     * @tc.desc Verify length=5 instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1600
     * @tc.name int8ArrayConstructorPart02Test016
     * @tc.desc Verify length=5 toString '0,0,0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.toString()).assertEqual('0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1700
     * @tc.name int8ArrayConstructorPart02Test017
     * @tc.desc Verify length=5 join('-') '0-0-0-0-0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.join('-')).assertEqual('0-0-0-0-0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1800
     * @tc.name int8ArrayConstructorPart02Test018
     * @tc.desc Verify length=5 at(5) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1900
     * @tc.name int8ArrayConstructorPart02Test019
     * @tc.desc Verify length=5 len
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2000
     * @tc.name int8ArrayConstructorPart02Test020
     * @tc.desc Verify length=256 length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2100
     * @tc.name int8ArrayConstructorPart02Test021
     * @tc.desc Verify length=256 byteLength 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2200
     * @tc.name int8ArrayConstructorPart02Test022
     * @tc.desc Verify length=256 buffer.byteLength 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2300
     * @tc.name int8ArrayConstructorPart02Test023
     * @tc.desc Verify length=256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(255)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2400
     * @tc.name int8ArrayConstructorPart02Test024
     * @tc.desc Verify length=int 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 2147483647;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect(arr.length).assertEqual(2147483647);
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2500
     * @tc.name int8ArrayConstructorPart02Test025
     * @tc.desc Verify length=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = -1;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2600
     * @tc.name int8ArrayConstructorPart02Test026
     * @tc.desc Verify length=-2147483648 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = -2147483648;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2700
     * @tc.name int8ArrayConstructorPart02Test027
     * @tc.desc Verify $_set(0, 256) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2800
     * @tc.name int8ArrayConstructorPart02Test028
     * @tc.desc Verify $_set(0, Number.NaN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2900
     * @tc.name int8ArrayConstructorPart02Test029
     * @tc.desc Verify $_set(0, 1.9) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1.9);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3000
     * @tc.name int8ArrayConstructorPart02Test030
     * @tc.desc Verify $_set(0, -1.9) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -1.9);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3100
     * @tc.name int8ArrayConstructorPart02Test031
     * @tc.desc Verify $_set(0, 127) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3200
     * @tc.name int8ArrayConstructorPart02Test032
     * @tc.desc Verify $_set(0, -128) -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3300
     * @tc.name int8ArrayConstructorPart02Test033
     * @tc.desc Verify $_set(0,127) DataView.getInt8(0) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getInt8(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3400
     * @tc.name int8ArrayConstructorPart02Test034
     * @tc.desc Verify $_set(0,-128) DataView.getUint8(0) 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -128);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getUint8(0)).assertEqual(0x80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3500
     * @tc.name int8ArrayConstructorPart02Test035
     * @tc.desc Verify $_set(0,-1) DataView.getUint8(0) 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -1);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getUint8(0)).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3600
     * @tc.name int8ArrayConstructorPart02Test036
     * @tc.desc Verify $_set(0,0) DataView.getUint8(0) 0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 0);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getUint8(0)).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3700
     * @tc.name int8ArrayConstructorPart02Test037
     * @tc.desc Verify $_set(0,127) DataView.getUint8(0) 0x7F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getUint8(0)).assertEqual(0x7F);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3800
     * @tc.name int8ArrayConstructorPart02Test038
     * @tc.desc Verify subarray(0,2) buffer $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(0, 2);
      view.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3900
     * @tc.name int8ArrayConstructorPart02Test039
     * @tc.desc Verify subarray(2,4) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(2, 4);
      view.$_set(0, 55);
      expect(arr.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4000
     * @tc.name int8ArrayConstructorPart02Test040
     * @tc.desc Verify $_set(0,100) DataView 100 arr buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 100);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4100
     * @tc.name int8ArrayConstructorPart02Test041
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let sub1: Int8Array = arr.subarray(0, 2);
      let sub2: Int8Array = arr.subarray(0, 2);
      sub1.$_set(0, 42);
      expect(sub2.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4200
     * @tc.name int8ArrayConstructorPart02Test042
     * @tc.desc Verify slice(0,2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let copy: Int8Array = arr.slice(0, 2);
      copy.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4300
     * @tc.name int8ArrayConstructorPart02Test043
     * @tc.desc Verify new Int8Array(4) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let a1: Int8Array = new Int8Array(len);
      let a2: Int8Array = new Int8Array(len);
      a1.$_set(0, 77);
      expect(a2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4400
     * @tc.name int8ArrayConstructorPart02Test044
     * @tc.desc Verify arr.byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4500
     * @tc.name int8ArrayConstructorPart02Test045
     * @tc.desc Verify buffer DataView arr buffer arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let dv: DataView = new DataView(arr.buffer);
      dv.setInt8(1, 42);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4600
     * @tc.name int8ArrayConstructorPart02Test046
     * @tc.desc Verify $_set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(0, 2);
      arr.$_set(0, 33);
      expect(view.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4700
     * @tc.name int8ArrayConstructorPart02Test047
     * @tc.desc Verify subarray(1,3) byteOffset 1 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(1, 3);
      expect(view.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4800
     * @tc.name int8ArrayConstructorPart02Test048
     * @tc.desc Verify arr.buffer.byteLength arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4900
     * @tc.name int8ArrayConstructorPart02Test049
     * @tc.desc Verify fill buffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(7);
      let dv: DataView = new DataView(arr.buffer);
      expect(dv.getInt8(0)).assertEqual(7);
      expect(dv.getInt8(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5000
     * @tc.name int8ArrayConstructorPart02Test050
     * @tc.desc Verify length=5 includes(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5100
     * @tc.name int8ArrayConstructorPart02Test051
     * @tc.desc Verify length=5 includes(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5200
     * @tc.name int8ArrayConstructorPart02Test052
     * @tc.desc Verify length=5 every 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.every((v: number) => v === 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5300
     * @tc.name int8ArrayConstructorPart02Test053
     * @tc.desc Verify length=5 some 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.some((v: number) => v !== 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5400
     * @tc.name int8ArrayConstructorPart02Test054
     * @tc.desc Verify length=5 find 0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.find((v: number) => v !== 0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5500
     * @tc.name int8ArrayConstructorPart02Test055
     * @tc.desc Verify length=5 findIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.findIndex((v: number) => v !== 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5600
     * @tc.name int8ArrayConstructorPart02Test056
     * @tc.desc Verify length=5 forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let sum: number = 0;
      arr.forEach((v: number) => { sum = sum + v; });
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5700
     * @tc.name int8ArrayConstructorPart02Test057
     * @tc.desc Verify length=5 fill(7) 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(7);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5800
     * @tc.name int8ArrayConstructorPart02Test058
     * @tc.desc Verify length=5 reverse this ret arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      let ret: Int8Array = arr.reverse();
      ret.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5900
     * @tc.name int8ArrayConstructorPart02Test059
     * @tc.desc Verify length=5 sort this ret arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let ret: Int8Array = arr.sort();
      ret.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_6000
     * @tc.name int8ArrayConstructorPart02Test060
     * @tc.desc Verify length=5 $_set(1,9) copyWithin(0,1,2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(1, 9);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(9);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_6100
       * @tc.name int8ArrayConstructorPart02Test061
       * @tc.desc Verify length=int 2147483647
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const len: int = 2147483647;
        try {
          let arr: Int8Array = new Int8Array(len);
          expect(arr.length).assertEqual(2147483647);
        } catch (e) {
          expect(e.name).assertEqual('OutOfMemoryError');
        }
      });
});
}
