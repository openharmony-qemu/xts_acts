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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function IntToString2Test(): void {
  describe('IntToString2Test', (): void => {
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
     * @tc.number INT_TO_STRNG_R_CHK_0100
     * @tc.name testIntToString20001
     * @tc.desc Verify that radix parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toString(10);
      expect(result).assertEqual("65");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0200
     * @tc.name testIntToString20002
     * @tc.desc Verify toString with radix 2 returns binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toString(2);
      expect(result).assertEqual("1000001");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0300
     * @tc.name testIntToString20003
     * @tc.desc Verify toString with radix 10 returns decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toString(10)).assertEqual("65");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0400
     * @tc.name testIntToString20004
     * @tc.desc Verify conversion to binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      expect(a.toString(2)).assertEqual("1010");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0500
     * @tc.name testIntToString20005
     * @tc.desc Verify binary representation of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toString(2)).assertEqual("0");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0600
     * @tc.name testIntToString20006
     * @tc.desc Verify binary representation of one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toString(2)).assertEqual("1");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0700
     * @tc.name testIntToString20007
     * @tc.desc Verify binary representation of large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(a.toString(2)).assertEqual("11111111");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0800
     * @tc.name testIntToString20008
     * @tc.desc Verify binary representation of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-10);
      const result = a.toString(2);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0900
     * @tc.name testIntToString20009
     * @tc.desc Verify conversion to octal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toString(8)).assertEqual("101");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1000
     * @tc.name testIntToString20010
     * @tc.desc Verify octal representation of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toString(8)).assertEqual("0");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1100
     * @tc.name testIntToString20011
     * @tc.desc Verify octal representation of seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7);
      expect(a.toString(8)).assertEqual("7");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1200
     * @tc.name testIntToString20012
     * @tc.desc Verify octal representation of eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8);
      expect(a.toString(8)).assertEqual("10");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1300
     * @tc.name testIntToString20013
     * @tc.desc Verify octal representation of sixty-four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(64);
      expect(a.toString(8)).assertEqual("100");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1400
     * @tc.name testIntToString20014
     * @tc.desc Verify octal representation of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65);
      const result = a.toString(8);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1600
     * @tc.name testIntToString20016
     * @tc.desc Verify decimal representation of large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      expect(a.toString(10)).assertEqual("12345");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1700
     * @tc.name testIntToString20017
     * @tc.desc Verify decimal representation of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-123);
      expect(a.toString(10)).assertEqual("-123");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1800
     * @tc.name testIntToString20018
     * @tc.desc Verify conversion to hexadecimal string in lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(a.toString(16)).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_1900
     * @tc.name testIntToString20019
     * @tc.desc Verify hexadecimal representation of ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      expect(a.toString(16)).assertEqual("a");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2000
     * @tc.name testIntToString20020
     * @tc.desc Verify hexadecimal representation of fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(15);
      expect(a.toString(16)).assertEqual("f");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2100
     * @tc.name testIntToString20021
     * @tc.desc Verify hexadecimal representation of sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16);
      expect(a.toString(16)).assertEqual("10");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2200
     * @tc.name testIntToString20022
     * @tc.desc Verify hexadecimal representation of 0x41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toString(16)).assertEqual("41");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2300
     * @tc.name testIntToString20023
     * @tc.desc Verify hexadecimal representation of large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(4095);
      expect(a.toString(16)).assertEqual("fff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2400
     * @tc.name testIntToString20024
     * @tc.desc Verify hexadecimal representation of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-255);
      const result = a.toString(16);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2500
     * @tc.name testIntToString20025
     * @tc.desc Verify conversion to base36 string as maximum radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(35);
      expect(a.toString(36)).assertEqual("z");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2600
     * @tc.name testIntToString20026
     * @tc.desc Verify base36 representation of ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      expect(a.toString(36)).assertEqual("a");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2800
     * @tc.name testIntToString20028
     * @tc.desc Verify base36 representation of thirty-six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(36);
      expect(a.toString(36)).assertEqual("10");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_2900
     * @tc.name testIntToString20029
     * @tc.desc Verify base36 representation of large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toString(36);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3000
     * @tc.name testIntToString20030
     * @tc.desc Verify ternary conversion with radix 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.toString(3);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3100
     * @tc.name testIntToString20031
     * @tc.desc Verify quaternary conversion with radix 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      expect(a.toString(4)).assertEqual("22");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3200
     * @tc.name testIntToString20032
     * @tc.desc Verify quinary conversion with radix 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      expect(a.toString(5)).assertEqual("20");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3300
     * @tc.name testIntToString20033
     * @tc.desc Verify nonary conversion with radix 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(81);
      expect(a.toString(9)).assertEqual("100");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3400
     * @tc.name testIntToString20034
     * @tc.desc Verify base32 conversion with radix 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(32);
      expect(a.toString(32)).assertEqual("10");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3500
     * @tc.name testIntToString20035
     * @tc.desc Verify minimum valid radix 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(4);
      expect(a.toString(2)).assertEqual("100");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3700
     * @tc.name testIntToString20037
     * @tc.desc Verify invalid radix zero returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const a = new Int(65);
        const result = a.toString(0);
        expect(result.length > 0).assertTrue();
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3800
     * @tc.name testIntToString20038
     * @tc.desc Verify invalid radix one returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const a = new Int(65);
        const result = a.toString(1);
        expect(result.length > 0).assertTrue();
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_3900
     * @tc.name testIntToString20039
     * @tc.desc Verify invalid radix thirty-seven returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const a = new Int(65);
        const result = a.toString(37);
        expect(result.length > 0).assertTrue();
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4000
     * @tc.name testIntToString20040
     * @tc.desc Verify negative radix returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const a = new Int(65);
        const result = a.toString(-10);
        expect(result.length > 0).assertTrue();
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4500
     * @tc.name testIntToString20045
     * @tc.desc Verify return string in specified radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const result = a.toString(16);
      expect(result).assertEqual("ff");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4600
     * @tc.name testIntToString20046
     * @tc.desc Verify return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toString(2);
      expect(typeof result).assertEqual("string");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4700
     * @tc.name testIntToString20047
     * @tc.desc Verify binary conversion of powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(1).toString(2)).assertEqual("1");
      expect(new Int(2).toString(2)).assertEqual("10");
      expect(new Int(4).toString(2)).assertEqual("100");
      expect(new Int(8).toString(2)).assertEqual("1000");
      expect(new Int(16).toString(2)).assertEqual("10000");
      expect(new Int(32).toString(2)).assertEqual("100000");
      expect(new Int(64).toString(2)).assertEqual("1000000");
      expect(new Int(128).toString(2)).assertEqual("10000000");
      expect(new Int(256).toString(2)).assertEqual("100000000");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4800
     * @tc.name testIntToString20048
     * @tc.desc Verify binary conversion of all-ones values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(1).toString(2)).assertEqual("1");
      expect(new Int(3).toString(2)).assertEqual("11");
      expect(new Int(7).toString(2)).assertEqual("111");
      expect(new Int(15).toString(2)).assertEqual("1111");
      expect(new Int(31).toString(2)).assertEqual("11111");
      expect(new Int(63).toString(2)).assertEqual("111111");
      expect(new Int(127).toString(2)).assertEqual("1111111");
      expect(new Int(255).toString(2)).assertEqual("11111111");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_4900
     * @tc.name testIntToString20049
     * @tc.desc Verify octal conversion of powers of eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(1).toString(8)).assertEqual("1");
      expect(new Int(8).toString(8)).assertEqual("10");
      expect(new Int(64).toString(8)).assertEqual("100");
      expect(new Int(512).toString(8)).assertEqual("1000");
      expect(new Int(4096).toString(8)).assertEqual("10000");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5000
     * @tc.name testIntToString20050
     * @tc.desc Verify decimal conversion of powers of ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(1).toString(10)).assertEqual("1");
      expect(new Int(10).toString(10)).assertEqual("10");
      expect(new Int(100).toString(10)).assertEqual("100");
      expect(new Int(1000).toString(10)).assertEqual("1000");
      expect(new Int(10000).toString(10)).assertEqual("10000");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5100
     * @tc.name testIntToString20051
     * @tc.desc Verify hexadecimal conversion of powers of sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(1).toString(16)).assertEqual("1");
      expect(new Int(16).toString(16)).assertEqual("10");
      expect(new Int(256).toString(16)).assertEqual("100");
      expect(new Int(4096).toString(16)).assertEqual("1000");
      expect(new Int(65536).toString(16)).assertEqual("10000");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5200
     * @tc.name testIntToString20052
     * @tc.desc Verify hexadecimal letter range from a to f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(10).toString(16)).assertEqual("a");
      expect(new Int(11).toString(16)).assertEqual("b");
      expect(new Int(12).toString(16)).assertEqual("c");
      expect(new Int(13).toString(16)).assertEqual("d");
      expect(new Int(14).toString(16)).assertEqual("e");
      expect(new Int(15).toString(16)).assertEqual("f");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5300
     * @tc.name testIntToString20053
     * @tc.desc Verify zero representation in various radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toString(2)).assertEqual("0");
      expect(a.toString(8)).assertEqual("0");
      expect(a.toString(10)).assertEqual("0");
      expect(a.toString(16)).assertEqual("0");
      expect(a.toString(36)).assertEqual("0");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5400
     * @tc.name testIntToString20054
     * @tc.desc Verify one representation in various radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toString(2)).assertEqual("1");
      expect(a.toString(8)).assertEqual("1");
      expect(a.toString(10)).assertEqual("1");
      expect(a.toString(16)).assertEqual("1");
      expect(a.toString(36)).assertEqual("1");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5500
     * @tc.name testIntToString20055
     * @tc.desc Verify radix base representation as string 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(2).toString(2)).assertEqual("10");
      expect(new Int(8).toString(8)).assertEqual("10");
      expect(new Int(10).toString(10)).assertEqual("10");
      expect(new Int(16).toString(16)).assertEqual("10");
      expect(new Int(36).toString(36)).assertEqual("10");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5600
     * @tc.name testIntToString20056
     * @tc.desc Verify lowercase letters for values 10 to 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(35);
      expect(a.toString(36)).assertEqual("z");
      expect(a.toString(16)).assertEqual("23");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5700
     * @tc.name testIntToString20057
     * @tc.desc Verify base36 letter mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(10).toString(36)).assertEqual("a");
      expect(new Int(11).toString(36)).assertEqual("b");
      expect(new Int(12).toString(36)).assertEqual("c");
      expect(new Int(13).toString(36)).assertEqual("d");
      expect(new Int(14).toString(36)).assertEqual("e");
      expect(new Int(15).toString(36)).assertEqual("f");
      expect(new Int(35).toString(36)).assertEqual("z");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5800
     * @tc.name testIntToString20058
     * @tc.desc Verify instance method call requirement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const result = a.toString(16);
      expect(result).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_5900
     * @tc.name testIntToString20059
     * @tc.desc Verify toString equals toString with radix 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.toString()).assertEqual(a.toString(10));
      expect(a.toString()).assertEqual("123");
      expect(a.toString(10)).assertEqual("123");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6000
     * @tc.name testIntToString20060
     * @tc.desc Verify different instance creation methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(255);
      const a2 = new Int(255);
      expect(a1.toString(16)).assertEqual("ff");
      expect(a2.toString(16)).assertEqual("ff");
      expect(a1.toString(16)).assertEqual(a2.toString(16));
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6100
     * @tc.name testIntToString20061
     * @tc.desc Verify toString radix result for string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const result = "0x" + a.toString(16);
      expect(result).assertEqual("0xff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6200
     * @tc.name testIntToString20062
     * @tc.desc Verify binary prefix concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = "0b" + a.toString(2);
      expect(result).assertEqual("0b1010");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6300
     * @tc.name testIntToString20063
     * @tc.desc Verify octal prefix concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = "0o" + a.toString(8);
      expect(result).assertEqual("0o101");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6400
     * @tc.name testIntToString20064
     * @tc.desc Verify different radix strings comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const bin = a.toString(2);
      const hex = a.toString(16);
      const dec = a.toString(10);
      expect(bin == hex).assertFalse();
      expect(hex == dec).assertFalse();
      expect(dec).assertEqual("100");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6500
     * @tc.name testIntToString20065
     * @tc.desc Verify different radix string lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(a.toString(2).length).assertEqual(8);
      expect(a.toString(8).length).assertEqual(3);
      expect(a.toString(10).length).assertEqual(3);
      expect(a.toString(16).length).assertEqual(2);
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6600
     * @tc.name testIntToString20066
     * @tc.desc Verify consistent results from multiple conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const result1 = a.toString(16);
      const result2 = a.toString(16);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6700
     * @tc.name testIntToString20067
     * @tc.desc Verify consistent results across different instances with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(255);
      const a2 = new Int(255);
      expect(a1.toString(16)).assertEqual(a2.toString(16));
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_6900
     * @tc.name testIntToString20069
     * @tc.desc Verify multiple radix conversions chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const hex = a.toString(16);
      const dec = a.toString(10);
      const bin = a.toString(2);
      expect(hex).assertEqual("ff");
      expect(dec).assertEqual("255");
      expect(bin).assertEqual("11111111");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7000
     * @tc.name testIntToString20070
     * @tc.desc Verify decimal matches original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      expect(a.toString(10)).assertEqual("12345");
      expect(a.toString(10)).assertEqual(a.toString());
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7100
     * @tc.name testIntToString20071
     * @tc.desc Verify binary output contains only 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const result = a.toString(2);
      expect(result).assertEqual("11111111");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7200
     * @tc.name testIntToString20072
     * @tc.desc Verify octal output contains only digits 0 to 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(511);
      const result = a.toString(8);
      expect(result).assertEqual("777");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7300
     * @tc.name testIntToString20073
     * @tc.desc Verify hexadecimal output contains only 0-9 and a-f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(4095);
      const result = a.toString(16);
      expect(result).assertEqual("fff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7400
     * @tc.name testIntToString20074
     * @tc.desc Verify base36 output contains only 0-9 and a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1295);
      const result = a.toString(36);
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7500
     * @tc.name testIntToString20075
     * @tc.desc Verify hex color value generation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Int(255);
      const g = new Int(128);
      const b = new Int(64);
      const color = "#" + r.toString(16).padStart(2, '0') +
                         g.toString(16).padStart(2, '0') +
                         b.toString(16).padStart(2, '0');
      expect(color).assertEqual("#ff8040");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7600
     * @tc.name testIntToString20076
     * @tc.desc Verify binary bit display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flags = new Int(13);
      const binStr = flags.toString(2);
      expect(binStr).assertEqual("1101");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7700
     * @tc.name testIntToString20077
     * @tc.desc Verify octal permission representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const permission = new Int(511);
      const octalStr = permission.toString(8);
      expect(octalStr).assertEqual("777");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7800
     * @tc.name testIntToString20078
     * @tc.desc Verify base36 compact encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id = new Int(12345);
      const encoded = id.toString(36);
      expect(encoded.length > 0).assertTrue();
      expect(encoded.length < id.toString(10).length).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_7900
     * @tc.name testIntToString20079
     * @tc.desc Verify performance of multiple toString radix calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      let result = "";
      for (let i = 0; i < 1000; i++) {
        result = a.toString(16);
      }
      expect(result).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8000
     * @tc.name testIntToString20080
     * @tc.desc Verify batch instance creation and conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      const hexValues = values.map(v => new Int(v).toString(16));
      expect(hexValues.join(",")).assertEqual(["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"].join(","));
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8100
     * @tc.name testIntToString20081
     * @tc.desc Verify documentation example output 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      console.info(a.toString(10));
      expect(a.toString(10)).assertEqual("65");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8200
     * @tc.name testIntToString20082
     * @tc.desc Verify Int MAX_VALUE radix representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      expect(max.toString(10)).assertEqual("2147483647");
      expect(max.toString(16).length > 0).assertTrue();
      expect(max.toString(8).length > 0).assertTrue();
      expect(max.toString(2).length > 0).assertTrue();
      expect(max.toString(16)).assertEqual("7fffffff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8300
     * @tc.name testIntToString20083
     * @tc.desc Verify Int MIN_VALUE radix representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      expect(min.toString(10)).assertEqual("-2147483648");
      expect(min.toString(16).length > 0).assertTrue();
      expect(min.toString(8).length > 0).assertTrue();
      expect(min.toString(2).length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8400
     * @tc.name testIntToString20084
     * @tc.desc Verify same value in different radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.toString(2)).assertEqual("1100100");
      expect(a.toString(4)).assertEqual("1210");
      expect(a.toString(8)).assertEqual("144");
      expect(a.toString(10)).assertEqual("100");
      expect(a.toString(16)).assertEqual("64");
      expect(a.toString(32)).assertEqual("34");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8500
     * @tc.name testIntToString20085
     * @tc.desc Verify radix conversion correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(parseInt(a.toString(16), 16)).assertEqual(255);

      const b = new Int(10);
      expect(parseInt(b.toString(2), 2)).assertEqual(10);

      const c = new Int(65);
      expect(parseInt(c.toString(8), 8)).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8600
     * @tc.name testIntToString20086
     * @tc.desc Verify lowercase letter output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(4095);
      const hex = a.toString(16);
      expect(hex).assertEqual("fff");
      expect(hex.indexOf("F") < 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8700
     * @tc.name testIntToString20087
     * @tc.desc Verify base36 lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1295);
      const result = a.toString(36);
      expect(result).assertEqual(result.toLowerCase());
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_8800
     * @tc.name testIntToString20088
     * @tc.desc Verify radix boundary values 2 and 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.toString(2).length > 0).assertTrue();
      expect(a.toString(36).length > 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9100
     * @tc.name testIntToString20091
     * @tc.desc Verify conversion result has no spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const hex = a.toString(16);
      expect(hex.indexOf(" ") < 0).assertTrue();
      expect(hex).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9200
     * @tc.name testIntToString20092
     * @tc.desc Verify conversion result has no radix prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(a.toString(16).indexOf("0x") < 0).assertTrue();
      expect(a.toString(8).indexOf("0o") < 0).assertTrue();
      expect(a.toString(2).indexOf("0b") < 0).assertTrue();
      expect(a.toString(16)).assertEqual("ff");
      expect(a.toString(8)).assertEqual("377");
      expect(a.toString(2)).assertEqual("11111111");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9500
     * @tc.name testIntToString20095
     * @tc.desc Verify multiple values converted to same radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      const hexStrings = values.map(v => new Int(v).toString(16));
      expect(hexStrings.join(",")).assertEqual(["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"].join(","));
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9600
     * @tc.name testIntToString20096
     * @tc.desc Verify single value converted to multiple radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      const bases = [2, 8, 10, 16, 32, 36];
      const results = bases.map(b => a.toString(b));
      expect(results[0]).assertEqual("11111111");
      expect(results[1]).assertEqual("377");
      expect(results[2]).assertEqual("255");
      expect(results[3]).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9700
     * @tc.name testIntToString20097
     * @tc.desc Verify conversion and restoration to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 12345;
      const a = new Int(original);
      const hex = a.toString(16);
      const restored = parseInt(hex, 16);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9800
     * @tc.name testIntToString20098
     * @tc.desc Verify round-trip conversion consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 255;
      const a = new Int(original);
      const hex = a.toString(16);
      const b = new Int(Double.toInt(parseInt(hex, 16)));
      expect(b.toString(16)).assertEqual(hex);
      expect(b.toString(10)).assertEqual(original.toString());
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_9900
     * @tc.name testIntToString20099
     * @tc.desc Verify common programmer radix conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(255);
      expect(a.toString(2)).assertEqual("11111111");
      expect(a.toString(8)).assertEqual("377");
      expect(a.toString(10)).assertEqual("255");
      expect(a.toString(16)).assertEqual("ff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0000
     * @tc.name testIntToString20100
     * @tc.desc Verify MAC address hex formatting scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const part1 = new Int(255);
      const part2 = new Int(128);
      const mac = part1.toString(16).padStart(2, '0') + ":" +
                  part2.toString(16).padStart(2, '0');
      expect(mac).assertEqual("ff:80");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0101
     * @tc.name testIntToString20101
     * @tc.desc Verify max value in different radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      expect(max.toString(2).length > 30).assertTrue();
      expect(max.toString(8).length > 0).assertTrue();
      expect(max.toString(10)).assertEqual("2147483647");
      expect(max.toString(16)).assertEqual("7fffffff");
    });

    /**
     * @tc.number INT_TO_STRNG_R_CHK_0201
     * @tc.name testIntToString20102
     * @tc.desc Verify 0 1 and -1 in different radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToString20102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int(0);
      const one = new Int(1);
      const minusOne = new Int(-1);
      const radices: int[] = [2, 8, 10, 16, 36];
      for (let i = 0; i < radices.length; i++) {
        expect(zero.toString(radices[i])).assertEqual("0");
        expect(one.toString(radices[i])).assertEqual("1");
        expect(minusOne.toString(radices[i]).length > 0).assertTrue();
      }
    });
  });
}
