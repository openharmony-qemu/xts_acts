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

export default function DataViewConstructorTest(): void {
  describe('DataViewConstructorTest', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0100
     * @tc.name testDataViewConstructor0001
     * @tc.desc Verify DataView constructor with only buffer parameter, byteOffset defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(8);
      let view = new DataView(buffer);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(8);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0200
     * @tc.name testDataViewConstructor0002
     * @tc.desc Verify DataView constructor with buffer and byteOffset parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(12);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0300
     * @tc.name testDataViewConstructor0003
     * @tc.desc Verify DataView constructor with all three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4, 8);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(8);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0500
     * @tc.name testDataViewConstructor0005
     * @tc.desc Verify DataView constructor with all three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 16);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0700
     * @tc.name testDataViewConstructor0007
     * @tc.desc Verify DataView constructor with large ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(1024);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(1024);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0800
     * @tc.name testDataViewConstructor0008
     * @tc.desc Verify DataView constructor with minimum non-zero sized ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(1);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_0900
     * @tc.name testDataViewConstructor0009
     * @tc.desc Verify DataView constructor with zero-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(0);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1200
     * @tc.name testDataViewConstructor0012
     * @tc.desc Verify DataView constructor returns expected result when buffer is a plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1300
     * @tc.name testDataViewConstructor0013
     * @tc.desc Verify DataView constructor returns expected result when buffer is a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(64);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(64);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1400
     * @tc.name testDataViewConstructor0014
     * @tc.desc Verify DataView constructor returns expected result when buffer is a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(128);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(128);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1500
     * @tc.name testDataViewConstructor0015
     * @tc.desc Verify DataView constructor returns expected result when buffer is an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(256);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1600
     * @tc.name testDataViewConstructor0016
     * @tc.desc Verify DataView constructor with byteOffset of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1700
     * @tc.name testDataViewConstructor0017
     * @tc.desc Verify DataView constructor with positive byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 8);
      expect(view.byteOffset).assertEqual(8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1800
     * @tc.name testDataViewConstructor0018
     * @tc.desc Verify DataView constructor with byteOffset equal to buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 16);
      expect(view.byteOffset).assertEqual(16);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_1900
     * @tc.name testDataViewConstructor0019
     * @tc.desc Verify DataView constructor with minimum valid byteOffset of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 1);
      expect(view.byteOffset).assertEqual(1);
      expect(view.byteLength).assertEqual(15);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2000
     * @tc.name testDataViewConstructor0020
     * @tc.desc Verify DataView constructor with byteOffset near buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 15);
      expect(view.byteOffset).assertEqual(15);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2100
     * @tc.name testDataViewConstructor0021
     * @tc.desc Verify DataView constructor returns expected result when byteOffset is int max safe value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 8);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2300
     * @tc.name testDataViewConstructor0023
     * @tc.desc Verify DataView constructor returns expected result when byteOffset is negative (-100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, -100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2400
     * @tc.name testDataViewConstructor0024
     * @tc.desc Verify DataView constructor returns expected result when byteOffset exceeds buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 17);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2500
     * @tc.name testDataViewConstructor0025
     * @tc.desc Verify DataView constructor with byteOffset zero and byteLength eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 8);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_2600
     * @tc.name testDataViewConstructor0026
     * @tc.desc Verify DataView constructor uses default value 0 when byteOffset is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3000
     * @tc.name testDataViewConstructor0030
     * @tc.desc Verify DataView constructor with minimum valid byteLength of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 1);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3100
     * @tc.name testDataViewConstructor0031
     * @tc.desc Verify DataView constructor with byteLength of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 0);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3200
     * @tc.name testDataViewConstructor0032
     * @tc.desc Verify DataView constructor when byteOffset plus byteLength equals buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4, 12);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3300
     * @tc.name testDataViewConstructor0033
     * @tc.desc Verify DataView constructor with byteLength near remaining buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 15, 1);
      expect(view.byteOffset).assertEqual(15);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3400
     * @tc.name testDataViewConstructor0034
     * @tc.desc Verify DataView constructor returns expected result when byteLength is int max safe value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 0, 2147483647);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3500
     * @tc.name testDataViewConstructor0035
     * @tc.desc Verify DataView constructor returns expected result when byteLength is negative (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 0, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3700
     * @tc.name testDataViewConstructor0037
     * @tc.desc Verify DataView constructor returns expected result when byteLength exceeds remaining buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 4, 13);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3800
     * @tc.name testDataViewConstructor0038
     * @tc.desc Verify DataView constructor with byteLength zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 0);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_3900
     * @tc.name testDataViewConstructor0039
     * @tc.desc Verify DataView constructor uses default when byteLength is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 4);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4000
     * @tc.name testDataViewConstructor0040
     * @tc.desc Verify DataView constructor truncates float byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 0, 8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4100
     * @tc.name testDataViewConstructor0041
     * @tc.desc Verify DataView constructor returns a DataView instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(8);
      let view = new DataView(buffer);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4200
     * @tc.name testDataViewConstructor0042
     * @tc.desc Verify DataView constructor with only buffer returns correct properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4300
     * @tc.name testDataViewConstructor0043
     * @tc.desc Verify DataView constructor with buffer and byteOffset returns correct properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer, 8);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteOffset).assertEqual(8);
      expect(view.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4400
     * @tc.name testDataViewConstructor0044
     * @tc.desc Verify DataView constructor with all three parameters returns correct properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer, 8, 16);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteOffset).assertEqual(8);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4500
     * @tc.name testDataViewConstructor0045
     * @tc.desc Verify view.buffer points to the passed ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4600
     * @tc.name testDataViewConstructor0046
     * @tc.desc Verify multiple DataViews sharing the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view1 = new DataView(buffer, 0, 8);
      let view2 = new DataView(buffer, 8, 8);
      expect(view1.buffer).assertEqual(view2.buffer);
      expect(view1.byteOffset).assertEqual(0);
      expect(view2.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4700
     * @tc.name testDataViewConstructor0047
     * @tc.desc Verify byteOffset correctly reflects view start offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer, 10);
      expect(view.byteOffset).assertEqual(10);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_4800
     * @tc.name testDataViewConstructor0048
     * @tc.desc Verify byteLength correctly reflects view byte length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let view = new DataView(buffer, 8, 12);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5000
     * @tc.name testDataViewConstructor0050
     * @tc.desc Verify DataView constructor creates empty view with byteLength of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer, 8, 0);
      expect(view.byteLength).assertEqual(0);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5200
     * @tc.name testDataViewConstructor0052
     * @tc.desc Verify DataView implements ArrayBufferView interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(8);
      let view: ArrayBufferView = new DataView(buffer);
      expect(view.byteLength).assertEqual(8);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5300
     * @tc.name testDataViewConstructor0053
     * @tc.desc Verify DataView constructor throws TypeError when buffer is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let view = new DataView(null as ArrayBuffer);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5400
     * @tc.name testDataViewConstructor0054
     * @tc.desc Verify DataView constructor throws TypeError when buffer is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let view = new DataView(undefined as ArrayBuffer);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5500
     * @tc.name testDataViewConstructor0055
     * @tc.desc Verify DataView constructor returns expected result when buffer is a plain object with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let view = new DataView(new ArrayBuffer(8));
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5600
     * @tc.name testDataViewConstructor0056
     * @tc.desc Verify DataView constructor returns expected result when buffer is SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sab = new ArrayBuffer(8);
      let view = new DataView(sab as ArrayBuffer);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_5800
     * @tc.name testDataViewConstructor0058
     * @tc.desc Verify DataView constructor throws RangeError when byteOffset is int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, -2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6000
     * @tc.name testDataViewConstructor0060
     * @tc.desc Verify DataView constructor throws RangeError when byteOffset exceeds buffer by one byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(1);
        let view = new DataView(buffer, 2);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6200
     * @tc.name testDataViewConstructor0062
     * @tc.desc Verify DataView constructor throws RangeError when byteLength is int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 0, -2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6400
     * @tc.name testDataViewConstructor0064
     * @tc.desc Verify DataView constructor throws RangeError when byteLength exceeds buffer byteLength by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 0, 17);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6500
     * @tc.name testDataViewConstructor0065
     * @tc.desc Verify DataView constructor throws RangeError when byteOffset plus byteLength exceeds buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 8, 9);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6600
     * @tc.name testDataViewConstructor0066
     * @tc.desc Verify DataView constructor returns expected result when both byteOffset and byteLength are very large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let buffer = new ArrayBuffer(16);
        let view = new DataView(buffer, 1000000, 1000000);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_CNSTR_6700
     * @tc.name testDataViewConstructor0067
     * @tc.desc Verify try-catch structure catches constructor error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let view = new DataView(null as ArrayBuffer);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
  });
}

