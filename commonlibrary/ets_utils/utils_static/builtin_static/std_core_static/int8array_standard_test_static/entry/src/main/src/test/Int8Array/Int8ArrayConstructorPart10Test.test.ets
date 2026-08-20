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

export default function int8ArrayConstructorPart10Test(): void {
  describe('Int8ArrayConstructorPart10Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0100
     * @tc.name int8ArrayConstructorPart10Test001
     * @tc.desc Verify length expects 8 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0200
     * @tc.name int8ArrayConstructorPart10Test002
     * @tc.desc Verify length expects 5 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 3;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0300
     * @tc.name int8ArrayConstructorPart10Test003
     * @tc.desc Verify length expects 0 from ArrayBuffer, on new Int8Array(new ArrayBuffer(0), 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0400
     * @tc.name int8ArrayConstructorPart10Test004
     * @tc.desc Verify length expects 1 from ArrayBuffer, on new Int8Array(new ArrayBuffer(1), 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0500
     * @tc.name int8ArrayConstructorPart10Test005
     * @tc.desc Verify length expects 1000 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1000);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0600
     * @tc.name int8ArrayConstructorPart10Test006
     * @tc.desc Verify length expects 1 from ArrayBuffer, on new Int8Array(new ArrayBuffer(8), 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 7;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0700
     * @tc.name int8ArrayConstructorPart10Test007
     * @tc.desc Verify length expects 0 from ArrayBuffer, on new Int8Array(new ArrayBuffer(8), 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0800
     * @tc.name int8ArrayConstructorPart10Test008
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), 9) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 9;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_0900
     * @tc.name int8ArrayConstructorPart10Test009
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), 16) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 16;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1000
     * @tc.name int8ArrayConstructorPart10Test010
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), -1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -1;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1100
     * @tc.name int8ArrayConstructorPart10Test011
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), -8) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -8;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1200
     * @tc.name int8ArrayConstructorPart10Test012
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), -1.5) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -1.5;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1300
     * @tc.name int8ArrayConstructorPart10Test013
     * @tc.desc Verify byteOffset of new Int8Array(new ArrayBuffer(8), -0.0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = -0.0;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1400
     * @tc.name int8ArrayConstructorPart10Test014
     * @tc.desc Verify new Int8Array(buf, 0.5) truncates byteOffset to 0 and constructs view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0.5;
      let view = new Int8Array(buf, off);
      let r1: int = view.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = view.length;
      let e2: int = 8;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1500
     * @tc.name int8ArrayConstructorPart10Test015
     * @tc.desc Verify new Int8Array(buf, NaN) truncates byteOffset to 0 and constructs view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.NaN;
      let view = new Int8Array(buf, off);
      let r1: int = view.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = view.length;
      let e2: int = 8;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1600
     * @tc.name int8ArrayConstructorPart10Test016
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), Number.POSITIVE_INFINITY) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.POSITIVE_INFINITY;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1700
     * @tc.name int8ArrayConstructorPart10Test017
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), Number.NEGATIVE_INFINITY) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = Number.NEGATIVE_INFINITY;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1800
     * @tc.name int8ArrayConstructorPart10Test018
     * @tc.desc Verify new Int8Array(new ArrayBuffer(8), 1000000) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 1000000;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_1900
     * @tc.name int8ArrayConstructorPart10Test019
     * @tc.desc Verify length of new Int8Array(buf, off) returns buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let r1: int = view.length;
      let e1: int = buf.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2000
     * @tc.name int8ArrayConstructorPart10Test020
     * @tc.desc Verify byteLength of new Int8Array(buf, off) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 2;
      let view = new Int8Array(buf, off);
      let r1: int = view.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2100
     * @tc.name int8ArrayConstructorPart10Test021
     * @tc.desc Verify byteOffset of new Int8Array(buf, off) returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 5;
      let view = new Int8Array(buf, off);
      let r1: int = view.byteOffset;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2200
     * @tc.name int8ArrayConstructorPart10Test022
     * @tc.desc Verify buffer property returns buf on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let r1: ArrayBuffer = view.buffer;
      let e1: ArrayBuffer = buf;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2300
     * @tc.name int8ArrayConstructorPart10Test023
     * @tc.desc Verify BYTES_PER_ELEMENT equals 1 for Int8Array view on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let r1: int = view.BYTES_PER_ELEMENT;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2400
     * @tc.name int8ArrayConstructorPart10Test024
     * @tc.desc Verify length of new Int8Array(buf, off) returns buf.byteLength - off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 7;
      let view = new Int8Array(buf, off);
      expect(view.length).assertEqual(buf.byteLength - off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2500
     * @tc.name int8ArrayConstructorPart10Test025
     * @tc.desc Verify $_get expects 42 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 42);
      dv.setInt8(1, -128);
      dv.setInt8(2, INT8_MAX);
      dv.setInt8(3, 0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2600
     * @tc.name int8ArrayConstructorPart10Test026
     * @tc.desc Verify $_get expects INT8_MAX from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, INT8_MAX);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2700
     * @tc.name int8ArrayConstructorPart10Test027
     * @tc.desc Verify $_get expects -128 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, -128);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2800
     * @tc.name int8ArrayConstructorPart10Test028
     * @tc.desc Verify $_get expects 0 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, 0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_2900
     * @tc.name int8ArrayConstructorPart10Test029
     * @tc.desc Verify $_get expects -1 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let dv = new DataView(buf);
      dv.setInt8(0, 0xff);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3000
     * @tc.name int8ArrayConstructorPart10Test030
     * @tc.desc Verify byteOffset of new Int8Array(new ArrayBuffer(8), 0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3100
     * @tc.name int8ArrayConstructorPart10Test031
     * @tc.desc Verify byteOffset of new Int8Array(buf, off) returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3200
     * @tc.name int8ArrayConstructorPart10Test032
     * @tc.desc Verify $_get expects 30 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let off: number = 2;
      let view = new Int8Array(buf, off);
      expect(view.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3300
     * @tc.name int8ArrayConstructorPart10Test033
     * @tc.desc Verify $_get expects 66 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(2, 66);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.$_get(2)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3400
     * @tc.name int8ArrayConstructorPart10Test034
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(10, 99), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 22);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      try {
        view.$_set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3500
     * @tc.name int8ArrayConstructorPart10Test035
     * @tc.desc Verify fill expects 7 from ArrayBuffer, with fill(7, 1, 3), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(7, 1, 3);
      let dv = new DataView(buf);
      expect(dv.getInt8(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3600
     * @tc.name int8ArrayConstructorPart10Test036
     * @tc.desc Verify reverse expects 4 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.reverse();
      expect(dv.getInt8(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3700
     * @tc.name int8ArrayConstructorPart10Test037
     * @tc.desc Verify sort expects 10 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 40);
      dv.setInt8(1, 10);
      dv.setInt8(2, 30);
      dv.setInt8(3, 20);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3800
     * @tc.name int8ArrayConstructorPart10Test038
     * @tc.desc Verify copyWithin expects 3 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.copyWithin(0, 2, 4);
      expect(dv.getInt8(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_3900
     * @tc.name int8ArrayConstructorPart10Test039
     * @tc.desc Verify at expects 123 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(3, 123);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(-1)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4000
     * @tc.name int8ArrayConstructorPart10Test040
     * @tc.desc Verify new Int8Array.with(0, 99) returns new Int8Array and does not mutate original ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 5);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let newArr: Int8Array = view.with(0, 99);
      expect(dv.getInt8(0)).assertEqual(5);
      expect(newArr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4100
     * @tc.name int8ArrayConstructorPart10Test041
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(-10, 99), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 33);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      try {
        view.$_set(-10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4200
     * @tc.name int8ArrayConstructorPart10Test042
     * @tc.desc Verify byteLength of new Int8Array(buf, off) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4300
     * @tc.name int8ArrayConstructorPart10Test043
     * @tc.desc Verify forEach expects 0 from ArrayBuffer, on new Int8Array(new ArrayBuffer(0), 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let count: int = 0;
      view.forEach((v: number) => {
        if (v === 0.0) {
          count = count + 1;
        }
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4400
     * @tc.name int8ArrayConstructorPart10Test044
     * @tc.desc Verify at(0) returns undefined for zero-length Int8Array view on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4500
     * @tc.name int8ArrayConstructorPart10Test045
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(0, 1), on new Int8Array(new ArrayBuffer(0), 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      try {
        view.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4600
     * @tc.name int8ArrayConstructorPart10Test046
     * @tc.desc Verify new Int8Array(new ArrayBuffer(0), 1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let off: number = 1;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4700
     * @tc.name int8ArrayConstructorPart10Test047
     * @tc.desc Verify forEach expects 0 from ArrayBuffer, on new Int8Array(new ArrayBuffer(8), 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      let count: int = 0;
      view.forEach((v: number) => {
        if (v === 0.0) {
          count = count + 1;
        }
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4800
     * @tc.name int8ArrayConstructorPart10Test048
     * @tc.desc Verify new Int8Array(new ArrayBuffer(1000), 1001) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1000);
      let off: number = 1001;
      try {
        new Int8Array(buf, off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_4900
     * @tc.name int8ArrayConstructorPart10Test049
     * @tc.desc Verify forEach expects 11 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let dv = new DataView(buf);
      dv.setInt8(0, 11);
      dv.setInt8(1, 22);
      dv.setInt8(2, 33);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let first: number = 0;
      view.forEach((v: number) => {
        if (first === 0) {
          first = v;
        }
      });
      expect(first).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5000
     * @tc.name int8ArrayConstructorPart10Test050
     * @tc.desc Verify forEach expects 3 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let lastIdx: number = -1;
      let cnt: number = 0;
      view.forEach((v: number): void => {
        lastIdx = cnt;
        cnt = cnt + 1;
      });
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5100
     * @tc.name int8ArrayConstructorPart10Test051
     * @tc.desc Verify toString of new Int8Array(buf, off) returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5200
     * @tc.name int8ArrayConstructorPart10Test052
     * @tc.desc Verify new Int8Array fill(99, 3, 1) has no effect when start > end, preserving original value 50 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(1, 50);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(99, 3, 1);
      expect(dv.getInt8(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5300
     * @tc.name int8ArrayConstructorPart10Test053
     * @tc.desc Verify set(src, 2) throws RangeError when source overflows the view on new Int8Array(new ArrayBuffer(4), 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      let src = new Int8Array(3);
      src.$_set(0, 1);
      src.$_set(1, 2);
      src.$_set(2, 3);
      try {
        view.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5400
     * @tc.name int8ArrayConstructorPart10Test054
     * @tc.desc Verify at expects 77 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let dv = new DataView(buf);
      dv.setInt8(3, 77);
      let off: number = 3;
      let view = new Int8Array(buf, off);
      expect(view.at(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5500
     * @tc.name int8ArrayConstructorPart10Test055
     * @tc.desc Verify at expects 88 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let dv = new DataView(buf);
      dv.setInt8(7, 88);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(7)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5600
     * @tc.name int8ArrayConstructorPart10Test056
     * @tc.desc Verify fill expects 7 from ArrayBuffer, with fill(7), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.fill(7);
      let dv = new DataView(buf);
      expect(dv.getInt8(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5700
     * @tc.name int8ArrayConstructorPart10Test057
     * @tc.desc Verify copyWithin expects 1 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.copyWithin(1, 0, 3);
      expect(dv.getInt8(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5800
     * @tc.name int8ArrayConstructorPart10Test058
     * @tc.desc Verify at expects 5 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 5);
      dv.setInt8(1, 5);
      dv.setInt8(2, 5);
      dv.setInt8(3, 5);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      expect(view.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_5900
     * @tc.name int8ArrayConstructorPart10Test059
     * @tc.desc Verify sort expects 9 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let dv = new DataView(buf);
      dv.setInt8(0, 9);
      let off: number = 4;
      let view = new Int8Array(buf, off);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6000
     * @tc.name int8ArrayConstructorPart10Test060
     * @tc.desc Verify $_set expects 64 from ArrayBuffer on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.$_set(0, 1000000);
      let dv = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6100
     * @tc.name int8ArrayConstructorPart10Test061
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(0, 99), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let dv = new DataView(buf);
      dv.setInt8(0, 42);
      let off: number = 8;
      let view = new Int8Array(buf, off);
      try {
        view.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dv.getInt8(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6200
     * @tc.name int8ArrayConstructorPart10Test062
     * @tc.desc Verify $_set expects 0 from ArrayBuffer, with $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.$_set(0, Number.POSITIVE_INFINITY);
      let dv = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART10_TEST_6300
     * @tc.name int8ArrayConstructorPart10Test063
     * @tc.desc Verify $_set expects 0 from ArrayBuffer, with $_set(0, Number.NEGATIVE_INFINITY), on new Int8Array(buf, off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart10Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let off: number = 0;
      let view = new Int8Array(buf, off);
      view.$_set(0, Number.NEGATIVE_INFINITY);
      let dv = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(0);
    });
  });
}
