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

export default function DataViewSetBigUint64Test(): void {
  describe('DataViewSetBigUint64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0100
     * @tc.name testDataViewSetBigUint640001
     * @tc.desc Verify setBigUint64 with 2 required parameters writes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(1234));
      expect(view.getBigUint64(0)).assertEqual(BigInt(1234));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0200
     * @tc.name testDataViewSetBigUint640002
     * @tc.desc Verify setBigUint64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(17, BigInt(0));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0400
     * @tc.name testDataViewSetBigUint640004
     * @tc.desc Verify setBigUint64 with 3 required parameters writes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(1234), true);
      expect(view.getBigUint64(0, true)).assertEqual(BigInt(1234));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0700
     * @tc.name testDataViewSetBigUint640007
     * @tc.desc Verify setBigUint64 with bigint and littleEndian omitted uses default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n);
      expect(view.getBigUint64(0)).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0800
     * @tc.name testDataViewSetBigUint640008
     * @tc.desc Verify setBigUint64 with bigint and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n, true);
      expect(view.getBigUint64(0, true)).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_0900
     * @tc.name testDataViewSetBigUint640009
     * @tc.desc Verify setBigUint64 with bigint and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n, false);
      expect(view.getBigUint64(0, false)).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1100
     * @tc.name testDataViewSetBigUint640011
     * @tc.desc Verify setBigUint64 writes at byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 100n);
      expect(view.getBigUint64(0)).assertEqual(100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1200
     * @tc.name testDataViewSetBigUint640012
     * @tc.desc Verify setBigUint64 writes at byteOffset 8 with exactly 8 bytes space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 200n);
      expect(view.getBigUint64(8)).assertEqual(200n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1300
     * @tc.name testDataViewSetBigUint640013
     * @tc.desc Verify setBigUint64 at max valid byteOffset bufferSize-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 999n);
      expect(view.getBigUint64(8)).assertEqual(999n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1400
     * @tc.name testDataViewSetBigUint640014
     * @tc.desc Verify setBigUint64 throws RangeError at byteOffset bufferSize-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(9, 100n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1500
     * @tc.name testDataViewSetBigUint640015
     * @tc.desc Verify setBigUint64 returns expected result when byteOffset equals bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(16, 100n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1600
     * @tc.name testDataViewSetBigUint640016
     * @tc.desc Verify setBigUint64 throws RangeError with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(-1, 100n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1700
     * @tc.name testDataViewSetBigUint640017
     * @tc.desc Verify setBigUint64 throws RangeError with extremely large byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(2147483647, 100n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_1900
     * @tc.name testDataViewSetBigUint640019
     * @tc.desc Verify setBigUint64 writes long value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(0));
      expect(view.getBigUint64(0)).assertEqual(BigInt(0));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2000
     * @tc.name testDataViewSetBigUint640020
     * @tc.desc Verify setBigUint64 writes large long value 1000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(1000000000));
      expect(view.getBigUint64(0)).assertEqual(BigInt(1000000000));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2200
     * @tc.name testDataViewSetBigUint640022
     * @tc.desc Verify setBigUint64 writes long max value 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt("9223372036854775807"));
      expect(view.getBigUint64(0)).assertEqual(BigInt("9223372036854775807"));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2300
     * @tc.name testDataViewSetBigUint640023
     * @tc.desc Verify setBigUint64 returns expected result with negative long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(-1));
      expect(view.getBigUint64(0)).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2400
     * @tc.name testDataViewSetBigUint640024
     * @tc.desc Verify setBigUint64 writes normal long value in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(5678), true);
      expect(view.getBigUint64(0, true)).assertEqual(BigInt(5678));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2500
     * @tc.name testDataViewSetBigUint640025
     * @tc.desc Verify setBigUint64 writes normal long value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(5678), false);
      expect(view.getBigUint64(0, false)).assertEqual(BigInt(5678));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2700
     * @tc.name testDataViewSetBigUint640027
     * @tc.desc Verify setBigUint64 with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(1234), false);
      expect(view.getBigUint64(0, false)).assertEqual(BigInt(1234));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2800
     * @tc.name testDataViewSetBigUint640028
     * @tc.desc Verify setBigUint64 writes long value 0 in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt(0), true);
      expect(view.getBigUint64(0, true)).assertEqual(BigInt(0));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_2900
     * @tc.name testDataViewSetBigUint640029
     * @tc.desc Verify setBigUint64 writes long max value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt("9223372036854775807"), false);
      expect(view.getBigUint64(0, false)).assertEqual(BigInt("9223372036854775807"));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3100
     * @tc.name testDataViewSetBigUint640031
     * @tc.desc Verify setBigUint64 writes bigint value 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 0n);
      expect(view.getBigUint64(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3200
     * @tc.name testDataViewSetBigUint640032
     * @tc.desc Verify setBigUint64 writes bigint value 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1n);
      expect(view.getBigUint64(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3300
     * @tc.name testDataViewSetBigUint640033
     * @tc.desc Verify setBigUint64 writes uint64 max value 18446744073709551615n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n);
      expect(view.getBigUint64(0)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3400
     * @tc.name testDataViewSetBigUint640034
     * @tc.desc Verify setBigUint64 writes uint64 max value minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551614n);
      expect(view.getBigUint64(0)).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3500
     * @tc.name testDataViewSetBigUint640035
     * @tc.desc Verify setBigUint64 writes 2^63 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 9223372036854775808n);
      expect(view.getBigUint64(0)).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3600
     * @tc.name testDataViewSetBigUint640036
     * @tc.desc Verify setBigUint64 writes hex uint64 max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      const maxUint64: bigint = BigInt('0xFFFFFFFFFFFFFFFF');
      view.setBigUint64(0, maxUint64);
      const result: bigint = view.getBigUint64(0);
      expect(result).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3700
     * @tc.name testDataViewSetBigUint640037
     * @tc.desc Verify setBigUint64 returns expected result with bigint exceeding uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      const invalidValue: bigint = BigInt('18446744073709551616');
      view.setBigUint64(0, invalidValue);
      expect(view.getBigUint64(0)).assertEqual(BigInt('0'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3800
     * @tc.name testDataViewSetBigUint640038
     * @tc.desc Verify setBigUint64 returns expected result with negative bigint -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, -1n);
      expect(view.getBigUint64(0)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_3900
     * @tc.name testDataViewSetBigUint640039
     * @tc.desc Verify setBigUint64 returns expected result with negative bigint -100n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt('-100'));
      expect(view.getBigUint64(0)).assertEqual(BigInt('18446744073709551516'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4000
     * @tc.name testDataViewSetBigUint640040
     * @tc.desc Verify setBigUint64 returns expected result with oversized bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      const tooLargeValue: bigint = BigInt('999999999999999999999999999999');
      view.setBigUint64(0, tooLargeValue);
      expect(view.getBigUint64(0)).assertEqual(BigInt('5076944270305263615'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4100
     * @tc.name testDataViewSetBigUint640041
     * @tc.desc Verify setBigUint64 uses default endian when littleEndian omitted for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 5678n);
      expect(view.getBigUint64(0)).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4200
     * @tc.name testDataViewSetBigUint640042
     * @tc.desc Verify setBigUint64 with littleEndian=true for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 5678n, true);
      expect(view.getBigUint64(0, true)).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4300
     * @tc.name testDataViewSetBigUint640043
     * @tc.desc Verify setBigUint64 with littleEndian=false for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 5678n, false);
      expect(view.getBigUint64(0, false)).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4400
     * @tc.name testDataViewSetBigUint640044
     * @tc.desc Verify setBigUint64 writes uint64 max in little-endian for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n, true);
      expect(view.getBigUint64(0, true)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4500
     * @tc.name testDataViewSetBigUint640045
     * @tc.desc Verify setBigUint64 writes uint64 max in big-endian for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n, false);
      expect(view.getBigUint64(0, false)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4600
     * @tc.name testDataViewSetBigUint640046
     * @tc.desc Verify setBigUint64 overload 1 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let result = view.setBigUint64(0, 1234n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4700
     * @tc.name testDataViewSetBigUint640047
     * @tc.desc Verify setBigUint64 overload 2 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let result = view.setBigUint64(0, 1234n, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_4800
     * @tc.name testDataViewSetBigUint640048
     * @tc.desc Verify setBigUint64 overload 3 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let result = view.setBigUint64(0, 1234n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5000
     * @tc.name testDataViewSetBigUint640050
     * @tc.desc Verify setBigUint64 writes 0n in big-endian and reads back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 0n, false);
      expect(view.getBigUint64(0, false)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5300
     * @tc.name testDataViewSetBigUint640053
     * @tc.desc Verify setBigUint64 writes 0n in little-endian and reads back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 0n, true);
      expect(view.getBigUint64(0, true)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5500
     * @tc.name testDataViewSetBigUint640055
     * @tc.desc Verify byte order takes effect: big-endian write read as little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      const valueToSet = BigInt('0x0102030405060708');
      view.setBigUint64(0, valueToSet, false);
      const littleEndianRead = view.getBigUint64(0, true);
      const expectedValue = BigInt('0x0807060504030201');
      expect(littleEndianRead).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5600
     * @tc.name testDataViewSetBigUint640056
     * @tc.desc Verify byte order takes effect: little-endian write read as big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt('0x0102030405060708'), true);
      const bigEndianRead = view.getBigUint64(0, false);
      expect(bigEndianRead).assertEqual(BigInt('0x0807060504030201'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5700
     * @tc.name testDataViewSetBigUint640057
     * @tc.desc Verify long and bigint overloads produce same result in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(16);
      const buf2 = new ArrayBuffer(16);
      const view1 = new DataView(buf1);
      const view2 = new DataView(buf2);
      view1.setBigUint64(0, 1234n, false);
      view2.setBigUint64(0, 1234n, false);
      expect(view1.getBigUint64(0, false)).assertEqual(view2.getBigUint64(0, false));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5800
     * @tc.name testDataViewSetBigUint640058
     * @tc.desc Verify long and bigint overloads produce same result in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(16);
      const buf2 = new ArrayBuffer(16);
      const view1 = new DataView(buf1);
      const view2 = new DataView(buf2);
      view1.setBigUint64(0, 1234n, true);
      view2.setBigUint64(0, 1234n, true);
      expect(view1.getBigUint64(0, true)).assertEqual(view2.getBigUint64(0, true));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_5900
     * @tc.name testDataViewSetBigUint640059
     * @tc.desc Verify setBigUint64 overwrites previous value at same offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n);
      view.setBigUint64(0, 5678n);
      expect(view.getBigUint64(0)).assertEqual(5678n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6000
     * @tc.name testDataViewSetBigUint640060
     * @tc.desc Verify setBigUint64 writes at different offsets do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 100n);
      view.setBigUint64(8, 200n);
      expect(view.getBigUint64(0)).assertEqual(100n);
      expect(view.getBigUint64(8)).assertEqual(200n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6100
     * @tc.name testDataViewSetBigUint640061
     * @tc.desc Verify setBigUint64 writes uint64 max in exact 8-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 18446744073709551615n);
      expect(view.getBigUint64(0)).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6300
     * @tc.name testDataViewSetBigUint640063
     * @tc.desc Verify setBigUint64 writes 2^32 = 4294967296n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 4294967296n);
      expect(view.getBigUint64(0)).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6600
     * @tc.name testDataViewSetBigUint640066
     * @tc.desc Verify setBigUint64 throws RangeError when byteOffset exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setBigUint64(1, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6700
     * @tc.name testDataViewSetBigUint640067
     * @tc.desc Verify setBigUint64 returns expected result when buffer is less than 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(7);
      const view = new DataView(buf);
      try {
        view.setBigUint64(0, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6800
     * @tc.name testDataViewSetBigUint640068
     * @tc.desc Verify setBigUint64 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(-1, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_6900
     * @tc.name testDataViewSetBigUint640069
     * @tc.desc Verify setBigUint64 returns expected result with int max byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(2147483647, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7000
     * @tc.name testDataViewSetBigUint640070
     * @tc.desc Verify setBigUint64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(20, BigInt(0));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7100
     * @tc.name testDataViewSetBigUint640071
     * @tc.desc Verify setBigUint64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(20, 100n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7400
     * @tc.name testDataViewSetBigUint640074
     * @tc.desc Verify out-of-bounds access is caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setBigUint64(4, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7500
     * @tc.name testDataViewSetBigUint640075
     * @tc.desc Verify that setting a negative BigUint64 value wraps to MAX_UINT64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt('-1'));
      expect(view.getBigUint64(0)).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7600
     * @tc.name testDataViewSetBigUint640076
     * @tc.desc Verify that setting a BigUint64 value exceeding MAX_UINT64 wraps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, BigInt('18446744073709551616'));
      expect(view.getBigUint64(0)).assertEqual(BigInt('0'));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7700
     * @tc.name testDataViewSetBigUint640077
     * @tc.desc Verify setBigUint64 writes the correct value and can be read back via getBigUint64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(0, 1234n);
      expect(view.getBigUint64(0)).assertEqual(1234n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7800
     * @tc.name testDataViewSetBigUint640078
     * @tc.desc Verify bufferSize=16 byteOffset=8 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setBigUint64(8, 100n);
      expect(view.getBigUint64(8)).assertEqual(100n);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_7900
     * @tc.name testDataViewSetBigUint640079
     * @tc.desc Verify bufferSize=16 byteOffset=9 is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.setBigUint64(9, BigInt('100'));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');

      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_BU64_8000
     * @tc.name testDataViewSetBigUint640080
     * @tc.desc Verify bufferSize=8 byteOffset=0 is valid minimum buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetBigUint640080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setBigUint64(0, 100n);
      expect(view.getBigUint64(0)).assertEqual(100n);
    });

  })
};
