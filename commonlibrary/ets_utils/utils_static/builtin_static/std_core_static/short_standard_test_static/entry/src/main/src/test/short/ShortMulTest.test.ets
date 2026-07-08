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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function shortMulTest(): void {
  describe('ShortMulTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0100
     * @tc.name testShortMul001
     * @tc.desc Verify mul method with two positive Short values for correct positive product and source preservation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(6 as short);
      let rightOperand: Short = new Short(4 as short);
      let product: Short = leftOperand.mul(rightOperand);
      expect(product.toShort()).assertEqual(24 as short);
      expect(leftOperand.toShort()).assertEqual(6 as short);
      expect(rightOperand.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0200
     * @tc.name testShortMul002
     * @tc.desc Verify mul method with positive and negative Short values for correct negative product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveOperand: Short = new Short(12 as short);
      let negativeOperand: Short = new Short((-3) as short);
      let product: Short = positiveOperand.mul(negativeOperand);
      expect(product.toShort()).assertEqual((-36) as short);
      expect(positiveOperand.toShort()).assertEqual(12 as short);
      expect(negativeOperand.toShort()).assertEqual((-3) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0300
     * @tc.name testShortMul003
     * @tc.desc Verify mul method with two negative Short values for correct positive product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short((-6) as short);
      let rightOperand: Short = new Short((-4) as short);
      let product: Short = leftOperand.mul(rightOperand);
      expect(product.toShort()).assertEqual(24 as short);
      expect(leftOperand.toShort()).assertEqual((-6) as short);
      expect(rightOperand.toShort()).assertEqual((-4) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0400
     * @tc.name testShortMul004
     * @tc.desc Verify mul method with zero and non-zero Short values for symmetric zero product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroOperand: Short = new Short(0 as short);
      let nonZeroOperand: Short = new Short(7 as short);
      let zeroLeftProduct: Short = zeroOperand.mul(nonZeroOperand);
      let zeroRightProduct: Short = nonZeroOperand.mul(zeroOperand);
      expect(zeroLeftProduct.toShort()).assertEqual(0 as short);
      expect(zeroRightProduct.toShort()).assertEqual(0 as short);
      expect(zeroOperand.toShort()).assertEqual(0 as short);
      expect(nonZeroOperand.toShort()).assertEqual(7 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0500
     * @tc.name testShortMul005
     * @tc.desc Verify mul method with identity element one preserves the original Short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valueOperand: Short = new Short(3 as short);
      let identityOperand: Short = new Short(1 as short);
      let product: Short = valueOperand.mul(identityOperand);
      expect(product.toShort()).assertEqual(3 as short);
      expect(valueOperand.toShort()).assertEqual(3 as short);
      expect(identityOperand.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0600
     * @tc.name testShortMul006
     * @tc.desc Verify mul method with negative one flips sign and double negation restores the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valueOperand: Short = new Short(5 as short);
      let negativeOneOperand: Short = new Short((-1) as short);
      let flippedProduct: Short = valueOperand.mul(negativeOneOperand);
      let restoredProduct: Short = flippedProduct.mul(negativeOneOperand);
      expect(flippedProduct.toShort()).assertEqual((-5) as short);
      expect(restoredProduct.toShort()).assertEqual(5 as short);
      expect(valueOperand.toShort()).assertEqual(5 as short);
      expect(negativeOneOperand.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0700
     * @tc.name testShortMul007
     * @tc.desc Verify mul method with large Short values within range for correct product without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(150 as short);
      let rightOperand: Short = new Short(200 as short);
      let product: Short = leftOperand.mul(rightOperand);
      expect(product.toShort()).assertEqual(30000 as short);
      expect(product.toInt()).assertEqual(30000);
      expect(product.toLong()).assertEqual(Long.toLong(30000));
      expect(leftOperand.toShort()).assertEqual(150 as short);
      expect(rightOperand.toShort()).assertEqual(200 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0800
     * @tc.name testShortMul008
     * @tc.desc Verify mul return value keeps Short conversion behavior across sign combinations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveOperand: Short = new Short(8 as short);
      let negativeOperand: Short = new Short((-3) as short);
      let zeroOperand: Short = new Short(0 as short);
      let factorOperand: Short = new Short(2 as short);
      let positiveProduct: Short = positiveOperand.mul(factorOperand);
      let mixedSignProduct: Short = positiveOperand.mul(negativeOperand);
      let negativeProduct: Short = negativeOperand.mul(negativeOperand);
      let zeroProduct: Short = zeroOperand.mul(positiveOperand);
      expect(positiveProduct.toShort()).assertEqual(16 as short);
      expect(positiveProduct.toInt()).assertEqual(16);
      expect(mixedSignProduct.toShort()).assertEqual((-24) as short);
      expect(mixedSignProduct.toInt()).assertEqual(-24);
      expect(negativeProduct.toShort()).assertEqual(9 as short);
      expect(zeroProduct.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0900
     * @tc.name testShortMul009
     * @tc.desc Verify mul method returns a distinct Short instance and leaves operands unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalOperand: Short = new Short(10 as short);
      let multiplierOperand: Short = new Short(5 as short);
      let originalBefore: short = originalOperand.toShort();
      let multiplierBefore: short = multiplierOperand.toShort();
      let product: Short = originalOperand.mul(multiplierOperand);
      expect(product.toShort()).assertEqual(50 as short);
      expect(product === originalOperand).assertFalse();
      expect(product === multiplierOperand).assertFalse();
      expect(originalOperand.toShort()).assertEqual(originalBefore);
      expect(multiplierOperand.toShort()).assertEqual(multiplierBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1000
     * @tc.name testShortMul010
     * @tc.desc Verify mul method repeated calls on the same operands return consistent products
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(5 as short);
      let rightOperand: Short = new Short(3 as short);
      let firstProduct: Short = leftOperand.mul(rightOperand);
      let secondProduct: Short = leftOperand.mul(rightOperand);
      let thirdProduct: Short = leftOperand.mul(rightOperand);
      expect(firstProduct.toShort()).assertEqual(15 as short);
      expect(secondProduct.toShort()).assertEqual(15 as short);
      expect(thirdProduct.toShort()).assertEqual(15 as short);
      expect(secondProduct.toShort()).assertEqual(firstProduct.toShort());
      expect(thirdProduct.toShort()).assertEqual(firstProduct.toShort());
      expect(leftOperand.toShort()).assertEqual(5 as short);
      expect(rightOperand.toShort()).assertEqual(3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1100
     * @tc.name testShortMul011
     * @tc.desc Verify mul method consistency across different Short instances holding identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstLeftOperand: Short = new Short(8 as short);
      let firstRightOperand: Short = new Short(2 as short);
      let secondLeftOperand: Short = new Short(8 as short);
      let secondRightOperand: Short = new Short(2 as short);
      let firstProduct: Short = firstLeftOperand.mul(firstRightOperand);
      let secondProduct: Short = secondLeftOperand.mul(secondRightOperand);
      expect(firstProduct.toShort()).assertEqual(16 as short);
      expect(secondProduct.toShort()).assertEqual(16 as short);
      expect(secondProduct.toShort()).assertEqual(firstProduct.toShort());
      expect(firstLeftOperand.toShort()).assertEqual(8 as short);
      expect(firstRightOperand.toShort()).assertEqual(2 as short);
      expect(secondLeftOperand.toShort()).assertEqual(8 as short);
      expect(secondRightOperand.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1200
     * @tc.name testShortMul012
     * @tc.desc Verify mul method satisfies commutative property for two different Short operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(7 as short);
      let rightOperand: Short = new Short(9 as short);
      let leftFirstProduct: Short = leftOperand.mul(rightOperand);
      let rightFirstProduct: Short = rightOperand.mul(leftOperand);
      let repeatedProduct: Short = leftOperand.mul(rightOperand);
      expect(leftFirstProduct.toShort()).assertEqual(rightFirstProduct.toShort());
      expect(leftFirstProduct.toShort()).assertEqual(63 as short);
      expect(rightFirstProduct.toShort()).assertEqual(63 as short);
      expect(repeatedProduct.toShort()).assertEqual(63 as short);
      expect(leftOperand.toShort()).assertEqual(7 as short);
      expect(rightOperand.toShort()).assertEqual(9 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1300
     * @tc.name testShortMul013
     * @tc.desc Verify mul method has no side effects across consecutive invocations with different multipliers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalOperand: Short = new Short(4 as short);
      let multiplierValues: short[] = [
        2 as short,
        3 as short,
        4 as short,
        5 as short,
        6 as short
      ];
      let expectedProducts: short[] = [
        8 as short,
        12 as short,
        16 as short,
        20 as short,
        24 as short
      ];
      let iterationLimit: int = 5;
      let iterationIndex: int = 0;
      while (iterationIndex < iterationLimit) {
        let multiplierOperand: Short = new Short(multiplierValues[iterationIndex]);
        let product: Short = originalOperand.mul(multiplierOperand);
        expect(product.toShort()).assertEqual(expectedProducts[iterationIndex]);
        iterationIndex++;
      }
      expect(originalOperand.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1400
     * @tc.name testShortMul014
     * @tc.desc Verify mul method preserves MAX_VALUE and MIN_VALUE boundaries when multiplied by one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValueOperand: Short = new Short(Short.MAX_VALUE);
      let minValueOperand: Short = new Short(Short.MIN_VALUE);
      let identityOperand: Short = new Short(1 as short);
      let maxProduct: Short = maxValueOperand.mul(identityOperand);
      let minProduct: Short = minValueOperand.mul(identityOperand);
      expect(maxProduct.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minProduct.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValueOperand.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValueOperand.toShort()).assertEqual(Short.MIN_VALUE);
      expect(identityOperand.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1500
     * @tc.name testShortMul015
     * @tc.desc Verify mul method preserves adjacent Short boundary values when multiplied by one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMaxOperand: Short = new Short(32766 as short);
      let nearMinOperand: Short = new Short((-32767) as short);
      let identityOperand: Short = new Short(1 as short);
      let nearMaxProduct: Short = nearMaxOperand.mul(identityOperand);
      let nearMinProduct: Short = nearMinOperand.mul(identityOperand);
      expect(nearMaxProduct.toShort()).assertEqual(32766 as short);
      expect(nearMinProduct.toShort()).assertEqual((-32767) as short);
      expect(nearMaxOperand.toShort()).assertEqual(32766 as short);
      expect(nearMinOperand.toShort()).assertEqual((-32767) as short);
      expect(identityOperand.toShort()).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1600
     * @tc.name testShortMul016
     * @tc.desc Verify mul method with 256 times 256 truncates to zero for short high-range overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(256 as short);
      let rightOperand: Short = new Short(256 as short);
      let product: Short = leftOperand.mul(rightOperand);
      expect(product.toShort()).assertEqual(0 as short);
      expect(product.toInt()).assertEqual(0);
      expect(leftOperand.toShort()).assertEqual(256 as short);
      expect(rightOperand.toShort()).assertEqual(256 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1700
     * @tc.name testShortMul017
     * @tc.desc Verify mul method with MAX_VALUE times two truncates to negative two for short overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValueOperand: Short = new Short(Short.MAX_VALUE);
      let twoOperand: Short = new Short(2 as short);
      let product: Short = maxValueOperand.mul(twoOperand);
      expect(product.toShort()).assertEqual((-2) as short);
      expect(maxValueOperand.toShort()).assertEqual(Short.MAX_VALUE);
      expect(twoOperand.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1800
     * @tc.name testShortMul018
     * @tc.desc Verify mul method with MIN_VALUE times two truncates to zero for short overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValueOperand: Short = new Short(Short.MIN_VALUE);
      let twoOperand: Short = new Short(2 as short);
      let product: Short = minValueOperand.mul(twoOperand);
      expect(product.toShort()).assertEqual(0 as short);
      expect(product.toInt()).assertEqual(0);
      expect(minValueOperand.toShort()).assertEqual(Short.MIN_VALUE);
      expect(twoOperand.toShort()).assertEqual(2 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1900
     * @tc.name testShortMul019
     * @tc.desc Verify mul method argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(6 as short);
      try {
        leftOperand.mul(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_2000
     * @tc.name testShortMul020
     * @tc.desc Verify mul method argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: Short = new Short(6 as short);
      try {
        leftOperand.mul(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
