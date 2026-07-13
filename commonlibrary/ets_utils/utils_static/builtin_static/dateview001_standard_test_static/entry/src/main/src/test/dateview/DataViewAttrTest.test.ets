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

export default function DataViewAttrTest(): void {
  describe('DataViewAttrTest', () => {
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
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_0100
     * @tc.name testDataViewAttr0001
     * @tc.desc Verify buffer property returns the ArrayBuffer passed during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_0200
     * @tc.name testDataViewAttr0002
     * @tc.desc Verify buffer property returns original buffer when constructed with offset parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_0300
     * @tc.name testDataViewAttr0003
     * @tc.desc Verify buffer property returns original buffer when constructed with offset and length parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(view.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_0700
     * @tc.name testDataViewAttr0007
     * @tc.desc Verify view.buffer.byteLength is consistent with original buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(view.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_0900
     * @tc.name testDataViewAttr0009
     * @tc.desc Verify byteLength equals buffer.byteLength when no offset and length parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1000
     * @tc.name testDataViewAttr0010
     * @tc.desc Verify byteLength equals buffer.byteLength minus offset when offset parameter is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1100
     * @tc.name testDataViewAttr0011
     * @tc.desc Verify byteLength equals specified length when offset and length parameters are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1200
     * @tc.name testDataViewAttr0012
     * @tc.desc Verify byteLength is 0 when length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 4, 0);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1300
     * @tc.name testDataViewAttr0013
     * @tc.desc Verify byteLength is 0 when offset equals buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 8);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1600
     * @tc.name testDataViewAttr0016
     * @tc.desc Verify byteLength is 1 when length parameter is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 1);
      expect(view.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1700
     * @tc.name testDataViewAttr0017
     * @tc.desc Verify byteLength property return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      expect(view.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_1800
     * @tc.name testDataViewAttr0018
     * @tc.desc Verify byteLength.toString() returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      expect(view.byteLength.toString()).assertEqual("4");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_2000
     * @tc.name testDataViewAttr0020
     * @tc.desc Verify byteOffset is 0 when no offset parameter is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_2100
     * @tc.name testDataViewAttr0021
     * @tc.desc Verify byteOffset equals specified offset when offset parameter is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_2200
     * @tc.name testDataViewAttr0022
     * @tc.desc Verify byteOffset equals specified offset when offset and length parameters are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_2400
     * @tc.name testDataViewAttr0024
     * @tc.desc Verify byteOffset when offset equals buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 8);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_2800
     * @tc.name testDataViewAttr0028
     * @tc.desc Verify byteOffset.toString() returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer, 2, 4);
      expect(view.byteOffset.toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3000
     * @tc.name testDataViewAttr0030
     * @tc.desc Verify byteOffset + byteLength is less than or equal to buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 4, 8);
      expect(view.byteOffset + view.byteLength).assertEqual(12);
      expect(view.byteOffset + view.byteLength <= view.buffer.byteLength).assertTrue();
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3100
     * @tc.name testDataViewAttr0031
     * @tc.desc Verify three property consistency under various constructor parameter combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(32);
      const view = new DataView(buffer, 8, 16);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteOffset).assertEqual(8);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3200
     * @tc.name testDataViewAttr0032
     * @tc.desc Verify DataView implements ArrayBufferView interface and interface properties are accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const view: ArrayBufferView = new DataView(buffer, 2, 4);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteLength).assertEqual(4);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3300
     * @tc.name testDataViewAttr0033
     * @tc.desc Verify DataView properties constructed with zero-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      expect(view.buffer).assertEqual(buffer);
      expect(view.byteLength).assertEqual(0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3400
     * @tc.name testDataViewAttr0034
     * @tc.desc Verify multiple views sharing the same buffer have independent properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 8, 8);
      expect(view1.buffer).assertEqual(view2.buffer);
      expect(view1.byteOffset).assertEqual(0);
      expect(view2.byteOffset).assertEqual(8);
      expect(view1.byteLength).assertEqual(8);
      expect(view2.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_DTVW_DATA_VIEW_ATTR_3500
     * @tc.name testDataViewAttr0035
     * @tc.desc Verify view range exactly covers the remaining part of buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDataViewAttr0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 8);
      expect(view.byteOffset).assertEqual(8);
      expect(view.byteLength).assertEqual(8);
      expect(view.byteOffset + view.byteLength).assertEqual(buffer.byteLength);
    });
  });
}

