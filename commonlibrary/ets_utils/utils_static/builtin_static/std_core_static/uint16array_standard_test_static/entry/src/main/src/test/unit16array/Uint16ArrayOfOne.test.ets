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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayOf01Test(): void {
  describe('Uint16ArrayOf01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0100
     * @tc.name testUint16ArrayOfOne001
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0200
     * @tc.name testUint16ArrayOfOne002
     * @tc.desc Verify 1 byte Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 42;
      const arr = Uint16Array.of(a);
      expect(arr.length).assertEqual(1);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0300
     * @tc.name testUint16ArrayOfOne003
     * @tc.desc Verify 2 byte Uint16Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const arr = Uint16Array.of(a, b);
      expect(arr.length).assertEqual(2);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0400
     * @tc.name testUint16ArrayOfOne004
     * @tc.desc Verify 3 byte Uint16Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.length).assertEqual(3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0500
     * @tc.name testUint16ArrayOfOne005
     * @tc.desc Verify 5 byte Uint16Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const c: byte = 30;
      const d: byte = 40;
      const e: byte = 50;
      const arr = Uint16Array.of(a, b, c, d, e);
      expect(arr.length).assertEqual(5);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
      expect(arr.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0600
     * @tc.name testUint16ArrayOfOne006
     * @tc.desc Verify 10 byte Uint16Array 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a0: byte = 0; const a1: byte = 1; const a2: byte = 2;
      const a3: byte = 3; const a4: byte = 4; const a5: byte = 5;
      const a6: byte = 6; const a7: byte = 7; const a8: byte = 8;
      const a9: byte = 9;
      const arr = Uint16Array.of(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9);
      expect(arr.length).assertEqual(10);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0700
     * @tc.name testUint16ArrayOfOne007
     * @tc.desc Verify byte 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 0;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0800
     * @tc.name testUint16ArrayOfOne008
     * @tc.desc Verify byte 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 127;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_0900
     * @tc.name testUint16ArrayOfOne009
     * @tc.desc Verify byte -1 converts to Uint16 value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = -1;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1000
     * @tc.name testUint16ArrayOfOne010
     * @tc.desc Verify short 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = 0;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1100
     * @tc.name testUint16ArrayOfOne011
     * @tc.desc Verify short -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -1;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1200
     * @tc.name testUint16ArrayOfOne012
     * @tc.desc Verify short 32767 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = 32767;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1300
     * @tc.name testUint16ArrayOfOne013
     * @tc.desc Verify int 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1400
     * @tc.name testUint16ArrayOfOne014
     * @tc.desc Verify int 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 1;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1500
     * @tc.name testUint16ArrayOfOne015
     * @tc.desc Verify int 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65535;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1600
     * @tc.name testUint16ArrayOfOne016
     * @tc.desc Verify int 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65536;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1700
     * @tc.name testUint16ArrayOfOne017
     * @tc.desc Verify int 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65537;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1800
     * @tc.name testUint16ArrayOfOne018
     * @tc.desc Verify int -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -1;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_1900
     * @tc.name testUint16ArrayOfOne019
     * @tc.desc Verify int -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -65536;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2000
     * @tc.name testUint16ArrayOfOne020
     * @tc.desc Verify int -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -65537;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2100
     * @tc.name testUint16ArrayOfOne021
     * @tc.desc Verify int 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 131072;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2200
     * @tc.name testUint16ArrayOfOne022
     * @tc.desc Verify int 100000 34464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 100000;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2300
     * @tc.name testUint16ArrayOfOne023
     * @tc.desc Verify number 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: number = 65535;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2400
     * @tc.name testUint16ArrayOfOne024
     * @tc.desc Verify byte 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 0;
      const b: byte = -1;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2500
     * @tc.name testUint16ArrayOfOne025
     * @tc.desc Verify short -1 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -1;
      const b: short = 32767;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2600
     * @tc.name testUint16ArrayOfOne026
     * @tc.desc Verify int 65536 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65536;
      const b: int = -1;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2700
     * @tc.name testUint16ArrayOfOne027
     * @tc.desc Verify int 0 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0;
      const b: int = 65536;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2800
     * @tc.name testUint16ArrayOfOne028
     * @tc.desc Verify short -32768 -1 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -32768;
      const b: short = -1;
      const c: short = 32767;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_2900
     * @tc.name testUint16ArrayOfOne029
     * @tc.desc Verify int 65536 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65536;
      const b: int = 65536;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3000
     * @tc.name testUint16ArrayOfOne030
     * @tc.desc Verify int -1 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -1;
      const b: int = -2;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3100
     * @tc.name testUint16ArrayOfOne031
     * @tc.desc Verify byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 1; const b: byte = 3; const c: byte = 5;
      const d: byte = 7; const e: byte = 9;
      const arr = Uint16Array.of(a, b, c, d, e);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(5);
      expect(arr.at(3)).assertEqual(7);
      expect(arr.at(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3200
     * @tc.name testUint16ArrayOfOne032
     * @tc.desc Verify byte 255 0 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = -1;
      const b: byte = 0;
      const c: byte = -128;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3300
     * @tc.name testUint16ArrayOfOne033
     * @tc.desc Verify short 10 20 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = 10;
      const b: short = 20;
      const c: short = 30;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3400
     * @tc.name testUint16ArrayOfOne034
     * @tc.desc Verify number 65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: number = 65535;
      const b: number = 0;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3500
     * @tc.name testUint16ArrayOfOne035
     * @tc.desc Verify int 65536 65537 65538
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65536;
      const b: int = 65537;
      const c: int = 65538;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3600
     * @tc.name testUint16ArrayOfOne036
     * @tc.desc Verify byte 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = -1;
      const b: byte = -1;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3700
     * @tc.name testUint16ArrayOfOne037
     * @tc.desc Verify of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const arr = Uint16Array.of(a, b);
      expect(arr instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3800
     * @tc.name testUint16ArrayOfOne038
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const arr = Uint16Array.of(a, b);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_3900
     * @tc.name testUint16ArrayOfOne039
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const arr = Uint16Array.of(a);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4000
     * @tc.name testUint16ArrayOfOne040
     * @tc.desc Verify three Uint16 elements have byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4100
     * @tc.name testUint16ArrayOfOne041
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const arr = Uint16Array.of(a, b);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4200
     * @tc.name testUint16ArrayOfOne042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 5;
      const b: byte = 10;
      const c: byte = 15;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4300
     * @tc.name testUint16ArrayOfOne043
     * @tc.desc Verify of converts negative byte input to Uint16 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 100;
      const b: byte = -56;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(65480);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4400
     * @tc.name testUint16ArrayOfOne044
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 30;
      const b: byte = 60;
      const arr = Uint16Array.of(a, b);
      expect(arr.at(0)).assertEqual(30);
      expect(arr.at(1)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4500
     * @tc.name testUint16ArrayOfOne045
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 7;
      const b: byte = 14;
      const arr = Uint16Array.of(a, b);
      const results: Array<number> = [];
      for (const v of arr) {
        results.push(v);
      }
      expect(results.at(0)).assertEqual(7);
      expect(results.at(1)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4600
     * @tc.name testUint16ArrayOfOne046
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 10;
      const b: byte = 20;
      const arr = Uint16Array.of(a, b);
      expect(arr.toString()).assertEqual("10,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4700
     * @tc.name testUint16ArrayOfOne047
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.join()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4800
     * @tc.name testUint16ArrayOfOne048
     * @tc.desc Verify buffer byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of();
      expect(arr.buffer.byteLength).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_4900
     * @tc.name testUint16ArrayOfOne049
     * @tc.desc Verify int 65538 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65538;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5000
     * @tc.name testUint16ArrayOfOne050
     * @tc.desc Verify int 66000 464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 66000;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5100
     * @tc.name testUint16ArrayOfOne051
     * @tc.desc Verify int 1000000 16960
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 1000000;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(16960);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5200
     * @tc.name testUint16ArrayOfOne052
     * @tc.desc Verify int 0x10000 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0x10000;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5300
     * @tc.name testUint16ArrayOfOne053
     * @tc.desc Verify int 0x1FFFF 131071 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0x1FFFF;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5400
     * @tc.name testUint16ArrayOfOne054
     * @tc.desc Verify int 0x20000 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0x20000;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5500
     * @tc.name testUint16ArrayOfOne055
     * @tc.desc Verify int 0x20001 131073 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0x20001;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5600
     * @tc.name testUint16ArrayOfOne056
     * @tc.desc Verify int -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -65535;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5700
     * @tc.name testUint16ArrayOfOne057
     * @tc.desc Verify int -65534 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -65534;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5800
     * @tc.name testUint16ArrayOfOne058
     * @tc.desc Verify int -3 65533
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = -3;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65533);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_5900
     * @tc.name testUint16ArrayOfOne059
     * @tc.desc Verify short -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -2;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6000
     * @tc.name testUint16ArrayOfOne060
     * @tc.desc Verify short -16384 49152
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -16384;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(49152);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6100
     * @tc.name testUint16ArrayOfOne061
     * @tc.desc Verify int 0xABCD converts to Uint16 value 43981
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0xABCD;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6200
     * @tc.name testUint16ArrayOfOne062
     * @tc.desc Verify int 0xFFFE 65534 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0xFFFE;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6300
     * @tc.name testUint16ArrayOfOne063
     * @tc.desc Verify int 0xFFFF 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0xFFFF;
      const arr = Uint16Array.of(a);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6400
     * @tc.name testUint16ArrayOfOne064
     * @tc.desc Verify 50 byte 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a0: byte = 0; const a1: byte = 1; const a2: byte = 2;
      const a3: byte = 3; const a4: byte = 4; const a5: byte = 5;
      const a6: byte = 6; const a7: byte = 7; const a8: byte = 8;
      const a9: byte = 9; const a10: byte = 10; const a11: byte = 11;
      const a12: byte = 12; const a13: byte = 13; const a14: byte = 14;
      const a15: byte = 15; const a16: byte = 16; const a17: byte = 17;
      const a18: byte = 18; const a19: byte = 19; const a20: byte = 20;
      const a21: byte = 21; const a22: byte = 22; const a23: byte = 23;
      const a24: byte = 24; const a25: byte = 25; const a26: byte = 26;
      const a27: byte = 27; const a28: byte = 28; const a29: byte = 29;
      const a30: byte = 30; const a31: byte = 31; const a32: byte = 32;
      const a33: byte = 33; const a34: byte = 34; const a35: byte = 35;
      const a36: byte = 36; const a37: byte = 37; const a38: byte = 38;
      const a39: byte = 39; const a40: byte = 40; const a41: byte = 41;
      const a42: byte = 42; const a43: byte = 43; const a44: byte = 44;
      const a45: byte = 45; const a46: byte = 46; const a47: byte = 47;
      const a48: byte = 48; const a49: byte = 49;
      const arr = Uint16Array.of(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,
        a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24,
        a25, a26, a27, a28, a29, a30, a31, a32, a33, a34, a35, a36, a37, a38, a39,
        a40, a41, a42, a43, a44, a45, a46, a47, a48, a49);
      expect(arr.length).assertEqual(50);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(49)).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6500
     * @tc.name testUint16ArrayOfOne065
     * @tc.desc Verify 100 byte 100 byteLength 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a0: byte = 0; const a1: byte = 1; const a2: byte = 2;
      const a3: byte = 3; const a4: byte = 4; const a5: byte = 5;
      const a6: byte = 6; const a7: byte = 7; const a8: byte = 8;
      const a9: byte = 9; const a10: byte = 10; const a11: byte = 11;
      const a12: byte = 12; const a13: byte = 13; const a14: byte = 14;
      const a15: byte = 15; const a16: byte = 16; const a17: byte = 17;
      const a18: byte = 18; const a19: byte = 19; const a20: byte = 20;
      const a21: byte = 21; const a22: byte = 22; const a23: byte = 23;
      const a24: byte = 24; const a25: byte = 25; const a26: byte = 26;
      const a27: byte = 27; const a28: byte = 28; const a29: byte = 29;
      const a30: byte = 30; const a31: byte = 31; const a32: byte = 32;
      const a33: byte = 33; const a34: byte = 34; const a35: byte = 35;
      const a36: byte = 36; const a37: byte = 37; const a38: byte = 38;
      const a39: byte = 39; const a40: byte = 40; const a41: byte = 41;
      const a42: byte = 42; const a43: byte = 43; const a44: byte = 44;
      const a45: byte = 45; const a46: byte = 46; const a47: byte = 47;
      const a48: byte = 48; const a49: byte = 49; const a50: byte = 50;
      const a51: byte = 51; const a52: byte = 52; const a53: byte = 53;
      const a54: byte = 54; const a55: byte = 55; const a56: byte = 56;
      const a57: byte = 57; const a58: byte = 58; const a59: byte = 59;
      const a60: byte = 60; const a61: byte = 61; const a62: byte = 62;
      const a63: byte = 63; const a64: byte = 64; const a65: byte = 65;
      const a66: byte = 66; const a67: byte = 67; const a68: byte = 68;
      const a69: byte = 69; const a70: byte = 70; const a71: byte = 71;
      const a72: byte = 72; const a73: byte = 73; const a74: byte = 74;
      const a75: byte = 75; const a76: byte = 76; const a77: byte = 77;
      const a78: byte = 78; const a79: byte = 79; const a80: byte = 80;
      const a81: byte = 81; const a82: byte = 82; const a83: byte = 83;
      const a84: byte = 84; const a85: byte = 85; const a86: byte = 86;
      const a87: byte = 87; const a88: byte = 88; const a89: byte = 89;
      const a90: byte = 90; const a91: byte = 91; const a92: byte = 92;
      const a93: byte = 93; const a94: byte = 94; const a95: byte = 95;
      const a96: byte = 96; const a97: byte = 97; const a98: byte = 98;
      const a99: byte = 99;
      const arr = Uint16Array.of(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9,
        a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24,
        a25, a26, a27, a28, a29, a30, a31, a32, a33, a34, a35, a36, a37, a38, a39,
        a40, a41, a42, a43, a44, a45, a46, a47, a48, a49, a50, a51, a52, a53, a54,
        a55, a56, a57, a58, a59, a60, a61, a62, a63, a64, a65, a66, a67, a68, a69,
        a70, a71, a72, a73, a74, a75, a76, a77, a78, a79, a80, a81, a82, a83, a84,
        a85, a86, a87, a88, a89, a90, a91, a92, a93, a94, a95, a96, a97, a98, a99);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(200);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6600
     * @tc.name testUint16ArrayOfOne066
     * @tc.desc Verify byte 42 5 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 42;
      const b: byte = 42;
      const c: byte = 42;
      const d: byte = 42;
      const e: byte = 42;
      const arr = Uint16Array.of(a, b, c, d, e);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6700
     * @tc.name testUint16ArrayOfOne067
     * @tc.desc Verify int 65536 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 65536;
      const b: int = 65536;
      const c: int = 65536;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6800
     * @tc.name testUint16ArrayOfOne068
     * @tc.desc Verify short -1 4 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: short = -1;
      const b: short = -1;
      const c: short = -1;
      const d: short = -1;
      const arr = Uint16Array.of(a, b, c, d);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_6900
     * @tc.name testUint16ArrayOfOne069
     * @tc.desc Verify of() empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_7000
     * @tc.name testUint16ArrayOfOne070
     * @tc.desc Verify of with value 0x8000 (32768)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0x8000);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_7100
     * @tc.name testUint16ArrayOfOne071
     * @tc.desc Verify of with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: byte = 100;
      const b: short = -1;
      const c: int = 65535;
      const arr = Uint16Array.of(a, b, c);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_7200
     * @tc.name testUint16ArrayOfOne072
     * @tc.desc Verify of with 6 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 6);
      expect(arr.length).assertEqual(6);
      expect(arr.at(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_ONE_7300
     * @tc.name testUint16ArrayOfOne073
     * @tc.desc Verify of with value -32768 (32768)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-32768);
      expect(arr.at(0)).assertEqual(32768);
    });

  });
}
