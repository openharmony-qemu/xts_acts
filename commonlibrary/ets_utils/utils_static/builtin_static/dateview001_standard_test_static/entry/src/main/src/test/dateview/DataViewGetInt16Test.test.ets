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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function DataViewGetInt16Test(): void {
  describe('DataViewGetInt16Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0100
     * @tc.name testDataViewGetIntSixteen0001
     * @tc.desc Verify getInt16 with one parameter using default byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 100);
      let result = view.getInt16(0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0200
     * @tc.name testDataViewGetIntSixteen0002
     * @tc.desc Verify getInt16 with two parameters using specified byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 100, false);
      let result = view.getInt16(0, false);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0300
     * @tc.name testDataViewGetIntSixteen0003
     * @tc.desc Verify getInt16 with undefined as second parameter is equivalent to omission
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 200);
      let result = view.getInt16(0, undefined);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0400
     * @tc.name testDataViewGetIntSixteen0004
     * @tc.desc Verify getInt16 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0700
     * @tc.name testDataViewGetIntSixteen0007
     * @tc.desc Verify getInt16 with byteOffset 1 reads from offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(1, 5678);
      expect(view.getInt16(1)).assertEqual(5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0800
     * @tc.name testDataViewGetIntSixteen0008
     * @tc.desc Verify getInt16 with byteOffset 2 reads from offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(2, 9999);
      expect(view.getInt16(2)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_0900
     * @tc.name testDataViewGetIntSixteen0009
     * @tc.desc Verify getInt16 with maximum valid byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(2, 32767);
      expect(view.getInt16(2)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1000
     * @tc.name testDataViewGetIntSixteen0010
     * @tc.desc Verify getInt16 on minimum 2-byte buffer with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setInt16(0, -100);
      expect(view.getInt16(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1100
     * @tc.name testDataViewGetIntSixteen0011
     * @tc.desc Verify getInt16 returns expected result when byteOffset exceeds buffer by 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(3);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1200
     * @tc.name testDataViewGetIntSixteen0012
     * @tc.desc Verify getInt16 returns expected result when byteOffset equals bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1300
     * @tc.name testDataViewGetIntSixteen0013
     * @tc.desc Verify getInt16 returns expected result when byteOffset is far greater than bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(1000);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1400
     * @tc.name testDataViewGetIntSixteen0014
     * @tc.desc Verify getInt16 returns expected result with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1500
     * @tc.name testDataViewGetIntSixteen0015
     * @tc.desc Verify getInt16 returns expected result with negative byteOffset -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(-32768);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1600
     * @tc.name testDataViewGetIntSixteen0016
     * @tc.desc Verify getInt16 returns expected result with int max value as byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1700
     * @tc.name testDataViewGetIntSixteen0017
     * @tc.desc Verify getInt16 returns expected result with int min value as byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1800
     * @tc.name testDataViewGetIntSixteen0018
     * @tc.desc Verify getInt16 with byteOffset 0 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258, true);
      expect(view.getInt16(0, true)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_1900
     * @tc.name testDataViewGetIntSixteen0019
     * @tc.desc Verify getInt16 with byteOffset 0 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258, false);
      expect(view.getInt16(0, false)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2000
     * @tc.name testDataViewGetIntSixteen0020
     * @tc.desc Verify getInt16 with byteOffset 1 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setInt16(1, 1024, true);
      expect(view.getInt16(1, true)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2100
     * @tc.name testDataViewGetIntSixteen0021
     * @tc.desc Verify getInt16 with byteOffset 2 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setInt16(2, 4096, false);
      expect(view.getInt16(2, false)).assertEqual(4096);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2200
     * @tc.name testDataViewGetIntSixteen0022
     * @tc.desc Verify getInt16 with maximum valid byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(2, -100, true);
      expect(view.getInt16(2, true)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2300
     * @tc.name testDataViewGetIntSixteen0023
     * @tc.desc Verify getInt16 returns expected result with out-of-range byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(3, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2400
     * @tc.name testDataViewGetIntSixteen0024
     * @tc.desc Verify getInt16 returns expected result with out-of-range byteOffset and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(4, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2500
     * @tc.name testDataViewGetIntSixteen0025
     * @tc.desc Verify getInt16 returns expected result with negative byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(-1, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2600
     * @tc.name testDataViewGetIntSixteen0026
     * @tc.desc Verify getInt16 with littleEndian true reads in little-endian order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 1, true);
      expect(view.getInt16(0, true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_2700
     * @tc.name testDataViewGetIntSixteen0027
     * @tc.desc Verify getInt16 with littleEndian false reads in big-endian order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 1, false);
      expect(view.getInt16(0, false)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3300
     * @tc.name testDataViewGetIntSixteen0033
     * @tc.desc Verify getInt16 reads negative integer -500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, -500);
      expect(view.getInt16(0)).assertEqual(-500);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3400
     * @tc.name testDataViewGetIntSixteen0034
     * @tc.desc Verify getInt16 reads positive integer 258
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258);
      expect(view.getInt16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3500
     * @tc.name testDataViewGetIntSixteen0035
     * @tc.desc Verify getInt16 big-endian write read with different endianness produces different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258, false);
      let bigEndian = view.getInt16(0, false);
      let littleEndian = view.getInt16(0, true);
      expect(bigEndian).assertEqual(258);
      expect(littleEndian !== 258).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3700
     * @tc.name testDataViewGetIntSixteen0037
     * @tc.desc Verify getInt16 byte order swap produces expected value 258 to 513
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258, true);
      let littleEndian = view.getInt16(0, true);
      let bigEndian = view.getInt16(0, false);
      expect(littleEndian).assertEqual(258);
      expect(bigEndian).assertEqual(513);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3800
     * @tc.name testDataViewGetIntSixteen0038
     * @tc.desc Verify getInt16 with same endianness for write and read produces consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 12345, true);
      expect(view.getInt16(0, true)).assertEqual(12345);
      view.setInt16(0, 12345, false);
      expect(view.getInt16(0, false)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_3900
     * @tc.name testDataViewGetIntSixteen0039
     * @tc.desc Verify getInt16 returns consistent results on multiple reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 7777);
      let r1 = view.getInt16(0);
      let r2 = view.getInt16(0);
      let r3 = view.getInt16(0);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(7777);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4000
     * @tc.name testDataViewGetIntSixteen0040
     * @tc.desc Verify getInt16 reads from different offsets in same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setInt16(0, 111);
      view.setInt16(2, 222);
      view.setInt16(4, 333);
      view.setInt16(6, 444);
      expect(view.getInt16(0)).assertEqual(111);
      expect(view.getInt16(2)).assertEqual(222);
      expect(view.getInt16(4)).assertEqual(333);
      expect(view.getInt16(6)).assertEqual(444);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4100
     * @tc.name testDataViewGetIntSixteen0041
     * @tc.desc Verify getInt16 reads value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 0);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4300
     * @tc.name testDataViewGetIntSixteen0043
     * @tc.desc Verify getInt16 reads int16 maximum positive value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 32767);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4400
     * @tc.name testDataViewGetIntSixteen0044
     * @tc.desc Verify getInt16 reads int16 minimum value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, -32768);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4500
     * @tc.name testDataViewGetIntSixteen0045
     * @tc.desc Verify getInt16 reads values 1 and -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 1);
      expect(view.getInt16(0)).assertEqual(1);
      view.setInt16(0, -1);
      expect(view.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4600
     * @tc.name testDataViewGetIntSixteen0046
     * @tc.desc Verify getInt16 reads values 256 and 257 near byte boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 256);
      expect(view.getInt16(0)).assertEqual(256);
      view.setInt16(0, 257);
      expect(view.getInt16(0)).assertEqual(257);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4700
     * @tc.name testDataViewGetIntSixteen0047
     * @tc.desc Verify getInt16 reads positive and negative 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 255);
      expect(view.getInt16(0)).assertEqual(255);
      view.setInt16(0, -255);
      expect(view.getInt16(0)).assertEqual(-255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4800
     * @tc.name testDataViewGetIntSixteen0048
     * @tc.desc Verify getInt16 reads int16 boundary values 32767 and -32768 in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 32767, false);
      expect(view.getInt16(0, false)).assertEqual(32767);
      view.setInt16(0, -32768, false);
      expect(view.getInt16(0, false)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_4900
     * @tc.name testDataViewGetIntSixteen0049
     * @tc.desc Verify getInt16 reads int16 boundary values 32767 and -32768 in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 32767, true);
      expect(view.getInt16(0, true)).assertEqual(32767);
      view.setInt16(0, -32768, true);
      expect(view.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_5000
     * @tc.name testDataViewGetIntSixteen0050
     * @tc.desc Verify getInt16 reads 0 from uninitialized buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_5200
     * @tc.name testDataViewGetIntSixteen0052
     * @tc.desc Verify getInt16 return value has no decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 12345);
      let result = view.getInt16(0);
      expect(result).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_5400
     * @tc.name testDataViewGetIntSixteen0054
     * @tc.desc Verify getInt16 return value toString() works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 258);
      let result = view.getInt16(0);
      expect(result.toString()).assertEqual("258");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_5500
     * @tc.name testDataViewGetIntSixteen0055
     * @tc.desc Verify getInt16 reads consecutive boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setInt16(0, 32766);
      view.setInt16(2, 32767);
      view.setInt16(4, -32767);
      view.setInt16(6, -32768);
      expect(view.getInt16(0)).assertEqual(32766);
      expect(view.getInt16(2)).assertEqual(32767);
      expect(view.getInt16(4)).assertEqual(-32767);
      expect(view.getInt16(6)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_5600
     * @tc.name testDataViewGetIntSixteen0056
     * @tc.desc Verify getInt16 overflow from 32767 to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setInt16(0, 32767);
      let maxVal = view.getInt16(0);
      expect(maxVal).assertEqual(32767);
      view.setInt16(0, -32768);
      let minVal = view.getInt16(0);
      expect(minVal).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_6000
     * @tc.name testDataViewGetIntSixteen0060
     * @tc.desc Verify getInt16 reads normally from 2-byte buffer with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setInt16(0, 123);
      expect(view.getInt16(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_6100
     * @tc.name testDataViewGetIntSixteen0061
     * @tc.desc Verify getInt16 returns expected result from 2-byte buffer with byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      try {
        view.getInt16(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_6200
     * @tc.name testDataViewGetIntSixteen0062
     * @tc.desc Verify getInt16 returns expected result from 1-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(1);
      const view = new DataView(buf);
      try {
        view.getInt16(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_6300
     * @tc.name testDataViewGetIntSixteen0063
     * @tc.desc Verify getInt16 returns expected result from 0-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(0);
      const view = new DataView(buf);
      try {
        view.getInt16(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_I16_6500
     * @tc.name testDataViewGetIntSixteen0065
     * @tc.desc Verify getInt16 returns expected result with byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetIntSixteen0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getInt16(-100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
