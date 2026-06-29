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

export default function shortSubTest(): void {
  describe('ShortSubTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0100
     * @tc.name testShortSub001
     * @tc.desc Verify sub method with two positive Short operands for correct subtraction result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(6 as short);
      let rightOperand: Short = new Short(4 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(2 as short);
      expect(leftOperand.toShort()).assertEqual(6 as short);
      expect(rightOperand.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0200
     * @tc.name testShortSub002
     * @tc.desc Verify sub method with positive and negative Short operands for correct subtraction-as-addition result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(6 as short);
      let rightOperand: Short = new Short((-4) as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(10 as short);
      expect(leftOperand.toShort()).assertEqual(6 as short);
      expect(rightOperand.toShort()).assertEqual((-4) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0300
     * @tc.name testShortSub003
     * @tc.desc Verify sub method with two negative Short operands for correct subtraction result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short((-6) as short);
      let rightOperand: Short = new Short((-4) as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual((-2) as short);
      expect(leftOperand.toShort()).assertEqual((-6) as short);
      expect(rightOperand.toShort()).assertEqual((-4) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0400
     * @tc.name testShortSub004
     * @tc.desc Verify sub method with zero and positive Short operands for correct negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(0 as short);
      let rightOperand: Short = new Short(5 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual((-5) as short);
      expect(leftOperand.toShort()).assertEqual(0 as short);
      expect(rightOperand.toShort()).assertEqual(5 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0500
     * @tc.name testShortSub005
     * @tc.desc Verify sub method with positive Short and zero operand for identity preservation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(5 as short);
      let rightOperand: Short = new Short(0 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(5 as short);
      expect(leftOperand.toShort()).assertEqual(5 as short);
      expect(rightOperand.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0600
     * @tc.name testShortSub006
     * @tc.desc Verify sub method with two equal-valued Short instances for zero result without mutating operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(42 as short);
      let rightOperand: Short = new Short(42 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(0 as short);
      expect(leftOperand.toShort()).assertEqual(42 as short);
      expect(rightOperand.toShort()).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0700
     * @tc.name testShortSub007
     * @tc.desc Verify sub method with Short.MAX_VALUE minus one reaches adjacent upper boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let oneValue: Short = new Short(1 as short);
      let maxMinusOneResult: Short = maxValue.sub(oneValue);
      expect(maxMinusOneResult.toShort()).assertEqual(32766 as short);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(oneValue.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0800
     * @tc.name testShortSub008
     * @tc.desc Verify sub method return value keeps correct encapsulated short value and preserves operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(100 as short);
      let rightOperand: Short = new Short(30 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(70 as short);
      expect(leftOperand.toShort()).assertEqual(100 as short);
      expect(rightOperand.toShort()).assertEqual(30 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0900
     * @tc.name testShortSub009
     * @tc.desc Verify sub method returns a newly created Short instance distinct from both operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(50 as short);
      let rightOperand: Short = new Short(20 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference !== leftOperand).assertTrue();
      expect(difference !== rightOperand).assertTrue();
      expect(difference.toShort()).assertEqual(30 as short);
      expect(leftOperand.toShort()).assertEqual(50 as short);
      expect(rightOperand.toShort()).assertEqual(20 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1000
     * @tc.name testShortSub010
     * @tc.desc Verify sub method with smaller minuend and larger subtrahend for correct negative Short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(10 as short);
      let rightOperand: Short = new Short(25 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual((-15) as short);
      expect(leftOperand.toShort()).assertEqual(10 as short);
      expect(rightOperand.toShort()).assertEqual(25 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1100
     * @tc.name testShortSub011
     * @tc.desc Verify sub method with negative minuend and positive subtrahend for correct sign handling
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeOperand: Short = new Short((-8) as short);
      let positiveOperand: Short = new Short(15 as short);
      let difference: Short = negativeOperand.sub(positiveOperand);
      expect(difference.toShort()).assertEqual((-23) as short);
      expect(negativeOperand.toShort()).assertEqual((-8) as short);
      expect(positiveOperand.toShort()).assertEqual(15 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1200
     * @tc.name testShortSub012
     * @tc.desc Verify sub method idempotency with identical operands across multiple invocations for consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(100 as short);
      let rightOperand: Short = new Short(33 as short);
      let firstDifference: Short = leftOperand.sub(rightOperand);
      let secondDifference: Short = leftOperand.sub(rightOperand);
      let thirdDifference: Short = leftOperand.sub(rightOperand);
      let firstActual: short = firstDifference.toShort();
      let secondActual: short = secondDifference.toShort();
      let thirdActual: short = thirdDifference.toShort();
      expect(firstActual).assertEqual(67 as short);
      expect(secondActual).assertEqual(67 as short);
      expect(thirdActual).assertEqual(67 as short);
      expect(secondActual).assertEqual(firstActual);
      expect(thirdActual).assertEqual(firstActual);
      expect(leftOperand.toShort()).assertEqual(100 as short);
      expect(rightOperand.toShort()).assertEqual(33 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1300
     * @tc.name testShortSub013
     * @tc.desc Verify sub method with different Short instances of identical values for consistent cross-instance results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstLeftOperand: Short = new Short(80 as short);
      let firstRightOperand: Short = new Short(25 as short);
      let secondLeftOperand: Short = new Short(80 as short);
      let secondRightOperand: Short = new Short(25 as short);
      let firstDifference: Short = firstLeftOperand.sub(firstRightOperand);
      let secondDifference: Short = secondLeftOperand.sub(secondRightOperand);
      let firstActual: short = firstDifference.toShort();
      let secondActual: short = secondDifference.toShort();
      expect(firstActual).assertEqual(55 as short);
      expect(secondActual).assertEqual(55 as short);
      expect(secondActual).assertEqual(firstActual);
      expect(firstLeftOperand.toShort()).assertEqual(80 as short);
      expect(firstRightOperand.toShort()).assertEqual(25 as short);
      expect(secondLeftOperand.toShort()).assertEqual(80 as short);
      expect(secondRightOperand.toShort()).assertEqual(25 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1400
     * @tc.name testShortSub014
     * @tc.desc Verify sub method has no side effects on original Short instances across repeated invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(99 as short);
      let rightOperand: Short = new Short(44 as short);
      let initialLeftValue: short = leftOperand.toShort();
      let initialRightValue: short = rightOperand.toShort();
      let iterationLimit: int = 5;
      let iterationCount: int = 0;
      while (iterationCount < iterationLimit) {
        let difference: Short = leftOperand.sub(rightOperand);
        let actualResult: short = difference.toShort();
        let currentLeftValue: short = leftOperand.toShort();
        let currentRightValue: short = rightOperand.toShort();
        expect(actualResult).assertEqual(55 as short);
        expect(currentLeftValue).assertEqual(initialLeftValue);
        expect(currentRightValue).assertEqual(initialRightValue);
        iterationCount++;
      }
      expect(leftOperand.toShort()).assertEqual(99 as short);
      expect(rightOperand.toShort()).assertEqual(44 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1500
     * @tc.name testShortSub015
     * @tc.desc Verify sub method idempotency with negative Short operands across multiple invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short((-30) as short);
      let rightOperand: Short = new Short((-12) as short);
      let firstDifference: Short = leftOperand.sub(rightOperand);
      let secondDifference: Short = leftOperand.sub(rightOperand);
      let thirdDifference: Short = leftOperand.sub(rightOperand);
      let firstActual: short = firstDifference.toShort();
      let secondActual: short = secondDifference.toShort();
      let thirdActual: short = thirdDifference.toShort();
      expect(firstActual).assertEqual((-18) as short);
      expect(secondActual).assertEqual((-18) as short);
      expect(thirdActual).assertEqual((-18) as short);
      expect(secondActual).assertEqual(firstActual);
      expect(thirdActual).assertEqual(firstActual);
      expect(leftOperand.toShort()).assertEqual((-30) as short);
      expect(rightOperand.toShort()).assertEqual((-12) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1600
     * @tc.name testShortSub016
     * @tc.desc Verify sub method idempotency with zero-valued Short operands across multiple invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(0 as short);
      let rightOperand: Short = new Short(0 as short);
      let firstDifference: Short = leftOperand.sub(rightOperand);
      let secondDifference: Short = leftOperand.sub(rightOperand);
      let thirdDifference: Short = leftOperand.sub(rightOperand);
      let firstActual: short = firstDifference.toShort();
      let secondActual: short = secondDifference.toShort();
      let thirdActual: short = thirdDifference.toShort();
      expect(firstActual).assertEqual(0 as short);
      expect(secondActual).assertEqual(0 as short);
      expect(thirdActual).assertEqual(0 as short);
      expect(leftOperand.toShort()).assertEqual(0 as short);
      expect(rightOperand.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1700
     * @tc.name testShortSub017
     * @tc.desc Verify sub method with Short.MIN_VALUE minus negative one reaches adjacent lower boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let negativeOneValue: Short = new Short((-1) as short);
      let difference: Short = minValue.sub(negativeOneValue);
      expect(difference.toShort()).assertEqual((-32767) as short);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(negativeOneValue.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1800
     * @tc.name testShortSub018
     * @tc.desc Verify sub method with Short.MAX_VALUE minus itself returns zero at boundary equality
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let difference: Short = maxValue.sub(maxValue);
      expect(difference.toShort()).assertEqual(0 as short);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_1900
     * @tc.name testShortSub019
     * @tc.desc Verify sub method with Short.MIN_VALUE minus one truncates to Short.MAX_VALUE for underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let oneValue: Short = new Short(1 as short);
      let difference: Short = minValue.sub(oneValue);
      expect(difference.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(oneValue.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2000
     * @tc.name testShortSub020
     * @tc.desc Verify sub method with Short.MAX_VALUE minus negative one truncates to Short.MIN_VALUE for overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let negativeOneValue: Short = new Short((-1) as short);
      let difference: Short = maxValue.sub(negativeOneValue);
      expect(difference.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(negativeOneValue.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2100
     * @tc.name testShortSub021
     * @tc.desc Verify sub method with Short.MIN_VALUE minus Short.MAX_VALUE truncates to positive one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let difference: Short = minValue.sub(maxValue);
      expect(difference.toShort()).assertEqual(1 as short);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2200
     * @tc.name testShortSub022
     * @tc.desc Verify sub method with Short.MAX_VALUE minus Short.MIN_VALUE truncates to negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let difference: Short = maxValue.sub(minValue);
      expect(difference.toShort()).assertEqual((-1) as short);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2300
     * @tc.name testShortSub023
     * @tc.desc Verify sub method result keeps long conversion behavior for contract compliance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(100 as short);
      let rightOperand: Short = new Short(30 as short);
      let difference: Short = leftOperand.sub(rightOperand);
      expect(difference.toShort()).assertEqual(70 as short);
      expect(difference.toLong()).assertEqual(Long.toLong(70));
      expect(leftOperand.toShort()).assertEqual(100 as short);
      expect(rightOperand.toShort()).assertEqual(30 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2400
     * @tc.name testShortSub024
     * @tc.desc Verify sub method argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(1 as short);
      try {
        leftOperand.sub(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_2500
     * @tc.name testShortSub025
     * @tc.desc Verify sub method argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(1 as short);
      try {
        leftOperand.sub(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
