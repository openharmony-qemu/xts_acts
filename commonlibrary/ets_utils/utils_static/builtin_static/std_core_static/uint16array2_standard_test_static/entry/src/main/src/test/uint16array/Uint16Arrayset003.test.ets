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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16Arrayset003Test(): void {
  describe('Uint16Arrayset003', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0100
     * @tc.name testUint16Arrayset003001
      * @tc.desc Verify integer FixedArray copies values and leaves the target suffix zeroed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [10, 20, 30];
      target.set(source);
      expect(target[0]).assertEqual(10);
      expect(target[1]).assertEqual(20);
      expect(target[2]).assertEqual(30);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0200
     * @tc.name testUint16Arrayset003002
      * @tc.desc Verify numeric FixedArray copies integral values into the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [5, 10, 15];
      target.set(source);
      expect(target[0]).assertEqual(5);
      expect(target[1]).assertEqual(10);
      expect(target[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0300
     * @tc.name testUint16Arrayset003003
      * @tc.desc Verify an empty integer FixedArray leaves a zero-initialized target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [];
      target.set(source);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(0);
      expect(target[2]).assertEqual(0);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0400
     * @tc.name testUint16Arrayset003004
      * @tc.desc Verify a single integer FixedArray element is written at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [42];
      target.set(source);
      expect(target[0]).assertEqual(42);
      expect(target[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0500
     * @tc.name testUint16Arrayset003005
      * @tc.desc Verify an integer FixedArray preserves a zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0600
     * @tc.name testUint16Arrayset003006
      * @tc.desc Verify an integer FixedArray preserves the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65535];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0700
     * @tc.name testUint16Arrayset003007
      * @tc.desc Verify an integer FixedArray preserves the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [32768];
      target.set(source);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0800
     * @tc.name testUint16Arrayset003008
      * @tc.desc Verify an integer FixedArray converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0xFFFF];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_0900
     * @tc.name testUint16Arrayset003009
      * @tc.desc Verify an integer FixedArray converts hexadecimal 0x7FFF to 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0x7FFF];
      target.set(source);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1000
     * @tc.name testUint16Arrayset003010
      * @tc.desc Verify an integer FixedArray converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0b1111111111111111];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1100
     * @tc.name testUint16Arrayset003011
      * @tc.desc Verify an integer FixedArray converts octal 0o177777 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0o177777];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1200
     * @tc.name testUint16Arrayset003012
      * @tc.desc Verify an integer FixedArray copies a mixed sequence of Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [0, 65535, 32768, 0, 65535];
      target.set(source);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(65535);
      expect(target[2]).assertEqual(32768);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1300
     * @tc.name testUint16Arrayset003013
      * @tc.desc Verify a numeric FixedArray converts scientific notation 1e4 to 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [1e4];
      target.set(source);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1400
     * @tc.name testUint16Arrayset003014
      * @tc.desc Verify a three-element integer FixedArray leaves the target suffix zeroed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [1, 2, 3];
      target.set(source);
      expect(target.join(',')).assertEqual('1,2,3,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1500
     * @tc.name testUint16Arrayset003015
      * @tc.desc Verify an integer FixedArray larger than the target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [1, 2, 3, 4];
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1600
     * @tc.name testUint16Arrayset003016
      * @tc.desc Verify a ten-element integer FixedArray cannot fit in a two-element target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(2);
      let source: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1700
     * @tc.name testUint16Arrayset003017
      * @tc.desc Verify an integer FixedArray wraps 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0x10000];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1800
     * @tc.name testUint16Arrayset003018
      * @tc.desc Verify an integer FixedArray wraps 65537 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65537];
      target.set(source);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_1900
     * @tc.name testUint16Arrayset003019
      * @tc.desc Verify an integer FixedArray wraps negative 65535 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-65535];
      target.set(source);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2000
     * @tc.name testUint16Arrayset003020
      * @tc.desc Verify an integer FixedArray wraps negative 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-65536];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2100
     * @tc.name testUint16Arrayset003021
      * @tc.desc Verify an integer FixedArray wraps negative 32768 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-32768];
      target.set(source);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2200
     * @tc.name testUint16Arrayset003022
      * @tc.desc Verify an integer FixedArray wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65536 * 2];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2300
     * @tc.name testUint16Arrayset003023
      * @tc.desc Verify an integer FixedArray wraps three Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65536 * 3];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2400
     * @tc.name testUint16Arrayset003024
      * @tc.desc Verify a numeric FixedArray writes two values at explicit offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2500
     * @tc.name testUint16Arrayset003025
      * @tc.desc Verify a three-element numeric FixedArray writes integral decimal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2600
     * @tc.name testUint16Arrayset003026
      * @tc.desc Verify an empty numeric FixedArray at offset zero performs no write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2700
     * @tc.name testUint16Arrayset003027
      * @tc.desc Verify a single numeric FixedArray element writes at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [99.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2800
     * @tc.name testUint16Arrayset003028
      * @tc.desc Verify a numeric FixedArray truncates 3.14 to three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [3.14];
      target.set(source, 0);
      expect(target[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_2900
     * @tc.name testUint16Arrayset003029
      * @tc.desc Verify a numeric FixedArray truncates 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3000
     * @tc.name testUint16Arrayset003030
      * @tc.desc Verify a numeric FixedArray truncates 1.5 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3100
     * @tc.name testUint16Arrayset003031
      * @tc.desc Verify a numeric FixedArray preserves 65535.0 as the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65535.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3200
     * @tc.name testUint16Arrayset003032
      * @tc.desc Verify a numeric FixedArray preserves 0.0 as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3300
     * @tc.name testUint16Arrayset003033
      * @tc.desc Verify a numeric FixedArray preserves 32768.0 as the Uint16 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [32768.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3400
     * @tc.name testUint16Arrayset003034
      * @tc.desc Verify a numeric FixedArray writes scientific notation 1e4 as 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1e4];
      target.set(source, 0);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3500
     * @tc.name testUint16Arrayset003035
      * @tc.desc Verify a numeric FixedArray converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0xFFFF];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3600
     * @tc.name testUint16Arrayset003036
      * @tc.desc Verify a numeric FixedArray converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0b1111111111111111];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3700
     * @tc.name testUint16Arrayset003037
      * @tc.desc Verify a numeric FixedArray writes at offset one without changing outer elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [10.0, 20.0];
      target.set(source, 1);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(10);
      expect(target[2]).assertEqual(20);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3800
     * @tc.name testUint16Arrayset003038
      * @tc.desc Verify a two-element numeric FixedArray fits exactly at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [10.0, 20.0];
      target.set(source, 3);
      expect(target[3]).assertEqual(10);
      expect(target[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_3900
     * @tc.name testUint16Arrayset003039
      * @tc.desc Verify a single numeric FixedArray element writes at the final target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [99.0];
      target.set(source, 4);
      expect(target[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4000
     * @tc.name testUint16Arrayset003040
      * @tc.desc Verify an empty numeric FixedArray is accepted at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4100
     * @tc.name testUint16Arrayset003041
      * @tc.desc Verify an empty numeric FixedArray is accepted at a nonzero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 3);
      expect(target[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4200
     * @tc.name testUint16Arrayset003042
      * @tc.desc Verify a numeric FixedArray fills a target exactly from offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4300
     * @tc.name testUint16Arrayset003043
      * @tc.desc Verify a numeric FixedArray writes a contiguous range from offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0];
      target.set(source, 1);
      expect(target.join(',')).assertEqual('0,1,2,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4400
     * @tc.name testUint16Arrayset003044
      * @tc.desc Verify a negative offset throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4500
     * @tc.name testUint16Arrayset003045
      * @tc.desc Verify a nonempty numeric FixedArray at target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4600
     * @tc.name testUint16Arrayset003046
      * @tc.desc Verify an offset beyond target length throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4700
     * @tc.name testUint16Arrayset003047
      * @tc.desc Verify an offset equal to negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4800
     * @tc.name testUint16Arrayset003048
      * @tc.desc Verify an offset below negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, -6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_4900
     * @tc.name testUint16Arrayset003049
      * @tc.desc Verify a distant positive offset throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0];
      try {
        target.set(source, 999999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5000
     * @tc.name testUint16Arrayset003050
      * @tc.desc Verify a source exceeding remaining capacity at offset four throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0, 3.0];
      try {
        target.set(source, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5100
     * @tc.name testUint16Arrayset003051
      * @tc.desc Verify a five-element source exceeding a three-element target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      try {
        target.set(source, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5200
     * @tc.name testUint16Arrayset003052
      * @tc.desc Verify a numeric FixedArray wraps 65536.0 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65536.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5300
     * @tc.name testUint16Arrayset003053
      * @tc.desc Verify a numeric FixedArray wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0x10000];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5400
     * @tc.name testUint16Arrayset003054
      * @tc.desc Verify a numeric FixedArray wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-1.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5500
     * @tc.name testUint16Arrayset003055
      * @tc.desc Verify a numeric FixedArray truncates 65535.9 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65535.9];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5600
     * @tc.name testUint16Arrayset003056
      * @tc.desc Verify a numeric FixedArray truncates negative 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-0.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5700
     * @tc.name testUint16Arrayset003057
      * @tc.desc Verify a numeric FixedArray converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [Number.POSITIVE_INFINITY];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5800
     * @tc.name testUint16Arrayset003058
      * @tc.desc Verify a numeric FixedArray converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_5900
     * @tc.name testUint16Arrayset003059
      * @tc.desc Verify a numeric FixedArray converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [Number.NaN];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6000
     * @tc.name testUint16Arrayset003060
      * @tc.desc Verify a numeric FixedArray wraps 65537.0 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65537.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6100
     * @tc.name testUint16Arrayset003061
      * @tc.desc Verify a numeric FixedArray wraps negative 32768.0 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-32768.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6200
     * @tc.name testUint16Arrayset003062
      * @tc.desc Verify a numeric FixedArray wraps negative 65535.0 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-65535.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6300
     * @tc.name testUint16Arrayset003063
      * @tc.desc Verify a numeric FixedArray wraps negative 65536.0 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-65536.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6400
     * @tc.name testUint16Arrayset003064
      * @tc.desc Verify a numeric FixedArray wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65536.0 * 2];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6500
     * @tc.name testUint16Arrayset003065
     * @tc.desc Verify FixedArray int source replaces the complete target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      const s: FixedArray<int> = [1, 2, 3, 4];
      t.set(s);
      expect(t.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6600
     * @tc.name testUint16Arrayset003066
     * @tc.desc Verify FixedArray number source truncates each fractional element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const s: FixedArray<number> = [1.9, 2.1, 3.8];
      t.set(s);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6700
     * @tc.name testUint16Arrayset003067
     * @tc.desc Verify FixedArray source writes at a nonzero insertion point
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(56, 56, 56, 56, 56);
      const s: FixedArray<int> = [4, 5, 6];
      t.set(s, 1);
      expect(t.join(',')).assertEqual('9,4,5,6,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6800
     * @tc.name testUint16Arrayset003068
     * @tc.desc Verify empty FixedArray at the target boundary performs no write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(48, 49, 50);
      const s: FixedArray<int> = [];
      t.set(s, 3);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_6900
     * @tc.name testUint16Arrayset003069
     * @tc.desc Verify FixedArray source converts mixed overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      const s: FixedArray<int> = [-1, 65536, 65537, -32768];
      t.set(s);
      expect(t.join(',')).assertEqual('65535,0,1,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7000
     * @tc.name testUint16Arrayset003070
     * @tc.desc Verify FixedArray number source converts nonfinite values to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const s: FixedArray<number> = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      t.set(s);
      expect(t.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7100
     * @tc.name testUint16Arrayset003071
     * @tc.desc Verify FixedArray capacity failure is atomic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(55, 55, 55);
      const s: FixedArray<int> = [1, 2, 3];
      try {
        t.set(s, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('8,8,8');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7200
     * @tc.name testUint16Arrayset003072
     * @tc.desc Verify FixedArray negative insertion point raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(55, 55);
      const s: FixedArray<int> = [1];
      try {
        t.set(s, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('8,8');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7300
     * @tc.name testUint16Arrayset003073
     * @tc.desc Verify Uint16Array source copied at zero remains independent afterward
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(48, 49, 50);
      const t: Uint16Array = new Uint16Array(3);
      t.set(s);
      s[0] = 9;
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7400
     * @tc.name testUint16Arrayset003074
     * @tc.desc Verify Uint16Array source view copies only visible elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint16Array = Uint16Array.of(56, 49, 51, 53, 55);
      const s: Uint16Array = base.subarray(1, 4);
      const t: Uint16Array = new Uint16Array(5);
      t.set(s, 1);
      expect(t.join(',')).assertEqual('0,2,4,6,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7500
     * @tc.name testUint16Arrayset003075
     * @tc.desc Verify overlapping Uint16Array copy to the right uses a snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(48, 49, 50, 51);
      t.set(t.subarray(0, 3), 1);
      expect(t.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7600
     * @tc.name testUint16Arrayset003076
     * @tc.desc Verify overlapping Uint16Array copy to the left uses a snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(48, 49, 50, 51);
      t.set(t.subarray(1, 4), 0);
      expect(t.join(',')).assertEqual('2,3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7700
     * @tc.name testUint16Arrayset003077
     * @tc.desc Verify Uint16Array source and target may be adjacent shared views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const all: Uint16Array = new Uint16Array(b);
      all.set(Uint16Array.of(48, 49, 50, 51, 52, 53));
      const s: Uint16Array = new Uint16Array(b, 0, 2);
      const t: Uint16Array = new Uint16Array(b, 4, 4);
      t.set(s, 2);
      expect(all.join(',')).assertEqual('1,2,3,4,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7800
     * @tc.name testUint16Arrayset003078
     * @tc.desc Verify Uint16Array source too large raises RangeError without partial copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(48, 49, 50, 51);
      const t: Uint16Array = Uint16Array.of(54, 54, 54);
      try {
        t.set(s);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_7900
     * @tc.name testUint16Arrayset003079
     * @tc.desc Verify Uint16Array source fits exactly at the final legal offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(52, 53);
      const t: Uint16Array = Uint16Array.of(0, 0, 0, 0);
      t.set(s, 2);
      expect(t.join(',')).assertEqual('0,0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET003_8000
     * @tc.name testUint16Arrayset003080
     * @tc.desc Verify shared Uint16Array source is read before target writes overlap it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset003080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const all: Uint16Array = new Uint16Array(b);
      all.set(Uint16Array.of(48, 49, 50, 51, 52));
      const s: Uint16Array = new Uint16Array(b, 2, 3);
      all.set(s, 0);
      expect(all.join(',')).assertEqual('2,3,4,4,5');
    });

  });
}
