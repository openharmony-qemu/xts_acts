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

export default function int8ArrayConstructorPart14Test(): void {
  describe('Int8ArrayConstructorPart14Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_0100
     * @tc.name int8ArrayConstructorPart14Test001
     * @tc.desc Verify constructor(buf, undefined, undefined) with buf(3), offset defaults to 0 and length covers entire buffer, first element equals buf[0] on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify constructor(buf, Number(0), undefined) with buf(3), offset 0 and last element equals buf[2] on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify constructor(buf, undefined, Number(1)) with buf(3), offset defaults to 0 and length=1, element equals buf[0] on new Int8Array(buf, undefined, len)
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
     * @tc.desc Verify constructor(buf, Number(1), Number(1)) with buf(3), single-element view at offset 1 on new Int8Array(buf, off, len)
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
     * @tc.desc Verify constructor(buf, Number(2), undefined) with buf(3), length covers remaining 1 element equals buf[2] on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify constructor(buf, Number(2), Number(0)) with buf(3), middle-offset empty view on new Int8Array(buf, off, len)
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
     * @tc.desc Verify length expects 2 and $_get(0) expects 0 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify byteLength of new Int8Array(buf, undefined, undefined) returns 6
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
     * @tc.desc Verify byteOffset of new Int8Array(new ArrayBuffer(0), 0, 0) returns 0
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
     * @tc.desc Verify buffer property returns buf on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify byteOffset of new Int8Array(buf, undefined, undefined) returns 0
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
     * @tc.desc Verify $_get expects 31 from ArrayBuffer on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify length expects 2 and $_get(1) expects 14, on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify $_get expects 1 from ArrayBuffer, on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify byteOffset of new Int8Array(buf, off, len) returns 5
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), 6, undefined) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), -1, undefined) throws RangeError
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
     * @tc.desc Verify $_get expects 1 from ArrayBuffer, on new Int8Array(buf, undefined, len)
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
     * @tc.desc Verify $_get expects 3 from ArrayBuffer on new Int8Array(buf, off, len)
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
     * @tc.desc Verify $_get expects 5 from ArrayBuffer, with $_get(3), on new Int8Array(buf, off, len)
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
     * @tc.desc Verify byteOffset of new Int8Array(new ArrayBuffer(5), 0, 0) returns 0
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), 2, 4) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), undefined, -1) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), undefined, -2147483648) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(5), undefined, 2147483647) throws RangeError
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
     * @tc.desc Verify $_get expects 51 from ArrayBuffer on new Int8Array(buf, off, len)
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
     * @tc.desc Verify $_get expects 4 from ArrayBuffer, with $_get(1), on new Int8Array(buf, off, len)
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
     * @tc.desc Verify $_get expects 4 from ArrayBuffer, with $_get(3), on new Int8Array(buf, off, len)
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
     * @tc.desc Verify byteOffset of new Int8Array(buf, off, len) returns 3
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
     * @tc.desc Verify $_get expects 5 from ArrayBuffer, with $_get(4), on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify buffer property returns buf on new Int8Array(buf, off, len)
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
     * @tc.desc Verify byteLength of new Int8Array(buf, undefined, len) returns 4
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
     * @tc.desc Verify byteOffset 1 and byteLength 3 of new Int8Array(buf, 1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let off: Number = 1;
      let len: Number = 3;
      let arr: Int8Array = new Int8Array(buf, off, len);
      let r1: int = arr.byteOffset;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3400
     * @tc.name int8ArrayConstructorPart14Test034
     * @tc.desc Verify byteLength of new Int8Array(buf, off, undefined) returns 0
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
     * @tc.desc Verify $_get expects -128 from ArrayBuffer, on new Int8Array(new ArrayBuffer(2), undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, INT8_MIN);
      dv.setInt8(1, INT8_MAX);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_3600
     * @tc.name int8ArrayConstructorPart14Test036
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(3), on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify byteOffset of new Int8Array(buf, off, undefined) returns 4
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
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), on new Int8Array(new ArrayBuffer(6), undefined, undefined)
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
     * @tc.desc Verify length expects 1 from ArrayBuffer on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify byteOffset + byteLength of new Int8Array(buf, off, len) returns 6
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 6, 1) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 3, 4) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 7, 0) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), -1, -1) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 2147483647, undefined) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), undefined, Number.NEGATIVE_INFINITY) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(0), 0, 1) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 5, 2) throws RangeError
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
     * @tc.desc Verify new Int8Array(new ArrayBuffer(6), 0, 7) throws RangeError
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
     * @tc.desc Verify $_get expects -INT8_MAX after $_set(0, 129) on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify $_get expects 1 after $_set(0, 257) on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, -256), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects INT8_MAX from ArrayBuffer, after $_set(0, 127), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects -128 from ArrayBuffer, after $_set(0, -128), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, INT8_MIN);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5500
     * @tc.name int8ArrayConstructorPart14Test055
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, 0.9), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, -0.9), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects INT8_MAX from ArrayBuffer, after $_set(0, 127.5), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects -128 from ArrayBuffer, after $_set(0, INT8_MIN - 0.5), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, INT8_MIN - 0.5);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_5900
     * @tc.name int8ArrayConstructorPart14Test059
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, Number.MIN_VALUE), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, -0.0), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
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
     * @tc.desc Verify $_set(0, 42) writes 42 to buf via DataView, and $_set(0, 200) truncates to -56 on new Int8Array(buf, undefined, undefined)
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
      let buf2: ArrayBuffer = new ArrayBuffer(1);
      let arr2: Int8Array = new Int8Array(buf2, undefined, undefined);
      arr2.$_set(0, 200);
      let dv2: DataView = new DataView(buf2);
      let r1: number = dv2.getInt8(0);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6200
     * @tc.name int8ArrayConstructorPart14Test062
     * @tc.desc Verify $_get expects -7 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify $_get expects 15 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify $_set expects 1 from ArrayBuffer on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify $_get expects 77 from ArrayBuffer on new Int8Array(buf, off, undefined)
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
     * @tc.desc Verify $_get expects 33 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
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
     * @tc.desc Verify new Int8Array(buf, off0, undefined) constructor
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
     * @tc.desc Verify subarray(1, 3) shares buffer, $_set on subarray reflected in original expects 88 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub: Int8Array = arr.subarray(1, 3);
      sub.$_set(0, 88);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_6900
     * @tc.name int8ArrayConstructorPart14Test069
     * @tc.desc Verify subarray(0, 2) shares buffer, modification is bidirectional expects 44 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub: Int8Array = arr.subarray(0, 2);
      arr.$_set(1, 44);
      expect(sub.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7000
     * @tc.name int8ArrayConstructorPart14Test070
     * @tc.desc Verify subarray shares buffer, modification is bidirectional expects 71 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let sub1: Int8Array = arr.subarray(0, 4);
      let sub2: Int8Array = sub1.subarray(1, 3);
      sub2.$_set(0, 71);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7100
     * @tc.name int8ArrayConstructorPart14Test071
     * @tc.desc Verify subarray(0, 1) shares buffer, $_set on subarray reflected in original expects 7 from ArrayBuffer on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      let sub: Int8Array = arr.subarray(0, 1);
      sub.$_set(0, 7);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7200
     * @tc.name int8ArrayConstructorPart14Test072
     * @tc.desc Verify fill expects 5 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.fill(5, 0, 3);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(5);
      expect(dv.getInt8(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7300
     * @tc.name int8ArrayConstructorPart14Test073
     * @tc.desc Verify fill expects 9 from ArrayBuffer on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7400
     * @tc.name int8ArrayConstructorPart14Test074
     * @tc.desc Verify reverse expects 4 from ArrayBuffer on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7500
     * @tc.name int8ArrayConstructorPart14Test075
     * @tc.desc Verify sort expects 1 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7600
     * @tc.name int8ArrayConstructorPart14Test076
     * @tc.desc Verify $_get expects RangeError from ArrayBuffer throws exception on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      try {
        arr.$_get(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7700
     * @tc.name int8ArrayConstructorPart14Test077
     * @tc.desc Verify at expects 21 from ArrayBuffer on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let dv: DataView = new DataView(buf);
      dv.setInt8(2, 21);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      expect(arr.at(-1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7800
     * @tc.name int8ArrayConstructorPart14Test078
     * @tc.desc Verify $_get expects 55 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 55);
      expect(arr.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_7900
     * @tc.name int8ArrayConstructorPart14Test079
     * @tc.desc Verify $_set expects 10 from ArrayBuffer on new Int8Array(buf, off, len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8000
     * @tc.name int8ArrayConstructorPart14Test080
     * @tc.desc Verify at expects 64 from ArrayBuffer on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8100
     * @tc.name int8ArrayConstructorPart14Test081
     * @tc.desc Verify underlying ArrayBuffer byteLength unchanged (remains 4) after $_set on sub-array with offset=1 on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      arr.$_set(0, 99);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8200
     * @tc.name int8ArrayConstructorPart14Test082
     * @tc.desc Verify new Int8Array(buf, o0, undefined) constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8300
     * @tc.name int8ArrayConstructorPart14Test083
     * @tc.desc Verify $_get expects 13 from ArrayBuffer on new Int8Array(buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let w: Int8Array = new Int8Array(buf, undefined, undefined);
      w.$_set(0, 13);
      let r: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(r.$_get(0)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8400
     * @tc.name int8ArrayConstructorPart14Test084
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(5, 99), on new Int8Array(buf, off, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 5);
      dv.setInt8(1, 6);
      let off: Number = 1;
      let arr: Int8Array = new Int8Array(buf, off, undefined);
      try {
        arr.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dv.getInt8(0)).assertEqual(5);
      expect(dv.getInt8(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8500
     * @tc.name int8ArrayConstructorPart14Test085
     * @tc.desc Verify $_set expects RangeError from ArrayBuffer throws exception, with $_set(1, 99), on new Int8Array(buf, undefined, len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt8(1, 3);
      let len: Number = 1;
      let arr: Int8Array = new Int8Array(buf, undefined, len);
      try {
        arr.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dv.getInt8(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART14_TEST_8600
     * @tc.name int8ArrayConstructorPart14Test086
     * @tc.desc Verify $_get expects 0 from ArrayBuffer, with $_get(0), after $_set(0, Number.MAX_VALUE), on new Int8Array(new ArrayBuffer(1), undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart14Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf, undefined, undefined);
      arr.$_set(0, Number.MAX_VALUE);
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
