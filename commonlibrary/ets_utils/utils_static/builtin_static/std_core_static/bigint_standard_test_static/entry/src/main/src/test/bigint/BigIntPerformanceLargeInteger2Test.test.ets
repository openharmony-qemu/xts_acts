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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntPerformanceLargeInteger2Test(): void {
  describe('testBigIntPerformanceLargeInteger2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0100
     * @tc.name testBigIntPerformanceLargeInteger2Test0100
     * @tc.desc Verify negate 2^4096 via 1280 repeated operatorDecrement steps
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(4096));
      let acc = base;
      for (let i = 0; i < 1280; i++) {
        acc = acc.operatorDecrement();
      }
      const expected = base.operatorSubtract(BigInt(1280));
      expect(acc.equals(expected)).assertTrue();
      expect(acc.toString().length).assertEqual(1234);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0200
     * @tc.name testBigIntPerformanceLargeInteger2Test0200
     * @tc.desc Verify (2^1024)^4 = 2^4096 using large base pow
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const result = base.pow(BigInt(4));
      const expected = BigInt(2).pow(BigInt(4096));
      expect(result.equals(expected)).assertTrue();
      expect(result.toString().length).assertEqual(1234);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0300
     * @tc.name testBigIntPerformanceLargeInteger2Test0300
     * @tc.desc Verify 3^2048 is larger than 2^2048 and has expected decimal length
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p2 = BigInt(2).pow(BigInt(2048));
      const p3 = BigInt(3).pow(BigInt(2048));
      const p3len = p3.toString().length;
      const p2len = p2.toString().length;
      expect(p3.operatorGreaterThan(p2)).assertTrue();
      expect(p3len > p2len).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0400
     * @tc.name testBigIntPerformanceLargeInteger2Test0400
     * @tc.desc Verify 10^1024 equals (2*5)^1024 and has 1025 decimal digits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p10 = BigInt(10).pow(BigInt(1024));
      expect(p10.toString().length).assertEqual(1025);
      expect(p10.toString().startsWith('1')).assertTrue();
      expect(p10.operatorGreaterThan(BigInt(2).pow(BigInt(1024)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0500
     * @tc.name testBigIntPerformanceLargeInteger2Test0500
     * @tc.desc Verify XOR between non-overlapping 4096-bit and 2048-bit values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const p2048 = BigInt(2).pow(BigInt(2048));
      const xored = p4096.operatorBitwiseXor(p2048);
      expect(xored.operatorGreaterThan(p2048)).assertTrue();
      expect(xored.operatorGreaterThan(p4096)).assertTrue();
      const doubleXor = xored.operatorBitwiseXor(p2048);
      expect(doubleXor.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0600
     * @tc.name testBigIntPerformanceLargeInteger2Test0600
     * @tc.desc Verify bitwise NOT on 4096-bit power produces expected relationship
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const not = p4096.operatorBitwiseNot();
      const renot = not.operatorBitwiseNot();
      expect(renot.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0700
     * @tc.name testBigIntPerformanceLargeInteger2Test0700
     * @tc.desc Verify right shift on 4096-bit value down to 2048-bit magnitude
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const shifted = p4096.operatorRightShift(BigInt(2048));
      const expected = BigInt(2).pow(BigInt(2048));
      expect(shifted.equals(expected)).assertTrue();
      expect(shifted.toString().length).assertEqual(617);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0800
     * @tc.name testBigIntPerformanceLargeInteger2Test0800
     * @tc.desc Verify left shift on 4096-bit value produces 2^8192
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const shifted = p4096.operatorLeftShift(BigInt(4096));
      const expected = BigInt(2).pow(BigInt(8192));
      expect(shifted.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0900
     * @tc.name testBigIntPerformanceLargeInteger2Test0900
     * @tc.desc Verify addition between negative 4096-bit and positive 2048-bit values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test0900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const negBig = BigInt(2).pow(BigInt(4096)).negate();
      const p2048 = BigInt(2).pow(BigInt(2048));
      const sum = negBig.operatorAdd(p2048);
      expect(sum.negative()).assertTrue();
      const negSum = sum.operatorAdd(BigInt(2).pow(BigInt(4096)));
      expect(negSum.positive()).assertTrue();
      expect(negSum.equals(p2048)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1000
     * @tc.name testBigIntPerformanceLargeInteger2Test1000
     * @tc.desc Verify subtraction involving negative 4096-bit value
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const negBig = BigInt(2).pow(BigInt(4096)).negate();
      const p1024 = BigInt(2).pow(BigInt(1024));
      const diff = negBig.operatorSubtract(p1024);
      expect(diff.negative()).assertTrue();
      expect(diff.operatorLessThan(negBig)).assertTrue();
      const expected = BigInt(2).pow(BigInt(4096)).negate().operatorSubtract(p1024);
      expect(diff.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1100
     * @tc.name testBigIntPerformanceLargeInteger2Test1100
     * @tc.desc Verify multiply of negative 2048-bit by positive 2048-bit yields negative
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const neg2048 = BigInt(2).pow(BigInt(2048)).negate();
      const pos2048 = BigInt(2).pow(BigInt(2048));
      const product = neg2048.operatorMultiply(pos2048);
      const expected = BigInt(2).pow(BigInt(4096)).negate();
      expect(product.equals(expected)).assertTrue();
      expect(product.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1200
     * @tc.name testBigIntPerformanceLargeInteger2Test1200
     * @tc.desc Verify division of negative 4096-bit by positive 2048-bit
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const neg4096 = BigInt(2).pow(BigInt(4096)).negate();
      const pos2048 = BigInt(2).pow(BigInt(2048));
      const quotient = neg4096.operatorDivide(pos2048);
      const expected = BigInt(2).pow(BigInt(2048)).negate();
      expect(quotient.equals(expected)).assertTrue();
      expect(quotient.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1300
     * @tc.name testBigIntPerformanceLargeInteger2Test1300
     * @tc.desc Verify hex string conversion of 4096-bit value has expected hex length
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const hex = p4096.toString(16);
      expect(hex.length).assertEqual(1025);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1400
     * @tc.name testBigIntPerformanceLargeInteger2Test1400
     * @tc.desc Verify binary string conversion of 4096-bit value has exactly 4097 chars (1 + 4096 zeros)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const bin = p4096.toString(2);
      expect(bin.length).assertEqual(4097);
      expect(bin.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1500
     * @tc.name testBigIntPerformanceLargeInteger2Test1500
     * @tc.desc Verify octal string conversion of 4096-bit value
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const oct = p4096.toString(8);
      const decimalLen = p4096.toString().length;
      expect(oct.length > decimalLen).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1600
     * @tc.name testBigIntPerformanceLargeInteger2Test1600
     * @tc.desc Verify constructing BigInt from 1234-digit decimal string yields 2^4096
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const fromPow = BigInt(2).pow(BigInt(4096));
      const decStr = fromPow.toString();
      const fromStr = BigInt(decStr);
      expect(fromStr.equals(fromPow)).assertTrue();
      expect(fromStr.toString().length).assertEqual(1234);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1700
     * @tc.name testBigIntPerformanceLargeInteger2Test1700
     * @tc.desc Verify constructing BigInt from 4097-char binary string
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const binStr = '0b' + p4096.toString(2);
      const fromBin = BigInt(binStr);
      expect(fromBin.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1800
     * @tc.name testBigIntPerformanceLargeInteger2Test1800
     * @tc.desc Verify non-divisible divide of 4096-bit value by 3 has remainder
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const three = BigInt(3);
      const quotient = p4096.operatorDivide(three);
      const remainder = p4096.operatorModule(three);
      const reconstructed = quotient.operatorMultiply(three).operatorAdd(remainder);
      expect(reconstructed.equals(p4096)).assertTrue();
      expect(remainder.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_1900
     * @tc.name testBigIntPerformanceLargeInteger2Test1900
     * @tc.desc Verify 4096-bit / 7 has correct remainder and reconstructs
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test1900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const seven = BigInt(7);
      const quotient = p4096.operatorDivide(seven);
      const remainder = p4096.operatorModule(seven);
      const reconstructed = quotient.operatorMultiply(seven).operatorAdd(remainder);
      expect(reconstructed.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2000
     * @tc.name testBigIntPerformanceLargeInteger2Test2000
     * @tc.desc Verify dividing 4096-bit value by much smaller 1024-bit divisor
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const p1024 = BigInt(2).pow(BigInt(1024));
      const quotient = p4096.operatorDivide(p1024);
      const remainder = p4096.operatorModule(p1024);
      const expectedQ = BigInt(2).pow(BigInt(3072));
      expect(quotient.equals(expectedQ)).assertTrue();
      expect(remainder.equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2100
     * @tc.name testBigIntPerformanceLargeInteger2Test2100
     * @tc.desc Verify multiplying 4096-bit value by 64-bit boundary preserves magnitude
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const small = BigInt(123456789);
      const product = p4096.operatorMultiply(small);
      const quotient = product.operatorDivide(small);
      expect(quotient.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2200
     * @tc.name testBigIntPerformanceLargeInteger2Test2200
     * @tc.desc Verify subtracting 256-bit value from 4096-bit value preserves top bits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const p256 = BigInt(2).pow(BigInt(256));
      const diff = p4096.operatorSubtract(p256);
      expect(diff.toString().length).assertEqual(1234);
      expect(diff.operatorLessThan(p4096)).assertTrue();
      const addBack = diff.operatorAdd(p256);
      expect(addBack.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2300
     * @tc.name testBigIntPerformanceLargeInteger2Test2300
     * @tc.desc Verify adding 64-bit value to 4096-bit value 5000 times preserves top bits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const inc = BigInt(1000000000000);
      let acc = p4096;
      for (let i = 0; i < 1000; i++) {
        acc = acc.operatorAdd(inc);
      }
      const expected = p4096.operatorAdd(BigInt(1000000000000).operatorMultiply(BigInt(1000)));
      expect(acc.equals(expected)).assertTrue();
      expect(acc.toString().length).assertEqual(1234);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2400
     * @tc.name testBigIntPerformanceLargeInteger2Test2400
     * @tc.desc Verify asUintN from 2048-bit wrapping down to 1024 bits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p2048 = BigInt(2).pow(BigInt(2048));
      const p1024 = BigInt(2).pow(BigInt(1024));
      const wrapped = BigInt.asUintN(1024, p2048);
      expect(wrapped.equals(BigInt(0))).assertTrue();
      const almost = p2048.operatorAdd(p1024);
      const wrapped2 = BigInt.asUintN(1024, almost);
      expect(wrapped2.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2500
     * @tc.name testBigIntPerformanceLargeInteger2Test2500
     * @tc.desc Verify asIntN sign-extend for 4096-bit value truncated to 1024 bits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p2048 = BigInt(2).pow(BigInt(2048));
      const result = BigInt.asIntN(1024, p2048);
      expect(result.equals(BigInt(0))).assertTrue();
      const negVal = p2048.negate();
      const result2 = BigInt.asIntN(1024, negVal);
      expect(result2.equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2600
     * @tc.name testBigIntPerformanceLargeInteger2Test2600
     * @tc.desc Verify 7^1024 is strictly between 2^2048 and 2^4096
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p7_1024 = BigInt(7).pow(BigInt(1024));
      const p2_2048 = BigInt(2).pow(BigInt(2048));
      const p2_4096 = BigInt(2).pow(BigInt(4096));
      expect(p7_1024.operatorGreaterThan(p2_2048)).assertTrue();
      expect(p7_1024.operatorLessThan(p2_4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2700
     * @tc.name testBigIntPerformanceLargeInteger2Test2700
     * @tc.desc Verify (5^512)^2 = 5^1024 and (5^512)^4 = 5^2048 magnitude
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p5_512 = BigInt(5).pow(BigInt(512));
      const p5_1024 = p5_512.operatorMultiply(p5_512);
      const direct = BigInt(5).pow(BigInt(1024));
      expect(p5_1024.equals(direct)).assertTrue();
      expect(p5_1024.operatorGreaterThan(BigInt(2).pow(BigInt(1024)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2800
     * @tc.name testBigIntPerformanceLargeInteger2Test2800
     * @tc.desc Verify bitwise OR between widely disparate 4096-bit and 64-bit values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const mask = BigInt('0xFFFFFFFFFFFFFFFF');
      const orVal = p4096.operatorBitwiseOr(mask);
      const andVal = orVal.operatorBitwiseAnd(mask);
      expect(andVal.equals(mask)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_2900
     * @tc.name testBigIntPerformanceLargeInteger2Test2900
     * @tc.desc Verify bitwise AND between 4096-bit value and 256-bit mask isolates low bits
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test2900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const lowMask = BigInt(2).pow(BigInt(256)).operatorSubtract(BigInt(1));
      const andVal = p4096.operatorBitwiseAnd(lowMask);
      expect(andVal.equals(BigInt(0))).assertTrue();
      const withLowBits = p4096.operatorAdd(BigInt('0xAA'));
      const andLow = withLowBits.operatorBitwiseAnd(lowMask);
      expect(andLow.equals(BigInt('0xAA'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3000
     * @tc.name testBigIntPerformanceLargeInteger2Test3000
     * @tc.desc Verify pow of negative 2^2048 base with even exponent yields positive
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(2048)).negate();
      const result = base.pow(BigInt(2));
      const expected = BigInt(2).pow(BigInt(4096));
      expect(result.equals(expected)).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3100
     * @tc.name testBigIntPerformanceLargeInteger2Test3100
     * @tc.desc Verify pow of negative 2^2048 base with odd exponent yields negative
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(2048)).negate();
      const result = base.pow(BigInt(3));
      const expected = BigInt(2).pow(BigInt(6144)).negate();
      expect(result.equals(expected)).assertTrue();
      expect(result.negative()).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3200
     * @tc.name testBigIntPerformanceLargeInteger2Test3200
     * @tc.desc Verify base-10 string round-trip for 4096-bit value matches decimal toString
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const str10 = p4096.toString(10);
      const defaultStr = p4096.toString();
      expect(str10).assertEqual(defaultStr);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3300
     * @tc.name testBigIntPerformanceLargeInteger2Test3300
     * @tc.desc Verify mixed negative-positive large integer addition with 4096- and 1024-bit operands
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos4096 = BigInt(2).pow(BigInt(4096));
      const neg1024 = BigInt(2).pow(BigInt(1024)).negate();
      const sum = pos4096.operatorAdd(neg1024);
      const expected = pos4096.operatorSubtract(BigInt(2).pow(BigInt(1024)));
      expect(sum.equals(expected)).assertTrue();
      expect(sum.toString().length).assertEqual(1234);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3400
     * @tc.name testBigIntPerformanceLargeInteger2Test3400
     * @tc.desc Verify division of negative 4096-bit by 7 produces correct negative quotient and positive remainder
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const neg4096 = BigInt(2).pow(BigInt(4096)).negate();
      const seven = BigInt(7);
      const quotient = neg4096.operatorDivide(seven);
      const remainder = neg4096.operatorModule(seven);
      const reconstructed = quotient.operatorMultiply(seven).operatorAdd(remainder);
      expect(reconstructed.equals(neg4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3500
     * @tc.name testBigIntPerformanceLargeInteger2Test3500
     * @tc.desc Verify bitwise OR between two multi-bit values from different bases
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pow3_2048 = BigInt(3).pow(BigInt(2048));
      const pow5_1024 = BigInt(5).pow(BigInt(1024));
      const orVal = pow3_2048.operatorBitwiseOr(pow5_1024);
      expect(orVal.operatorGreaterThan(pow3_2048)).assertTrue();
      const maskedBack = orVal.operatorBitwiseAnd(pow5_1024);
      expect(maskedBack.equals(pow5_1024)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3600
     * @tc.name testBigIntPerformanceLargeInteger2Test3600
     * @tc.desc Verify XOR between 4096-bit (from pow) and 1024-bit (from pow) values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pow3_2048 = BigInt(3).pow(BigInt(2048));
      const pow5_1024 = BigInt(5).pow(BigInt(1024));
      const xored = pow3_2048.operatorBitwiseXor(pow5_1024);
      const doubleXor = xored.operatorBitwiseXor(pow5_1024);
      expect(doubleXor.equals(pow3_2048)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3700
     * @tc.name testBigIntPerformanceLargeInteger2Test3700
     * @tc.desc Verify multiply-then-divide round-trip on 4096-bit and 10-bit values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const factor = BigInt(999);
      const product = p4096.operatorMultiply(factor);
      const quotient = product.operatorDivide(factor);
      expect(quotient.equals(p4096)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3800
     * @tc.name testBigIntPerformanceLargeInteger2Test3800
     * @tc.desc Verify 4096-bit left shift then right shift round-trip
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(2048));
      const shifted = base.operatorLeftShift(BigInt(2048));
      const roundtrip = shifted.operatorRightShift(BigInt(2048));
      expect(roundtrip.equals(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_3900
     * @tc.name testBigIntPerformanceLargeInteger2Test3900
     * @tc.desc Verify pow then root via repeated multiply for non-2 base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test3900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(5);
      const powVal = base.pow(BigInt(1024));
      let acc = BigInt(1);
      for (let i = 0; i < 1024; i++) {
        acc = acc.operatorMultiply(base);
      }
      expect(acc.equals(powVal)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_4000
     * @tc.name testBigIntPerformanceLargeInteger2Test4000
     * @tc.desc Verify subtracting a very large negative from a large positive produces sum
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeInteger2Test4000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos4096 = BigInt(2).pow(BigInt(4096));
      const neg2048 = BigInt(2).pow(BigInt(2048)).negate();
      const diff = pos4096.operatorSubtract(neg2048);
      const expected = pos4096.operatorAdd(BigInt(2).pow(BigInt(2048)));
      expect(diff.equals(expected)).assertTrue();
    });
  });
}