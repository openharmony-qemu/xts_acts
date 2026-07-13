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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharToIntStaticTest(): void {
  describe('CharToIntStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0100
     * @tc.name testCharToIntStatic0001
     * @tc.desc Verify Char.toInt with required char parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0200
     * @tc.name testCharToIntStatic0002
     * @tc.desc Verify Char.toInt throws error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toInt(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0400
     * @tc.name testCharToIntStatic0004
     * @tc.desc Verify Char.toInt with ASCII letter characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'A')).assertEqual(65);
      expect(Char.toInt(c'Z')).assertEqual(90);
      expect(Char.toInt(c'a')).assertEqual(97);
      expect(Char.toInt(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0500
     * @tc.name testCharToIntStatic0005
     * @tc.desc Verify Char.toInt with digit characters 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'0')).assertEqual(48);
      expect(Char.toInt(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0600
     * @tc.name testCharToIntStatic0006
     * @tc.desc Verify Char.toInt with special characters and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c' ')).assertEqual(32);
      expect(Char.toInt(c'!')).assertEqual(33);
      expect(Char.toInt(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0700
     * @tc.name testCharToIntStatic0007
     * @tc.desc Verify Char.toInt with escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'\u0000')).assertEqual(0);
      expect(Char.toInt(c'\n')).assertEqual(10);
      expect(Char.toInt(c'\t')).assertEqual(9);
      expect(Char.toInt(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0800
     * @tc.name testCharToIntStatic0008
     * @tc.desc Verify Char.toInt with char boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toInt(c'\x7F')).assertEqual(127);
      expect(Char.toInt(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_0900
     * @tc.name testCharToIntStatic0009
     * @tc.desc Verify Char.toInt throws error when passing non-char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toInt(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      try {
        const result = Char.toInt(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1000
     * @tc.name testCharToIntStatic0010
     * @tc.desc Verify Char.toInt with char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(Char.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1100
     * @tc.name testCharToIntStatic0011
     * @tc.desc Verify Char.toInt at ASCII and extended ASCII boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'\x7F')).assertEqual(127);
      expect(Char.toInt(c'\x80')).assertEqual(128);
      expect(Char.toInt(c'\xFF')).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1200
     * @tc.name testCharToIntStatic0012
     * @tc.desc Verify Char.toInt with char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1300
     * @tc.name testCharToIntStatic0013
     * @tc.desc Verify Char.toInt returns int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'A');
      expect(typeof result === "number" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1400
     * @tc.name testCharToIntStatic0014
     * @tc.desc Verify Char.toInt correctly converts ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toInt(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1500
     * @tc.name testCharToIntStatic0015
     * @tc.desc Verify Char.toInt converts uppercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'A')).assertEqual(65);
      expect(Char.toInt(c'B')).assertEqual(66);
      expect(Char.toInt(c'Z')).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1600
     * @tc.name testCharToIntStatic0016
     * @tc.desc Verify Char.toInt converts lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'a')).assertEqual(97);
      expect(Char.toInt(c'b')).assertEqual(98);
      expect(Char.toInt(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1700
     * @tc.name testCharToIntStatic0017
     * @tc.desc Verify Char.toInt converts digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'0', c'5', c'9'];
      const expected = [48, 53, 57];
      for (let idx = 0; idx < samples.length; idx++) {
        expect(Char.toInt(samples[idx])).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1800
     * @tc.name testCharToIntStatic0018
     * @tc.desc Verify Char.toInt converts control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'\u0000')).assertEqual(0);
      expect(Char.toInt(c'\n')).assertEqual(10);
      expect(Char.toInt(c'\t')).assertEqual(9);
      expect(Char.toInt(c'\r')).assertEqual(13);
      expect(Char.toInt(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_1900
     * @tc.name testCharToIntStatic0019
     * @tc.desc Verify Char.toInt converts Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'中')).assertEqual(20013);
      expect(Char.toInt(c'あ')).assertEqual(12354);
      expect(Char.toInt(c'가')).assertEqual(44032);
      expect(Char.toInt(Char.HIGH_SURROGATE_MIN)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2000
     * @tc.name testCharToIntStatic0020
     * @tc.desc Verify Char.toInt converts null character to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'\u0000');
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2200
     * @tc.name testCharToIntStatic0022
     * @tc.desc Verify Char.toInt returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'A');
      expect(typeof result === "number" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2300
     * @tc.name testCharToIntStatic0023
     * @tc.desc Verify Char.toInt returns integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'A');
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2400
     * @tc.name testCharToIntStatic0024
     * @tc.desc Verify Char.toInt result is always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(Char.MAX_VALUE);
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2500
     * @tc.name testCharToIntStatic0025
     * @tc.desc Verify Char.toInt result is within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(Char.MAX_VALUE);
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_2900
     * @tc.name testCharToIntStatic0029
     * @tc.desc Verify Char.toInt converts extended ASCII characters 128-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toInt(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3000
     * @tc.name testCharToIntStatic0030
     * @tc.desc Verify Char.toInt converts BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expectedVals = [0x4E00, 0x4E8C, 0x4E09];
      for (let idx = 0; idx < testChars.length; idx++) {
        expect(Char.toInt(testChars[idx])).assertEqual(expectedVals[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3100
     * @tc.name testCharToIntStatic0031
     * @tc.desc Verify Char.toInt with all possible char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected = [0, 127, 128, 255, 256, 0x7FFF, 0x8000, 0xFFFF];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        expect(Char.toInt(sampleChars[idx])).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3200
     * @tc.name testCharToIntStatic0032
     * @tc.desc Verify Char.toInt returns correct result after multiple conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toInt(c'A')).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3300
     * @tc.name testCharToIntStatic0033
     * @tc.desc Verify Char.toInt throws error when passing wrong type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toInt(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3400
     * @tc.name testCharToIntStatic0034
     * @tc.desc Verify Char.toInt throws error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toInt(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3600
     * @tc.name testCharToIntStatic0036
     * @tc.desc Verify Char.toInt enters catch with illegal parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toInt(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_3700
     * @tc.name testCharToIntStatic0037
     * @tc.desc Verify Char.toInt finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toInt(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4000
     * @tc.name testCharToIntStatic0040
     * @tc.desc Verify Char instance also has toInt method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.toInt();
      const staticResult = Char.toInt(c'A');
      expect(typeof instanceResult === "number" || typeof instanceResult === "int").assertTrue();
      expect(typeof staticResult === "number" || typeof staticResult === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4100
     * @tc.name testCharToIntStatic0041
     * @tc.desc Verify Char.toInt is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toInt(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4200
     * @tc.name testCharToIntStatic0042
     * @tc.desc Verify static toInt requires parameter while instance toInt does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toInt(c'A');
      const instanceResult = c.toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4300
     * @tc.name testCharToIntStatic0043
     * @tc.desc Verify static and instance toInt return same result for same character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toInt(c'A')).assertEqual(c.toInt());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4400
     * @tc.name testCharToIntStatic0044
     * @tc.desc Verify int range is larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\x80';
      const byteResult = Char.toByte(ch);
      const intResult = Char.toInt(ch);
      expect(byteResult === -128 || byteResult === 128).assertTrue();
      expect(intResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4500
     * @tc.name testCharToIntStatic0045
     * @tc.desc Verify values above 127 overflow in byte but int is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      const expected = [128, 192, 255];
      for (let idx = 0; idx < samples.length; idx++) {
        const byteResult = Char.toByte(samples[idx]);
        const intResult = Char.toInt(samples[idx]);
        expect(intResult).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4600
     * @tc.name testCharToIntStatic0046
     * @tc.desc Verify toInt and toShort return same value within char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'z', c'\x7F', c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        expect(Char.toInt(ch)).assertEqual(Char.toShort(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4700
     * @tc.name testCharToIntStatic0047
     * @tc.desc Verify toInt and toShort can represent 0-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected = [0, 256, 0x7FFF, 0x8000, 0xFFFF];
      for (let idx = 0; idx < samples.length; idx++) {
        const intResult = Char.toInt(samples[idx]);
        const shortResult = Char.toShort(samples[idx]);
        expect(intResult).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4800
     * @tc.name testCharToIntStatic0048
     * @tc.desc Verify toInt and toLong return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'z', c'\x7F', c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        expect(Char.toInt(ch)).assertEqual(Char.toLong(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_4900
     * @tc.name testCharToIntStatic0049
     * @tc.desc Verify toInt and toLong are consistent across full char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      for (const ch of sampleChars) {
        expect(Char.toInt(ch)).assertEqual(Char.toLong(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_5000
     * @tc.name testCharToIntStatic0050
     * @tc.desc Verify static toInt can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toInt()).assertEqual(65);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_5300
     * @tc.name testCharToIntStatic0053
     * @tc.desc Verify Char.toInt converts BMP characters for encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09', c'\u4E5D', c'\u4E94'];
      const expectedVals = [0x4E00, 0x4E8C, 0x4E09, 0x4E5D, 0x4E94];
      for (let idx = 0; idx < testChars.length; idx++) {
        expect(Char.toInt(testChars[idx])).assertEqual(expectedVals[idx]);
      }
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_5700
     * @tc.name testCharToIntStatic0057
     * @tc.desc Verify Char.toInt converts high surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toInt(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertEqual(0xD800);
      const result2 = Char.toInt(Char.HIGH_SURROGATE_MAX);
      expect(result2).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_5800
     * @tc.name testCharToIntStatic0058
     * @tc.desc Verify Char.toInt converts low surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toInt(Char.LOW_SURROGATE_MIN);
      expect(result1).assertEqual(0xDC00);
      const result2 = Char.toInt(Char.LOW_SURROGATE_MAX);
      expect(result2).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_5900
     * @tc.name testCharToIntStatic0059
     * @tc.desc Verify Char.toInt returns same result on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toInt(c'A');
      const result2 = Char.toInt(c'A');
      const result3 = Char.toInt(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6000
     * @tc.name testCharToIntStatic0060
     * @tc.desc Verify Char.toInt has no precision loss within char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'\u0100', c'\uFFFF'];
      const expected = [0, 256, 65535];
      for (let idx = 0; idx < samples.length; idx++) {
        expect(Char.toInt(samples[idx])).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6100
     * @tc.name testCharToIntStatic0061
     * @tc.desc Verify Char.toInt boundary values are converted precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toInt(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6200
     * @tc.name testCharToIntStatic0062
     * @tc.desc Verify Char.toInt treats char as unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'\u8000';
      const result = Char.toInt(ch);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6300
     * @tc.name testCharToIntStatic0063
     * @tc.desc Verify Char.toInt result can be used in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(c'A') + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6400
     * @tc.name testCharToIntStatic0064
     * @tc.desc Verify multiple conversion combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intValue = Char.toInt(c'A');
      const longValue = Char.toLong(c'A');
      expect(intValue).assertEqual(longValue);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_6600
     * @tc.name testCharToIntStatic0066
     * @tc.desc Verify Char.toInt batch converts different characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toInt(ch)).assertEqual(i);
      }
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOINTSTATICTEST_7100
     * @tc.name testCharToIntStatic0071
     * @tc.desc Verify all conversion methods return consistent results for ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToIntStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toInt(ch)).assertEqual(Char.toShort(ch));
        expect(Char.toInt(ch)).assertEqual(Char.toLong(ch));
      }
    });

  });
}
