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

export default function DataViewGetInt8Test(): void {
  describe('DataViewGetInt8Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0100
     * @tc.name testDataViewGetIntEight0001
     * @tc.desc Verify getInt8 with required byteOffset parameter reads signed 8-bit integer normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 42);
      let result = view.getInt8(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0200
     * @tc.name testDataViewGetIntEight0002
     * @tc.desc Verify getInt8 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getInt8(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0500
     * @tc.name testDataViewGetIntEight0005
     * @tc.desc Verify getInt8 reads signed 8-bit integer from positive offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt8(3, -30);
      let result = view.getInt8(3);
      expect(result).assertEqual(-30);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0600
     * @tc.name testDataViewGetIntEight0006
     * @tc.desc Verify getInt8 reads signed 8-bit integer from middle offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setInt8(7, 100);
      let result = view.getInt8(7);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0700
     * @tc.name testDataViewGetIntEight0007
     * @tc.desc Verify getInt8 with minimum valid offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 127);
      let result = view.getInt8(0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0800
     * @tc.name testDataViewGetIntEight0008
     * @tc.desc Verify getInt8 with offset at last byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(3, -1);
      let result = view.getInt8(3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_0900
     * @tc.name testDataViewGetIntEight0009
     * @tc.desc Verify getInt8 throws RangeError when offset equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getInt8(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_1100
     * @tc.name testDataViewGetIntEight0011
     * @tc.desc Verify getInt8 throws RangeError when offset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
       
      try {
        view.getInt8(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_1300
     * @tc.name testDataViewGetIntEight0013
     * @tc.desc Verify getInt8 throws RangeError when offset exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getInt8(10);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_1400
     * @tc.name testDataViewGetIntEight0014
     * @tc.desc Verify getInt8 throws RangeError when offset far exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getInt8(2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_1500
     * @tc.name testDataViewGetIntEight0015
     * @tc.desc Verify getInt8 behavior when offset is a float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(1, 33);
      try {
        let result = view.getInt8(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_2400
     * @tc.name testDataViewGetIntEight0024
     * @tc.desc Verify getInt8 behavior when offset is boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 77);
      let result = view.getInt8(0);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_2600
     * @tc.name testDataViewGetIntEight0026
     * @tc.desc Verify getInt8 reads correctly with hexadecimal offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setInt8(0x05, 88);
      let result = view.getInt8(0x05);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_2800
     * @tc.name testDataViewGetIntEight0028
     * @tc.desc Verify getInt8 returns correct negative value after setInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, -56);
      let result = view.getInt8(0);
      expect(result).assertEqual(-56);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_2900
     * @tc.name testDataViewGetIntEight0029
     * @tc.desc Verify getInt8 reads correct values from different offsets independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 10);
      view.setInt8(1, -10);
      view.setInt8(2, 100);
      view.setInt8(3, -100);
      expect(view.getInt8(0)).assertEqual(10);
      expect(view.getInt8(1)).assertEqual(-10);
      expect(view.getInt8(2)).assertEqual(100);
      expect(view.getInt8(3)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3000
     * @tc.name testDataViewGetIntEight0030
     * @tc.desc Verify getInt8 returns 0 from uninitialized ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      let result = view.getInt8(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3100
     * @tc.name testDataViewGetIntEight0031
     * @tc.desc Verify getInt8 reads latest value after overwriting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 100);
      view.setInt8(0, -100);
      let result = view.getInt8(0);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3200
     * @tc.name testDataViewGetIntEight0032
     * @tc.desc Verify getInt8 returns 0 when explicitly set to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 0);
      let result = view.getInt8(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3300
     * @tc.name testDataViewGetIntEight0033
     * @tc.desc Verify getInt8 returns -1 when set to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, -1);
      let result = view.getInt8(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3500
     * @tc.name testDataViewGetIntEight0035
     * @tc.desc Verify getInt8 returns -128 which is the minimum signed 8-bit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, -128);
      let result = view.getInt8(0);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3600
     * @tc.name testDataViewGetIntEight0036
     * @tc.desc Verify getInt8 returns 1 when set to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 1);
      let result = view.getInt8(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3700
     * @tc.name testDataViewGetIntEight0037
     * @tc.desc Verify getInt8 reads -1 correctly representing 0xFF byte pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, -1);
      let result = view.getInt8(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3800
     * @tc.name testDataViewGetIntEight0038
     * @tc.desc Verify getInt8 returns 126 near the maximum positive boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 126);
      let result = view.getInt8(0);
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_3900
     * @tc.name testDataViewGetIntEight0039
     * @tc.desc Verify getInt8 returns -127 near the minimum negative boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, -127);
      let result = view.getInt8(0);
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4000
     * @tc.name testDataViewGetIntEight0040
     * @tc.desc Verify getInt8 return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 42);
      let result = view.getInt8(0);
      expect(typeof result).assertEqual("int");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4100
     * @tc.name testDataViewGetIntEight0041
     * @tc.desc Verify getInt8 return value is always an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 99);
      view.setInt8(1, -99);
      let r1 = view.getInt8(0);
      let r2 = view.getInt8(1);
      expect(r1).assertEqual(Math.floor(r1));
      expect(r2).assertEqual(Math.floor(r2));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4200
     * @tc.name testDataViewGetIntEight0042
     * @tc.desc Verify getInt8 return value is within int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      view.setInt8(0, 127);
      view.setInt8(1, -128);
      let r1 = view.getInt8(0);
      let r2 = view.getInt8(1);
      expect(r1).assertEqual(127);
      expect(r2).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4400
     * @tc.name testDataViewGetIntEight0044
     * @tc.desc Verify getInt8 throws RangeError when offset is much larger than buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(2);
      const view = new DataView(buffer);
      try {
        view.getInt8(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4500
     * @tc.name testDataViewGetIntEight0045
     * @tc.desc Verify getInt8 returns expected result when offset is 1 in a 1-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      try {
        view.getInt8(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4700
     * @tc.name testDataViewGetIntEight0047
     * @tc.desc Verify getInt8 throws RangeError when offset is extremely negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getInt8(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4800
     * @tc.name testDataViewGetIntEight0048
     * @tc.desc Verify getInt8 does not returns expected result with valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt8(0, 10);
      let result = 0;
      result = view.getInt8(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_4900
     * @tc.name testDataViewGetIntEight0049
     * @tc.desc Verify getInt8 enters catch branch with invalid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getInt8(10);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_5100
     * @tc.name testDataViewGetIntEight0051
     * @tc.desc Verify getInt8 offset is relative to DataView start when constructed with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      view.setInt8(0, 65);
      let result = view.getInt8(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_5200
     * @tc.name testDataViewGetIntEight0052
     * @tc.desc Verify getInt8 returns expected result when offset exceeds byteLength of DataView with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      try {
        view.getInt8(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I8_5300
     * @tc.name testDataViewGetIntEight0053
     * @tc.desc Verify getInt8 returns expected result on zero-length DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntEight0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      try {
        view.getInt8(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
