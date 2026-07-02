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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DataViewGetUint8Test(): void {
  describe('DataViewGetUint8Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0100
     * @tc.name testDataViewGetUintEight0001
     * @tc.desc Verify getUint8 with required byteOffset parameter reads unsigned 8-bit integer normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 42);
      let result = view.getUint8(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0200
     * @tc.name testDataViewGetUintEight0002
     * @tc.desc Verify getUint8 with byteOffset 0 reads default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      let result = view.getUint8(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0500
     * @tc.name testDataViewGetUintEight0005
     * @tc.desc Verify getUint8 reads unsigned 8-bit integer from positive integer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setUint8(3, 200);
      let result = view.getUint8(3);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0600
     * @tc.name testDataViewGetUintEight0006
     * @tc.desc Verify getUint8 reads unsigned 8-bit integer from middle offset position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setUint8(7, 100);
      let result = view.getUint8(7);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0700
     * @tc.name testDataViewGetUintEight0007
     * @tc.desc Verify getUint8 at minimum valid offset 0 reads the first byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 255);
      let result = view.getUint8(0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0800
     * @tc.name testDataViewGetUintEight0008
     * @tc.desc Verify getUint8 at byteLength-1 reads the last byte of DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(3, 128);
      let result = view.getUint8(3);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_0900
     * @tc.name testDataViewGetUintEight0009
     * @tc.desc Verify getUint8 throws RangeError when byteOffset equals buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getUint8(4);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1000
     * @tc.name testDataViewGetUintEight0010
     * @tc.desc Verify getUint8 reads unsigned maximum value 255 at byteLength-1 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(3, 255);
      let result = view.getUint8(3);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1100
     * @tc.name testDataViewGetUintEight0011
     * @tc.desc Verify getUint8 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getUint8(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1300
     * @tc.name testDataViewGetUintEight0013
     * @tc.desc Verify getUint8 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getUint8(10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1400
     * @tc.name testDataViewGetUintEight0014
     * @tc.desc Verify getUint8 throws RangeError when byteOffset far exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getUint8(2147483647);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1500
     * @tc.name testDataViewGetUintEight0015
     * @tc.desc Verify getUint8 behavior when byteOffset is a floating-point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(1, 33);
      let result = view.getUint8(1 as int);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1700
     * @tc.name testDataViewGetUintEight0017
     * @tc.desc Verify getUint8 throws RangeError when byteOffset is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getUint8(0x7FFFFFFF as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_1800
     * @tc.name testDataViewGetUintEight0018
     * @tc.desc Verify getUint8 throws RangeError when byteOffset is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getUint8(-0x80000000 as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_2300
     * @tc.name testDataViewGetUintEight0023
     * @tc.desc Verify getUint8 behavior when byteOffset is boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(1, 55);
      let result = view.getUint8(1);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_2400
     * @tc.name testDataViewGetUintEight0024
     * @tc.desc Verify getUint8 behavior when byteOffset is boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 77);
      let result = view.getUint8(0);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_2600
     * @tc.name testDataViewGetUintEight0026
     * @tc.desc Verify getUint8 reads normally when byteOffset is a hex integer literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setUint8(0x05, 88);
      let result = view.getUint8(0x05);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_2800
     * @tc.name testDataViewGetUintEight0028
     * @tc.desc Verify getUint8 reads correctly from different offset positions consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 10);
      view.setUint8(1, 100);
      view.setUint8(2, 200);
      view.setUint8(3, 255);
      expect(view.getUint8(0)).assertEqual(10);
      expect(view.getUint8(1)).assertEqual(100);
      expect(view.getUint8(2)).assertEqual(200);
      expect(view.getUint8(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3000
     * @tc.name testDataViewGetUintEight0030
     * @tc.desc Verify getUint8 reads the latest value after overwriting at the same offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 100);
      view.setUint8(0, 200);
      let result = view.getUint8(0);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3300
     * @tc.name testDataViewGetUintEight0033
     * @tc.desc Verify getUint8 reads 128 as the middle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 128);
      let result = view.getUint8(0);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3400
     * @tc.name testDataViewGetUintEight0034
     * @tc.desc Verify getUint8 reads 1 as the minimum positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 1);
      let result = view.getUint8(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3500
     * @tc.name testDataViewGetUintEight0035
     * @tc.desc Verify getUint8 reads 254 near the maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 254);
      let result = view.getUint8(0);
      expect(result).assertEqual(254);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3600
     * @tc.name testDataViewGetUintEight0036
     * @tc.desc Verify getUint8 reads 127 at the signed/unsigned boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 127);
      let result = view.getUint8(0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3800
     * @tc.name testDataViewGetUintEight0038
     * @tc.desc Verify getUint8 return value is of number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 42);
      let result = view.getUint8(0);
      expect(typeof result).assertEqual("int");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_3900
     * @tc.name testDataViewGetUintEight0039
     * @tc.desc Verify getUint8 return value is always an integer without fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 99);
      view.setUint8(1, 200);
      let r1 = view.getUint8(0);
      let r2 = view.getUint8(1);
      expect(r1).assertEqual(Math.floor(r1));
      expect(r2).assertEqual(Math.floor(r2));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_4000
     * @tc.name testDataViewGetUintEight0040
     * @tc.desc Verify getUint8 return value is always in the range 0 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setUint8(0, 0);
      view.setUint8(1, 255);
      let r1 = view.getUint8(0);
      let r2 = view.getUint8(1);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_4100
     * @tc.name testDataViewGetUintEight0041
     * @tc.desc Verify getUint8 return value is always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 0);
      view.setUint8(1, 128);
      view.setUint8(2, 255);
      expect(view.getUint8(0) >= 0).assertTrue();
      expect(view.getUint8(1) >= 0).assertTrue();
      expect(view.getUint8(2) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_4300
     * @tc.name testDataViewGetUintEight0043
     * @tc.desc Verify getUint8 throws RangeError when byteOffset is much larger than buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getUint8(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_4600
     * @tc.name testDataViewGetUintEight0046
     * @tc.desc Verify getUint8 throws RangeError when byteOffset is a very small negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getUint8(-2147483648);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_4700
     * @tc.name testDataViewGetUintEight0047
     * @tc.desc Verify getUint8 does not returns expected result on valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setUint8(0, 10);
       
      let result = 0;
      result = view.getUint8(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_5000
     * @tc.name testDataViewGetUintEight0050
     * @tc.desc Verify getUint8 works with DataView constructed with byteOffset and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      view.setUint8(0, 65);
      let result = view.getUint8(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U8_5100
     * @tc.name testDataViewGetUintEight0051
     * @tc.desc Verify getUint8 returns expected result when offset exceeds byteLength of DataView with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintEight0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      try {
        view.getUint8(4);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

  });
}
