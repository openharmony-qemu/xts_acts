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

export default function uint16ArrayToStringTest(): void {
  describe('Uint16ArrayToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0100
     * @tc.name testUint16ArrayToString001
       * @tc.desc Verify three values serialize as comma-separated decimal tokens
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: string = arr.toString();
      expect(result).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0200
     * @tc.name testUint16ArrayToString002
       * @tc.desc Verify two values serialize without spaces between comma delimiters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2);
      const result: string = arr.toString();
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0300
     * @tc.name testUint16ArrayToString003
      * @tc.desc Verify an empty default-constructed array serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array();
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0400
     * @tc.name testUint16ArrayToString004
      * @tc.desc Verify a zero-length integer construction serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0);
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0500
     * @tc.name testUint16ArrayToString005
      * @tc.desc Verify a zero-length numeric construction serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(0.0);
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0600
     * @tc.name testUint16ArrayToString006
      * @tc.desc Verify an empty array created by of serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of();
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0700
     * @tc.name testUint16ArrayToString007
      * @tc.desc Verify an empty array created by from serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.from([]);
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0800
     * @tc.name testUint16ArrayToString008
      * @tc.desc Verify a zero-byte buffer view serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint16Array = new Uint16Array(buf);
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_0900
     * @tc.name testUint16ArrayToString009
      * @tc.desc Verify an empty literal-backed array serializes to an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([]);
      const result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1000
     * @tc.name testUint16ArrayToString010
      * @tc.desc Verify a single Uint16 minimum value serializes as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0]);
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1100
     * @tc.name testUint16ArrayToString011
      * @tc.desc Verify a single Uint16 maximum value serializes as 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65535]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1200
     * @tc.name testUint16ArrayToString012
      * @tc.desc Verify a single Uint16 midpoint value serializes as 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([32768]);
      const result: string = arr.toString();
      expect(result).assertEqual('32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1300
     * @tc.name testUint16ArrayToString013
      * @tc.desc Verify a single ordinary value serializes as its decimal text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1]);
      const result: string = arr.toString();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1400
     * @tc.name testUint16ArrayToString014
      * @tc.desc Verify overflow input 65536 serializes after conversion to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65536]);
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1500
     * @tc.name testUint16ArrayToString015
      * @tc.desc Verify negative-one input serializes after conversion to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([-1]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1600
     * @tc.name testUint16ArrayToString016
      * @tc.desc Verify a fractional input serializes after integer truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([3.14]);
      const result: string = arr.toString();
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1700
     * @tc.name testUint16ArrayToString017
      * @tc.desc Verify a fractional maximum input serializes as 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65535.9]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1800
     * @tc.name testUint16ArrayToString018
      * @tc.desc Verify NaN input serializes after Uint16 conversion to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([Number.NaN]);
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_1900
     * @tc.name testUint16ArrayToString019
      * @tc.desc Verify positive infinity serializes after Uint16 conversion to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([Number.POSITIVE_INFINITY]);
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2000
     * @tc.name testUint16ArrayToString020
      * @tc.desc Verify negative infinity serializes after Uint16 conversion to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([-Number.POSITIVE_INFINITY]);
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2100
     * @tc.name testUint16ArrayToString021
     * @tc.desc Verify [0, 65535] toString "0,65535"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 65535]);
      const result: string = arr.toString();
      expect(result).assertEqual('0,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2200
     * @tc.name testUint16ArrayToString022
     * @tc.desc Verify [32768, 1] toString "32768,1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([32768, 1]);
      const result: string = arr.toString();
      expect(result).assertEqual('32768,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2300
     * @tc.name testUint16ArrayToString023
     * @tc.desc Verify [65536, -1] [0, 65535] toString "0,65535"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65536, -1]);
      const result: string = arr.toString();
      expect(result).assertEqual('0,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2400
     * @tc.name testUint16ArrayToString024
     * @tc.desc Verify [0xFFFF, 0x8000] toString "65535,32768"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0xFFFF, 0x8000]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2500
     * @tc.name testUint16ArrayToString025
     * @tc.desc Verify [0b1111, 0o7777] / toString "15,4095"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0b1111, 0o7777]);
      const result: string = arr.toString();
      expect(result).assertEqual('15,4095');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2600
     * @tc.name testUint16ArrayToString026
     * @tc.desc Verify [0x10000, -0x8000] [0, 32768] toString "0,32768"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0x10000, -0x8000]);
      const result: string = arr.toString();
      expect(result).assertEqual('0,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2700
     * @tc.name testUint16ArrayToString027
     * @tc.desc Verify [10, 20, 30, 40, 50] toString "10,20,30,40,50"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      const result: string = arr.toString();
      expect(result).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2800
     * @tc.name testUint16ArrayToString028
     * @tc.desc Verify [65535, 0, 65535, 0] toString "65535,0,65535,0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65535, 0, 65535, 0]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535,0,65535,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_2900
     * @tc.name testUint16ArrayToString029
     * @tc.desc Verify Uint16Array.of(1, 2, 3, 4, 5) toString "1,2,3,4,5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: string = arr.toString();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3000
     * @tc.name testUint16ArrayToString030
     * @tc.desc Verify [7, 7, 7] toString "7,7,7"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([7, 7, 7]);
      const result: string = arr.toString();
      expect(result).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3100
     * @tc.name testUint16ArrayToString031
     * @tc.desc Verify [0, 0, 0, 0] toString "0,0,0,0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 0, 0, 0]);
      const result: string = arr.toString();
      expect(result).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3200
     * @tc.name testUint16ArrayToString032
     * @tc.desc Verify [65535, 65535, 65535] toString "65535,65535,65535"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([65535, 65535, 65535]);
      const result: string = arr.toString();
      expect(result).assertEqual('65535,65535,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3300
     * @tc.name testUint16ArrayToString033
     * @tc.desc Verify [1e3, 2e3, 3e3] toString "1000,2000,3000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1e3, 2e3, 3e3]);
      const result: string = arr.toString();
      expect(result).assertEqual('1000,2000,3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3400
     * @tc.name testUint16ArrayToString034
     * @tc.desc Verify [0, 1, 32768, 65535] toString "0,1,32768,65535"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 1, 32768, 65535]);
      const result: string = arr.toString();
      expect(result).assertEqual('0,1,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3500
     * @tc.name testUint16ArrayToString035
      * @tc.desc Verify toString reflects an indexed replacement in the middle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr[1] = 99;
      const result: string = arr.toString();
      expect(result).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3600
     * @tc.name testUint16ArrayToString036
      * @tc.desc Verify toString reflects a maximum value written to the first index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 0, 0]);
      arr[0] = 65535;
      const result: string = arr.toString();
      expect(result).assertEqual('65535,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3700
     * @tc.name testUint16ArrayToString037
      * @tc.desc Verify toString reflects a zero written to the final index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      arr[3] = 0;
      const result: string = arr.toString();
      expect(result).assertEqual('1,2,3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3800
     * @tc.name testUint16ArrayToString038
      * @tc.desc Verify toString reflects overflow conversion after indexed assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0]);
      arr[0] = 65536;
      const result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_3900
     * @tc.name testUint16ArrayToString039
      * @tc.desc Verify negative indexed assignment serializes as the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0]);
      arr[0] = -1;
      const result: string = arr.toString();
      expect(result).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4000
     * @tc.name testUint16ArrayToString040
      * @tc.desc Verify a filled array serializes every repeated value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(42);
      const result: string = arr.toString();
      expect(result).assertEqual('42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4100
     * @tc.name testUint16ArrayToString041
      * @tc.desc Verify filling with zero serializes all zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(0);
      const result: string = arr.toString();
      expect(result).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4200
     * @tc.name testUint16ArrayToString042
      * @tc.desc Verify filling with the maximum value serializes both elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(2);
      arr.fill(65535);
      const result: string = arr.toString();
      expect(result).assertEqual('65535,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4300
     * @tc.name testUint16ArrayToString043
      * @tc.desc Verify toString formats a partially filled range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      arr.fill(99, 1, 3);
      const result: string = arr.toString();
      expect(result).assertEqual('1,99,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4400
     * @tc.name testUint16ArrayToString044
      * @tc.desc Verify toString reflects overflow conversion performed by fill
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(65536);
      const result: string = arr.toString();
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4500
     * @tc.name testUint16ArrayToString045
      * @tc.desc Verify toString formats values assigned with set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.set([10, 20, 30]);
      const result: string = arr.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4600
     * @tc.name testUint16ArrayToString046
      * @tc.desc Verify toString formats values copied from another Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = Uint16Array.of(100, 200, 300);
      const dst: Uint16Array = new Uint16Array(3);
      dst.set(src);
      const result: string = dst.toString();
      expect(result).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4700
     * @tc.name testUint16ArrayToString047
      * @tc.desc Verify toString reflects an offset set operation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 0, 0, 0]);
      arr.set([99, 99], 1);
      const result: string = arr.toString();
      expect(result).assertEqual('0,99,99,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4800
     * @tc.name testUint16ArrayToString048
      * @tc.desc Verify serialization reflects an in-place reversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr.reverse();
      const result: string = arr.toString();
      expect(result).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_4900
     * @tc.name testUint16ArrayToString049
      * @tc.desc Verify serialization reflects an in-place numeric sort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([3, 1, 2]);
      arr.sort();
      const result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5000
     * @tc.name testUint16ArrayToString050
      * @tc.desc Verify serialization reflects overlapping copyWithin content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      const result: string = arr.toString();
      expect(result).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5100
     * @tc.name testUint16ArrayToString051
      * @tc.desc Verify serialization formats values produced by map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      const mapped: Uint16Array = arr.map((v: number): number => v * 10);
      const result: string = mapped.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5200
     * @tc.name testUint16ArrayToString052
      * @tc.desc Verify serialization formats values retained by filter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      const filtered: Uint16Array = arr.filter((v: number): boolean => v > 2);
      const result: string = filtered.toString();
      expect(result).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5300
     * @tc.name testUint16ArrayToString053
      * @tc.desc Verify a single sentinel element serializes as one decimal token
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([42]);
      expect(arr.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5400
     * @tc.name testUint16ArrayToString054
      * @tc.desc Verify minimum midpoint and maximum values serialize in index order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
      expect(arr.toString()).assertEqual('0,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5500
     * @tc.name testUint16ArrayToString055
      * @tc.desc Verify serialization reflects a full fill with repeated sevens
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(7);
      expect(arr.toString()).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5600
     * @tc.name testUint16ArrayToString056
      * @tc.desc Verify serialization reflects values assigned by set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.set([5, 10, 15]);
      expect(arr.toString()).assertEqual('5,10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5700
     * @tc.name testUint16ArrayToString057
       * @tc.desc Verify an of-created three-value array serializes in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: string = arr.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5800
     * @tc.name testUint16ArrayToString058
      * @tc.desc Verify a three-element decimal sequence serializes in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([10, 20, 30]);
      const result: string = arr.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_5900
     * @tc.name testUint16ArrayToString059
      * @tc.desc Verify a copied typed array serializes its copied content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = Uint16Array.of(1, 2, 3);
      const dst: Uint16Array = new Uint16Array(src);
      expect(dst.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6000
     * @tc.name testUint16ArrayToString060
     * @tc.desc Verify toString returns comma-separated values for ArrayBuffer-backed Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 256;
      arr[1] = 257;
      const result: string = arr.toString();
      expect(result).assertEqual('256,257');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6100
     * @tc.name testUint16ArrayToString061
      * @tc.desc Verify toString respects a nonzero ArrayBuffer view offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const full: Uint16Array = new Uint16Array(buf);
      full[0] = 10;
      full[1] = 20;
      full[2] = 30;
      const view: Uint16Array = new Uint16Array(buf, 2);
      const result: string = view.toString();
      expect(result).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6200
     * @tc.name testUint16ArrayToString062
      * @tc.desc Verify toString respects an ArrayBuffer view length limit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const full: Uint16Array = new Uint16Array(buf);
      full[0] = 100;
      full[1] = 200;
      full[2] = 300;
      full[3] = 400;
      const view: Uint16Array = new Uint16Array(buf, 2, 2);
      const result: string = view.toString();
      expect(result).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6300
     * @tc.name testUint16ArrayToString063
      * @tc.desc Verify serialization is restricted to a subarray range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 2, 3, 4);
      const sub: Uint16Array = arr.subarray(1, 4);
      const result: string = sub.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6400
     * @tc.name testUint16ArrayToString064
      * @tc.desc Verify toString formats the selected slice range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      const sliced: Uint16Array = arr.slice(1, 3);
      const result: string = sliced.toString();
      expect(result).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6500
     * @tc.name testUint16ArrayToString065
      * @tc.desc Verify toString formats a full copy returned by slice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15);
      const sliced: Uint16Array = arr.slice();
      expect(sliced.toString()).assertEqual('5,10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6600
     * @tc.name testUint16ArrayToString066
      * @tc.desc Verify toString observes data written through an ArrayBuffer alias
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Uint16Array = new Uint16Array(buf);
      const view2: Uint16Array = new Uint16Array(buf);
      view1[0] = 12345;
      const result: string = view2.toString();
      expect(result).assertEqual('12345,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6700
     * @tc.name testUint16ArrayToString067
      * @tc.desc Verify toString observes a mutation through an offset buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const full: Uint16Array = new Uint16Array(buf);
      full[0] = 1;
      full[1] = 2;
      full[2] = 3;
      const sub: Uint16Array = new Uint16Array(buf, 2, 2);
      sub[0] = 99;
      const result: string = full.toString();
      expect(result).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6800
     * @tc.name testUint16ArrayToString068
      * @tc.desc Verify serialization observes a mutation through a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      const sub: Uint16Array = arr.subarray(1, 3);
      sub[0] = 77;
      const result: string = arr.toString();
      expect(result).assertEqual('10,77,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_6900
     * @tc.name testUint16ArrayToString069
      * @tc.desc Verify serialization preserves ten sequential thousand-step values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(10);
      for (let i: int = 0; i < 10; i++) {
        arr[i] = i * 1000;
      }
      const result: string = arr.toString();
      expect(result).assertEqual('0,1000,2000,3000,4000,5000,6000,7000,8000,9000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7000
     * @tc.name testUint16ArrayToString070
      * @tc.desc Verify serialization includes all twenty filled elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(20);
      arr.fill(42);
      const result: string = arr.toString();
      expect(result).assertEqual('42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7100
     * @tc.name testUint16ArrayToString071
     * @tc.desc Verify toString returns one decimal token for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(65535);
      expect(a.toString()).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7200
     * @tc.name testUint16ArrayToString072
     * @tc.desc Verify toString preserves zeros between nonzero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(7, 0, 70, 0, 700);
      expect(a.toString()).assertEqual('7,0,70,0,700');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7300
     * @tc.name testUint16ArrayToString073
     * @tc.desc Verify toString reflects Uint16 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array([-1, 65536, 65537, 3.9]);
      expect(a.toString()).assertEqual('65535,0,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7400
     * @tc.name testUint16ArrayToString074
     * @tc.desc Verify toString formats only a nonzero view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(10);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(90, 10, 20, 30, 80));
       const v: Uint16Array = new Uint16Array(b, 2, 3);
      expect(v.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7500
     * @tc.name testUint16ArrayToString075
     * @tc.desc Verify toString observes a direct element mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       a[1] = 22;
      expect(a.toString()).assertEqual('1,22,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7600
     * @tc.name testUint16ArrayToString076
     * @tc.desc Verify toString observes a shared-buffer mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(6);
       const a: Uint16Array = new Uint16Array(b);
       const alias: Uint16Array = new Uint16Array(b, 2, 1);
       a.set(Uint16Array.of(4, 5, 6));
       alias[0] = 55;
      expect(a.toString()).assertEqual('4,55,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7700
     * @tc.name testUint16ArrayToString077
     * @tc.desc Verify toString includes every repeated entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(9, 9, 9, 9);
      expect(a.toString()).assertEqual('9,9,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7800
     * @tc.name testUint16ArrayToString078
     * @tc.desc Verify toString formats a shared subarray visible range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
       const v: Uint16Array = a.subarray(1, 4);
      expect(v.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOSTRING_7900
     * @tc.name testUint16ArrayToString079
     * @tc.desc Verify toString formats midpoint boundaries exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(32767, 32768, 65535);
      expect(a.toString()).assertEqual('32767,32768,65535');
    });

  });
}
