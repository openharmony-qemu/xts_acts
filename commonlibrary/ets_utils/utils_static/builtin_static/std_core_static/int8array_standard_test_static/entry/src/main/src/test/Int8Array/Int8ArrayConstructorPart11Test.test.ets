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

export default function int8ArrayConstructorPart11TestTest(): void {
  describe('Int8ArrayConstructorPart11TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0100
     * @tc.name int8ArrayConstructorPart11Test001
     * @tc.desc Verify 3 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0200
     * @tc.name int8ArrayConstructorPart11Test002
     * @tc.desc Verify 3 0 buffer + offset=0 + length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int8Array = new Int8Array(buf, 0, 0);
      expect(view.length).assertEqual(0);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0300
     * @tc.name int8ArrayConstructorPart11Test003
     * @tc.desc Verify 3 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 0, 8);
      expect(view.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0400
     * @tc.name int8ArrayConstructorPart11Test004
     * @tc.desc Verify 3 offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 4, 4);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0500
     * @tc.name int8ArrayConstructorPart11Test005
     * @tc.desc Verify 3 offset=byteLength + length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 4, 0);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0600
     * @tc.name int8ArrayConstructorPart11Test006
     * @tc.desc Verify 3 offset=0 + length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 0);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0700
     * @tc.name int8ArrayConstructorPart11Test007
     * @tc.desc Verify 1 ArrayBuffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0800
     * @tc.name int8ArrayConstructorPart11Test008
     * @tc.desc Verify 4 ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.length).assertEqual(4);
      expect(view.byteLength).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_0900
     * @tc.name int8ArrayConstructorPart11Test009
     * @tc.desc Verify 1024 ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1024);
      let view: Int8Array = new Int8Array(buf, 0, 1024);
      expect(view.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1000
     * @tc.name int8ArrayConstructorPart11Test010
     * @tc.desc Verify 7 ArrayBuffer int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      let view: Int8Array = new Int8Array(buf, 0, 7);
      expect(view.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1100
     * @tc.name int8ArrayConstructorPart11Test011
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let writer: Int8Array = new Int8Array(buf, 0, 3);
      writer.$_set(0, 42);
      writer.$_set(1, -7);
      writer.$_set(2, 100);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.$_get(0)).assertEqual(42);
      expect(view.$_get(1)).assertEqual(-7);
      expect(view.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1200
     * @tc.name int8ArrayConstructorPart11Test012
     * @tc.desc Verify ArrayBuffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 50);
      dv.setInt8(1, -30);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.$_get(0)).assertEqual(50);
      expect(view.$_get(1)).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1300
     * @tc.name int8ArrayConstructorPart11Test013
     * @tc.desc Verify byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1400
     * @tc.name int8ArrayConstructorPart11Test014
     * @tc.desc Verify byteOffset=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 1, 3);
      expect(view.byteOffset).assertEqual(1);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1500
     * @tc.name int8ArrayConstructorPart11Test015
     * @tc.desc Verify byteOffset= buffer.byteLength/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 4, 4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1600
     * @tc.name int8ArrayConstructorPart11Test016
     * @tc.desc Verify byteOffset=byteLength-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 3, 1);
      expect(view.byteOffset).assertEqual(3);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1700
     * @tc.name int8ArrayConstructorPart11Test017
     * @tc.desc Verify byteOffset=byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 4, 0);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1800
     * @tc.name int8ArrayConstructorPart11Test018
     * @tc.desc Verify byteOffset int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let offset: int = 2;
      let view: Int8Array = new Int8Array(buf, offset, 4);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_1900
     * @tc.name int8ArrayConstructorPart11Test019
     * @tc.desc Verify length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2000
     * @tc.name int8ArrayConstructorPart11Test020
     * @tc.desc Verify length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2100
     * @tc.name int8ArrayConstructorPart11Test021
     * @tc.desc Verify length=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2200
     * @tc.name int8ArrayConstructorPart11Test022
     * @tc.desc Verify length int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let len: int = 5;
      let view: Int8Array = new Int8Array(buf, 0, len);
      expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2300
     * @tc.name int8ArrayConstructorPart11Test023
     * @tc.desc Verify length= -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.length).assertEqual(3);
      expect(view.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2400
     * @tc.name int8ArrayConstructorPart11Test024
     * @tc.desc Verify byteOffset=byteLength+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 5, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2500
     * @tc.name int8ArrayConstructorPart11Test025
     * @tc.desc Verify byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, -1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2600
     * @tc.name int8ArrayConstructorPart11Test026
     * @tc.desc Verify byteOffset=2147483647 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 2147483647, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2700
     * @tc.name int8ArrayConstructorPart11Test027
     * @tc.desc Verify byteOffset=-2147483648 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, -2147483648, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2800
     * @tc.name int8ArrayConstructorPart11Test028
     * @tc.desc Verify byteOffset=0x7FFFFFFF int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0x7FFFFFFF, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_2900
     * @tc.name int8ArrayConstructorPart11Test029
     * @tc.desc Verify byteOffset= 1000000 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 1000000, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3000
     * @tc.name int8ArrayConstructorPart11Test030
     * @tc.desc Verify length= +1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3100
     * @tc.name int8ArrayConstructorPart11Test031
     * @tc.desc Verify length=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3200
     * @tc.name int8ArrayConstructorPart11Test032
     * @tc.desc Verify length=-2147483648 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3300
     * @tc.name int8ArrayConstructorPart11Test033
     * @tc.desc Verify length=2147483647 int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3400
     * @tc.name int8ArrayConstructorPart11Test034
     * @tc.desc Verify length=0x7FFFFFFF int RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, 0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3500
     * @tc.name int8ArrayConstructorPart11Test035
     * @tc.desc Verify length= 1000000 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 0, 1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3600
     * @tc.name int8ArrayConstructorPart11Test036
     * @tc.desc Verify offset=2 + length=3 offset+length buffer buf4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 2, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3700
     * @tc.name int8ArrayConstructorPart11Test037
     * @tc.desc Verify offset=byteLength + length=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3800
     * @tc.name int8ArrayConstructorPart11Test038
     * @tc.desc Verify offset=byteLength-1 + length=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_3900
     * @tc.name int8ArrayConstructorPart11Test039
     * @tc.desc Verify offset=1 + length=byteLength RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 1, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4000
     * @tc.name int8ArrayConstructorPart11Test040
     * @tc.desc Verify offset= + length= buf8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let view: Int8Array = new Int8Array(buf, 5, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4100
     * @tc.name int8ArrayConstructorPart11Test041
     * @tc.desc Verify offset=3 + length=3 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let view: Int8Array = new Int8Array(buf, 3, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4200
     * @tc.name int8ArrayConstructorPart11Test042
     * @tc.desc Verify 3 int byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4300
     * @tc.name int8ArrayConstructorPart11Test043
     * @tc.desc Verify 3 byteOffset= 0 buffer buf[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 11);
      dv.setInt8(2, 22);
      dv.setInt8(4, 33);
      dv.setInt8(6, 44);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      expect(view.$_get(0)).assertEqual(22);
      expect(view.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4400
     * @tc.name int8ArrayConstructorPart11Test044
     * @tc.desc Verify 3 byteOffset= 0 length= 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 11);
      dv.setInt8(7, 77);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4500
     * @tc.name int8ArrayConstructorPart11Test045
     * @tc.desc Verify 3 byteOffset+byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      expect(view.byteOffset + view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4600
     * @tc.name int8ArrayConstructorPart11Test046
     * @tc.desc Verify instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4700
     * @tc.name int8ArrayConstructorPart11Test047
     * @tc.desc Verify byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 3, 5);
      expect(view.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4800
     * @tc.name int8ArrayConstructorPart11Test048
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_4900
     * @tc.name int8ArrayConstructorPart11Test049
     * @tc.desc Verify 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(1)).assertEqual(0);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5000
     * @tc.name int8ArrayConstructorPart11Test050
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 15);
      dv.setInt8(1, 25);
      dv.setInt8(2, 35);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.$_get(0)).assertEqual(15);
      expect(view.$_get(1)).assertEqual(25);
      expect(view.$_get(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5100
     * @tc.name int8ArrayConstructorPart11Test051
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5200
     * @tc.name int8ArrayConstructorPart11Test052
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5300
     * @tc.name int8ArrayConstructorPart11Test053
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5400
     * @tc.name int8ArrayConstructorPart11Test054
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5500
     * @tc.name int8ArrayConstructorPart11Test055
     * @tc.desc Verify for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 5);
      dv.setInt8(1, 10);
      dv.setInt8(2, 15);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      let total: number = 0;
      for (let i = 0; i < view.length; i++) {
        total = total + view.$_get(i);
      }
      expect(total).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5600
     * @tc.name int8ArrayConstructorPart11Test056
     * @tc.desc Verify BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      expect((new Int8Array(1)).BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5700
     * @tc.name int8ArrayConstructorPart11Test057
     * @tc.desc Verify $_set DataView buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      view.$_set(0, 100);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5800
     * @tc.name int8ArrayConstructorPart11Test058
     * @tc.desc Verify buffer DataView.setInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 50);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_5900
     * @tc.name int8ArrayConstructorPart11Test059
     * @tc.desc Verify buffer viewA viewB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0, 4);
      let viewB: Int8Array = new Int8Array(buf, 0, 4);
      viewA.$_set(1, 77);
      expect(viewB.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6000
     * @tc.name int8ArrayConstructorPart11Test060
     * @tc.desc Verify offset buffer viewA viewB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let viewA: Int8Array = new Int8Array(buf, 0, 8);
      let viewB: Int8Array = new Int8Array(buf, 4, 4);
      viewA.$_set(5, 88);
      expect(viewB.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6100
     * @tc.name int8ArrayConstructorPart11Test061
     * @tc.desc Verify $_set DataView.getUint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      view.$_set(1, 33);
      let dv: DataView = new DataView(buf);
      expect(dv.getUint8(1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6200
     * @tc.name int8ArrayConstructorPart11Test062
     * @tc.desc Verify length offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let viewBig: Int8Array = new Int8Array(buf, 0, 8);
      let viewSmall: Int8Array = new Int8Array(buf, 4, 4);
      viewBig.$_set(6, 55);
      expect(viewSmall.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6300
     * @tc.name int8ArrayConstructorPart11Test063
     * @tc.desc Verify subarray subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      let sub: Int8Array = view.subarray(1, 3);
      sub.$_set(0, 44);
      expect(view.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6400
     * @tc.name int8ArrayConstructorPart11Test064
     * @tc.desc Verify 200 buffer 200 getUint8 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      view.$_set(0, 200);
      let dv: DataView = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(200);
      expect(view.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6500
     * @tc.name int8ArrayConstructorPart11Test065
     * @tc.desc Verify $_set buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(0, 99);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6600
     * @tc.name int8ArrayConstructorPart11Test066
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, 0, 4);
      let viewB: Int8Array = new Int8Array(buf, 0, 4);
      viewA.$_set(0, 10);
      viewB.$_set(1, 20);
      expect(viewA.$_get(0)).assertEqual(10);
      expect(viewA.$_get(1)).assertEqual(20);
      expect(viewB.$_get(0)).assertEqual(10);
      expect(viewB.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6700
     * @tc.name int8ArrayConstructorPart11Test067
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.fill(9);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(9);
      expect(dv.getInt8(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6800
     * @tc.name int8ArrayConstructorPart11Test068
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      let view: Int8Array = new Int8Array(buf, 0, 3);
      view.reverse();
      expect(dv.getInt8(0)).assertEqual(3);
      expect(dv.getInt8(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_6900
     * @tc.name int8ArrayConstructorPart11Test069
     * @tc.desc Verify offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let viewA: Int8Array = new Int8Array(buf, 0, 2);
      let viewB: Int8Array = new Int8Array(buf, 0, 2);
      viewA.$_set(0, 5);
      expect(viewB.$_get(0)).assertEqual(5);
      viewB.$_set(1, 8);
      expect(viewA.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7000
     * @tc.name int8ArrayConstructorPart11Test070
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      dv.setInt8(2, 30);
      dv.setInt8(3, 40);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.copyWithin(0, 2, 4);
      expect(dv.getInt8(0)).assertEqual(30);
      expect(dv.getInt8(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7100
     * @tc.name int8ArrayConstructorPart11Test071
     * @tc.desc Verify buffer 200 (0xC8) -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      dv.setUint8(0, 200);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7200
     * @tc.name int8ArrayConstructorPart11Test072
     * @tc.desc Verify buffer 0xFF (255) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      dv.setUint8(0, 0xFF);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7300
     * @tc.name int8ArrayConstructorPart11Test073
     * @tc.desc Verify buffer 128 (0x80) -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      dv.setUint8(0, 128);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7400
     * @tc.name int8ArrayConstructorPart11Test074
     * @tc.desc Verify buffer 0x81 (129) -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      dv.setUint8(0, 0x81);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7500
     * @tc.name int8ArrayConstructorPart11Test075
     * @tc.desc Verify buffer 0x7F (127) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart11Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      dv.setUint8(0, 0x7F);
      let view: Int8Array = new Int8Array(buf, 0, 1);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART11_TEST_7600
       * @tc.name int8ArrayConstructorPart11Test076
       * @tc.desc Verify $_set no-op buffer, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart11Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(2);
        let view: Int8Array = new Int8Array(buf, 0, 2);
        let threwSet: boolean = false;
        try {
          view.$_set(10, 99);
        } catch (e) {
          threwSet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwSet).assertTrue();
        let dv: DataView = new DataView(buf);
        expect(dv.getInt8(0)).assertEqual(0);
        expect(dv.getInt8(1)).assertEqual(0);
      });

});
}
