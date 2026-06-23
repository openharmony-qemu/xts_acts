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

export default function DataViewGetFloat32Test(): void {
  describe('DataViewGetFloat32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0100
     * @tc.name testDataViewGetFloatThirtytwo0001
     * @tc.desc Verify getFloat32 with one required parameter byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 3.5);
      let result = view.getFloat32(0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0300
     * @tc.name testDataViewGetFloatThirtytwo0003
     * @tc.desc Verify getFloat32 with only byteOffset defaults to big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 3.5, false);
      let result = view.getFloat32(0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0400
     * @tc.name testDataViewGetFloatThirtytwo0004
     * @tc.desc Verify getFloat32 with byteOffset and littleEndian both parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 3.5, true);
      let result = view.getFloat32(0, true);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0700
     * @tc.name testDataViewGetFloatThirtytwo0007
     * @tc.desc Verify getFloat32 with byteOffset 4 reads from fifth byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(4, 2.25);
      let result = view.getFloat32(4);
      expect(result).assertEqual(2.25);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0800
     * @tc.name testDataViewGetFloatThirtytwo0008
     * @tc.desc Verify getFloat32 with non-aligned offset byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(1, 7.75);
      let result = view.getFloat32(1);
      expect(result).assertEqual(7.75);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_0900
     * @tc.name testDataViewGetFloatThirtytwo0009
     * @tc.desc Verify getFloat32 with even non-aligned offset byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(2, 4.125);
      let result = view.getFloat32(2);
      expect(result).assertEqual(4.125);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1000
     * @tc.name testDataViewGetFloatThirtytwo0010
     * @tc.desc Verify getFloat32 at buffer end position for 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(4, 99.99);
      let result = view.getFloat32(4);
      expect(result).assertClose(99.99, 1e-5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1100
     * @tc.name testDataViewGetFloatThirtytwo0011
     * @tc.desc Verify getFloat32 with 4-byte buffer at byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setFloat32(0, 12.5);
      let result = view.getFloat32(0);
      expect(result).assertEqual(12.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1200
     * @tc.name testDataViewGetFloatThirtytwo0012
     * @tc.desc Verify getFloat32 with large byteOffset value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat32(12, 3.14);
      let result = view.getFloat32(12);
      expect(result).assertClose(3.14, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1300
     * @tc.name testDataViewGetFloatThirtytwo0013
     * @tc.desc Verify getFloat32 throws RangeError with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1400
     * @tc.name testDataViewGetFloatThirtytwo0014
     * @tc.desc Verify getFloat32 throws RangeError with negative byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(-100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1500
     * @tc.name testDataViewGetFloatThirtytwo0015
     * @tc.desc Verify getFloat32 throws RangeError when byteOffset exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(5);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1600
     * @tc.name testDataViewGetFloatThirtytwo0016
     * @tc.desc Verify getFloat32 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(8);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_1700
     * @tc.name testDataViewGetFloatThirtytwo0017
     * @tc.desc Verify getFloat32 throws RangeError with very large byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(100000);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
       
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_2300
     * @tc.name testDataViewGetFloatThirtytwo0023
     * @tc.desc Verify getFloat32 with littleEndian false reads in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 3.5, false);
      let result = view.getFloat32(0, false);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_2500
     * @tc.name testDataViewGetFloatThirtytwo0025
     * @tc.desc Verify getFloat32 treats undefined littleEndian as default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 3.5, false);
      let result = view.getFloat32(0, undefined);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3000
     * @tc.name testDataViewGetFloatThirtytwo0030
     * @tc.desc Verify getFloat32 reads negative float -2.75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, -2.75);
      let result = view.getFloat32(0);
      expect(result).assertEqual(-2.75);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3100
     * @tc.name testDataViewGetFloatThirtytwo0031
     * @tc.desc Verify getFloat32 reads positive integer 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 42.0);
      let result = view.getFloat32(0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3200
     * @tc.name testDataViewGetFloatThirtytwo0032
     * @tc.desc Verify getFloat32 reads decimal 0.15625 with exact binary representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 0.15625);
      let result = view.getFloat32(0);
      expect(result).assertEqual(0.15625);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3400
     * @tc.name testDataViewGetFloatThirtytwo0034
     * @tc.desc Verify little-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 123.456, true);
      let result = view.getFloat32(0, true);
      expect(result).assertClose(123.456, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3500
     * @tc.name testDataViewGetFloatThirtytwo0035
     * @tc.desc Verify big-endian write and little-endian read produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 1.0, false);
      let resultBE = view.getFloat32(0, false);
      let resultLE = view.getFloat32(0, true);
      expect(resultBE === resultLE).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3600
     * @tc.name testDataViewGetFloatThirtytwo0036
     * @tc.desc Verify little-endian write and big-endian read produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 100.0, true);
      let resultLE = view.getFloat32(0, true);
      let resultBE = view.getFloat32(0, false);
      expect(resultLE).assertEqual(100.0);
      expect(resultLE === resultBE).assertFalse();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3700
     * @tc.name testDataViewGetFloatThirtytwo0037
     * @tc.desc Verify getFloat32 reads from multiple offsets in same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      view.setFloat32(0, 1.1);
      view.setFloat32(4, 2.2);
      view.setFloat32(8, 3.3);
      view.setFloat32(12, 4.4);
      expect(view.getFloat32(0)).assertClose(1.1, 0.001);
      expect(view.getFloat32(4)).assertClose(2.2, 0.001);
      expect(view.getFloat32(8)).assertClose(3.3, 0.001);
      expect(view.getFloat32(12)).assertClose(4.4, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3800
     * @tc.name testDataViewGetFloatThirtytwo0038
     * @tc.desc Verify getFloat32 reads latest value after overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 10.5);
      expect(view.getFloat32(0)).assertEqual(10.5);
      view.setFloat32(0, 20.25);
      expect(view.getFloat32(0)).assertEqual(20.25);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_3900
     * @tc.name testDataViewGetFloatThirtytwo0039
     * @tc.desc Verify getFloat32 reads positive zero +0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 0.0);
      let result = view.getFloat32(0);
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4000
     * @tc.name testDataViewGetFloatThirtytwo0040
     * @tc.desc Verify getFloat32 reads negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, -0.0);
      let result = view.getFloat32(0);
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4100
     * @tc.name testDataViewGetFloatThirtytwo0041
     * @tc.desc Verify getFloat32 reads positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, Infinity);
      let result = view.getFloat32(0);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4200
     * @tc.name testDataViewGetFloatThirtytwo0042
     * @tc.desc Verify getFloat32 reads negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, -Infinity);
      let result = view.getFloat32(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4300
     * @tc.name testDataViewGetFloatThirtytwo0043
     * @tc.desc Verify getFloat32 reads NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, NaN);
      let result = view.getFloat32(0);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4500
     * @tc.name testDataViewGetFloatThirtytwo0045
     * @tc.desc Verify getFloat32 reads Float32 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      const expected = 3.4028235e+38;
      view.setFloat32(0, expected);
      let result = view.getFloat32(0);
      let relativeError = Math.abs((result - expected) / expected);
      expect(relativeError < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4600
     * @tc.name testDataViewGetFloatThirtytwo0046
     * @tc.desc Verify getFloat32 reads Float32 minimum normalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      const expected = 1.17549435e-38;
      view.setFloat32(0, expected);
      let result = view.getFloat32(0);
      let relativeError = Math.abs((result - expected) / expected);
      expect(relativeError < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4700
     * @tc.name testDataViewGetFloatThirtytwo0047
     * @tc.desc Verify getFloat32 reads Float32 epsilon precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let epsilon = 1.1920929e-7;
      view.setFloat32(0, 1.0 + epsilon);
      let result = view.getFloat32(0);
      expect(result > 1.0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4800
     * @tc.name testDataViewGetFloatThirtytwo0048
     * @tc.desc Verify getFloat32 reads Float32 minimum negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      const expected = -3.4028235e+38;
      view.setFloat32(0, expected);
      let result = view.getFloat32(0);
      let relativeError = Math.abs((result - expected) / expected);
      expect(relativeError < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_4900
     * @tc.name testDataViewGetFloatThirtytwo0049
     * @tc.desc Verify getFloat32 reads very small value near zero denormalized boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 1.4e-45);
      let result = view.getFloat32(0);
      expect(result < 1e-44).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_5300
     * @tc.name testDataViewGetFloatThirtytwo0053
     * @tc.desc Verify getFloat32 precision for approximate float32 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 0.1);
      let result = view.getFloat32(0);
      expect(Math.abs(result - 0.1) < 0.00001).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_5400
     * @tc.name testDataViewGetFloatThirtytwo0054
     * @tc.desc Verify getFloat32 exact representation round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 0.5);
      let result = view.getFloat32(0);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_5500
     * @tc.name testDataViewGetFloatThirtytwo0055
     * @tc.desc Verify setFloat32 and getFloat32 round trip consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      let values = [0.0, 1.0, -1.0, 0.5, 3.14, 100.0, -999.99];
      for (let val of values) {
        view.setFloat32(0, val);
        let result = view.getFloat32(0);
        expect(Math.abs(result - val) < 0.001).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_5600
     * @tc.name testDataViewGetFloatThirtytwo0056
     * @tc.desc Verify setFloat32 and getFloat32 consistency at different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const view = new DataView(buf);
      let offsets = [0, 4, 8, 12];
      let value = 42.5;
      for (let offset of offsets) {
        view.setFloat32(offset, value);
        let result = view.getFloat32(offset);
        expect(result).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_5700
     * @tc.name testDataViewGetFloatThirtytwo0057
     * @tc.desc Verify getFloat32 throws RangeError when 4-byte buffer with byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getFloat32(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
         
      }
       
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6300
     * @tc.name testDataViewGetFloatThirtytwo0063
     * @tc.desc Verify getFloat32 throws RangeError with minimum int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.getFloat32(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6500
     * @tc.name testDataViewGetFloatThirtytwo0065
     * @tc.desc Verify catch block is entered on out-of-bounds access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getFloat32(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6600
     * @tc.name testDataViewGetFloatThirtytwo0066
     * @tc.desc Verify getFloat32 throws a RangeError when reading beyond the buffer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getFloat32(4);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6700
     * @tc.name testDataViewGetFloatThirtytwo0067
     * @tc.desc Verify getFloat32 reads the correct value written by setFloat32 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 1.5);
      let result: number = 0;
      result = view.getFloat32(0);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6800
     * @tc.name testDataViewGetFloatThirtytwo0068
     * @tc.desc Verify normal call succeeds after previous out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setFloat32(0, 2.5);
      try {
        view.getFloat32(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      let result = view.getFloat32(0);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_GET_F32_6900
     * @tc.name testDataViewGetFloatThirtytwo0069
     * @tc.desc Verify getFloat32 throws RangeError with littleEndian and out-of-bounds offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewGetFloatThirtytwo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.getFloat32(1, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  });
}
