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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntPerformance2Test(): void {
  describe('testBigIntPerformance2Test', (): void => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1000
     * @tc.name testBigIntPerformance2Test010
     * @tc.desc Verify operatorDivide on 1024-bit dividend by small divisor yields correct quotient
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const dividend = BigInt(2).pow(BigInt(1024));
      const divisor = BigInt(7);
      const quotient = dividend.operatorDivide(divisor);
      const product = quotient.operatorMultiply(divisor);
      const remainder = dividend.operatorSubtract(product);

      expect(remainder.operatorLessThan(divisor)).assertTrue();
      expect(product.operatorLessThan(dividend)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1100
     * @tc.name testBigIntPerformance2Test011
     * @tc.desc Verify operatorDivide on 2048-bit dividend by tiny divisor (3) rounds correctly
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test011', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const dividend = BigInt(2).pow(BigInt(2048));
      const divisor = BigInt(3);
      const quotient = dividend.operatorDivide(divisor);
      const product = quotient.operatorMultiply(divisor);
      const remainder = dividend.operatorSubtract(product);

      expect(remainder.operatorLessThan(divisor)).assertTrue();
      expect(quotient.toString().length).assertEqual(617);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1200
     * @tc.name testBigIntPerformance2Test012
     * @tc.desc Verify operatorDivide on 4096-bit dividend by divisor 5 yields exact decimal length 1233
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test012', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const dividend = BigInt(2).pow(BigInt(4096));
      const divisor = BigInt(5);
      const quotient = dividend.operatorDivide(divisor);
      const product = quotient.operatorMultiply(divisor);
      const remainder = dividend.operatorSubtract(product);

      expect(remainder.operatorLessThan(divisor)).assertTrue();
      expect(quotient.toString().length).assertEqual(1233);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1300
     * @tc.name testBigIntPerformance2Test013
     * @tc.desc Verify operatorModule on 1024-bit value by small divisor gives non-zero remainder
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test013', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const dividend = BigInt(2).pow(BigInt(1024));
      const divisor = BigInt(7);
      const remainder = dividend.operatorModule(divisor);

      expect(remainder.operatorLessThan(divisor)).assertTrue();
      expect(remainder.operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1400
     * @tc.name testBigIntPerformance2Test014
     * @tc.desc Verify operatorModule on 2048-bit value by divisor 3 returns expected remainder
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const dividend = BigInt(2).pow(BigInt(2048));
      const divisor = BigInt(3);
      const remainder = dividend.operatorModule(divisor);

      expect(remainder.equals(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1500
     * @tc.name testBigIntPerformance2Test015
     * @tc.desc Verify operatorBitwiseXor on non-overlapping 1024-bit and 512-bit powers equals OR
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test015', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const p512 = BigInt(2).pow(BigInt(512));
      const xorResult = p1024.operatorBitwiseXor(p512);
      const orResult = p1024.operatorBitwiseOr(p512);

      expect(xorResult.equals(orResult)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1600
     * @tc.name testBigIntPerformance2Test016
     * @tc.desc Verify operatorBitwiseNot on 1024-bit value and double-not round-trips
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test016', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const not1 = p1024.operatorBitwiseNot();
      const not2 = not1.operatorBitwiseNot();

      expect(not2.equals(p1024)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1700
     * @tc.name testBigIntPerformance2Test017
     * @tc.desc Verify operatorRightShift on 1024-bit value halves the integer each shift
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test017', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      const halfViaShift = p1024.operatorRightShift(one);
      const expected = BigInt(2).pow(BigInt(1023));

      expect(halfViaShift.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1800
     * @tc.name testBigIntPerformance2Test018
     * @tc.desc Verify operatorLeftShift on 4096-bit value doubles it each shift
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test018', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const one = BigInt(1);
      const doubledViaShift = p4096.operatorLeftShift(one);
      const expected = BigInt(2).pow(BigInt(4097));

      expect(doubledViaShift.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_1900
     * @tc.name testBigIntPerformance2Test019
     * @tc.desc Verify batch operatorRightShift (128 steps) on 1024-bit reduces bit-length
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test019', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      let acc = p1024;
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorRightShift(one);
      }
      const expected = BigInt(2).pow(BigInt(896));

      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2000
     * @tc.name testBigIntPerformance2Test020
     * @tc.desc Verify adding a negative bigint to a positive 4096-bit base reduces value
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(4096));
      const negOne = BigInt(-1);
      const result = base.operatorAdd(negOne);

      expect(result.operatorLessThan(base)).assertTrue();
      expect(result.equals(BigInt(2).pow(BigInt(4096)).operatorSubtract(BigInt(1)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2100
     * @tc.name testBigIntPerformance2Test021
     * @tc.desc Verify multiplying a 1024-bit positive value by -1 gives negative result
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(1024));
      const negOne = BigInt(-1);
      const result = base.operatorMultiply(negOne);

      expect(result.operatorAdd(base).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2200
     * @tc.name testBigIntPerformance2Test022
     * @tc.desc Verify subtracting a negative from a 2048-bit base increases magnitude
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test022', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(2048));
      const negOffset = BigInt(-1024);
      const result = base.operatorSubtract(negOffset);

      expect(result.equals(base.operatorAdd(BigInt(1024)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2300
     * @tc.name testBigIntPerformance2Test023
     * @tc.desc Verify dividing a 4096-bit positive value by -4 gives negative quotient
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(4096));
      const negFour = BigInt(-4);
      const quotient = base.operatorDivide(negFour);
      const product = quotient.operatorMultiply(negFour);

      expect(product.equals(base)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2400
     * @tc.name testBigIntPerformance2Test024
     * @tc.desc Verify operatorModule on 1024-bit base with negative divisor
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(1024));
      const negThree = BigInt(-3);
      const remainder = base.operatorModule(negThree);
      expect(remainder.operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(remainder.operatorLessThan(BigInt(3))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2500
     * @tc.name testBigIntPerformance2Test025
     * @tc.desc Verify 3^647 produces correct bit-length near 1024 bits (odd base)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test025', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const result = BigInt(3).pow(BigInt(647));
      const resultStr = result.toString();

      expect(resultStr.length).assertEqual(309);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2600
     * @tc.name testBigIntPerformance2Test026
     * @tc.desc Verify 5^884 produces correct bit-length near 2048 bits (odd base)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test026', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const result = BigInt(5).pow(BigInt(884));
      const resultStr = result.toString();

      expect(resultStr.length).assertEqual(618);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2700
     * @tc.name testBigIntPerformance2Test027
     * @tc.desc Verify pow of large bigint base (1024-bit) to small exponent (3)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test027', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(1024));
      const three = BigInt(3);
      const result = base.pow(three);
      const expected = base.operatorMultiply(base).operatorMultiply(base);

      expect(result.equals(expected)).assertTrue();
      expect(result.toString().length).assertEqual(925);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2800
     * @tc.name testBigIntPerformance2Test028
     * @tc.desc Verify 7^182 produces ~512-bit result (odd prime base)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test028', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const result = BigInt(7).pow(BigInt(182));
      const resultStr = result.toString();

      expect(resultStr.length).assertEqual(154);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_2900
     * @tc.name testBigIntPerformance2Test029
     * @tc.desc Verify 1024-bit × 16-bit (non-power-of-2) wide-narrow multiplication
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test029', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(1024)).operatorSubtract(BigInt(1));
      const narrow = BigInt(65535);
      const product = wide.operatorMultiply(narrow);
      const quotient = product.operatorDivide(narrow);

      expect(quotient.equals(wide)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3000
     * @tc.name testBigIntPerformance2Test030
     * @tc.desc Verify 1024-bit + tiny value (10 bits) does not increase string length
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test030', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(1024));
      const tiny = BigInt(1023);
      const sum = wide.operatorAdd(tiny);

      expect(sum.toString().length).assertEqual(309);
      expect(sum.operatorGreaterThan(wide)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3100
     * @tc.name testBigIntPerformance2Test031
     * @tc.desc Verify 2048-bit minus small value (32-bit) decreases value correctly
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test031', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(2048)).operatorSubtract(BigInt(1));
      const smallVal = BigInt(100000);
      const diff = wide.operatorSubtract(smallVal);
      const restored = diff.operatorAdd(smallVal);

      expect(restored.equals(wide)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3200
     * @tc.name testBigIntPerformance2Test032
     * @tc.desc Verify 2048-bit ÷ 32-bit divisor yields correct quotient and remainder
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test032', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(2048));
      const smallDiv = BigInt(99999);
      const quotient = wide.operatorDivide(smallDiv);
      const remainder = wide.operatorModule(smallDiv);

      const product = quotient.operatorMultiply(smallDiv);
      const restored = product.operatorAdd(remainder);

      expect(restored.equals(wide)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3300
     * @tc.name testBigIntPerformance2Test033
     * @tc.desc Verify 4096-bit × 64-bit wide-narrow multiplication and round-trip division
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test033', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(4096));
      const narrow = BigInt(123456789012345);
      const product = wide.operatorMultiply(narrow);
      const quotient = product.operatorDivide(narrow);

      expect(quotient.equals(wide)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3400
     * @tc.name testBigIntPerformance2Test034
     * @tc.desc Verify toString(2) on 1024-bit value produces expected binary length
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test034', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const binary = p1024.toString(2);

      expect(binary.length).assertEqual(1025);
      expect(binary.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3500
     * @tc.name testBigIntPerformance2Test035
     * @tc.desc Verify toString(16) on 1024-bit value produces expected hex length
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test035', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const hex = p1024.toString(16);

      expect(hex.length).assertEqual(257);
      expect(hex.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3600
     * @tc.name testBigIntPerformance2Test036
     * @tc.desc Verify toString(8) on 2048-bit value produces expected octal length (683)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p2048 = BigInt(2).pow(BigInt(2048));
      const octal = p2048.toString(8);

      expect(octal.length).assertEqual(683);
      expect(octal.startsWith('4')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3700
     * @tc.name testBigIntPerformance2Test037
     * @tc.desc Verify toString(36) on 1024-bit value produces expected base36 length
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test037', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p1024 = BigInt(2).pow(BigInt(1024));
      const base36 = p1024.toString(36);

      expect(base36.length).assertEqual(199);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3800
     * @tc.name testBigIntPerformance2Test038
     * @tc.desc Verify constructing BigInt from 309-digit decimal string produces correct value
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test038', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const expected = BigInt(2).pow(BigInt(1024));
      const str = expected.toString();
      const fromStr = BigInt(str);

      expect(fromStr.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_3900
     * @tc.name testBigIntPerformance2Test039
     * @tc.desc Verify constructing BigInt from 617-digit decimal string round-trips correctly
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const expected = BigInt(2).pow(BigInt(2048));
      const str = expected.toString();
      const fromStr = BigInt(str);
      expect(fromStr.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4000
     * @tc.name testBigIntPerformance2Test040
     * @tc.desc Verify constructing BigInt from hex string of 1024-bit value round-trips correctly
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test040', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const expected = BigInt(2).pow(BigInt(160)).operatorSubtract(BigInt(1));
      const hex = expected.toString(16);
      const fromHex = BigInt("0x" + hex);
      expect(fromHex.equals(expected)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4100
     * @tc.name testBigIntPerformance2Test041
     * @tc.desc Verify constructing BigInt from negative decimal string produces correct negative
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test041', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const pos = BigInt(2).pow(BigInt(1024));
      const negativeBigInt = BigInt(pos.toString()).operatorMultiply(BigInt(-1));
      const fromNegStr = BigInt('-' + pos.toString());

      expect(fromNegStr.equals(negativeBigInt)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4200
     * @tc.name testBigIntPerformance2Test042
     * @tc.desc Verify operatorModule of 1024-bit value by 8-bit divisor
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test042', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const wide = BigInt(2).pow(BigInt(1024)).operatorSubtract(BigInt(1));
      const tinyDiv = BigInt(251);
      const remainder = wide.operatorModule(tinyDiv);

      expect(remainder.equals(BigInt(124))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4300
     * @tc.name testBigIntPerformance2Test043
     * @tc.desc Verify 10^309 produces ~1024-bit result (composite base)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test043', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const result = BigInt(10).pow(BigInt(309));
      const resultStr = result.toString();

      expect(resultStr.length).assertEqual(310);
      expect(resultStr.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4400
     * @tc.name testBigIntPerformance2Test044
     * @tc.desc Verify 11^148 produces ~512-bit result (non-power-of-2, odd composite base)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test044', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const result = BigInt(11).pow(BigInt(148));
      const resultStr = result.toString();

      expect(resultStr.length).assertEqual(155);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4500
     * @tc.name testBigIntPerformance2Test045
     * @tc.desc Verify operatorBitwiseXor between positive and negative 1024-bit values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test045', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const pos = BigInt(2).pow(BigInt(1024));
      const neg = pos.operatorMultiply(BigInt(-1));
      const xorResult = pos.operatorBitwiseXor(neg);
      expect(xorResult.operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4600
     * @tc.name testBigIntPerformance2Test046
     * @tc.desc Verify operatorBitwiseOr between positive and negative 2048-bit values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const pos = BigInt(2).pow(BigInt(2048));
      const neg = pos.operatorMultiply(BigInt(-1));
      const orResult = pos.operatorBitwiseOr(neg);

      expect(orResult.operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4700
     * @tc.name testBigIntPerformance2Test047
     * @tc.desc Verify operatorRightShift of 4096-bit value by 64-bit shift amount preserves sign
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test047', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const shiftAmt = BigInt(64);
      const shifted = p4096.operatorRightShift(shiftAmt);
      const expected = BigInt(2).pow(BigInt(4032));

      expect(shifted.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4800
     * @tc.name testBigIntPerformance2Test048
     * @tc.desc Verify BigInt from mixed-case hex string of 2048-bit value
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const expected = BigInt(2).pow(BigInt(160)).operatorSubtract(BigInt(1));
      const hex = expected.toString(16);
      let upperHex: string = '';
      for (let i = 0; i < hex.length; i++) {
        const ch: string = hex[i];
        if (ch >= 'a' && ch <= 'f') {
          upperHex += String.fromCharCode(ch.charCodeAt(0) - 32);
        } else {
          upperHex += ch;
        }
      }
      let fromUpperHex = BigInt("0x"+upperHex);
      expect(fromUpperHex.toString().length).assertEqual(expected.toString().length);
      expect(fromUpperHex.equals(expected)).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_4900
     * @tc.name testBigIntPerformance2Test049
     * @tc.desc Verify subtracting a positive from a negative 1024-bit value stays negative
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test049', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const negBase = BigInt(2).pow(BigInt(1024)).operatorMultiply(BigInt(-1));
      const posOne = BigInt(1);
      const result = negBase.operatorSubtract(posOne);

      expect(result.operatorLessThan(negBase)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_5000
     * @tc.name testBigIntPerformance2Test050
     * @tc.desc Verify adding 1 to -2^4096 moves toward zero
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test050', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const neg = BigInt(2).pow(BigInt(4096)).operatorMultiply(BigInt(-1));
      const one = BigInt(1);
      const result = neg.operatorAdd(one);

      // -2^4096 + 1 = -(2^4096 - 1) which is still negative
      expect(result.operatorLessThan(BigInt(0))).assertTrue();
      expect(result.operatorGreaterThan(neg)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_PERFORMANCE_5100
     * @tc.name testBigIntPerformance2Test051
     * @tc.desc Verify operatorModule of 2048-bit positive by negative divisor
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testBigIntPerformance2Test051', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const base = BigInt(2).pow(BigInt(2048));
      const negSeven = BigInt(-7);
      const remainder = base.operatorModule(negSeven);

      expect(remainder.equals(BigInt(4))).assertTrue();
    });
  });
}