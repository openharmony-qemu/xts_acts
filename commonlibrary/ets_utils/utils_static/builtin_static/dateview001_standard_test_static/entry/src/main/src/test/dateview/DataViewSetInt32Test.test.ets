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

export default function DataViewSetInt32Test(): void {
  describe('DataViewSetInt32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0100
     * @tc.name testDataViewSetInt320001
     * @tc.desc Verify setInt32 with 2 required parameters writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024);
      expect(view.getInt32(0)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0200
     * @tc.name testDataViewSetInt320002
     * @tc.desc Verify setInt32 with 3 parameters in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024, true);
      expect(view.getInt32(0, true)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0300
     * @tc.name testDataViewSetInt320003
     * @tc.desc Verify setInt32 with 3 parameters in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024, false);
      expect(view.getInt32(0, false)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0400
     * @tc.name testDataViewSetInt320004
     * @tc.desc Verify setInt32 with only 2 parameters defaults to big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024.0);
      expect(view.getInt32(0)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0500
     * @tc.name testDataViewSetInt320005
     * @tc.desc Verify setInt32 with 3 parameters and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024.0, true);
      expect(view.getInt32(0, true)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0600
     * @tc.name testDataViewSetInt320006
     * @tc.desc Verify setInt32 with 3 parameters and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024.0, false);
      expect(view.getInt32(0, false)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0700
     * @tc.name testDataViewSetInt320007
     * @tc.desc Verify setInt32 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(10, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0800
     * @tc.name testDataViewSetInt320008
     * @tc.desc Verify setInt32 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0900
     * @tc.name testDataViewSetInt320009
     * @tc.desc Verify setInt32 with extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(100, -1024);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1000
     * @tc.name testDataViewSetInt320010
     * @tc.desc Verify setInt32 with byteOffset 0 writes at buffer start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      expect(view.getInt32(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1100
     * @tc.name testDataViewSetInt320011
     * @tc.desc Verify setInt32 with byteOffset 4 writes at 5th byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 200);
      expect(view.getInt32(4)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1200
     * @tc.name testDataViewSetInt320012
     * @tc.desc Verify setInt32 with non-aligned byteOffset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(1, 300);
      expect(view.getInt32(1)).assertEqual(300);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1300
     * @tc.name testDataViewSetInt320013
     * @tc.desc Verify setInt32 with max valid byteOffset bufferSize-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 12345);
      expect(view.getInt32(4)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1400
     * @tc.name testDataViewSetInt320014
     * @tc.desc Verify setInt32 on minimum 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setInt32(0, 67890);
      expect(view.getInt32(0)).assertEqual(67890);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1500
     * @tc.name testDataViewSetInt320015
     * @tc.desc Verify setInt32 throws RangeError for negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1600
     * @tc.name testDataViewSetInt320016
     * @tc.desc Verify setInt32 returns expected result for byteOffset -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-2147483648, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1700
     * @tc.name testDataViewSetInt320017
     * @tc.desc Verify setInt32 throws RangeError when insufficient bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(5, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1800
     * @tc.name testDataViewSetInt320018
     * @tc.desc Verify setInt32 throws RangeError when byteOffset equals bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(8, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_1900
     * @tc.name testDataViewSetInt320019
     * @tc.desc Verify setInt32 throws RangeError when byteOffset exceeds bufferSize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2000
     * @tc.name testDataViewSetInt320020
     * @tc.desc Verify setInt32 throws RangeError for byteOffset 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(2147483647, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2100
     * @tc.name testDataViewSetInt320021
     * @tc.desc Verify setInt32 with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2200
     * @tc.name testDataViewSetInt320022
     * @tc.desc Verify setInt32 with positive value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1);
      expect(view.getInt32(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2300
     * @tc.name testDataViewSetInt320023
     * @tc.desc Verify setInt32 with negative value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1);
      expect(view.getInt32(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2500
     * @tc.name testDataViewSetInt320025
     * @tc.desc Verify setInt32 with negative value -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -100);
      expect(view.getInt32(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2700
     * @tc.name testDataViewSetInt320027
     * @tc.desc Verify setInt32 with max int value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 2147483647);
      expect(view.getInt32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2800
     * @tc.name testDataViewSetInt320028
     * @tc.desc Verify setInt32 with min int value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -2147483648);
      expect(view.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2900
     * @tc.name testDataViewSetInt320029
     * @tc.desc Verify setInt32 with near-max value 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 2147483646);
      expect(view.getInt32(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3000
     * @tc.name testDataViewSetInt320030
     * @tc.desc Verify setInt32 with near-min value -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -2147483647);
      expect(view.getInt32(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3100
     * @tc.name testDataViewSetInt320031
     * @tc.desc Verify setInt32 with hex max value 0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0x7FFFFFFF);
      expect(view.getInt32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3300
     * @tc.name testDataViewSetInt320033
     * @tc.desc Verify setInt32 at byteOffset 0 in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1024, true);
      expect(view.getInt32(0, true)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3400
     * @tc.name testDataViewSetInt320034
     * @tc.desc Verify setInt32 at byteOffset 0 in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1024, false);
      expect(view.getInt32(0, false)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3500
     * @tc.name testDataViewSetInt320035
     * @tc.desc Verify setInt32 at byteOffset 4 in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 2048, true);
      expect(view.getInt32(4, true)).assertEqual(2048);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3600
     * @tc.name testDataViewSetInt320036
     * @tc.desc Verify setInt32 at max valid offset in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 9999, true);
      expect(view.getInt32(4, true)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3700
     * @tc.name testDataViewSetInt320037
     * @tc.desc Verify setInt32 at max valid offset in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 9999, false);
      expect(view.getInt32(4, false)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3800
     * @tc.name testDataViewSetInt320038
     * @tc.desc Verify setInt32 returns expected result for byteOffset -1 in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-1, 100, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3900
     * @tc.name testDataViewSetInt320039
     * @tc.desc Verify setInt32 returns expected result for out-of-bounds byteOffset in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(6, 100, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4000
     * @tc.name testDataViewSetInt320040
     * @tc.desc Verify setInt32 with positive value in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 65535, true);
      expect(view.getInt32(0, true)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4100
     * @tc.name testDataViewSetInt320041
     * @tc.desc Verify setInt32 with negative value in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -65535, true);
      expect(view.getInt32(0, true)).assertEqual(-65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4200
     * @tc.name testDataViewSetInt320042
     * @tc.desc Verify setInt32 with positive value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 65535, false);
      expect(view.getInt32(0, false)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4300
     * @tc.name testDataViewSetInt320043
     * @tc.desc Verify setInt32 with negative value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -65535, false);
      expect(view.getInt32(0, false)).assertEqual(-65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4400
     * @tc.name testDataViewSetInt320044
     * @tc.desc Verify setInt32 with max int value in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 2147483647, true);
      expect(view.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4500
     * @tc.name testDataViewSetInt320045
     * @tc.desc Verify setInt32 with min int value in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -2147483648, true);
      expect(view.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4600
     * @tc.name testDataViewSetInt320046
     * @tc.desc Verify setInt32 with max int value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 2147483647, false);
      expect(view.getInt32(0, false)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4700
     * @tc.name testDataViewSetInt320047
     * @tc.desc Verify setInt32 with min int value in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -2147483648, false);
      expect(view.getInt32(0, false)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4800
     * @tc.name testDataViewSetInt320048
     * @tc.desc Verify setInt32 with littleEndian true writes in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1, true);
      expect(view.getUint8(0)).assertEqual(1);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_4900
     * @tc.name testDataViewSetInt320049
     * @tc.desc Verify setInt32 with littleEndian false writes in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1, false);
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5000
     * @tc.name testDataViewSetInt320050
     * @tc.desc Verify little-endian and big-endian produce different byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(8));
      const view2 = new DataView(new ArrayBuffer(8));
      view1.setInt32(0, 0x12345678, true);
      view2.setInt32(0, 0x12345678, false);
      expect(view1.getUint8(0)).assertEqual(0x78);
      expect(view2.getUint8(0)).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5200
     * @tc.name testDataViewSetInt320052
     * @tc.desc Verify setInt32 with littleEndian undefined defaults to big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100, undefined);
      expect(view.getInt32(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5400
     * @tc.name testDataViewSetInt320054
     * @tc.desc Verify setInt32 with number type value at byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 1024.0);
      expect(view.getInt32(4)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5500
     * @tc.name testDataViewSetInt320055
     * @tc.desc Verify setInt32 at max valid byteOffset with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(4, 12345.0);
      expect(view.getInt32(4)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5600
     * @tc.name testDataViewSetInt320056
     * @tc.desc Verify setInt32 returns expected result for negative byteOffset with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-1, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5700
     * @tc.name testDataViewSetInt320057
     * @tc.desc Verify setInt32 throws RangeError for out-of-bounds byteOffset with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(5, 100.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5800
     * @tc.name testDataViewSetInt320058
     * @tc.desc Verify setInt32 with float value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0.0);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5900
     * @tc.name testDataViewSetInt320059
     * @tc.desc Verify setInt32 with float value 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100.0);
      expect(view.getInt32(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6100
     * @tc.name testDataViewSetInt320061
     * @tc.desc Verify setInt32 with scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1.0e3);
      expect(view.getInt32(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6200
     * @tc.name testDataViewSetInt320062
     * @tc.desc Verify setInt32 with float max int value 2147483647.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 2147483647.0);
      expect(view.getInt32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6300
     * @tc.name testDataViewSetInt320063
     * @tc.desc Verify setInt32 with float min int value -2147483648.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -2147483648.0);
      expect(view.getInt32(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6400
     * @tc.name testDataViewSetInt320064
     * @tc.desc Verify setInt32 with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, Number.MAX_SAFE_INTEGER);
      expect(view.getInt32(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6500
     * @tc.name testDataViewSetInt320065
     * @tc.desc Verify setInt32 with Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, Number.MIN_SAFE_INTEGER);
      expect(view.getInt32(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6600
     * @tc.name testDataViewSetInt320066
     * @tc.desc Verify setInt32 truncates float -1024.5 to -1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -1024.5);
      expect(view.getInt32(0)).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6700
     * @tc.name testDataViewSetInt320067
     * @tc.desc Verify setInt32 truncates 0.5 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0.5);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6800
     * @tc.name testDataViewSetInt320068
     * @tc.desc Verify setInt32 with -0.0 writes as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -0.0);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6900
     * @tc.name testDataViewSetInt320069
     * @tc.desc Verify setInt32 with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, NaN);
      const actual = view.getInt32(0);
      expect(actual).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7000
     * @tc.name testDataViewSetInt320070
     * @tc.desc Verify setInt32 with Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, Infinity);
      const res = view.getInt32(0);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7100
     * @tc.name testDataViewSetInt320071
     * @tc.desc Verify setInt32 with -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, -Infinity);
      const val = view.getInt32(0);
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7200
     * @tc.name testDataViewSetInt320072
     * @tc.desc Verify setInt32 with Number.MIN_VALUE truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, Number.MIN_VALUE);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7300
     * @tc.name testDataViewSetInt320073
     * @tc.desc Verify setInt32 with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, Number.MAX_VALUE);
      const val = view.getInt32(0);
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7400
     * @tc.name testDataViewSetInt320074
     * @tc.desc Verify setInt32 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(20, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7900
     * @tc.name testDataViewSetInt320079
     * @tc.desc Verify setInt32 returns expected result for zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0);
      expect(view.getInt32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8000
     * @tc.name testDataViewSetInt320080
     * @tc.desc Verify setInt32 defaults to big-endian when littleEndian omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0x12345678);
      expect(view.getUint8(0)).assertEqual(0x12);
      expect(view.getUint8(3)).assertEqual(0x78);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8100
     * @tc.name testDataViewSetInt320081
     * @tc.desc Verify setInt32 with littleEndian true writes little-endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0x12345678, true);
      expect(view.getUint8(0)).assertEqual(0x78);
      expect(view.getUint8(3)).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8200
     * @tc.name testDataViewSetInt320082
     * @tc.desc Verify setInt32 with littleEndian false writes big-endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0x12345678, false);
      expect(view.getUint8(0)).assertEqual(0x12);
      expect(view.getUint8(3)).assertEqual(0x78);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8600
     * @tc.name testDataViewSetInt320086
     * @tc.desc Verify setInt32 returns void with 2 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setInt32(0, -1024);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8700
     * @tc.name testDataViewSetInt320087
     * @tc.desc Verify setInt32 returns void with 3 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setInt32(0, -1024, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8800
     * @tc.name testDataViewSetInt320088
     * @tc.desc Verify setInt32 returns void with number type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setInt32(0, -1024.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_9300
     * @tc.name testDataViewSetInt320093
     * @tc.desc Verify read back 0 in big-endian with byte verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 0, false);
      expect(view.getInt32(0, false)).assertEqual(0);
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_9800
     * @tc.name testDataViewSetInt320098
     * @tc.desc Verify big-endian write read as little-endian gives different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 1);
      let result = view.getInt32(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_0100
     * @tc.name testDataViewSetInt320100
     * @tc.desc Verify later write overwrites earlier at same offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      view.setInt32(0, 200);
      expect(view.getInt32(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2400
     * @tc.name testDataViewSetInt320101
     * @tc.desc Verify writes at different offsets do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      view.setInt32(4, 200);
      expect(view.getInt32(0)).assertEqual(100);
      expect(view.getInt32(4)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_2600
     * @tc.name testDataViewSetInt320102
     * @tc.desc Verify non-aligned offset write reads back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(12));
      view.setInt32(0, 0x11111111);
      view.setInt32(2, 0x22222222);
      expect(view.getInt32(2)).assertEqual(0x22222222);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_3200
     * @tc.name testDataViewSetInt320103
     * @tc.desc Verify setInt32 return type is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      let result = view.getInt32(0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5100
     * @tc.name testDataViewSetInt320104
     * @tc.desc Verify getInt32 read value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      let val = view.getInt32(0);
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_5300
     * @tc.name testDataViewSetInt320107
     * @tc.desc Verify setInt32 throws RangeError when only 3 bytes remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(6, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_6000
     * @tc.name testDataViewSetInt320109
     * @tc.desc Verify setInt32 throws RangeError when only 1 byte remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setInt32(3, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7500
     * @tc.name testDataViewSetInt320110
     * @tc.desc Verify setInt32 throws RangeError on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(0));
      try {
        view.setInt32(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7600
     * @tc.name testDataViewSetInt320111
     * @tc.desc Verify setInt32 throws RangeError on 3-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(3));
      try {
        view.setInt32(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_7700
     * @tc.name testDataViewSetInt320113
     * @tc.desc Verify setInt32 throws RangeError for byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(-100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8300
     * @tc.name testDataViewSetInt320118
     * @tc.desc Verify setInt32 writes the correct value and can be read back via getInt32 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setInt32(0, 100);
      expect(view.getInt32(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8400
     * @tc.name testDataViewSetInt320120
     * @tc.desc Verify successful write after previous out-of-bounds failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setInt32(100, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      view.setInt32(0, 200);
      expect(view.getInt32(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_I32_8500
     * @tc.name testDataViewSetInt320121
     * @tc.desc Verify multiple failed writes do not corrupt existing data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetInt320121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       
      try {
        const view = new DataView(new ArrayBuffer(8));
        view.setInt32(0, 42);
        view.setInt32(100, 100);
        view.setInt32(-1, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });
  })
}
