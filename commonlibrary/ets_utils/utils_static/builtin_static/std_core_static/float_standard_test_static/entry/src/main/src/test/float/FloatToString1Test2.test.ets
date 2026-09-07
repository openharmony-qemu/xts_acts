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

export default function FloatToString1Test2(): void {
  describe('FloatToString1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0100
     * @tc.name testFloatToString001
     * @tc.desc Verify Float.toString(-255.0f, 2) returns '-11111111'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-255.0f, 2);
      expect(result).assertEqual('-11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0200
     * @tc.name testFloatToString002
     * @tc.desc Verify Float.toString(-512.0f, 8) returns '-1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-512.0f, 8);
      expect(result).assertEqual('-1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0300
     * @tc.name testFloatToString003
     * @tc.desc Verify Float.toString(10.0f, 16) returns 'a'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(10.0f, 16);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0400
     * @tc.name testFloatToString004
     * @tc.desc Verify Float.toString(-4096.0f, 16) returns '-1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-4096.0f, 16);
      expect(result).assertEqual('-1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0500
     * @tc.name testFloatToString005
     * @tc.desc Verify Float.toString(-3.5f, 10) returns '-3.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-3.5f, 10);
      expect(result).assertEqual('-3.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0600
     * @tc.name testFloatToString006
     * @tc.desc Verify Float.toString(0.0f, 9) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(0.0f, 3)).assertEqual('0');
      expect(Float.toString(0.0f, 4)).assertEqual('0');
      expect(Float.toString(0.0f, 5)).assertEqual('0');
      expect(Float.toString(0.0f, 6)).assertEqual('0');
      expect(Float.toString(0.0f, 7)).assertEqual('0');
      expect(Float.toString(0.0f, 8)).assertEqual('0');
      expect(Float.toString(0.0f, 9)).assertEqual('0');
      expect(Float.toString(0.0f, 10)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0700
     * @tc.name testFloatToString007
     * @tc.desc Verify Float.toString(v, r)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 255.0f;
      const r: int = 16;
      expect(Float.toString(v, r)).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0800
     * @tc.name testFloatToString008
     * @tc.desc Verify Float.toString(1024.0f, 2) returns '10000000000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 1024.0f;
      expect(Float.toString(v, 2)).assertEqual('10000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_0900
     * @tc.name testFloatToString009
     * @tc.desc Verify Float.toString(512.0f, 8) returns '1000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 512.0f;
      expect(Float.toString(v, 8)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1000
     * @tc.name testFloatToString010
     * @tc.desc Verify Float.toString(1.0e10f, 10) returns '10000000000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1.0e10f, 10);
      expect(result).assertEqual('10000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1100
     * @tc.name testFloatToString011
     * @tc.desc Verify Float.toString(0.0f, r) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let r: int = 2; r <= 36; r++) {
        expect(Float.toString(0.0f, r)).assertEqual('0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1200
     * @tc.name testFloatToString012
     * @tc.desc Verify Float.toString(-0.0f, 2) returns '0' equaling '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.0f, 2)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1300
     * @tc.name testFloatToString013
     * @tc.desc Verify Float.toString(-0.0f, 8) returns '0' equaling '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.0f, 8)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1400
     * @tc.name testFloatToString014
     * @tc.desc Verify Float.toString(-0.0f, 10) returns '0' equaling '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.0f, 10)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1500
     * @tc.name testFloatToString015
     * @tc.desc Verify Float.toString(-0.0f, 16) returns '0' equaling '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.0f, 16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1600
     * @tc.name testFloatToString016
     * @tc.desc Verify Float.toString(-0.0f, 36) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.0f, 36)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1700
     * @tc.name testFloatToString017
     * @tc.desc Verify Float.toString(Float.NaN, 2) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 2)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1800
     * @tc.name testFloatToString018
     * @tc.desc Verify Float.toString(Float.NaN, 8) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 8)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_1900
     * @tc.name testFloatToString019
     * @tc.desc Verify Float.toString(Float.NaN, 10) returns 'NaN' equaling 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 10)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2000
     * @tc.name testFloatToString020
     * @tc.desc Verify Float.toString(Float.NaN, 16) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 16)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2100
     * @tc.name testFloatToString021
     * @tc.desc Verify Float.toString(Float.NaN, 36) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 36)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2200
     * @tc.name testFloatToString022
     * @tc.desc Verify Float.toString(Float.POSITIVE_INFINITY, 3) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.POSITIVE_INFINITY, 3)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2300
     * @tc.name testFloatToString023
     * @tc.desc Verify Float.toString(Float.POSITIVE_INFINITY, 16) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.POSITIVE_INFINITY, 16)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2400
     * @tc.name testFloatToString024
     * @tc.desc Verify Float.toString(Float.POSITIVE_INFINITY, 36) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.POSITIVE_INFINITY, 36)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2500
     * @tc.name testFloatToString025
     * @tc.desc Verify Float.toString(Float.NEGATIVE_INFINITY, 3) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NEGATIVE_INFINITY, 3)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2600
     * @tc.name testFloatToString026
     * @tc.desc Verify Float.toString(Float.NEGATIVE_INFINITY, 16) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NEGATIVE_INFINITY, 16)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2700
     * @tc.name testFloatToString027
     * @tc.desc Verify Float.toString(Float.NEGATIVE_INFINITY, 36) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NEGATIVE_INFINITY, 36)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2800
     * @tc.name testFloatToString028
     * @tc.desc Verify Float.toString(Float.MAX_VALUE, 10) returns '3.4028235e+38'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE, 10);
      expect(result).assertEqual('3.4028235e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_2900
     * @tc.name testFloatToString029
     * @tc.desc Verify Float.toString(Float.MIN_VALUE, 10) returns '1e-45'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MIN_VALUE, 10);
      expect(result).assertEqual('1e-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3000
     * @tc.name testFloatToString030
     * @tc.desc Verify Float.toString converts power-of-two float values to correct binary(base 2) string representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(1.0f, 2)).assertEqual('1');
      expect(Float.toString(2.0f, 2)).assertEqual('10');
      expect(Float.toString(4.0f, 2)).assertEqual('100');
      expect(Float.toString(8.0f, 2)).assertEqual('1000');
      expect(Float.toString(16.0f, 2)).assertEqual('10000');
      expect(Float.toString(32.0f, 2)).assertEqual('100000');
      expect(Float.toString(64.0f, 2)).assertEqual('1000000');
      expect(Float.toString(128.0f, 2)).assertEqual('10000000');
      expect(Float.toString(256.0f, 2)).assertEqual('100000000');
      expect(Float.toString(512.0f, 2)).assertEqual('1000000000');
      expect(Float.toString(1024.0f, 2)).assertEqual('10000000000');
      expect(Float.toString(2048.0f, 2)).assertEqual('100000000000');
      expect(Float.toString(4096.0f, 2)).assertEqual('1000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3100
     * @tc.name testFloatToString031
     * @tc.desc Verify Float.toString converts power-of-two float values to correct hexadecimal(base 16) string representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(4096.0f, 16)).assertEqual('1000');
      expect(Float.toString(65536.0f, 16)).assertEqual('10000');
      expect(Float.toString(1048576.0f, 16)).assertEqual('100000');
      expect(Float.toString(16777216.0f, 16)).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3200
     * @tc.name testFloatToString032
     * @tc.desc Verify Float.toString converts power-of-two float values to correct octal(base 8) string representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(512.0f, 8)).assertEqual('1000');
      expect(Float.toString(4096.0f, 8)).assertEqual('10000');
      expect(Float.toString(32768.0f, 8)).assertEqual('100000');
      expect(Float.toString(262144.0f, 8)).assertEqual('1000000');
      expect(Float.toString(2097152.0f, 8)).assertEqual('10000000');
      expect(Float.toString(16777216.0f, 8)).assertEqual('100000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3300
     * @tc.name testFloatToString033
     * @tc.desc Verify Float.toString(Float.POSITIVE_INFINITY, 10) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.POSITIVE_INFINITY, 10);
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3400
     * @tc.name testFloatToString034
     * @tc.desc Verify Float.toString(Float.NEGATIVE_INFINITY, 10) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NEGATIVE_INFINITY, 10);
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3500
     * @tc.name testFloatToString035
     * @tc.desc Verify Float.toString(0.1f, 10) returns '0.1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(0.1f, 10)).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3600
     * @tc.name testFloatToString036
     * @tc.desc Verify Float.toString(-0.1f, 10) returns '-0.1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-0.1f, 10)).assertEqual('-0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3700
     * @tc.name testFloatToString037
     * @tc.desc Verify Float.toString(42.0f, 2) returns '101010'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(42.0f, 2);
      expect(result).assertEqual('101010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3800
     * @tc.name testFloatToString038
     * @tc.desc Verify Float.toString(-100.0f, 10) returns '-100'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-100.0f, 10);
      expect(result).assertEqual('-100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_3900
     * @tc.name testFloatToString039
     * @tc.desc Verify Float.toString(100.0f, 36) returns '2s'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(100.0f, 36);
      expect(result).assertEqual('2s');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4000
     * @tc.name testFloatToString040
     * @tc.desc Verify Float.toString(Float.MAX_VALUE, 2) returns binary representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE, 2);
      expect(result).assertEqual('11111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4100
     * @tc.name testFloatToString041
     * @tc.desc Verify Float.toString(Float.MAX_VALUE, 16) returns hex representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE, 16);
      expect(result).assertEqual('ffffff00000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4200
     * @tc.name testFloatToString042
     * @tc.desc Verify Float.toString(Float.MIN_VALUE, 2) returns binary representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MIN_VALUE, 2);
      expect(result).assertContain('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4300
     * @tc.name testFloatToString043
     * @tc.desc Verify Float.toString(-Float.MAX_VALUE, 10) returns negative scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MAX_VALUE, 10);
      expect(result).assertContain('-3.4028235e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4400
     * @tc.name testFloatToString044
     * @tc.desc Verify Float.toString(-Float.MAX_VALUE, 2) returns negative binary representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MAX_VALUE, 2);
      expect(result).assertEqual('-11111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4500
     * @tc.name testFloatToString045
     * @tc.desc Verify Float.toString(Float.MAX_SAFE_INTEGER, 2) returns binary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_SAFE_INTEGER, 2);
      expect(result).assertEqual('111111111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4600
     * @tc.name testFloatToString046
     * @tc.desc Verify Float.toString(Float.MAX_SAFE_INTEGER, 10) returns decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_SAFE_INTEGER, 10);
      expect(result).assertEqual('16777215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4700
     * @tc.name testFloatToString047
     * @tc.desc Verify Float.toString(Float.MAX_SAFE_INTEGER, 16) returns hex
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_SAFE_INTEGER, 16);
      expect(result).assertContain('ffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4800
     * @tc.name testFloatToString048
     * @tc.desc Verify Float.toString(1000000.0f, 36) returns max-radix with large value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1000000.0f, 36);
      expect(result).assertContain('l');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_4900
     * @tc.name testFloatToString049
     * @tc.desc Verify Float.toString(Float.NaN, 3) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 3)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5000
     * @tc.name testFloatToString050
     * @tc.desc Verify Float.toString(Float.NaN, 4) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 4)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5100
     * @tc.name testFloatToString051
     * @tc.desc Verify Float.toString(Float.POSITIVE_INFINITY, 2) returns 'Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.POSITIVE_INFINITY, 2)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5200
     * @tc.name testFloatToString052
     * @tc.desc Verify Float.toString(Float.NEGATIVE_INFINITY, 2) returns '-Infinity'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NEGATIVE_INFINITY, 2)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5300
     * @tc.name testFloatToString053
     * @tc.desc Verify Float.toString(Float.NaN, 5) returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(Float.NaN, 5)).assertEqual('NaN');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5400
     * @tc.name testFloatToString054
     * @tc.desc Verify Float.toString(42.0f, 1) throws RangeError for invalid radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toString(42.0f, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5500
     * @tc.name testFloatToString055
     * @tc.desc Verify Float.toString(42.0f, 37) throws RangeError for invalid radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float.toString(42.0f, 37);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5600
     * @tc.name testFloatToString056
     * @tc.desc Verify Float.toString(3.5f, 2) handles non-integer float with non-decimal radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(3.5f, 2);
      expect(result).assertContain('11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5700
     * @tc.name testFloatToString057
     * @tc.desc Verify Float.toString converts float value to string representation under multiple different radix, include 42.0f for radix 12-15 and 100.0f for radix 17-35
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(42.0f, 12)).assertEqual('36');
      expect(Float.toString(42.0f, 13)).assertEqual('33');
      expect(Float.toString(42.0f, 14)).assertEqual('30');
      expect(Float.toString(42.0f, 15)).assertEqual('2c');
      expect(Float.toString(100.0f, 17)).assertEqual('5f');
      expect(Float.toString(100.0f, 18)).assertEqual('5a');
      expect(Float.toString(100.0f, 19)).assertEqual('55');
      expect(Float.toString(100.0f, 20)).assertEqual('50');
      expect(Float.toString(100.0f, 21)).assertEqual('4g');
      expect(Float.toString(100.0f, 22)).assertEqual('4c');
      expect(Float.toString(100.0f, 23)).assertEqual('48');
      expect(Float.toString(100.0f, 24)).assertEqual('44');
      expect(Float.toString(100.0f, 25)).assertEqual('40');
      expect(Float.toString(100.0f, 26)).assertEqual('3m');
      expect(Float.toString(100.0f, 27)).assertEqual('3j');
      expect(Float.toString(100.0f, 28)).assertEqual('3g');
      expect(Float.toString(100.0f, 29)).assertEqual('3d');
      expect(Float.toString(100.0f, 30)).assertEqual('3a');
      expect(Float.toString(100.0f, 31)).assertEqual('37');
      expect(Float.toString(100.0f, 32)).assertEqual('34');
      expect(Float.toString(100.0f, 33)).assertEqual('31');
      expect(Float.toString(100.0f, 34)).assertEqual('2w');
      expect(Float.toString(100.0f, 35)).assertEqual('2u');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5800
     * @tc.name testFloatToString058
     * @tc.desc Verify Float.toString(1.0f, 10) returns '1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(1.0f, 10)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_5900
     * @tc.name testFloatToString059
     * @tc.desc Verify Float.toString(-1.0f, 10) returns '-1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-1.0f, 10)).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6000
     * @tc.name testFloatToString060
     * @tc.desc Verify Float.toString(3.14f, 10) returns '3.14'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(3.14f, 10)).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6100
     * @tc.name testFloatToString061
     * @tc.desc Verify Float.toString(-3.14f, 10) returns '-3.14'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(-3.14f, 10)).assertEqual('-3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6200
     * @tc.name testFloatToString062
     * @tc.desc Verify Float.toString(100.0f, 2) returns '1100100'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toString(100.0f, 2)).assertEqual('1100100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6300
     * @tc.name testFloatToString063
     * @tc.desc Verify Float.toString(3.14f, 2147483647) throws ArgumentOutOfRangeError for int max radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = 2147483647;
      try {
        Float.toString(3.14f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6400
     * @tc.name testFloatToString064
     * @tc.desc Verify Float.toString(3.14f, 2147483646) throws ArgumentOutOfRangeError for int max minus one radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = 2147483646;
      try {
        Float.toString(3.14f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6500
     * @tc.name testFloatToString065
     * @tc.desc Verify Float.toString(-255.0f, 0x7FFFFFFF) throws ArgumentOutOfRangeError for hex int max radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = 0x7FFFFFFF;
      try {
        Float.toString(-255.0f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6600
     * @tc.name testFloatToString066
     * @tc.desc Verify Float.toString(-3.5f, -2147483648) throws ArgumentOutOfRangeError for int min radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = -2147483648;
      try {
        Float.toString(-3.5f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6700
     * @tc.name testFloatToString067
     * @tc.desc Verify Float.toString(-3.5f, -2147483647) throws ArgumentOutOfRangeError for negative radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = -2147483647;
      try {
        Float.toString(-3.5f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6800
     * @tc.name testFloatToString068
     * @tc.desc Verify Float.toString(8.0f, 32767) throws ArgumentOutOfRangeError for short max radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: short = 32767 as short;
      try {
        Float.toString(8.0f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_6900
     * @tc.name testFloatToString069
     * @tc.desc Verify Float.toString(8.0f, -32768) throws ArgumentOutOfRangeError for short min radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: short = -32768 as short;
      try {
        Float.toString(8.0f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7000
     * @tc.name testFloatToString070
     * @tc.desc Verify Float.toString(10.0f, 127) throws ArgumentOutOfRangeError for byte max radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: byte = 127 as byte;
      try {
        Float.toString(10.0f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7100
     * @tc.name testFloatToString071
     * @tc.desc Verify Float.toString(10.0f, -128) throws ArgumentOutOfRangeError for byte min radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: byte = -128 as byte;
      try {
        Float.toString(10.0f, r);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7200
     * @tc.name testFloatToString072
     * @tc.desc Verify Float.toString(65535.0f, 0x10) returns 'ffff' for hex radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(65535.0f, 0x10);
      expect(result).assertEqual('ffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7300
     * @tc.name testFloatToString073
     * @tc.desc Verify Float.toString(8.0f, 0o10) returns '10' for octal radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(8.0f, 0o10);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7400
     * @tc.name testFloatToString074
     * @tc.desc Verify Float.toString(10.0f, 0b1010) returns '10' for binary radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(10.0f, 0b1010);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7500
     * @tc.name testFloatToString075
     * @tc.desc Verify Float.toString(3.14f, '' as Object as int) throws ClassCastError for string radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '';
      try {
        Float.toString(3.14f, s as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7600
     * @tc.name testFloatToString076
     * @tc.desc Verify Float.toString(-255.0f, true as Object as int) throws ClassCastError for boolean radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: boolean = true;
      try {
        Float.toString(-255.0f, b as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART1_7700
     * @tc.name testFloatToString077
     * @tc.desc Verify Float.toString(8.0f, new Object() as Object as int) throws ClassCastError for object radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      try {
        Float.toString(8.0f, obj as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

  });
}
