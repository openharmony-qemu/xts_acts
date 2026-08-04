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

export default function uint16ArraySet03Test(): void {
  describe('Uint16ArraySet03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0100
     * @tc.name testUint16ArraySet03Test001
      * @tc.desc Verify integer FixedArray copies values and leaves the target suffix zeroed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0200
     * @tc.name testUint16ArraySet03Test002
      * @tc.desc Verify numeric FixedArray copies integral values into the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [5, 10, 15];
      target.set(source);
      expect(target[0]).assertEqual(5);
      expect(target[1]).assertEqual(10);
      expect(target[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0300
     * @tc.name testUint16ArraySet03Test003
      * @tc.desc Verify an empty integer FixedArray leaves a zero-initialized target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0400
     * @tc.name testUint16ArraySet03Test004
      * @tc.desc Verify a single integer FixedArray element is written at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [42];
      target.set(source);
      expect(target[0]).assertEqual(42);
      expect(target[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0500
     * @tc.name testUint16ArraySet03Test005
      * @tc.desc Verify an integer FixedArray preserves a zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0600
     * @tc.name testUint16ArraySet03Test006
      * @tc.desc Verify an integer FixedArray preserves the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65535];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0700
     * @tc.name testUint16ArraySet03Test007
      * @tc.desc Verify an integer FixedArray preserves the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [32768];
      target.set(source);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0800
     * @tc.name testUint16ArraySet03Test008
      * @tc.desc Verify an integer FixedArray converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0xFFFF];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_0900
     * @tc.name testUint16ArraySet03Test009
      * @tc.desc Verify an integer FixedArray converts hexadecimal 0x7FFF to 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0x7FFF];
      target.set(source);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1000
     * @tc.name testUint16ArraySet03Test010
      * @tc.desc Verify an integer FixedArray converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0b1111111111111111];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1100
     * @tc.name testUint16ArraySet03Test011
      * @tc.desc Verify an integer FixedArray converts octal 0o177777 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0o177777];
      target.set(source);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1200
     * @tc.name testUint16ArraySet03Test012
      * @tc.desc Verify an integer FixedArray copies a mixed sequence of Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1300
     * @tc.name testUint16ArraySet03Test013
      * @tc.desc Verify a numeric FixedArray converts scientific notation 1e4 to 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [1e4];
      target.set(source);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1400
     * @tc.name testUint16ArraySet03Test014
      * @tc.desc Verify a three-element integer FixedArray leaves the target suffix zeroed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [1, 2, 3];
      target.set(source);
      expect(target.join(',')).assertEqual('1,2,3,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1500
     * @tc.name testUint16ArraySet03Test015
      * @tc.desc Verify an integer FixedArray larger than the target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1600
     * @tc.name testUint16ArraySet03Test016
      * @tc.desc Verify a ten-element integer FixedArray cannot fit in a two-element target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1700
     * @tc.name testUint16ArraySet03Test017
      * @tc.desc Verify an integer FixedArray wraps 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0x10000];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1800
     * @tc.name testUint16ArraySet03Test018
      * @tc.desc Verify an integer FixedArray wraps 65537 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65537];
      target.set(source);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_1900
     * @tc.name testUint16ArraySet03Test019
      * @tc.desc Verify an integer FixedArray wraps negative 65535 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-65535];
      target.set(source);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2000
     * @tc.name testUint16ArraySet03Test020
      * @tc.desc Verify an integer FixedArray wraps negative 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-65536];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2100
     * @tc.name testUint16ArraySet03Test021
      * @tc.desc Verify an integer FixedArray wraps negative 32768 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-32768];
      target.set(source);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2200
     * @tc.name testUint16ArraySet03Test022
      * @tc.desc Verify an integer FixedArray wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65536 * 2];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2300
     * @tc.name testUint16ArraySet03Test023
      * @tc.desc Verify an integer FixedArray wraps three Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65536 * 3];
      target.set(source);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2400
     * @tc.name testUint16ArraySet03Test024
      * @tc.desc Verify a numeric FixedArray writes two values at explicit offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2500
     * @tc.name testUint16ArraySet03Test025
      * @tc.desc Verify a three-element numeric FixedArray writes integral decimal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2600
     * @tc.name testUint16ArraySet03Test026
      * @tc.desc Verify an empty numeric FixedArray at offset zero performs no write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2700
     * @tc.name testUint16ArraySet03Test027
      * @tc.desc Verify a single numeric FixedArray element writes at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [99.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2800
     * @tc.name testUint16ArraySet03Test028
      * @tc.desc Verify a numeric FixedArray truncates 3.14 to three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [3.14];
      target.set(source, 0);
      expect(target[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_2900
     * @tc.name testUint16ArraySet03Test029
      * @tc.desc Verify a numeric FixedArray truncates 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3000
     * @tc.name testUint16ArraySet03Test030
      * @tc.desc Verify a numeric FixedArray truncates 1.5 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3100
     * @tc.name testUint16ArraySet03Test031
      * @tc.desc Verify a numeric FixedArray preserves 65535.0 as the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65535.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3200
     * @tc.name testUint16ArraySet03Test032
      * @tc.desc Verify a numeric FixedArray preserves 0.0 as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3300
     * @tc.name testUint16ArraySet03Test033
      * @tc.desc Verify a numeric FixedArray preserves 32768.0 as the Uint16 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [32768.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3400
     * @tc.name testUint16ArraySet03Test034
      * @tc.desc Verify a numeric FixedArray writes scientific notation 1e4 as 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1e4];
      target.set(source, 0);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3500
     * @tc.name testUint16ArraySet03Test035
      * @tc.desc Verify a numeric FixedArray converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0xFFFF];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3600
     * @tc.name testUint16ArraySet03Test036
      * @tc.desc Verify a numeric FixedArray converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0b1111111111111111];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3700
     * @tc.name testUint16ArraySet03Test037
      * @tc.desc Verify a numeric FixedArray writes at offset one without changing outer elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3800
     * @tc.name testUint16ArraySet03Test038
      * @tc.desc Verify a two-element numeric FixedArray fits exactly at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [10.0, 20.0];
      target.set(source, 3);
      expect(target[3]).assertEqual(10);
      expect(target[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_3900
     * @tc.name testUint16ArraySet03Test039
      * @tc.desc Verify a single numeric FixedArray element writes at the final target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [99.0];
      target.set(source, 4);
      expect(target[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4000
     * @tc.name testUint16ArraySet03Test040
      * @tc.desc Verify an empty numeric FixedArray is accepted at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4100
     * @tc.name testUint16ArraySet03Test041
      * @tc.desc Verify an empty numeric FixedArray is accepted at a nonzero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [];
      target.set(source, 3);
      expect(target[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4200
     * @tc.name testUint16ArraySet03Test042
      * @tc.desc Verify a numeric FixedArray fills a target exactly from offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4300
     * @tc.name testUint16ArraySet03Test043
      * @tc.desc Verify a numeric FixedArray writes a contiguous range from offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [1.0, 2.0];
      target.set(source, 1);
      expect(target.join(',')).assertEqual('0,1,2,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4400
     * @tc.name testUint16ArraySet03Test044
      * @tc.desc Verify a negative offset throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4500
     * @tc.name testUint16ArraySet03Test045
      * @tc.desc Verify a nonempty numeric FixedArray at target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4600
     * @tc.name testUint16ArraySet03Test046
      * @tc.desc Verify an offset beyond target length throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4700
     * @tc.name testUint16ArraySet03Test047
      * @tc.desc Verify an offset equal to negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4800
     * @tc.name testUint16ArraySet03Test048
      * @tc.desc Verify an offset below negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_4900
     * @tc.name testUint16ArraySet03Test049
      * @tc.desc Verify a distant positive offset throws RangeError for a numeric FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5000
     * @tc.name testUint16ArraySet03Test050
      * @tc.desc Verify a source exceeding remaining capacity at offset four throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5100
     * @tc.name testUint16ArraySet03Test051
      * @tc.desc Verify a five-element source exceeding a three-element target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5200
     * @tc.name testUint16ArraySet03Test052
      * @tc.desc Verify a numeric FixedArray wraps 65536.0 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65536.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5300
     * @tc.name testUint16ArraySet03Test053
      * @tc.desc Verify a numeric FixedArray wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [0x10000];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5400
     * @tc.name testUint16ArraySet03Test054
      * @tc.desc Verify a numeric FixedArray wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-1.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5500
     * @tc.name testUint16ArraySet03Test055
      * @tc.desc Verify a numeric FixedArray truncates 65535.9 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65535.9];
      target.set(source, 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5600
     * @tc.name testUint16ArraySet03Test056
      * @tc.desc Verify a numeric FixedArray truncates negative 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-0.5];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5700
     * @tc.name testUint16ArraySet03Test057
      * @tc.desc Verify a numeric FixedArray converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [Number.POSITIVE_INFINITY];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5800
     * @tc.name testUint16ArraySet03Test058
      * @tc.desc Verify a numeric FixedArray converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_5900
     * @tc.name testUint16ArraySet03Test059
      * @tc.desc Verify a numeric FixedArray converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [Number.NaN];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6000
     * @tc.name testUint16ArraySet03Test060
      * @tc.desc Verify a numeric FixedArray wraps 65537.0 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65537.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6100
     * @tc.name testUint16ArraySet03Test061
      * @tc.desc Verify a numeric FixedArray wraps negative 32768.0 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-32768.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6200
     * @tc.name testUint16ArraySet03Test062
      * @tc.desc Verify a numeric FixedArray wraps negative 65535.0 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-65535.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6300
     * @tc.name testUint16ArraySet03Test063
      * @tc.desc Verify a numeric FixedArray wraps negative 65536.0 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [-65536.0];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6400
     * @tc.name testUint16ArraySet03Test064
      * @tc.desc Verify a numeric FixedArray wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<number> = [65536.0 * 2];
      target.set(source, 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6500
     * @tc.name testUint16ArraySet03Test065
     * @tc.desc Verify FixedArray int source replaces the complete target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      const s: FixedArray<int> = [1, 2, 3, 4];
      t.set(s);
      expect(t.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6600
     * @tc.name testUint16ArraySet03Test066
     * @tc.desc Verify FixedArray number source truncates each fractional element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const s: FixedArray<number> = [1.9, 2.1, 3.8];
      t.set(s);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6700
     * @tc.name testUint16ArraySet03Test067
     * @tc.desc Verify FixedArray source writes at a nonzero insertion point
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(9, 9, 9, 9, 9);
      const s: FixedArray<int> = [4, 5, 6];
      t.set(s, 1);
      expect(t.join(',')).assertEqual('9,4,5,6,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6800
     * @tc.name testUint16ArraySet03Test068
     * @tc.desc Verify empty FixedArray at the target boundary performs no write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3);
      const s: FixedArray<int> = [];
      t.set(s, 3);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_6900
     * @tc.name testUint16ArraySet03Test069
     * @tc.desc Verify FixedArray source converts mixed overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      const s: FixedArray<int> = [-1, 65536, 65537, -32768];
      t.set(s);
      expect(t.join(',')).assertEqual('65535,0,1,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7000
     * @tc.name testUint16ArraySet03Test070
     * @tc.desc Verify FixedArray number source converts nonfinite values to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const s: FixedArray<number> = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      t.set(s);
      expect(t.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7100
     * @tc.name testUint16ArraySet03Test071
     * @tc.desc Verify FixedArray capacity failure is atomic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(8, 8, 8);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7200
     * @tc.name testUint16ArraySet03Test072
     * @tc.desc Verify FixedArray negative insertion point raises RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(8, 8);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7300
     * @tc.name testUint16ArraySet03Test073
     * @tc.desc Verify Uint16Array source copied at zero remains independent afterward
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(1, 2, 3);
      const t: Uint16Array = new Uint16Array(3);
      t.set(s);
      s[0] = 9;
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7400
     * @tc.name testUint16ArraySet03Test074
     * @tc.desc Verify Uint16Array source view copies only visible elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint16Array = Uint16Array.of(9, 2, 4, 6, 8);
      const s: Uint16Array = base.subarray(1, 4);
      const t: Uint16Array = new Uint16Array(5);
      t.set(s, 1);
      expect(t.join(',')).assertEqual('0,2,4,6,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7500
     * @tc.name testUint16ArraySet03Test075
     * @tc.desc Verify overlapping Uint16Array copy to the right uses a snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      t.set(t.subarray(0, 3), 1);
      expect(t.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7600
     * @tc.name testUint16ArraySet03Test076
     * @tc.desc Verify overlapping Uint16Array copy to the left uses a snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      t.set(t.subarray(1, 4), 0);
      expect(t.join(',')).assertEqual('2,3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7700
     * @tc.name testUint16ArraySet03Test077
     * @tc.desc Verify Uint16Array source and target may be adjacent shared views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const all: Uint16Array = new Uint16Array(b);
      all.set(Uint16Array.of(1, 2, 3, 4, 5, 6));
      const s: Uint16Array = new Uint16Array(b, 0, 2);
      const t: Uint16Array = new Uint16Array(b, 4, 4);
      t.set(s, 2);
      expect(all.join(',')).assertEqual('1,2,3,4,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7800
     * @tc.name testUint16ArraySet03Test078
     * @tc.desc Verify Uint16Array source too large raises RangeError without partial copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const t: Uint16Array = Uint16Array.of(7, 7, 7);
      try {
        t.set(s);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_7900
     * @tc.name testUint16ArraySet079
     * @tc.desc Verify Uint16Array source fits exactly at the final legal offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Uint16Array = Uint16Array.of(5, 6);
      const t: Uint16Array = Uint16Array.of(0, 0, 0, 0);
      t.set(s, 2);
      expect(t.join(',')).assertEqual('0,0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET03_8000
     * @tc.name testUint16ArraySet080
     * @tc.desc Verify shared Uint16Array source is read before target writes overlap it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(10);
      const all: Uint16Array = new Uint16Array(b);
      all.set(Uint16Array.of(1, 2, 3, 4, 5));
      const s: Uint16Array = new Uint16Array(b, 2, 3);
      all.set(s, 0);
      expect(all.join(',')).assertEqual('2,3,4,4,5');
    });

  });
}
