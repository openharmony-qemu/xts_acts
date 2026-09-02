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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayConstructorPart02Test(): void {
  describe('Int8ArrayConstructorPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0100
     * @tc.name int8ArrayConstructorPart02Test001
     * @tc.desc Verify length expects 5 on new Int8Array(len)
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns 0
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns len
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 7;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0400
     * @tc.name int8ArrayConstructorPart02Test004
     * @tc.desc Verify forEach expects 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 0;
      let arr: Int8Array = new Int8Array(len);
      let count: int = 0;
      arr.forEach((v: number) => {
        if (v === 0.0) {
          count = count + 1;
        }
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0500
     * @tc.name int8ArrayConstructorPart02Test005
     * @tc.desc Verify toString on new Int8Array(len)
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
     * @tc.desc Verify at returns undefined, with at(0), on new Int8Array(len)
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
     * @tc.desc Verify $_set expects RangeError throws exception on new Int8Array(len)
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
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_0800
     * @tc.name int8ArrayConstructorPart02Test008
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns 1
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
     * @tc.desc Verify $_get expects 0, on new Int8Array(1)
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
     * @tc.desc Verify at expects 0 on new Int8Array(len)
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
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array(1)
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
     * @tc.desc Verify byteOffset of new Int8Array(len) returns 0, on new Int8Array(len)
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns 5
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
     * @tc.desc Verify BYTES_PER_ELEMENT equals 1 on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int8Array(1).BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_1500
     * @tc.name int8ArrayConstructorPart02Test015
     * @tc.desc Verify length on new Int8Array(len)
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
     * @tc.desc Verify new Int8Array(len) constructor equals 0,0,0,0,0
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
     * @tc.desc Verify join('-') of zero-filled new Int8Array(5) returns "0-0-0-0-0"
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
     * @tc.desc Verify at returns undefined, with at(5), on new Int8Array(len)
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
     * @tc.desc Verify length expects 256 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      let r1: int = arr.length;
      let e1: int = 256;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2000
     * @tc.name int8ArrayConstructorPart02Test020
     * @tc.desc Verify byteLength of new Int8Array(len) returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      let r1: int = arr.byteLength;
      let e1: int = 256;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2100
     * @tc.name int8ArrayConstructorPart02Test021
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 256;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2200
     * @tc.name int8ArrayConstructorPart02Test022
     * @tc.desc Verify $_get expects 0, on new Int8Array(256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 256;
      let arr: Int8Array = new Int8Array(len);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(255);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2300
     * @tc.name int8ArrayConstructorPart02Test023
     * @tc.desc Verify new Int8Array(2147483647) throws OutOfMemoryError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 2147483647;
      try {
        let arr: Int8Array = new Int8Array(len);
        let r1: int = arr.length;
        let e1: int = 2147483647;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2400
     * @tc.name int8ArrayConstructorPart02Test024
     * @tc.desc Verify new Int8Array(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = -1;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2500
     * @tc.name int8ArrayConstructorPart02Test025
     * @tc.desc Verify new Int8Array(-2147483648) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = -2147483648;
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
     * @tc.desc Verify $_get expects 0, after $_set(0, 256), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 256);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2700
     * @tc.name int8ArrayConstructorPart02Test027
     * @tc.desc Verify $_get expects 0, after $_set(0, Number.NaN), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2800
     * @tc.name int8ArrayConstructorPart02Test028
     * @tc.desc Verify $_get expects 1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1.9);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_2900
     * @tc.name int8ArrayConstructorPart02Test029
     * @tc.desc Verify $_get expects -1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -1.9);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3000
     * @tc.name int8ArrayConstructorPart02Test030
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3100
     * @tc.name int8ArrayConstructorPart02Test031
     * @tc.desc Verify $_get expects -128 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -128);
      let r1: number = arr.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3200
     * @tc.name int8ArrayConstructorPart02Test032
     * @tc.desc Verify $_set expects INT8_MAX buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getInt8(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3300
     * @tc.name int8ArrayConstructorPart02Test033
     * @tc.desc Verify $_set expects 0x80 buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -128);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getUint8(0);
      let e1: number = 0x80;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3400
     * @tc.name int8ArrayConstructorPart02Test034
     * @tc.desc Verify $_set expects 0xff buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -1);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getUint8(0);
      let e1: number = 0xff;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3500
     * @tc.name int8ArrayConstructorPart02Test035
     * @tc.desc Verify $_set expects 0x00 buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 0);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getUint8(0);
      let e1: number = 0x00;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3600
     * @tc.name int8ArrayConstructorPart02Test036
     * @tc.desc Verify $_set expects 0x7f buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, INT8_MAX);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getUint8(0);
      let e1: number = 0x7f;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3700
     * @tc.name int8ArrayConstructorPart02Test037
     * @tc.desc Verify subarray(0, 2) shares buffer, $_set on subarray reflected in original expects 99 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(0, 2);
      view.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3800
     * @tc.name int8ArrayConstructorPart02Test038
     * @tc.desc Verify subarray(2, 4) shares buffer, $_set on subarray reflected in original expects 55 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(2, 4);
      view.$_set(0, 55);
      let r1: number = arr.$_get(2);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_3900
     * @tc.name int8ArrayConstructorPart02Test039
     * @tc.desc Verify $_set expects 100 buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 100);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getInt8(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4000
     * @tc.name int8ArrayConstructorPart02Test040
     * @tc.desc Verify subarray shares buffer, modification is bidirectional expects 42 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let sub1: Int8Array = arr.subarray(0, 2);
      let sub2: Int8Array = arr.subarray(0, 2);
      sub1.$_set(0, 42);
      let r1: number = sub2.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4100
     * @tc.name int8ArrayConstructorPart02Test041
     * @tc.desc Verify slice(0, 2) creates independent copy and $_set on copy does not affect original on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let copy: Int8Array = arr.slice(0, 2);
      copy.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4200
     * @tc.name int8ArrayConstructorPart02Test042
     * @tc.desc Verify $_get expects 0, after $_set(0, 77), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let a1: Int8Array = new Int8Array(len);
      let a2: Int8Array = new Int8Array(len);
      a1.$_set(0, 77);
      let r1: number = a2.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4300
     * @tc.name int8ArrayConstructorPart02Test043
     * @tc.desc Verify $_get expects 42 buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let dv: DataView = new DataView(arr.buffer);
      dv.setInt8(1, 42);
      let r1: number = arr.$_get(1);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4400
     * @tc.name int8ArrayConstructorPart02Test044
     * @tc.desc Verify subarray(0, 2) shares buffer, modification is bidirectional expects 33 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(0, 2);
      arr.$_set(0, 33);
      let r1: number = view.$_get(0);
      let e1: int = 33;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4500
     * @tc.name int8ArrayConstructorPart02Test045
     * @tc.desc Verify subarray(1, 3) byteOffset on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      let view: Int8Array = arr.subarray(1, 3);
      let r1: int = view.byteOffset;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4600
     * @tc.name int8ArrayConstructorPart02Test046
     * @tc.desc Verify buffer.byteLength equals byteLength for new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4700
     * @tc.name int8ArrayConstructorPart02Test047
     * @tc.desc Verify fill expects 7 buffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(7);
      let dv: DataView = new DataView(arr.buffer);
      let r1: number = dv.getInt8(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = dv.getInt8(3);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4800
     * @tc.name int8ArrayConstructorPart02Test048
     * @tc.desc Verify includes, with includes(0), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let r1: boolean = arr.includes(0);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_4900
     * @tc.name int8ArrayConstructorPart02Test049
     * @tc.desc Verify includes, with includes(1), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let r1: boolean = arr.includes(1);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5000
     * @tc.name int8ArrayConstructorPart02Test050
     * @tc.desc Verify every on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let r1: boolean = arr.every((v: number) => v === 0);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5100
     * @tc.name int8ArrayConstructorPart02Test051
     * @tc.desc Verify some on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let r1: boolean = arr.some((v: number) => v !== 0);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5200
     * @tc.name int8ArrayConstructorPart02Test052
     * @tc.desc Verify find returns undefined on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.find((v: number) => v !== 0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5300
     * @tc.name int8ArrayConstructorPart02Test053
     * @tc.desc Verify findIndex expects -1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let r1: int = arr.findIndex((v: number) => v !== 0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5400
     * @tc.name int8ArrayConstructorPart02Test054
     * @tc.desc Verify forEach expects 0, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let sum: number = 0;
      arr.forEach((v: number) => {
        sum = sum + v;
      });
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5500
     * @tc.name int8ArrayConstructorPart02Test055
     * @tc.desc Verify fill expects 7 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(7);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5600
     * @tc.name int8ArrayConstructorPart02Test056
     * @tc.desc Verify reverse expects 77 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      let ret: Int8Array = arr.reverse();
      ret.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5700
     * @tc.name int8ArrayConstructorPart02Test057
     * @tc.desc Verify sort expects 77 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      let ret: Int8Array = arr.sort();
      ret.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5800
     * @tc.name int8ArrayConstructorPart02Test058
     * @tc.desc Verify copyWithin expects 9 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 5;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(1, 9);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_5900
     * @tc.name int8ArrayConstructorPart02Test059
     * @tc.desc Verify $_get expects 0, after $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART02_TEST_6000
     * @tc.name int8ArrayConstructorPart02Test060
     * @tc.desc Verify $_get expects 0, after $_set(0, Number.NEGATIVE_INFINITY), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
