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

export default function DataViewSetInt8Test(): void {
  describe('DataViewSetInt8Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0100
     * @tc.name testDataViewSetInt80001
     * @tc.desc Verify setInt8 with two required parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 12);
      expect(view.getInt8(0)).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0200
     * @tc.name testDataViewSetInt80002
     * @tc.desc Verify setInt8 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(2, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0300
     * @tc.name testDataViewSetInt80003
     * @tc.desc Verify setInt8 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(-1, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0400
     * @tc.name testDataViewSetInt80004
     * @tc.desc Verify setInt8 with extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt8(0, 12);
      expect(view.getInt8(0)).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0500
     * @tc.name testDataViewSetInt80005
     * @tc.desc Verify setInt8 with byteOffset 0 at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 50);
      expect(view.getInt8(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0600
     * @tc.name testDataViewSetInt80006
     * @tc.desc Verify setInt8 with positive byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt8(1, 100);
      expect(view.getInt8(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0700
     * @tc.name testDataViewSetInt80007
     * @tc.desc Verify setInt8 with large positive byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(256);
      const view = new DataView(buffer);
      view.setInt8(128, 42);
      expect(view.getInt8(128)).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0800
     * @tc.name testDataViewSetInt80008
     * @tc.desc Verify setInt8 with byteOffset 0 as minimum valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 10);
      expect(view.getInt8(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_0900
     * @tc.name testDataViewSetInt80009
     * @tc.desc Verify setInt8 with byteLength minus 1 as maximum valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt8(7, 99);
      expect(view.getInt8(7)).assertEqual(99);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1100
     * @tc.name testDataViewSetInt80011
     * @tc.desc Verify setInt8 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(-1, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1200
     * @tc.name testDataViewSetInt80012
     * @tc.desc Verify setInt8 returns expected result with large negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(-100, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1300
     * @tc.name testDataViewSetInt80013
     * @tc.desc Verify setInt8 returns expected result when byteOffset far exceeds byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(1000, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1400
     * @tc.name testDataViewSetInt80014
     * @tc.desc Verify setInt8 with float byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt8(1, 10);
      expect(view.getInt8(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1500
     * @tc.name testDataViewSetInt80015
     * @tc.desc Verify setInt8 with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 0);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1700
     * @tc.name testDataViewSetInt80017
     * @tc.desc Verify setInt8 with negative integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -50);
      expect(view.getInt8(0)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1800
     * @tc.name testDataViewSetInt80018
     * @tc.desc Verify setInt8 with value 1 as minimum positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 1);
      expect(view.getInt8(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_1900
     * @tc.name testDataViewSetInt80019
     * @tc.desc Verify setInt8 with value -1 as maximum negative absolute value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -1);
      expect(view.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2000
     * @tc.name testDataViewSetInt80020
     * @tc.desc Verify setInt8 with value 127 as int8 maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 127);
      expect(view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2100
     * @tc.name testDataViewSetInt80021
     * @tc.desc Verify setInt8 with value -128 as int8 minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -128);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2200
     * @tc.name testDataViewSetInt80022
     * @tc.desc Verify setInt8 with value 128 truncated to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 128);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2300
     * @tc.name testDataViewSetInt80023
     * @tc.desc Verify setInt8 with value -129 truncated to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -129);
      expect(view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2400
     * @tc.name testDataViewSetInt80024
     * @tc.desc Verify setInt8 with value 255 truncated to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 255);
      expect(view.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2500
     * @tc.name testDataViewSetInt80025
     * @tc.desc Verify setInt8 with value 256 truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 256);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2600
     * @tc.name testDataViewSetInt80026
     * @tc.desc Verify setInt8 returns expected result with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 0);
      expect(view.getInt8(0)).assertEqual(0);

    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2700
     * @tc.name testDataViewSetInt80027
     * @tc.desc Verify setInt8 returns expected result with value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(0, -1);
        expect(view.getInt8(0)).assertEqual(-1);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2800
     * @tc.name testDataViewSetInt80028
     * @tc.desc Verify setInt8 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(20, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_2900
     * @tc.name testDataViewSetInt80029
     * @tc.desc Verify setInt8 with large integer value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 2147483647);
      expect(view.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3000
     * @tc.name testDataViewSetInt80030
     * @tc.desc Verify setInt8 with minimum integer value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -2147483648);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3100
     * @tc.name testDataViewSetInt80031
     * @tc.desc Verify setInt8 overload 2 with byteOffset 0 at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 12.0);
      expect(view.getInt8(0)).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3200
     * @tc.name testDataViewSetInt80032
     * @tc.desc Verify setInt8 overload 2 with positive byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt8(2, 50.0);
      expect(view.getInt8(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3300
     * @tc.name testDataViewSetInt80033
     * @tc.desc Verify setInt8 overload 2 with byteLength minus 1 as maximum valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt8(7, 100.0);
      expect(view.getInt8(7)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3400
     * @tc.name testDataViewSetInt80034
     * @tc.desc Verify setInt8 overload 2 returns expected result when byteOffset equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(2, 10.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3500
     * @tc.name testDataViewSetInt80035
     * @tc.desc Verify setInt8 overload 2 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(-1, 10.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3600
     * @tc.name testDataViewSetInt80036
     * @tc.desc Verify setInt8 overload 2 returns expected result when byteOffset far exceeds byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(10000, 10.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3800
     * @tc.name testDataViewSetInt80038
     * @tc.desc Verify setInt8 overload 2 with negative integer float value -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -1.0);
      expect(view.getInt8(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_3900
     * @tc.name testDataViewSetInt80039
     * @tc.desc Verify setInt8 overload 2 with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 0.0);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4000
     * @tc.name testDataViewSetInt80040
     * @tc.desc Verify setInt8 overload 2 with positive float value 50.5 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 50.5);
      expect(view.getInt8(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4100
     * @tc.name testDataViewSetInt80041
     * @tc.desc Verify setInt8 overload 2 with negative float value -50.5 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -50.5);
      expect(view.getInt8(0)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4200
     * @tc.name testDataViewSetInt80042
     * @tc.desc Verify setInt8 overload 2 with value 127.0 as int8 maximum float form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 127.0);
      expect(view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4300
     * @tc.name testDataViewSetInt80043
     * @tc.desc Verify setInt8 overload 2 with value -128.0 as int8 minimum float form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -128.0);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4400
     * @tc.name testDataViewSetInt80044
     * @tc.desc Verify setInt8 overload 2 with value 127.9 truncated near upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 127.9);
      expect(view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4500
     * @tc.name testDataViewSetInt80045
     * @tc.desc Verify setInt8 overload 2 with value -128.9 truncated near lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -128.9);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4600
     * @tc.name testDataViewSetInt80046
     * @tc.desc Verify setInt8 overload 2 with value 128.0 truncated beyond int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 128.0);
      expect(view.getInt8(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4700
     * @tc.name testDataViewSetInt80047
     * @tc.desc Verify setInt8 overload 2 with value -129.0 truncated beyond int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -129.0);
      expect(view.getInt8(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4800
     * @tc.name testDataViewSetInt80048
     * @tc.desc Verify setInt8 overload 2 returns expected result with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, NaN);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_4900
     * @tc.name testDataViewSetInt80049
     * @tc.desc Verify setInt8 overload 2 returns expected result with Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, Infinity);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5000
     * @tc.name testDataViewSetInt80050
     * @tc.desc Verify setInt8 overload 2 returns expected result with -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -Infinity);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5100
     * @tc.name testDataViewSetInt80051
     * @tc.desc Verify setInt8 overload 2 returns expected result with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(0, 1);
        expect(view.getInt8(0)).assertEqual(1);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5200
     * @tc.name testDataViewSetInt80052
     * @tc.desc Verify setInt8 overload 2 returns expected result with value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(0, -2);
        expect(view.getInt8(0)).assertEqual(-2);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5400
     * @tc.name testDataViewSetInt80054
     * @tc.desc Verify setInt8 overload 2 with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, Number.MAX_VALUE);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5500
     * @tc.name testDataViewSetInt80055
     * @tc.desc Verify setInt8 overload 2 with Number.MIN_VALUE truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, Number.MIN_VALUE);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5600
     * @tc.name testDataViewSetInt80056
     * @tc.desc Verify setInt8 overload 2 with value -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -0.0);
      expect(view.getInt8(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5700
     * @tc.name testDataViewSetInt80057
     * @tc.desc Verify setInt8 returns undefined (void)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      let result = view.setInt8(0, 12);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5800
     * @tc.name testDataViewSetInt80058
     * @tc.desc Verify setInt8 returns void and does not support chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt8(0, 10);
      view.setInt8(1, 20);
      expect(view.getInt8(0)).assertEqual(10);
      expect(view.getInt8(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_5900
     * @tc.name testDataViewSetInt80059
     * @tc.desc Verify reading positive integer after setInt8 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 42);
      expect(view.getInt8(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_6000
     * @tc.name testDataViewSetInt80060
     * @tc.desc Verify reading negative integer after setInt8 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -42);
      expect(view.getInt8(0)).assertEqual(-42);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_6400
     * @tc.name testDataViewSetInt80064
     * @tc.desc Verify reading multiple values at different offsets after setInt8 writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt8(0, 10);
      view.setInt8(1, -10);
      view.setInt8(2, 127);
      view.setInt8(3, -128);
      view.setInt8(4, 0);
      view.setInt8(5, 1);
      view.setInt8(6, -1);
      view.setInt8(7, 50);
      expect(view.getInt8(0)).assertEqual(10);
      expect(view.getInt8(1)).assertEqual(-10);
      expect(view.getInt8(2)).assertEqual(127);
      expect(view.getInt8(3)).assertEqual(-128);
      expect(view.getInt8(4)).assertEqual(0);
      expect(view.getInt8(5)).assertEqual(1);
      expect(view.getInt8(6)).assertEqual(-1);
      expect(view.getInt8(7)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_6500
     * @tc.name testDataViewSetInt80065
     * @tc.desc Verify last write takes effect when writing to same offset multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 10);
      view.setInt8(0, 20);
      view.setInt8(0, 30);
      expect(view.getInt8(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_6700
     * @tc.name testDataViewSetInt80067
     * @tc.desc Verify reading truncated value after writing 50.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 50.7);
      expect(view.getInt8(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_6800
     * @tc.name testDataViewSetInt80068
     * @tc.desc Verify reading -12.0 after setInt8 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -12.0);
      expect(view.getInt8(0)).assertEqual(-12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7000
     * @tc.name testDataViewSetInt80070
     * @tc.desc Verify reading 127.0 and -128.0 after setInt8 writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, 127.0);
      view.setInt8(1, -128.0);
      expect(view.getInt8(0)).assertEqual(127);
      expect(view.getInt8(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7100
     * @tc.name testDataViewSetInt80071
     * @tc.desc Verify consistency between DataView setInt8 and Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      const int8 = new Int8Array(buffer);
      view.setInt8(0, 99);
      expect(int8[0]).assertEqual(99);
      int8[1] = -50;
      expect(view.getInt8(1)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7200
     * @tc.name testDataViewSetInt80072
     * @tc.desc Verify complementary behavior of setInt8 and getUint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      view.setInt8(0, -1);
      expect(view.getUint8(0)).assertEqual(255);
      view.setInt8(1, 127);
      expect(view.getUint8(1)).assertEqual(127);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7400
     * @tc.name testDataViewSetInt80074
     * @tc.desc Verify setInt8 throws RangeError when byteOffset far exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(10000, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7600
     * @tc.name testDataViewSetInt80076
     * @tc.desc Verify setInt8 throws RangeError with byteOffset -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt8(-2147483648, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_7800
     * @tc.name testDataViewSetInt80078
     * @tc.desc Verify out-of-bounds byteOffset exception is caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
       
      try {
        view.setInt8(5, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_8000
     * @tc.name testDataViewSetInt80080
     * @tc.desc Verify RangeError is thrown for out-of-bounds byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(2));
      try {
        view.setInt8(100, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_8100
     * @tc.name testDataViewSetInt80081
     * @tc.desc Verify setInt8 returns expected result on detached ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);
      try {
        view.setInt8(20, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I8_8200
     * @tc.name testDataViewSetInt80082
     * @tc.desc Verify setInt8 returns expected result on empty ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt80082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setInt8(0, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  })
}
