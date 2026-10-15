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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function assertThrowError(fn: () => void, code: number): void {
  try {
    fn();
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(code);
  }
}

type Value = string | number | Decimal;

function addUnsafe(...args: ESObject[]): Decimal {
  return Decimal.add(args[0] as Value, args[1] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticAddPart02Test() {
  describe('DecimalStaticAddPart02Test', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await sleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0100
     * @tc.desc Verify add('2', 3) with string x and number y returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('2', 3);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0200
     * @tc.desc Verify add('0.1', 0.2) binary-imprecise string sums exactly to '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.1', 0.2);
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0300
     * @tc.desc Verify add('1e-7', 0) with negative exponent string x returns '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e-7', 0);
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0400
     * @tc.desc Verify add('0x10', 1) parses hex string as 16 returning '17'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0x10', 1);
      expect(r.toString()).assertEqual('17');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0500
     * @tc.desc Verify add('+5', 5) with leading plus sign string returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('+5', 5);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0600
     * @tc.desc Verify add('-5', 5) with leading minus sign string cancels to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-5', 5);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0700
     * @tc.desc Verify add('.5', '.5') with no-integer-part strings sums to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('.5', '.5');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0800
     * @tc.desc Verify add('5.', 1) with no-fraction-part string returns '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('5.', 1);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_0900
     * @tc.desc Verify add('007', 1) normalizes leading zeros to 7 returning '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('007', 1);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1000
     * @tc.desc Verify add('000.000', 0) with all-zero string returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('000.000', 0);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1100
     * @tc.desc Verify add('9007199254740991', 1) MAX_SAFE string carries exactly to '9007199254740992'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('9007199254740991', 1);
      expect(r.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1200
     * @tc.desc Verify add of two 30-digit high-precision strings digit-wise normalizes to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.123456789012345678901234567890', '0.876543210987654321098765432110');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1300
     * @tc.desc Verify add('1e21', '1e21') same-order exponents sum to '2e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e21', '1e21');
      expect(r.toString()).assertEqual('2e+21');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1400
     * @tc.desc Verify add('-3.14e-10', '3.14e-10') exponent values cancel to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-3.14e-10', '3.14e-10');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1500
     * @tc.desc Verify add('2.5e-3', 1) decimal sci-notation plus integer returns '1.0025'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('2.5e-3', 1);
      expect(r.toString()).assertEqual('1.0025');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1600
     * @tc.desc Verify add('999999999999999999999999999999', 1) 30-digit carry to 31-digit result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('999999999999999999999999999999', 1);
      expect(r.toString()).assertEqual('1e+30');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1700
     * @tc.desc Verify add('-0', 0) returns '0' with isNegative false after string parse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-0', 0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1800
     * @tc.desc Verify add('5', '5.0') different representation same value sums to '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('5', '5.0');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_1900
     * @tc.desc Verify add(5, '123') with number x and integer string y returns '128'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(5, '123');
      expect(r.toString()).assertEqual('128');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2000
     * @tc.desc Verify add(0.2, '0.1') with string y returns exact '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.2, '0.1');
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2100
     * @tc.desc Verify add(0, '0x10') with hex string y returns '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0, '0x10');
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2200
     * @tc.desc Verify add('7', '-7') opposite string values cancel to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('7', '-7');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2300
     * @tc.desc Verify add('2e-7', '1e-7') same-order small decimals sum to '3e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('2e-7', '1e-7');
      expect(r.toString()).assertEqual('3e-7');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2400
     * @tc.desc Verify add('1', '9007199254740991') MAX_SAFE string y carries exactly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1', '9007199254740991');
      expect(r.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2500
     * @tc.desc Verify add('4.5', '5.50') trailing-zero string normalizes to 5.5 summing '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('4.5', '5.50');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2600
     * @tc.desc Verify add('-2.5e-3', '2.5e-3') symmetric sci-notation strings cancel to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-2.5e-3', '2.5e-3');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2700
     * @tc.desc Verify add(0.5, '.5') with no-integer-part string y sums to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.5, '.5');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2800
     * @tc.desc Verify add('   ', 1) with all-whitespace string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('   ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_2900
     * @tc.desc Verify add('\n\t', 1) with escaped character string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('\n\t', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3000
     * @tc.desc Verify add with Unicode text string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('中文', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3100
     * @tc.desc Verify add with emoji string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('😀', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3200
     * @tc.desc Verify add with illegal lone high surrogate string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('\uD800', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3300
     * @tc.desc Verify add(' 5', 1) with leading space string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(' 5', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3400
     * @tc.desc Verify add('5 ', 1) with trailing space string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('5 ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3500
     * @tc.desc Verify add('1,000', 1) with thousands-comma string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('1,000', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3600
     * @tc.desc Verify add('1_000', 1) underscore separator x parses as 1001 returning '1001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1_000', 1);
      expect(r.toString()).assertEqual('1001');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3700
     * @tc.desc Verify add(1, '') with empty string in y position throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, '');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3800
     * @tc.desc Verify add with zero-width space string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, '​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_3900
     * @tc.desc Verify add(1, '5 ') with trailing space string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, '5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4000
     * @tc.desc Verify add with illegal lone high surrogate string y throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, '\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4100
     * @tc.desc Verify add(NaN, 5) with NaN x propagates to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(NaN, 5);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4200
     * @tc.desc Verify add(5, NaN) with NaN y propagates to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(5, NaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4300
     * @tc.desc Verify add(Infinity, 5) with +Infinity x propagates to 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Infinity, 5);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4400
     * @tc.desc Verify add(5, -Infinity) with -Infinity y propagates to '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(5, -Infinity);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4500
     * @tc.desc Verify add(Infinity, -Infinity) opposite infinities cancel to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Infinity, -Infinity);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4600
     * @tc.desc Verify add(NaN, Infinity) NaN takes priority propagating to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(NaN, Infinity);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4700
     * @tc.desc Verify add(-Infinity, -Infinity) same-sign infinities sum to '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-Infinity, -Infinity);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4800
     * @tc.desc Verify add(-0, -5) negative zero keeps negative sign returning '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-0, -5);
      expect(r.toString()).assertEqual('-5');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_4900
     * @tc.desc Verify add(MAX_VALUE, MAX_VALUE) keeps exponent string while toNumber overflows Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_VALUE, Number.MAX_VALUE);
      expect(r.toNumber() === Infinity).assertTrue();
      expect(r.toString()).assertEqual('3.5953862697246314e+308');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5000
     * @tc.desc Verify add(9007199254740992, 1) beyond MAX_SAFE number sums exactly '9007199254740993'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(9007199254740992, 1);
      expect(r.toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5100
     * @tc.desc Verify add(true, 1) with boolean x of wrong type throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let b: ESObject = true;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(b as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5200
     * @tc.desc Verify add(1, false) with boolean y of wrong type throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let b: ESObject = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, b as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5300
     * @tc.desc Verify add('2', new Decimal(3)) string x with Decimal member y returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('2', new Decimal(3));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5400
     * @tc.desc Verify add(new Decimal('1.5'), 0.5) Decimal x with number member y returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal('1.5'), 0.5);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5500
     * @tc.desc Verify add(new Decimal(1), new Decimal(2)) both Decimal members sum to '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal(1), new Decimal(2));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5600
     * @tc.desc Verify add(0.1, '0.2') number x with string y swapped returns '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.1, '0.2');
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5700
     * @tc.desc Verify add(new Decimal(0.1), 0.2) Decimal x with number y returns '0.3' no float error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal(0.1), 0.2);
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5800
     * @tc.desc Verify add('9007199254740991', MAX_SAFE_INTEGER) mixed precision sums exactly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('9007199254740991', Number.MAX_SAFE_INTEGER);
      expect(r.toString()).assertEqual('18014398509481982');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_5900
     * @tc.desc Verify null vs string union dispatch: null member throws 401, '5' member returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let n: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(n as Value, '5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let ok: Decimal = Decimal.add('5', '5');
      expect(ok.toString()).assertEqual('10');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6000
     * @tc.desc Verify undefined vs number union dispatch in y: undefined throws 401, 5 returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let u: ESObject = undefined;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(5, u as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let ok: Decimal = Decimal.add(5, 5);
      expect(ok.toString()).assertEqual('10');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6100
     * @tc.desc Verify four-member union dispatch: null throws 401, string/number/Decimal each '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let n: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(n as Value, '3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.add('2', '3').toString()).assertEqual('5');
      expect(Decimal.add(2, '3').toString()).assertEqual('5');
      expect(Decimal.add(new Decimal(2), '3').toString()).assertEqual('5');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6200
     * @tc.desc Verify equal-content instances '5' and '5.0' both self-add to identical '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5');
      let b: Decimal = new Decimal('5.0');
      let r1: Decimal = Decimal.add(a, a);
      let r2: Decimal = Decimal.add(b, b);
      expect(r1.toString()).assertEqual('10');
      expect(r2.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6300
     * @tc.desc Verify add with RegExp x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let re: ESObject = /abc/;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(re as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6400
     * @tc.desc Verify add with Date x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let d: ESObject = new Date(0);
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(d as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6500
     * @tc.desc Verify add with Error x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let er: ESObject = new Error('boom');
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(er as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6600
     * @tc.desc Verify add with Array x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let arr: ESObject = [1, 2];
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(arr as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6700
     * @tc.desc Verify add with Map x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let mp: ESObject = new Map<string, number>();
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(mp as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6800
     * @tc.desc Verify add with Set x of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let st: ESObject = new Set<number>();
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(st as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_6900
     * @tc.desc Verify add with object literal x of non-Value type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let obj: ESObject = {};
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(obj as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7000
     * @tc.desc Verify add with Date instance x of non-Value type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let box: ESObject = new Date(2020, 0, 1);
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(box as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7100
     * @tc.desc Verify add with Date y of non-Value reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let d: ESObject = new Date(2020, 0, 1);
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, d as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7200
     * @tc.desc Verify add with custom class instance x non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let p: ESObject = new IllegalUnionMember();
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(p as Value, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7300
     * @tc.desc Verify add('4', '6') returns Decimal instance with value '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('4', '6');
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7400
     * @tc.desc Verify add returns new instance: operands a='5' b='3' unchanged after sum '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5');
      let b: Decimal = new Decimal('3');
      let r: Decimal = Decimal.add(a, b);
      expect(r.toString()).assertEqual('8');
      expect(a.toString()).assertEqual('5');
      expect(b.toString()).assertEqual('3');
      expect(r === a).assertFalse();
      expect(r === b).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7500
     * @tc.desc Verify add('0.1', '0.2') toNumber returns numeric 0.3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.1', '0.2');
      expect(r.toNumber()).assertEqual(0.3);
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7600
     * @tc.desc Verify chained reuse: inner add result feeds outer add returning '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Decimal = Decimal.add('1', '2');
      let outer: Decimal = Decimal.add(inner, '3');
      expect(outer.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7700
     * @tc.desc Verify add('', '') with both empty strings throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('', '');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7800
     * @tc.desc Verify add('5', 'abc') mixed valid and invalid strings throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('5', 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart02Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART02_TEST_7900
     * @tc.desc Verify add(NaN, '5') numeric anomaly with valid string propagates 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart02Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(NaN, '5');
      expect(r.toString()).assertEqual('NaN');
    });
  });
}
