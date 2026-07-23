'use static'

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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayFilterTest(): void {
  describe('Uint8ArrayFilterTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0010
     * @tc.name testUint8ArrayFilter001
     * @tc.desc Verify filter with value greater than 0 keeps all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0020
     * @tc.name testUint8ArrayFilter002
     * @tc.desc Verify filter with value greater than 3 returns [4,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 3);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(4);
      expect(result.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0030
     * @tc.name testUint8ArrayFilter003
     * @tc.desc Verify filter with value greater than 10 returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0040
     * @tc.name testUint8ArrayFilter004
     * @tc.desc Verify filter with value greater than or equal to 0 returns all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0050
     * @tc.name testUint8ArrayFilter005
     * @tc.desc Verify filter with value greater than or equal to 128 returns [128,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 128);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(128);
      expect(result.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0060
     * @tc.name testUint8ArrayFilter006
     * @tc.desc Verify filter with value less than 128 returns [0,127]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 128);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0070
     * @tc.name testUint8ArrayFilter007
     * @tc.desc Verify filter with value equal to 128 returns [128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 128);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0080
     * @tc.name testUint8ArrayFilter008
     * @tc.desc Verify filter with value equal to 0 returns [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0090
     * @tc.name testUint8ArrayFilter009
     * @tc.desc Verify filter with value equal to 255 returns [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 255);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0100
     * @tc.name testUint8ArrayFilter010
     * @tc.desc Verify single element [5] filter equal to 5 returns [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 5);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0110
     * @tc.name testUint8ArrayFilter011
     * @tc.desc Verify single element [5] filter equal to 0 returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0120
     * @tc.name testUint8ArrayFilter012
     * @tc.desc Verify empty array filter returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0130
     * @tc.name testUint8ArrayFilter013
     * @tc.desc Verify all-zero array [0,0,0] filter equal to 0 returns all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0140
     * @tc.name testUint8ArrayFilter014
     * @tc.desc Verify all-zero array [0,0,0] filter not equal to 0 returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const result: Uint8Array = arr.filter((v: number): boolean => v !== 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0150
     * @tc.name testUint8ArrayFilter015
     * @tc.desc Verify duplicate array [100,200,100,200] filter equal to 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 100, 200]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 100);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(100);
      expect(result.at(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0160
     * @tc.name testUint8ArrayFilter016
     * @tc.desc Verify duplicate array [100,200,100,200] filter equal to 200
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 100, 200]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 200);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(200);
      expect(result.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0170
     * @tc.name testUint8ArrayFilter017
     * @tc.desc Verify boundary array [0,1,254,255] filter > 254 returns [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 254);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0180
     * @tc.name testUint8ArrayFilter018
     * @tc.desc Verify boundary array [0,1,254,255] filter < 1 returns [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 1);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0190
     * @tc.name testUint8ArrayFilter019
     * @tc.desc Verify boundary array filter >= 254 returns [254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 254);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(254);
      expect(result.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0200
     * @tc.name testUint8ArrayFilter020
     * @tc.desc Verify boundary array filter <= 1 returns [0,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v <= 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0210
     * @tc.name testUint8ArrayFilter021
     * @tc.desc Verify boundary array filter not equal 0 returns [1,254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v !== 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(254);
      expect(result.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0220
     * @tc.name testUint8ArrayFilter022
     * @tc.desc Verify boundary array filter not equal 255 returns [0,1,254]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v !== 255);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0230
     * @tc.name testUint8ArrayFilter023
     * @tc.desc Verify boundary array filter > 127 returns [254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 127);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(254);
      expect(result.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0240
     * @tc.name testUint8ArrayFilter024
     * @tc.desc Verify boundary array filter < 128 returns [0,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 128);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0250
     * @tc.name testUint8ArrayFilter025
     * @tc.desc Verify boundary array filter >= 128 returns [254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 128);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(254);
      expect(result.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0260
     * @tc.name testUint8ArrayFilter026
     * @tc.desc Verify boundary array filter <= 127 returns [0,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v <= 127);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0270
     * @tc.name testUint8ArrayFilter027
     * @tc.desc Verify boundary array filter > 0 returns [1,254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(254);
      expect(result.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0280
     * @tc.name testUint8ArrayFilter028
     * @tc.desc Verify boundary array filter < 255 returns [0,1,254]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 255);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0290
     * @tc.name testUint8ArrayFilter029
     * @tc.desc Verify boundary array filter >= 0 returns all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 0);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0300
     * @tc.name testUint8ArrayFilter030
     * @tc.desc Verify boundary array filter <= 255 returns all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v <= 255);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0310
     * @tc.name testUint8ArrayFilter031
     * @tc.desc Verify boundary array filter > 255 returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 255);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0320
     * @tc.name testUint8ArrayFilter032
     * @tc.desc Verify boundary array filter < 0 returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0330
     * @tc.name testUint8ArrayFilter033
     * @tc.desc Verify boundary array filter >= 255 returns [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 255);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0340
     * @tc.name testUint8ArrayFilter034
     * @tc.desc Verify boundary array filter <= 0 returns [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v <= 0);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0350
     * @tc.name testUint8ArrayFilter035
     * @tc.desc Verify boundary array filter > 1 returns [254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(254);
      expect(result.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0360
     * @tc.name testUint8ArrayFilter036
     * @tc.desc Verify boundary array filter < 254 returns [0,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v < 254);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0370
     * @tc.name testUint8ArrayFilter037
     * @tc.desc Verify boundary array filter >= 1 returns [1,254,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v >= 1);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(254);
      expect(result.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0380
     * @tc.name testUint8ArrayFilter038
     * @tc.desc Verify boundary array filter <= 254 returns [0,1,254]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 254, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v <= 254);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0390
     * @tc.name testUint8ArrayFilter039
     * @tc.desc Verify filter with index equal to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i === 0);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0400
     * @tc.name testUint8ArrayFilter040
     * @tc.desc Verify filter with index equal to 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i === 2);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0410
     * @tc.name testUint8ArrayFilter041
     * @tc.desc Verify filter with index > 1 returns last two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i > 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(30);
      expect(result.at(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0420
     * @tc.name testUint8ArrayFilter042
     * @tc.desc Verify filter with index < 2 returns first two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i < 2);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0430
     * @tc.name testUint8ArrayFilter043
     * @tc.desc Verify filter with index >= 3 returns last
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i >= 3);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0440
     * @tc.name testUint8ArrayFilter044
     * @tc.desc Verify filter with index <= 1 returns first two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i <= 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0450
     * @tc.name testUint8ArrayFilter045
     * @tc.desc Verify filter with index !== 0 returns last three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i !== 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(20);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0460
     * @tc.name testUint8ArrayFilter046
     * @tc.desc Verify filter with index !== 3 returns first three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i !== 3);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0470
     * @tc.name testUint8ArrayFilter047
     * @tc.desc Verify filter with index > 2 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i > 2);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0480
     * @tc.name testUint8ArrayFilter048
     * @tc.desc Verify filter with index < 3 returns first three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i < 3);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0490
     * @tc.name testUint8ArrayFilter049
     * @tc.desc Verify filter with index >= 2 returns last two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i >= 2);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(30);
      expect(result.at(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0500
     * @tc.name testUint8ArrayFilter050
     * @tc.desc Verify filter with index <= 2 returns first three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i <= 2);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0510
     * @tc.name testUint8ArrayFilter051
     * @tc.desc Verify filter with index !== 1 returns three elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i !== 1);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0520
     * @tc.name testUint8ArrayFilter052
     * @tc.desc Verify filter with index !== 2 returns three elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i !== 2);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0530
     * @tc.name testUint8ArrayFilter053
     * @tc.desc Verify filter with index > 0 returns last three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i > 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(20);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0540
     * @tc.name testUint8ArrayFilter054
     * @tc.desc Verify filter with index < 1 returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i < 1);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0550
     * @tc.name testUint8ArrayFilter055
     * @tc.desc Verify filter with index >= 1 returns last three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i >= 1);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(20);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0560
     * @tc.name testUint8ArrayFilter056
     * @tc.desc Verify filter with index <= 0 returns first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i <= 0);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0570
     * @tc.name testUint8ArrayFilter057
     * @tc.desc Verify filter with even index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0580
     * @tc.name testUint8ArrayFilter058
     * @tc.desc Verify filter with odd index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i % 2 === 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(20);
      expect(result.at(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0590
     * @tc.name testUint8ArrayFilter059
     * @tc.desc Verify filter with first index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15, 20]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i === 0);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0600
     * @tc.name testUint8ArrayFilter060
     * @tc.desc Verify filter with last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15, 20]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i === 3);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0610
     * @tc.name testUint8ArrayFilter061
     * @tc.desc Verify all-zero filter with even index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0, 0]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i % 2 === 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0620
     * @tc.name testUint8ArrayFilter062
     * @tc.desc Verify all-zero filter with odd index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0, 0]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i % 2 === 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0630
     * @tc.name testUint8ArrayFilter063
     * @tc.desc Verify filter with index >= 3 on 5-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i >= 3);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(4);
      expect(result.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0640
     * @tc.name testUint8ArrayFilter064
     * @tc.desc Verify filter with index <= 1 on 5-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i <= 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0650
     * @tc.name testUint8ArrayFilter065
     * @tc.desc Verify filter with index > 4 returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i > 4);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0660
     * @tc.name testUint8ArrayFilter066
     * @tc.desc Verify filter with index !== 1 on 3-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => i !== 1);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0670
     * @tc.name testUint8ArrayFilter067
     * @tc.desc Verify filter with v > 2 and i < 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 2 && i < 3);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0680
     * @tc.name testUint8ArrayFilter068
     * @tc.desc Verify filter with v < 4 and i > 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v < 4 && i > 1);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0690
     * @tc.name testUint8ArrayFilter069
     * @tc.desc Verify filter with v > 1 and i !== 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 1 && i !== 2);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0700
     * @tc.name testUint8ArrayFilter070
     * @tc.desc Verify filter with v < 5 and i > 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v < 5 && i > 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(3);
      expect(result.at(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0710
     * @tc.name testUint8ArrayFilter071
     * @tc.desc Verify filter with v > 0 and i < 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 0 && i < 4);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
      expect(result.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0720
     * @tc.name testUint8ArrayFilter072
     * @tc.desc Verify filter with v > 2 and i < 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 2 && i < 4);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0730
     * @tc.name testUint8ArrayFilter073
     * @tc.desc Verify filter with v < 4 and i !== 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v < 4 && i !== 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0740
     * @tc.name testUint8ArrayFilter074
     * @tc.desc Verify filter with v equals i * 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === i * 10);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0750
     * @tc.name testUint8ArrayFilter075
     * @tc.desc Verify filter with v > i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > i);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0760
     * @tc.name testUint8ArrayFilter076
     * @tc.desc Verify filter with v equals i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === i);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0770
     * @tc.name testUint8ArrayFilter077
     * @tc.desc Verify filter with v > i * 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 5, 10]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > i * 3);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0780
     * @tc.name testUint8ArrayFilter078
     * @tc.desc Verify filter with v > i on same values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 10, 10]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > i);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0790
     * @tc.name testUint8ArrayFilter079
     * @tc.desc Verify filter with v equals (i+1)*10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === (i + 1) * 10);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0800
     * @tc.name testUint8ArrayFilter080
     * @tc.desc Verify filter with v equals i*2+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 3, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === i * 2 + 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0810
     * @tc.name testUint8ArrayFilter081
     * @tc.desc Verify filter with v equals (i+1)*2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([2, 4, 6]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === (i + 1) * 2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0820
     * @tc.name testUint8ArrayFilter082
     * @tc.desc Verify filter with v > i * 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > i * 8);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0830
     * @tc.name testUint8ArrayFilter083
     * @tc.desc Verify filter with v > 0 and v < 250
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 50, 100, 150, 200, 250]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 0 && v < 250);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(50);
      expect(result.at(3)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0840
     * @tc.name testUint8ArrayFilter084
     * @tc.desc Verify filter with v == 0 or v == 250
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 50, 100, 150, 200, 250]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === 0 || v === 250);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0850
     * @tc.name testUint8ArrayFilter085
     * @tc.desc Verify filter with not greater than 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => !(v > 20));
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0860
     * @tc.name testUint8ArrayFilter086
     * @tc.desc Verify filter with v > 0 and i < 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 0 && i < 2);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0870
     * @tc.name testUint8ArrayFilter087
     * @tc.desc Verify filter with v > 0 or i == 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 1, 2]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 0 || i === 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0880
     * @tc.name testUint8ArrayFilter088
     * @tc.desc Verify filter with v divisible by 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v % 10 === 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0890
     * @tc.name testUint8ArrayFilter089
     * @tc.desc Verify filter with even values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0900
     * @tc.name testUint8ArrayFilter090
     * @tc.desc Verify filter with odd values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v % 2 === 1);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0910
     * @tc.name testUint8ArrayFilter091
     * @tc.desc Verify filter with v > 5 and v < 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 5, 10, 15, 20]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 5 && v < 20);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0920
     * @tc.name testUint8ArrayFilter092
     * @tc.desc Verify filter with v == 10 or 30 or 50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v === 10 || v === 30 || v === 50);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0930
     * @tc.name testUint8ArrayFilter093
     * @tc.desc Verify filter with v > i*0 always true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 1, 1]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > i * 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0940
     * @tc.name testUint8ArrayFilter094
     * @tc.desc Verify filter with v > 0 and i < 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = arr.filter((v: number, i: int): boolean => v > 0 && i < 4);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0950
     * @tc.name testUint8ArrayFilter095
     * @tc.desc Verify filter all pass
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number): boolean => true);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0960
     * @tc.name testUint8ArrayFilter096
     * @tc.desc Verify filter with threshold captured from variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const threshold: number = 2;
      const result: Uint8Array = arr.filter((v: number): boolean => v > threshold);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0970
     * @tc.name testUint8ArrayFilter097
     * @tc.desc Verify filter with 0xFF hex comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0xFF);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0980
     * @tc.name testUint8ArrayFilter098
     * @tc.desc Verify filter with 0x80 hex comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([127, 128]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0x80);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_0990
     * @tc.name testUint8ArrayFilter099
     * @tc.desc Verify filter with 0b11111111 binary comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 255]);
      const result: Uint8Array = arr.filter((v: number): boolean => v === 0b11111111);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1000
     * @tc.name testUint8ArrayFilter100
     * @tc.desc Verify filter result is Uint8Array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1010
     * @tc.name testUint8ArrayFilter101
     * @tc.desc Verify filter returns new array not original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1020
     * @tc.name testUint8ArrayFilter102
     * @tc.desc Verify original array length unchanged after filter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const before: number = arr.length;
      arr.filter((v: number): boolean => v > 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1030
     * @tc.name testUint8ArrayFilter103
     * @tc.desc Verify original array element values unchanged after filter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.filter((v: number): boolean => v > 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1040
     * @tc.name testUint8ArrayFilter104
     * @tc.desc Verify result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1050
     * @tc.name testUint8ArrayFilter105
     * @tc.desc Verify result byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1060
     * @tc.name testUint8ArrayFilter106
     * @tc.desc Verify result elements via at() including negative index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 1);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1070
     * @tc.name testUint8ArrayFilter107
     * @tc.desc Verify empty array filter callback not called
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: Uint8Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FILTER_1080
     * @tc.name testUint8ArrayFilter108
     * @tc.desc Verify filter result elements are in correct order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFilter108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = arr.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });
  });
}
