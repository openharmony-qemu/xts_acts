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

export default function DataViewSetUint16Test(): void {
  describe('DataViewSetUint16Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0100
     * @tc.name testDataViewSetUint160001
     * @tc.desc Verify setUint16 with 2 required parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258);
      expect(view.getUint16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0200
     * @tc.name testDataViewSetUint160002
     * @tc.desc Verify setUint16 throws when value parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(4, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0300
     * @tc.name testDataViewSetUint160003
     * @tc.desc Verify setUint16 throws when all parameters are missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0400
     * @tc.name testDataViewSetUint160004
     * @tc.desc Verify setUint16 throws when extra 3rd parameter is passed for overload 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(100, 258, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0500
     * @tc.name testDataViewSetUint160005
     * @tc.desc Verify setUint16 with 3 required parameters for overload 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258, false);
      expect(view.getUint16(0, false)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0600
     * @tc.name testDataViewSetUint160006
     * @tc.desc Verify setUint16 overload 2 throws when littleEndian is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(4, 258, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0700
     * @tc.name testDataViewSetUint160007
     * @tc.desc Verify setUint16 overload 2 throws when value and littleEndian are missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 1, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0800
     * @tc.name testDataViewSetUint160008
     * @tc.desc Verify setUint16 with 2 required parameters omitting optional littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258.0);
      expect(view.getUint16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0900
     * @tc.name testDataViewSetUint160009
     * @tc.desc Verify setUint16 with 3 parameters including optional littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258.0, false);
      expect(view.getUint16(0, false)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1000
     * @tc.name testDataViewSetUint160010
     * @tc.desc Verify setUint16 uses big-endian when littleEndian is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234);
      expect(view.getUint16(0, false)).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1100
     * @tc.name testDataViewSetUint160011
     * @tc.desc Verify setUint16 uses little-endian when littleEndian is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, true);
      expect(view.getUint16(0, true)).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1200
     * @tc.name testDataViewSetUint160012
     * @tc.desc Verify setUint16 with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1000);
      expect(view.getUint16(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1300
     * @tc.name testDataViewSetUint160013
     * @tc.desc Verify setUint16 with byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(1, 500);
      expect(view.getUint16(1)).assertEqual(500);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1400
     * @tc.name testDataViewSetUint160014
     * @tc.desc Verify setUint16 with byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(2, 9999);
      expect(view.getUint16(2)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1500
     * @tc.name testDataViewSetUint160015
     * @tc.desc Verify setUint16 with max valid byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(2, 65535);
      expect(view.getUint16(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1600
     * @tc.name testDataViewSetUint160016
     * @tc.desc Verify setUint16 with min valid byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1700
     * @tc.name testDataViewSetUint160017
     * @tc.desc Verify setUint16 throws when byteOffset causes 1-byte overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(3, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1800
     * @tc.name testDataViewSetUint160018
     * @tc.desc Verify setUint16 throws when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(4, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_1900
     * @tc.name testDataViewSetUint160019
     * @tc.desc Verify setUint16 throws with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2000
     * @tc.name testDataViewSetUint160020
     * @tc.desc Verify setUint16 throws with large negative byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2200
     * @tc.name testDataViewSetUint160022
     * @tc.desc Verify setUint16 with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1);
      expect(view.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2300
     * @tc.name testDataViewSetUint160023
     * @tc.desc Verify setUint16 with value 256 crossing byte boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 256);
      expect(view.getUint16(0)).assertEqual(256);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2500
     * @tc.name testDataViewSetUint160025
     * @tc.desc Verify setUint16 with value 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 10000);
      expect(view.getUint16(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2600
     * @tc.name testDataViewSetUint160026
     * @tc.desc Verify setUint16 with value 32767 signed 16-bit max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 32767);
      expect(view.getUint16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2700
     * @tc.name testDataViewSetUint160027
     * @tc.desc Verify setUint16 with value 65535 unsigned 16-bit max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2800
     * @tc.name testDataViewSetUint160028
     * @tc.desc Verify setUint16 with hexadecimal value 0x1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234);
      expect(view.getUint16(0)).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2900
     * @tc.name testDataViewSetUint160029
     * @tc.desc Verify setUint16 with octal value 0o77777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0o77777);
      expect(view.getUint16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3000
     * @tc.name testDataViewSetUint160030
     * @tc.desc Verify setUint16 with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0b1010101010101010);
      expect(view.getUint16(0)).assertEqual(43690);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3300
     * @tc.name testDataViewSetUint160033
     * @tc.desc Verify setUint16 with value 32768 at signed boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 32768);
      expect(view.getUint16(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3400
     * @tc.name testDataViewSetUint160034
     * @tc.desc Verify setUint16 with value 65534 near max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65534);
      expect(view.getUint16(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3500
     * @tc.name testDataViewSetUint160035
     * @tc.desc Verify setUint16 truncates 65536 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65536);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3600
     * @tc.name testDataViewSetUint160036
     * @tc.desc Verify setUint16 truncates 65537 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65537);
      expect(view.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3700
     * @tc.name testDataViewSetUint160037
     * @tc.desc Verify setUint16 truncates -1 to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -1);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3800
     * @tc.name testDataViewSetUint160038
     * @tc.desc Verify setUint16 truncates -100 to 65436
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -100);
      expect(view.getUint16(0)).assertEqual(65436);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3900
     * @tc.name testDataViewSetUint160039
     * @tc.desc Verify setUint16 truncates 131071 to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 131071);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4000
     * @tc.name testDataViewSetUint160040
     * @tc.desc Verify setUint16 truncates 131072 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 131072);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4100
     * @tc.name testDataViewSetUint160041
     * @tc.desc Verify setUint16 truncates int max to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 2147483647);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4200
     * @tc.name testDataViewSetUint160042
     * @tc.desc Verify setUint16 truncates int min to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -2147483648);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4300
     * @tc.name testDataViewSetUint160043
     * @tc.desc Verify setUint16 overload 2 with byteOffset 0 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, false);
      expect(view.getUint16(0, false)).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4400
     * @tc.name testDataViewSetUint160044
     * @tc.desc Verify setUint16 overload 2 with byteOffset 2 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(2, 0x5678, true);
      expect(view.getUint16(2, true)).assertEqual(0x5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4500
     * @tc.name testDataViewSetUint160045
     * @tc.desc Verify setUint16 overload 2 with max valid byteOffset and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(2, 65535, true);
      expect(view.getUint16(2, true)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4700
     * @tc.name testDataViewSetUint160047
     * @tc.desc Verify setUint16 overload 2 with value 0xABCD little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0xABCD, true);
      expect(view.getUint16(0, true)).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4800
     * @tc.name testDataViewSetUint160048
     * @tc.desc Verify setUint16 overload 2 with value 0 big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0, false);
      expect(view.getUint16(0, false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4900
     * @tc.name testDataViewSetUint160049
     * @tc.desc Verify setUint16 overload 2 with value 65535 little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535, true);
      expect(view.getUint16(0, true)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5200
     * @tc.name testDataViewSetUint160052
     * @tc.desc Verify setUint16 overload 2 with value 32768 big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 32768, false);
      expect(view.getUint16(0, false)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5300
     * @tc.name testDataViewSetUint160053
     * @tc.desc Verify setUint16 overload 2 truncates 65536 little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65536, true);
      expect(view.getUint16(0, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5400
     * @tc.name testDataViewSetUint160054
     * @tc.desc Verify setUint16 overload 2 truncates -1 big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -1, false);
      expect(view.getUint16(0, false)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5700
     * @tc.name testDataViewSetUint160057
     * @tc.desc Verify different byte order produces different underlying bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(4);
      const view1 = new DataView(buf1);
      view1.setUint16(0, 0x1234, false);
      const buf2 = new ArrayBuffer(4);
      const view2 = new DataView(buf2);
      view2.setUint16(0, 0x1234, true);
      expect(view1.getUint8(0)).assertEqual(0x12);
      expect(view1.getUint8(1)).assertEqual(0x34);
      expect(view2.getUint8(0)).assertEqual(0x34);
      expect(view2.getUint8(1)).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5900
     * @tc.name testDataViewSetUint160059
     * @tc.desc Verify setUint16 overload 3 with byteOffset 1 and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(1, 1000.0);
      expect(view.getUint16(1)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6000
     * @tc.name testDataViewSetUint160060
     * @tc.desc Verify setUint16 overload 3 with max valid byteOffset and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(2, 65535.0);
      expect(view.getUint16(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6200
     * @tc.name testDataViewSetUint160062
     * @tc.desc Verify setUint16 overload 3 with number value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0.0);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6300
     * @tc.name testDataViewSetUint160063
     * @tc.desc Verify setUint16 overload 3 with number value 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535.0);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6400
     * @tc.name testDataViewSetUint160064
     * @tc.desc Verify setUint16 overload 3 with number value 32767.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 32767.0);
      expect(view.getUint16(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6500
     * @tc.name testDataViewSetUint160065
     * @tc.desc Verify setUint16 overload 3 with number value 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1.0);
      expect(view.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6700
     * @tc.name testDataViewSetUint160067
     * @tc.desc Verify setUint16 truncates 258.5 to 258
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258.5);
      expect(view.getUint16(0)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6800
     * @tc.name testDataViewSetUint160068
     * @tc.desc Verify setUint16 truncates 0.1 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0.1);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6900
     * @tc.name testDataViewSetUint160069
     * @tc.desc Verify setUint16 truncates 1.9 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1.9);
      expect(view.getUint16(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7000
     * @tc.name testDataViewSetUint160070
     * @tc.desc Verify setUint16 truncates 65535.9 to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535.9);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7100
     * @tc.name testDataViewSetUint160071
     * @tc.desc Verify setUint16 truncates 0.999 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0.999);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7200
     * @tc.name testDataViewSetUint160072
     * @tc.desc Verify setUint16 truncates 100.5 to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 100.5);
      expect(view.getUint16(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7300
     * @tc.name testDataViewSetUint160073
     * @tc.desc Verify setUint16 truncates -0.0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -0.0);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7400
     * @tc.name testDataViewSetUint160074
     * @tc.desc Verify setUint16 truncates NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, NaN);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7500
     * @tc.name testDataViewSetUint160075
     * @tc.desc Verify setUint16 truncates Infinity to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, Infinity);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7600
     * @tc.name testDataViewSetUint160076
     * @tc.desc Verify setUint16 truncates -Infinity to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -Infinity);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7700
     * @tc.name testDataViewSetUint160077
     * @tc.desc Verify setUint16 truncates Number.MAX_VALUE to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, Number.MAX_VALUE);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7800
     * @tc.name testDataViewSetUint160078
     * @tc.desc Verify setUint16 truncates Number.MIN_VALUE to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, Number.MIN_VALUE);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_7900
     * @tc.name testDataViewSetUint160079
     * @tc.desc Verify setUint16 truncates Number.POSITIVE_INFINITY to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, Number.POSITIVE_INFINITY);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8000
     * @tc.name testDataViewSetUint160080
     * @tc.desc Verify setUint16 truncates Number.NEGATIVE_INFINITY to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, Number.NEGATIVE_INFINITY);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8100
     * @tc.name testDataViewSetUint160081
     * @tc.desc Verify setUint16 truncates 65536.0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65536.0);
      expect(view.getUint16(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8200
     * @tc.name testDataViewSetUint160082
     * @tc.desc Verify setUint16 truncates -1.0 to 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -1.0);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8300
     * @tc.name testDataViewSetUint160083
     * @tc.desc Verify setUint16 truncates -100.5 to 65436
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, -100.5);
      expect(view.getUint16(0)).assertEqual(65436);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8400
     * @tc.name testDataViewSetUint160084
     * @tc.desc Verify setUint16 truncates 1.0e6 to 16960
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1.0e6);
      expect(view.getUint16(0)).assertEqual(16960);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8600
     * @tc.name testDataViewSetUint160086
     * @tc.desc Verify setUint16 overload 3 with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 258.0, true);
      expect(view.getUint16(0, true)).assertEqual(258);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8800
     * @tc.name testDataViewSetUint160088
     * @tc.desc Verify setUint16 overload 1 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      const result = view.setUint16(0, 258);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8900
     * @tc.name testDataViewSetUint160089
     * @tc.desc Verify setUint16 overload 2 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      const result = view.setUint16(0, 258, false);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9000
     * @tc.name testDataViewSetUint160090
     * @tc.desc Verify setUint16 overload 3 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      const result = view.setUint16(0, 258.0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9200
     * @tc.name testDataViewSetUint160092
     * @tc.desc Verify write 0xABCD with default endianness and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0xABCD);
      expect(view.getUint16(0)).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9300
     * @tc.name testDataViewSetUint160093
     * @tc.desc Verify write 0xABCD big-endian and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0xABCD, false);
      expect(view.getUint16(0, false)).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9400
     * @tc.name testDataViewSetUint160094
     * @tc.desc Verify write 65535 big-endian and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535, false);
      expect(view.getUint16(0, false)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9600
     * @tc.name testDataViewSetUint160096
     * @tc.desc Verify write 65535.0 big-endian and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 65535.0, false);
      expect(view.getUint16(0, false)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_0100
     * @tc.name testDataViewSetUint160100
     * @tc.desc Verify write 0.0 little-endian and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0.0, true);
      expect(view.getUint16(0, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_4600
     * @tc.name testDataViewSetUint160101
     * @tc.desc Verify writing at different offsets and reading back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1111);
      view.setUint16(2, 0x2222);
      expect(view.getUint16(0)).assertEqual(0x1111);
      expect(view.getUint16(2)).assertEqual(0x2222);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5000
     * @tc.name testDataViewSetUint160102
     * @tc.desc Verify mixed endianness at different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, false);
      view.setUint16(2, 0x5678, true);
      expect(view.getUint16(0, false)).assertEqual(0x1234);
      expect(view.getUint16(2, true)).assertEqual(0x5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5100
     * @tc.name testDataViewSetUint160103
     * @tc.desc Verify overwrite at same offset keeps last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1000);
      view.setUint16(0, 2000);
      expect(view.getUint16(0)).assertEqual(2000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5500
     * @tc.name testDataViewSetUint160104
     * @tc.desc Verify overwrite 0 with 65535 at same offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0);
      view.setUint16(0, 65535);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5600
     * @tc.name testDataViewSetUint160105
     * @tc.desc Verify overwrite with different endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0x1234, false);
      view.setUint16(0, 0x5678, true);
      expect(view.getUint16(0, true)).assertEqual(0x5678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_5800
     * @tc.name testDataViewSetUint160110
     * @tc.desc Verify underlying bytes of value 1 big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1, false);
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6100
     * @tc.name testDataViewSetUint160111
     * @tc.desc Verify underlying bytes of value 1 little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 1, true);
      expect(view.getUint8(0)).assertEqual(1);
      expect(view.getUint8(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_6600
     * @tc.name testDataViewSetUint160112
     * @tc.desc Verify writing at offset 2 does not affect offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint16(0, 0xAAAA);
      view.setUint16(2, 0xBBBB);
      expect(view.getUint16(0)).assertEqual(0xAAAA);
      expect(view.getUint16(2)).assertEqual(0xBBBB);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8500
     * @tc.name testDataViewSetUint160114
     * @tc.desc Verify setUint16 throws when byteOffset far exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_8700
     * @tc.name testDataViewSetUint160116
     * @tc.desc Verify setUint16 throws with int max byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(2147483647, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9100
     * @tc.name testDataViewSetUint160119
     * @tc.desc Verify setUint16 throws with int min byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-2147483648, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9500
     * @tc.name testDataViewSetUint160120
     * @tc.desc Verify setUint16 succeeds in 2-byte buffer at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint16(0, 65535);
      expect(view.getUint16(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2100
     * @tc.name testDataViewSetUint160121
     * @tc.desc Verify setUint16 fails in 2-byte buffer at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint16(1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9700
     * @tc.name testDataViewSetUint160122
     * @tc.desc Verify setUint16 fails in 1-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(1));
      try {
        view.setUint16(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9800
     * @tc.name testDataViewSetUint160123
     * @tc.desc Verify setUint16 fails in 0-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setUint16(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_2400
     * @tc.name testDataViewSetUint160124
     * @tc.desc Verify out-of-bounds returns expected result instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_9900
     * @tc.name testDataViewSetUint160125
     * @tc.desc Verify overload 2 out-of-bounds error with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0100
     * @tc.name testDataViewSetUint160126
     * @tc.desc Verify overload 2 out-of-bounds error with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0200
     * @tc.name testDataViewSetUint160127
     * @tc.desc Verify overload 3 out-of-bounds error with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100.0, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0300
     * @tc.name testDataViewSetUint160128
     * @tc.desc Verify overload 3 out-of-bounds error omitting littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0400
     * @tc.name testDataViewSetUint160129
     * @tc.desc Verify setUint16 throws a RangeError when writing beyond the buffer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(10, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_3200
     * @tc.name testDataViewSetUint160132
     * @tc.desc Verify overload 2 throws with negative byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 100, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0600
     * @tc.name testDataViewSetUint160133
     * @tc.desc Verify overload 3 throws with negative byteOffset and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U16_EXT_0700
     * @tc.name testDataViewSetUint160134
     * @tc.desc Verify overload 3 throws with negative byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint160134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint16(-1, 100.0, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  })
};
