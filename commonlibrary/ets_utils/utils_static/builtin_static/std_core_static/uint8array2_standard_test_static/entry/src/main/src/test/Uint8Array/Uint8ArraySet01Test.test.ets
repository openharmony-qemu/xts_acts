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

export default function Uint8ArraySet01Test(): void {
  describe('Uint8ArraySet01Test', (): void => {
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
     * @tc.name testUint8ArraySet01_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0010
     * @tc.desc Verify set with FixedArray parameter writes successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [10, 20, 30];
      target.set(src);
      expect(target[0]).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet01_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0020
     * @tc.desc Verify set with FixedArray<number> and insertPos parameter writes successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0, 20.0];
      target.set(src, 1);
      expect(target[1]).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet01_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0030
     * @tc.desc Verify set with ArrayLike<number> parameter with default offset=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [5, 10, 15];
      target.set(src);
      expect(target[1]).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet01_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0040
     * @tc.desc Verify set with ArrayLike<number> and explicit offset parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10, 20];
      target.set(src, 2);
      expect(target[2]).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet01_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0050
     * @tc.desc Verify set with empty FixedArray source leaves target unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      target.fill(99);
      const src: FixedArray<int> = [];
      target.set(src);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0060
     * @tc.desc Verify set with source element = 0 (minimum value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [0];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0070
     * @tc.desc Verify set with source element = 255 (maximum value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [255];
      target.set(src);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0080
     * @tc.desc Verify set with source element = 127 (middle value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [127];
      target.set(src);
      expect(target[0]).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArraySet01_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0090
     * @tc.desc Verify set with source element = 128 (0x80 boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [128];
      target.set(src);
      expect(target[0]).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet01_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0100
     * @tc.desc Verify set with source element = 256 (overflow truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [256];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0110
     * @tc.desc Verify set with source element = -1 (negative wraps to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [-1];
      target.set(src);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0120
     * @tc.desc Verify set with source element = 0.5 (float truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [0.5];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0130
     * @tc.desc Verify set with source element = 255.9 (float truncates to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [255.9];
      target.set(src);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0140
     * @tc.desc Verify set with source element = 256.1 (float + overflow truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [256.1];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0150
     * @tc.desc Verify set with source element = -0.5 (negative float truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [-0.5];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0160
     * @tc.desc Verify set with source element = 1000 (large overflow becomes 232)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [1000];
      target.set(src);
      expect(target[0]).assertEqual(232);
    });

    /**
     * @tc.name testUint8ArraySet01_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0170
     * @tc.desc Verify set with source element = -1000 (large negative wraps to 24)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [-1000];
      target.set(src);
      expect(target[0]).assertEqual(24);
    });

    /**
     * @tc.name testUint8ArraySet01_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0180
     * @tc.desc Verify set with source array containing multiple normal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [1, 2, 3];
      target.set(src);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet01_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0190
     * @tc.desc Verify set with source array shorter than target leaves tail unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<int> = [10, 20];
      target.set(src);
      expect(target[3]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0200
     * @tc.desc Verify set with source array equal length to target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      const src: FixedArray<int> = [1, 2, 3, 4];
      target.set(src);
      expect(target[3]).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArraySet01_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0210
     * @tc.desc Verify set with source array longer than target throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [10, 20, 30, 40, 50];
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0220
     * @tc.desc Verify set with 50 element source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(50);
      const src: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
      target.set(src);
      expect(target[49]).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArraySet01_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0230
     * @tc.desc Verify set with source array all zero elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [0, 0, 0];
      target.set(src);
      expect(target[1]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0240
     * @tc.desc Verify set with source array hexadecimal literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [0x00, 0xFF, 0x80];
      target.set(src);
      expect(target[1]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0250
     * @tc.desc Verify set with source array octal literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [0o377, 0o200, 0o0];
      target.set(src);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0260
     * @tc.desc Verify set with source array binary literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<int> = [0b11111111, 0b10000000, 0b0];
      target.set(src);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0270
     * @tc.desc Verify set with insertPos = 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0, 20.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet01_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0280
     * @tc.desc Verify set with insertPos = 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [30.0, 40.0];
      target.set(src, 1);
      expect(target[1]).assertEqual(30);
    });

    /**
     * @tc.name testUint8ArraySet01_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0290
     * @tc.desc Verify set with insertPos = length - 1 (last valid position, single element source)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<number> = [50.0];
      target.set(src, 4);
      expect(target[4]).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArraySet01_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0300
     * @tc.desc Verify set with insertPos = length throws RangeError with non-empty source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0310
     * @tc.desc Verify set with insertPos = length + 1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0320
     * @tc.desc Verify set with insertPos = -1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0330
     * @tc.desc Verify set with insertPos = -length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0340
     * @tc.desc Verify set with insertPos = -length - 1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0350
     * @tc.desc Verify set with insertPos = 99999 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0360
     * @tc.desc Verify set with insertPos = -99999 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0370
     * @tc.desc Verify set with empty FixedArray<number> source at insertPos=0 leaves target unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      target.fill(99);
      const src: FixedArray<number> = [];
      target.set(src, 0);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0380
     * @tc.desc Verify set with source element = 0 at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [0.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0390
     * @tc.desc Verify set with source element = 255 at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [255.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0400
     * @tc.desc Verify set with source element = 127 at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [127.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArraySet01_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0410
     * @tc.desc Verify set with source element = 128 at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [128.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet01_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0420
     * @tc.desc Verify set with source element = -1.0 (negative wraps to 255) at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [-1.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0430
     * @tc.desc Verify set with source element = 256.0 (overflow truncates to 0) at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [256.0];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0440
     * @tc.desc Verify set with multiple elements at insertPos=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet01_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0450
     * @tc.desc Verify set with offset=0 and source exactly fills target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      const src: FixedArray<number> = [10.0, 20.0, 30.0, 40.0];
      target.set(src, 0);
      expect(target[3]).assertEqual(40);
    });

    /**
     * @tc.name testUint8ArraySet01_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0460
     * @tc.desc Verify set with offset=0 and source too long throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0470
     * @tc.desc Verify set with offset=1 and source exactly fits remaining space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      target.fill(99);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 1);
      expect(target[3]).assertEqual(30);
    });

    /**
     * @tc.name testUint8ArraySet01_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0480
     * @tc.desc Verify set with offset=1 and source too long throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      try {
        target.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0490
     * @tc.desc Verify set with offset=2 and source fits remaining space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 2);
      expect(target[4]).assertEqual(30);
    });

    /**
     * @tc.name testUint8ArraySet01_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0500
     * @tc.desc Verify set with offset=3 and single element source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<number> = [50.0];
      target.set(src, 3);
      expect(target[3]).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArraySet01_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0510
     * @tc.desc Verify set with offset=4 and single element source at last position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<number> = [77.0];
      target.set(src, 4);
      expect(target[4]).assertEqual(77);
    });

    /**
     * @tc.name testUint8ArraySet01_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0520
     * @tc.desc Verify set with offset=5 and empty source succeeds (no write)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: FixedArray<number> = [];
      target.set(src, 5);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0530
     * @tc.desc Verify set with offset=5 and non-empty source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0540
     * @tc.desc Verify set with offset=6 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0550
     * @tc.desc Verify set with offset=-1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0560
     * @tc.desc Verify set with offset=-5 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0570
     * @tc.desc Verify set with offset=-6 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0580
     * @tc.desc Verify set with offset=99999 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, 99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0590
     * @tc.desc Verify set with offset=-99999 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: FixedArray<number> = [10.0];
      try {
        target.set(src, -99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0600
     * @tc.desc Verify set with offset=0 and source longer than target truncates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: FixedArray<number> = [10.0, 20.0, 30.0, 40.0];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0610
     * @tc.desc Verify set with offset=0 and BigInt source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(2);
      const src: Array<number> = [1, 2];
      target.set(src, 0);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArraySet01_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0620
     * @tc.desc Verify set with offset=0 and Array source element = 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [0];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0630
     * @tc.desc Verify set with offset=0 and Array source element = 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [255];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0640
     * @tc.desc Verify set with offset=0 and Array source element = 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [127];
      target.set(src, 0);
      expect(target[0]).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArraySet01_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0650
     * @tc.desc Verify set with offset=0 and Array source element = 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [128];
      target.set(src, 0);
      expect(target[0]).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet01_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0660
     * @tc.desc Verify set with offset=0 and Array source element = 256 (overflow truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [256];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0670
     * @tc.desc Verify set with offset=0 and Array source element = -1 (negative wraps to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [-1];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0680
     * @tc.desc Verify set with offset=0 and Array source element = 1000 (large overflow becomes 232)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [1000];
      target.set(src, 0);
      expect(target[0]).assertEqual(232);
    });

    /**
     * @tc.name testUint8ArraySet01_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0690
     * @tc.desc Verify set with offset=0 and Array source element = -1000 (large negative wraps to 24)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [-1000];
      target.set(src, 0);
      expect(target[0]).assertEqual(24);
    });

    /**
     * @tc.name testUint8ArraySet01_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0700
     * @tc.desc Verify set with offset=0 and Array source array multiple elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [1, 2, 3];
      target.set(src, 0);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet01_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0710
     * @tc.desc Verify set with offset=0 and Array source array shorter than target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [10, 20];
      target.set(src, 0);
      expect(target[3]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0720
     * @tc.desc Verify set with offset=0 and Array source array equal length to target
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      const src: Array<number> = [1, 2, 3, 4];
      target.set(src, 0);
      expect(target[3]).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArraySet01_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0730
     * @tc.desc Verify set with offset=0 and Array source array longer than target truncates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [10, 20, 30, 40, 50];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0740
     * @tc.desc Verify set with offset=0 and Array source array all zero elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [0, 0, 0];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0750
     * @tc.desc Verify set with offset=0 and Array source array hexadecimal literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [0x00, 0xFF, 0x80];
      target.set(src, 0);
      expect(target[1]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0760
     * @tc.desc Verify set with offset=1 and Array source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [10, 20];
      target.set(src, 1);
      expect(target[2]).assertEqual(20);
    });

    /**
     * @tc.name testUint8ArraySet01_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0770
     * @tc.desc Verify set with offset=2 and Array source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [30, 40];
      target.set(src, 2);
      expect(target[3]).assertEqual(40);
    });

    /**
     * @tc.name testUint8ArraySet01_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0780
     * @tc.desc Verify set with offset=3 and Array source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [50, 60];
      target.set(src, 3);
      expect(target[4]).assertEqual(60);
    });

    /**
     * @tc.name testUint8ArraySet01_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0790
     * @tc.desc Verify set with offset=4 and Array source single element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [77];
      target.set(src, 4);
      expect(target[4]).assertEqual(77);
    });

    /**
     * @tc.name testUint8ArraySet01_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0800
     * @tc.desc Verify set with offset=5 and Array empty source succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [];
      target.set(src, 5);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0810
     * @tc.desc Verify set with offset=5 and Array non-empty source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10];
      try {
        target.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0820
     * @tc.desc Verify set with offset=-1 and Array source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10];
      try {
        target.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0830
     * @tc.desc Verify set with offset=-5 and Array source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10];
      try {
        target.set(src, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0840
     * @tc.desc Verify set with offset=99999 and Array source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10];
      try {
        target.set(src, 99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0850
     * @tc.desc Verify set with offset=-99999 and Array source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      const src: Array<number> = [10];
      try {
        target.set(src, -99999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0860
     * @tc.desc Verify set with math expression 127+130=257 (overflow truncates to 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(1);
      const src: FixedArray<int> = [127 + 130];
      target.set(src);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet01_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0870
     * @tc.desc Verify set with large overflow [257, -2] combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(2);
      const src: Array<number> = [257, -2];
      target.set(src, 0);
      expect(target[1]).assertEqual(254);
    });

    /**
     * @tc.name testUint8ArraySet01_088
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0880
     * @tc.desc Verify set with float + overflow mixed [256.7, -1.3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(2);
      const src: Array<number> = [256.7, -1.3];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_089
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0890
     * @tc.desc Verify set with math expression source 0xFF + 0x01 -> 256 -> 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(1);
      const src: FixedArray<int> = [0xFF + 0x01];
      target.set(src);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_090
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0900
     * @tc.desc Verify set with offset=0 and empty Array<number> source leaves target unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      target.fill(99);
      const src: Array<number> = [];
      target.set(src, 0);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_091
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0910
     * @tc.desc Verify set preserves target elements before offset position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [10, 20];
      target.set(src, 2);
      expect(target[0]).assertEqual(99);
      expect(target[1]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_092
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0920
     * @tc.desc Verify set preserves target elements after source write range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5);
      target.fill(99);
      const src: Array<number> = [10, 20];
      target.set(src, 0);
      expect(target[3]).assertEqual(99);
      expect(target[4]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_093
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0930
     * @tc.desc Verify set with zero-length target and empty source succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(0);
      const src: Array<number> = [];
      target.set(src, 0);
      expect(target.length).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_094
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0940
     * @tc.desc Verify set with zero-length target and non-empty source throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(0);
      const src: Array<number> = [10];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet01_095
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0950
     * @tc.desc Verify set with large target (100 elements) and full source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(100);
      const src: FixedArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99];
      target.set(src);
      expect(target[99]).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet01_096
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0960
     * @tc.desc Verify set with alternating values [0, 255, 0, 255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(4);
      const src: FixedArray<int> = [0, 255, 0, 255];
      target.set(src);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(255);
      expect(target[2]).assertEqual(0);
      expect(target[3]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_097
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0970
     * @tc.desc Verify set with 2.56e2 (scientific notation) truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(1);
      const src: FixedArray<number> = [2.56e2];
      target.set(src, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet01_098
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0980
     * @tc.desc Verify set with offset=0 and Array<number> source binary literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [0b11111111, 0b10000000, 0b0];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_099
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_0990
     * @tc.desc Verify set with offset=0 and Array<number> source octal literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3);
      const src: Array<number> = [0o377, 0o200, 0o0];
      target.set(src, 0);
      expect(target[0]).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet01_100
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_01_1000
     * @tc.desc Verify set with offset=0 and Array<number> source 50 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet01_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(50);
      const src: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
      target.set(src, 0);
      expect(target[49]).assertEqual(50);
    });
  });
}