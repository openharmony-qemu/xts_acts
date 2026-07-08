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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
export default function DataViewSetFloat32Test(): void {
  describe('DataViewSetFloat32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0100
     * @tc.name testDataViewSetFloat320001
     * @tc.desc Verify setFloat32 with 2 required parameters byteOffset and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5f);
      expect(view.getFloat32(0)).assertClose(3.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0500
     * @tc.name testDataViewSetFloat320005
     * @tc.desc Verify setFloat32 with 3 required parameters byteOffset, value and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5f, true);
      expect(view.getFloat32(0, true)).assertClose(3.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0900
     * @tc.name testDataViewSetFloat320009
     * @tc.desc Verify setFloat32 overload 3 with number value and omitted littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5);
      expect(view.getFloat32(0)).assertClose(3.5, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1000
     * @tc.name testDataViewSetFloat320010
     * @tc.desc Verify setFloat32 overload 3 with all parameters and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5, true);
      expect(view.getFloat32(0, true)).assertClose(3.5, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1100
     * @tc.name testDataViewSetFloat320011
     * @tc.desc Verify setFloat32 overload 3 with all parameters and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5, false);
      expect(view.getFloat32(0, false)).assertClose(3.5, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1400
     * @tc.name testDataViewSetFloat320014
     * @tc.desc Verify setFloat32 with byteOffset 0 at starting position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.5f);
      expect(view.getFloat32(0)).assertClose(1.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1500
     * @tc.name testDataViewSetFloat320015
     * @tc.desc Verify setFloat32 with byteOffset 1 for non-zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(1, 2.5f);
      expect(view.getFloat32(1)).assertClose(2.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1600
     * @tc.name testDataViewSetFloat320016
     * @tc.desc Verify setFloat32 with byteOffset 4 as max legal offset in 8-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(4, 4.5f);
      expect(view.getFloat32(4)).assertClose(4.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1700
     * @tc.name testDataViewSetFloat320017
     * @tc.desc Verify setFloat32 with byteOffset 0 as minimum legal offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setFloat32(0, 1.0f);
      expect(view.getFloat32(0)).assertClose(1.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1800
     * @tc.name testDataViewSetFloat320018
     * @tc.desc Verify setFloat32 with byteOffset equal to bufferLength minus 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      view.setFloat32(0, 7.25f);
      expect(view.getFloat32(0)).assertClose(7.25f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1900
     * @tc.name testDataViewSetFloat320019
     * @tc.desc Verify setFloat32 returns expected result when byteOffset 5 exceeds 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(5, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2000
     * @tc.name testDataViewSetFloat320020
     * @tc.desc Verify setFloat32 returns expected result when byteOffset 1 in 4-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(1, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2100
     * @tc.name testDataViewSetFloat320021
     * @tc.desc Verify setFloat32 returns expected result with negative byteOffset -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-1, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2200
     * @tc.name testDataViewSetFloat320022
     * @tc.desc Verify setFloat32 returns expected result with byteOffset int minimum -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-2147483648, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2300
     * @tc.name testDataViewSetFloat320023
     * @tc.desc Verify setFloat32 returns expected result with byteOffset int maximum 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(2147483647, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2500
     * @tc.name testDataViewSetFloat320025
     * @tc.desc Verify setFloat32 with negative float value -99.99f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -99.99f);
      expect(view.getFloat32(0)).assertClose(-99.99f, 0.01f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2600
     * @tc.name testDataViewSetFloat320026
     * @tc.desc Verify setFloat32 with decimal float value 0.125f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0.125f);
      expect(view.getFloat32(0)).assertClose(0.125f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2700
     * @tc.name testDataViewSetFloat320027
     * @tc.desc Verify setFloat32 with integer float value 100.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 100.0f);
      expect(view.getFloat32(0)).assertClose(100.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2800
     * @tc.name testDataViewSetFloat320028
     * @tc.desc Verify setFloat32 with float maximum value 3.4e38f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.4e38f);
      expect(view.getFloat32(0)).assertClose(3.4e38f, 1e35f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2900
     * @tc.name testDataViewSetFloat320029
     * @tc.desc Verify setFloat32 with float minimum positive value 1.17549435e-38f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.17549435e-38f);
      expect(view.getFloat32(0)).assertClose(1.17549435e-38f, 1e-42f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3000
     * @tc.name testDataViewSetFloat320030
     * @tc.desc Verify setFloat32 with float minimum negative value -3.4e38f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -3.4e38f);
      expect(view.getFloat32(0)).assertClose(-3.4e38f, 1e35f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3100
     * @tc.name testDataViewSetFloat320031
     * @tc.desc Verify setFloat32 with positive zero 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0.0f);
      expect(view.getFloat32(0)).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3200
     * @tc.name testDataViewSetFloat320032
     * @tc.desc Verify setFloat32 with negative zero -0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -0.0f);
      expect(1.0f / view.getFloat32(0) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3300
     * @tc.name testDataViewSetFloat320033
     * @tc.desc Verify setFloat32 with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.NaN);
      let result = view.getFloat32(0);
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3400
     * @tc.name testDataViewSetFloat320034
     * @tc.desc Verify setFloat32 with positive infinity Float.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.POSITIVE_INFINITY);
      expect(view.getFloat32(0)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3500
     * @tc.name testDataViewSetFloat320035
     * @tc.desc Verify setFloat32 with negative infinity Float.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.NEGATIVE_INFINITY);
      expect(view.getFloat32(0)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3600
     * @tc.name testDataViewSetFloat320036
     * @tc.desc Verify setFloat32 with 7-digit precision value 3.141593f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.141593f);
      expect(view.getFloat32(0)).assertClose(3.141593f, 0.00001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3700
     * @tc.name testDataViewSetFloat320037
     * @tc.desc Verify setFloat32 with scientific notation 1.0e10f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0e10f);
      expect(view.getFloat32(0)).assertClose(1.0e10f, 1000.0f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3800
     * @tc.name testDataViewSetFloat320038
     * @tc.desc Verify setFloat32 precision loss with value exceeding 7 significant digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.123456789f);
      let result = view.getFloat32(0);
      expect(Math.abs(result - 1.123456789f) < 0.0001f).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4000
     * @tc.name testDataViewSetFloat320040
     * @tc.desc Verify setFloat32 overload 2 with byteOffset 4 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(4, 3.5f, false);
      expect(view.getFloat32(4, false)).assertClose(3.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4100
     * @tc.name testDataViewSetFloat320041
     * @tc.desc Verify setFloat32 overload 2 returns expected result when byteOffset exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(1, 1.0f, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4200
     * @tc.name testDataViewSetFloat320042
     * @tc.desc Verify setFloat32 overload 2 returns expected result with negative byteOffset and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-1, 1.0f, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4400
     * @tc.name testDataViewSetFloat320044
     * @tc.desc Verify setFloat32 overload 2 with negative value and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -99.99f, false);
      expect(view.getFloat32(0, false)).assertClose(-99.99f, 0.01f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4500
     * @tc.name testDataViewSetFloat320045
     * @tc.desc Verify setFloat32 overload 2 with NaN and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.NaN, true);
      let result = view.getFloat32(0, true);
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4600
     * @tc.name testDataViewSetFloat320046
     * @tc.desc Verify setFloat32 overload 2 with positive infinity and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.POSITIVE_INFINITY, false);
      expect(view.getFloat32(0, false)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4700
     * @tc.name testDataViewSetFloat320047
     * @tc.desc Verify setFloat32 overload 2 with 0.0f and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0.0f, true);
      expect(view.getFloat32(0, true)).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4800
     * @tc.name testDataViewSetFloat320048
     * @tc.desc Verify setFloat32 overload 2 with -0.0f and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -0.0f, true);
      expect(1.0f / view.getFloat32(0, true) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_4900
     * @tc.name testDataViewSetFloat320049
     * @tc.desc Verify setFloat32 overload 2 with float max 3.4e38f and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.4e38f, true);
      expect(view.getFloat32(0, true)).assertClose(3.4e38f, 1e35f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5000
     * @tc.name testDataViewSetFloat320050
     * @tc.desc Verify setFloat32 overload 2 with float min positive and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.17549435e-38f, false);
      expect(view.getFloat32(0, false)).assertClose(1.17549435e-38f, 1e-42f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5100
     * @tc.name testDataViewSetFloat320051
     * @tc.desc Verify setFloat32 overload 2 with littleEndian true for little-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, true);
      expect(view.getFloat32(0, true)).assertClose(1.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5200
     * @tc.name testDataViewSetFloat320052
     * @tc.desc Verify setFloat32 overload 2 with littleEndian false for big-endian byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, false);
      expect(view.getFloat32(0, false)).assertClose(1.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5400
     * @tc.name testDataViewSetFloat320054
     * @tc.desc Verify setFloat32 overload 3 with byteOffset 4 as max legal offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(4, 2.5);
      expect(view.getFloat32(4)).assertClose(2.5, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5500
     * @tc.name testDataViewSetFloat320055
     * @tc.desc Verify setFloat32 overload 3 returns expected result when byteOffset exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(5, 1.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5600
     * @tc.name testDataViewSetFloat320056
     * @tc.desc Verify setFloat32 overload 3 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-1, 1.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5800
     * @tc.name testDataViewSetFloat320058
     * @tc.desc Verify setFloat32 overload 3 with negative number value -99.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -99.99);
      expect(view.getFloat32(0)).assertClose(-99.99, 0.01);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_5900
     * @tc.name testDataViewSetFloat320059
     * @tc.desc Verify setFloat32 overload 3 with integer number value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 100);
      expect(view.getFloat32(0)).assertClose(100, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6000
     * @tc.name testDataViewSetFloat320060
     * @tc.desc Verify setFloat32 overload 3 with decimal number value 0.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0.125);
      expect(view.getFloat32(0)).assertClose(0.125, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6100
     * @tc.name testDataViewSetFloat320061
     * @tc.desc Verify setFloat32 overload 3 with number max float32 value 3.4e38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.4e38);
      expect(view.getFloat32(0)).assertClose(3.4e38, 1e35);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6200
     * @tc.name testDataViewSetFloat320062
     * @tc.desc Verify setFloat32 overload 3 with number min positive float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      const testValue = 1.17549435e-38;
      view.setFloat32(0, testValue);
      const result = view.getFloat32(0);
      view.setFloat32(4, result);
      expect(view.getFloat32(4)).assertEqual(result);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6300
     * @tc.name testDataViewSetFloat320063
     * @tc.desc Verify setFloat32 overload 3 with number min negative float32 value -3.4e38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -3.4e38);
      expect(view.getFloat32(0)).assertClose(-3.4e38, 1e35);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6400
     * @tc.name testDataViewSetFloat320064
     * @tc.desc Verify setFloat32 overload 3 with number exceeding float32 range results in Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0e40);
      expect(view.getFloat32(0)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6500
     * @tc.name testDataViewSetFloat320065
     * @tc.desc Verify setFloat32 overload 3 with positive zero 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0);
      expect(view.getFloat32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6600
     * @tc.name testDataViewSetFloat320066
     * @tc.desc Verify setFloat32 overload 3 with negative zero -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -0);
      expect(1.0 / view.getFloat32(0) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6700
     * @tc.name testDataViewSetFloat320067
     * @tc.desc Verify setFloat32 overload 3 with NaN number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, NaN);
      let result = view.getFloat32(0);
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6800
     * @tc.name testDataViewSetFloat320068
     * @tc.desc Verify setFloat32 overload 3 with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Infinity);
      expect(view.getFloat32(0)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_6900
     * @tc.name testDataViewSetFloat320069
     * @tc.desc Verify setFloat32 overload 3 with -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, -Infinity);
      expect(view.getFloat32(0)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7000
     * @tc.name testDataViewSetFloat320070
     * @tc.desc Verify setFloat32 overload 3 with omitted littleEndian defaults to big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0);
      expect(view.getFloat32(0)).assertClose(1.0, 0.001);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7400
     * @tc.name testDataViewSetFloat320074
     * @tc.desc Verify setFloat32 write at different offsets and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(16));
      view.setFloat32(0, 1.0f);
      view.setFloat32(4, 2.0f);
      view.setFloat32(8, 3.0f);
      expect(view.getFloat32(0)).assertClose(1.0f, 0.001f);
      expect(view.getFloat32(4)).assertClose(2.0f, 0.001f);
      expect(view.getFloat32(8)).assertClose(3.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7500
     * @tc.name testDataViewSetFloat320075
     * @tc.desc Verify setFloat32 overwrite replaces previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f);
      view.setFloat32(0, 2.0f);
      expect(view.getFloat32(0)).assertClose(2.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7600
     * @tc.name testDataViewSetFloat320076
     * @tc.desc Verify setFloat32 big-endian write and big-endian read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 3.5f, false);
      expect(view.getFloat32(0, false)).assertClose(3.5f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7700
     * @tc.name testDataViewSetFloat320077
     * @tc.desc Verify setFloat32 big-endian write and little-endian read produce different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, false);
      let bigEndianRead = view.getFloat32(0, false);
      let littleEndianRead = view.getFloat32(0, true);
      expect(Math.abs(bigEndianRead - littleEndianRead) > 0.001f).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_7900
     * @tc.name testDataViewSetFloat320079
     * @tc.desc Verify setFloat32 little-endian write and big-endian read produce different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, true);
      let littleEndianRead = view.getFloat32(0, true);
      let bigEndianRead = view.getFloat32(0, false);
      expect(Math.abs(littleEndianRead - bigEndianRead) > 0.001f).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_8500
     * @tc.name testDataViewSetFloat320085
     * @tc.desc Verify setFloat32 positive zero and negative zero sign bit difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 0.0f);
      let posZero = view.getFloat32(0);
      view.setFloat32(0, -0.0f);
      let negZero = view.getFloat32(0);
      expect(1.0f / posZero > 0).assertTrue();
      expect(1.0f / negZero < 0).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_8600
     * @tc.name testDataViewSetFloat320086
     * @tc.desc Verify setFloat32 positive and negative infinity write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.POSITIVE_INFINITY);
      expect(view.getFloat32(0)).assertEqual(Float.POSITIVE_INFINITY);
      view.setFloat32(0, Float.NEGATIVE_INFINITY);
      expect(view.getFloat32(0)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_8700
     * @tc.name testDataViewSetFloat320087
     * @tc.desc Verify setFloat32 infinity with different endianness write and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, Float.POSITIVE_INFINITY, true);
      expect(view.getFloat32(0, true)).assertEqual(Float.POSITIVE_INFINITY);
      view.setFloat32(4, Float.NEGATIVE_INFINITY, false);
      expect(view.getFloat32(4, false)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_8800
     * @tc.name testDataViewSetFloat320088
     * @tc.desc Verify setFloat32 overload 1 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setFloat32(0, 3.5f);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_8900
     * @tc.name testDataViewSetFloat320089
     * @tc.desc Verify setFloat32 overload 2 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setFloat32(0, 3.5f, true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9000
     * @tc.name testDataViewSetFloat320090
     * @tc.desc Verify setFloat32 overload 3 returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      let result = view.setFloat32(0, 3.5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9100
     * @tc.name testDataViewSetFloat320091
     * @tc.desc Verify setFloat32 float and number write produce same read result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(8));
      const view2 = new DataView(new ArrayBuffer(8));
      view1.setFloat32(0, 3.5f);
      view2.setFloat32(0, 3.5);
      expect(view1.getFloat32(0)).assertClose(view2.getFloat32(0), 0.0001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9200
     * @tc.name testDataViewSetFloat320092
     * @tc.desc Verify setFloat32 float and number write produce identical bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(8));
      const view2 = new DataView(new ArrayBuffer(8));
      view1.setFloat32(0, 1.5f);
      view2.setFloat32(0, 1.5);
      expect(view1.getUint8(0)).assertEqual(view2.getUint8(0));
      expect(view1.getUint8(1)).assertEqual(view2.getUint8(1));
      expect(view1.getUint8(2)).assertEqual(view2.getUint8(2));
      expect(view1.getUint8(3)).assertEqual(view2.getUint8(3));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9300
     * @tc.name testDataViewSetFloat320093
     * @tc.desc Verify setFloat32 precision within 7 significant digits and precision loss beyond
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1234567.0f);
      expect(view.getFloat32(0)).assertClose(1234567.0f, 1.0f);
      view.setFloat32(0, 12345678.0f);
      expect(Math.abs(view.getFloat32(0) - 12345678.0f) < 16.0f).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9400
     * @tc.name testDataViewSetFloat320094
     * @tc.desc Verify setFloat32 minimum positive value precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.17549435e-38f);
      let result = view.getFloat32(0);
      expect(Math.abs(result - 1.17549435e-38f) < 1e-43f).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9500
     * @tc.name testDataViewSetFloat320095
     * @tc.desc Verify setFloat32 big-endian and little-endian byte-level comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view1 = new DataView(new ArrayBuffer(8));
      const view2 = new DataView(new ArrayBuffer(8));
      view1.setFloat32(0, 1.0f, false);
      view2.setFloat32(0, 1.0f, true);
      expect(view1.getUint8(0)).assertEqual(view2.getUint8(3));
      expect(view1.getUint8(1)).assertEqual(view2.getUint8(2));
      expect(view1.getUint8(2)).assertEqual(view2.getUint8(1));
      expect(view1.getUint8(3)).assertEqual(view2.getUint8(0));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9600
     * @tc.name testDataViewSetFloat320096
     * @tc.desc Verify setFloat32 big-endian byte order for 1.0f is 0x3F800000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, false);
      expect(view.getUint8(0)).assertEqual(0x3F);
      expect(view.getUint8(1)).assertEqual(0x80);
      expect(view.getUint8(2)).assertEqual(0x00);
      expect(view.getUint8(3)).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9700
     * @tc.name testDataViewSetFloat320097
     * @tc.desc Verify setFloat32 little-endian byte order for 1.0f is 0x0000803F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f, true);
      expect(view.getUint8(0)).assertEqual(0x00);
      expect(view.getUint8(1)).assertEqual(0x00);
      expect(view.getUint8(2)).assertEqual(0x80);
      expect(view.getUint8(3)).assertEqual(0x3F);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_9900
     * @tc.name testDataViewSetFloat320099
     * @tc.desc Verify setFloat32 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(4, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0100
     * @tc.name testDataViewSetFloat320100
     * @tc.desc Verify setFloat32 returns expected result when byteOffset far exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(100, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0200
     * @tc.name testDataViewSetFloat320102
     * @tc.desc Verify setFloat32 overload 2 returns expected result when byteOffset plus 4 exceeds buffer with littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(1, 1.0f, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0300
     * @tc.name testDataViewSetFloat320103
     * @tc.desc Verify setFloat32 overload 3 returns expected result when byteOffset plus 4 exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(1, 1.0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0400
     * @tc.name testDataViewSetFloat320104
     * @tc.desc Verify setFloat32 overload 3 returns expected result when byteOffset plus 4 exceeds buffer with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(4));
      try {
        view.setFloat32(1, 1.0, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0700
     * @tc.name testDataViewSetFloat320107
     * @tc.desc Verify setFloat32 overload 2 returns expected result with byteOffset -1 and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-1, 1.0f, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0800
     * @tc.name testDataViewSetFloat320108
     * @tc.desc Verify setFloat32 overload 2 returns expected result with byteOffset -2147483648 and littleEndian false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-2147483648, 1.0f, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_0600
     * @tc.name testDataViewSetFloat320110
     * @tc.desc Verify setFloat32 overload 3 returns expected result with negative byteOffset and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      try {
        view.setFloat32(-1, 1.0, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_1200
     * @tc.name testDataViewSetFloat320112
     * @tc.desc Verify setFloat32 buffer data unchanged after out-of-bounds write exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const view = new DataView(new ArrayBuffer(8));
        view.setFloat32(0, 2.5f);
        view.setFloat32(10, 1.0f);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
       
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_2400
     * @tc.name testDataViewSetFloat320115
     * @tc.desc Verify setFloat32 writes a float32 value to the DataView and the value can be correctly retrieved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 1.0f);
      expect(view.getFloat32(0)).assertClose(1.0f, 0.001f);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_F32_3900
     * @tc.name testDataViewSetFloat320116
     * @tc.desc Verify setFloat32 multiple out-of-bounds operations do not affect DataView state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetFloat320116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      view.setFloat32(0, 5.5f);
      for (let i = 0; i < 3; i++) {
        try {
          view.setFloat32(100, 1.0f);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('RangeError');
        }
      }
      expect(view.getFloat32(0)).assertClose(5.5f, 0.001f);
    });
  })};
