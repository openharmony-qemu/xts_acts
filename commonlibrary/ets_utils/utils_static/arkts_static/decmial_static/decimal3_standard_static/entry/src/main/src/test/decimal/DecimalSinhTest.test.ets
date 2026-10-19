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
} from '../../../../hypium/index';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';

export default function decimalSinhTest(): void {
  describe('DecimalSinhTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0100
     * @tc.name decimalSinhTest001
     * @tc.desc Zero and negative-zero inputs (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(0) returns '0'
      let r1: string = new Decimal(0).sinh().toString();
      expect(r1).assertEqual('0');
      // 2. sinh('0') returns '0'
      let r2: string = new Decimal('0').sinh().toString();
      expect(r2).assertEqual('0');
      // 3. sinh('0.00') returns '0'
      let r3: string = new Decimal('0.00').sinh().toString();
      expect(r3).assertEqual('0');
      // 4. sinh('-0') returns '0'
      let r4: string = new Decimal('-0').sinh().toString();
      expect(r4).assertEqual('0');
      // 5. sinh('-0') is negative
      let r5: boolean = new Decimal('-0').sinh().isNegative();
      expect(r5).assertTrue();
      // 6. sinh('-0') equals sinh('0')
      let r6: boolean = new Decimal('-0').sinh().equals(new Decimal('0').sinh());
      expect(r6).assertTrue();
      // 7. sinh('0') is zero
      let r7: boolean = new Decimal('0').sinh().isZero();
      expect(r7).assertTrue();
      // 8. sinh(5e-324) is not zero and not negative
      let r8: Decimal = new Decimal(5e-324).sinh();
      expect(r8.isZero()).assertFalse();
      expect(r8.isNegative()).assertFalse();
      // 9. Decimal.sinh(0) is integer
      let r9: boolean = Decimal.sinh(0).isInteger();
      expect(r9).assertTrue();
      // 10. Decimal.sinh(0) toNumber is 0
      let r10: number = Decimal.sinh(0).toNumber();
      expect(r10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0200
     * @tc.name decimalSinhTest002
     * @tc.desc Basic positive value output (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(0.5) plus 1
      let r1: Decimal = new Decimal('0.5').sinh();
      let a1: string = r1.add(new Decimal('1')).toString();
      expect(a1).assertEqual('1.5210953054937473616');
      // 2. sinh('2.000...001') toString
      let a2: string = new Decimal('2.000000000000000000000000000000000000000001').sinh().toString();
      expect(a2).assertEqual('3.6268604078470187677');
      // 3. sinh(0.5) not equal to source
      let src3: Decimal = new Decimal('0.5');
      let r3: Decimal = src3.sinh();
      expect(r3).not().assertEqual(src3);
      // 4. sinh(0.5) leaves source unchanged
      let d4: Decimal = new Decimal('0.5');
      let r4: Decimal = d4.sinh();
      expect(d4.toString()).assertEqual('0.5');
      expect(r4.toString()).assertEqual('0.52109530549374736162');
      // 5. sinh(1) toNumber
      let a5: number = new Decimal('1').sinh().toNumber();
      expect(a5).assertEqual(1.1752011936438014);
      // 6. sinh(2) comparedTo reference
      let cmp6: double = new Decimal('2').sinh().comparedTo(new Decimal('3.6268604078470187677'));
      expect(cmp6).assertEqual(0);
      // 7. sinh(1) equals reference
      let a7: boolean = new Decimal('1').sinh().equals(new Decimal('1.1752011936438014569'));
      expect(a7).assertTrue();
      // 8. sinh(3) isPositive
      let a8: boolean = new Decimal('3').sinh().isPositive();
      expect(a8).assertTrue();
      // 9. sinh(0.1) comparedTo 1
      let cmp9: double = new Decimal('0.1').sinh().comparedTo(new Decimal('1'));
      expect(cmp9).assertEqual(-1);
      // 10. sinh(0.3) comparedTo 0
      let a10: number = new Decimal('0.3').sinh().comparedTo(new Decimal('0'));
      expect(a10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0300
     * @tc.name decimalSinhTest003
     * @tc.desc Negative inputs and odd-function property (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(-0.5) toString
      let a1: string = new Decimal('-0.5').sinh().toString();
      expect(a1).assertEqual('-0.52109530549374736162');
      // 2. sinh(-1) plus sinh(1) equals 0
      let sum2: Decimal = new Decimal('-1').sinh().add(new Decimal('1').sinh());
      let a2: number = sum2.comparedTo(new Decimal('0'));
      expect(a2).assertEqual(0);
      // 3. sinh(-1.75) plus sinh(1.75) equals '0'
      let a3: string = new Decimal('-1.75').sinh().add(new Decimal('1.75').sinh()).toString();
      expect(a3).assertEqual('0');
      // 4. sign of sinh(-0.3) is -1
      let sign4: double = Decimal.sign(new Decimal('-0.3').sinh());
      expect(sign4).assertEqual(-1);
      // 5. sinh(-0.7) is not positive
      let a5: boolean = new Decimal('-0.7').sinh().isPositive();
      expect(a5).assertFalse();
      // 6. sinh(2) plus sinh(-2) is zero
      let sum6: Decimal = new Decimal('2').sinh().add(new Decimal('-2').sinh());
      expect(sum6.isZero()).assertTrue();
      // 7. sinh(0.5).negate() toString
      let a7: string = new Decimal('0.5').sinh().negate().toString();
      expect(a7).assertEqual('-0.52109530549374736162');
      // 8. sinh(-0.5).abs() toString
      let a8: string = new Decimal('-0.5').sinh().abs().toString();
      expect(a8).assertEqual('0.52109530549374736162');
      // 9. sinh(1).negate() is negative
      let a9: boolean = new Decimal('1').sinh().negate().isNegative();
      expect(a9).assertTrue();
      // 10. Decimal.sinh('-0.5') equals -Decimal.sinh('0.5')
      let cmp10: double = Decimal.sinh('-0.5').comparedTo(Decimal.sinh('0.5').negate());
      expect(cmp10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0400
     * @tc.name decimalSinhTest004
     * @tc.desc Math.sinh cross-validation and numeric input equivalence (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(0.05) approximates Math.sinh(0.05)
      let c1: double = new Decimal('0.05').sinh().toNumber();
      expect(Math.abs(c1 - Math.sinh(0.05))).assertLess(1e-15);
      // 2. sinh(0.7) approximates Math.sinh(0.7)
      let c2: double = new Decimal('0.7').sinh().toNumber();
      expect(Math.abs(c2 - Math.sinh(0.7))).assertLess(1e-15);
      // 3. sinh(2.5) toNumber equals 6.0502044810397875
      let c3: double = new Decimal('2.5').sinh().toNumber();
      expect(Math.abs(c3 - 6.0502044810397875)).assertLess(1e-14);
      // 4. sinh(0.1+0.2) equals sinh('0.30000000000000004')
      let ds4: Decimal = new Decimal(0.1 + 0.2).sinh();
      let dd4: Decimal = new Decimal('0.30000000000000004').sinh();
      expect(ds4.equals(dd4)).assertTrue();
      // 5. Decimal.sinh(0.1+0.2) approximates Math.sinh(0.1+0.2)
      let c5: double = Decimal.sinh(0.1 + 0.2).toNumber();
      expect(Math.abs(c5 - Math.sinh(0.1 + 0.2))).assertLess(1e-15);
      // 6. Decimal.sinh('1') toNumber approximates 1.1752011936438014
      let c6: double = Decimal.sinh('1').toNumber();
      expect(Math.abs(c6 - 1.1752011936438014)).assertLess(1e-15);
      // 7. Decimal.sinh('+1') equals Decimal.sinh('1')
      let a7: string = Decimal.sinh('+1').toString();
      let e7: string = Decimal.sinh('1').toString();
      expect(a7).assertEqual(e7);
      // 8. Decimal.sinh(1) equals Decimal.sinh('1')
      let a8: string = Decimal.sinh(1).toString();
      let e8: string = Decimal.sinh('1').toString();
      expect(a8).assertEqual(e8);
      // 9. Decimal.sinh(-2) equals Decimal.sinh('-2')
      let a9: string = Decimal.sinh(-2).toString();
      let e9: string = Decimal.sinh('-2').toString();
      expect(a9).assertEqual(e9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0500
     * @tc.name decimalSinhTest005
     * @tc.desc Numeric string notation hex, binary and exponent forms (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh('1e1') equals sinh(10)
      let a1: boolean = new Decimal('1e1').sinh().equals(new Decimal(10).sinh());
      expect(a1).assertTrue();
      // 2. sinh('1E-2') equals sinh('0.01')
      let a2: boolean = new Decimal('1E-2').sinh().equals(new Decimal('0.01').sinh());
      expect(a2).assertTrue();
      // 3. sinh('0x10') equals sinh(16)
      let a3: boolean = new Decimal('0x10').sinh().equals(new Decimal(16).sinh());
      expect(a3).assertTrue();
      // 4. sinh('0b101') equals sinh(5)
      let a4: boolean = new Decimal('0b101').sinh().equals(new Decimal(5).sinh());
      expect(a4).assertTrue();
      // 5. sinh(0xa) equals sinh(10)
      let a5: boolean = new Decimal(0xa).sinh().equals(new Decimal(10).sinh());
      expect(a5).assertTrue();
      // 6. Decimal.sinh('0x10') toString
      let r6: string = Decimal.sinh('0x10').toString();
      expect(r6).assertEqual('4443055.2602538800508');
      // 7. Decimal.sinh('0b101') toString
      let r7: string = Decimal.sinh('0b101').toString();
      expect(r7).assertEqual('74.203210577788758977');
      // 8. Decimal.sinh('1e-6') is between 0.000001 and 0.000001000001
      let lo8: double = Decimal.sinh('1e-6').comparedTo(new Decimal('0.000001'));
      let hi8: double = Decimal.sinh('1e-6').comparedTo(new Decimal('0.000001000001'));
      expect(lo8).assertLarger(0);
      expect(hi8).assertLess(0);
      // 9. Decimal.sinh('1e2') comparedTo 1e42 is larger
      let cmp9: double = Decimal.sinh('1e2').comparedTo(new Decimal('1e42'));
      expect(cmp9).assertLarger(0);
      // 10. Decimal.sinh('1e4') is finite and positive
      let r10: Decimal = Decimal.sinh('1e4');
      expect(r10.isFinite()).assertTrue();
      expect(r10.isPositive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0600
     * @tc.name decimalSinhTest006
     * @tc.desc NaN, Infinity and finiteness boundary (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh('NaN') isNaN
      let a1: boolean = new Decimal('NaN').sinh().isNaN();
      expect(a1).assertTrue();
      // 2. sinh('NaN') is not finite
      let d2: Decimal = new Decimal('NaN').sinh();
      expect(d2.isFinite()).assertFalse();
      // 3. sinh('NaN') comparedTo 1 is NaN
      let d3: Decimal = new Decimal('NaN').sinh();
      let cmp3: double = d3.comparedTo(new Decimal('1'));
      expect(isNaN(cmp3)).assertTrue();
      // 4. sinh(Infinity) is not finite and not NaN
      let r4: Decimal = new Decimal(Number.POSITIVE_INFINITY).sinh();
      expect(!r4.isFinite()).assertTrue();
      expect(r4.isNaN()).assertFalse();
      // 5. sinh(-Infinity) is not finite and is negative
      let r5: Decimal = new Decimal(-Number.POSITIVE_INFINITY).sinh();
      expect(!r5.isFinite()).assertTrue();
      expect(r5.isNegative()).assertTrue();
      // 6. sinh('Infinity') toString
      let a6: string = new Decimal('Infinity').sinh().toString();
      expect(a6).assertEqual('Infinity');
      // 7. sinh('-Infinity') toString
      let a7: string = new Decimal('-Infinity').sinh().toString();
      expect(a7).assertEqual('-Infinity');
      // 8. sinh(Infinity) comparedTo 1e100 is 1
      let cmp8: double = new Decimal(Number.POSITIVE_INFINITY).sinh().comparedTo(new Decimal('1e100'));
      expect(cmp8).assertEqual(1);
      // 9. sinh(709) is finite
      let a9: boolean = new Decimal('709').sinh().isFinite();
      expect(a9).assertTrue();
      // 10. sinh(-709) is finite
      let a10: boolean = new Decimal('-709').sinh().isFinite();
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0700
     * @tc.name decimalSinhTest007
     * @tc.desc maxE=20 overflow on the positive side (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(50) overflows to Infinity with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let input1: double = 50;
      expect(new Decimal(input1).isFinite()).assertTrue();
      let a1: string = new Decimal(input1).sinh().toString();
      expect(a1).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      // 2. sinh(48) stays finite with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a2: boolean = new Decimal('48').sinh().isFinite();
      expect(a2).assertTrue();
      Decimal.set({ defaults: true });
      // 3. sinh('50') toString Infinity with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a3: string = new Decimal('50').sinh().toString();
      expect(a3).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      // 4. sinh('5.2e1') overflows to Infinity with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let input4: Decimal = new Decimal('5.2e1');
      expect(input4.isFinite()).assertTrue();
      let a4: string = input4.sinh().toString();
      expect(a4).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      // 5. sinh(49) finite and sinh(50) overflows with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a5: Decimal = new Decimal('49').sinh();
      let b5: Decimal = new Decimal('50').sinh();
      expect(a5.isFinite()).assertTrue();
      expect(b5.toString()).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      // 6. sinh(50) overflow equals 1/0 with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let inf6: Decimal = new Decimal('50').sinh();
      let ref6: Decimal = new Decimal(1).div(0);
      expect(inf6.equals(ref6)).assertTrue();
      Decimal.set({ defaults: true });
      // 7. sinh(50) overflow sign is 1 with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let r7: Decimal = new Decimal('50').sinh();
      let s7: number = r7.s;
      expect(s7).assertEqual(1);
      Decimal.set({ defaults: true });
      // 8. sinh(50) overflow isPositive with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a8: boolean = new Decimal('50').sinh().isPositive();
      expect(a8).assertTrue();
      Decimal.set({ defaults: true });
      // 9. sinh(Infinity) equals sinh(50) overflow with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a9: Decimal = new Decimal(Number.POSITIVE_INFINITY).sinh();
      let b9: Decimal = new Decimal('50').sinh();
      expect(a9.equals(b9)).assertTrue();
      Decimal.set({ defaults: true });
      // 10. sinh(50) overflow is not finite and not NaN with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let d10: Decimal = new Decimal('50').sinh();
      expect(d10.isFinite()).assertFalse();
      expect(d10.isNaN()).assertFalse();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0800
     * @tc.name decimalSinhTest008
     * @tc.desc maxE=20 overflow on the negative side and static negative sign (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(-50) overflows to -Infinity with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let input1: Decimal = new Decimal(-50);
      expect(input1.isFinite()).assertTrue();
      let a1: string = input1.sinh().toString();
      expect(a1).assertEqual('-Infinity');
      Decimal.set({ defaults: true });
      // 2. sinh('-50') toString -Infinity with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a2: string = new Decimal('-50').sinh().toString();
      expect(a2).assertEqual('-Infinity');
      Decimal.set({ defaults: true });
      // 3. sinh(-50) overflow equals 1/(-0) with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let ninf3: Decimal = new Decimal('-50').sinh();
      let ref3: Decimal = new Decimal(1).div(new Decimal('-0'));
      expect(ninf3.equals(ref3)).assertTrue();
      Decimal.set({ defaults: true });
      // 4. sinh(-50) overflow sign is -1 with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let r4: Decimal = new Decimal('-50').sinh();
      let s4: number = r4.s;
      expect(s4).assertEqual(-1);
      Decimal.set({ defaults: true });
      // 5. sinh(-Infinity) equals sinh(-50) overflow with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let a5: Decimal = new Decimal(-Number.POSITIVE_INFINITY).sinh();
      let b5: Decimal = new Decimal('-50').sinh();
      expect(a5.equals(b5)).assertTrue();
      Decimal.set({ defaults: true });
      // 6. Decimal.sinh(50) is not NaN with maxE=20
      Decimal.set({ defaults: true, maxE: 20 });
      let input6: double = 50;
      expect(new Decimal(input6).isFinite()).assertTrue();
      let r6: Decimal = Decimal.sinh(input6);
      expect(r6.isNaN()).assertFalse();
      Decimal.set({ defaults: true });
      // 7. Decimal.sinh(-1) toString
      let r7: string = Decimal.sinh(-1).toString();
      expect(r7).assertEqual('-1.1752011936438014569');
      // 8. Decimal.sinh(-1) sign is -1
      let r8: Decimal = Decimal.sinh(-1);
      let s8: number = r8.s;
      expect(s8).assertEqual(-1);
      // 9. Decimal.sinh(-1) isNegative
      let a9: boolean = Decimal.sinh(-1).isNegative();
      expect(a9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_0900
     * @tc.name decimalSinhTest009
     * @tc.desc Precision configuration (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision 20 ROUND_HALF_UP sinh(0.5)
      Decimal.set({ precision: 20, rounding: Decimal.ROUND_HALF_UP });
      let a1: string = new Decimal('0.5').sinh().toString();
      expect(a1).assertEqual('0.52109530549374736162');
      Decimal.set({ defaults: true });
      // 2. sinh(0.5) at precisions 10, 8, 6, 5, 25
      let precisions2: int[] = [10, 8, 6, 5, 25];
      let expectedValues2: string[] = ['0.5210953055', '0.52109531', '0.521095', '0.5211', '0.5210953054937473616224256'];
      for (let index2: int = 0; index2 < precisions2.length; index2++) {
        Decimal.set({ precision: precisions2[index2] });
        let a2: string = new Decimal('0.5').sinh().toString();
        expect(a2).assertEqual(expectedValues2[index2]);
        Decimal.set({ defaults: true });
      }
      // 3. sinh(1) at precisions 7, 5, 4, 3, 2, 1
      let precisions3: int[] = [7, 5, 4, 3, 2, 1];
      let expectedValues3: string[] = ['1.175201', '1.1752', '1.175', '1.18', '1.2', '1'];
      for (let index3: int = 0; index3 < precisions3.length; index3++) {
        Decimal.set({ precision: precisions3[index3] });
        let a3: string = new Decimal('1').sinh().toString();
        expect(a3).assertEqual(expectedValues3[index3]);
        Decimal.set({ defaults: true });
      }
      // 4. precision 3 sinh(2)
      Decimal.set({ precision: 3 });
      let a4: string = new Decimal('2').sinh().toString();
      expect(a4).assertEqual('3.63');
      Decimal.set({ defaults: true });
      // 5. precision 50 sinh(1) digit length 8
      Decimal.set({ precision: 50 });
      let a5: int = new Decimal('1').sinh().d!.length;
      expect(a5).assertEqual(8);
      Decimal.set({ defaults: true });
      // 6. precision 100 sinh(0.5) prefix
      Decimal.set({ precision: 100 });
      let s6: string = new Decimal('0.5').sinh().toString();
      expect(s6.startsWith('0.52109530549374736162242562641149')).assertTrue();
      Decimal.set({ defaults: true });
      // 7. precision 40 sinh(0.5)
      Decimal.set({ defaults: true, precision: 40 });
      let a7: string = new Decimal('0.5').sinh().toString();
      expect(a7).assertEqual('0.5210953054937473616224256264114915591059');
      Decimal.set({ defaults: true });
      // 8. precision 5 ROUND_HALF_UP then defaults for sinh(0.5)
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_HALF_UP });
      let a8: string = new Decimal('0.5').sinh().toString();
      expect(a8).assertEqual('0.5211');
      Decimal.set({ defaults: true });
      let b8: string = new Decimal('0.5').sinh().toString();
      expect(b8).assertEqual('0.52109530549374736162');
      // 9. sinh(0.5) digit length 3 at default precision
      let a9: int = new Decimal('0.5').sinh().d!.length;
      expect(a9).assertEqual(3);
      // 10. precision 5 Decimal.sinh('0.5') digit length 1
      Decimal.set({ precision: 5 });
      let r10: Decimal = Decimal.sinh('0.5');
      let a10: int = r10.d!.length;
      expect(a10).assertEqual(1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1000
     * @tc.name decimalSinhTest010
     * @tc.desc Rounding modes for sinh(1) at precision 6 (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision 6 ROUND_UP sinh(1)
      Decimal.set({ precision: 6, rounding: 0 });
      let a1: string = new Decimal('1').sinh().toString();
      expect(a1).assertEqual('1.17521');
      Decimal.set({ defaults: true });
      // 2. precision 6 ROUND_DOWN sinh(1)
      Decimal.set({ precision: 6, rounding: 1 });
      let a2: string = new Decimal('1').sinh().toString();
      expect(a2).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 3. precision 6 ROUND_CEIL sinh(1)
      Decimal.set({ precision: 6, rounding: 2 });
      let a3: string = new Decimal('1').sinh().toString();
      expect(a3).assertEqual('1.17521');
      Decimal.set({ defaults: true });
      // 4. precision 6 ROUND_FLOOR sinh(1)
      Decimal.set({ precision: 6, rounding: 3 });
      let a4: string = new Decimal('1').sinh().toString();
      expect(a4).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 5. precision 6 ROUND_HALF_UP sinh(1)
      Decimal.set({ precision: 6, rounding: 4 });
      let a5: string = new Decimal('1').sinh().toString();
      expect(a5).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 6. precision 6 ROUND_HALF_DOWN sinh(1)
      Decimal.set({ precision: 6, rounding: 5 });
      let a6: string = new Decimal('1').sinh().toString();
      expect(a6).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 7. precision 6 ROUND_HALF_EVEN sinh(1)
      Decimal.set({ precision: 6, rounding: 6 });
      let a7: string = new Decimal('1').sinh().toString();
      expect(a7).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 8. precision 6 ROUND_HALF_CEIL sinh(1)
      Decimal.set({ precision: 6, rounding: 7 });
      let a8: string = new Decimal('1').sinh().toString();
      expect(a8).assertEqual('1.1752');
      Decimal.set({ defaults: true });
      // 9. precision 6 ROUND_HALF_FLOOR sinh(1)
      Decimal.set({ precision: 6, rounding: 8 });
      let a9: string = new Decimal('1').sinh().toString();
      expect(a9).assertEqual('1.1752');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1100
     * @tc.name decimalSinhTest011
     * @tc.desc Rounding for sinh(-1)/sinh(2) and fixed-precision output formatting (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision 6 ROUND_FLOOR sinh(-1)
      Decimal.set({ precision: 6, rounding: 3 });
      let a1: string = new Decimal('-1').sinh().toString();
      expect(a1).assertEqual('-1.17521');
      Decimal.set({ defaults: true });
      // 2. precision 6 ROUND_CEIL sinh(-1)
      Decimal.set({ precision: 6, rounding: 2 });
      let a2: string = new Decimal('-1').sinh().toString();
      expect(a2).assertEqual('-1.1752');
      Decimal.set({ defaults: true });
      // 3. precision 6 ROUND_UP sinh(-1)
      Decimal.set({ precision: 6, rounding: 0 });
      let a3: string = new Decimal('-1').sinh().toString();
      expect(a3).assertEqual('-1.17521');
      Decimal.set({ defaults: true });
      // 4. precision 6 ROUND_DOWN sinh(-1)
      Decimal.set({ precision: 6, rounding: 1 });
      let a4: string = new Decimal('-1').sinh().toString();
      expect(a4).assertEqual('-1.1752');
      Decimal.set({ defaults: true });
      // 5. precision 5 ROUND_HALF_UP sinh(2)
      Decimal.set({ precision: 5, rounding: 4 });
      let a5: string = new Decimal('2').sinh().toString();
      expect(a5).assertEqual('3.6269');
      Decimal.set({ defaults: true });
      // 6. precision 5 ROUND_DOWN sinh(2)
      Decimal.set({ precision: 5, rounding: 1 });
      let a6: string = new Decimal('2').sinh().toString();
      expect(a6).assertEqual('3.6268');
      Decimal.set({ defaults: true });
      // 7. Decimal.sinh(1) toFixed(2)
      let r7: string = Decimal.sinh(1).toFixed(2);
      expect(r7).assertEqual('1.18');
      // 8. Decimal.sinh('1.75') toDecimalPlaces(2)
      let a8: string = Decimal.sinh('1.75').toDecimalPlaces(2).toString();
      expect(a8).assertEqual('2.79');
      // 9. Decimal.sinh('5') toPrecision(5)
      let a9: string = Decimal.sinh('5').toPrecision(5);
      expect(a9).assertEqual('74.203');
      // 10. Decimal.sinh('1') toExponential(4)
      let a10: string = Decimal.sinh('1').toExponential(4);
      expect(a10).assertEqual('1.1752e+0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1200
     * @tc.name decimalSinhTest012
     * @tc.desc Radix output formatting and result classification predicates (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sinh('0.5') toSignificantDigits(3)
      let a1: string = Decimal.sinh('0.5').toSignificantDigits(3).toString();
      expect(a1).assertEqual('0.521');
      // 2. Decimal.sinh('0.5') toHexadecimal(10)
      let h2: string = Decimal.sinh('0.5').toHexadecimal(10);
      expect(h2).assertEqual('0x1.0acd00fe6p-1');
      // 3. Decimal.sinh('0.5') toOctal(10)
      let o3: string = Decimal.sinh('0.5').toOctal(10);
      expect(o3).assertEqual('0o1.02546401p-1');
      // 4. Decimal.sinh('0.5') toBinary(15)
      let b4: string = Decimal.sinh('0.5').toBinary(15);
      expect(b4).assertEqual('0b1.00001010110011p-1');
      // 5. Decimal.sinh('100') toNumber is finite
      let n5: double = Decimal.sinh('100').toNumber();
      expect(isFinite(n5)).assertTrue();
      // 6. Decimal.sinh('1') isPositive
      let a6: boolean = Decimal.sinh('1').isPositive();
      expect(a6).assertTrue();
      // 7. Decimal.sinh('0.5') comparedTo 0.52109530549374736162
      let cmp7: double = Decimal.sinh('0.5').comparedTo(new Decimal('0.52109530549374736162'));
      expect(cmp7).assertEqual(0);
      // 8. Decimal.sinh('0.5') equals 0.52109530549374736162
      let a8: boolean = Decimal.sinh('0.5').equals(new Decimal('0.52109530549374736162'));
      expect(a8).assertTrue();
      // 9. Decimal.sinh('1') isFinite
      let a9: boolean = Decimal.sinh('1').isFinite();
      expect(a9).assertTrue();
      // 10. sinh(0.5) isInteger false
      let a10: boolean = new Decimal('0.5').sinh().isInteger();
      expect(a10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1300
     * @tc.name decimalSinhTest013
     * @tc.desc Exponent, sign and digit internals with source immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(0.5) exponent is -1
      let e1: number = new Decimal('0.5').sinh().e;
      expect(e1).assertEqual(-1);
      // 2. sinh(10) exponent is 4
      let e2: number = new Decimal('10').sinh().e;
      expect(e2).assertEqual(4);
      // 3. sinh(1) exponent exposed via getter not field, value 0
      let d3: Decimal = new Decimal('1').sinh();
      const hasExponentField3: boolean = reflect
        .getInstanceFieldsRecursive(Class.of(d3))
        .some((field) => field.getName() === 'e');
      expect(hasExponentField3).assertFalse();
      expect(d3.e).assertEqual(0);
      // 4. sinh(1) sign exposed via getter not field, value 1
      let d4: Decimal = new Decimal('1').sinh();
      const hasSignField4: boolean = reflect
        .getInstanceFieldsRecursive(Class.of(d4))
        .some((field) => field.getName() === 's');
      expect(hasSignField4).assertFalse();
      expect(d4.s).assertEqual(1);
      // 5. sinh('123.456') isNaN false
      let a5: boolean = new Decimal('123.456').sinh().isNaN();
      expect(a5).assertFalse();
      // 6. Decimal.sinh(0) exponent is 0
      let r6: Decimal = Decimal.sinh(0);
      expect(r6.e).assertEqual(0);
      // 7. Decimal.sinh('0.5') first coefficient is 5210953
      let r7: Decimal = Decimal.sinh('0.5');
      expect(r7.d![0]).assertEqual(5210953);
      // 8. Decimal.sinh does not mutate source Decimal toString
      let src8: Decimal = new Decimal('1.5');
      let before8: string = src8.toString();
      Decimal.sinh(src8);
      expect(src8.toString()).assertEqual(before8);
      // 9. Decimal.sinh preserves source '0.75' value, digits, length, sign, exponent
      let src9: Decimal = new Decimal('0.75');
      let len9: number = src9.d!.length;
      const originalValueSnapshot9: string = src9.toString();
      const expectedOriginalValue9: string = '0.75';
      expect(originalValueSnapshot9).assertEqual(expectedOriginalValue9);
      const originalDigitsSnapshot9: Array<double> = src9.d!.slice(0);
      const originalLengthSnapshot9: int = originalDigitsSnapshot9.length;
      const originalSignSnapshot9: double = src9.s;
      const originalExponentSnapshot9: double = src9.e;
      Decimal.sinh(src9);
      expect(src9.d!.length).assertEqual(len9);
      expect(src9.toString()).assertEqual(expectedOriginalValue9);
      const actualOriginalDigits9: Array<double> = src9.d!;
      const actualOriginalLength9: int = actualOriginalDigits9.length;
      expect(actualOriginalLength9).assertEqual(originalLengthSnapshot9);
      for (let coefficientIndex9: int = 0; coefficientIndex9 < originalLengthSnapshot9; coefficientIndex9++) {
        const actualCoefficient9: double = actualOriginalDigits9[coefficientIndex9];
        const expectedCoefficient9: double = originalDigitsSnapshot9[coefficientIndex9];
        expect(actualCoefficient9).assertEqual(expectedCoefficient9);
      }
      const actualOriginalSign9: double = src9.s;
      expect(actualOriginalSign9).assertEqual(originalSignSnapshot9);
      const actualOriginalExponent9: double = src9.e;
      expect(actualOriginalExponent9).assertEqual(originalExponentSnapshot9);
      // 10. Decimal.sinh preserves source '-2.5' value, digits, length, sign, exponent
      let src10: Decimal = new Decimal('-2.5');
      let s0_10: number = src10.s;
      let e0_10: number = src10.e;
      const originalValueSnapshot10: string = src10.toString();
      const expectedOriginalValue10: string = '-2.5';
      expect(originalValueSnapshot10).assertEqual(expectedOriginalValue10);
      const originalDigitsSnapshot10: Array<double> = src10.d!.slice(0);
      const originalLengthSnapshot10: int = originalDigitsSnapshot10.length;
      const originalSignSnapshot10: double = src10.s;
      const originalExponentSnapshot10: double = src10.e;
      Decimal.sinh(src10);
      expect(src10.s).assertEqual(s0_10);
      expect(src10.e).assertEqual(e0_10);
      expect(src10.toString()).assertEqual(expectedOriginalValue10);
      const actualOriginalDigits10: Array<double> = src10.d!;
      const actualOriginalLength10: int = actualOriginalDigits10.length;
      expect(actualOriginalLength10).assertEqual(originalLengthSnapshot10);
      for (let coefficientIndex10: int = 0; coefficientIndex10 < originalLengthSnapshot10; coefficientIndex10++) {
        const actualCoefficient10: double = actualOriginalDigits10[coefficientIndex10];
        const expectedCoefficient10: double = originalDigitsSnapshot10[coefficientIndex10];
        expect(actualCoefficient10).assertEqual(expectedCoefficient10);
      }
      const actualOriginalSign10: double = src10.s;
      expect(actualOriginalSign10).assertEqual(originalSignSnapshot10);
      const actualOriginalExponent10: double = src10.e;
      expect(actualOriginalExponent10).assertEqual(originalExponentSnapshot10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1400
     * @tc.name decimalSinhTest014
     * @tc.desc Mathematical identities and instance/static equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(x)^2 - cosh(x)^2 = -1 for x=0.5
      let r1: Decimal = new Decimal('0.5').sinh().pow(2).sub(new Decimal('0.5').cosh().pow(2));
      let a1: number = r1.add(new Decimal('1')).abs().comparedTo(new Decimal('1e-18'));
      expect(a1).assertEqual(-1);
      // 2. sinh(x) = (e^x - e^-x)/2 for x=1
      let lhs2: Decimal = new Decimal('1').sinh().mul(2);
      let rhs2: Decimal = new Decimal('1').exp().sub(new Decimal('-1').exp());
      let a2: number = lhs2.sub(rhs2).abs().comparedTo(new Decimal('1e-18'));
      expect(a2).assertEqual(-1);
      // 3. sinh(2x) = 2*sinh(x)*cosh(x) for x=0.5
      let lhs3: Decimal = new Decimal('1').sinh();
      let rhs3: Decimal = new Decimal('0.5').sinh().mul(new Decimal('0.5').cosh()).mul(2);
      let a3: number = lhs3.sub(rhs3).abs().comparedTo(new Decimal('1e-18'));
      expect(a3).assertEqual(-1);
      // 4. sinh(x) + cosh(x) = e^x for x=0.3
      let lhs4: Decimal = new Decimal('0.3').sinh().add(new Decimal('0.3').cosh());
      let rhs4: Decimal = new Decimal('0.3').exp();
      let a4: number = lhs4.sub(rhs4).abs().comparedTo(new Decimal('1e-18'));
      expect(a4).assertEqual(-1);
      // 5. sinh(asinh(x)) = x for x=0.7
      let r5: Decimal = new Decimal('0.7').asinh().sinh();
      let a5: number = r5.sub(new Decimal('0.7')).abs().comparedTo(new Decimal('1e-18'));
      expect(a5).assertEqual(-1);
      // 6. ln(sinh(x) + cosh(x)) = x for x=0.5
      let r6: Decimal = new Decimal('0.5').sinh().add(new Decimal('0.5').cosh()).ln();
      let a6: number = r6.sub(new Decimal('0.5')).abs().comparedTo(new Decimal('1e-18'));
      expect(a6).assertEqual(-1);
      // 7. sinh(x)/cosh(x) = tanh(x) for x=0.4
      let q7: Decimal = Decimal.sinh('0.4').div(Decimal.cosh('0.4'));
      let t7: Decimal = Decimal.tanh('0.4');
      let a7: number = q7.sub(t7).abs().comparedTo(new Decimal('1e-18'));
      expect(a7).assertEqual(-1);
      // 8. sinh(x) + cosh(x) = e^x for x=0.5 (static)
      let lhs8: Decimal = Decimal.sinh('0.5').add(Decimal.cosh('0.5'));
      let rhs8: Decimal = Decimal.exp('0.5');
      let a8: number = lhs8.sub(rhs8).abs().comparedTo(new Decimal('1e-18'));
      expect(a8).assertEqual(-1);
      // 9. sinh(x) + (-sinh(x)) = 0 for x=0.5 (static)
      let r9: Decimal = Decimal.sinh('0.5').add(Decimal.sinh('0.5').negate());
      expect(r9.isZero()).assertTrue();
      // 10. Decimal.sinh(1) equals new Decimal(1).sinh()
      let s10: Decimal = Decimal.sinh(1);
      let i10: Decimal = new Decimal(1).sinh();
      expect(s10.comparedTo(i10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1500
     * @tc.name decimalSinhTest015
     * @tc.desc Chained arithmetic and Decimal.sinh equivalence to instance sinh (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sinh(1).sinh() toString
      let a1: string = new Decimal('1').sinh().sinh().toString();
      expect(a1).assertEqual('1.4650188248182273613');
      // 2. sinh(0.5) multiplied by 2
      let a2: string = new Decimal('0.5').sinh().mul(2).toString();
      expect(a2).assertEqual('1.0421906109874947232');
      // 3. sinh(0.5) plus 1
      let a3: string = new Decimal('0.5').sinh().add(1).toString();
      expect(a3).assertEqual('1.5210953054937473616');
      // 4. sinh(1) divided by 2
      let a4: string = new Decimal('1').sinh().div(2).toString();
      expect(a4).assertEqual('0.58760059682190072845');
      // 5. sinh(1) plus sinh(sinh(1))
      let a5: Decimal = new Decimal('1').sinh();
      let b5: Decimal = new Decimal(a5).sinh();
      let r5: string = a5.add(b5).toString();
      expect(r5).assertEqual('2.6402200184620288182');
      // 6. Decimal.sinh('1').add(2).mul(3)
      let r6: string = Decimal.sinh('1').add(2).mul(3).toString();
      expect(r6).assertEqual('9.5256035809314043707');
      // 7. Decimal.sinh('1').pow(2)
      let r7: string = Decimal.sinh('1').pow(2).toString();
      expect(r7).assertEqual('1.3810978455418157298');
      // 8. Decimal.sinh('0.5').mod(1)
      let r8: string = Decimal.sinh('0.5').mod(1).toString();
      expect(r8).assertEqual('0.52109530549374736162');
      // 9. Decimal.sinh(Decimal) equals instance sinh toString
      let src9: Decimal = new Decimal('0.5');
      let a9: string = Decimal.sinh(src9).toString();
      let e9: string = src9.sinh().toString();
      expect(a9).assertEqual(e9);
      // 10. Decimal.sinh(Decimal) comparedTo instance sinh equals 0
      let src10: Decimal = new Decimal('0.5');
      let s10: Decimal = Decimal.sinh(src10);
      let i10: Decimal = src10.sinh();
      expect(s10.comparedTo(i10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1600
     * @tc.name decimalSinhTest016
     * @tc.desc Static method invalid string inputs and basic value handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sinh on whitespace string throws 401
      let ws1: string = ' ';
      let spaces1: string = ws1 + ws1 + ws1;
      try {
        Decimal.sinh(spaces1);
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(401);
      }
      // 2. Decimal.sinh on Chinese string throws 401
      try {
        Decimal.sinh('中文');
        expect().assertFail();
      } catch (e2) {
        expect(e2.code).assertEqual(401);
      }
      // 3. Decimal.sinh on emoji string throws 401
      try {
        Decimal.sinh('😀');
        expect().assertFail();
      } catch (e3) {
        expect(e3.code).assertEqual(401);
      }
      // 4. Decimal.sinh on zero-width-prefixed numeric string throws 401
      try {
        Decimal.sinh('​123');
        expect().assertFail();
      } catch (e4) {
        expect(e4.code).assertEqual(401);
      }
      // 5. Decimal.sinh on XSS string throws 401
      try {
        Decimal.sinh('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e5) {
        expect(e5.code).assertEqual(401);
      }
      // 6. Decimal.sinh(5e-324) is positive and finite
      let r6: Decimal = Decimal.sinh(5e-324);
      expect(r6.isPositive()).assertTrue();
      expect(r6.isFinite()).assertTrue();
      // 7. Decimal.sinh(0) isPositive
      let a7: boolean = Decimal.sinh(0).isPositive();
      expect(a7).assertTrue();
      // 8. Decimal.sinh(0) isNegative false
      let a8: boolean = Decimal.sinh(0).isNegative();
      expect(a8).assertFalse();
      // 9. Decimal.sinh(1) equals new Decimal(1).sinh() toString
      let a9: string = Decimal.sinh(1).toString();
      let e9: string = new Decimal(1).sinh().toString();
      expect(a9).assertEqual(e9);
      // 10. Decimal.sinh('2') equals new Decimal('2').sinh() toString
      let a10: string = Decimal.sinh('2').toString();
      let e10: string = new Decimal('2').sinh().toString();
      expect(a10).assertEqual(e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_1700
     * @tc.name decimalSinhTest017
     * @tc.desc Static method source non-mutation, negation symmetry and equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinhTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sinh(Decimal.sinh(0)) is 0
      let r1: string = Decimal.sinh(Decimal.sinh(0)).toString();
      expect(r1).assertEqual('0');
      // 2. Decimal.sinh(1).negate() toString
      let r2: string = Decimal.sinh(1).negate().toString();
      expect(r2).assertEqual('-1.1752011936438014569');
      // 3. Decimal.sinh(-1).negate() equals Decimal.sinh(1)
      let neg3: Decimal = new Decimal('-1');
      let pos3: Decimal = new Decimal('1');
      let a3: number = Decimal.sinh(neg3).negate().comparedTo(Decimal.sinh(pos3));
      expect(a3).assertEqual(0);
      // 4. Decimal.sinh('0.7') + Decimal.sinh('-0.7') is zero
      let sum4: Decimal = Decimal.sinh('0.7').add(Decimal.sinh('-0.7'));
      expect(sum4.isZero()).assertTrue();
      // 5. Decimal.sinh('-0.2') toString
      let r5: string = Decimal.sinh('-0.2').toString();
      expect(r5).assertEqual('-0.20133600254109398763');
      // 6. Decimal.sinh(-0) equals new Decimal(-0).sinh() toString
      let a6: string = Decimal.sinh(-0).toString();
      let e6: string = new Decimal(-0).sinh().toString();
      expect(a6).assertEqual(e6);
      // 7. Decimal.sinh(Decimal('1.75')) not equal to source
      let src7: Decimal = new Decimal('1.75');
      let r7: Decimal = Decimal.sinh(src7);
      expect(r7).not().assertEqual(src7);
      // 8. Decimal.sinh(Decimal('1.5')) digits not equal to source digits
      let src8: Decimal = new Decimal('1.5');
      let r8: Decimal = Decimal.sinh(src8);
      expect(r8.d).not().assertEqual(src8.d);
      // 9. Decimal.sinh does not change source isZero
      let src9: Decimal = new Decimal('0');
      let z9: boolean = src9.isZero();
      Decimal.sinh(src9);
      expect(src9.isZero()).assertEqual(z9);
      // 10. Decimal.sinh(src) repeated calls are equal
      let src10: Decimal = new Decimal('0.5');
      let r10a: Decimal = Decimal.sinh(src10);
      let r10b: Decimal = Decimal.sinh(src10);
      expect(r10a.equals(r10b)).assertTrue();
    });
  });
}
