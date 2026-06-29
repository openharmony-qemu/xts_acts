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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortDivTest(): void {
  describe('ShortDivTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0100
     * @tc.name testShortDiv001
     * @tc.desc Verify div method with positive Short dividend and positive Short divisor for correct integer quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(8 as short);
      let divisor: Short = new Short(4 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(2 as short);
      expect(dividend.toShort()).assertEqual(8 as short);
      expect(divisor.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0200
     * @tc.name testShortDiv002
     * @tc.desc Verify div method with positive Short dividend and negative Short divisor for correct negative quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(8 as short);
      let divisor: Short = new Short((-4) as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual((-2) as short);
      expect(dividend.toShort()).assertEqual(8 as short);
      expect(divisor.toShort()).assertEqual((-4) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0300
     * @tc.name testShortDiv003
     * @tc.desc Verify div method with negative Short dividend and negative Short divisor for correct positive quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short((-8) as short);
      let divisor: Short = new Short((-4) as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(2 as short);
      expect(dividend.toShort()).assertEqual((-8) as short);
      expect(divisor.toShort()).assertEqual((-4) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0400
     * @tc.name testShortDiv004
     * @tc.desc Verify div method with zero Short dividend and positive Short divisor for correct zero quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(0 as short);
      let divisor: Short = new Short(4 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(0 as short);
      expect(dividend.toShort()).assertEqual(0 as short);
      expect(divisor.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0500
     * @tc.name testShortDiv005
     * @tc.desc Verify div method with identical self-reference Short instance for correct identity quotient of one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(7 as short);
      let beforeValue: short = value.toShort();
      let result: Short = value.div(value);
      expect(result.toShort()).assertEqual(1 as short);
      expect(value.toShort()).assertEqual(beforeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0600
     * @tc.name testShortDiv006
     * @tc.desc Verify div method with Short divisor of one preserves dividend value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(9 as short);
      let divisor: Short = new Short(1 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(9 as short);
      expect(dividend.toShort()).assertEqual(9 as short);
      expect(divisor.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0700
     * @tc.name testShortDiv007
     * @tc.desc Verify div method returns a distinct Short instance that carries the correct quotient value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(12 as short);
      let divisor: Short = new Short(3 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(4 as short);
      expect(result === dividend).assertFalse();
      expect(result === divisor).assertFalse();
      expect(dividend.toShort()).assertEqual(12 as short);
      expect(divisor.toShort()).assertEqual(3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0800
     * @tc.name testShortDiv008
     * @tc.desc Verify div method truncates a positive non-divisible Short quotient toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(7 as short);
      let divisor: Short = new Short(2 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(3 as short);
      expect(dividend.toShort()).assertEqual(7 as short);
      expect(divisor.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0900
     * @tc.name testShortDiv009
     * @tc.desc Verify div method truncates negative dividend division toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short((-7) as short);
      let divisor: Short = new Short(2 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual((-3) as short);
      expect(dividend.toShort()).assertEqual((-7) as short);
      expect(divisor.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1000
     * @tc.name testShortDiv010
     * @tc.desc Verify div method truncates negative-negative division toward zero after positive sign resolution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short((-7) as short);
      let divisor: Short = new Short((-2) as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(3 as short);
      expect(dividend.toShort()).assertEqual((-7) as short);
      expect(divisor.toShort()).assertEqual((-2) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1100
     * @tc.name testShortDiv011
     * @tc.desc Verify div method throws ArithmeticError for a positive dividend when divisor Short value is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroDivisor: Short = new Short(0 as short);
      try {
        new Short(10 as short).div(zeroDivisor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1200
     * @tc.name testShortDiv012
     * @tc.desc Verify div method returns consistent quotients across repeated invocations with identical operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstDividend: Short = new Short(8 as short);
      let firstDivisor: Short = new Short(4 as short);
      let firstResultA: Short = firstDividend.div(firstDivisor);
      let firstResultB: Short = firstDividend.div(firstDivisor);
      let firstResultC: Short = firstDividend.div(firstDivisor);
      expect(firstResultA.toShort()).assertEqual(2 as short);
      expect(firstResultB.toShort()).assertEqual(2 as short);
      expect(firstResultC.toShort()).assertEqual(2 as short);
      expect(firstResultB.toShort()).assertEqual(firstResultA.toShort());
      expect(firstResultC.toShort()).assertEqual(firstResultA.toShort());
      let secondDividend: Short = new Short(12 as short);
      let secondDivisor: Short = new Short((-3) as short);
      let secondResultA: Short = secondDividend.div(secondDivisor);
      let secondResultB: Short = secondDividend.div(secondDivisor);
      let secondResultC: Short = secondDividend.div(secondDivisor);
      expect(secondResultA.toShort()).assertEqual((-4) as short);
      expect(secondResultB.toShort()).assertEqual((-4) as short);
      expect(secondResultC.toShort()).assertEqual((-4) as short);
      expect(secondResultB.toShort()).assertEqual(secondResultA.toShort());
      expect(secondResultC.toShort()).assertEqual(secondResultA.toShort());
      let thirdDividend: Short = new Short((-15) as short);
      let thirdDivisor: Short = new Short((-5) as short);
      let thirdResultA: Short = thirdDividend.div(thirdDivisor);
      let thirdResultB: Short = thirdDividend.div(thirdDivisor);
      let thirdResultC: Short = thirdDividend.div(thirdDivisor);
      expect(thirdResultA.toShort()).assertEqual(3 as short);
      expect(thirdResultB.toShort()).assertEqual(3 as short);
      expect(thirdResultC.toShort()).assertEqual(3 as short);
      expect(thirdResultB.toShort()).assertEqual(thirdResultA.toShort());
      expect(thirdResultC.toShort()).assertEqual(thirdResultA.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1300
     * @tc.name testShortDiv013
     * @tc.desc Verify div method returns consistent results across different Short instances with identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividendA: Short = new Short(10 as short);
      let divisorA: Short = new Short(2 as short);
      let dividendB: Short = new Short(10 as short);
      let divisorB: Short = new Short(2 as short);
      let resultA: Short = dividendA.div(divisorA);
      let resultB: Short = dividendB.div(divisorB);
      expect(resultA.toShort()).assertEqual(5 as short);
      expect(resultB.toShort()).assertEqual(5 as short);
      expect(resultB.toShort()).assertEqual(resultA.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1400
     * @tc.name testShortDiv014
     * @tc.desc Verify div method does not mutate operand Short instances after invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(20 as short);
      let divisor: Short = new Short(4 as short);
      let dividendBefore: short = dividend.toShort();
      let divisorBefore: short = divisor.toShort();
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(5 as short);
      expect(dividend.toShort()).assertEqual(dividendBefore);
      expect(divisor.toShort()).assertEqual(divisorBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1500
     * @tc.name testShortDiv015
     * @tc.desc Verify div method preserves maximum and minimum Short boundary values when divisor is one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let one: Short = new Short(1 as short);
      let maxResult: Short = maxValue.div(one);
      let minResult: Short = minValue.div(one);
      expect(maxResult.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minResult.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1600
     * @tc.name testShortDiv016
     * @tc.desc Verify div method preserves adjacent Short boundary values when divisor is one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMax: Short = new Short(32766 as short);
      let nearMin: Short = new Short((-32767) as short);
      let one: Short = new Short(1 as short);
      let nearMaxResult: Short = nearMax.div(one);
      let nearMinResult: Short = nearMin.div(one);
      expect(nearMaxResult.toShort()).assertEqual(32766 as short);
      expect(nearMinResult.toShort()).assertEqual((-32767) as short);
      expect(nearMax.toShort()).assertEqual(32766 as short);
      expect(nearMin.toShort()).assertEqual((-32767) as short);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1700
     * @tc.name testShortDiv017
     * @tc.desc Verify div method preserves adjacent upper boundary value and conversion chain after exact division
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(32766 as short);
      let divisor: Short = new Short(1 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(32766 as short);
      expect(result.toInt()).assertEqual(32766);
      expect(result.toLong()).assertEqual(Long.toLong(32766));
      expect(dividend.toShort()).assertEqual(32766 as short);
      expect(divisor.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1800
     * @tc.name testShortDiv018
     * @tc.desc Verify div method preserves adjacent lower boundary value and conversion chain after exact division
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short((-32767) as short);
      let divisor: Short = new Short(1 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual((-32767) as short);
      expect(result.toInt()).assertEqual(-32767);
      expect(result.toLong()).assertEqual(Long.toLong(-32767));
      expect(dividend.toShort()).assertEqual((-32767) as short);
      expect(divisor.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1900
     * @tc.name testShortDiv019
     * @tc.desc Verify div method argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(8 as short);
      try {
        dividend.div(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_2000
     * @tc.name testShortDiv020
     * @tc.desc Verify div method argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(8 as short);
      try {
        dividend.div(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_2100
     * @tc.name testShortDiv021
     * @tc.desc Verify div method throws ArithmeticError for a negative dividend when divisor Short value is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroDivisor: Short = new Short(0 as short);
      try {
        new Short((-5) as short).div(zeroDivisor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_2200
     * @tc.name testShortDiv022
     * @tc.desc Verify div method throws ArithmeticError for a zero dividend when divisor Short value is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroDivisor: Short = new Short(0 as short);
      try {
        new Short(0 as short).div(zeroDivisor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_2300
     * @tc.name testShortDiv023
     * @tc.desc Verify div method keeps Short MIN_VALUE when dividing it by negative one on the current device runtime
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(Short.MIN_VALUE);
      let divisor: Short = new Short((-1) as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(Short.MIN_VALUE);
      expect(dividend.toShort()).assertEqual(Short.MIN_VALUE);
      expect(divisor.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_2400
     * @tc.name testShortDiv024
     * @tc.desc Verify div method truncates another positive non-divisible Short quotient toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dividend: Short = new Short(20 as short);
      let divisor: Short = new Short(3 as short);
      let result: Short = dividend.div(divisor);
      expect(result.toShort()).assertEqual(6 as short);
      expect(dividend.toShort()).assertEqual(20 as short);
      expect(divisor.toShort()).assertEqual(3 as short);
    });
  });
}
