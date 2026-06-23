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

export default function DataViewGetUint16Test(): void {
  describe('DataViewGetUint16Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0100
     * @tc.name testDataViewGetUintSixteen0001
     * @tc.desc Verify getUint16 with one parameter using default byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 258);
      let result = view.getUint16(0);
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0200
     * @tc.name testDataViewGetUintSixteen0002
     * @tc.desc Verify getUint16 with two parameters specifying byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 65535, true);
      let result = view.getUint16(0, true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0300
     * @tc.name testDataViewGetUintSixteen0003
     * @tc.desc Verify getUint16 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0600
     * @tc.name testDataViewGetUintSixteen0006
     * @tc.desc Verify getUint16 with middle byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(2, 5678);
      let result = view.getUint16(2);
      expect(result).assertEqual(5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0700
     * @tc.name testDataViewGetUintSixteen0007
     * @tc.desc Verify getUint16 with maximum valid byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(2, 65535);
      let result = view.getUint16(2);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0800
     * @tc.name testDataViewGetUintSixteen0008
     * @tc.desc Verify getUint16 returns expected result when buffer is too small for uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(1);
      const view = new DataView(buf);
       
      try {
        view.getUint16(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_0900
     * @tc.name testDataViewGetUintSixteen0009
     * @tc.desc Verify getUint16 with byteOffset exactly bufferSize minus 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setUint16(0, 32768);
      let result = view.getUint16(0);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1000
     * @tc.name testDataViewGetUintSixteen0010
     * @tc.desc Verify getUint16 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1100
     * @tc.name testDataViewGetUintSixteen0011
     * @tc.desc Verify getUint16 returns expected result when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1200
     * @tc.name testDataViewGetUintSixteen0012
     * @tc.desc Verify getUint16 returns expected result when remaining space is less than 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(3);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1500
     * @tc.name testDataViewGetUintSixteen0015
     * @tc.desc Verify getUint16 returns expected result when byteOffset is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(1, 100);
      let result = view.getUint16(1);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1600
     * @tc.name testDataViewGetUintSixteen0016
     * @tc.desc Verify getUint16 with byteOffset 0 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 258, true);
      let result = view.getUint16(0, true);
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1700
     * @tc.name testDataViewGetUintSixteen0017
     * @tc.desc Verify getUint16 with byteOffset 0 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 258, false);
      let result = view.getUint16(0, false);
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_1900
     * @tc.name testDataViewGetUintSixteen0019
     * @tc.desc Verify getUint16 with littleEndian explicitly true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 4096, true);
      let result = view.getUint16(0, true);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2000
     * @tc.name testDataViewGetUintSixteen0020
     * @tc.desc Verify getUint16 with littleEndian explicitly false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 4096, false);
      let result = view.getUint16(0, false);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2100
     * @tc.name testDataViewGetUintSixteen0021
     * @tc.desc Verify getUint16 with max valid byteOffset and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(2, 65535, true);
      let result = view.getUint16(2, true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2200
     * @tc.name testDataViewGetUintSixteen0022
     * @tc.desc Verify getUint16 returns expected result when byteOffset out of bounds with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(3, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2300
     * @tc.name testDataViewGetUintSixteen0023
     * @tc.desc Verify getUint16 returns expected result with negative byteOffset and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(-1, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2600
     * @tc.name testDataViewGetUintSixteen0026
     * @tc.desc Verify getUint16 returns correct value 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 32768);
      let result = view.getUint16(0);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2700
     * @tc.name testDataViewGetUintSixteen0027
     * @tc.desc Verify getUint16 returns different results for big-endian and little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 0x0102, false);
      let bigEndian = view.getUint16(0, false);
      let littleEndian = view.getUint16(0, true);
      expect(bigEndian).assertEqual(0x0102);
      expect(littleEndian).assertEqual(0x0201);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2800
     * @tc.name testDataViewGetUintSixteen0028
     * @tc.desc Verify getUint16 little-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 4660, true);
      let result = view.getUint16(0, true);
      expect(result).assertEqual(4660);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_2900
     * @tc.name testDataViewGetUintSixteen0029
     * @tc.desc Verify getUint16 big-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 4660, false);
      let result = view.getUint16(0, false);
      expect(result).assertEqual(4660);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3000
     * @tc.name testDataViewGetUintSixteen0030
     * @tc.desc Verify getUint16 returns 0 as minimum unsigned 16-bit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 0);
      let result = view.getUint16(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3100
     * @tc.name testDataViewGetUintSixteen0031
     * @tc.desc Verify getUint16 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 1);
      let result = view.getUint16(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3300
     * @tc.name testDataViewGetUintSixteen0033
     * @tc.desc Verify getUint16 returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 255);
      let result = view.getUint16(0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3500
     * @tc.name testDataViewGetUintSixteen0035
     * @tc.desc Verify getUint16 returns 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 512);
      let result = view.getUint16(0);
      expect(result).assertEqual(512);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3700
     * @tc.name testDataViewGetUintSixteen0037
     * @tc.desc Verify getUint16 returns 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 2048);
      let result = view.getUint16(0);
      expect(result).assertEqual(2048);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_3800
     * @tc.name testDataViewGetUintSixteen0038
     * @tc.desc Verify getUint16 returns 4096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 4096);
      let result = view.getUint16(0);
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_4400
     * @tc.name testDataViewGetUintSixteen0044
     * @tc.desc Verify getUint16 returns expected result with byteOffset beyond buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(5);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_4700
     * @tc.name testDataViewGetUintSixteen0047
     * @tc.desc Verify getUint16 returns expected result with byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getUint16(-100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_4900
     * @tc.name testDataViewGetUintSixteen0049
     * @tc.desc Verify getUint16 returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 5000);
      let result = view.getUint16(0);
      expect(result).assertEqual(5000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_5000
     * @tc.name testDataViewGetUintSixteen0050
     * @tc.desc Verify getUint16 returns value in valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint16(0, 30000);
      let result = view.getUint16(0);
      expect(result).assertEqual(30000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_U16_5100
     * @tc.name testDataViewGetUintSixteen0051
     * @tc.desc Verify getUint16 returns expected result on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetUintSixteen0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(0);
      const view = new DataView(buf);
       
      try {
        view.getUint16(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

  });
}
