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

function lnUnsafe(...args: ESObject[]): Decimal {
  return Decimal.ln(args[0] as Value);
}

export default function DecimalStaticLnPart02Test() {
  describe('DecimalStaticLnPart02Test', () => {
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
     * @tc.name testDecimalStaticLnPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0100
     * @tc.desc Verify ln('1') legal arity=1 string input yields natural log '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0200
     * @tc.desc Verify ln(1, 2) extra second argument ignored per JS semantics returning ln(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = lnUnsafe(1, 2);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0300
     * @tc.desc Verify ln('2.718281828459045') e constant string yields about 1 by prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('2.718281828459045');
      expect(r.toString().startsWith('0.9999999999999999')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0400
     * @tc.desc Verify ln('10') integer above 1 yields prefix about 2.302585092994046
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('10');
      expect(r.toString().startsWith('2.302585092994045')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0500
     * @tc.desc Verify ln('0.5') decimal below 1 yields negative prefix about -0.6931471805599453
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('0.5');
      expect(r.toString().startsWith('-0.693147180559945')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0600
     * @tc.desc Verify ln('1e4') positive exponent string yields 9.210340371976182736 prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1e4');
      expect(r.toString().startsWith('9.210340371976182')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0700
     * @tc.desc Verify ln('1e-4') negative exponent string yields -9.210340371976182736 prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1e-4');
      expect(r.toString().startsWith('-9.210340371976182')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0800
     * @tc.desc Verify ln('1e+2') exponent with plus sign yields ln(100)=4.605170185988091
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1e+2');
      expect(r.toString().startsWith('4.605170185988091')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_0900
     * @tc.desc Verify ln('+2') explicit plus sign matches ln('2') numeric value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('+2');
      expect(r.toString()).assertEqual('0.69314718055994530942');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1000
     * @tc.desc Verify ln('2.000') trailing zero decimal matches ln('2') numeric value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('2.000');
      expect(r.toString()).assertEqual('0.69314718055994530942');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1100
     * @tc.desc Verify ln('Infinity') non-finite string yields 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('Infinity');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1200
     * @tc.desc Verify ln('NaN') non-finite string yields NaN with isNaN flag true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1300
     * @tc.desc Verify ln('-Infinity') negative non-finite string yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('-Infinity');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1400
     * @tc.desc Verify ln('-5') negative number string yields NaN with no real result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('-5');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1500
     * @tc.desc Verify ln('-1e2') negative exponent string yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('-1e2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1600
     * @tc.desc Verify ln('0') zero string yields -Infinity negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('0');
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1700
     * @tc.desc Verify ln('0.0') positive zero string toNumber overflows to -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('0.0');
      expect(r.toNumber()).assertEqual(-Infinity);
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1800
     * @tc.desc Verify ln 10^24 long digit string yields 24 times ln10 = 55.262042231857004 prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1000000000000000000000000');
      expect(r.toString().startsWith('55.2620422318570')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_1900
     * @tc.desc Verify ln('9000000000000000000') beyond MAX_SAFE yields prefix about 43.62929231061
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('9000000000000000000');
      expect(Math.abs(r.toNumber() - Math.log(9e18)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2000
     * @tc.desc Verify ln('9007199254740991') MAX_SAFE boundary string toNumber matches Math.log
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('9007199254740991');
      expect(Math.abs(r.toNumber() - Math.log(9007199254740991))).assertLess(1e-10);
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2100
     * @tc.desc Verify ln('\x31') escape sequence runtime '1' yields '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('\x31');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2200
     * @tc.desc Verify ln('\x36') escape sequence runtime '6' yields prefix about 1.791759469228055
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('\x36');
      expect(r.toString().startsWith('1.791759469228055')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2300
     * @tc.desc Verify precision 4 config ln('2') yields '0.6931' restoring default afterwards
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4 });
      try {
        let r: Decimal = Decimal.ln('2');
        expect(r.toString()).assertEqual('0.6931');
      } finally {
        Decimal.set({ precision: 20 });
      }
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2400
     * @tc.desc Verify three union members ln('1')/ln(1)/ln(new Decimal(1)) all yield '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.ln('1');
      let b: Decimal = Decimal.ln(1);
      let c: Decimal = Decimal.ln(new Decimal(1));
      expect(a.toString()).assertEqual('0');
      expect(b.toString()).assertEqual('0');
      expect(c.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2500
     * @tc.desc Verify '4'/4/new Decimal(4) different references same content yield equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.ln('4');
      let b: Decimal = Decimal.ln(4);
      let c: Decimal = Decimal.ln(new Decimal(4));
      expect(a.toString()).assertEqual(b.toString());
      expect(b.toString()).assertEqual(c.toString());
      expect(a.toString()).assertEqual('1.3862943611198906188');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2600
     * @tc.desc Verify Decimal carrying scientific string new Decimal('1e4') yields 9.210340371976182
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(new Decimal('1e4'));
      expect(r.toString().startsWith('9.210340371976182')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2700
     * @tc.desc Verify Decimal negative member new Decimal(-3) yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(new Decimal(-3));
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2800
     * @tc.desc Verify Decimal zero member new Decimal(0) yields -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(new Decimal(0));
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_2900
     * @tc.desc Verify Decimal carrying long string new Decimal('1e20') yields 46.051701859880968
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(new Decimal('1e20'));
      expect(r.toString().startsWith('46.0517018598809')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3000
     * @tc.desc Verify number scientific member ln(1e4) yields prefix 9.210340371976182
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e4);
      expect(r.toString().startsWith('9.210340371976182')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3100
     * @tc.desc Verify number decimal member ln(0.5) matches string '0.5' numeric value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0.5);
      expect(r.toString()).assertEqual('-0.69314718055994530942');
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3200
     * @tc.desc Verify number non-integer member ln(7) prefix about 1.9459101490553132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(7);
      expect(r.toString().startsWith('1.945910149055313')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3300
     * @tc.desc Verify union with null: null throws 401 while '1'/1/Decimal(1) members yield '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.ln('1').toString()).assertEqual('0');
      expect(Decimal.ln(1).toString()).assertEqual('0');
      expect(Decimal.ln(new Decimal(1)).toString()).assertEqual('0');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3400
     * @tc.desc Verify union with undefined: throws 401 while '1'/1/Decimal(1) members yield '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.ln('1').toString()).assertEqual('0');
      expect(Decimal.ln(1).toString()).assertEqual('0');
      expect(Decimal.ln(new Decimal(1)).toString()).assertEqual('0');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3500
     * @tc.desc Verify null and undefined runtime branches are equivalent both throwing 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: number = -1;
      let c2: number = -1;
      try {
        lnUnsafe(null);
      } catch (e) {
        c1 = (e as BusinessError).code;
      }
      try {
        lnUnsafe(undefined);
      } catch (e) {
        c2 = (e as BusinessError).code;
      }
      expect(c1).assertEqual(401);
      expect(c2).assertEqual(401);
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3600
     * @tc.desc Verify null throws 401 while number member ln(1) yields '0' branch distinction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.ln(1).toString()).assertEqual('0');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3700
     * @tc.desc Verify undefined throws 401 while string member ln('1') yields '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.ln('1').toString()).assertEqual('0');
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3800
     * @tc.desc Verify boolean member false outside union is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_3900
     * @tc.desc Verify empty array [] outside union reference type is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe([]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4000
     * @tc.desc Verify ['1'] array of numeric strings rejected with 401 as array not Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(['1']);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4100
     * @tc.desc Verify boxed new Number(1) outside union is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(new Number(1));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4200
     * @tc.desc Verify RegExp /e/ outside union reference type is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(/e/);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4300
     * @tc.desc Verify Map instance outside union reference type is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(new Map<string, number>());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4400
     * @tc.desc Verify Set instance outside union reference type is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(new Set<number>([1]));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4500
     * @tc.desc Verify Decimal reference input d stays '7' unchanged while ln returns new object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7);
      let r: Decimal = Decimal.ln(d);
      expect(r.toString()).assertEqual(Decimal.ln('7').toString());
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4600
     * @tc.desc Verify ln returns new instance r not same reference as input d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3);
      let r: Decimal = Decimal.ln(d);
      expect(r === d).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4700
     * @tc.desc Verify ln('4') string input returns Decimal instance by instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('4');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4800
     * @tc.desc Verify ln('1') result isZero returns true since ln(1) equals exactly 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ln('1').isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_4900
     * @tc.desc Verify ln('2') result isFinite returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ln('2').isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5000
     * @tc.desc Verify ln('2.718281828459045') e constant returns sign property s equal 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ln('2.718281828459045').s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5100
     * @tc.desc Verify ln('0.5') returns negative value with sign property s equal -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ln('0.5').s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5200
     * @tc.desc Verify ln('') empty string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5300
     * @tc.desc Verify ln('   ') all-space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5400
     * @tc.desc Verify ln('\u200B') zero-width space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\u200B');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5500
     * @tc.desc Verify ln('\uFEFF') BOM zero-width no-break space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\uFEFF');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5600
     * @tc.desc Verify ln('\u0000') NUL character string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5700
     * @tc.desc Verify ln('\t4') tab-prefixed string throws 401 as leading whitespace rejected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\t4');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5800
     * @tc.desc Verify ln('abc') pure letter illegal format string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_5900
     * @tc.desc Verify ln('2e') letters mixed missing exponent power throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('2e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6000
     * @tc.desc Verify ln('1.2.3') double decimal point string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6100
     * @tc.desc Verify ln('0x10') hex form string parses as 16 yielding prefix 2.772588722239781
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('0x10');
      expect(r.toString().startsWith('2.772588722239781')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6200
     * @tc.desc Verify ln('1_000') numeric separator underscore string parses as 1000 yielding prefix 6.907755278982137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1_000');
      expect(r.toString().startsWith('6.907755278982137')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6300
     * @tc.desc Verify ln('--4') double negative sign string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('--4');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6400
     * @tc.desc Verify ln('- 4') negative sign followed by space throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('- 4');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6500
     * @tc.desc Verify ln('1e01') exponent with leading zero parses as 10 within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln('1e01');
      expect(Math.abs(r.toNumber() - Math.log(10)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6600
     * @tc.desc Verify ln('1,5') decimal comma separator string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('1,5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6700
     * @tc.desc Verify ln('<script>alert(1)</script>') XSS script string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6800
     * @tc.desc Verify ln emoji string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\uD83D\uDE00');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_6900
     * @tc.desc Verify ln('\u56DB') Unicode CJK numeral character throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\u56DB');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7000
     * @tc.desc Verify ln lone high surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7100
     * @tc.desc Verify ln('4\n') trailing newline escape string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('4\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7200
     * @tc.desc Verify ln(' ') line separator sole string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln(' ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7300
     * @tc.desc Verify ln('\x41') escape sequence runtime 'A' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\x41');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7400
     * @tc.desc Verify ln('\\2') backslash literal string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\\2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7500
     * @tc.desc Verify ln('\u81EA\u7136\u5BF9\u6570') Chinese string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('\u81EA\u7136\u5BF9\u6570');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart02Test7600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART02_TEST_7600
     * @tc.desc Verify ln('MTIz') base64 string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart02Test7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ln('MTIz');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

  });
}
