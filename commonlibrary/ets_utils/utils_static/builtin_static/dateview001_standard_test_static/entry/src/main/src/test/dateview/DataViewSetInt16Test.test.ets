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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DataViewSetInt16Test(): void {
  describe('DataViewSetInt16Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0100
     * @tc.name testDataViewSetInt160001
     * @tc.desc Verify setInt16 with 2 required parameters byteOffset and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258);
      expect(view.getInt16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0200
     * @tc.name testDataViewSetInt160002
     * @tc.desc Verify setInt16 with 3 required parameters byteOffset, value and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258, true);
      expect(view.getInt16(0, true)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0300
     * @tc.name testDataViewSetInt160003
     * @tc.desc Verify setInt16 with 2 parameters omitting optional littleEndian using default byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258.0);
      expect(view.getInt16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0400
     * @tc.name testDataViewSetInt160004
     * @tc.desc Verify setInt16 with 3 parameters including optional littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258.0, true);
      expect(view.getInt16(0, true)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0500
     * @tc.name testDataViewSetInt160005
     * @tc.desc Verify setInt16 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(10, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0600
     * @tc.name testDataViewSetInt160006
     * @tc.desc Verify setInt16 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0700
     * @tc.name testDataViewSetInt160007
     * @tc.desc Verify setInt16 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(100, 258);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0800
     * @tc.name testDataViewSetInt160008
     * @tc.desc Verify setInt16 byteOffset 0 writes at the beginning of DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 100);
      expect(view.getInt16(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_0900
     * @tc.name testDataViewSetInt160009
     * @tc.desc Verify setInt16 byteOffset 1 writes at offset 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(1, 200);
      expect(view.getInt16(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1000
     * @tc.name testDataViewSetInt160010
     * @tc.desc Verify setInt16 byteOffset 2 writes at offset 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 300);
      expect(view.getInt16(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1100
     * @tc.name testDataViewSetInt160011
     * @tc.desc Verify setInt16 byteOffset at buffer.byteLength - 2 is last valid position for 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 1234);
      expect(view.getInt16(2)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1200
     * @tc.name testDataViewSetInt160012
     * @tc.desc Verify setInt16 returns expected result when byteOffset is int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-2147483648, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1300
     * @tc.name testDataViewSetInt160013
     * @tc.desc Verify setInt16 returns expected result when byteOffset is int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(2147483647, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1400
     * @tc.name testDataViewSetInt160014
     * @tc.desc Verify setInt16 returns expected result when byteOffset is -1 negative offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1500
     * @tc.name testDataViewSetInt160015
     * @tc.desc Verify setInt16 returns expected result when byteOffset is buffer.byteLength - 1 with only 1 byte remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(3, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1600
     * @tc.name testDataViewSetInt160016
     * @tc.desc Verify setInt16 returns expected result when byteOffset equals buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(4, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1700
     * @tc.name testDataViewSetInt160017
     * @tc.desc Verify setInt16 returns expected result when byteOffset is much larger than buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_1800
     * @tc.name testDataViewSetInt160018
     * @tc.desc Verify setInt16 value 0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2000
     * @tc.name testDataViewSetInt160020
     * @tc.desc Verify setInt16 negative value -258 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -258);
      expect(view.getInt16(0)).assertEqual(-258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2100
     * @tc.name testDataViewSetInt160021
     * @tc.desc Verify setInt16 value -1 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -1);
      expect(view.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2200
     * @tc.name testDataViewSetInt160022
     * @tc.desc Verify setInt16 value 1 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 1);
      expect(view.getInt16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2300
     * @tc.name testDataViewSetInt160023
     * @tc.desc Verify setInt16 value int16 min -32768 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32768);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2400
     * @tc.name testDataViewSetInt160024
     * @tc.desc Verify setInt16 value int16 max 32767 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32767);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2500
     * @tc.name testDataViewSetInt160025
     * @tc.desc Verify setInt16 value int min -2147483648 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -2147483648);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2600
     * @tc.name testDataViewSetInt160026
     * @tc.desc Verify setInt16 value int max 2147483647 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 2147483647);
      expect(view.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2700
     * @tc.name testDataViewSetInt160027
     * @tc.desc Verify setInt16 value -32769 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32769);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2800
     * @tc.name testDataViewSetInt160028
     * @tc.desc Verify setInt16 value 32768 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32768);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_2900
     * @tc.name testDataViewSetInt160029
     * @tc.desc Verify setInt16 value 0x7FFF hex equals 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0x7FFF);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3000
     * @tc.name testDataViewSetInt160030
     * @tc.desc Verify setInt16 value 0x8000 hex beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0x8000);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3100
     * @tc.name testDataViewSetInt160031
     * @tc.desc Verify setInt16 value 0b0111111111111111 binary equals 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0b0111111111111111);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3300
     * @tc.name testDataViewSetInt160033
     * @tc.desc Verify setInt16 byteOffset 2 with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 500, false);
      expect(view.getInt16(2, false)).assertEqual(500);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3400
     * @tc.name testDataViewSetInt160034
     * @tc.desc Verify setInt16 byteOffset at buffer.byteLength - 2 with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, -1000, true);
      expect(view.getInt16(2, true)).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3500
     * @tc.name testDataViewSetInt160035
     * @tc.desc Verify setInt16 returns expected result when byteOffset is -1 with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-1, 100, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3600
     * @tc.name testDataViewSetInt160036
     * @tc.desc Verify setInt16 returns expected result when byteOffset equals buffer.byteLength with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(4, 100, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3700
     * @tc.name testDataViewSetInt160037
     * @tc.desc Verify setInt16 positive value with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 12345, true);
      expect(view.getInt16(0, true)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3800
     * @tc.name testDataViewSetInt160038
     * @tc.desc Verify setInt16 negative value with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -12345, false);
      expect(view.getInt16(0, false)).assertEqual(-12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_3900
     * @tc.name testDataViewSetInt160039
     * @tc.desc Verify setInt16 value 0 with littleEndian parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0, true);
      expect(view.getInt16(0, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4000
     * @tc.name testDataViewSetInt160040
     * @tc.desc Verify setInt16 value int16 min -32768 with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32768, true);
      expect(view.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4100
     * @tc.name testDataViewSetInt160041
     * @tc.desc Verify setInt16 value int16 max 32767 with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32767, false);
      expect(view.getInt16(0, false)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4200
     * @tc.name testDataViewSetInt160042
     * @tc.desc Verify setInt16 value 32768 beyond int16 range with littleEndian parameter truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32768, true);
      expect(view.getInt16(0, true)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4300
     * @tc.name testDataViewSetInt160043
     * @tc.desc Verify setInt16 value -32769 beyond int16 range with littleEndian parameter truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32769, false);
      expect(view.getInt16(0, false)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4500
     * @tc.name testDataViewSetInt160045
     * @tc.desc Verify setInt16 littleEndian false writes in big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258, false);
      expect(view.getInt16(0, false)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4600
     * @tc.name testDataViewSetInt160046
     * @tc.desc Verify setInt16 littleEndian true and false produce different byte content at same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(4));
      const view2 = new DataView(new ArrayBuffer(4));
      view1.setInt16(0, 258, true);
      view2.setInt16(0, 258, false);
      let byte0_le = view1.getUint8(0);
      let byte1_le = view1.getUint8(1);
      let byte0_be = view2.getUint8(0);
      let byte1_be = view2.getUint8(1);
      expect(byte0_le).assertEqual(2);
      expect(byte1_le).assertEqual(1);
      expect(byte0_be).assertEqual(1);
      expect(byte1_be).assertEqual(2);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4800
     * @tc.name testDataViewSetInt160048
     * @tc.desc Verify setInt16 byteOffset 2 with number type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 100.0);
      expect(view.getInt16(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4900
     * @tc.name testDataViewSetInt160049
     * @tc.desc Verify setInt16 byteOffset at buffer.byteLength - 2 with number type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 999.0);
      expect(view.getInt16(2)).assertEqual(999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5000
     * @tc.name testDataViewSetInt160050
     * @tc.desc Verify setInt16 returns expected result when byteOffset is -1 with number type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-1, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5100
     * @tc.name testDataViewSetInt160051
     * @tc.desc Verify setInt16 returns expected result when byteOffset equals buffer.byteLength with number type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(4, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5300
     * @tc.name testDataViewSetInt160053
     * @tc.desc Verify setInt16 value 0.0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0.0);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5400
     * @tc.name testDataViewSetInt160054
     * @tc.desc Verify setInt16 negative number value -100.0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -100.0);
      expect(view.getInt16(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5500
     * @tc.name testDataViewSetInt160055
     * @tc.desc Verify setInt16 value 1.0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 1.0);
      expect(view.getInt16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5600
     * @tc.name testDataViewSetInt160056
     * @tc.desc Verify setInt16 value -1.0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -1.0);
      expect(view.getInt16(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5700
     * @tc.name testDataViewSetInt160057
     * @tc.desc Verify setInt16 value int16 min -32768.0 as number type writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32768.0);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5800
     * @tc.name testDataViewSetInt160058
     * @tc.desc Verify setInt16 value int16 max 32767.0 as number type writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32767.0);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5900
     * @tc.name testDataViewSetInt160059
     * @tc.desc Verify setInt16 value 32768.0 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 32768.0);
      expect(view.getInt16(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6000
     * @tc.name testDataViewSetInt160060
     * @tc.desc Verify setInt16 value -32769.0 beyond int16 range truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -32769.0);
      expect(view.getInt16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6100
     * @tc.name testDataViewSetInt160061
     * @tc.desc Verify setInt16 value 258.5 decimal truncates to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258.5);
      expect(view.getInt16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6200
     * @tc.name testDataViewSetInt160062
     * @tc.desc Verify setInt16 value 0.1 decimal truncates to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 0.1);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6300
     * @tc.name testDataViewSetInt160063
     * @tc.desc Verify setInt16 value -0.0 writes as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -0.0);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6400
     * @tc.name testDataViewSetInt160064
     * @tc.desc Verify setInt16 value NaN writes result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, NaN);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6500
     * @tc.name testDataViewSetInt160065
     * @tc.desc Verify setInt16 value Infinity writes result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, Infinity);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6600
     * @tc.name testDataViewSetInt160066
     * @tc.desc Verify setInt16 value -Infinity writes result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, -Infinity);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6700
     * @tc.name testDataViewSetInt160067
     * @tc.desc Verify setInt16 value Number.MAX_VALUE truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, Number.MAX_VALUE);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6800
     * @tc.name testDataViewSetInt160068
     * @tc.desc Verify setInt16 value Number.MIN_VALUE smallest positive truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, Number.MIN_VALUE);
      expect(view.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_6900
     * @tc.name testDataViewSetInt160069
     * @tc.desc Verify setInt16 value scientific notation 1.0e3 equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 1.0e3);
      expect(view.getInt16(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7200
     * @tc.name testDataViewSetInt160072
     * @tc.desc Verify setInt16 littleEndian false writes number value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258.0, false);
      expect(view.getInt16(0, false)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7300
     * @tc.name testDataViewSetInt160073
     * @tc.desc Verify setInt16 same number value with little-endian and big-endian produces different bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(4));
      const view2 = new DataView(new ArrayBuffer(4));
      view1.setInt16(0, 258.0, true);
      view2.setInt16(0, 258.0, false);
      expect(view1.getUint8(0)).assertEqual(2);
      expect(view1.getUint8(1)).assertEqual(1);
      expect(view2.getUint8(0)).assertEqual(1);
      expect(view2.getUint8(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7400
     * @tc.name testDataViewSetInt160074
     * @tc.desc Verify setInt16 overload 1 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      let result = view.setInt16(0, 258);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7500
     * @tc.name testDataViewSetInt160075
     * @tc.desc Verify setInt16 overload 2 with littleEndian returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      let result = view.setInt16(0, 258, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7600
     * @tc.name testDataViewSetInt160076
     * @tc.desc Verify setInt16 overload 3 with number value returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      let result = view.setInt16(0, 258.0, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_8500
     * @tc.name testDataViewSetInt160085
     * @tc.desc Verify setInt16 multiple writes to same position overwrites previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 100);
      view.setInt16(0, 200);
      expect(view.getInt16(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_8600
     * @tc.name testDataViewSetInt160086
     * @tc.desc Verify setInt16 writes at different positions do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt16(0, 100);
      view.setInt16(2, 200);
      view.setInt16(4, 300);
      expect(view.getInt16(0)).assertEqual(100);
      expect(view.getInt16(2)).assertEqual(200);
      expect(view.getInt16(4)).assertEqual(300);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_8700
     * @tc.name testDataViewSetInt160087
     * @tc.desc Verify setInt16 little-endian write then big-endian read produces different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 258, true);
      let bigEndianRead = view.getInt16(0, false);
      let littleEndianRead = view.getInt16(0, true);
      expect(littleEndianRead).assertEqual(258);
      expect(bigEndianRead).assertEqual(513);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9100
     * @tc.name testDataViewSetInt160091
     * @tc.desc Verify setInt16 returns expected result when byteOffset exceeds buffer length overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(10, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9200
     * @tc.name testDataViewSetInt160092
     * @tc.desc Verify setInt16 returns expected result when byteOffset exceeds buffer length overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(10, 100, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9300
     * @tc.name testDataViewSetInt160093
     * @tc.desc Verify setInt16 returns expected result when byteOffset exceeds buffer length overload 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(10, 100.0, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9500
     * @tc.name testDataViewSetInt160095
     * @tc.desc Verify setInt16 succeeds when buffer has exactly 2 bytes remaining at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(2, 100);
      expect(view.getInt16(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9600
     * @tc.name testDataViewSetInt160096
     * @tc.desc Verify setInt16 on 2-byte buffer with byteOffset 0 succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt16(0, 1000);
      expect(view.getInt16(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9700
     * @tc.name testDataViewSetInt160097
     * @tc.desc Verify setInt16 returns expected result on 2-byte buffer with byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt16(1, 1000);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_9800
     * @tc.name testDataViewSetInt160098
     * @tc.desc Verify setInt16 returns expected result on 1-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(1));
      try {
        view.setInt16(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4400
     * @tc.name testDataViewSetInt160103
     * @tc.desc Verify setInt16 negative byteOffset enters catch branch with Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt16(-5, 258);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_4700
     * @tc.name testDataViewSetInt160104
     * @tc.desc Verify setInt16 on DataView with offset and length out-of-bounds returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 4, 2);
      view.setInt16(0, 100);
      expect(view.getInt16(0)).assertEqual(100);
      try {
        view.setInt16(2, 200);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_5200
     * @tc.name testDataViewSetInt160105
     * @tc.desc Verify setInt16 on DataView with offset and length within valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      view.setInt16(0, 1234);
      view.setInt16(2, 5678);
      expect(view.getInt16(0)).assertEqual(1234);
      expect(view.getInt16(2)).assertEqual(5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7000
     * @tc.name testDataViewSetInt160106
     * @tc.desc Verify setInt16 on 0-byte buffer always fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setInt16(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I16_7100
     * @tc.name testDataViewSetInt160107
     * @tc.desc Verify setInt16 consecutive writes with different byte orders last write takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt160107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt16(0, 100, false);
      view.setInt16(0, 200, true);
      expect(view.getInt16(0, true)).assertEqual(200);
    });
  })
}
