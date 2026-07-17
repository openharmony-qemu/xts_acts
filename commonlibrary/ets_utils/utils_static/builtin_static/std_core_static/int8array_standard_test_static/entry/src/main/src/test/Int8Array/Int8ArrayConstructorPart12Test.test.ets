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

export default function int8ArrayConstructorPart12TestTest(): void {
  describe('Int8ArrayConstructorPart12TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0100
     * @tc.name int8ArrayConstructorPart12Test001
     * @tc.desc Verify constructor(buf, byteOffset: Number, length: Number) with all three explicit Number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0200
     * @tc.name int8ArrayConstructorPart12Test002
     * @tc.desc Verify constructor(buf, undefined, length: Number) with byteOffset defaulting to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0300
     * @tc.name int8ArrayConstructorPart12Test003
     * @tc.desc Verify constructor(buf, byteOffset: Number, undefined) with length covering remaining buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(1);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0400
     * @tc.name int8ArrayConstructorPart12Test004
     * @tc.desc Verify constructor(buf, undefined, undefined) with double defaults (offset 0 + full buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0500
     * @tc.name int8ArrayConstructorPart12Test005
     * @tc.desc Verify 4-byte buffer with double undefined yields view length equal to buffer byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0600
     * @tc.name int8ArrayConstructorPart12Test006
     * @tc.desc Verify 0-byte empty buffer with double undefined yields view length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0700
     * @tc.name int8ArrayConstructorPart12Test007
     * @tc.desc Verify 1-byte buffer with double undefined yields single-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0800
     * @tc.name int8ArrayConstructorPart12Test008
     * @tc.desc Verify 16-byte buffer with double undefined yields large buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_0900
     * @tc.name int8ArrayConstructorPart12Test009
     * @tc.desc Verify byteOffset=Number(0) explicit zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1000
     * @tc.name int8ArrayConstructorPart12Test010
     * @tc.desc Verify byteOffset=Number(positive) + length=undefined, view from middle to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1100
     * @tc.name int8ArrayConstructorPart12Test011
     * @tc.desc Verify byteOffset=Number(byteLength) + length=undefined, empty view at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 4;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1200
     * @tc.name int8ArrayConstructorPart12Test012
     * @tc.desc Verify byteOffset=Number(exceeding byteLength) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 5;
      try {
        new Int8Array(buf, offset, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1300
     * @tc.name int8ArrayConstructorPart12Test013
     * @tc.desc Verify byteOffset=Number(negative) triggers error (Phase-1 probing for error name)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = -1;
      try {
        new Int8Array(buf, offset, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1400
     * @tc.name int8ArrayConstructorPart12Test014
     * @tc.desc Verify byteOffset=Number(2.9) truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 2.9;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1500
     * @tc.name int8ArrayConstructorPart12Test015
     * @tc.desc Verify byteOffset=Number(Number.NaN) converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = Number.NaN;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1600
     * @tc.name int8ArrayConstructorPart12Test016
     * @tc.desc Verify byteOffset=Number(Number.POSITIVE_INFINITY) exceeds length and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = Number.POSITIVE_INFINITY;
      try {
        new Int8Array(buf, offset, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1700
     * @tc.name int8ArrayConstructorPart12Test017
     * @tc.desc Verify byteOffset=Number(-0.0) equivalent to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = -0.0;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1800
     * @tc.name int8ArrayConstructorPart12Test018
     * @tc.desc Verify byteOffset=Number(MAX_VALUE) triggers overflow boundary error (Phase-1 probing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = Number.MAX_VALUE;
      try {
        new Int8Array(buf, offset, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_1900
     * @tc.name int8ArrayConstructorPart12Test019
     * @tc.desc Verify byteOffset=Number(MIN_VALUE) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = Number.MIN_VALUE;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2000
     * @tc.name int8ArrayConstructorPart12Test020
     * @tc.desc Verify length=undefined covers remaining buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2100
     * @tc.name int8ArrayConstructorPart12Test021
     * @tc.desc Verify length=Number(0) yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 0;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2200
     * @tc.name int8ArrayConstructorPart12Test022
     * @tc.desc Verify length=Number(positive) specifies element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2300
     * @tc.name int8ArrayConstructorPart12Test023
     * @tc.desc Verify length=Number(remaining capacity) exactly to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 3;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.length).assertEqual(3);
      expect(view.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2400
     * @tc.name int8ArrayConstructorPart12Test024
     * @tc.desc Verify length=Number(exceeding remaining capacity) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 5;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2500
     * @tc.name int8ArrayConstructorPart12Test025
     * @tc.desc Verify length=Number(negative) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = -1;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2600
     * @tc.name int8ArrayConstructorPart12Test026
     * @tc.desc Verify length=Number(2.9) truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 2.9;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2700
     * @tc.name int8ArrayConstructorPart12Test027
     * @tc.desc Verify length=Number(Number.NaN) converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = Number.NaN;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2800
     * @tc.name int8ArrayConstructorPart12Test028
     * @tc.desc Verify length=Number(Number.POSITIVE_INFINITY) exceeds remaining and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = Number.POSITIVE_INFINITY;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_2900
     * @tc.name int8ArrayConstructorPart12Test029
     * @tc.desc Verify length=Number(-0.0) equivalent to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = -0.0;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3000
     * @tc.name int8ArrayConstructorPart12Test030
     * @tc.desc Verify length=Number(MAX_VALUE) triggers overflow boundary error (Phase-1 probing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = Number.MAX_VALUE;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3100
     * @tc.name int8ArrayConstructorPart12Test031
     * @tc.desc Verify length=Number(MIN_VALUE) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = Number.MIN_VALUE;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3200
     * @tc.name int8ArrayConstructorPart12Test032
     * @tc.desc Verify offset=Number(0) + length=Number(4) explicit full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let len: Number = 4;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3300
     * @tc.name int8ArrayConstructorPart12Test033
     * @tc.desc Verify offset=Number(2) + length=Number(2) mid sub-view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 2;
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3400
     * @tc.name int8ArrayConstructorPart12Test034
     * @tc.desc Verify offset=Number(1) + length=Number(1) single-element view at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(1);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3500
     * @tc.name int8ArrayConstructorPart12Test035
     * @tc.desc Verify offset=Number(0) + length=Number(2) first 2 elements explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3600
     * @tc.name int8ArrayConstructorPart12Test036
     * @tc.desc Verify offset=Number(4) + length=Number(0) empty view at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 4;
      let len: Number = 0;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3700
     * @tc.name int8ArrayConstructorPart12Test037
     * @tc.desc Verify offset=Number(2) + length=Number(0) mid-offset empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 2;
      let len: Number = 0;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3800
     * @tc.name int8ArrayConstructorPart12Test038
     * @tc.desc Verify offset=Number(3) + length=Number(1) last single-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 3;
      let len: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(3);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_3900
     * @tc.name int8ArrayConstructorPart12Test039
     * @tc.desc Verify returned object is instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4000
     * @tc.name int8ArrayConstructorPart12Test040
     * @tc.desc Verify length property equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4100
     * @tc.name int8ArrayConstructorPart12Test041
     * @tc.desc Verify byteLength property equals view byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 2;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4200
     * @tc.name int8ArrayConstructorPart12Test042
     * @tc.desc Verify byteOffset property equals view start byte offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let offset: Number = 3;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4300
     * @tc.name int8ArrayConstructorPart12Test043
     * @tc.desc Verify buffer property reference equals the passed ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4400
     * @tc.name int8ArrayConstructorPart12Test044
     * @tc.desc Verify BYTES_PER_ELEMENT equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4500
     * @tc.name int8ArrayConstructorPart12Test045
     * @tc.desc Verify name property equals 'Int8Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.name).assertEqual('Int8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4600
     * @tc.name int8ArrayConstructorPart12Test046
     * @tc.desc Verify empty buffer + offset=Number(1) exceeds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let offset: Number = 1;
      try {
        new Int8Array(buf, offset, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4700
     * @tc.name int8ArrayConstructorPart12Test047
     * @tc.desc Verify empty buffer + length=Number(1) exceeds remaining and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let len: Number = 1;
      try {
        new Int8Array(buf, undefined, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4800
     * @tc.name int8ArrayConstructorPart12Test048
     * @tc.desc Verify offset=Number(1) + length=Number(4) on 4-byte buffer overflow throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 4;
      try {
        new Int8Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_4900
     * @tc.name int8ArrayConstructorPart12Test049
     * @tc.desc Verify offset=Number(4) + length=Number(1) no remaining space throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 4;
      let len: Number = 1;
      try {
        new Int8Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5000
     * @tc.name int8ArrayConstructorPart12Test050
     * @tc.desc Verify offset=Number(2) + length=Number(3) on 4-byte buffer overflow throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 2;
      let len: Number = 3;
      try {
        new Int8Array(buf, offset, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5100
     * @tc.name int8ArrayConstructorPart12Test051
     * @tc.desc Verify write 200 wraps around to -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 200);
      expect(view.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5200
     * @tc.name int8ArrayConstructorPart12Test052
     * @tc.desc Verify write 128 overflows and truncates to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 128);
      expect(view.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5300
     * @tc.name int8ArrayConstructorPart12Test053
     * @tc.desc Verify write -129 underflows and wraps to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, -129);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5400
     * @tc.name int8ArrayConstructorPart12Test054
     * @tc.desc Verify write 255 fully wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 255);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5500
     * @tc.name int8ArrayConstructorPart12Test055
     * @tc.desc Verify write 256 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 256);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5600
     * @tc.name int8ArrayConstructorPart12Test056
     * @tc.desc Verify write Number.NaN truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, Number.NaN);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5700
     * @tc.name int8ArrayConstructorPart12Test057
     * @tc.desc Verify write 1.9 float truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 1.9);
      expect(view.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5800
     * @tc.name int8ArrayConstructorPart12Test058
     * @tc.desc Verify write -1.9 float truncates to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, -1.9);
      expect(view.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_5900
     * @tc.name int8ArrayConstructorPart12Test059
     * @tc.desc Verify shared buffer: write via viewA $_set, read via viewB (shared semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewA: Int8Array = new Int8Array(buf, undefined, undefined);
      let viewB: Int8Array = new Int8Array(buf, undefined, undefined);
      viewA.$_set(0, 42);
      expect(viewB.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6000
     * @tc.name int8ArrayConstructorPart12Test060
     * @tc.desc Verify write via view changes underlying buffer bytes (verified via independent reader view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let writer: Int8Array = new Int8Array(buf, undefined, undefined);
      writer.$_set(1, 33);
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6100
     * @tc.name int8ArrayConstructorPart12Test061
     * @tc.desc Verify two views at same offset share buffer: write one, read other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let viewA: Int8Array = new Int8Array(buf, offset, undefined);
      let viewB: Int8Array = new Int8Array(buf, offset, undefined);
      viewA.$_set(2, 88);
      expect(viewB.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6200
     * @tc.name int8ArrayConstructorPart12Test062
     * @tc.desc Verify two views at different offsets with non-overlapping regions do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offsetA: Number = 0;
      let lenA: Number = 2;
      let viewA: Int8Array = new Int8Array(buf, offsetA, lenA);
      let offsetB: Number = 2;
      let lenB: Number = 2;
      let viewB: Int8Array = new Int8Array(buf, offsetB, lenB);
      viewA.$_set(1, 50);
      expect(viewB.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6300
     * @tc.name int8ArrayConstructorPart12Test063
     * @tc.desc Verify two views at different offsets with overlapping regions: write one affects the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offsetA: Number = 0;
      let viewA: Int8Array = new Int8Array(buf, offsetA, undefined);
      let offsetB: Number = 2;
      let viewB: Int8Array = new Int8Array(buf, offsetB, undefined);
      viewA.$_set(2, 99);
      expect(viewB.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6400
     * @tc.name int8ArrayConstructorPart12Test064
     * @tc.desc Verify three views chained sharing same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let offsetA: Number = 0;
      let viewA: Int8Array = new Int8Array(buf, offsetA, undefined);
      let offsetB: Number = 2;
      let viewB: Int8Array = new Int8Array(buf, offsetB, undefined);
      let offsetC: Number = 4;
      let viewC: Int8Array = new Int8Array(buf, offsetC, undefined);
      viewA.$_set(4, 7);
      expect(viewC.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6500
     * @tc.name int8ArrayConstructorPart12Test065
     * @tc.desc Verify view byteOffset correctly locates buffer position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let offset: Number = 3;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      let writer: Int8Array = new Int8Array(buf, undefined, undefined);
      writer.$_set(3, 77);
      expect(view.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6600
     * @tc.name int8ArrayConstructorPart12Test066
     * @tc.desc Verify view length is independent of buffer total length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let offset: Number = 0;
      let len: Number = 3;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.length).assertEqual(3);
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6700
     * @tc.name int8ArrayConstructorPart12Test067
     * @tc.desc Verify fill modifies view and reflects to buffer via reader view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.fill(7, 0, 2);
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(0)).assertEqual(7);
      expect(reader.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6800
     * @tc.name int8ArrayConstructorPart12Test068
     * @tc.desc Verify reverse modifies view and reflects to buffer via reader view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      view.reverse();
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_6900
     * @tc.name int8ArrayConstructorPart12Test069
     * @tc.desc Verify copyWithin modifies view and reflects to buffer via reader view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 5);
      view.$_set(1, 6);
      view.$_set(2, 7);
      view.$_set(3, 8);
      view.copyWithin(0, 2, 4);
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7000
     * @tc.name int8ArrayConstructorPart12Test070
     * @tc.desc Verify buffer pre-filled with bytes, offset view reads corresponding position value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let writer: Int8Array = new Int8Array(buf, undefined, undefined);
      writer.$_set(0, 10);
      writer.$_set(1, 20);
      let offset: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7100
     * @tc.name int8ArrayConstructorPart12Test071
     * @tc.desc Verify buf.byteLength unchanged after write via view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 99);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7200
     * @tc.name int8ArrayConstructorPart12Test072
     * @tc.desc Verify subarray shares buffer with parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let view: Int8Array = new Int8Array(buf, offset, undefined);
      let sub: Int8Array = view.subarray(1, 3);
      view.$_set(1, 55);
      expect(sub.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7300
     * @tc.name int8ArrayConstructorPart12Test073
     * @tc.desc Verify set() write via view reflects to buffer via reader view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.set(0, 44);
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7400
     * @tc.name int8ArrayConstructorPart12Test074
     * @tc.desc Verify offset=Number(0) + length=Number(0) empty view at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let len: Number = 0;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7500
     * @tc.name int8ArrayConstructorPart12Test075
     * @tc.desc Verify large buffer with offset=Number(8) + length=Number(4) view positioning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let offset: Number = 8;
      let len: Number = 4;
      let view: Int8Array = new Int8Array(buf, offset, len);
      expect(view.byteOffset).assertEqual(8);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7600
     * @tc.name int8ArrayConstructorPart12Test076
     * @tc.desc Verify offset=undefined + length=Number(0) empty view at start (default offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let len: Number = 0;
      let view: Int8Array = new Int8Array(buf, undefined, len);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(0);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7700
       * @tc.name int8ArrayConstructorPart12Test077
       * @tc.desc Verify view $_get out-of-bounds (>=length) returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart12Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let offset: Number = 0;
        let len: Number = 2;
        let view: Int8Array = new Int8Array(buf, offset, len);
                try {
          view.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7800
     * @tc.name int8ArrayConstructorPart12Test078
     * @tc.desc Verify offset=Number(byteLength-1) + length=Number(1) last single-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 3;
      let len: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, len);
      let writer: Int8Array = new Int8Array(buf, undefined, undefined);
      writer.$_set(3, 12);
      expect(view.$_get(0)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_7900
     * @tc.name int8ArrayConstructorPart12Test079
     * @tc.desc Verify offset=Number(0) + length=Number(byteLength) explicit full view equals double undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 0;
      let len: Number = 4;
      let view: Int8Array = new Int8Array(buf, offset, len);
      let def: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.length).assertEqual(def.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_8000
     * @tc.name int8ArrayConstructorPart12Test080
     * @tc.desc Verify two views with different lengths covering same buffer region both see writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offsetA: Number = 0;
      let lenA: Number = 4;
      let viewA: Int8Array = new Int8Array(buf, offsetA, lenA);
      let offsetB: Number = 0;
      let lenB: Number = 2;
      let viewB: Int8Array = new Int8Array(buf, offsetB, lenB);
      viewA.$_set(1, 65);
      expect(viewB.$_get(1)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_8100
     * @tc.name int8ArrayConstructorPart12Test081
     * @tc.desc Verify write 0 element maintains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, undefined, undefined);
      view.$_set(0, 0);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_8200
     * @tc.name int8ArrayConstructorPart12Test082
     * @tc.desc Verify cross-view write: second view writes, first view reads (bidirectional share)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offsetA: Number = 0;
      let viewA: Int8Array = new Int8Array(buf, offsetA, undefined);
      let offsetB: Number = 1;
      let viewB: Int8Array = new Int8Array(buf, offsetB, undefined);
      viewB.$_set(0, 31);
      expect(viewA.$_get(1)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART12_TEST_8300
     * @tc.name int8ArrayConstructorPart12Test083
     * @tc.desc Verify offset=Number(1) + length=Number(1) single-element view independent read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart12Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: Number = 1;
      let len: Number = 1;
      let view: Int8Array = new Int8Array(buf, offset, len);
      view.$_set(0, 19);
      let reader: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(reader.$_get(1)).assertEqual(19);
    });
  });
}
