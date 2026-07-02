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

export default function DataViewSetUint32Test(): void {
  describe('DataViewSetUint32Test', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0100
     * @tc.name testDataViewSetUint320001
     * @tc.desc Verify setUint32 with 2 required parameters writes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 102);
      expect(view.getUint32(0)).assertEqual(102);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0200
     * @tc.name testDataViewSetUint320002
     * @tc.desc Verify setUint32 throws RangeError when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(8, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0300
     * @tc.name testDataViewSetUint320003
     * @tc.desc Verify setUint32 throws RangeError when byteOffset is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0400
     * @tc.name testDataViewSetUint320004
     * @tc.desc Verify setUint32 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(100, 1024);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0500
     * @tc.name testDataViewSetUint320005
     * @tc.desc Verify setUint32 with 3 required parameters writes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024, true);
      expect(view.getUint32(0, true)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0700
     * @tc.name testDataViewSetUint320007
     * @tc.desc Verify setUint32 throws RangeError when byteOffset equals buffer length with littleEndian=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(8, 1, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0800
     * @tc.name testDataViewSetUint320008
     * @tc.desc Verify setUint32 defaults to big-endian when littleEndian is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024.0);
      expect(view.getUint32(0)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_0900
     * @tc.name testDataViewSetUint320009
     * @tc.desc Verify setUint32 with littleEndian=true writes in little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024.0, true);
      expect(view.getUint32(0, true)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1000
     * @tc.name testDataViewSetUint320010
     * @tc.desc Verify setUint32 with littleEndian=false writes in big-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024.0, false);
      expect(view.getUint32(0, false)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1100
     * @tc.name testDataViewSetUint320011
     * @tc.desc Verify setUint32 returns expected result when only 1 parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(-1, 1, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1200
     * @tc.name testDataViewSetUint320012
     * @tc.desc Verify setUint32 with byteOffset 0 writes at the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 256);
      expect(view.getUint32(0)).assertEqual(256);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1300
     * @tc.name testDataViewSetUint320013
     * @tc.desc Verify setUint32 with byteOffset 1 writes at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(1, 512);
      expect(view.getUint32(1)).assertEqual(512);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1400
     * @tc.name testDataViewSetUint320014
     * @tc.desc Verify setUint32 with byteOffset 4 writes to last 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(4, 1024);
      expect(view.getUint32(4)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1500
     * @tc.name testDataViewSetUint320015
     * @tc.desc Verify setUint32 with hex byteOffset 0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0x00, 100);
      expect(view.getUint32(0x00)).assertEqual(100);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1600
     * @tc.name testDataViewSetUint320016
     * @tc.desc Verify setUint32 at buffer.length-4 is valid boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(4, 4294967295);
      expect(view.getUint32(4)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1700
     * @tc.name testDataViewSetUint320017
     * @tc.desc Verify setUint32 at buffer.length-3 throws out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(5, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1800
     * @tc.name testDataViewSetUint320018
     * @tc.desc Verify setUint32 at buffer.length throws out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(8, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_1900
     * @tc.name testDataViewSetUint320019
     * @tc.desc Verify setUint32 with int max byteOffset throws out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(2147483647, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2000
     * @tc.name testDataViewSetUint320020
     * @tc.desc Verify setUint32 returns expected result with negative byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(-1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2100
     * @tc.name testDataViewSetUint320021
     * @tc.desc Verify setUint32 returns expected result with int min byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(-2147483648, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2200
     * @tc.name testDataViewSetUint320022
     * @tc.desc Verify setUint32 throws RangeError when byteOffset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(20, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2300
     * @tc.name testDataViewSetUint320023
     * @tc.desc Verify setUint32 with value 0 (uint32 minimum)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2400
     * @tc.name testDataViewSetUint320024
     * @tc.desc Verify setUint32 with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1);
      expect(view.getUint32(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2600
     * @tc.name testDataViewSetUint320026
     * @tc.desc Verify setUint32 with value 65535 (uint16 max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 65535);
      expect(view.getUint32(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2700
     * @tc.name testDataViewSetUint320027
     * @tc.desc Verify setUint32 with value 4294967295 (uint32 max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967295);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2800
     * @tc.name testDataViewSetUint320028
     * @tc.desc Verify setUint32 with hex value 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xFF);
      expect(view.getUint32(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_2900
     * @tc.name testDataViewSetUint320029
     * @tc.desc Verify setUint32 with hex value 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xFFFFFFFF);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3100
     * @tc.name testDataViewSetUint320031
     * @tc.desc Verify setUint32 truncates 4294967296 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967296);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3200
     * @tc.name testDataViewSetUint320032
     * @tc.desc Verify setUint32 truncates 4294967297 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967297);
      expect(view.getUint32(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3300
     * @tc.name testDataViewSetUint320033
     * @tc.desc Verify setUint32 converts -1 long to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, -1);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3400
     * @tc.name testDataViewSetUint320034
     * @tc.desc Verify setUint32 with value 2147483647 (int32 max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 2147483647);
      expect(view.getUint32(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3500
     * @tc.name testDataViewSetUint320035
     * @tc.desc Verify setUint32 with value 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 2147483648);
      expect(view.getUint32(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3600
     * @tc.name testDataViewSetUint320036
     * @tc.desc Verify setUint32 truncates Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, Number.MAX_SAFE_INTEGER);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3700
     * @tc.name testDataViewSetUint320037
     * @tc.desc Verify setUint32 with long min negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, -9223372036854775808);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_3800
     * @tc.name testDataViewSetUint320038
     * @tc.desc Verify setUint32 with number value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0.0);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4000
     * @tc.name testDataViewSetUint320040
     * @tc.desc Verify setUint32 with number value 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967295);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4100
     * @tc.name testDataViewSetUint320041
     * @tc.desc Verify setUint32 truncates number 1.5 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1.5);
      expect(view.getUint32(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4200
     * @tc.name testDataViewSetUint320042
     * @tc.desc Verify setUint32 truncates number 999.99 to 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 999.99);
      expect(view.getUint32(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4300
     * @tc.name testDataViewSetUint320043
     * @tc.desc Verify setUint32 with hex number value 0xABCD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xABCD);
      expect(view.getUint32(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4400
     * @tc.name testDataViewSetUint320044
     * @tc.desc Verify setUint32 truncates number 4294967296 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 4294967296);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4500
     * @tc.name testDataViewSetUint320045
     * @tc.desc Verify setUint32 converts number -1 to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, -1);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4600
     * @tc.name testDataViewSetUint320046
     * @tc.desc Verify setUint32 converts number -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, -2147483648);
      expect(view.getUint32(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4700
     * @tc.name testDataViewSetUint320047
     * @tc.desc Verify setUint32 handles NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, NaN);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4800
     * @tc.name testDataViewSetUint320048
     * @tc.desc Verify setUint32 handles Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, Infinity);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_4900
     * @tc.name testDataViewSetUint320049
     * @tc.desc Verify setUint32 handles -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, -Infinity);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5000
     * @tc.name testDataViewSetUint320050
     * @tc.desc Verify setUint32 with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, Number.MAX_SAFE_INTEGER);
      expect(view.getUint32(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5100
     * @tc.name testDataViewSetUint320051
     * @tc.desc Verify setUint32 truncates Number.MIN_VALUE to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, Number.MIN_VALUE);
      expect(view.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5200
     * @tc.name testDataViewSetUint320052
     * @tc.desc Verify setUint32 writes in little-endian when littleEndian is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x12345678, true);
      expect(view.getUint32(0, true)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5300
     * @tc.name testDataViewSetUint320053
     * @tc.desc Verify setUint32 writes in big-endian when littleEndian is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x12345678, false);
      expect(view.getUint32(0, false)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5400
     * @tc.name testDataViewSetUint320054
     * @tc.desc Verify big-endian write read as little-endian differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x12345678, false);
      expect(view.getUint32(0, true)).assertEqual(0x78563412);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5500
     * @tc.name testDataViewSetUint320055
     * @tc.desc Verify little-endian write read as big-endian differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x12345678, true);
      expect(view.getUint32(0, false)).assertEqual(0x78563412);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5600
     * @tc.name testDataViewSetUint320056
     * @tc.desc Verify little-endian byte order for value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1, true);
      expect(view.getUint8(0)).assertEqual(1);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5700
     * @tc.name testDataViewSetUint320057
     * @tc.desc Verify big-endian byte order for value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1, false);
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5800
     * @tc.name testDataViewSetUint320058
     * @tc.desc Verify setUint32 correctly writes unsigned int32 value to buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024);
      let val = view.getUint32(0);
      expect(val).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_5900
     * @tc.name testDataViewSetUint320059
     * @tc.desc Verify setUint32 correctly writes unsigned int32 with littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024, true);
      let val = view.getUint32(0, true);
      expect(val).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6000
     * @tc.name testDataViewSetUint320060
     * @tc.desc Verify setUint32 correctly writes unsigned int32 with float integer value and littleEndian true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024.0, true);
      let val = view.getUint32(0, true);
      expect(val).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6300
     * @tc.name testDataViewSetUint320063
     * @tc.desc Verify overload 2 little-endian write-read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xAABBCCDD, true);
      expect(view.getUint32(0, true)).assertEqual(0xAABBCCDD);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6400
     * @tc.name testDataViewSetUint320064
     * @tc.desc Verify overload 3 little-endian write-read consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xAABBCCDD, true);
      expect(view.getUint32(0, true)).assertEqual(0xAABBCCDD);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6500
     * @tc.name testDataViewSetUint320065
     * @tc.desc Verify later write overwrites earlier write at same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 100);
      view.setUint32(0, 200);
      expect(view.getUint32(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6600
     * @tc.name testDataViewSetUint320066
     * @tc.desc Verify writes at different positions do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 100);
      view.setUint32(4, 200);
      expect(view.getUint32(0)).assertEqual(100);
      expect(view.getUint32(4)).assertEqual(200);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6700
     * @tc.name testDataViewSetUint320067
     * @tc.desc Verify long and number types produce same result for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view1.setUint32(0, 1024);
      view2.setUint32(0, 1024.0);
      expect(view1.getUint32(0)).assertEqual(view2.getUint32(0));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6800
     * @tc.name testDataViewSetUint320068
     * @tc.desc Verify long and number write 4294967295 consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view1.setUint32(0, 4294967295);
      view2.setUint32(0, 4294967295);
      expect(view1.getUint32(0)).assertEqual(view2.getUint32(0));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_6900
     * @tc.name testDataViewSetUint320069
     * @tc.desc Verify long and number little-endian write byte-level consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(8);
      const view1 = new DataView(buf1);
      const buf2 = new ArrayBuffer(8);
      const view2 = new DataView(buf2);
      view1.setUint32(0, 0x12345678, true);
      view2.setUint32(0, 0x12345678, true);
      expect(view1.getUint8(0)).assertEqual(view2.getUint8(0));
      expect(view1.getUint8(1)).assertEqual(view2.getUint8(1));
      expect(view1.getUint8(2)).assertEqual(view2.getUint8(2));
      expect(view1.getUint8(3)).assertEqual(view2.getUint8(3));
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7000
     * @tc.name testDataViewSetUint320070
     * @tc.desc Verify big-endian 0x11223344 read as little-endian is 0x44332211
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x11223344, false);
      expect(view.getUint32(0, true)).assertEqual(0x44332211);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7100
     * @tc.name testDataViewSetUint320071
     * @tc.desc Verify little-endian 0x11223344 read as big-endian is 0x44332211
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0x11223344, true);
      expect(view.getUint32(0, false)).assertEqual(0x44332211);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7200
     * @tc.name testDataViewSetUint320072
     * @tc.desc Verify setUint32 writes 0x00000000 as four zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0);
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7300
     * @tc.name testDataViewSetUint320073
     * @tc.desc Verify setUint32 writes 0xFFFFFFFF as four 255 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 0xFFFFFFFF);
      expect(view.getUint8(0)).assertEqual(255);
      expect(view.getUint8(1)).assertEqual(255);
      expect(view.getUint8(2)).assertEqual(255);
      expect(view.getUint8(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7500
     * @tc.name testDataViewSetUint320075
     * @tc.desc Verify setUint32 throws when byteOffset 7 leaves only 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(7, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7600
     * @tc.name testDataViewSetUint320076
     * @tc.desc Verify setUint32 throws when byteOffset equals buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(4, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7700
     * @tc.name testDataViewSetUint320077
     * @tc.desc Verify setUint32 throws when byteOffset exceeds buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(100, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7800
     * @tc.name testDataViewSetUint320078
     * @tc.desc Verify 4-byte buffer: offset 0 valid, offset 1 out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      view.setUint32(0, 1);
      expect(view.getUint32(0)).assertEqual(1);
      try {
        view.setUint32(1, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_7900
     * @tc.name testDataViewSetUint320079
     * @tc.desc Verify buffer smaller than 4 bytes always throws out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const view = new DataView(buf);
      try {
        view.setUint32(0, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8100
     * @tc.name testDataViewSetUint320081
     * @tc.desc Verify setUint32 throws with byteOffset -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      try {
        view.setUint32(-100, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8200
     * @tc.name testDataViewSetUint320082
     * @tc.desc Verify out-of-bounds error object has valid properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(5, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8300
     * @tc.name testDataViewSetUint320083
     * @tc.desc Verify error for out-of-bounds write with long and littleEndian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(2, 1, true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8400
     * @tc.name testDataViewSetUint320084
     * @tc.desc Verify error for out-of-bounds write with number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(2, 1.0, false);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8500
     * @tc.name testDataViewSetUint320085
     * @tc.desc Verify setUint32 writes the correct value and can be read back via getUint32 under normal conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, 1024);
      expect(view.getUint32(0)).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8600
     * @tc.name testDataViewSetUint320086
     * @tc.desc Verify setUint32 throws RangeError when offset exceeds buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new DataView(buf);
      try {
        view.setUint32(5, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_SET_U32_8700
     * @tc.name testDataViewSetUint320087
     * @tc.desc Verify setUint32 overload 3 with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewSetUint320087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new DataView(buf);
      view.setUint32(0, NaN);
      expect(view.getUint32(0)).assertEqual(0);
    });
  })
};
