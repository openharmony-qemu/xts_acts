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

export default function shortAddTest(): void {
  describe('ShortAddTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0100
     * @tc.name testShortAdd001
     * @tc.desc Verify add method with positive short operands for correct normal arithmetic computation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(1 as short);
      let right: Short = new Short(2 as short);
      let result: Short = left.add(right);
      expect(result.toShort()).assertEqual(3 as short);
      expect(left.toShort()).assertEqual(1 as short);
      expect(right.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0200
     * @tc.name testShortAdd002
     * @tc.desc Verify add method with opposite short values for zero result satisfying additive inverse property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(5 as short);
      let right: Short = new Short((-5) as short);
      let result: Short = left.add(right);
      expect(result.toShort()).assertEqual(0 as short);
      expect(left.toShort()).assertEqual(5 as short);
      expect(right.toShort()).assertEqual((-5) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0300
     * @tc.name testShortAdd003
     * @tc.desc Verify add method with same instance self-addition for correct doubling computation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(3 as short);
      let beforeValue: short = value.toShort();
      let result: Short = value.add(value);
      expect(result.toShort()).assertEqual(6 as short);
      expect(value.toShort()).assertEqual(beforeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0400
     * @tc.name testShortAdd004
     * @tc.desc Verify add method return value keeps Short conversion behavior for contract compliance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(15 as short);
      let right: Short = new Short(25 as short);
      let result: Short = left.add(right);
      let resultShort: short = result.toShort();
      let resultInt: int = result.toInt();
      expect(resultShort).assertEqual(40 as short);
      expect(resultInt).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0500
     * @tc.name testShortAdd005
     * @tc.desc Verify add method returns correct sum without mutating operand instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(8 as short);
      let right: Short = new Short(2 as short);
      let leftBefore: short = left.toShort();
      let rightBefore: short = right.toShort();
      let result: Short = left.add(right);
      expect(left.toShort()).assertEqual(leftBefore);
      expect(right.toShort()).assertEqual(rightBefore);
      expect(result.toShort()).assertEqual(10 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0600
     * @tc.name testShortAdd006
     * @tc.desc Verify add method is idempotent with repeated calls on same operands returning consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(7 as short);
      let right: Short = new Short(8 as short);
      let leftBefore: short = left.toShort();
      let rightBefore: short = right.toShort();
      let firstResult: Short = left.add(right);
      let secondResult: Short = left.add(right);
      let thirdResult: Short = left.add(right);
      expect(firstResult.toShort()).assertEqual(15 as short);
      expect(secondResult.toShort()).assertEqual(15 as short);
      expect(thirdResult.toShort()).assertEqual(15 as short);
      expect(left.toShort()).assertEqual(leftBefore);
      expect(right.toShort()).assertEqual(rightBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0700
     * @tc.name testShortAdd007
     * @tc.desc Verify add method produces consistent results across different instances with same underlying short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstLeft: Short = new Short(12 as short);
      let firstRight: Short = new Short(13 as short);
      let secondLeft: Short = new Short(12 as short);
      let secondRight: Short = new Short(13 as short);
      let thirdLeft: Short = new Short(12 as short);
      let thirdRight: Short = new Short(13 as short);
      let firstResult: Short = firstLeft.add(firstRight);
      let secondResult: Short = secondLeft.add(secondRight);
      let thirdResult: Short = thirdLeft.add(thirdRight);
      expect(firstResult.toShort()).assertEqual(25 as short);
      expect(secondResult.toShort()).assertEqual(25 as short);
      expect(thirdResult.toShort()).assertEqual(25 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0800
     * @tc.name testShortAdd008
     * @tc.desc Verify add method with MAX_VALUE plus one truncates to MIN_VALUE for short boundary overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let one: Short = new Short(1 as short);
      let result: Short = maxValue.add(one);
      expect(result.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0900
     * @tc.name testShortAdd009
     * @tc.desc Verify add method with MIN_VALUE plus negative one truncates to MAX_VALUE for short boundary overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let negativeOne: Short = new Short((-1) as short);
      let result: Short = minValue.add(negativeOne);
      expect(result.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(negativeOne.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1000
     * @tc.name testShortAdd010
     * @tc.desc Verify add method with two MAX_VALUE operands truncates to -2 for short high-range overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxLeft: Short = new Short(Short.MAX_VALUE);
      let maxRight: Short = new Short(Short.MAX_VALUE);
      let result: Short = maxLeft.add(maxRight);
      expect(result.toShort()).assertEqual((-2) as short);
      expect(maxLeft.toShort()).assertEqual(Short.MAX_VALUE);
      expect(maxRight.toShort()).assertEqual(Short.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1100
     * @tc.name testShortAdd011
     * @tc.desc Verify add method with two MIN_VALUE operands truncates to zero for short low-range overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minLeft: Short = new Short(Short.MIN_VALUE);
      let minRight: Short = new Short(Short.MIN_VALUE);
      let result: Short = minLeft.add(minRight);
      expect(result.toShort()).assertEqual(0 as short);
      expect(minLeft.toShort()).assertEqual(Short.MIN_VALUE);
      expect(minRight.toShort()).assertEqual(Short.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1200
     * @tc.name testShortAdd012
     * @tc.desc Verify add method with MAX_VALUE plus MIN_VALUE returns negative one for short boundary combination
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let result: Short = maxValue.add(minValue);
      expect(result.toShort()).assertEqual((-1) as short);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1300
     * @tc.name testShortAdd013
     * @tc.desc Verify add method with boundary values plus zero preserves original value for short identity property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      let minValue: Short = new Short(Short.MIN_VALUE);
      let zero: Short = new Short(0 as short);
      let maxResult: Short = maxValue.add(zero);
      let minResult: Short = minValue.add(zero);
      expect(maxResult.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minResult.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(zero.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1400
     * @tc.name testShortAdd014
     * @tc.desc Verify add method with negative one plus one returns zero for short zero-boundary crossing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeOne: Short = new Short((-1) as short);
      let one: Short = new Short(1 as short);
      let result: Short = negativeOne.add(one);
      expect(result.toShort()).assertEqual(0 as short);
      expect(negativeOne.toShort()).assertEqual((-1) as short);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1500
     * @tc.name testShortAdd015
     * @tc.desc Verify add method reaches MAX_VALUE from adjacent upper-boundary value without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMax: Short = new Short(32766 as short);
      let one: Short = new Short(1 as short);
      let result: Short = nearMax.add(one);
      expect(result.toShort()).assertEqual(Short.MAX_VALUE);
      expect(nearMax.toShort()).assertEqual(32766 as short);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1600
     * @tc.name testShortAdd016
     * @tc.desc Verify add method reaches MIN_VALUE from adjacent lower-boundary value without underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMin: Short = new Short((-32767) as short);
      let negativeOne: Short = new Short((-1) as short);
      let result: Short = nearMin.add(negativeOne);
      expect(result.toShort()).assertEqual(Short.MIN_VALUE);
      expect(nearMin.toShort()).assertEqual((-32767) as short);
      expect(negativeOne.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1700
     * @tc.name testShortAdd017
     * @tc.desc Verify add method preserves hexadecimal short boundary literal value when adding zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexMax: Short = new Short(0x7FFF as short);
      let zero: Short = new Short(0 as short);
      let result: Short = hexMax.add(zero);
      expect(result.toShort()).assertEqual(Short.MAX_VALUE);
      expect(hexMax.toShort()).assertEqual(Short.MAX_VALUE);
      expect(zero.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1800
     * @tc.name testShortAdd018
     * @tc.desc Verify add method preserves octal short boundary literal value when adding zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalMax: Short = new Short(0o77777 as short);
      let zero: Short = new Short(0 as short);
      let result: Short = octalMax.add(zero);
      expect(result.toShort()).assertEqual(Short.MAX_VALUE);
      expect(octalMax.toShort()).assertEqual(Short.MAX_VALUE);
      expect(zero.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1900
     * @tc.name testShortAdd019
     * @tc.desc Verify add method result keeps long conversion behavior for contract compliance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(15 as short);
      let right: Short = new Short(25 as short);
      let result: Short = left.add(right);
      expect(result.toShort()).assertEqual(40 as short);
      expect(result.toLong()).assertEqual(Long.toLong(40));
      expect(left.toShort()).assertEqual(15 as short);
      expect(right.toShort()).assertEqual(25 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2000
     * @tc.name testShortAdd020
     * @tc.desc Verify add method boundary result keeps float and double conversion behavior for contract compliance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMax: Short = new Short(32766 as short);
      let one: Short = new Short(1 as short);
      let result: Short = nearMax.add(one);
      expect(result.toShort()).assertEqual(Short.MAX_VALUE);
      expect(result.toFloat()).assertEqual(32767.0f);
      expect(result.toDouble()).assertEqual(32767.0);
      expect(nearMax.toShort()).assertEqual(32766 as short);
      expect(one.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2100
     * @tc.name testShortAdd021
     * @tc.desc Verify add method argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(1 as short);
      try {
        left.add(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2200
     * @tc.name testShortAdd022
     * @tc.desc Verify add method argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Short = new Short(1 as short);
      try {
        left.add(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2300
     * @tc.name testShortAdd023
     * @tc.desc Verify add method with mixed sign operands returns positive nonzero short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveOperand: Short = new Short(100 as short);
      let negativeOperand: Short = new Short((-30) as short);
      let result: Short = positiveOperand.add(negativeOperand);
      expect(result.toShort()).assertEqual(70 as short);
      expect(positiveOperand.toShort()).assertEqual(100 as short);
      expect(negativeOperand.toShort()).assertEqual((-30) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2400
     * @tc.name testShortAdd024
     * @tc.desc Verify add method with two negative operands returns correct negative short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNegativeOperand: Short = new Short((-10) as short);
      let rightNegativeOperand: Short = new Short((-20) as short);
      let result: Short = leftNegativeOperand.add(rightNegativeOperand);
      expect(result.toShort()).assertEqual((-30) as short);
      expect(leftNegativeOperand.toShort()).assertEqual((-10) as short);
      expect(rightNegativeOperand.toShort()).assertEqual((-20) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2500
     * @tc.name testShortAdd025
     * @tc.desc Verify add method with zero parameter preserves ordinary positive receiver value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveOperand: Short = new Short(2048 as short);
      let zeroOperand: Short = new Short(0 as short);
      let result: Short = positiveOperand.add(zeroOperand);
      expect(result.toShort()).assertEqual(2048 as short);
      expect(positiveOperand.toShort()).assertEqual(2048 as short);
      expect(zeroOperand.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_2600
     * @tc.name testShortAdd026
     * @tc.desc Verify add method with zero receiver returns ordinary positive parameter value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroOperand: Short = new Short(0 as short);
      let positiveOperand: Short = new Short(99 as short);
      let result: Short = zeroOperand.add(positiveOperand);
      expect(result.toShort()).assertEqual(99 as short);
      expect(zeroOperand.toShort()).assertEqual(0 as short);
      expect(positiveOperand.toShort()).assertEqual(99 as short);
    });
  });
}
