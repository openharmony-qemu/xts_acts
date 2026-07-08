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

export default function DataViewGetBigInt64Test(): void {
  describe('DataViewGetBigInt64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0100
     * @tc.name testDataViewGetBigIntSixtyfour0001
     * @tc.desc Verify getBigInt64 with required byteOffset reads signed 64-bit integer by default byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1234n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0200
     * @tc.name testDataViewGetBigIntSixtyfour0002
     * @tc.desc Verify getBigInt64 with byteOffset 0 reads default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0300
     * @tc.name testDataViewGetBigIntSixtyfour0003
     * @tc.desc Verify getBigInt64 reads with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1234n);
      let result = view.getBigInt64(0, false);
      expect(result).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0500
     * @tc.name testDataViewGetBigIntSixtyfour0005
     * @tc.desc Verify getBigInt64 reads from second 8-byte position when byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(8, 2048n);
      let result = view.getBigInt64(8);
      expect(result).assertEqual(2048n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0600
     * @tc.name testDataViewGetBigIntSixtyfour0006
     * @tc.desc Verify getBigInt64 reads at last valid offset for 8 bytes in 16-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(8, 123456n);
      let result = view.getBigInt64(8);
      expect(result).assertEqual(123456n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0700
     * @tc.name testDataViewGetBigIntSixtyfour0007
     * @tc.desc Verify getBigInt64 at minimum valid offset in 8-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigInt64(0, -100n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0800
     * @tc.name testDataViewGetBigIntSixtyfour0008
     * @tc.desc Verify getBigInt64 throws RangeError when byteOffset is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_0900
     * @tc.name testDataViewGetBigIntSixtyfour0009
     * @tc.desc Verify getBigInt64 throws RangeError when byteOffset is int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1200
     * @tc.name testDataViewGetBigIntSixtyfour0012
     * @tc.desc Verify getBigInt64 with only byteOffset defaults littleEndian to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1024n, false);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1300
     * @tc.name testDataViewGetBigIntSixtyfour0013
     * @tc.desc Verify getBigInt64 with byteOffset and littleEndian=true reads in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1024n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1400
     * @tc.name testDataViewGetBigIntSixtyfour0014
     * @tc.desc Verify getBigInt64 with byteOffset and littleEndian=false reads in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1024n, false);
      let result = view.getBigInt64(0, false);
      expect(result).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1600
     * @tc.name testDataViewGetBigIntSixtyfour0016
     * @tc.desc Verify getBigInt64 with byteOffset 0 and littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 512n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(512n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1700
     * @tc.name testDataViewGetBigIntSixtyfour0017
     * @tc.desc Verify getBigInt64 with byteOffset 8 and littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(8, 4096n, true);
      let result = view.getBigInt64(8, true);
      expect(result).assertEqual(4096n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1800
     * @tc.name testDataViewGetBigIntSixtyfour0018
     * @tc.desc Verify getBigInt64 at last valid offset with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(8, 65536n, true);
      let result = view.getBigInt64(8, true);
      expect(result).assertEqual(65536n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_1900
     * @tc.name testDataViewGetBigIntSixtyfour0019
     * @tc.desc Verify getBigInt64 at only valid offset in 8-byte buffer with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigInt64(0, 100n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2000
     * @tc.name testDataViewGetBigIntSixtyfour0020
     * @tc.desc Verify getBigInt64 throws RangeError with negative byteOffset and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(-1, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2100
     * @tc.name testDataViewGetBigIntSixtyfour0021
     * @tc.desc Verify getBigInt64 returns expected result with byteOffset 0 with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        let result = view.getBigInt64(0, true);
        expect(result).assertEqual(0n);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2200
     * @tc.name testDataViewGetBigIntSixtyfour0022
     * @tc.desc Verify getBigInt64 returns expected result with byteOffset 0 with littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        let result = view.getBigInt64(0, false);
        expect(result).assertEqual(0n);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2300
     * @tc.name testDataViewGetBigIntSixtyfour0023
     * @tc.desc Verify getBigInt64 reads in little-endian when littleEndian is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 256n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(256n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2500
     * @tc.name testDataViewGetBigIntSixtyfour0025
     * @tc.desc Verify getBigInt64 defaults littleEndian to false when not provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 256n, false);
      let result1 = view.getBigInt64(0);
      let result2 = view.getBigInt64(0, false);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2600
     * @tc.name testDataViewGetBigIntSixtyfour0026
     * @tc.desc Verify getBigInt64 returns expected result when littleEndian is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const expectVal = 1024n;
      view.setBigInt64(0, expectVal);
      let result = view.getBigInt64(0, false);
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2700
     * @tc.name testDataViewGetBigIntSixtyfour0027
     * @tc.desc Verify getBigInt64 treats undefined littleEndian as default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1024n, false);
      let result = view.getBigInt64(0, undefined);
      expect(result).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_2900
     * @tc.name testDataViewGetBigIntSixtyfour0029
     * @tc.desc Verify getBigInt64 reads normal negative bigint value -100n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, -100n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3000
     * @tc.name testDataViewGetBigIntSixtyfour0030
     * @tc.desc Verify getBigInt64 reads from non-zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(24);
      const view = new DataView(buffer);
      view.setBigInt64(8, 32767n);
      let result = view.getBigInt64(8);
      expect(result).assertEqual(32767n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3100
     * @tc.name testDataViewGetBigIntSixtyfour0031
     * @tc.desc Verify getBigInt64 reads zero value 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 0n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3200
     * @tc.name testDataViewGetBigIntSixtyfour0032
     * @tc.desc Verify getBigInt64 reads minimum positive value 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3300
     * @tc.name testDataViewGetBigIntSixtyfour0033
     * @tc.desc Verify getBigInt64 reads -1n with all-ones bit pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, -1n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3400
     * @tc.name testDataViewGetBigIntSixtyfour0034
     * @tc.desc Verify getBigInt64 reads signed 64-bit maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 9223372036854775807n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3500
     * @tc.name testDataViewGetBigIntSixtyfour0035
     * @tc.desc Verify getBigInt64 reads signed 64-bit minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, -9223372036854775808n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3600
     * @tc.name testDataViewGetBigIntSixtyfour0036
     * @tc.desc Verify getBigInt64 reads value near maximum 9223372036854775806n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 9223372036854775806n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3700
     * @tc.name testDataViewGetBigIntSixtyfour0037
     * @tc.desc Verify getBigInt64 reads value near minimum -9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, -9223372036854775807n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_3800
     * @tc.name testDataViewGetBigIntSixtyfour0038
     * @tc.desc Verify getBigInt64 reads value written in big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 72623859790382856n, false);
      let result = view.getBigInt64(0, false);
      expect(result).assertEqual(72623859790382856n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4000
     * @tc.name testDataViewGetBigIntSixtyfour0040
     * @tc.desc Verify getBigInt64 reads value written in little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 72623859790382856n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(72623859790382856n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4100
     * @tc.name testDataViewGetBigIntSixtyfour0041
     * @tc.desc Verify getBigInt64 little-endian byte data verification with low byte first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1n, true);
      let result = view.getBigInt64(0, true);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4200
     * @tc.name testDataViewGetBigIntSixtyfour0042
     * @tc.desc Verify getBigInt64 big-endian and little-endian read produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer1 = new ArrayBuffer(16);
      const view1 = new DataView(buffer1);
      view1.setBigInt64(0, 123456789n, false);
      let resultBE = view1.getBigInt64(0, false);

      const buffer2 = new ArrayBuffer(16);
      const view2 = new DataView(buffer2);
      view2.setBigInt64(0, 123456789n, true);
      let resultLE = view2.getBigInt64(0, true);

      expect(resultBE).assertEqual(resultLE);
      expect(resultBE).assertEqual(123456789n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4300
     * @tc.name testDataViewGetBigIntSixtyfour0043
     * @tc.desc Verify getBigInt64 big-endian write with little-endian read produces reversed bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 72623859790382856n, false);
      let resultLE = view.getBigInt64(0, true);
      expect(resultLE).assertEqual(578437695752307201n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4400
     * @tc.name testDataViewGetBigIntSixtyfour0044
     * @tc.desc Verify getBigInt64 little-endian write with big-endian read produces reversed bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 72623859790382856n, true);
      let resultBE = view.getBigInt64(0, false);
      expect(resultBE).assertEqual(578437695752307201n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4500
     * @tc.name testDataViewGetBigIntSixtyfour0045
     * @tc.desc Verify getBigInt64 returns same result for 0n in both endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 0n, true);
      let resultBE = view.getBigInt64(0, false);
      let resultLE = view.getBigInt64(0, true);
      expect(resultBE).assertEqual(resultLE);
      expect(resultBE).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4600
     * @tc.name testDataViewGetBigIntSixtyfour0046
     * @tc.desc Verify getBigInt64 returns same result for -1n in both endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, -1n, true);
      let resultBE = view.getBigInt64(0, false);
      let resultLE = view.getBigInt64(0, true);
      expect(resultBE).assertEqual(resultLE);
      expect(resultBE).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4800
     * @tc.name testDataViewGetBigIntSixtyfour0048
     * @tc.desc Verify getBigInt64 return value can be compared with bigint literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 42n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_4900
     * @tc.name testDataViewGetBigIntSixtyfour0049
     * @tc.desc Verify getBigInt64 return value is within int64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 9223372036854775807n);
      let maxResult = view.getBigInt64(0);
      expect(maxResult >= -9223372036854775808n).assertTrue();
      expect(maxResult <= 9223372036854775807n).assertTrue();

      view.setBigInt64(0, -9223372036854775808n);
      let minResult = view.getBigInt64(0);
      expect(minResult >= -9223372036854775808n).assertTrue();
      expect(minResult <= 9223372036854775807n).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5000
     * @tc.name testDataViewGetBigIntSixtyfour0050
     * @tc.desc Verify getBigInt64 returns consistent results on multiple reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 65536n);
      let result1 = view.getBigInt64(0);
      let result2 = view.getBigInt64(0);
      let result3 = view.getBigInt64(0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(65536n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5100
     * @tc.name testDataViewGetBigIntSixtyfour0051
     * @tc.desc Verify getBigInt64 throws RangeError when byteOffset plus 8 exceeds buffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(9);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5400
     * @tc.name testDataViewGetBigIntSixtyfour0054
     * @tc.desc Verify getBigInt64 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(16);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5600
     * @tc.name testDataViewGetBigIntSixtyfour0056
     * @tc.desc Verify getBigInt64 throws RangeError when buffer is 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5700
     * @tc.name testDataViewGetBigIntSixtyfour0057
     * @tc.desc Verify getBigInt64 throws RangeError when buffer is 7 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(7);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5800
     * @tc.name testDataViewGetBigIntSixtyfour0058
     * @tc.desc Verify getBigInt64 throws RangeError when buffer is 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(1);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_5900
     * @tc.name testDataViewGetBigIntSixtyfour0059
     * @tc.desc Verify getBigInt64 throws RangeError on out-of-bounds with littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(9, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_6000
     * @tc.name testDataViewGetBigIntSixtyfour0060
     * @tc.desc Verify getBigInt64 throws RangeError on out-of-bounds with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(16, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_6200
     * @tc.name testDataViewGetBigIntSixtyfour0062
     * @tc.desc Verify getBigInt64 throws RangeError when byteOffset is -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(-100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_6800
     * @tc.name testDataViewGetBigIntSixtyfour0068
     * @tc.desc Verify getBigInt64 reads the correct BigInt64 value after setBigInt64 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 42n);
      let result = view.getBigInt64(0);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_6900
     * @tc.name testDataViewGetBigIntSixtyfour0069
     * @tc.desc Verify getBigInt64 throws a RangeError when reading beyond the buffer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      try {
        view.getBigInt64(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7000
     * @tc.name testDataViewGetBigIntSixtyfour0070
     * @tc.desc Verify multiple consecutive out-of-bounds exceptions do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      let catchCount = 0;
      for (let i = 0; i < 3; i++) {
        try {
          view.getBigInt64(100 + i);
          expect(false).assertTrue();
        } catch (error) {
          expect(error.name).assertEqual('RangeError');
        }
      }
      expect(catchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7100
     * @tc.name testDataViewGetBigIntSixtyfour0071
     * @tc.desc Verify getBigInt64 reads different values from different offsets in same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(24);
      const view = new DataView(buffer);
      view.setBigInt64(0, 111n);
      view.setBigInt64(8, 222n);
      view.setBigInt64(16, 333n);
      expect(view.getBigInt64(0)).assertEqual(111n);
      expect(view.getBigInt64(8)).assertEqual(222n);
      expect(view.getBigInt64(16)).assertEqual(333n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7200
     * @tc.name testDataViewGetBigIntSixtyfour0072
     * @tc.desc Verify getBigInt64 reads back same value immediately after setBigInt64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      let testValues: bigint[] = [0n, 1n, -1n, 1024n, -1024n, 9223372036854775807n, -9223372036854775808n];
      for (let val of testValues) {
        view.setBigInt64(0, val);
        expect(view.getBigInt64(0)).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7300
     * @tc.name testDataViewGetBigIntSixtyfour0073
     * @tc.desc Verify getBigInt64 big-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 12345n, false);
      expect(view.getBigInt64(0, false)).assertEqual(12345n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7400
     * @tc.name testDataViewGetBigIntSixtyfour0074
     * @tc.desc Verify getBigInt64 little-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 12345n, true);
      expect(view.getBigInt64(0, true)).assertEqual(12345n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7500
     * @tc.name testDataViewGetBigIntSixtyfour0075
     * @tc.desc Verify getBigInt64 with 8-byte buffer only allows offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      view.setBigInt64(0, 99999n);
      expect(view.getBigInt64(0)).assertEqual(99999n);
      try {
        view.getBigInt64(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7600
     * @tc.name testDataViewGetBigIntSixtyfour0076
     * @tc.desc Verify getBigInt64 read-write consistency with int64 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      let boundaryValues: bigint[] = [
        -9223372036854775808n,
        -9223372036854775807n,
        -1n,
        0n,
        1n,
        9223372036854775806n,
        9223372036854775807n
      ];
      for (let val of boundaryValues) {
        view.setBigInt64(0, val);
        expect(view.getBigInt64(0)).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7700
     * @tc.name testDataViewGetBigIntSixtyfour0077
     * @tc.desc Verify getBigInt64 result toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      view.setBigInt64(0, 1234n);
      let result = view.getBigInt64(0);
      expect(result.toString()).assertEqual("1234");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_BI64_7800
     * @tc.name testDataViewGetBigIntSixtyfour0078
     * @tc.desc Verify getBigInt64 read-write consistency with little-endian boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetBigIntSixtyfour0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      let boundaryValues: bigint[] = [
        -9223372036854775808n,
        -1n,
        0n,
        1n,
        9223372036854775807n
      ];
      for (let val of boundaryValues) {
        view.setBigInt64(0, val, true);
        expect(view.getBigInt64(0, true)).assertEqual(val);
      }
    });
  });
}

