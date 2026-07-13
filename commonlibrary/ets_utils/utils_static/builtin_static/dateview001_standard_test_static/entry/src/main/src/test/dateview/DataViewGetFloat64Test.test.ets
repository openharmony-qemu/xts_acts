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

export default function DataViewGetFloat64Test(): void {
  describe('DataViewGetFloat64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0100
     * @tc.name testDataViewGetFloatSixtyFour0001
     * @tc.desc Verify getFloat64 with required byteOffset parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.5);
      let result = view.getFloat64(0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0200
     * @tc.name testDataViewGetFloatSixtyFour0002
     * @tc.desc Verify getFloat64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getFloat64(100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0300
     * @tc.name testDataViewGetFloatSixtyFour0003
     * @tc.desc Verify getFloat64 defaults to big-endian with only byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.5, false);
      let result = view.getFloat64(0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0400
     * @tc.name testDataViewGetFloatSixtyFour0004
     * @tc.desc Verify getFloat64 with byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.5, true);
      let result = view.getFloat64(0, true);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0700
     * @tc.name testDataViewGetFloatSixtyFour0007
     * @tc.desc Verify getFloat64 with byteOffset 8 at maximum legal offset in 16-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(8, 2.25);
      let result = view.getFloat64(8);
      expect(result).assertEqual(2.25);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0800
     * @tc.name testDataViewGetFloatSixtyFour0008
     * @tc.desc Verify getFloat64 with non-aligned byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(1, 7.75);
      let result = view.getFloat64(1);
      expect(result).assertEqual(7.75);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_0900
     * @tc.name testDataViewGetFloatSixtyFour0009
     * @tc.desc Verify getFloat64 with byteOffset 4 at middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(4, 4.125);
      let result = view.getFloat64(4);
      expect(result).assertEqual(4.125);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1000
     * @tc.name testDataViewGetFloatSixtyFour0010
     * @tc.desc Verify getFloat64 at last valid position for 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(8, 99.99);
      let result = view.getFloat64(8);
      expect(result).assertEqual(99.99);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1100
     * @tc.name testDataViewGetFloatSixtyFour0011
     * @tc.desc Verify getFloat64 with buffer size exactly 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat64(0, 12.5);
      let result = view.getFloat64(0);
      expect(result).assertEqual(12.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1200
     * @tc.name testDataViewGetFloatSixtyFour0012
     * @tc.desc Verify getFloat64 with large valid byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(32);
      const view = new DataView(buf);
      view.setFloat64(24, 3.14);
      let result = view.getFloat64(24);
      expect(result).assertClose(3.14, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1300
     * @tc.name testDataViewGetFloatSixtyFour0013
     * @tc.desc Verify getFloat64 throws RangeError with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getFloat64(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1400
     * @tc.name testDataViewGetFloatSixtyFour0014
     * @tc.desc Verify getFloat64 throws RangeError with negative byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
       
      try {
        view.getFloat64(-100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1500
     * @tc.name testDataViewGetFloatSixtyFour0015
     * @tc.desc Verify getFloat64 throws RangeError when byteOffset plus 8 exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getFloat64(9);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1600
     * @tc.name testDataViewGetFloatSixtyFour0016
     * @tc.desc Verify getFloat64 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getFloat64(16);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_1700
     * @tc.name testDataViewGetFloatSixtyFour0017
     * @tc.desc Verify getFloat64 throws RangeError with very large byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      try {
        view.getFloat64(100000);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_2300
     * @tc.name testDataViewGetFloatSixtyFour0023
     * @tc.desc Verify getFloat64 with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.5, false);
      let result = view.getFloat64(0, false);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_2500
     * @tc.name testDataViewGetFloatSixtyFour0025
     * @tc.desc Verify getFloat64 treats undefined littleEndian as default big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.5, false);
      let result = view.getFloat64(0, undefined);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3000
     * @tc.name testDataViewGetFloatSixtyFour0030
     * @tc.desc Verify getFloat64 reads negative float -2.75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, -2.75);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-2.75);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3100
     * @tc.name testDataViewGetFloatSixtyFour0031
     * @tc.desc Verify getFloat64 reads positive integer 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 42.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3200
     * @tc.name testDataViewGetFloatSixtyFour0032
     * @tc.desc Verify getFloat64 reads decimal 0.15625
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 0.15625);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.15625);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3300
     * @tc.name testDataViewGetFloatSixtyFour0033
     * @tc.desc Verify getFloat64 reads very small positive number 1e-300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 1e-300);
      let result = view.getFloat64(0);
      expect(result).assertEqual(1e-300);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3400
     * @tc.name testDataViewGetFloatSixtyFour0034
     * @tc.desc Verify getFloat64 reads very large positive number 1e300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 1e300);
      let result = view.getFloat64(0);
      expect(result).assertEqual(1e300);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3700
     * @tc.name testDataViewGetFloatSixtyFour0037
     * @tc.desc Verify getFloat64 returns different value when endianness mismatches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 1.0, false);
      let resultBE = view.getFloat64(0, false);
      let resultLE = view.getFloat64(0, true);
      expect(resultBE === resultLE).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3800
     * @tc.name testDataViewGetFloatSixtyFour0038
     * @tc.desc Verify getFloat64 returns different value when little-endian write and big-endian read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 100.0, true);
      let resultLE = view.getFloat64(0, true);
      let resultBE = view.getFloat64(0, false);
      expect(resultLE).assertEqual(100.0);
      expect(resultLE === resultBE).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_3900
     * @tc.name testDataViewGetFloatSixtyFour0039
     * @tc.desc Verify getFloat64 reads from multiple offsets in same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(32);
      const view = new DataView(buf);
      view.setFloat64(0, 1.1);
      view.setFloat64(8, 2.2);
      view.setFloat64(16, 3.3);
      view.setFloat64(24, 4.4);
      expect(view.getFloat64(0)).assertClose(1.1, 0.001);
      expect(view.getFloat64(8)).assertClose(2.2, 0.001);
      expect(view.getFloat64(16)).assertClose(3.3, 0.001);
      expect(view.getFloat64(24)).assertClose(4.4, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4000
     * @tc.name testDataViewGetFloatSixtyFour0040
     * @tc.desc Verify getFloat64 reads latest value after overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 10.5);
      expect(view.getFloat64(0)).assertEqual(10.5);
      view.setFloat64(0, 20.25);
      expect(view.getFloat64(0)).assertEqual(20.25);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4100
     * @tc.name testDataViewGetFloatSixtyFour0041
     * @tc.desc Verify getFloat64 reads positive zero +0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 0.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4200
     * @tc.name testDataViewGetFloatSixtyFour0042
     * @tc.desc Verify getFloat64 reads negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, -0.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4300
     * @tc.name testDataViewGetFloatSixtyFour0043
     * @tc.desc Verify getFloat64 reads positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Infinity);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4400
     * @tc.name testDataViewGetFloatSixtyFour0044
     * @tc.desc Verify getFloat64 reads negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, -Infinity);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4500
     * @tc.name testDataViewGetFloatSixtyFour0045
     * @tc.desc Verify getFloat64 reads NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, NaN);
      let result = view.getFloat64(0);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4600
     * @tc.name testDataViewGetFloatSixtyFour0046
     * @tc.desc Verify getFloat64 reads Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Number.MAX_VALUE);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4700
     * @tc.name testDataViewGetFloatSixtyFour0047
     * @tc.desc Verify getFloat64 reads Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Number.MIN_VALUE);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4800
     * @tc.name testDataViewGetFloatSixtyFour0048
     * @tc.desc Verify getFloat64 reads Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Number.EPSILON);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_4900
     * @tc.name testDataViewGetFloatSixtyFour0049
     * @tc.desc Verify getFloat64 reads Float64 minimum positive normal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let minNormal = 2.2250738585072014e-308;
      view.setFloat64(0, minNormal);
      let result = view.getFloat64(0);
      expect(result).assertEqual(minNormal);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5000
     * @tc.name testDataViewGetFloatSixtyFour0050
     * @tc.desc Verify getFloat64 reads Float64 minimum positive denormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 5e-324);
      let result = view.getFloat64(0);
      expect(result < 1e-323).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5100
     * @tc.name testDataViewGetFloatSixtyFour0051
     * @tc.desc Verify getFloat64 reads negative Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, -Number.MAX_VALUE);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5200
     * @tc.name testDataViewGetFloatSixtyFour0052
     * @tc.desc Verify getFloat64 reads Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Number.MAX_SAFE_INTEGER);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5300
     * @tc.name testDataViewGetFloatSixtyFour0053
     * @tc.desc Verify getFloat64 reads Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, Number.MIN_SAFE_INTEGER);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5700
     * @tc.name testDataViewGetFloatSixtyFour0057
     * @tc.desc Verify getFloat64 preserves double precision for 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 0.1);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5800
     * @tc.name testDataViewGetFloatSixtyFour0058
     * @tc.desc Verify getFloat64 preserves exact value for 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 0.5);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_5900
     * @tc.name testDataViewGetFloatSixtyFour0059
     * @tc.desc Verify getFloat64 preserves high precision for pi
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.141592653589793);
      let result = view.getFloat64(0);
      expect(result).assertEqual(3.141592653589793);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6000
     * @tc.name testDataViewGetFloatSixtyFour0060
     * @tc.desc Verify getFloat64 preserves scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 1.0e20);
      let result = view.getFloat64(0);
      expect(result).assertEqual(1.0e20);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6100
     * @tc.name testDataViewGetFloatSixtyFour0061
     * @tc.desc Verify getFloat64 round-trip consistency with setFloat64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let values = [0.0, 1.0, -1.0, 0.5, 3.14, 100.0, -999.99, 1e-300, 1e300];
      for (let val of values) {
        view.setFloat64(0, val);
        let result = view.getFloat64(0);
        expect(result).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6200
     * @tc.name testDataViewGetFloatSixtyFour0062
     * @tc.desc Verify getFloat64 round-trip at different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(32);
      const view = new DataView(buf);
      let offsets = [0, 8, 16, 24];
      let value = 42.5;
      for (let offset of offsets) {
        view.setFloat64(offset, value);
        let result = view.getFloat64(offset);
        expect(result).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6300
     * @tc.name testDataViewGetFloatSixtyFour0063
     * @tc.desc Verify getFloat64 round-trip consistency with big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.141592653589793, false);
      let result = view.getFloat64(0, false);
      expect(result).assertEqual(3.141592653589793);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6400
     * @tc.name testDataViewGetFloatSixtyFour0064
     * @tc.desc Verify getFloat64 round-trip consistency with little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 3.141592653589793, true);
      let result = view.getFloat64(0, true);
      expect(result).assertEqual(3.141592653589793);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_6900
     * @tc.name testDataViewGetFloatSixtyFour0069
     * @tc.desc Verify getFloat64 throws RangeError on 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
       
      try {
        view.getFloat64(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7200
     * @tc.name testDataViewGetFloatSixtyFour0072
     * @tc.desc Verify getFloat64 throws RangeError with minimum int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
       
      try {
        view.getFloat64(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7400
     * @tc.name testDataViewGetFloatSixtyFour0074
     * @tc.desc Verify getFloat64 out-of-bounds triggers catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat64(8);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7600
     * @tc.name testDataViewGetFloatSixtyFour0076
     * @tc.desc Verify getFloat64 reads the correct value written by setFloat64 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 1.5);
      let result: number = 0;
      result = view.getFloat64(0);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7700
     * @tc.name testDataViewGetFloatSixtyFour0077
     * @tc.desc Verify getFloat64 recovers after out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat64(0, 2.5);
       
      try {
        view.getFloat64(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      let result = view.getFloat64(0);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7800
     * @tc.name testDataViewGetFloatSixtyFour0078
     * @tc.desc Verify getFloat64 overload 2 throws RangeError with littleEndian true out-of-bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getFloat64(1, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F64_7900
     * @tc.name testDataViewGetFloatSixtyFour0079
     * @tc.desc Verify getFloat64 overload 2 throws RangeError with littleEndian false out-of-bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatSixtyFour0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
       
      try {
        view.getFloat64(1, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
