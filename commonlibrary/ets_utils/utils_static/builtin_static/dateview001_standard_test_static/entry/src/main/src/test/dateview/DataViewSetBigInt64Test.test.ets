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

export default function DataViewSetBigInt64Test(): void {
  describe('DataViewSetBigInt64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0100
     * @tc.name testDataViewSetBigIntSixtyFour0001
     * @tc.desc Verify setBigInt64 with two required parameters byteOffset and value writing long value normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1234n);
      expect(view.getBigInt64(0).toString()).assertEqual("1234");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0200
     * @tc.name testDataViewSetBigIntSixtyFour0002
     * @tc.desc Verify setBigInt64 with three required parameters writing long value in little endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigInt64(0, 5678n, true);
      expect(view.getBigInt64(0, true).toString()).assertEqual("5678");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0300
     * @tc.name testDataViewSetBigIntSixtyFour0003
     * @tc.desc Verify setBigInt64 overload 3 with two required parameters without littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1234n);
      expect(view.getBigInt64(0).toString()).assertEqual("1234");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0400
     * @tc.name testDataViewSetBigIntSixtyFour0004
     * @tc.desc Verify setBigInt64 overload 3 with three parameters including littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 5678n, false);
      expect(view.getBigInt64(0, false).toString()).assertEqual("5678");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0500
     * @tc.name testDataViewSetBigIntSixtyFour0005
     * @tc.desc Verify setBigInt64 stores long-compatible value as BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);

      view.setBigInt64(0, 100n);
      const res = view.getBigInt64(0);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0700
     * @tc.name testDataViewSetBigIntSixtyFour0007
     * @tc.desc Verify setBigInt64 with byteOffset 0 writes at the start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigInt64(0, 100n);
      expect(view.getBigInt64(0).toString()).assertEqual("100");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0800
     * @tc.name testDataViewSetBigIntSixtyFour0008
     * @tc.desc Verify setBigInt64 with positive byteOffset writes at middle position within buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigInt64(8, 200n);
      expect(view.getBigInt64(8).toString()).assertEqual("200");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_0900
     * @tc.name testDataViewSetBigIntSixtyFour0009
     * @tc.desc Verify setBigInt64 with maximum valid byteOffset bufferLength minus 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigInt64(8, 999n);
      expect(view.getBigInt64(8).toString()).assertEqual("999");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1000
     * @tc.name testDataViewSetBigIntSixtyFour0010
     * @tc.desc Verify setBigInt64 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(-1, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1100
     * @tc.name testDataViewSetBigIntSixtyFour0011
     * @tc.desc Verify setBigInt64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(1, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1200
     * @tc.name testDataViewSetBigIntSixtyFour0012
     * @tc.desc Verify setBigInt64 returns expected result when byteOffset far exceeds buffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(1000, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1300
     * @tc.name testDataViewSetBigIntSixtyFour0013
     * @tc.desc Verify setBigInt64 with positive long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 12345n);
      expect(view.getBigInt64(0).toString()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1400
     * @tc.name testDataViewSetBigIntSixtyFour0014
     * @tc.desc Verify setBigInt64 with negative long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -5678n);
      expect(view.getBigInt64(0).toString()).assertEqual("-5678");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1500
     * @tc.name testDataViewSetBigIntSixtyFour0015
     * @tc.desc Verify setBigInt64 with zero long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 0n);
      expect(view.getBigInt64(0).toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1600
     * @tc.name testDataViewSetBigIntSixtyFour0016
     * @tc.desc Verify setBigInt64 with long maximum value 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 9223372036854775807n);
      expect(view.getBigInt64(0).toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1700
     * @tc.name testDataViewSetBigIntSixtyFour0017
     * @tc.desc Verify setBigInt64 with long minimum value -9223372036854775808
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -9223372036854775808n);
      expect(view.getBigInt64(0).toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1800
     * @tc.name testDataViewSetBigIntSixtyFour0018
     * @tc.desc Verify setBigInt64 with -1n all-ones bit pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -1n);
      expect(view.getBigInt64(0).toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_1900
     * @tc.name testDataViewSetBigIntSixtyFour0019
     * @tc.desc Verify setBigInt64 with byteOffset 0 and littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 4096n, true);
      expect(view.getBigInt64(0, true).toString()).assertEqual("4096");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2000
     * @tc.name testDataViewSetBigIntSixtyFour0020
     * @tc.desc Verify setBigInt64 with positive long value and littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 65536n, false);
      expect(view.getBigInt64(0, false).toString()).assertEqual("65536");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2100
     * @tc.name testDataViewSetBigIntSixtyFour0021
     * @tc.desc Verify setBigInt64 with long maximum value in little endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 9223372036854775807n, true);
      expect(view.getBigInt64(0, true).toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2200
     * @tc.name testDataViewSetBigIntSixtyFour0022
     * @tc.desc Verify setBigInt64 with long minimum value in big endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -9223372036854775808n, false);
      expect(view.getBigInt64(0, false).toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2300
     * @tc.name testDataViewSetBigIntSixtyFour0023
     * @tc.desc Verify setBigInt64 with littleEndian true writes in little endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1n, true);
      expect(view.getBigInt64(0, true).toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2400
     * @tc.name testDataViewSetBigIntSixtyFour0024
     * @tc.desc Verify setBigInt64 with littleEndian false writes in big endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1n, false);
      expect(view.getBigInt64(0, false).toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2500
     * @tc.name testDataViewSetBigIntSixtyFour0025
     * @tc.desc Verify big endian and little endian write produce different byte patterns for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      view1.setBigInt64(0, 255n, false);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view2.setBigInt64(0, 255n, true);
      expect(view1.getBigInt64(0, false).toString()).assertEqual("255");
      expect(view2.getBigInt64(0, true).toString()).assertEqual("255");
      expect(view1.getBigInt64(0, true).toString() === view2.getBigInt64(0, true).toString()).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2700
     * @tc.name testDataViewSetBigIntSixtyFour0027
     * @tc.desc Verify setBigInt64 with negative bigint value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -5678n);
      expect(view.getBigInt64(0).toString()).assertEqual("-5678");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2800
     * @tc.name testDataViewSetBigIntSixtyFour0028
     * @tc.desc Verify setBigInt64 with zero bigint value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 0n);
      expect(view.getBigInt64(0).toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_2900
     * @tc.name testDataViewSetBigIntSixtyFour0029
     * @tc.desc Verify setBigInt64 with BigInt maximum 64-bit signed integer 9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 9223372036854775807n);
      expect(view.getBigInt64(0).toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3000
     * @tc.name testDataViewSetBigIntSixtyFour0030
     * @tc.desc Verify setBigInt64 with BigInt minimum 64-bit signed integer -9223372036854775808n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -9223372036854775808n);
      expect(view.getBigInt64(0).toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3100
     * @tc.name testDataViewSetBigIntSixtyFour0031
     * @tc.desc Verify setBigInt64 with -1n all-ones bit pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -1n);
      expect(view.getBigInt64(0).toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3200
     * @tc.name testDataViewSetBigIntSixtyFour0032
     * @tc.desc Verify setBigInt64 with 1n minimum positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1n);
      expect(view.getBigInt64(0).toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3300
     * @tc.name testDataViewSetBigIntSixtyFour0033
     * @tc.desc Verify setBigInt64 with -9223372036854775807n near minimum negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -9223372036854775807n);
      expect(view.getBigInt64(0).toString()).assertEqual("-9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3400
     * @tc.name testDataViewSetBigIntSixtyFour0034
     * @tc.desc Verify setBigInt64 with 9223372036854775806n maximum value minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 9223372036854775806n);
      expect(view.getBigInt64(0).toString()).assertEqual("9223372036854775806");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3500
     * @tc.name testDataViewSetBigIntSixtyFour0035
     * @tc.desc Verify setBigInt64 with large number 10000000000n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 10000000000n);
      expect(view.getBigInt64(0).toString()).assertEqual("10000000000");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3600
     * @tc.name testDataViewSetBigIntSixtyFour0036
     * @tc.desc Verify setBigInt64 returns expected result when bigint exceeds 64-bit signed range with 9223372036854775808n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 9223372036854775808n);
      expect(view.getBigInt64(0).toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3700
     * @tc.name testDataViewSetBigIntSixtyFour0037
     * @tc.desc Verify setBigInt64 returns expected result when bigint exceeds 64-bit signed range with -9223372036854775809n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, -9223372036854775809n);
      expect(view.getBigInt64(0).toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3800
     * @tc.name testDataViewSetBigIntSixtyFour0038
     * @tc.desc Verify setBigInt64 overload 3 omits littleEndian defaults to big endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 4096n);
      expect(view.getBigInt64(0).toString()).assertEqual("4096");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_3900
     * @tc.name testDataViewSetBigIntSixtyFour0039
     * @tc.desc Verify setBigInt64 overload 3 with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 4096n, true);
      expect(view.getBigInt64(0, true).toString()).assertEqual("4096");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4000
     * @tc.name testDataViewSetBigIntSixtyFour0040
     * @tc.desc Verify setBigInt64 overload 3 with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 4096n, false);
      expect(view.getBigInt64(0, false).toString()).assertEqual("4096");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4100
     * @tc.name testDataViewSetBigIntSixtyFour0041
     * @tc.desc Verify setBigInt64 overload 1 returns undefined as void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let result = view.setBigInt64(0, 100n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4200
     * @tc.name testDataViewSetBigIntSixtyFour0042
     * @tc.desc Verify setBigInt64 overload 2 returns undefined as void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let result = view.setBigInt64(0, 100n, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4300
     * @tc.name testDataViewSetBigIntSixtyFour0043
     * @tc.desc Verify setBigInt64 overload 3 returns undefined as void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let result = view.setBigInt64(0, 100n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4400
     * @tc.name testDataViewSetBigIntSixtyFour0044
     * @tc.desc Verify setBigInt64 overload 1 big endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 123456789n);
      let readVal = view.getBigInt64(0);
      expect(readVal.toString()).assertEqual("123456789");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4500
     * @tc.name testDataViewSetBigIntSixtyFour0045
     * @tc.desc Verify setBigInt64 overload 3 bigint big endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 987654321n);
      let readVal = view.getBigInt64(0);
      expect(readVal.toString()).assertEqual("987654321");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4600
     * @tc.name testDataViewSetBigIntSixtyFour0046
     * @tc.desc Verify setBigInt64 overload 2 little endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 123456789n, true);
      let readVal = view.getBigInt64(0, true);
      expect(readVal.toString()).assertEqual("123456789");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4700
     * @tc.name testDataViewSetBigIntSixtyFour0047
     * @tc.desc Verify setBigInt64 overload 3 bigint little endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 987654321n, true);
      let readVal = view.getBigInt64(0, true);
      expect(readVal.toString()).assertEqual("987654321");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4800
     * @tc.name testDataViewSetBigIntSixtyFour0048
     * @tc.desc Verify big endian write read with little endian produces different value confirming byte order effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 1n, false);
      let bigEndianRead = view.getBigInt64(0, false);
      let littleEndianRead = view.getBigInt64(0, true);
      expect(bigEndianRead.toString()).assertEqual("1");
      expect(littleEndianRead.toString() === "1").assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_4900
     * @tc.name testDataViewSetBigIntSixtyFour0049
     * @tc.desc Verify long and bigint write same value produce consistent read result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      view1.setBigInt64(0, 12345n);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view2.setBigInt64(0, 12345n);
      expect(view1.getBigInt64(0).toString()).assertEqual(view2.getBigInt64(0).toString());
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5000
     * @tc.name testDataViewSetBigIntSixtyFour0050
     * @tc.desc Verify negative long and bigint write same value produce consistent read result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      view1.setBigInt64(0, -99999n);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view2.setBigInt64(0, -99999n);
      expect(view1.getBigInt64(0).toString()).assertEqual(view2.getBigInt64(0).toString());
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5100
     * @tc.name testDataViewSetBigIntSixtyFour0051
     * @tc.desc Verify boundary value 9223372036854775807 long and bigint produce consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      view1.setBigInt64(0, 9223372036854775807n);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view2.setBigInt64(0, 9223372036854775807n);
      expect(view1.getBigInt64(0).toString()).assertEqual(view2.getBigInt64(0).toString());
      expect(view1.getBigInt64(0).toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5200
     * @tc.name testDataViewSetBigIntSixtyFour0052
     * @tc.desc Verify writing same position multiple times overwrites previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigInt64(0, 100n);
      view.setBigInt64(0, 200n);
      expect(view.getBigInt64(0).toString()).assertEqual("200");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5300
     * @tc.name testDataViewSetBigIntSixtyFour0053
     * @tc.desc Verify writing at different positions does not overwrite each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigInt64(0, 100n);
      view.setBigInt64(8, 200n);
      expect(view.getBigInt64(0).toString()).assertEqual("100");
      expect(view.getBigInt64(8).toString()).assertEqual("200");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5500
     * @tc.name testDataViewSetBigIntSixtyFour0055
     * @tc.desc Verify setBigInt64 throws RangeError when byteOffset equals bufferLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(8, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5600
     * @tc.name testDataViewSetBigIntSixtyFour0056
     * @tc.desc Verify setBigInt64 returns expected result when byteOffset far greater than bufferLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(100000, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5700
     * @tc.name testDataViewSetBigIntSixtyFour0057
     * @tc.desc Verify setBigInt64 returns expected result when byteOffset is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(-1, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5800
     * @tc.name testDataViewSetBigIntSixtyFour0058
     * @tc.desc Verify setBigInt64 returns expected result when byteOffset is large negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(-100, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_5900
     * @tc.name testDataViewSetBigIntSixtyFour0059
     * @tc.desc Verify setBigInt64 throws RangeError when buffer is only 7 bytes cannot fit BigInt64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(7);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(0, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6000
     * @tc.name testDataViewSetBigIntSixtyFour0060
     * @tc.desc Verify setBigInt64 returns expected result when buffer is 0 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(0);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(0, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6100
     * @tc.name testDataViewSetBigIntSixtyFour0061
     * @tc.desc Verify try block normal write does not enter catch executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setBigInt64(0, 42n);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(view.getBigInt64(0).toString()).assertEqual("42");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6200
     * @tc.name testDataViewSetBigIntSixtyFour0062
     * @tc.desc Verify try block out-of-bounds write returns expected result enters catch still executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setBigInt64(0, 42n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6300
     * @tc.name testDataViewSetBigIntSixtyFour0063
     * @tc.desc Verify overload 1 out-of-bounds write returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(5, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6400
     * @tc.name testDataViewSetBigIntSixtyFour0064
     * @tc.desc Verify overload 2 out-of-bounds write returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(5, 100n, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6500
     * @tc.name testDataViewSetBigIntSixtyFour0065
     * @tc.desc Verify overload 3 out-of-bounds write returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.setBigInt64(5, 100n, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6600
     * @tc.name testDataViewSetBigIntSixtyFour0066
     * @tc.desc Verify DataView with offset construction and setBigInt64 byteOffset combined out-of-bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf, 8, 8);
       
      try {
        view.setBigInt64(4, 100n);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BI64_6700
     * @tc.name testDataViewSetBigIntSixtyFour0067
     * @tc.desc Verify DataView with offset construction and valid byteOffset exactly fits 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigIntSixtyFour0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf, 8, 8);
      view.setBigInt64(0, 100n);
      expect(view.getBigInt64(0).toString()).assertEqual("100");
    });
  });
}
