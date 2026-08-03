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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayConstructor01Test(): void {
  describe('Uint8ArrayConstructor01Test', (): void => {
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
     * @tc.name testUint8ArrayConstructor01_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0010
     * @tc.desc Verify constructor() with no parameters creates empty Uint8Array with length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u = new Uint8Array();
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0020
     * @tc.desc Verify empty constructor BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u = new Uint8Array();
      expect(u.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0030
     * @tc.desc Verify empty constructor name is "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u = new Uint8Array();
      expect(u.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor01_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0040
     * @tc.desc Verify empty constructor buffer is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u = new Uint8Array();
      expect(u.buffer).not().assertNull();
    });

    /**
     * @tc.name testUint8ArrayConstructor01_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0050
     * @tc.desc Verify empty constructor buffer.byteLength is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u = new Uint8Array();
      expect(u.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0060
     * @tc.desc Verify multiple empty constructor calls create independent instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u1 = new Uint8Array();
      let u2 = new Uint8Array();
      expect(u1.length).assertEqual(0);
      expect(u2.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0070
     * @tc.desc Verify from empty FixedArray<int> creates length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [];
      let u = new Uint8Array(src);
      expect(u.name).assertEqual('Uint8Array');
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0080
     * @tc.desc Verify from single element [0] creates length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0090
     * @tc.desc Verify from single element [0] creates element value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0100
     * @tc.desc Verify from single element [1] creates element value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0110
     * @tc.desc Verify from single element [127] creates element value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [127];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0120
     * @tc.desc Verify from single element [128] creates element value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [128];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0130
     * @tc.desc Verify from single element [254] creates element value 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [254];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(254);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0140
     * @tc.desc Verify from single element [255] creates element value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0150
     * @tc.desc Verify from single element [256] truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [256];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0160
     * @tc.desc Verify from single element [-1] wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-1];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0170
     * @tc.desc Verify from single element [-128] wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-128];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0180
     * @tc.desc Verify from single element [0x80] creates hex 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0x80];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0190
     * @tc.desc Verify from single element [0xFF] creates hex max value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0xFF];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0200
     * @tc.desc Verify from single element [0x100] creates hex overflow truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0x100];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0210
     * @tc.desc Verify from single element [0x7F] creates hex 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0x7F];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0220
     * @tc.desc Verify from single element [-0x1] creates hex negative wrap to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-0x1];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0230
     * @tc.desc Verify from single element [0o377] creates octal 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0o377];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0240
     * @tc.desc Verify from single element [0b11111111] creates binary 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0b11111111];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0250
     * @tc.desc Verify from single element [0b0] creates binary 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0b0];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0260
     * @tc.desc Verify from single element [100] creates value 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [100];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0270
     * @tc.desc Verify from single element [999] creates large value truncates to 231
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [999];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(231);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0280
     * @tc.desc Verify from multiple elements [1,2,3] creates length 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0290
     * @tc.desc Verify from multiple elements [1,2,3] creates correct element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(1);
      expect(u.$_get(1)).assertEqual(2);
      expect(u.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0300
     * @tc.desc Verify from multiple elements [0,127,255] creates boundary values correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 127, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(127);
      expect(u.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0310
     * @tc.desc Verify from multiple elements [256,-1,257] creates truncation and wrap combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [256, -1, 257];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0320
     * @tc.desc Verify from multiple elements [999,-999] creates large value truncation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [999, -999];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(231);
      expect(u.$_get(1)).assertEqual(25);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0330
     * @tc.desc Verify from multiple elements [0x80,0xFF,0x100] creates hex boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0x80, 0xFF, 0x100];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0340
     * @tc.desc Verify from multiple elements [0,0,0,0,0] creates all zero values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 0, 0, 0, 0];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(0);
      expect(u.$_get(2)).assertEqual(0);
      expect(u.$_get(3)).assertEqual(0);
      expect(u.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0350
     * @tc.desc Verify from multiple elements [255,255,255] creates all max values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [255, 255, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0360
     * @tc.desc Verify from multiple elements [128,128,128] creates all mid values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [128, 128, 128];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
      expect(u.$_get(1)).assertEqual(128);
      expect(u.$_get(2)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0370
     * @tc.desc Verify from multiple elements [0,1,254,255] creates range boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 1, 254, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(1);
      expect(u.$_get(2)).assertEqual(254);
      expect(u.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0380
     * @tc.desc Verify from multiple elements [0o377,0o200,0o100] creates octal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0o377, 0o200, 0o100];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(128);
      expect(u.$_get(2)).assertEqual(64);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0390
     * @tc.desc Verify from multiple elements [0b11111111,0b10000000,0b00000000] creates binary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0b11111111, 0b10000000, 0b00000000];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(128);
      expect(u.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0400
     * @tc.desc Verify from FixedArray creates byteOffset 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20];
      let u = new Uint8Array(src);
      expect(u.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0410
     * @tc.desc Verify from FixedArray creates byteLength equal to element count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20, 30];
      let u = new Uint8Array(src);
      expect(u.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0420
     * @tc.desc Verify from FixedArray creates BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20];
      let u = new Uint8Array(src);
      expect(u.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0430
     * @tc.desc Verify from FixedArray creates name "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20];
      let u = new Uint8Array(src);
      expect(u.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor01_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0440
     * @tc.desc Verify from FixedArray creates buffer not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20];
      let u = new Uint8Array(src);
      expect(u.buffer).not().assertNull();
    });

    /**
     * @tc.name testUint8ArrayConstructor01_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0450
     * @tc.desc Verify from FixedArray creates buffer.byteLength equal to length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20, 30];
      let u = new Uint8Array(src);
      expect(u.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0460
     * @tc.desc Verify source FixedArray is not affected by write after construction (data copy semantics)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let u = new Uint8Array(src);
      u.$_set(0, 99);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0470
     * @tc.desc Verify buf ArrayBuffer(4) offset=0 creates length 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.length).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0480
     * @tc.desc Verify buf ArrayBuffer(4) offset=0 creates byteOffset 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0490
     * @tc.desc Verify buf ArrayBuffer(100) offset=0 creates length 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(100);
      let u = new Uint8Array(buf, 0);
      expect(u.length).assertEqual(100);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0500
     * @tc.desc Verify buf ArrayBuffer(1) offset=0 creates length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1);
      let u = new Uint8Array(buf, 0);
      expect(u.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0510
     * @tc.desc Verify buf ArrayBuffer(0) offset=0 creates length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let u = new Uint8Array(buf, 0);
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0520
     * @tc.desc Verify offset=1 creates byteOffset=1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 1);
      expect(u.byteOffset).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0530
     * @tc.desc Verify offset=4 creates empty view (length 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 4);
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0540
     * @tc.desc Verify offset equal to buffer.byteLength creates empty view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let u = new Uint8Array(buf, 8);
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0550
     * @tc.desc Verify offset=7 creates length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let u = new Uint8Array(buf, 7);
      expect(u.length).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0560
     * @tc.desc Verify from ArrayBuffer creates BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0570
     * @tc.desc Verify from ArrayBuffer creates name "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor01_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0580
     * @tc.desc Verify from ArrayBuffer creates buffer not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.buffer).not().assertNull();
    });

    /**
     * @tc.name testUint8ArrayConstructor01_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0590
     * @tc.desc Verify from ArrayBuffer creates buffer equals input buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0600
     * @tc.desc Verify from ArrayBuffer creates buffer.byteLength equals original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0610
     * @tc.desc Verify from ArrayBuffer initial values are all 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u = new Uint8Array(buf, 0);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(0);
      expect(u.$_get(2)).assertEqual(0);
      expect(u.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0620
     * @tc.desc Verify write 128 to view, visible in second view to same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u1 = new Uint8Array(buf, 0);
      u1.$_set(0, 128);
      let u2 = new Uint8Array(buf, 0);
      expect(u2.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0630
     * @tc.desc Verify offset view shares underlying buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u1 = new Uint8Array(buf, 0);
      u1.$_set(1, 42);
      let u2 = new Uint8Array(buf, 1);
      expect(u2.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0640
     * @tc.desc Verify write to offset view visible in base view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let u1 = new Uint8Array(buf, 1);
      u1.$_set(0, 99);
      let u2 = new Uint8Array(buf, 0);
      expect(u2.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0650
     * @tc.desc Verify offset view length is buffer byteLength minus offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u = new Uint8Array(buf, 3);
      expect(u.length).assertEqual(7);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0660
     * @tc.desc Verify offset view byteOffset parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u = new Uint8Array(buf, 3);
      expect(u.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0670
     * @tc.desc Verify offset view BYTES_PER_ELEMENT is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u = new Uint8Array(buf, 3);
      expect(u.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0680
     * @tc.desc Verify offset view name is "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u = new Uint8Array(buf, 3);
      expect(u.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor01_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0690
     * @tc.desc Verify offset view buffer same as input buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let u = new Uint8Array(buf, 3);
      expect(u.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0700
     * @tc.desc Verify from Array<number> [1,2,3] creates length 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0710
     * @tc.desc Verify from Array<number> creates correct element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(1);
      expect(u.$_get(1)).assertEqual(2);
      expect(u.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0720
     * @tc.desc Verify from ArrayLike creates byteOffset 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0730
     * @tc.desc Verify from ArrayLike creates BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0740
     * @tc.desc Verify from ArrayLike creates name "Uint8Array"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArrayConstructor01_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0750
     * @tc.desc Verify from ArrayLike creates buffer not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let u = new Uint8Array(src);
      expect(u.buffer).not().assertNull();
    });

    /**
     * @tc.name testUint8ArrayConstructor01_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0760
     * @tc.desc Verify from ArrayLike uses $_get to read element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [42];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0770
     * @tc.desc Verify from empty ArrayLike creates length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0780
     * @tc.desc Verify from ArrayLike with boundary values [0,127,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, 127, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(127);
      expect(u.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0790
     * @tc.desc Verify from ArrayLike with truncation values [256,-1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [256, -1];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0800
     * @tc.desc Verify from ArrayLike with single element [42]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [42];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(1);
      expect(u.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0810
     * @tc.desc Verify from ArrayLike with large array [1,2,3,4,5,6,7,8,9,10]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let u = new Uint8Array(src);
      expect(u.length).assertEqual(10);
      expect(u.$_get(0)).assertEqual(1);
      expect(u.$_get(9)).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0820
     * @tc.desc Verify from ArrayLike with all zeros [0,0,0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, 0, 0];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(0);
      expect(u.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0830
     * @tc.desc Verify from ArrayLike with all max values [255,255,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [255, 255, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0840
     * @tc.desc Verify from ArrayLike with mixed values [0,128,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, 128, 255];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(128);
      expect(u.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0850
     * @tc.desc Verify from ArrayLike with negative values [-1,-128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1, -128];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0860
     * @tc.desc Verify from ArrayLike with large values [999,-999]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [999, -999];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(231);
      expect(u.$_get(1)).assertEqual(25);
    });

    /**
     * @tc.name testUint8ArrayConstructor01_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0870
     * @tc.desc Verify from ArrayLike with hex values [0x80,0xFF,0x100]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0x80, 0xFF, 0x100];
      let u = new Uint8Array(src);
      expect(u.$_get(0)).assertEqual(128);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0880
     * @tc.name testUint8ArrayConstructor01_088
     * @tc.desc Verify constructor with empty Uint8Array source creates empty destination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(0);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0890
     * @tc.name testUint8ArrayConstructor01_089
     * @tc.desc Verify constructor with single element [0] Uint8Array source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0]);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(1);
      expect(dst[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0900
     * @tc.name testUint8ArrayConstructor01_090
     * @tc.desc Verify constructor with multiple elements [0, 127, 255] Uint8Array source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 127, 255]);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(127);
      expect(dst[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0910
     * @tc.name testUint8ArrayConstructor01_091
     * @tc.desc Verify constructor from length=100 source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(100);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0920
     * @tc.name testUint8ArrayConstructor01_092
     * @tc.desc Verify source and dst have different buffers
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(5);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0930
     * @tc.name testUint8ArrayConstructor01_093
     * @tc.desc Verify chained construction new Uint8Array(new Uint8Array(n)) works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Uint8Array = new Uint8Array(new Uint8Array(3));
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0940
     * @tc.name testUint8ArrayConstructor01_094
     * @tc.desc Verify constructor with Array<number> [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0];
      const dst: Uint8Array = new Uint8Array(arr);
      expect(dst.length).assertEqual(1);
      expect(dst[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0950
     * @tc.name testUint8ArrayConstructor01_095
     * @tc.desc Verify constructor with Array<number> [0, 127, 255] multiple values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0, 127, 255];
      const dst: Uint8Array = new Uint8Array(arr);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(127);
      expect(dst[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0960
     * @tc.name testUint8ArrayConstructor01_096
     * @tc.desc Verify constructor with Array<number> [1, 2, 3, 4, 5] then length check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const dst: Uint8Array = new Uint8Array(arr);
      expect(dst.length).assertEqual(5);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
      expect(dst[3]).assertEqual(4);
      expect(dst[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0970
     * @tc.name testUint8ArrayConstructor01_097
     * @tc.desc Verify constructor with Array<number> [10, 20, 30] then byteLength check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [10, 20, 30];
      const dst: Uint8Array = new Uint8Array(arr);
      expect(dst.byteLength).assertEqual(3);
      expect(dst[0]).assertEqual(10);
      expect(dst[1]).assertEqual(20);
      expect(dst[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0980
     * @tc.name testUint8ArrayConstructor01_098
     * @tc.desc Verify constructor with Array<number> [1, 2, 3] then byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const dst: Uint8Array = new Uint8Array(arr);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_0990
     * @tc.name testUint8ArrayConstructor01_099
     * @tc.desc Verify constructor from ArrayBuffer with only ArrayBuffer parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const dst: Uint8Array = new Uint8Array(ab);
      expect(dst.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1000
     * @tc.name testUint8ArrayConstructor01_100
     * @tc.desc Verify constructor with ArrayBuffer and byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const dst: Uint8Array = new Uint8Array(ab, 2);
      expect(dst.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1010
     * @tc.name testUint8ArrayConstructor01_101
     * @tc.desc Verify constructor with ArrayBuffer, byteOffset, and length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const dst: Uint8Array = new Uint8Array(ab, 2, 3);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1020
     * @tc.name testUint8ArrayConstructor01_102
     * @tc.desc Verify byteOffset=0, length=buffer.byteLength covers full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const dst: Uint8Array = new Uint8Array(ab, 0, 10);
      expect(dst.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1030
     * @tc.name testUint8ArrayConstructor01_103
     * @tc.desc Verify byteOffset=0, length=0 creates empty view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const dst: Uint8Array = new Uint8Array(ab, 0, 0);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1040
     * @tc.name testUint8ArrayConstructor01_104
     * @tc.desc Verify byteOffset=0, length=buffer.byteLength-1 covers all but last byte
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const dst: Uint8Array = new Uint8Array(ab, 0, 3);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1050
     * @tc.name testUint8ArrayConstructor01_105
     * @tc.desc Verify byteOffset=0, length=1 first byte view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const dst: Uint8Array = new Uint8Array(ab, 0, 1);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1060
     * @tc.name testUint8ArrayConstructor01_106
     * @tc.desc Verify byteOffset+length exceeds buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 2, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1070
     * @tc.name testUint8ArrayConstructor01_107
     * @tc.desc Verify negative byteOffset throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const dst: Uint8Array = new Uint8Array(ab, -1, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1080
     * @tc.name testUint8ArrayConstructor01_108
     * @tc.desc Verify byteOffset exceeds buffer byteLength throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1090
     * @tc.name testUint8ArrayConstructor01_109
     * @tc.desc Verify unspecificed byteOffset+length equals full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const dst: Uint8Array = new Uint8Array(ab, undefined, undefined);
      expect(dst.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1100
     * @tc.name testUint8ArrayConstructor01_110
     * @tc.desc Verify large buffer view length correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const dst: Uint8Array = new Uint8Array(ab, 4, 8);
      expect(dst.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1110
     * @tc.name testUint8ArrayConstructor01_111
     * @tc.desc Verify negative length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1120
     * @tc.name testUint8ArrayConstructor01_112
     * @tc.desc Verify byteOffset=0, length=buffer.byteLength+1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1130
     * @tc.name testUint8ArrayConstructor01_113
     * @tc.desc Verify byteOffset=0, length=1 on empty buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(0);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1140
     * @tc.name testUint8ArrayConstructor01_114
     * @tc.desc Verify byteOffset=0, length=buffer.byteLength+1 on large buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(1024);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 0, 1025);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1150
     * @tc.name testUint8ArrayConstructor01_115
     * @tc.desc Verify byteOffset=buffer.byteLength, length=1 on large buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(1024);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 1024, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1160
     * @tc.name testUint8ArrayConstructor01_116
     * @tc.desc Verify byteOffset=0, length=buffer.byteLength-1 on large buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(1024);
      const dst: Uint8Array = new Uint8Array(ab, 0, 1023);
      expect(dst.length).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1170
     * @tc.name testUint8ArrayConstructor01_117
     * @tc.desc Verify byteOffset=buffer.byteLength-1, length=1 on large buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(1024);
      const dst: Uint8Array = new Uint8Array(ab, 1023, 1);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_01_1180
     * @tc.name testUint8ArrayConstructor01_118
     * @tc.desc Verify byteOffset=buffer.byteLength-1, length=2 on large buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor01_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(1024);
      try {
        const dst: Uint8Array = new Uint8Array(ab, 1023, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
