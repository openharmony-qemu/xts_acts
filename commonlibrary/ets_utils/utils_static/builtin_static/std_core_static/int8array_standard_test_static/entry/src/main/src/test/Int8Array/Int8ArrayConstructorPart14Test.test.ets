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

export default function int8ArrayConstructorPart14TestTest(): void {
  describe('Int8ArrayConstructorPart14TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0100
     * @tc.name int8ArrayConstructorPart14Test001
     * @tc.desc Verify constructor(buf, undefined, undefined) with buf(3), offset defaults to 0 and length covers entire buffer, first element equals buf[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 41);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0200
     * @tc.name int8ArrayConstructorPart14Test002
     * @tc.desc Verify constructor(buf, Number(0), undefined) with buf(3), offset 0 and last element equals buf[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 23);
      let off: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0300
     * @tc.name int8ArrayConstructorPart14Test003
     * @tc.desc Verify constructor(buf, undefined, Number(1)) with buf(3), offset defaults to 0 and length=1, element equals buf[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 17);
      let len: Number = 1;
      let arr: Int8Array = new Int8Array(buf, undefined, len);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0400
     * @tc.name int8ArrayConstructorPart14Test004
     * @tc.desc Verify constructor(buf, Number(1), Number(1)) with buf(3), single-element view at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 8);
      let off: Number = 1;
      let len: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0500
     * @tc.name int8ArrayConstructorPart14Test005
     * @tc.desc Verify constructor(buf, Number(2), undefined) with buf(3), length covers remaining 1 element equals buf[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 19);
      let off: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0600
     * @tc.name int8ArrayConstructorPart14Test006
     * @tc.desc Verify constructor(buf, Number(2), Number(0)) with buf(3), middle-offset empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let off: Number = 2;
      let len: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0700
     * @tc.name int8ArrayConstructorPart14Test007
     * @tc.desc Verify 2-byte buffer with dual undefined, length=2 and first element defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0800
     * @tc.name int8ArrayConstructorPart14Test008
     * @tc.desc Verify 6-byte buffer with dual undefined, length and byteLength both equal 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(6);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0900
     * @tc.name int8ArrayConstructorPart14Test009
     * @tc.desc Verify 0-byte empty buffer with offset=Number(0) and length=Number(0) explicit, empty view at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let off: Number = 0;
      let len: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1000
     * @tc.name int8ArrayConstructorPart14Test010
     * @tc.desc Verify 5-byte buffer with dual undefined, buffer property reference equals source buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1100
     * @tc.name int8ArrayConstructorPart14Test011
     * @tc.desc Verify 7-byte buffer with dual undefined, offset defaults to 0 and length=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(7);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1200
     * @tc.name int8ArrayConstructorPart14Test012
     * @tc.desc Verify byteOffset=Number(1) with buf(5), view first element equals buf[1] via DataView preset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 31);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.$_get(0)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1300
     * @tc.name int8ArrayConstructorPart14Test013
     * @tc.desc Verify byteOffset=Number(3) with buf(5), length covers remaining 2 and last element equals buf[4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(4, 14);
      let off: Number = 3;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1400
     * @tc.name int8ArrayConstructorPart14Test014
     * @tc.desc Verify byteOffset=Number(byteLength-1)=4 with buf(5), single-element view equals last byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(4, 99);
      let off: Number = 4;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1500
     * @tc.name int8ArrayConstructorPart14Test015
     * @tc.desc Verify byteOffset=Number(byteLength)=5 + length=Number(0) with buf(5), trailing empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = 5;
      let len: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset).assertEqual(5);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1600
     * @tc.name int8ArrayConstructorPart14Test016
     * @tc.desc Verify byteOffset=Number(byteLength+1)=6 with buf(5), offset exceeding length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = 6;
      try {
        new Int8Array(buf, off, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1700
     * @tc.name int8ArrayConstructorPart14Test017
     * @tc.desc Verify byteOffset=Number(-1) with buf(5), negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = -1;
      try {
        new Int8Array(buf, off, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1800
     * @tc.name int8ArrayConstructorPart14Test018
     * @tc.desc Verify length=Number(1) with buf(5), single-element view equals buf[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 27);
      let len: Number = 1;
      let arr: Int8Array = new Int8Array(buf, undefined, len);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_1900
     * @tc.name int8ArrayConstructorPart14Test019
     * @tc.desc Verify length=Number(remaining)=3 + offset=Number(2) with buf(5), last element equals buf[4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(4, 6);
      let off: Number = 2;
      let len: Number = 3;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2000
     * @tc.name int8ArrayConstructorPart14Test020
     * @tc.desc Verify length=Number(byteLength)=5 + offset=Number(0) with buf(5), explicit full view with element equals buf[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(3, 48);
      let off: Number = 0;
      let len: Number = 5;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2100
     * @tc.name int8ArrayConstructorPart14Test021
     * @tc.desc Verify length=Number(0) + offset=Number(0) with buf(5), leading empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = 0;
      let len: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2200
     * @tc.name int8ArrayConstructorPart14Test022
     * @tc.desc Verify length=Number(remaining+1)=4 + offset=Number(2) with buf(5), exceeding remaining capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = 2;
      let len: Number = 4;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2300
     * @tc.name int8ArrayConstructorPart14Test023
     * @tc.desc Verify length=Number(-1) with buf(5), negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let len: Number = -1;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2400
     * @tc.name int8ArrayConstructorPart14Test024
     * @tc.desc Verify length=Number(int min)=-2147483648 with buf(5), extreme negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let len: Number = -2147483648;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2500
     * @tc.name int8ArrayConstructorPart14Test025
     * @tc.desc Verify length=Number(int max)=2147483647 with buf(5), huge length exceeding remaining throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let len: Number = 2147483647;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2600
     * @tc.name int8ArrayConstructorPart14Test026
     * @tc.desc Verify offset=Number(1) + length=Number(2) with buf(5), middle sub-view elements equal buf[1] and buf[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 51);
      dv.setInt8(2, 52);
      let off: Number = 1;
      let len: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.$_get(0)).assertEqual(51);
      expect(arr.$_get(1)).assertEqual(52);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2700
     * @tc.name int8ArrayConstructorPart14Test027
     * @tc.desc Verify offset=Number(2) + length=Number(2) with buf(5), byteOffset+byteLength=4 and element equals buf[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(3, 73);
      let off: Number = 2;
      let len: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset + arr.byteLength).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2800
     * @tc.name int8ArrayConstructorPart14Test028
     * @tc.desc Verify offset=Number(1) + length=Number(4) with buf(5), length=4 fills to end and last element equals buf[4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(4, 58);
      let off: Number = 1;
      let len: Number = 4;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(58);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_2900
     * @tc.name int8ArrayConstructorPart14Test029
     * @tc.desc Verify offset=Number(3) + length=Number(0) with buf(5), middle-offset empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let off: Number = 3;
      let len: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset).assertEqual(3);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3000
     * @tc.name int8ArrayConstructorPart14Test030
     * @tc.desc Verify offset=Number(0) + length=undefined with buf(5), full view and last element equals buf[4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let dv: DataView = new DataView(buf);
      dv.setInt8(4, 5);
      let off: Number = 0;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3100
     * @tc.name int8ArrayConstructorPart14Test031
     * @tc.desc Verify offset-view buffer property reference equals source buf (view does not copy underlying buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 2;
      let len: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3200
     * @tc.name int8ArrayConstructorPart14Test032
     * @tc.desc Verify explicit length view byteLength=length*1 (int8 has 1 byte per element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let len: Number = 4;
      let arr: Int8Array = new Int8Array(buf, undefined, len);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3300
     * @tc.name int8ArrayConstructorPart14Test033
     * @tc.desc Verify offset-view length equals byteLength (1:1 byte ratio)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 1;
      let len: Number = 3;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3400
     * @tc.name int8ArrayConstructorPart14Test034
     * @tc.desc Verify trailing empty view (offset=byteLength) has length=0 and byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 6;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3500
     * @tc.name int8ArrayConstructorPart14Test035
     * @tc.desc Verify view initial values reflect buf preset bytes (-128 and 127 boundary values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, -128);
      dv.setInt8(1, INT8_MAX);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3600
     * @tc.name int8ArrayConstructorPart14Test036
     * @tc.desc Verify new buffer view initial values are 0 (default all zero), middle index element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3700
     * @tc.name int8ArrayConstructorPart14Test037
     * @tc.desc Verify offset-view byteOffset equals explicit offset and length equals remaining capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 4;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3800
     * @tc.name int8ArrayConstructorPart14Test038
     * @tc.desc Verify byteOffset=undefined equivalent to 0, first element equals buf[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 61);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(61);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3900
     * @tc.name int8ArrayConstructorPart14Test039
     * @tc.desc Verify length=undefined reflects remaining after offset (offset=5 -> length=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 5;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4000
     * @tc.name int8ArrayConstructorPart14Test040
     * @tc.desc Verify explicit offset+length view byteOffset+byteLength exactly fills buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 2;
      let len: Number = 4;
      let arr: Int8Array = new Int8Array(buf, off, len);
      expect(arr.byteOffset + arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4100
     * @tc.name int8ArrayConstructorPart14Test041
     * @tc.desc Verify offset=Number(byteLength)=6 + length=Number(1) with buf(6), no remaining space at end throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 6;
      let len: Number = 1;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4200
     * @tc.name int8ArrayConstructorPart14Test042
     * @tc.desc Verify offset=Number(3) + length=Number(4) with buf(6), middle offset exceeding remaining throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 3;
      let len: Number = 4;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4300
     * @tc.name int8ArrayConstructorPart14Test043
     * @tc.desc Verify offset=Number(byteLength+1)=7 + length=Number(0) with buf(6), offset exceeding length takes priority and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 7;
      let len: Number = 0;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4400
     * @tc.name int8ArrayConstructorPart14Test044
     * @tc.desc Verify offset=Number(-1) + length=Number(-1) with buf(6), dual negative values throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = -1;
      let len: Number = -1;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4500
     * @tc.name int8ArrayConstructorPart14Test045
     * @tc.desc Verify offset=Number(int max)=2147483647 with buf(6), huge offset exceeding length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 2147483647;
      try {
        new Int8Array(buf, off, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4600
     * @tc.name int8ArrayConstructorPart14Test046
     * @tc.desc Verify length=Number(Number.NEGATIVE_INFINITY) with buf(6), negative infinity length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let len: Number = Number.NEGATIVE_INFINITY;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4700
     * @tc.name int8ArrayConstructorPart14Test047
     * @tc.desc Verify empty buffer + offset=Number(0) + length=Number(1) with buf(0), exceeding remaining throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let off: Number = 0;
      let len: Number = 1;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4800
     * @tc.name int8ArrayConstructorPart14Test048
     * @tc.desc Verify offset=Number(byteLength-1)=5 + length=Number(2) with buf(6), only 1 byte remains at end but requesting 2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 5;
      let len: Number = 2;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_4900
     * @tc.name int8ArrayConstructorPart14Test049
     * @tc.desc Verify offset=Number(0) + length=Number(byteLength+1)=7 with buf(6), from beginning exceeding remaining throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 0;
      let len: Number = 7;
      try {
        new Int8Array(buf, off, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5000
     * @tc.name int8ArrayConstructorPart14Test050
     * @tc.desc Verify writing 129 truncates and wraps to -127 (0x81 boundary, just beyond 128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 129);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5100
     * @tc.name int8ArrayConstructorPart14Test051
     * @tc.desc Verify writing 257 wraps to 1 (256+1 crossing period)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 257);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5200
     * @tc.name int8ArrayConstructorPart14Test052
     * @tc.desc Verify writing -256 wraps to 0 (negative direction full-period wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, -256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5300
     * @tc.name int8ArrayConstructorPart14Test053
     * @tc.desc Verify writing 127 preserves 127 (int8 max, within range not truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5400
     * @tc.name int8ArrayConstructorPart14Test054
     * @tc.desc Verify writing -128 preserves -128 (int8 min, within range not truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, -128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5500
     * @tc.name int8ArrayConstructorPart14Test055
     * @tc.desc Verify writing 0.9 truncates to 0 (positive decimal less than 1 truncates toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 0.9);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5600
     * @tc.name int8ArrayConstructorPart14Test056
     * @tc.desc Verify writing -0.9 truncates to 0 (negative decimal greater than -1 truncates toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, -0.9);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5700
     * @tc.name int8ArrayConstructorPart14Test057
     * @tc.desc Verify writing 127.5 truncates to 127 (decimal just below max truncates toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 127.5);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5800
     * @tc.name int8ArrayConstructorPart14Test058
     * @tc.desc Verify writing -128.5 truncates to -128 (decimal just below min truncates toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, -128.5);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5900
     * @tc.name int8ArrayConstructorPart14Test059
     * @tc.desc Verify writing Number.MIN_VALUE truncates to 0 (tiny positive decimal truncates toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, Number.MIN_VALUE);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6000
     * @tc.name int8ArrayConstructorPart14Test060
     * @tc.desc Verify writing -0.0 truncates to 0 (negative zero as element write becomes zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, -0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6100
     * @tc.name int8ArrayConstructorPart14Test061
     * @tc.desc Verify writing via view $_set, DataView getInt8 reads underlying byte (DataView-instrumented shared verification)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 42);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6200
     * @tc.name int8ArrayConstructorPart14Test062
     * @tc.desc Verify DataView setInt8 writes byte, view $_get reads it (reverse shared verification)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, -7);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.$_get(1)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6300
     * @tc.name int8ArrayConstructorPart14Test063
     * @tc.desc Verify two views sharing same buffer: writing view A reflects to view B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let a: Int8Array = new Int8Array(buf, undefined, undefined);
      let b: Int8Array = new Int8Array(buf, undefined, undefined);
      a.$_set(1, 15);
      expect(b.$_get(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6400
     * @tc.name int8ArrayConstructorPart14Test064
     * @tc.desc Verify offset-view write reflects to buf at corresponding byte, bytes before offset unchanged via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 1);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      arr.$_set(0, 50);
      expect(dv.getInt8(0)).assertEqual(1);
      expect(dv.getInt8(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6500
     * @tc.name int8ArrayConstructorPart14Test065
     * @tc.desc Verify offset-view first element equals buf[offset] via DataView preset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 77);
      let off: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6600
     * @tc.name int8ArrayConstructorPart14Test066
     * @tc.desc Verify full-view and offset-view interaction: write to offset-view reflects in full-view, out-of-range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, undefined, undefined);
      let off: Number = 2;
      let half: Int8Array = new Int8Array(buf, off, undefined);
      half.$_set(1, 33);
      expect(full.$_get(3)).assertEqual(33);
      expect(full.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6700
     * @tc.name int8ArrayConstructorPart14Test067
     * @tc.desc Verify multi-offset view chained writes, DataView verifies both positions reflect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let off0: Number = 0;
      let off2: Number = 2;
      let undefLenView: Int8Array = new Int8Array(buf, off0, undefined);
      let viewAt2: Int8Array = new Int8Array(buf, off2, undefined);
      undefLenView.$_set(0, 11);
      viewAt2.$_set(0, 22);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(11);
      expect(dv.getInt8(2)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6800
     * @tc.name int8ArrayConstructorPart14Test068
     * @tc.desc Verify view writes 200 truncates and wraps, DataView verifies underlying byte is -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 200);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6900
     * @tc.name int8ArrayConstructorPart14Test069
     * @tc.desc Verify subarray child view shares underlying buffer, DataView verifies child write reflects to buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub: Int8Array = arr.subarray(1, 3);
      sub.$_set(0, 88);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7000
     * @tc.name int8ArrayConstructorPart14Test070
     * @tc.desc Verify subarray shares with original view: original writes reflect to subarray read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub: Int8Array = arr.subarray(0, 2);
      arr.$_set(1, 44);
      expect(sub.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7100
     * @tc.name int8ArrayConstructorPart14Test071
     * @tc.desc Verify nested subarray (subarray of subarray) shares same underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub1: Int8Array = arr.subarray(0, 4);
      let sub2: Int8Array = sub1.subarray(1, 3);
      sub2.$_set(0, 71);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7200
     * @tc.name int8ArrayConstructorPart14Test072
     * @tc.desc Verify offset-view subarray shares underlying buffer (view-derived view sharing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      let sub: Int8Array = arr.subarray(0, 1);
      sub.$_set(0, 7);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7300
     * @tc.name int8ArrayConstructorPart14Test073
     * @tc.desc Verify fill over entire view reflects to buf, DataView verifies first and last bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.fill(5, 0, 3);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(5);
      expect(dv.getInt8(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7400
     * @tc.name int8ArrayConstructorPart14Test074
     * @tc.desc Verify offset-view partial range fill, DataView verifies only range changed and outside unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 9);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      arr.fill(8, 0, 2);
      expect(dv.getInt8(0)).assertEqual(9);
      expect(dv.getInt8(1)).assertEqual(8);
      expect(dv.getInt8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7500
     * @tc.name int8ArrayConstructorPart14Test075
     * @tc.desc Verify offset-view reverse in-place reflects to buf at corresponding positions via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 2);
      dv.setInt8(2, 3);
      dv.setInt8(3, 4);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      arr.reverse();
      expect(dv.getInt8(1)).assertEqual(4);
      expect(dv.getInt8(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7600
     * @tc.name int8ArrayConstructorPart14Test076
     * @tc.desc Verify sort view in-place reflects to buf, DataView verifies first and last bytes after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.sort();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(1);
      expect(dv.getInt8(2)).assertEqual(3);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7700
       * @tc.name int8ArrayConstructorPart14Test077
       * @tc.desc Verify offset-view out-of-bounds $_get (index>=length) returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart14Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(2);
        let off: Number = 1;
        let arr: Int8Array = new Int8Array(buf, off, undefined);
                try {
          arr.$_get(5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7800
     * @tc.name int8ArrayConstructorPart14Test078
     * @tc.desc Verify offset-view at(-1) returns last byte (negative index reads last element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 21);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.at(-1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7900
     * @tc.name int8ArrayConstructorPart14Test079
     * @tc.desc Verify buf modified after view construction, view reads latest value (no-cache live-read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 55);
      expect(arr.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8000
     * @tc.name int8ArrayConstructorPart14Test080
     * @tc.desc Verify offset+limited-length view writes two elements, DataView verifies bytes before and after unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 10);
      dv.setInt8(1, 20);
      let off: Number = 2;
      let len: Number = 2;
      let arr: Int8Array = new Int8Array(buf, off, len);
      arr.$_set(0, 30);
      arr.$_set(1, 40);
      expect(dv.getInt8(0)).assertEqual(10);
      expect(dv.getInt8(1)).assertEqual(20);
      expect(dv.getInt8(2)).assertEqual(30);
      expect(dv.getInt8(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8100
     * @tc.name int8ArrayConstructorPart14Test081
     * @tc.desc Verify offset-view and length-limited view at same buf position, at(0) reads consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 64);
      let off: Number = 2;
      let len: Number = 1;
      let undefLenView: Int8Array = new Int8Array(buf, off, undefined);
      let explicitLenView: Int8Array = new Int8Array(buf, off, len);
      expect(undefLenView.at(0)).assertEqual(64);
      expect(explicitLenView.at(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8200
     * @tc.name int8ArrayConstructorPart14Test082
     * @tc.desc Verify buf.byteLength unchanged after offset-view write (view operation does not affect buffer capacity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      arr.$_set(0, 99);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8300
     * @tc.name int8ArrayConstructorPart14Test083
     * @tc.desc Verify three views with different offset/length coexisting, lengths correct and independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let o0: Number = 0;
      let o2: Number = 2;
      let l2: Number = 2;
      let a: Int8Array = new Int8Array(buf, o0, undefined);
      let b: Int8Array = new Int8Array(buf, o2, l2);
      let c: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(a.length).assertEqual(6);
      expect(b.length).assertEqual(2);
      expect(c.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8400
     * @tc.name int8ArrayConstructorPart14Test084
     * @tc.desc Verify newly constructed view reads value written by previous view (cross-view no-cache sharing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let w: Int8Array = new Int8Array(buf, undefined, undefined);
      w.$_set(0, 13);
      let r: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(r.$_get(0)).assertEqual(13);
    });
  
      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8500
       * @tc.name int8ArrayConstructorPart14Test085
       * @tc.desc Verify offset-view out-of-bounds $_set (index>=length) silently no-op, DataView verifies buf unchanged, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart14Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(2);
        let dv: DataView = new DataView(buf);
        dv.setInt8(0, 5);
        dv.setInt8(1, 6);
        let off: Number = 1;
        let arr: Int8Array = new Int8Array(buf, off, undefined);
        let threwSet: boolean = false;
        try {
          arr.$_set(5, 99);
        } catch (e) {
          threwSet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwSet).assertTrue();
        expect(dv.getInt8(0)).assertEqual(5);
        expect(dv.getInt8(1)).assertEqual(6);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8600
       * @tc.name int8ArrayConstructorPart14Test086
       * @tc.desc Verify length-limited view out-of-bounds $_set silent no-op, DataView verifies buf unchanged, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart14Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let dv: DataView = new DataView(buf);
        dv.setInt8(1, 3);
        let len: Number = 1;
        let arr: Int8Array = new Int8Array(buf, undefined, len);
        let threwSet: boolean = false;
        try {
          arr.$_set(1, 99);
        } catch (e) {
          threwSet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwSet).assertTrue();
        expect(dv.getInt8(1)).assertEqual(3);
      });

});
}
