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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';
type InvalidDecimalInput = string
  | double
  | boolean
  | BigInt
  | Object
  | Array<int>
  | Array<double>
  | (() => undefined)
  | undefined
  | null;
type DecimalValue = string | double | Decimal;

export default function decimalTanhTest(): void {
  describe('DecimalTanhTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0100
     * @tc.name decimalTanhTest001
     * @tc.desc Zero and sign basics (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tanh(0) equals zero
      let d1: Decimal = new Decimal(0);
      let r1: Decimal = d1.tanh();
      let a1: string = r1.toString();
      let e1: string = '0';
      expect(a1).assertEqual(e1);

      // 2. double -0 tanh equals 0 and isZero (SameValueZero)
      let d2: Decimal = new Decimal(-0);
      let r2: Decimal = d2.tanh();
      let a2a: boolean = r2.equals(new Decimal(0));
      expect(a2a).assertTrue();
      let a2b: boolean = r2.isZero();
      expect(a2b).assertTrue();

      // 3. string '-0' tanh isZero
      let d3: Decimal = new Decimal('-0');
      let a3: boolean = d3.tanh().isZero();
      expect(a3).assertTrue();

      // 4. double -0 tanh toNumber 0
      let d4: Decimal = new Decimal(-0);
      let a4: number = d4.tanh().toNumber();
      let e4: int = 0;
      expect(a4).assertEqual(e4);

      // 5. tanh(1) sign is 1
      let d5: Decimal = new Decimal(1);
      let a5: number = Decimal.sign(d5.tanh());
      let e5: int = 1;
      expect(a5).assertEqual(e5);

      // 6. tanh(-1) sign is -1
      let d6: Decimal = new Decimal(-1);
      let a6: number = Decimal.sign(d6.tanh());
      let e6: int = -1;
      expect(a6).assertEqual(e6);

      // 7. tanh(-2) isNegative
      let d7: Decimal = new Decimal(-2);
      let a7: boolean = d7.tanh().isNegative();
      expect(a7).assertTrue();

      // 8. tanh('0.1') isPositive
      let smallPositiveInput: Decimal = new Decimal('0.1');
      let a8: boolean = smallPositiveInput.tanh().isPositive();
      expect(a8).assertTrue();

      // 9. tanh(100) isZero is false
      let d9: Decimal = new Decimal(100);
      let a9: boolean = d9.tanh().isZero();
      expect(a9).assertFalse();

      // 10. tanh(0) isZero is true
      let d10: Decimal = new Decimal(0);
      let a10: boolean = d10.tanh().isZero();
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0200
     * @tc.name decimalTanhTest002
     * @tc.desc Small positive tanh values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tanh(tanh(0.5)) = 0.4621171572600097585, tanh(tanh(tanh(0.5))) = 0.43180818059509617737
      let d1: Decimal = new Decimal('0.5');
      let once1: Decimal = d1.tanh();
      let a1a: string = once1.toString();
      let e1a: string = '0.4621171572600097585';
      expect(a1a).assertEqual(e1a);
      let twice1: Decimal = d1.tanh().tanh();
      let a1b: string = twice1.toString();
      let e1b: string = '0.43180818059509617737';
      expect(a1b).assertEqual(e1b);

      // 2. tanh(0)+1 = '1'
      let d2: Decimal = new Decimal(0);
      let r2: Decimal = d2.tanh().add(new Decimal(1));
      let a2: string = r2.toString();
      let e2: string = '1';
      expect(a2).assertEqual(e2);

      // 3. tanh(1) = '0.76159415595576488812'
      let d3: Decimal = new Decimal(1);
      let a3: string = d3.tanh().toString();
      let e3: string = '0.76159415595576488812';
      expect(a3).assertEqual(e3);

      // 4. Decimal(Decimal(1)) tanh = '0.76159415595576488812'
      let inner4: Decimal = new Decimal(1);
      let d4: Decimal = new Decimal(inner4);
      let a4: string = d4.tanh().toString();
      let e4: string = '0.76159415595576488812';
      expect(a4).assertEqual(e4);

      // 5. tanh('0.1') = '0.099667994624955817118'
      let d5: Decimal = new Decimal('0.1');
      let a5: string = d5.tanh().toString();
      let e5: string = '0.099667994624955817118';
      expect(a5).assertEqual(e5);

      // 6. 0.1+0.2 vs '0.3' tanh
      let dec6a: Decimal = new Decimal(0.1 + 0.2).tanh();
      let dec6b: Decimal = new Decimal('0.3').tanh();
      let a6a: string = dec6b.toString();
      let e6a: string = '0.29131261245159090582';
      expect(a6a).assertEqual(e6a);
      let a6b: string = dec6a.toString();
      let e6b: string = '0.29131261245159094242';
      expect(a6b).assertEqual(e6b);

      // 7. tanh('0.3').d!.length = 3
      let d7: Decimal = new Decimal('0.3');
      let a7: int = d7.tanh().d!.length;
      let e7: int = 3;
      expect(a7).assertEqual(e7);

      // 8. tanh('0.3').e = -1
      let positiveFractionInput: Decimal = new Decimal('0.3');
      let a8: number = positiveFractionInput.tanh().e!;
      let e8: int = -1;
      expect(a8).assertEqual(e8);

      // 9. tanh(1) toNumber = 0.76159415595576488812
      let d9: Decimal = new Decimal(1);
      let a9: number = d9.tanh().toNumber();
      let e9: number = 0.76159415595576488812;
      expect(a9).assertEqual(e9);

      // 10. tanh('0.5').equals('0.46211715726000975850')
      let d10: Decimal = new Decimal('0.5');
      let a10: boolean = d10.tanh().equals(new Decimal('0.46211715726000975850'));
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0300
     * @tc.name decimalTanhTest003
     * @tc.desc Negative boundary and arithmetic chains (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tanh(-1) = '-0.76159415595576488812'
      let d1: Decimal = new Decimal(-1);
      let a1: string = d1.tanh().toString();
      let e1: string = '-0.76159415595576488812';
      expect(a1).assertEqual(e1);

      // 2. tanh('-0.5') = '-0.4621171572600097585'
      let d2: Decimal = new Decimal('-0.5');
      let a2: string = d2.tanh().toString();
      let e2: string = '-0.4621171572600097585';
      expect(a2).assertEqual(e2);

      // 3. tanh(20) comparedTo(1) = -1
      let d3: Decimal = new Decimal(20);
      let r3: Decimal = d3.tanh();
      let a3: number = r3.comparedTo(new Decimal(1));
      let e3: int = -1;
      expect(a3).assertEqual(e3);

      // 4. tanh(10) isFinite
      let d4: Decimal = new Decimal(10);
      let a4: boolean = d4.tanh().isFinite();
      expect(a4).assertTrue();

      // 5. tanh(5) comparedTo('0.99990920426259513121') = 0
      let d5: Decimal = new Decimal(5);
      let a5: number = d5.tanh().comparedTo(new Decimal('0.99990920426259513121'));
      let e5: int = 0;
      expect(a5).assertEqual(e5);

      // 6. tanh('0.5') toString length > 5 and equals '0.4621171572600097585'
      let d6: Decimal = new Decimal('0.5');
      let a6a: int = d6.tanh().toString().length;
      expect(a6a).assertLarger(5);
      let a6b: string = d6.tanh().toString();
      let e6b: string = '0.4621171572600097585';
      expect(a6b).assertEqual(e6b);

      // 7. tanh(1)*2 = '1.5231883119115297762'
      let d7: Decimal = new Decimal(1);
      let r7: Decimal = d7.tanh().mul(new Decimal(2));
      let a7: string = r7.toString();
      let e7: string = '1.5231883119115297762';
      expect(a7).assertEqual(e7);

      // 8. tanh(1).negate() = '-0.76159415595576488812'
      let unitInput: Decimal = new Decimal(1);
      let r8: Decimal = unitInput.tanh().negate();
      let a8: string = r8.toString();
      let e8: string = '-0.76159415595576488812';
      expect(a8).assertEqual(e8);

      // 9. tanh(2).atanh() = '2.0000000000000000001'
      let d9: Decimal = new Decimal(2);
      let r9: Decimal = d9.tanh().atanh();
      let a9: string = r9.toString();
      let e9: string = '2.0000000000000000001';
      expect(a9).assertEqual(e9);

      // 10. atanh(0.7).tanh() = '0.7'
      let d10: Decimal = new Decimal('0.7');
      let r10: Decimal = d10.atanh().tanh();
      let a10: string = r10.toString();
      let e10: string = '0.7';
      expect(a10).assertEqual(e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0400
     * @tc.name decimalTanhTest004
     * @tc.desc Large values scientific notation and special values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tanh('50.123456789012345678') rounds to '1' at default precision
      Decimal.set({ defaults: true });
      let d1: Decimal = new Decimal('50.123456789012345678');
      let a1: string = d1.tanh().toString();
      let e1: string = '1';
      expect(a1).assertEqual(e1);
      Decimal.set({ defaults: true });

      // 2. tanh(double 50) rounds to '1' at default precision
      Decimal.set({ defaults: true });
      let in2: double = 50;
      let d2: Decimal = new Decimal(in2);
      let a2: string = d2.tanh().toString();
      let e2: string = '1';
      expect(a2).assertEqual(e2);
      Decimal.set({ defaults: true });

      // 3. tanh(double -50) rounds to '-1' at default precision
      Decimal.set({ defaults: true });
      let in3: double = -50;
      let d3: Decimal = new Decimal(in3);
      let a3: string = d3.tanh().toString();
      let e3: string = '-1';
      expect(a3).assertEqual(e3);
      Decimal.set({ defaults: true });

      // 4. tanh('-1e2') = '-1'
      Decimal.set({ defaults: true });
      let d4: Decimal = new Decimal('-1e2');
      let a4: string = d4.tanh().toString();
      let e4: string = '-1';
      expect(a4).assertEqual(e4);
      Decimal.set({ defaults: true });

      // 5. tanh('1e+2') equals tanh('1E2')
      Decimal.set({ defaults: true });
      let tan5a: Decimal = new Decimal('1e+2').tanh();
      let tan5b: Decimal = new Decimal('1E2').tanh();
      let a5: string = tan5a.toString();
      let e5: string = tan5b.toString();
      expect(a5).assertEqual(e5);
      Decimal.set({ defaults: true });

      // 6. +Infinity tanh = '1'
      let d6: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let r6: Decimal = d6.tanh();
      let a6: string = r6.toString();
      let e6: string = '1';
      expect(a6).assertEqual(e6);

      // 7. -Infinity tanh = '-1'
      let d7: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let r7: Decimal = d7.tanh();
      let a7: string = r7.toString();
      let e7: string = '-1';
      expect(a7).assertEqual(e7);

      // 8. 'NaN' tanh isNaN
      let nanInput: Decimal = new Decimal('NaN');
      let r8: Decimal = nanInput.tanh();
      let a8: boolean = r8.isNaN();
      expect(a8).assertTrue();

      // 9. 'Infinity' tanh = '1'
      let d9: Decimal = new Decimal('Infinity');
      let r9: Decimal = d9.tanh();
      let a9: string = r9.toString();
      let e9: string = '1';
      expect(a9).assertEqual(e9);

      // 10. '-Infinity' tanh = '-1'
      let d10: Decimal = new Decimal('-Infinity');
      let r10: Decimal = d10.tanh();
      let a10: string = r10.toString();
      let e10: string = '-1';
      expect(a10).assertEqual(e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0500
     * @tc.name decimalTanhTest005
     * @tc.desc Precision rounding modes and remaining checks (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tanh(-0.5)+tanh(0.5) = '0'
      let d1: Decimal = new Decimal('-0.5');
      let r1: Decimal = d1.tanh().add(new Decimal('0.5').tanh());
      let a1: string = r1.toString();
      let e1: string = '0';
      expect(a1).assertEqual(e1);

      // 2. tanh('0.3') at precisions 1 and 10
      let precs2: int[] = [1, 10];
      let expVals2: string[] = ['0.3', '0.2913126125'];
      for (let idx2: int = 0; idx2 < precs2.length; idx2++) {
        Decimal.set({ precision: precs2[idx2] });
        let d2: Decimal = new Decimal('0.3');
        let a2: string = d2.tanh().toString();
        expect(a2).assertEqual(expVals2[idx2]);
        Decimal.set({ defaults: true });
      }

      // 3. precision 5 tanh(10) = '1'
      Decimal.set({ precision: 5 });
      let d3: Decimal = new Decimal(10);
      let a3: string = d3.tanh().toString();
      let e3: string = '1';
      expect(a3).assertEqual(e3);
      Decimal.set({ defaults: true });

      // 4. ROUND_DOWN precision 5 tanh(2) = '0.96402'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_DOWN });
      let d4: Decimal = new Decimal(2);
      let a4: string = d4.tanh().toString();
      let e4: string = '0.96402';
      expect(a4).assertEqual(e4);
      Decimal.set({ defaults: true });

      // 5. ROUND_HALF_UP precision 5 tanh(2) = '0.96403'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_HALF_UP });
      let d5: Decimal = new Decimal(2);
      let a5: string = d5.tanh().toString();
      let e5: string = '0.96403';
      expect(a5).assertEqual(e5);
      Decimal.set({ defaults: true });

      // 6. ROUND_FLOOR precision 5 tanh(-2) = '-0.96403'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_FLOOR });
      let d6: Decimal = new Decimal(-2);
      let a6: string = d6.tanh().toString();
      let e6: string = '-0.96403';
      expect(a6).assertEqual(e6);
      Decimal.set({ defaults: true });

      // 7. ROUND_CEILING precision 5 tanh(2) = '0.96403'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_CEILING });
      let d7: Decimal = new Decimal(2);
      let a7: string = d7.tanh().toString();
      let e7: string = '0.96403';
      expect(a7).assertEqual(e7);
      Decimal.set({ defaults: true });

      // 8. precision 5 vs defaults tanh('0.3')
      Decimal.set({ precision: 5 });
      let lowPrecisionInput: Decimal = new Decimal('0.3');
      let a8a: string = lowPrecisionInput.tanh().toString();
      let e8a: string = '0.29131';
      expect(a8a).assertEqual(e8a);
      Decimal.set({ defaults: true });
      let defaultPrecisionInput: Decimal = new Decimal('0.3');
      let a8b: string = defaultPrecisionInput.tanh().toString();
      let e8b: string = '0.29131261245159090582';
      expect(a8b).assertEqual(e8b);

      // 9. tanh(0.5) comparedTo NaN is NaN
      let d9: Decimal = new Decimal('0.5');
      let c9: double = d9.tanh().comparedTo(new Decimal(Number.NaN));
      let a9: boolean = c9.isNaN();
      expect(a9).assertTrue();

      // 10. tanh(1).d!.length = 3
      let d10: Decimal = new Decimal(1);
      let r10: Decimal = d10.tanh();
      let a10: int = r10.d!.length;
      let e10: int = 3;
      expect(a10).assertEqual(e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0600
     * @tc.name decimalTanhTest006
     * @tc.desc Static method string inputs (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(Decimal.tanh('0.5')) = '0.431808180595096' (15 sig digits)
      let r1: Decimal = Decimal.tanh(Decimal.tanh('0.5'));
      let a1: string = r1.toSignificantDigits(15).toString();
      let e1: string = '0.431808180595096';
      expect(a1).assertEqual(e1);

      // 2. Decimal.tanh('1').mul(3) = '2.28478246786729' (15 sig digits)
      let r2: Decimal = Decimal.tanh('1').mul(new Decimal(3));
      let a2: string = r2.toSignificantDigits(15).toString();
      let e2: string = '2.28478246786729';
      expect(a2).assertEqual(e2);

      // 3. Decimal.tanh('+1') = '0.761594155955765' (15 sig digits)
      let r3: Decimal = Decimal.tanh('+1');
      let a3: string = r3.toSignificantDigits(15).toString();
      let e3: string = '0.761594155955765';
      expect(a3).assertEqual(e3);

      // 4. Decimal.tanh('-0.5') = '-0.46211715726001' (15 sig digits)
      let r4: Decimal = Decimal.tanh('-0.5');
      let a4: string = r4.toSignificantDigits(15).toString();
      let e4: string = '-0.46211715726001';
      expect(a4).assertEqual(e4);

      // 5. Decimal.tanh('100') = '1' and not greater than 1
      let r5: Decimal = Decimal.tanh('100');
      let a5a: string = r5.toString();
      let e5a: string = '1';
      expect(a5a).assertEqual(e5a);
      let a5b: boolean = r5.greaterThan(new Decimal(1));
      expect(a5b).assertFalse();

      // 6. Decimal.tanh('1e-1') equals Decimal.tanh('0.1')
      let sci6: Decimal = Decimal.tanh('1e-1');
      let dec6: Decimal = Decimal.tanh('0.1');
      let a6: boolean = sci6.equals(dec6);
      expect(a6).assertTrue();

      // 7. Decimal.tanh('1e-30') equals Decimal('1e-30')
      let r7: Decimal = Decimal.tanh('1e-30');
      let a7: boolean = r7.equals(new Decimal('1e-30'));
      expect(a7).assertTrue();

      // 8. Decimal.tanh('5e1') rounds to '1' at default precision
      Decimal.set({ defaults: true });
      let r8: Decimal = Decimal.tanh('5e1');
      let a8: string = r8.toString();
      let e8: string = '1';
      expect(a8).assertEqual(e8);
      Decimal.set({ defaults: true });

      // 9. Decimal.tanh accepts a 10000-character zero-padded string representing 50
      Decimal.set({ defaults: true });
      let longVal9: string = '0'.repeat(9998) + '50';
      let a9a: int = longVal9.length;
      let e9a: int = 10000;
      expect(a9a).assertEqual(e9a);
      let r9: Decimal = Decimal.tanh(longVal9);
      let a9b: string = r9.toString();
      let e9b: string = '1';
      expect(a9b).assertEqual(e9b);
      Decimal.set({ defaults: true });

      // 10. Decimal.tanh(-0) isZero and isNegative
      let r10: Decimal = Decimal.tanh(-0);
      let a10a: boolean = r10.isZero();
      expect(a10a).assertTrue();
      let a10b: boolean = r10.isNegative();
      expect(a10b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0700
     * @tc.name decimalTanhTest007
     * @tc.desc Static method doubles Decimals and equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(0.5) = '0.46211715726001' (15 sig digits)
      let r1: Decimal = Decimal.tanh(0.5);
      let a1: string = r1.toSignificantDigits(15).toString();
      let e1: string = '0.46211715726001';
      expect(a1).assertEqual(e1);

      // 2. Decimal.tanh(-0.25) = '-0.244918662403709' (15 sig digits)
      let r2: Decimal = Decimal.tanh(-0.25);
      let a2: string = r2.toSignificantDigits(15).toString();
      let e2: string = '-0.244918662403709';
      expect(a2).assertEqual(e2);

      // 3. Decimal.tanh(0.1+0.2) > '0.291312' and < '0.291313'
      let r3: Decimal = Decimal.tanh(0.1 + 0.2);
      let a3a: boolean = r3.greaterThan(new Decimal('0.291312'));
      expect(a3a).assertTrue();
      let a3b: boolean = r3.lessThan(new Decimal('0.291313'));
      expect(a3b).assertTrue();

      // 4. Decimal.tanh(5e-324) > 0 and < '1e-320'
      let r4: Decimal = Decimal.tanh(5e-324);
      let a4a: boolean = r4.greaterThan(new Decimal(0));
      expect(a4a).assertTrue();
      let a4b: boolean = r4.lessThan(new Decimal('1e-320'));
      expect(a4b).assertTrue();

      // 5. Decimal.tanh(Decimal('-1')) = '-0.761594155955765' (15 sig digits)
      let src5: Decimal = new Decimal('-1');
      let r5: Decimal = Decimal.tanh(src5);
      let a5: string = r5.toSignificantDigits(15).toString();
      let e5: string = '-0.761594155955765';
      expect(a5).assertEqual(e5);

      // 6. Decimal.tanh(Decimal('0.25')) = '0.244918662403709' (15 sig digits)
      let src6: Decimal = new Decimal('0.25');
      let r6: Decimal = Decimal.tanh(src6);
      let a6: string = r6.toSignificantDigits(15).toString();
      let e6: string = '0.244918662403709';
      expect(a6).assertEqual(e6);

      // 7. Source Decimal unchanged after Decimal.tanh
      let src7: Decimal = new Decimal('3');
      let before7: string = src7.toString();
      Decimal.tanh(src7);
      let a7: string = src7.toString();
      let e7: string = before7;
      expect(a7).assertEqual(e7);

      // 8. Static vs instance tanh('1') toString equal
      let st8: Decimal = Decimal.tanh('1');
      let inst8: Decimal = new Decimal('1').tanh();
      let a8: string = st8.toString();
      let e8: string = inst8.toString();
      expect(a8).assertEqual(e8);

      // 9. Static vs instance tanh(-1) toString equal
      let a9: string = Decimal.tanh(-1).toString();
      let e9: string = new Decimal(-1).tanh().toString();
      expect(a9).assertEqual(e9);

      // 10. Static vs instance tanh('0.5') equals
      let st10: Decimal = Decimal.tanh('0.5');
      let inst10: Decimal = new Decimal('0.5').tanh();
      let a10: boolean = st10.equals(inst10);
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0800
     * @tc.name decimalTanhTest008
     * @tc.desc Static method special values and invalid inputs (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(NaN) and instance tanh(NaN) both isNaN
      let st1: Decimal = Decimal.tanh(Number.NaN);
      let inst1: Decimal = new Decimal(Number.NaN).tanh();
      let a1a: boolean = st1.isNaN();
      expect(a1a).assertTrue();
      let a1b: boolean = inst1.isNaN();
      expect(a1b).assertTrue();

      // 2. Decimal.tanh(-Infinity) equals instance tanh(-Infinity)
      let a2: string = Decimal.tanh(-Number.POSITIVE_INFINITY).toString();
      let e2: string = new Decimal(-Number.POSITIVE_INFINITY).tanh().toString();
      expect(a2).assertEqual(e2);

      // 3. Decimal.tanh('   ') (spaces) throws error 401
      let ws3: string = ' ';
      let spaces3: string = ws3 + ws3 + ws3;
      try {
        Decimal.tanh(spaces3);
        expect().assertFail();
      } catch (err3) {
        expect(err3.code).assertEqual(401);
      }

      // 4. Decimal.tanh('0x10') = '0.99999999999997467167'
      let res4: Decimal = Decimal.tanh('0x10');
      let a4: string = res4.toString();
      let e4: string = '0.99999999999997467167';
      expect(a4).assertEqual(e4);

      // 5. Decimal.tanh('0b101') = '0.99990920426259513121'
      let res5: Decimal = Decimal.tanh('0b101');
      let a5: string = res5.toString();
      let e5: string = '0.99990920426259513121';
      expect(a5).assertEqual(e5);

      // 6. Decimal.tanh('中文') throws error 401
      try {
        Decimal.tanh('中文');
        expect().assertFail();
      } catch (err6) {
        expect(err6.code).assertEqual(401);
      }

      // 7. Decimal.tanh('😀') throws error 401
      try {
        Decimal.tanh('😀');
        expect().assertFail();
      } catch (err7) {
        expect(err7.code).assertEqual(401);
      }

      // 8. Decimal.tanh('\u200B123') (zero-width char) throws error 401
      try {
        Decimal.tanh('\u200B123');
        expect().assertFail();
      } catch (err8) {
        expect(err8.code).assertEqual(401);
      }

      // 9. Decimal.tanh('<script>alert(1)</script>') throws error 401
      try {
        Decimal.tanh('<script>alert(1)</script>');
        expect().assertFail();
      } catch (err9) {
        expect(err9.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_0900
     * @tc.name decimalTanhTest009
     * @tc.desc Static method basic values and metadata (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(0.9) = '0.71629787019902442081'
      let v1: Decimal = Decimal.tanh(0.9);
      let a1: string = v1.toString();
      let e1: string = '0.71629787019902442081';
      expect(a1).assertEqual(e1);

      // 2. Decimal.tanh(0.5).negate() = '-0.4621171572600097585'
      let v2: Decimal = Decimal.tanh(0.5);
      let a2: string = v2.negate().toString();
      let e2: string = '-0.4621171572600097585';
      expect(a2).assertEqual(e2);

      // 3. Decimal.tanh('-0.9') = '-0.71629787019902442081'
      let v3: Decimal = Decimal.tanh('-0.9');
      let a3: string = v3.toString();
      let e3: string = '-0.71629787019902442081';
      expect(a3).assertEqual(e3);

      // 4. Decimal.tanh(1) < Decimal.tanh(2)
      let a4dec: Decimal = Decimal.tanh(1);
      let b4dec: Decimal = Decimal.tanh(2);
      let lt4: number = a4dec.comparedTo(b4dec);
      expect(lt4).assertEqual(-1);

      // 5. Decimal.tanh(0).valueOf() = '0'
      let v5: Decimal = Decimal.tanh(0);
      let a5: string = v5.valueOf();
      let e5: string = '0';
      expect(a5).assertEqual(e5);

      // 6. Decimal.tanh(-0).valueOf() = '-0'
      let v6: Decimal = Decimal.tanh(-0);
      let a6: string = v6.valueOf();
      let e6: string = '-0';
      expect(a6).assertEqual(e6);

      // 7. Decimal.tanh(-2) = '-0.96402758007581688395'
      let v7: Decimal = Decimal.tanh(-2);
      let a7: string = v7.toString();
      let e7: string = '-0.96402758007581688395';
      expect(a7).assertEqual(e7);

      // 8. Decimal.tanh('1e-10') = '1e-10'
      let tinyInputTanh: Decimal = Decimal.tanh('1e-10');
      let a8: string = tinyInputTanh.toString();
      let e8: string = '1e-10';
      expect(a8).assertEqual(e8);

      // 9. Decimal.tanh(Decimal(2)) = '0.96402758007581688395'
      let x9: Decimal = new Decimal(2);
      let v9: Decimal = Decimal.tanh(x9);
      let a9: string = v9.toString();
      let e9: string = '0.96402758007581688395';
      expect(a9).assertEqual(e9);

      // 10. Decimal.tanh(0.5).d not null and d[0] = 4621171
      let v10: Decimal = Decimal.tanh(0.5);
      let digits10: Array<double> | null = v10.d;
      expect(digits10).not().assertNull();
      let head10: double = digits10![0];
      expect(head10).assertEqual(4621171);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_1000
     * @tc.name decimalTanhTest010
     * @tc.desc Static method sign and source immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(1).e = -1
      let v1: Decimal = Decimal.tanh(1);
      let exp1: double = v1.e;
      expect(exp1).assertEqual(-1);

      // 2. Decimal.tanh(-1).s = -1
      let v2: Decimal = Decimal.tanh(-1);
      let s2: double = v2.s;
      expect(s2).assertEqual(-1);

      // 3. Decimal.tanh(1).s = 1
      let v3: Decimal = Decimal.tanh(1);
      let s3: double = v3.s;
      expect(s3).assertEqual(1);

      // 4. Decimal.tanh('-123.456') sign = -1
      let v4: Decimal = Decimal.tanh('-123.456');
      let neg4: number = Decimal.sign(v4);
      expect(neg4).assertEqual(-1);

      // 5. Decimal.tanh('123.456') sign = 1
      let v5: Decimal = Decimal.tanh('123.456');
      let pos5: number = Decimal.sign(v5);
      expect(pos5).assertEqual(1);

      // 6. Decimal.tanh(0.5) isPositive and comparedTo(1) = -1
      let v6: Decimal = Decimal.tanh(0.5);
      let isPos6: boolean = v6.isPositive();
      expect(isPos6).assertTrue();
      let c6: number = v6.comparedTo(1);
      expect(c6).assertEqual(-1);

      // 7. Decimal.tanh(-0.5) isNegative and comparedTo(-1) = 1
      let v7: Decimal = Decimal.tanh(-0.5);
      let isNeg7: boolean = v7.isNegative();
      expect(isNeg7).assertTrue();
      let c7: number = v7.comparedTo(-1);
      expect(c7).assertEqual(1);

      // 8. Decimal.tanh(2) close to Math.tanh(2) within 0.001
      let tanhForMathComparison: Decimal = Decimal.tanh(2);
      let approx8: number = Math.tanh(2);
      let approximationValue: Decimal = new Decimal(approx8);
      let diff8: number = tanhForMathComparison.sub(approximationValue).abs().comparedTo(0.001);
      expect(diff8).assertEqual(-1);

      // 9. Decimal.tanh(0.1).toNumber() = 0.09966799462495582
      let v9: Decimal = Decimal.tanh(0.1);
      let n9: number = v9.toNumber();
      expect(n9).assertEqual(0.09966799462495582);

      // 10. Decimal.tanh(Decimal(0.7)) - source unchanged and result isFinite
      let x10: Decimal = new Decimal(0.7);
      let before10: string = x10.valueOf();
      let v10: Decimal = Decimal.tanh(x10);
      let after10: string = x10.valueOf();
      expect(before10).assertEqual('0.7');
      expect(after10).assertEqual('0.7');
      let a10: boolean = v10.isFinite();
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TANH_1100
     * @tc.name decimalTanhTest011
     * @tc.desc Static method immutability precision and properties (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('decimalTanhTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.tanh(Decimal(-2)) - source sign unchanged and result isFinite
      let x1: Decimal = new Decimal(-2);
      let before1: number = Decimal.sign(x1);
      let v1: Decimal = Decimal.tanh(x1);
      let after1: number = Decimal.sign(x1);
      expect(before1).assertEqual(-1);
      expect(after1).assertEqual(-1);
      let a1: boolean = v1.isFinite();
      expect(a1).assertTrue();

      // 2. Decimal.tanh(Decimal(5)) - source .d unchanged and result isFinite
      let x2: Decimal = new Decimal(5);
      let before2: Array<double> | null = x2.d;
      let v2: Decimal = Decimal.tanh(x2);
      let after2: Array<double> | null = x2.d;
      expect(before2).assertEqual(after2);
      let a2: boolean = v2.isFinite();
      expect(a2).assertTrue();

      // 3. Decimal.tanh(Decimal(3)) - source .e unchanged and result isFinite
      let x3: Decimal = new Decimal(3);
      let before3: double = x3.e;
      let v3: Decimal = Decimal.tanh(x3);
      let after3: double = x3.e;
      expect(before3).assertEqual(after3);
      let a3: boolean = v3.isFinite();
      expect(a3).assertTrue();

      // 4. Decimal.tanh(Decimal(2)) - source .d != result .d
      let x4: Decimal = new Decimal(2);
      let v4: Decimal = Decimal.tanh(x4);
      let a4a: Array<double> | null = x4.d;
      let a4b: Array<double> | null = v4.d;
      expect(a4a).not().assertEqual(a4b);

      // 5. Decimal.tanh(1) at precisions 10 and 30
      let precs5: int[] = [10, 30];
      let expVals5: string[] = ['0.761594156', '0.761594155955764888119458282605'];
      for (let idx5: int = 0; idx5 < precs5.length; idx5++) {
        Decimal.set({ precision: precs5[idx5] });
        let v5: Decimal = Decimal.tanh(1);
        let a5: string = v5.toString();
        expect(a5).assertEqual(expVals5[idx5]);
        Decimal.set({ defaults: true });
      }

      // 6. Decimal.tanh(2) at precision 30
      Decimal.set({ precision: 30 });
      let v6: Decimal = Decimal.tanh(2);
      let a6: string = v6.toString();
      let e6: string = '0.964027580075816883946413724101';
      expect(a6).assertEqual(e6);
      Decimal.set({ defaults: true });

      // 7. Decimal.tanh('1e-10').e = -10
      let v7: Decimal = Decimal.tanh('1e-10');
      let exp7: double = v7.e;
      expect(exp7).assertEqual(-10);

      // 8. Decimal.tanh(0.5).d.length = 3
      let tanhForCoefficientCheck: Decimal = Decimal.tanh(0.5);
      let digits8: Array<double> | null = tanhForCoefficientCheck.d;
      expect(digits8).not().assertNull();
      let len8: number = digits8!.length;
      expect(len8).assertEqual(3);
    });
  });
}
