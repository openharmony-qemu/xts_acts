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

export default function DataViewGetBigUint64Test(): void {
  describe('DataViewGetBigUint64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0100
     * @tc.name testDataViewGetBigUintSixtyfour0001
     * @tc.desc Verify getBigUint64 with required byteOffset parameter reads normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0300
     * @tc.name testDataViewGetBigUintSixtyfour0003
     * @tc.desc Verify getBigUint64 with byteOffset and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 5678n, false);
      let result = view.getBigUint64(0, false);
      expect(result).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0400
     * @tc.name testDataViewGetBigUintSixtyfour0004
     * @tc.desc Verify getBigUint64 with byteOffset and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 5678n, true);
      let result = view.getBigUint64(0, true);
      expect(result).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0500
     * @tc.name testDataViewGetBigUintSixtyfour0005
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getBigUint64(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0600
     * @tc.name testDataViewGetBigUintSixtyfour0006
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset has insufficient bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 100n);
      try {
        view.getBigUint64(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0800
     * @tc.name testDataViewGetBigUintSixtyfour0008
     * @tc.desc Verify getBigUint64 reads from positive byteOffset at non-zero position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 4321n);
      let result = view.getBigUint64(8);
      expect(result).assertEqual(4321n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_0900
     * @tc.name testDataViewGetBigUintSixtyfour0009
     * @tc.desc Verify getBigUint64 at minimum valid byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 0n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1000
     * @tc.name testDataViewGetBigUintSixtyfour0010
     * @tc.desc Verify getBigUint64 at maximum valid byteOffset bufferLength minus 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 111n);
      let result = view.getBigUint64(8);
      expect(result).assertEqual(111n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1100
     * @tc.name testDataViewGetBigUintSixtyfour0011
     * @tc.desc Verify getBigUint64 returns expected result when byteOffset is bufferLength minus 7 with insufficient bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getBigUint64(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1300
     * @tc.name testDataViewGetBigUintSixtyfour0013
     * @tc.desc Verify getBigUint64 returns expected result when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getBigUint64(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1400
     * @tc.name testDataViewGetBigUintSixtyfour0014
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset has insufficient bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getBigUint64(9);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1500
     * @tc.name testDataViewGetBigUintSixtyfour0015
     * @tc.desc Verify getBigUint64 throws IndexOutOfBoundsError when byteOffset exceeds int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getBigUint64(2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1600
     * @tc.name testDataViewGetBigUintSixtyfour0016
     * @tc.desc Verify getBigUint64 reads with littleEndian=true in little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 12345678n, true);
      let result = view.getBigUint64(0, true);
      expect(result).assertEqual(12345678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1700
     * @tc.name testDataViewGetBigUintSixtyfour0017
     * @tc.desc Verify getBigUint64 reads with littleEndian=false in big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 12345678n, false);
      let result = view.getBigUint64(0, false);
      expect(result).assertEqual(12345678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1800
     * @tc.name testDataViewGetBigUintSixtyfour0018
     * @tc.desc Verify getBigUint64 defaults to big-endian when littleEndian is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 99999n, false);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(99999n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_1900
     * @tc.name testDataViewGetBigUintSixtyfour0019
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 100n);
      try {
        view.getBigUint64(8);
		    expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2200
     * @tc.name testDataViewGetBigUintSixtyfour0022
     * @tc.desc Verify getBigUint64 reads a large unsigned 64-bit integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 9007199254740993n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(9007199254740993n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2300
     * @tc.name testDataViewGetBigUintSixtyfour0023
     * @tc.desc Verify getBigUint64 returns same value when writing and reading with same endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 98765n, false);
      let bigEndian = view.getBigUint64(0, false);
      view.setBigUint64(0, 98765n, true);
      let littleEndian = view.getBigUint64(0, true);
      expect(bigEndian).assertEqual(littleEndian);
      expect(bigEndian).assertEqual(98765n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2400
     * @tc.name testDataViewGetBigUintSixtyfour0024
     * @tc.desc Verify getBigUint64 returns different value when endianness mismatch between write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 1n, false);
      let bigEndianRead = view.getBigUint64(0, false);
      let littleEndianRead = view.getBigUint64(0, true);
      expect(bigEndianRead !== littleEndianRead).assertTrue();
      expect(bigEndianRead).assertEqual(1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2600
     * @tc.name testDataViewGetBigUintSixtyfour0026
     * @tc.desc Verify getBigUint64 reads 1n as minimum positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 1n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2700
     * @tc.name testDataViewGetBigUintSixtyfour0027
     * @tc.desc Verify getBigUint64 reads 18446744073709551615n as uint64 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2800
     * @tc.name testDataViewGetBigUintSixtyfour0028
     * @tc.desc Verify getBigUint64 reads 9223372036854775808n as int64 max plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 9223372036854775808n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_2900
     * @tc.name testDataViewGetBigUintSixtyfour0029
     * @tc.desc Verify getBigUint64 reads 9223372036854775807n as int64 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 9223372036854775807n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3000
     * @tc.name testDataViewGetBigUintSixtyfour0030
     * @tc.desc Verify getBigUint64 reads max value with all bytes 0xFF in both endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n, true);
      let result = view.getBigUint64(0, true);
      expect(result).assertEqual(18446744073709551615n);
      view.setBigUint64(0, 18446744073709551615n, false);
      result = view.getBigUint64(0, false);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3200
     * @tc.name testDataViewGetBigUintSixtyfour0032
     * @tc.desc Verify getBigUint64 return value is not equal to number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n);
      let result = view.getBigUint64(0);
      expect(result === 1234n).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3300
     * @tc.name testDataViewGetBigUintSixtyfour0033
     * @tc.desc Verify getBigUint64 returns max unsigned value when writing -1n interpreted as twos complement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, -1n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(18446744073709551615n);
      expect(result >= 0n).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3400
     * @tc.name testDataViewGetBigUintSixtyfour0034
     * @tc.desc Verify getBigUint64 returns non-negative values for multiple positive inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let testValues: bigint[] = [0n, 1n, 255n, 65535n, 4294967295n, 18446744073709551615n];
      for (let val of testValues) {
        view.setBigUint64(0, val);
        let result = view.getBigUint64(0);
        expect(result >= 0n).assertTrue();
        expect(result).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3500
     * @tc.name testDataViewGetBigUintSixtyfour0035
     * @tc.desc Verify getBigUint64 reads from different offsets in the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(24);
      const view = new DataView(buf);
      view.setBigUint64(0, 111n);
      view.setBigUint64(8, 222n);
      view.setBigUint64(16, 333n);
      expect(view.getBigUint64(0)).assertEqual(111n);
      expect(view.getBigUint64(8)).assertEqual(222n);
      expect(view.getBigUint64(16)).assertEqual(333n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3600
     * @tc.name testDataViewGetBigUintSixtyfour0036
     * @tc.desc Verify getBigUint64 reads successfully from minimum 8-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 42n);
      let result = view.getBigUint64(0);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3700
     * @tc.name testDataViewGetBigUintSixtyfour0037
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset plus 8 exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getBigUint64(2);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }       
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_3800
     * @tc.name testDataViewGetBigUintSixtyfour0038
     * @tc.desc Verify getBigUint64 throws RangeError when buffer is smaller than 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getBigUint64(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');         
      }       
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_4100
     * @tc.name testDataViewGetBigUintSixtyfour0041
     * @tc.desc Verify getBigUint64 succeeds in try block without entering catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 5000n);
      let result: bigint = 0n;
      result = view.getBigUint64(0);
      expect(result).assertEqual(5000n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_4300
     * @tc.name testDataViewGetBigUintSixtyfour0043
     * @tc.desc Verify getBigUint64 throws a RangeError when reading beyond the buffer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const buf = new ArrayBuffer(8);
        const view = new DataView(buf);
        view.setBigUint64(0, 100n);
        view.getBigUint64(0);
        view.getBigUint64(999);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_4500
     * @tc.name testDataViewGetBigUintSixtyfour0045
     * @tc.desc Verify getBigUint64 throws RangeError when byteOffset equals bufferLength minus 1 with insufficient bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getBigUint64(15);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BU64_4600
     * @tc.name testDataViewGetBigUintSixtyfour0046
     * @tc.desc Verify getBigUint64 reads successfully when byteOffset equals bufferLength minus 8 as exact boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigUintSixtyfour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 777n);
      let result = view.getBigUint64(8);
      expect(result).assertEqual(777n);
    });
  });
}
