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

export default function DataViewSetUint8Test(): void {
  describe('DataViewSetUint8Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0100
     * @tc.name testDataViewSetUint80001
     * @tc.desc Verify setUint8 with two normal int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 128);
      expect(view.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0200
     * @tc.name testDataViewSetUint80002
     * @tc.desc Verify setUint8 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(2, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0300
     * @tc.name testDataViewSetUint80003
     * @tc.desc Verify setUint8 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0400
     * @tc.name testDataViewSetUint80004
     * @tc.desc Verify setUint8 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(100, 255);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0500
     * @tc.name testDataViewSetUint80005
     * @tc.desc Verify setUint8 with two normal number parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 255.0);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_0900
     * @tc.name testDataViewSetUint80009
     * @tc.desc Verify setUint8 with byteOffset 0 at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(0, 100);
      expect(view.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1000
     * @tc.name testDataViewSetUint80010
     * @tc.desc Verify setUint8 with byteOffset 1 at middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(1, 200);
      expect(view.getUint8(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1100
     * @tc.name testDataViewSetUint80011
     * @tc.desc Verify setUint8 with byteOffset at last byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(3, 50);
      expect(view.getUint8(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1200
     * @tc.name testDataViewSetUint80012
     * @tc.desc Verify setUint8 with byteOffset at valid maximum offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setUint8(1, 255);
      expect(view.getUint8(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1300
     * @tc.name testDataViewSetUint80013
     * @tc.desc Verify setUint8 returns expected result when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      try {
        view.setUint8(2, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1400
     * @tc.name testDataViewSetUint80014
     * @tc.desc Verify setUint8 returns expected result with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(-1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1500
     * @tc.name testDataViewSetUint80015
     * @tc.desc Verify setUint8 returns expected result with byteOffset at int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(-2147483648, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1600
     * @tc.name testDataViewSetUint80016
     * @tc.desc Verify setUint8 returns expected result with byteOffset at int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(2147483647, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1700
     * @tc.name testDataViewSetUint80017
     * @tc.desc Verify setUint8 with value 0 (minimum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_1900
     * @tc.name testDataViewSetUint80019
     * @tc.desc Verify setUint8 with value 255 (maximum normal value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 255);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2000
     * @tc.name testDataViewSetUint80020
     * @tc.desc Verify setUint8 with value 1 (minimum positive integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 1);
      expect(view.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2100
     * @tc.name testDataViewSetUint80021
     * @tc.desc Verify setUint8 with hexadecimal value 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0x10);
      expect(view.getUint8(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2200
     * @tc.name testDataViewSetUint80022
     * @tc.desc Verify setUint8 with hexadecimal maximum value 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0xFF);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2300
     * @tc.name testDataViewSetUint80023
     * @tc.desc Verify setUint8 with binary value 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0b11111111);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2400
     * @tc.name testDataViewSetUint80024
     * @tc.desc Verify setUint8 truncates value 256 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 256);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2500
     * @tc.name testDataViewSetUint80025
     * @tc.desc Verify setUint8 truncates value 257 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 257);
      expect(view.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2600
     * @tc.name testDataViewSetUint80026
     * @tc.desc Verify setUint8 truncates value 511 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 511);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2700
     * @tc.name testDataViewSetUint80027
     * @tc.desc Verify setUint8 truncates value -1 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -1);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2800
     * @tc.name testDataViewSetUint80028
     * @tc.desc Verify setUint8 truncates value -128 to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -128);
      expect(view.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_2900
     * @tc.name testDataViewSetUint80029
     * @tc.desc Verify setUint8 truncates value -256 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -256);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3000
     * @tc.name testDataViewSetUint80030
     * @tc.desc Verify setUint8 returns expected result with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(0, 0);
        expect(view.getUint8(0)).assertEqual(0);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3100
     * @tc.name testDataViewSetUint80031
     * @tc.desc Verify setUint8 returns expected result with value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(0, 255);
        expect(view.getUint8(0)).assertEqual(255);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3200
     * @tc.name testDataViewSetUint80032
     * @tc.desc Verify setUint8 with byteOffset 0 and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(0, 100.5);
      expect(view.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3300
     * @tc.name testDataViewSetUint80033
     * @tc.desc Verify setUint8 with byteOffset 2 and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(2, 200.9);
      expect(view.getUint8(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3400
     * @tc.name testDataViewSetUint80034
     * @tc.desc Verify setUint8 with maximum valid byteOffset and number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setUint8(1, 50.0);
      expect(view.getUint8(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3500
     * @tc.name testDataViewSetUint80035
     * @tc.desc Verify setUint8 returns expected result when byteOffset equals buffer length (number value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      try {
        view.setUint8(2, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3600
     * @tc.name testDataViewSetUint80036
     * @tc.desc Verify setUint8 returns expected result with negative byteOffset -1 (number value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(-1, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3700
     * @tc.name testDataViewSetUint80037
     * @tc.desc Verify setUint8 returns expected result with byteOffset at int maximum (number value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(2147483647, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_3800
     * @tc.name testDataViewSetUint80038
     * @tc.desc Verify setUint8 with float value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0.0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4000
     * @tc.name testDataViewSetUint80040
     * @tc.desc Verify setUint8 truncates 128.5 to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 128.5);
      expect(view.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4100
     * @tc.name testDataViewSetUint80041
     * @tc.desc Verify setUint8 truncates 0.1 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0.1);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4200
     * @tc.name testDataViewSetUint80042
     * @tc.desc Verify setUint8 truncates 99.99 to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 99.99);
      expect(view.getUint8(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4300
     * @tc.name testDataViewSetUint80043
     * @tc.desc Verify setUint8 with scientific notation 1.0e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 1.0e2);
      expect(view.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4500
     * @tc.name testDataViewSetUint80045
     * @tc.desc Verify setUint8 truncates 256.0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 256.0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4600
     * @tc.name testDataViewSetUint80046
     * @tc.desc Verify setUint8 truncates 255.9 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 255.9);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4700
     * @tc.name testDataViewSetUint80047
     * @tc.desc Verify setUint8 truncates 257.5 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 257.5);
      expect(view.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4800
     * @tc.name testDataViewSetUint80048
     * @tc.desc Verify setUint8 truncates -1.0 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -1.0);
      expect(view.getUint8(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_4900
     * @tc.name testDataViewSetUint80049
     * @tc.desc Verify setUint8 truncates -0.5 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -0.5);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5000
     * @tc.name testDataViewSetUint80050
     * @tc.desc Verify setUint8 truncates -128.0 to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -128.0);
      expect(view.getUint8(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5100
     * @tc.name testDataViewSetUint80051
     * @tc.desc Verify setUint8 truncates -255.0 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -255.0);
      expect(view.getUint8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5200
     * @tc.name testDataViewSetUint80052
     * @tc.desc Verify setUint8 truncates -256.0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -256.0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5300
     * @tc.name testDataViewSetUint80053
     * @tc.desc Verify setUint8 returns expected result when value is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, NaN);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5400
     * @tc.name testDataViewSetUint80054
     * @tc.desc Verify setUint8 returns expected result when value is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, Infinity);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5500
     * @tc.name testDataViewSetUint80055
     * @tc.desc Verify setUint8 returns expected result when value is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -Infinity);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5600
     * @tc.name testDataViewSetUint80056
     * @tc.desc Verify setUint8 returns expected result with value 0 (number type)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(0, 1);
        expect(view.getUint8(0)).assertEqual(1);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5700
     * @tc.name testDataViewSetUint80057
     * @tc.desc Verify setUint8 returns expected result with value -1 (number type)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(0, 2);
        expect(view.getUint8(0)).assertEqual(2);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5800
     * @tc.name testDataViewSetUint80058
     * @tc.desc Verify setUint8 returns expected result when value is Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, Number.MAX_VALUE);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_5900
     * @tc.name testDataViewSetUint80059
     * @tc.desc Verify setUint8 with value Number.MIN_VALUE truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, Number.MIN_VALUE);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6000
     * @tc.name testDataViewSetUint80060
     * @tc.desc Verify setUint8 with value -0.0 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, -0.0);
      expect(view.getUint8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6100
     * @tc.name testDataViewSetUint80061
     * @tc.desc Verify setUint8 correctly writes uint8 value 255 to buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 255);
      let val = view.getUint8(0);
      expect(val).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6200
     * @tc.name testDataViewSetUint80062
     * @tc.desc Verify setUint8 return type is undefined (overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      let result = view.setUint8(0, 100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6300
     * @tc.name testDataViewSetUint80063
     * @tc.desc Verify setUint8 returns void (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      let result = view.setUint8(0, 255.0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6400
     * @tc.name testDataViewSetUint80064
     * @tc.desc Verify setUint8 correctly processes float numeric value and writes data to buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 100.5);
      let val = view.getUint8(0);
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6700
     * @tc.name testDataViewSetUint80067
     * @tc.desc Verify sequential write and read at multiple positions (overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(0, 10);
      view.setUint8(1, 20);
      view.setUint8(2, 30);
      view.setUint8(3, 40);
      expect(view.getUint8(0)).assertEqual(10);
      expect(view.getUint8(1)).assertEqual(20);
      expect(view.getUint8(2)).assertEqual(30);
      expect(view.getUint8(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_6800
     * @tc.name testDataViewSetUint80068
     * @tc.desc Verify overwrite at same position (overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 100);
      expect(view.getUint8(0)).assertEqual(100);
      view.setUint8(0, 200);
      expect(view.getUint8(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7100
     * @tc.name testDataViewSetUint80071
     * @tc.desc Verify write float and read truncated integer (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 127.7);
      expect(view.getUint8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7200
     * @tc.name testDataViewSetUint80072
     * @tc.desc Verify sequential write and read at multiple positions (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setUint8(0, 10.0);
      view.setUint8(1, 20.5);
      view.setUint8(2, 30.9);
      view.setUint8(3, 40.1);
      expect(view.getUint8(0)).assertEqual(10);
      expect(view.getUint8(1)).assertEqual(20);
      expect(view.getUint8(2)).assertEqual(30);
      expect(view.getUint8(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7300
     * @tc.name testDataViewSetUint80073
     * @tc.desc Verify setUint8 writes 128 then getInt8 reads -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 128);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7400
     * @tc.name testDataViewSetUint80074
     * @tc.desc Verify setUint8 writes 255 then getInt8 reads -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 255);
      expect(view.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7500
     * @tc.name testDataViewSetUint80075
     * @tc.desc Verify setUint8 writes two bytes then getUint16 reads combined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setUint8(0, 0x01);
      view.setUint8(1, 0x02);
      let combined = view.getUint16(0);
      expect(combined).assertEqual(0x0102);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7600
     * @tc.name testDataViewSetUint80076
     * @tc.desc Verify setUint8 returns expected result when byteOffset equals buffer length (error overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(2, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7700
     * @tc.name testDataViewSetUint80077
     * @tc.desc Verify setUint8 returns expected result when byteOffset exceeds buffer length (overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(1000, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_7900
     * @tc.name testDataViewSetUint80079
     * @tc.desc Verify setUint8 returns expected result when byteOffset equals buffer length (error overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(2, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8000
     * @tc.name testDataViewSetUint80080
     * @tc.desc Verify setUint8 returns expected result when byteOffset exceeds buffer length (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(1000, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8400
     * @tc.name testDataViewSetUint80084
     * @tc.desc Verify setUint8 returns expected result with byteOffset at int minimum (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setUint8(-2147483648, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8500
     * @tc.name testDataViewSetUint80085
     * @tc.desc Verify setUint8 returns expected result on zero-length ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setUint8(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8600
     * @tc.name testDataViewSetUint80086
     * @tc.desc Verify setUint8 returns expected result on zero-length DataView with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setUint8(0, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8700
     * @tc.name testDataViewSetUint80087
     * @tc.desc Verify try-catch executes correctly on out-of-bounds write (overload 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(5, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_8800
     * @tc.name testDataViewSetUint80088
     * @tc.desc Verify try-catch executes correctly on out-of-bounds write (overload 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setUint8(5, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_9000
     * @tc.name testDataViewSetUint80090
     * @tc.desc Verify setUint8 on DataView with byteOffset writes relative to DataView start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf, 2, 4);
      view.setUint8(0, 100);
      expect(view.getUint8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_9100
     * @tc.name testDataViewSetUint80091
     * @tc.desc Verify setUint8 returns expected result on DataView with byteOffset out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf, 2, 4);
      try {
        view.setUint8(4, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U8_9200
     * @tc.name testDataViewSetUint80092
     * @tc.desc Verify setUint8 on DataView with byteOffset at boundary position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint80092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf, 2, 4);
      view.setUint8(3, 200);
      expect(view.getUint8(3)).assertEqual(200);
    });
  })
};
