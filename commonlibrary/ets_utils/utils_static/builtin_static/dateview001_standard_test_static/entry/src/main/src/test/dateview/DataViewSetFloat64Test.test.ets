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

export default function DataViewSetFloat64Test(): void {
  describe('DataViewSetFloat64Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0100
     * @tc.name testDataViewSetFloat640001
     * @tc.desc Verify setFloat64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(100, 1.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0300
     * @tc.name testDataViewSetFloat640003
     * @tc.desc Verify setFloat64 with two normal required arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 3.5);
      expect(view.getFloat64(0)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0400
     * @tc.name testDataViewSetFloat640004
     * @tc.desc Verify setFloat64 with three arguments includes extra parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 3.5, true);
      expect(view.getFloat64(0, true)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0500
     * @tc.name testDataViewSetFloat640005
     * @tc.desc Verify setFloat64 with byteOffset 0 at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 1.23456789012345);
      expect(view.getFloat64(0)).assertEqual(1.23456789012345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0600
     * @tc.name testDataViewSetFloat640006
     * @tc.desc Verify setFloat64 with byteOffset 8 at second 8-byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(8, 9.87654321098765);
      expect(view.getFloat64(8)).assertEqual(9.87654321098765);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0700
     * @tc.name testDataViewSetFloat640007
     * @tc.desc Verify setFloat64 with hexadecimal byteOffset 0x08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new DataView(buf);
      view.setFloat64(0x08, 2.718281828);
      expect(view.getFloat64(0x08)).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0800
     * @tc.name testDataViewSetFloat640008
     * @tc.desc Verify setFloat64 at buffer end position fitting 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(8, 100.5);
      expect(view.getFloat64(8)).assertEqual(100.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_0900
     * @tc.name testDataViewSetFloat640009
     * @tc.desc Verify setFloat64 with byteOffset 0 as minimum valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      view.setFloat64(0, 42.0);
      expect(view.getFloat64(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1000
     * @tc.name testDataViewSetFloat640010
     * @tc.desc Verify setFloat64 returns expected result with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(-1, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1100
     * @tc.name testDataViewSetFloat640011
     * @tc.desc Verify setFloat64 returns expected result when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      try {
        view.setFloat64(1, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1200
     * @tc.name testDataViewSetFloat640012
     * @tc.desc Verify setFloat64 returns expected result when byteOffset equals bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      try {
        view.setFloat64(8, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1300
     * @tc.name testDataViewSetFloat640013
     * @tc.desc Verify setFloat64 returns expected result with max int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(2147483647, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1400
     * @tc.name testDataViewSetFloat640014
     * @tc.desc Verify setFloat64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(20, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1600
     * @tc.name testDataViewSetFloat640016
     * @tc.desc Verify setFloat64 with negative value -99.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -99.99);
      expect(view.getFloat64(0)).assertEqual(-99.99);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1700
     * @tc.name testDataViewSetFloat640017
     * @tc.desc Verify setFloat64 with zero value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 0.0);
      expect(view.getFloat64(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1800
     * @tc.name testDataViewSetFloat640018
     * @tc.desc Verify setFloat64 with scientific notation 1.0e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 1.0e10);
      expect(view.getFloat64(0)).assertEqual(1.0e10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_1900
     * @tc.name testDataViewSetFloat640019
     * @tc.desc Verify setFloat64 with high precision decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 0.12345678901234567);
      expect(view.getFloat64(0)).assertEqual(0.12345678901234567);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2000
     * @tc.name testDataViewSetFloat640020
     * @tc.desc Verify setFloat64 with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.MAX_VALUE);
      expect(view.getFloat64(0)).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2100
     * @tc.name testDataViewSetFloat640021
     * @tc.desc Verify setFloat64 with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.MIN_VALUE);
      expect(view.getFloat64(0)).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2200
     * @tc.name testDataViewSetFloat640022
     * @tc.desc Verify setFloat64 with negative Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -Number.MAX_VALUE);
      expect(view.getFloat64(0)).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2300
     * @tc.name testDataViewSetFloat640023
     * @tc.desc Verify setFloat64 with Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.EPSILON);
      expect(view.getFloat64(0)).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2400
     * @tc.name testDataViewSetFloat640024
     * @tc.desc Verify setFloat64 with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -0.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2500
     * @tc.name testDataViewSetFloat640025
     * @tc.desc Verify setFloat64 with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, NaN);
      let result = view.getFloat64(0);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2600
     * @tc.name testDataViewSetFloat640026
     * @tc.desc Verify setFloat64 with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Infinity);
      let result = view.getFloat64(0);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2700
     * @tc.name testDataViewSetFloat640027
     * @tc.desc Verify setFloat64 with negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -Infinity);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2800
     * @tc.name testDataViewSetFloat640028
     * @tc.desc Verify setFloat64 returns expected result with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 0.0);
        expect(view.getFloat64(0)).assertEqual(0.0);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_2900
     * @tc.name testDataViewSetFloat640029
     * @tc.desc Verify setFloat64 returns expected result with value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 1.5);
        expect(view.getFloat64(0)).assertEqual(1.5);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3000
     * @tc.name testDataViewSetFloat640030
     * @tc.desc Verify setFloat64 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(20, 3.14);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3300
     * @tc.name testDataViewSetFloat640033
     * @tc.desc Verify setFloat64 overload2 with three arguments including littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 3.5, false);
      expect(view.getFloat64(0, false)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3400
     * @tc.name testDataViewSetFloat640034
     * @tc.desc Verify setFloat64 overload2 with four extra arguments returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(100, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3500
     * @tc.name testDataViewSetFloat640035
     * @tc.desc Verify setFloat64 overload2 with byteOffset 0 and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 1.2345, true);
      expect(view.getFloat64(0, true)).assertEqual(1.2345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3600
     * @tc.name testDataViewSetFloat640036
     * @tc.desc Verify setFloat64 overload2 with byteOffset 8 and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(8, 6.789, false);
      expect(view.getFloat64(8, false)).assertEqual(6.789);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3700
     * @tc.name testDataViewSetFloat640037
     * @tc.desc Verify setFloat64 overload2 at buffer end with littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(8, 55.55, true);
      expect(view.getFloat64(8, true)).assertEqual(55.55);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3800
     * @tc.name testDataViewSetFloat640038
     * @tc.desc Verify setFloat64 overload2 returns expected result with negative byteOffset and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(-1, 3.5, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_3900
     * @tc.name testDataViewSetFloat640039
     * @tc.desc Verify setFloat64 overload2 returns expected result when byteOffset exceeds range with littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      try {
        view.setFloat64(1, 3.5, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4000
     * @tc.name testDataViewSetFloat640040
     * @tc.desc Verify setFloat64 overload2 with normal float and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 2.718281828, true);
      expect(view.getFloat64(0, true)).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4100
     * @tc.name testDataViewSetFloat640041
     * @tc.desc Verify setFloat64 overload2 with negative value and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -3.14159265358979, false);
      expect(view.getFloat64(0, false)).assertEqual(-3.14159265358979);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4200
     * @tc.name testDataViewSetFloat640042
     * @tc.desc Verify setFloat64 overload2 with Number.MAX_VALUE and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.MAX_VALUE, true);
      expect(view.getFloat64(0, true)).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4300
     * @tc.name testDataViewSetFloat640043
     * @tc.desc Verify setFloat64 overload2 with Number.MIN_VALUE and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.MIN_VALUE, false);
      expect(view.getFloat64(0, false)).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4400
     * @tc.name testDataViewSetFloat640044
     * @tc.desc Verify setFloat64 overload2 with NaN and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, NaN, true);
      let result = view.getFloat64(0, true);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4500
     * @tc.name testDataViewSetFloat640045
     * @tc.desc Verify setFloat64 overload2 with Infinity and littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Infinity, true);
      let result = view.getFloat64(0, true);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_4600
     * @tc.name testDataViewSetFloat640046
     * @tc.desc Verify setFloat64 overload2 with negative Infinity and littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -Infinity, false);
      let result = view.getFloat64(0, false);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5100
     * @tc.name testDataViewSetFloat640051
     * @tc.desc Verify setFloat64 returns expected result when littleEndian is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5, false);
        expect(view.getFloat64(0, false)).assertEqual(3.5);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5200
     * @tc.name testDataViewSetFloat640052
     * @tc.desc Verify setFloat64 with undefined littleEndian behaves as omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 3.5, undefined);
      expect(view.getFloat64(0)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5500
     * @tc.name testDataViewSetFloat640055
     * @tc.desc Verify setFloat64 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      let result = view.setFloat64(0, 3.5);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5600
     * @tc.name testDataViewSetFloat640056
     * @tc.desc Verify setFloat64 void return has no usable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      let ret = view.setFloat64(0, 42.0);
      expect(ret == undefined).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5800
     * @tc.name testDataViewSetFloat640058
     * @tc.desc Verify setFloat64 writes to multiple offsets and reads back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new DataView(buf);
      view.setFloat64(0, 1.1);
      view.setFloat64(8, 2.2);
      view.setFloat64(16, 3.3);
      expect(view.getFloat64(0)).assertEqual(1.1);
      expect(view.getFloat64(8)).assertEqual(2.2);
      expect(view.getFloat64(16)).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_5900
     * @tc.name testDataViewSetFloat640059
     * @tc.desc Verify setFloat64 overwrites at same position and reads latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 1.0);
      view.setFloat64(0, 2.0);
      expect(view.getFloat64(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6000
     * @tc.name testDataViewSetFloat640060
     * @tc.desc Verify setFloat64 preserves 15-digit precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 0.123456789012345);
      let result = view.getFloat64(0);
      expect(Math.abs(result - 0.123456789012345) < 1e-15).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6100
     * @tc.name testDataViewSetFloat640061
     * @tc.desc Verify setFloat64 preserves large number precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 1.7976931348623157e+308);
      expect(view.getFloat64(0)).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6300
     * @tc.name testDataViewSetFloat640063
     * @tc.desc Verify setFloat64 overload2 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      let result = view.setFloat64(0, 3.5, true);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6400
     * @tc.name testDataViewSetFloat640064
     * @tc.desc Verify setFloat64 big-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 123.456, false);
      expect(view.getFloat64(0, false)).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6500
     * @tc.name testDataViewSetFloat640065
     * @tc.desc Verify setFloat64 big-endian write byte order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      view.setFloat64(0, 1.0, false);
      let b0 = view.getUint8(0);
      let b7 = view.getUint8(7);
      expect(b0).assertEqual(0x3F);
      expect(b7).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6600
     * @tc.name testDataViewSetFloat640066
     * @tc.desc Verify setFloat64 little-endian write and read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 123.456, true);
      expect(view.getFloat64(0, true)).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6700
     * @tc.name testDataViewSetFloat640067
     * @tc.desc Verify setFloat64 little-endian write byte order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      view.setFloat64(0, 1.0, true);
      let b0 = view.getUint8(0);
      let b7 = view.getUint8(7);
      expect(b0).assertEqual(0x00);
      expect(b7).assertEqual(0x3F);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6800
     * @tc.name testDataViewSetFloat640068
     * @tc.desc Verify setFloat64 big-endian write read as little-endian differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 123.456, false);
      let result = view.getFloat64(0, true);
      expect(result != 123.456).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_6900
     * @tc.name testDataViewSetFloat640069
     * @tc.desc Verify setFloat64 little-endian write read as big-endian differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 123.456, true);
      let result = view.getFloat64(0, false);
      expect(result != 123.456).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7000
     * @tc.name testDataViewSetFloat640070
     * @tc.desc Verify setFloat64 writes same value with different endianness at different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 3.14, false);
      view.setFloat64(8, 3.14, true);
      expect(view.getFloat64(0, false)).assertEqual(3.14);
      expect(view.getFloat64(8, true)).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7200
     * @tc.name testDataViewSetFloat640072
     * @tc.desc Verify setFloat64 Infinity write and big-endian read remains Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Infinity, false);
      let result = view.getFloat64(0, false);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7300
     * @tc.name testDataViewSetFloat640073
     * @tc.desc Verify setFloat64 negative Infinity write and little-endian read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -Infinity, true);
      let result = view.getFloat64(0, true);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7400
     * @tc.name testDataViewSetFloat640074
     * @tc.desc Verify setFloat64 negative zero write and read distinguishes from positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, -0.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(-0.0);
      expect(1 / result == -Infinity).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7500
     * @tc.name testDataViewSetFloat640075
     * @tc.desc Verify setFloat64 positive zero write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, 0.0);
      let result = view.getFloat64(0);
      expect(result).assertEqual(0.0);
      expect(1 / result == Infinity).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7600
     * @tc.name testDataViewSetFloat640076
     * @tc.desc Verify setFloat64 Number.MAX_VALUE write and big-endian read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.MAX_VALUE, false);
      expect(view.getFloat64(0, false)).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7700
     * @tc.name testDataViewSetFloat640077
     * @tc.desc Verify setFloat64 Number.EPSILON write and little-endian read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      view.setFloat64(0, Number.EPSILON, true);
      expect(view.getFloat64(0, true)).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7800
     * @tc.name testDataViewSetFloat640078
     * @tc.desc Verify setFloat64 returns expected result when ArrayBuffer is smaller than 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_7900
     * @tc.name testDataViewSetFloat640079
     * @tc.desc Verify setFloat64 returns expected result when ArrayBuffer has zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8100
     * @tc.name testDataViewSetFloat640081
     * @tc.desc Verify setFloat64 returns expected result when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(16, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8200
     * @tc.name testDataViewSetFloat640082
     * @tc.desc Verify setFloat64 returns expected result when byteOffset exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      try {
        view.setFloat64(100, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8400
     * @tc.name testDataViewSetFloat640084
     * @tc.desc Verify setFloat64 returns expected result with byteOffset -8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(-8, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8500
     * @tc.name testDataViewSetFloat640085
     * @tc.desc Verify setFloat64 returns expected result with minimum int byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf);
      try {
        view.setFloat64(-2147483648, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8700
     * @tc.name testDataViewSetFloat640087
     * @tc.desc Verify setFloat64 out-of-bounds write triggers exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8800
     * @tc.name testDataViewSetFloat640088
     * @tc.desc Verify setFloat64 writes a float64 value correctly under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      view.setFloat64(0, 3.5);
      let result = view.getFloat64(0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_8900
     * @tc.name testDataViewSetFloat640089
     * @tc.desc Verify setFloat64 throws a RangeError when the buffer is too small for float64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2);
        let view = new DataView(buf);
        view.setFloat64(0, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9000
     * @tc.name testDataViewSetFloat640090
     * @tc.desc Verify caught exception object has message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9100
     * @tc.name testDataViewSetFloat640091
     * @tc.desc Verify setFloat64 overload2 returns expected result when buffer smaller than 8 bytes with littleEndian=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view = new DataView(buf);
      try {
        view.setFloat64(0, 3.5, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9200
     * @tc.name testDataViewSetFloat640092
     * @tc.desc Verify setFloat64 overload2 returns expected result when byteOffset exceeds range with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new DataView(buf);
      try {
        view.setFloat64(1, 3.5, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9400
     * @tc.name testDataViewSetFloat640094
     * @tc.desc Verify setFloat64 offset is relative to DataView start when DataView has byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new DataView(buf, 8, 16);
      view.setFloat64(0, 1.0);
      view.setFloat64(8, 2.0);
      expect(view.getFloat64(0)).assertEqual(1.0);
      expect(view.getFloat64(8)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9500
     * @tc.name testDataViewSetFloat640095
     * @tc.desc Verify setFloat64 returns expected result when offset plus 8 exceeds DataView byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new DataView(buf, 8, 8);
      try {
        view.setFloat64(8, 3.5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F64_9600
     * @tc.name testDataViewSetFloat640096
     * @tc.desc Verify setFloat64 writes successfully when DataView length is exactly 8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat640096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view = new DataView(buf, 4, 8);
      view.setFloat64(0, 7.77);
      expect(view.getFloat64(0)).assertEqual(7.77);
    });
  })
};
