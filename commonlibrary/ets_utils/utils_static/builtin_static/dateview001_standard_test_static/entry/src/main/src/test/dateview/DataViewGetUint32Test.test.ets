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

export default function DataViewGetUint32Test(): void {
  describe('DataViewGetUint32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0100
     * @tc.name testDataViewGetUintThirtyTwo0001
     * @tc.desc Verify getUint32 with only byteOffset parameter using default big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024);
      let result = view.getUint32(0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0200
     * @tc.name testDataViewGetUintThirtyTwo0002
     * @tc.desc Verify getUint32 with byteOffset and littleEndian parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024, true);
      let result = view.getUint32(0, true);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0300
     * @tc.name testDataViewGetUintThirtyTwo0003
     * @tc.desc Verify getUint32 with byteOffset and explicit big-endian littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4096, false);
      let result = view.getUint32(0, false);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0400
     * @tc.name testDataViewGetUintThirtyTwo0004
     * @tc.desc Verify getUint32 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0700
     * @tc.name testDataViewGetUintThirtyTwo0007
     * @tc.desc Verify getUint32 with byteOffset 4 reads from 5th byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(4, 512);
      let result = view.getUint32(4);
      expect(result).assertEqual(512);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0800
     * @tc.name testDataViewGetUintThirtyTwo0008
     * @tc.desc Verify getUint32 at maximum valid offset bufferSize minus 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(4, 4294967295);
      let result = view.getUint32(4);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_0900
     * @tc.name testDataViewGetUintThirtyTwo0009
     * @tc.desc Verify getUint32 with minimum valid offset 0 on 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint32(0, 0);
      let result = view.getUint32(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1000
     * @tc.name testDataViewGetUintThirtyTwo0010
     * @tc.desc Verify getUint32 returns expected result when offset plus 4 exceeds buffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(5);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1100
     * @tc.name testDataViewGetUintThirtyTwo0011
     * @tc.desc Verify getUint32 returns expected result when byteOffset equals bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(8);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1300
     * @tc.name testDataViewGetUintThirtyTwo0013
     * @tc.desc Verify getUint32 returns expected result with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1400
     * @tc.name testDataViewGetUintThirtyTwo0014
     * @tc.desc Verify getUint32 returns expected result with large negative byteOffset -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1500
     * @tc.name testDataViewGetUintThirtyTwo0015
     * @tc.desc Verify getUint32 returns expected result when buffer is less than 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(3);
      const view = new DataView(buf);
       
      try {
        view.getUint32(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1600
     * @tc.name testDataViewGetUintThirtyTwo0016
     * @tc.desc Verify getUint32 with byteOffset 0 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1, true);
      let result = view.getUint32(0, true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1700
     * @tc.name testDataViewGetUintThirtyTwo0017
     * @tc.desc Verify getUint32 with byteOffset 0 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1, false);
      let result = view.getUint32(0, false);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1800
     * @tc.name testDataViewGetUintThirtyTwo0018
     * @tc.desc Verify getUint32 at max valid offset with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(4, 65535, true);
      let result = view.getUint32(4, true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_1900
     * @tc.name testDataViewGetUintThirtyTwo0019
     * @tc.desc Verify getUint32 returns expected result with out-of-range offset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(5, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2000
     * @tc.name testDataViewGetUintThirtyTwo0020
     * @tc.desc Verify getUint32 returns expected result with negative offset and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(-1, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2200
     * @tc.name testDataViewGetUintThirtyTwo0022
     * @tc.desc Verify getUint32 returns correct value with little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4096, true);
      let result = view.getUint32(0, true);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2300
     * @tc.name testDataViewGetUintThirtyTwo0023
     * @tc.desc Verify getUint32 returns consistent results on multiple reads at same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 12345);
      let result1 = view.getUint32(0);
      let result2 = view.getUint32(0);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2400
     * @tc.name testDataViewGetUintThirtyTwo0024
     * @tc.desc Verify getUint32 reads correctly from different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setUint32(0, 100);
      view.setUint32(4, 200);
      view.setUint32(8, 300);
      view.setUint32(12, 400);
      expect(view.getUint32(0)).assertEqual(100);
      expect(view.getUint32(4)).assertEqual(200);
      expect(view.getUint32(8)).assertEqual(300);
      expect(view.getUint32(12)).assertEqual(400);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2600
     * @tc.name testDataViewGetUintThirtyTwo0026
     * @tc.desc Verify getUint32 returns 4294967295 for maximum uint32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967295);
      let result = view.getUint32(0);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2700
     * @tc.name testDataViewGetUintThirtyTwo0027
     * @tc.desc Verify getUint32 returns 2147483648 correctly without negative sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 2147483648);
      let result = view.getUint32(0);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_2900
     * @tc.name testDataViewGetUintThirtyTwo0029
     * @tc.desc Verify getUint32 returns minimum positive integer 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1);
      let result = view.getUint32(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3000
     * @tc.name testDataViewGetUintThirtyTwo0030
     * @tc.desc Verify getUint32 returns 4294967294 which is max value minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967294);
      let result = view.getUint32(0);
      expect(result).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3100
     * @tc.name testDataViewGetUintThirtyTwo0031
     * @tc.desc Verify getUint32 returns 0 for unwritten buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let result = view.getUint32(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3200
     * @tc.name testDataViewGetUintThirtyTwo0032
     * @tc.desc Verify getUint32 returns different results for big-endian vs little-endian reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1, true);
      let littleResult = view.getUint32(0, true);
      let bigResult = view.getUint32(0, false);
      expect(littleResult).assertEqual(1);
      expect(bigResult === 1).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3300
     * @tc.name testDataViewGetUintThirtyTwo0033
     * @tc.desc Verify getUint32 consistency with big-endian write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 305419896, false);
      let result = view.getUint32(0, false);
      expect(result).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3400
     * @tc.name testDataViewGetUintThirtyTwo0034
     * @tc.desc Verify getUint32 consistency with little-endian write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 305419896, true);
      let result = view.getUint32(0, true);
      expect(result).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3500
     * @tc.name testDataViewGetUintThirtyTwo0035
     * @tc.desc Verify getUint32 byte order reversal when reading little-endian after big-endian write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 305419896, false);
      let result = view.getUint32(0, true);
      expect(result).assertEqual(2018915346);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_3600
     * @tc.name testDataViewGetUintThirtyTwo0036
     * @tc.desc Verify getUint32 overload 1 defaults to big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 65535, false);
      let result1 = view.getUint32(0);
      let result2 = view.getUint32(0, false);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_4000
     * @tc.name testDataViewGetUintThirtyTwo0040
     * @tc.desc Verify getUint32 return value can participate in arithmetic operations correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1000);
      let result = view.getUint32(0);
      expect(result + 1).assertEqual(1001);
      expect(result * 2).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_4100
     * @tc.name testDataViewGetUintThirtyTwo0041
     * @tc.desc Verify getUint32 throws RangeError when offset plus 4 exceeds buffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(6);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_4200
     * @tc.name testDataViewGetUintThirtyTwo0042
     * @tc.desc Verify getUint32 returns expected result when byteOffset equals bufferSize on 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint32(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_4300
     * @tc.name testDataViewGetUintThirtyTwo0043
     * @tc.desc Verify getUint32 returns expected result when byteOffset is much larger than bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getUint32(2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_4400
     * @tc.name testDataViewGetUintThirtyTwo0044
     * @tc.desc Verify getUint32 with 4-byte buffer at boundary offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint32(0, 999);
      let result = view.getUint32(0);
      expect(result).assertEqual(999);
       
      try {
        view.getUint32(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_5000
     * @tc.name testDataViewGetUintThirtyTwo0050
     * @tc.desc Verify getUint32 reads a value correctly under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 12345);
      const result = view.getUint32(0);
      expect(result).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U32_5100
     * @tc.name testDataViewGetUintThirtyTwo0051
     * @tc.desc Verify caught error object is an instance of Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintThirtyTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint32(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }

    });
  });
}
