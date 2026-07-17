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

export default function int8ArrayConstructorPart09TestTest(): void {
  describe('Int8ArrayConstructorPart09TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0100
     * @tc.name int8ArrayConstructorPart09Test001
     * @tc.desc Verify arity 2 buf4 + byteOffset=0 length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0200
     * @tc.name int8ArrayConstructorPart09Test002
     * @tc.desc Verify arity 2 buf4 + byteOffset=2 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0300
     * @tc.name int8ArrayConstructorPart09Test003
     * @tc.desc Verify arity 2 buf4 + byteOffset=4 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0400
     * @tc.name int8ArrayConstructorPart09Test004
     * @tc.desc Verify ArrayBuffer byteLength=0 + byteOffset=0 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0500
     * @tc.name int8ArrayConstructorPart09Test005
     * @tc.desc Verify ArrayBuffer + byteOffset=0 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0600
     * @tc.name int8ArrayConstructorPart09Test006
     * @tc.desc Verify 8 ArrayBuffer + byteOffset=0 length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0700
     * @tc.name int8ArrayConstructorPart09Test007
     * @tc.desc Verify ArrayBuffer 256 + byteOffset=0 length=256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(256);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0800
     * @tc.name int8ArrayConstructorPart09Test008
     * @tc.desc Verify buffer + byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_0900
     * @tc.name int8ArrayConstructorPart09Test009
     * @tc.desc Verify buffer + byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let view: Int8Array = new Int8Array(buf, 2);
      expect(view.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1000
     * @tc.name int8ArrayConstructorPart09Test010
     * @tc.desc Verify buffer + byteOffset=byteLength-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let view: Int8Array = new Int8Array(buf, 3);
      expect(view.$_get(0)).assertEqual(40);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1100
     * @tc.name int8ArrayConstructorPart09Test011
     * @tc.desc Verify byteOffset=0 byteOffset ===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1200
     * @tc.name int8ArrayConstructorPart09Test012
     * @tc.desc Verify byteOffset=1 byteOffset ===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 1);
      expect(view.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1300
     * @tc.name int8ArrayConstructorPart09Test013
     * @tc.desc Verify byteOffset=byteLength-1 buf8 offset=7 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 7);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1400
     * @tc.name int8ArrayConstructorPart09Test014
     * @tc.desc Verify byteOffset=byteLength buf8 offset=8 byteOffset ===8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 8);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1500
     * @tc.name int8ArrayConstructorPart09Test015
     * @tc.desc Verify instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1600
     * @tc.name int8ArrayConstructorPart09Test016
     * @tc.desc Verify length === byteLength - byteOffset buf8 offset=3 length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 3);
      expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1700
     * @tc.name int8ArrayConstructorPart09Test017
     * @tc.desc Verify length === 0 buf8 offset=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 8);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1800
     * @tc.name int8ArrayConstructorPart09Test018
     * @tc.desc Verify length === 1 buf4 offset=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 3);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_1900
     * @tc.name int8ArrayConstructorPart09Test019
     * @tc.desc Verify byteLength === byteLength - byteOffset buf8 offset=3 byteLength=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 3);
      expect(view.byteLength).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2000
     * @tc.name int8ArrayConstructorPart09Test020
     * @tc.desc Verify buffer === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2100
     * @tc.name int8ArrayConstructorPart09Test021
     * @tc.desc Verify byteLength === length int8 1 / buf8 offset=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 3);
      expect(view.byteLength).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2200
     * @tc.name int8ArrayConstructorPart09Test022
     * @tc.desc Verify === buffer DataView offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(dv.getInt8(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2300
     * @tc.name int8ArrayConstructorPart09Test023
     * @tc.desc Verify === buffer DataView offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(3, 99);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(3)).assertEqual(dv.getInt8(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2400
     * @tc.name int8ArrayConstructorPart09Test024
     * @tc.desc Verify buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 77);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2500
     * @tc.name int8ArrayConstructorPart09Test025
     * @tc.desc Verify buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(3, 88);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2600
     * @tc.name int8ArrayConstructorPart09Test026
     * @tc.desc Verify buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 66);
      expect(view.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2700
     * @tc.name int8ArrayConstructorPart09Test027
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 55);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2800
     * @tc.name int8ArrayConstructorPart09Test028
     * @tc.desc Verify byteOffset=byteLength+1 buf4 offset=5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_2900
     * @tc.name int8ArrayConstructorPart09Test029
     * @tc.desc Verify byteOffset=byteLength*2 buf4 offset=8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3000
     * @tc.name int8ArrayConstructorPart09Test030
     * @tc.desc Verify byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3100
     * @tc.name int8ArrayConstructorPart09Test031
     * @tc.desc Verify byteOffset=-2147483648 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3200
     * @tc.name int8ArrayConstructorPart09Test032
     * @tc.desc Verify byteOffset=0x7FFFFFFF int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3300
     * @tc.name int8ArrayConstructorPart09Test033
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      try {
        new Int8Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dv.getInt8(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3400
     * @tc.name int8ArrayConstructorPart09Test034
     * @tc.desc Verify buffer + byteOffset=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        new Int8Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3500
     * @tc.name int8ArrayConstructorPart09Test035
     * @tc.desc Verify buffer + byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      try {
        new Int8Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3600
     * @tc.name int8ArrayConstructorPart09Test036
     * @tc.desc Verify buffer + byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(256);
      try {
        new Int8Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3700
     * @tc.name int8ArrayConstructorPart09Test037
     * @tc.desc Verify buffer view.$_set dv.getInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, 100);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3800
     * @tc.name int8ArrayConstructorPart09Test038
     * @tc.desc Verify buffer dv.setInt8 view.$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 50);
      expect(view.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_3900
     * @tc.name int8ArrayConstructorPart09Test039
     * @tc.desc Verify buffer viewA, viewB offset A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 0);
      viewA.$_set(2, 66);
      expect(viewB.$_get(2)).assertEqual(66);
      expect(viewA.buffer).assertEqual(viewB.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4000
     * @tc.name int8ArrayConstructorPart09Test040
     * @tc.desc Verify offset A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 2);
      viewA.$_set(0, 11);
      expect(viewB.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4100
     * @tc.name int8ArrayConstructorPart09Test041
     * @tc.desc Verify B A 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 2);
      viewB.$_set(1, 22);
      expect(viewA.$_get(0)).assertEqual(0);
      expect(viewA.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4200
     * @tc.name int8ArrayConstructorPart09Test042
     * @tc.desc Verify length buf8 viewA offset=0 length=8 viewB offset=3 length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 3);
      expect(viewA.length).assertEqual(8);
      expect(viewB.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4300
     * @tc.name int8ArrayConstructorPart09Test043
     * @tc.desc Verify DataView buffer offset=1 buf[1] view[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 1);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 99);
      expect(view.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4400
     * @tc.name int8ArrayConstructorPart09Test044
     * @tc.desc Verify DataView buffer offset=1 view dv buf[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 1);
      view.$_set(2, 88);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(3)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4500
     * @tc.name int8ArrayConstructorPart09Test045
     * @tc.desc Verify buffer[byteOffset] offset=2 view[0] buf[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      view.$_set(0, 7);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4600
     * @tc.name int8ArrayConstructorPart09Test046
     * @tc.desc Verify buffer[byteLength-1] offset=2 view[1] buf[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 2);
      view.$_set(1, 9);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4700
     * @tc.name int8ArrayConstructorPart09Test047
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      view.fill(5);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(5);
      expect(dv.getInt8(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4800
     * @tc.name int8ArrayConstructorPart09Test048
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let view: Int8Array = new Int8Array(buf, 0);
      view.reverse();
      expect(dv.getInt8(0)).assertEqual(4);
      expect(dv.getInt8(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_4900
     * @tc.name int8ArrayConstructorPart09Test049
     * @tc.desc Verify 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, 128);
      expect(view.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5000
     * @tc.name int8ArrayConstructorPart09Test050
     * @tc.desc Verify Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, Number.NaN);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5100
     * @tc.name int8ArrayConstructorPart09Test051
     * @tc.desc Verify 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, 255);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5200
     * @tc.name int8ArrayConstructorPart09Test052
     * @tc.desc Verify -129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, -129);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5300
     * @tc.name int8ArrayConstructorPart09Test053
     * @tc.desc Verify 0x100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, 0x100);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5400
     * @tc.name int8ArrayConstructorPart09Test054
     * @tc.desc Verify -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, -0.0);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5500
     * @tc.name int8ArrayConstructorPart09Test055
     * @tc.desc Verify 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, 1.9);
      expect(view.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5600
     * @tc.name int8ArrayConstructorPart09Test056
     * @tc.desc Verify -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0);
      view.$_set(0, -1.9);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5700
     * @tc.name int8ArrayConstructorPart09Test057
     * @tc.desc Verify A offset=0 B offset=2 A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 2);
      viewA.$_set(2, 77);
      expect(viewB.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5800
     * @tc.name int8ArrayConstructorPart09Test058
     * @tc.desc Verify A offset=0 B offset=2 B A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 2);
      viewB.$_set(0, 88);
      expect(viewA.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_5900
     * @tc.name int8ArrayConstructorPart09Test059
     * @tc.desc Verify A offset=0 B offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 0);
      viewA.$_set(1, 55);
      expect(viewB.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6000
     * @tc.name int8ArrayConstructorPart09Test060
     * @tc.desc Verify A offset=0 B offset=byteLength B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 4);
      expect(viewB.length).assertEqual(0);
      viewA.$_set(0, 33);
      expect(viewA.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6100
     * @tc.name int8ArrayConstructorPart09Test061
     * @tc.desc Verify A offset=0 B offset=byteLength-1 B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0);
      let viewB: Int8Array = new Int8Array(buf, 3);
      expect(viewB.length).assertEqual(1);
      viewA.$_set(3, 44);
      expect(viewB.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6200
     * @tc.name int8ArrayConstructorPart09Test062
     * @tc.desc Verify buf=1 + byteOffset=0 byteLength=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6300
     * @tc.name int8ArrayConstructorPart09Test063
     * @tc.desc Verify buf=1 + byteOffset=1 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, 1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6400
     * @tc.name int8ArrayConstructorPart09Test064
     * @tc.desc Verify buf=1 + byteOffset=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      try {
        new Int8Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6500
     * @tc.name int8ArrayConstructorPart09Test065
     * @tc.desc Verify buf=2 + byteOffset=1 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 1);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6600
     * @tc.name int8ArrayConstructorPart09Test066
     * @tc.desc Verify buf=2 + byteOffset=2 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6700
     * @tc.name int8ArrayConstructorPart09Test067
     * @tc.desc Verify buf=2 + byteOffset=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      try {
        new Int8Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6800
     * @tc.name int8ArrayConstructorPart09Test068
     * @tc.desc Verify buf=3 + byteOffset=1 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let view: Int8Array = new Int8Array(buf, 1);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_6900
     * @tc.name int8ArrayConstructorPart09Test069
     * @tc.desc Verify buffer 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7000
     * @tc.name int8ArrayConstructorPart09Test070
     * @tc.desc Verify buffer 0xFF -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf, 0);
      u8.fill(0xFF);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(-1);
      expect(view.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7100
     * @tc.name int8ArrayConstructorPart09Test071
     * @tc.desc Verify buffer 0x7F 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf, 0);
      u8.fill(0x7F);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
      expect(view.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7200
     * @tc.name int8ArrayConstructorPart09Test072
     * @tc.desc Verify buffer 0x80 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf, 0);
      u8.fill(0x80);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(-128);
      expect(view.$_get(3)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7300
     * @tc.name int8ArrayConstructorPart09Test073
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf, 0);
      u8.$_set(0, 0x00);
      u8.$_set(1, 0x7F);
      u8.$_set(2, 0x80);
      u8.$_set(3, 0xFF);
      let view: Int8Array = new Int8Array(buf, 0);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(1)).assertEqual(INT8_MAX);
      expect(view.$_get(2)).assertEqual(-128);
      expect(view.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7400
     * @tc.name int8ArrayConstructorPart09Test074
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let view: Int8Array = new Int8Array(buf, 0);
      view.copyWithin(0, 2, 4);
      expect(dv.getInt8(0)).assertEqual(3);
      expect(dv.getInt8(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7500
     * @tc.name int8ArrayConstructorPart09Test075
     * @tc.desc Verify set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let src: Int8Array = Int8Array.of(7, 8);
      let view: Int8Array = new Int8Array(buf, 0);
      view.set(src, 1);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(7);
      expect(dv.getInt8(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7600
     * @tc.name int8ArrayConstructorPart09Test076
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0);
      let sub: Int8Array = view.subarray(1, 3);
      sub.$_set(0, 99);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7700
     * @tc.name int8ArrayConstructorPart09Test077
     * @tc.desc Verify sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 4);
      dv.setInt8(1, 3);
      dv.setInt8(2, 2);
      dv.setInt8(3, 1);
      let view: Int8Array = new Int8Array(buf, 0);
      view.sort();
      expect(dv.getInt8(0)).assertEqual(1);
      expect(dv.getInt8(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7800
     * @tc.name int8ArrayConstructorPart09Test078
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let view: Int8Array = new Int8Array(buf, 0);
      let sliced: Int8Array = view.slice(0, 2);
      sliced.$_set(0, 99);
      expect(dv.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_7900
     * @tc.name int8ArrayConstructorPart09Test079
     * @tc.desc Verify with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      let view: Int8Array = new Int8Array(buf, 0);
      let withed: Int8Array = view.with(0, 99);
      expect(dv.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_8000
     * @tc.name int8ArrayConstructorPart09Test080
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let view: Int8Array = new Int8Array(buf, 0);
      let rev: Int8Array = view.toReversed();
      expect(dv.getInt8(0)).assertEqual(1);
      expect(dv.getInt8(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART09_TEST_8100
     * @tc.name int8ArrayConstructorPart09Test081
     * @tc.desc Verify toSorted buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart09Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 4);
      dv.setInt8(1, 3);
      dv.setInt8(2, 2);
      dv.setInt8(3, 1);
      let view: Int8Array = new Int8Array(buf, 0);
      let sorted: Int8Array = view.toSorted();
      expect(dv.getInt8(0)).assertEqual(4);
    });

  });
}
