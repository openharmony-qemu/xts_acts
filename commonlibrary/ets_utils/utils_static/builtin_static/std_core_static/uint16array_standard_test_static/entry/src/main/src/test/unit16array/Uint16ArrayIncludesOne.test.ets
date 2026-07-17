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

export default function uint16ArrayIncludes01Test(): void {
  describe('Uint16ArrayIncludes01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0001
     * @tc.name testUint16ArrayIncludesOne001
     * @tc.desc Verify includes searchElement fromIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0002
     * @tc.name testUint16ArrayIncludesOne002
     * @tc.desc Verify searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0003
     * @tc.name testUint16ArrayIncludesOne003
     * @tc.desc Verify searchElement 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0004
     * @tc.name testUint16ArrayIncludesOne004
     * @tc.desc Verify searchElement 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0xFFFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0005
     * @tc.name testUint16ArrayIncludesOne005
     * @tc.desc Verify searchElement 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x8000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0006
     * @tc.name testUint16ArrayIncludesOne006
     * @tc.desc Verify searchElement 0x2710 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x2710);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0007
     * @tc.name testUint16ArrayIncludesOne007
     * @tc.desc Verify searchElement 0b0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0b0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0008
     * @tc.name testUint16ArrayIncludesOne008
     * @tc.desc Verify searchElement 0b1111111111111111 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0b1111111111111111);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0009
     * @tc.name testUint16ArrayIncludesOne009
     * @tc.desc Verify searchElement 0o0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0o0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0010
     * @tc.name testUint16ArrayIncludesOne010
     * @tc.desc Verify searchElement 0o177777 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0o177777);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0011
     * @tc.name testUint16ArrayIncludesOne011
     * @tc.desc Verify searchElement 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1e4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0012
     * @tc.name testUint16ArrayIncludesOne012
     * @tc.desc Verify searchElement 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0013
     * @tc.name testUint16ArrayIncludesOne013
     * @tc.desc Verify searchElement 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0014
     * @tc.name testUint16ArrayIncludesOne014
     * @tc.desc Verify searchElement 65534 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(65534);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0015
     * @tc.name testUint16ArrayIncludesOne015
     * @tc.desc Verify searchElement 32769 32769
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(32769);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0016
     * @tc.name testUint16ArrayIncludesOne016
     * @tc.desc Verify searchElement 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0017
     * @tc.name testUint16ArrayIncludesOne017
     * @tc.desc Verify searchElement 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(65535.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0018
     * @tc.name testUint16ArrayIncludesOne018
     * @tc.desc Verify searchElement 0x10001 65537
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x10001);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0019
     * @tc.name testUint16ArrayIncludesOne019
     * @tc.desc Verify searchElement 1e5 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1e5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0020
     * @tc.name testUint16ArrayIncludesOne020
     * @tc.desc Verify searchElement NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0021
     * @tc.name testUint16ArrayIncludesOne021
     * @tc.desc Verify searchElement Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0022
     * @tc.name testUint16ArrayIncludesOne022
     * @tc.desc Verify searchElement -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0023
     * @tc.name testUint16ArrayIncludesOne023
     * @tc.desc Verify searchElement 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(9007199254740991);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0024
     * @tc.name testUint16ArrayIncludesOne024
     * @tc.desc Verify searchElement 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(5e-324);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0025
     * @tc.name testUint16ArrayIncludesOne025
     * @tc.desc Verify searchElement -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0026
     * @tc.name testUint16ArrayIncludesOne026
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0027
     * @tc.name testUint16ArrayIncludesOne027
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(99, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0028
     * @tc.name testUint16ArrayIncludesOne028
     * @tc.desc Verify fromIndex 1 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0029
     * @tc.name testUint16ArrayIncludesOne029
     * @tc.desc Verify fromIndex 1 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(20, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0030
     * @tc.name testUint16ArrayIncludesOne030
     * @tc.desc Verify fromIndex 2 2 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0031
     * @tc.name testUint16ArrayIncludesOne031
     * @tc.desc Verify fromIndex 3 3 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0032
     * @tc.name testUint16ArrayIncludesOne032
     * @tc.desc Verify fromIndex 4 4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0033
     * @tc.name testUint16ArrayIncludesOne033
     * @tc.desc Verify fromIndex -1 4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0034
     * @tc.name testUint16ArrayIncludesOne034
     * @tc.desc Verify fromIndex -2 3 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(40, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0035
     * @tc.name testUint16ArrayIncludesOne035
     * @tc.desc Verify fromIndex -3 2 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0036
     * @tc.name testUint16ArrayIncludesOne036
     * @tc.desc Verify fromIndex -5 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0037
     * @tc.name testUint16ArrayIncludesOne037
     * @tc.desc Verify fromIndex -1 40 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(40, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0038
     * @tc.name testUint16ArrayIncludesOne038
     * @tc.desc Verify fromIndex -2 3 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0039
     * @tc.name testUint16ArrayIncludesOne039
     * @tc.desc Verify fromIndex -4 1 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0040
     * @tc.name testUint16ArrayIncludesOne040
     * @tc.desc Verify fromIndex -4 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(20, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0041
     * @tc.name testUint16ArrayIncludesOne041
     * @tc.desc Verify fromIndex -3 2 10 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0042
     * @tc.name testUint16ArrayIncludesOne042
     * @tc.desc Verify fromIndex -2 3 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0043
     * @tc.name testUint16ArrayIncludesOne043
     * @tc.desc Verify fromIndex -1 4 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0044
     * @tc.name testUint16ArrayIncludesOne044
     * @tc.desc Verify fromIndex 5 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0045
     * @tc.name testUint16ArrayIncludesOne045
     * @tc.desc Verify fromIndex 6 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0046
     * @tc.name testUint16ArrayIncludesOne046
     * @tc.desc Verify fromIndex 100 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0047
     * @tc.name testUint16ArrayIncludesOne047
     * @tc.desc Verify fromIndex -10 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0048
     * @tc.name testUint16ArrayIncludesOne048
     * @tc.desc Verify fromIndex -100 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0049
     * @tc.name testUint16ArrayIncludesOne049
     * @tc.desc Verify fromIndex -6 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0050
     * @tc.name testUint16ArrayIncludesOne050
     * @tc.desc Verify fromIndex -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0051
     * @tc.name testUint16ArrayIncludesOne051
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const empty = new Uint16Array();
      const result = empty.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0052
     * @tc.name testUint16ArrayIncludesOne052
     * @tc.desc Verify includes fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const empty = new Uint16Array();
      const result = empty.includes(0, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0053
     * @tc.name testUint16ArrayIncludesOne053
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const single = Uint16Array.of(42);
      const result = single.includes(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0054
     * @tc.name testUint16ArrayIncludesOne054
     * @tc.desc Verify false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const single = Uint16Array.of(42);
      const result = single.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0055
     * @tc.name testUint16ArrayIncludesOne055
     * @tc.desc Verify 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0056
     * @tc.name testUint16ArrayIncludesOne056
     * @tc.desc Verify 0 1 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0057
     * @tc.name testUint16ArrayIncludesOne057
     * @tc.desc Verify 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0058
     * @tc.name testUint16ArrayIncludesOne058
     * @tc.desc Verify [0, 65535] 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0059
     * @tc.name testUint16ArrayIncludesOne059
     * @tc.desc Verify [0, 65535] 65535 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0060
     * @tc.name testUint16ArrayIncludesOne060
     * @tc.desc Verify 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0061
     * @tc.name testUint16ArrayIncludesOne061
     * @tc.desc Verify 1 65535 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0062
     * @tc.name testUint16ArrayIncludesOne062
     * @tc.desc Verify 2 65535 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0063
     * @tc.name testUint16ArrayIncludesOne063
     * @tc.desc Verify 1 0 1 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0064
     * @tc.name testUint16ArrayIncludesOne064
     * @tc.desc Verify 0x7FFF 32767 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result = arr.includes(0x7FFF);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0065
     * @tc.name testUint16ArrayIncludesOne065
     * @tc.desc Verify fromIndex 1.5 treated as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, Double.toInt(1.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0066
     * @tc.name testUint16ArrayIncludesOne066
     * @tc.desc Verify fromIndex NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(10, Double.toInt(Number.NaN));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0067
     * @tc.name testUint16ArrayIncludesOne067
     * @tc.desc Verify fromIndex Infinity treated as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0068
     * @tc.name testUint16ArrayIncludesOne068
     * @tc.desc Verify fromIndex using arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, arr.length - 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0069
     * @tc.name testUint16ArrayIncludesOne069
     * @tc.desc Verify fromIndex using arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, arr.byteLength / 2 - 1);
      expect(arr.includes(30, arr.byteLength / 2 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0070
     * @tc.name testUint16ArrayIncludesOne070
     * @tc.desc Verify fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, 0o1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_ONE_0071
     * @tc.name testUint16ArrayIncludesOne071
     * @tc.desc Verify fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result = arr.includes(30, 0b10);
      expect(result).assertTrue();
    });
  });
}
