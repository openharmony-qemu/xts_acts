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

export default function DataViewGetInt32Test(): void {
  describe('DataViewGetInt32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0100
     * @tc.name testDataViewGetIntThirtytwo0001
     * @tc.desc Verify getInt32 reads signed 32-bit integer with default byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1024);
      let result = view.getInt32(0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0200
     * @tc.name testDataViewGetIntThirtytwo0002
     * @tc.desc Verify getInt32 with byteOffset 0 reads default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let result = view.getInt32(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0300
     * @tc.name testDataViewGetIntThirtytwo0003
     * @tc.desc Verify getInt32 reads with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1024);
      let result = view.getInt32(0, false);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0500
     * @tc.name testDataViewGetIntThirtytwo0005
     * @tc.desc Verify getInt32 reads from second 4-byte position with byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(4, 2048);
      let result = view.getInt32(4);
      expect(result).assertEqual(2048);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0600
     * @tc.name testDataViewGetIntThirtytwo0006
     * @tc.desc Verify getInt32 reads at last valid offset where exactly 4 bytes are available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(4, 123456);
      let result = view.getInt32(4);
      expect(result).assertEqual(123456);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0700
     * @tc.name testDataViewGetIntThirtytwo0007
     * @tc.desc Verify getInt32 reads at minimum valid offset with 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt32(0, -100);
      let result = view.getInt32(0);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0800
     * @tc.name testDataViewGetIntThirtytwo0008
     * @tc.desc Verify getInt32 throws RangeError when byteOffset is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_0900
     * @tc.name testDataViewGetIntThirtytwo0009
     * @tc.desc Verify getInt32 throws RangeError when byteOffset is int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(-2147483648);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_1200
     * @tc.name testDataViewGetIntThirtytwo0012
     * @tc.desc Verify getInt32 defaults littleEndian to false when only byteOffset is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1024, false);
      let result = view.getInt32(0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_1300
     * @tc.name testDataViewGetIntThirtytwo0013
     * @tc.desc Verify getInt32 reads with littleEndian=true in little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1024, true);
      let result = view.getInt32(0, true);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_1700
     * @tc.name testDataViewGetIntThirtytwo0017
     * @tc.desc Verify getInt32 with non-zero byteOffset and littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(4, 4096, true);
      let result = view.getInt32(4, true);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_1800
     * @tc.name testDataViewGetIntThirtytwo0018
     * @tc.desc Verify getInt32 at last valid offset with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(4, 65536, true);
      let result = view.getInt32(4, true);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_1900
     * @tc.name testDataViewGetIntThirtytwo0019
     * @tc.desc Verify getInt32 with 4-byte buffer and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt32(0, 100, true);
      let result = view.getInt32(0, true);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2000
     * @tc.name testDataViewGetIntThirtytwo0020
     * @tc.desc Verify getInt32 returns expected result with negative byteOffset and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(-1, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2100
     * @tc.name testDataViewGetIntThirtytwo0021
     * @tc.desc Verify getInt32 returns expected result with byteOffset 0 with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        let result = view.getInt32(0, true);
        expect(result).assertEqual(0);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2200
     * @tc.name testDataViewGetIntThirtytwo0022
     * @tc.desc Verify getInt32 returns expected result with byteOffset 0 with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        let result = view.getInt32(0, false);
        expect(result).assertEqual(0);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2500
     * @tc.name testDataViewGetIntThirtytwo0025
     * @tc.desc Verify getInt32 defaults to big-endian when littleEndian is not passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 256, false);
      let result1 = view.getInt32(0);
      let result2 = view.getInt32(0, false);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2700
     * @tc.name testDataViewGetIntThirtytwo0027
     * @tc.desc Verify getInt32 treats undefined littleEndian as default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1024, false);
      let result = view.getInt32(0, undefined);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_2900
     * @tc.name testDataViewGetIntThirtytwo0029
     * @tc.desc Verify getInt32 reads normal negative integer -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, -100);
      let result = view.getInt32(0);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3000
     * @tc.name testDataViewGetIntThirtytwo0030
     * @tc.desc Verify getInt32 reads normal value from non-zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(12);
      const view = new DataView(buffer);
      view.setInt32(4, 32767);
      let result = view.getInt32(4);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3100
     * @tc.name testDataViewGetIntThirtytwo0031
     * @tc.desc Verify getInt32 reads zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0);
      let result = view.getInt32(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3200
     * @tc.name testDataViewGetIntThirtytwo0032
     * @tc.desc Verify getInt32 reads -1 with all bits set 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, -1);
      let result = view.getInt32(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3300
     * @tc.name testDataViewGetIntThirtytwo0033
     * @tc.desc Verify getInt32 reads signed 32-bit maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 2147483647);
      let result = view.getInt32(0);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3400
     * @tc.name testDataViewGetIntThirtytwo0034
     * @tc.desc Verify getInt32 reads signed 32-bit minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, -2147483648);
      let result = view.getInt32(0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3500
     * @tc.name testDataViewGetIntThirtytwo0035
     * @tc.desc Verify getInt32 reads minimum positive integer 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1);
      let result = view.getInt32(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3600
     * @tc.name testDataViewGetIntThirtytwo0036
     * @tc.desc Verify getInt32 reads value close to minimum -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, -2147483647);
      let result = view.getInt32(0);
      expect(result).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3700
     * @tc.name testDataViewGetIntThirtytwo0037
     * @tc.desc Verify getInt32 reads value close to maximum 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 2147483646);
      let result = view.getInt32(0);
      expect(result).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3800
     * @tc.name testDataViewGetIntThirtytwo0038
     * @tc.desc Verify getInt32 reads 0x12345678 in big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0x12345678, false);
      let result = view.getInt32(0, false);
      expect(result).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_3900
     * @tc.name testDataViewGetIntThirtytwo0039
     * @tc.desc Verify getInt32 byte data verification in big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1, false);
      let result = view.getInt32(0, false);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4000
     * @tc.name testDataViewGetIntThirtytwo0040
     * @tc.desc Verify getInt32 reads 0x12345678 in little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0x12345678, true);
      let result = view.getInt32(0, true);
      expect(result).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4100
     * @tc.name testDataViewGetIntThirtytwo0041
     * @tc.desc Verify getInt32 byte data verification in little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 1, true);
      let result = view.getInt32(0, true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4200
     * @tc.name testDataViewGetIntThirtytwo0042
     * @tc.desc Verify getInt32 returns same result for matching write and read endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer1 = new ArrayBuffer(8);
      const view1 = new DataView(buffer1);
      view1.setInt32(0, 1024, false);
      let resultBE = view1.getInt32(0, false);

      const buffer2 = new ArrayBuffer(8);
      const view2 = new DataView(buffer2);
      view2.setInt32(0, 1024, true);
      let resultLE = view2.getInt32(0, true);

      expect(resultBE).assertEqual(resultLE);
      expect(resultBE).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4300
     * @tc.name testDataViewGetIntThirtytwo0043
     * @tc.desc Verify getInt32 returns different result when read endianness differs from write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0x12345678, false);
      let resultLE = view.getInt32(0, true);
      expect(resultLE).assertEqual(0x78563412);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4400
     * @tc.name testDataViewGetIntThirtytwo0044
     * @tc.desc Verify getInt32 returns different result when read endianness differs from write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0x12345678, true);
      let resultBE = view.getInt32(0, false);
      expect(resultBE).assertEqual(0x78563412);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4500
     * @tc.name testDataViewGetIntThirtytwo0045
     * @tc.desc Verify getInt32 returns same result for value 0 regardless of endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 0, true);
      let resultBE = view.getInt32(0, false);
      let resultLE = view.getInt32(0, true);
      expect(resultBE).assertEqual(resultLE);
      expect(resultBE).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4700
     * @tc.name testDataViewGetIntThirtytwo0047
     * @tc.desc Verify getInt32 return value is an integer with no fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 42);
      let result = view.getInt32(0);
      expect(result).assertEqual(Math.floor(result));
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4800
     * @tc.name testDataViewGetIntThirtytwo0048
     * @tc.desc Verify getInt32 return value is within int32 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 2147483647);
      let maxResult = view.getInt32(0);
      expect(maxResult >= -2147483648).assertTrue();
      expect(maxResult <= 2147483647).assertTrue();

      view.setInt32(0, -2147483648);
      let minResult = view.getInt32(0);
      expect(minResult >= -2147483648).assertTrue();
      expect(minResult <= 2147483647).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_4900
     * @tc.name testDataViewGetIntThirtytwo0049
     * @tc.desc Verify getInt32 returns consistent results when reading same position multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 65536);
      let result1 = view.getInt32(0);
      let result2 = view.getInt32(0);
      let result3 = view.getInt32(0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(65536);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5000
     * @tc.name testDataViewGetIntThirtytwo0050
     * @tc.desc Verify getInt32 throws RangeError when byteOffset 5 leaves only 3 bytes in 8-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5300
     * @tc.name testDataViewGetIntThirtytwo0053
     * @tc.desc Verify getInt32 returns expected result when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(8);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5400
     * @tc.name testDataViewGetIntThirtytwo0054
     * @tc.desc Verify getInt32 returns expected result when byteOffset far exceeds buffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5600
     * @tc.name testDataViewGetIntThirtytwo0056
     * @tc.desc Verify getInt32 returns expected result when buffer is only 3 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(3);
      const view = new DataView(buffer);
      try {
        view.getInt32(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5700
     * @tc.name testDataViewGetIntThirtytwo0057
     * @tc.desc Verify getInt32 throws RangeError on out-of-bounds access with littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(5, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_5800
     * @tc.name testDataViewGetIntThirtytwo0058
     * @tc.desc Verify getInt32 throws RangeError on out-of-bounds access with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(8, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6200
     * @tc.name testDataViewGetIntThirtytwo0062
     * @tc.desc Verify getInt32 throws RangeError exception and validates exception type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      try {
        view.getInt32(10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6400
     * @tc.name testDataViewGetIntThirtytwo0064
     * @tc.desc Verify getInt32 reads the correct value written by setInt32 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 42);
      let result = view.getInt32(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6600
     * @tc.name testDataViewGetIntThirtytwo0066
     * @tc.desc Verify multiple consecutive exception catches do not interfere with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      for (let i = 0; i < 3; i++) {
        try {
          view.getInt32(100 + i);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6700
     * @tc.name testDataViewGetIntThirtytwo0067
     * @tc.desc Verify getInt32 reads different values from multiple positions in the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setInt32(0, 111);
      view.setInt32(4, 222);
      view.setInt32(8, 333);
      view.setInt32(12, 444);
      expect(view.getInt32(0)).assertEqual(111);
      expect(view.getInt32(4)).assertEqual(222);
      expect(view.getInt32(8)).assertEqual(333);
      expect(view.getInt32(12)).assertEqual(444);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6800
     * @tc.name testDataViewGetIntThirtytwo0068
     * @tc.desc Verify getInt32 reads back the same value immediately after setInt32 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let testValues: int[] = [0, 1, -1, 1024, -1024, 2147483647, -2147483648];
      for (let i = 0; i < testValues.length; i++) {
        view.setInt32(0, testValues[i]);
        expect(view.getInt32(0)).assertEqual(testValues[i]);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_6900
     * @tc.name testDataViewGetIntThirtytwo0069
     * @tc.desc Verify getInt32 consistency with big-endian write and big-endian read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 12345, false);
      expect(view.getInt32(0, false)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_7000
     * @tc.name testDataViewGetIntThirtytwo0070
     * @tc.desc Verify getInt32 consistency with little-endian write and little-endian read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setInt32(0, 12345, true);
      expect(view.getInt32(0, true)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_7100
     * @tc.name testDataViewGetIntThirtytwo0071
     * @tc.desc Verify getInt32 with 4-byte buffer only allows offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      view.setInt32(0, 99999);
      expect(view.getInt32(0)).assertEqual(99999);
      try {
        view.getInt32(1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I32_7200
     * @tc.name testDataViewGetIntThirtytwo0072
     * @tc.desc Verify getInt32 read-write consistency for int32 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntThirtytwo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      let boundaryValues: int[] = [
        -2147483648,
        -2147483647,
        -1,
        0,
        1,
        2147483646,
        2147483647
      ];
      for (let val of boundaryValues) {
        view.setInt32(0, val);
        expect(view.getInt32(0)).assertEqual(val);
      }
    });
  });
}
