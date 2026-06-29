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

function getBigInt(): BigInt { return BigInt(0); }
function getBigInt255(): BigInt { return BigInt(255); }

export default function BigIntOperatorBitwiseXorTest_2(): void {
  describe('BigInt.operatorBitwiseXor - expanded param dimensions', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1100
     * @tc.name testBigIntOperatorBitwiseXorByteShortBoundary1100
     * @tc.desc operatorBitwiseXor with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorByteShortBoundary1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorBitwiseXor(BigInt(127)).toString()).assertEqual('0');
      expect(BigInt(-128).operatorBitwiseXor(BigInt(-128)).toString()).assertEqual('0');
      expect(BigInt(32767).operatorBitwiseXor(BigInt(32767)).toString()).assertEqual('0');
      expect(BigInt(-32768).operatorBitwiseXor(BigInt(-32768)).toString()).assertEqual('0');
      expect(BigInt(127).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-128');
      expect(BigInt(127).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-128');
      expect(BigInt(-128).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('127');
      expect(BigInt(32767).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-32768');
      expect(BigInt(-32768).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('32767');
      expect(BigInt(127).operatorBitwiseXor(BigInt(-128)).toString()).assertEqual('-1');
      expect(BigInt(32767).operatorBitwiseXor(BigInt(-32768)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1200
     * @tc.name testBigIntOperatorBitwiseXorIntBoundary1200
     * @tc.desc operatorBitwiseXor with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorIntBoundary1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-2147483648');
      expect(BigInt(2147483647).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483648).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('2147483647');
      expect(BigInt(2147483647).operatorBitwiseXor(BigInt(-2147483648)).toString()).assertEqual('-1');
      expect(BigInt(2147483647).operatorBitwiseXor(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseXor(BigInt(-2147483648)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1300
     * @tc.name testBigIntOperatorBitwiseXorLongAdjacent1300
     * @tc.desc operatorBitwiseXor with values adjacent to signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLongAdjacent1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nearMax = BigInt('9223372036854775806');
      const nearMin = BigInt('-9223372036854775807');

      expect(nearMax.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('9223372036854775806');
      expect(nearMin.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-9223372036854775807');
      expect(nearMax.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-9223372036854775807');
      expect(nearMin.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('9223372036854775806');
      expect(nearMax.operatorBitwiseXor(BigInt(1)).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1400
     * @tc.name testBigIntOperatorBitwiseXorLargeDigitLength1400
     * @tc.desc operatorBitwiseXor with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLargeDigitLength1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect(BigInt(v20).operatorBitwiseXor(BigInt(v20)).toString()).assertEqual('0');
      expect(BigInt(v20_neg).operatorBitwiseXor(BigInt(v20_neg)).toString()).assertEqual('0');
      expect(BigInt(v40).operatorBitwiseXor(BigInt(v40)).toString()).assertEqual('0');
      expect(BigInt(v40_neg).operatorBitwiseXor(BigInt(v40_neg)).toString()).assertEqual('0');
      expect(BigInt(v20).operatorBitwiseXor(BigInt(0)).toString()).assertEqual(v20);
      expect(BigInt(v40).operatorBitwiseXor(BigInt(0)).toString()).assertEqual(v40);
      expect(BigInt(v20).operatorBitwiseXor(BigInt(v40)).toString()).assertEqual(
        BigInt(v40).operatorBitwiseXor(BigInt(v20)).toString());
      expect(BigInt(v20).operatorBitwiseXor(BigInt(-1)).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual(v20);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1500
     * @tc.name testBigIntOperatorBitwiseXorCrossFormatConsistency1500
     * @tc.desc operatorBitwiseXor with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCrossFormatConsistency1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('127').operatorBitwiseXor(BigInt('1')).toString()).assertEqual(
        BigInt(127).operatorBitwiseXor(BigInt(1)).toString());
      expect(BigInt('-128').operatorBitwiseXor(BigInt('-1')).toString()).assertEqual(
        BigInt(-128).operatorBitwiseXor(BigInt(-1)).toString());
      expect(BigInt('32767').operatorBitwiseXor(BigInt('1')).toString()).assertEqual(
        BigInt(32767).operatorBitwiseXor(BigInt(1)).toString());
      expect(BigInt('2147483647').operatorBitwiseXor(BigInt('1')).toString()).assertEqual(
        BigInt(2147483647).operatorBitwiseXor(BigInt(1)).toString());
      expect(BigInt('9223372036854775807').operatorBitwiseXor(BigInt('1')).toString()).assertEqual(
        BigInt(9223372036854775807).operatorBitwiseXor(BigInt(1)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1600
     * @tc.name testBigIntOperatorBitwiseXorNearZeroValues1600
     * @tc.desc operatorBitwiseXor with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNearZeroValues1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(0).operatorBitwiseXor(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseXor(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(-1).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-1');
      expect(BigInt(1).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-2');
      expect(BigInt(-1).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseXor(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt(2).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt(4).operatorBitwiseXor(BigInt(7)).toString()).assertEqual('3');
      expect(BigInt(-1).operatorBitwiseXor(BigInt(-2)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1700
     * @tc.name testBigIntOperatorBitwiseXorPowerOfTwo1700
     * @tc.desc operatorBitwiseXor with power-of-2 values and adjacent boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorPowerOfTwo1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorBitwiseXor(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1024).operatorBitwiseXor(BigInt(1024)).toString()).assertEqual('0');
      expect(BigInt(1048576).operatorBitwiseXor(BigInt(1048576)).toString()).assertEqual('0');
      expect(BigInt(2147483648).operatorBitwiseXor(BigInt(2147483648)).toString()).assertEqual('0');
      expect(BigInt('9223372036854775808').operatorBitwiseXor(BigInt('9223372036854775808')).toString()).assertEqual('0');
      expect(BigInt(1024).operatorBitwiseXor(BigInt(1023)).toString()).assertEqual('2047');
      expect(BigInt(1048576).operatorBitwiseXor(BigInt(1048575)).toString()).assertEqual('2097151');
      expect(BigInt(2147483648).operatorBitwiseXor(BigInt(2147483647)).toString()).assertEqual('4294967295');
      expect(BigInt(1024).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-1025');
      expect(BigInt('9223372036854775808').operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-9223372036854775809');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1800
     * @tc.name testBigIntOperatorBitwiseXorMultiByteMask1800
     * @tc.desc operatorBitwiseXor combining and self-cancelling multi-byte masks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorMultiByteMask1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorBitwiseXor(BigInt(65280)).toString()).assertEqual('65535');
      expect(BigInt(255).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('0');
      expect(BigInt(65280).operatorBitwiseXor(BigInt(65280)).toString()).assertEqual('0');
      expect(BigInt(65535).operatorBitwiseXor(BigInt(65535)).toString()).assertEqual('0');
      expect(BigInt(255).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('255');
      expect(BigInt(65280).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('65280');
      expect(BigInt(255).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-256');
      expect(BigInt(65280).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-65281');
      expect(BigInt(65535).operatorBitwiseXor(BigInt(65280)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1900
     * @tc.name testBigIntOperatorBitwiseXorDeepBoundary1900
     * @tc.desc operatorBitwiseXor with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorDeepBoundary1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;

      expect(BigInt(big100).operatorBitwiseXor(BigInt(big100)).toString()).assertEqual('0');
      expect(BigInt(big100).operatorBitwiseXor(BigInt(0)).toString()).assertEqual(big100);
      expect(BigInt(negBig100).operatorBitwiseXor(BigInt(negBig100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2000
     * @tc.name testBigIntOperatorBitwiseXorSequentialChaining2000
     * @tc.desc sequential chained operatorBitwiseXor calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSequentialChaining2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(1);
      const b = BigInt(2);
      const c = BigInt(4);

      expect(a.operatorBitwiseXor(b).operatorBitwiseXor(c).toString()).assertEqual('7');
      expect(a.operatorBitwiseXor(b).toString()).assertEqual('3');
      expect(a.operatorBitwiseXor(c).toString()).assertEqual('5');
      expect(b.operatorBitwiseXor(c).toString()).assertEqual('6');
      expect(a.toString()).assertEqual('1');
      expect(b.toString()).assertEqual('2');
      expect(c.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2100
     * @tc.name testBigIntOperatorBitwiseXorAlternatingPattern2100
     * @tc.desc operatorBitwiseXor with alternating bit masks (0xAAAA ^ 0x5555 = 0xFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorAlternatingPattern2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const altEven = BigInt('2863311530');
      const altOdd = BigInt('1431655765');

      expect(altEven.operatorBitwiseXor(altOdd).toString()).assertEqual('4294967295');
      expect(altOdd.operatorBitwiseXor(altEven).toString()).assertEqual('4294967295');
      expect(altEven.operatorBitwiseXor(altEven).toString()).assertEqual('0');
      expect(altOdd.operatorBitwiseXor(altOdd).toString()).assertEqual('0');
      expect(altEven.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('2863311530');
      expect(altEven.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-2863311531');
      expect(altOdd.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-1431655766');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2200
     * @tc.name testBigIntOperatorBitwiseXorAssociativity2200
     * @tc.desc operatorBitwiseXor associativity: (a ^ b) ^ c == a ^ (b ^ c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorAssociativity2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sets: BigInt[][] = [
        [BigInt(12), BigInt(10), BigInt(5)],
        [BigInt(127), BigInt(-128), BigInt(-1)],
        [BigInt(2147483647), BigInt(-2147483648), BigInt(0)],
        [BigInt('9223372036854775807'), BigInt('-9223372036854775808'), BigInt(1)],
        [BigInt('12345678901234567890'), BigInt('-12345678901234567890'), BigInt('9999999999')],
      ];

      for (const s of sets) {
        const left = s[0].operatorBitwiseXor(s[1]).operatorBitwiseXor(s[2]).toString();
        const right = s[0].operatorBitwiseXor(s[1].operatorBitwiseXor(s[2])).toString();
        expect(left).assertEqual(right);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2300
     * @tc.name testBigIntOperatorBitwiseXorSelfInverse2300
     * @tc.desc operatorBitwiseXor self-inverse property: (x ^ y) ^ x == y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSelfInverse2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pairs: BigInt[][] = [
        [BigInt(127), BigInt(-128)],
        [BigInt(32767), BigInt(-32768)],
        [BigInt(2147483647), BigInt(-2147483648)],
        [BigInt('9223372036854775807'), BigInt('-9223372036854775808')],
        [BigInt('12345678901234567890'), BigInt('9876543210987654321')],
      ];

      for (const p of pairs) {
        const y = p[1];
        const recovered = p[0].operatorBitwiseXor(p[1]).operatorBitwiseXor(p[0]).toString();
        expect(recovered).assertEqual(y.toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2400
     * @tc.name testBigIntOperatorBitwiseXorNotViaMinusOne2400
     * @tc.desc operatorBitwiseXor with -1 acts as bitwise NOT: x ^ (-1) == ~x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNotViaMinusOne2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targets: BigInt[] = [
        BigInt(0), BigInt(1), BigInt(-1),
        BigInt(127), BigInt(-128), BigInt(32767),
        BigInt(-32768), BigInt(2147483647), BigInt(-2147483648),
        BigInt('9223372036854775807'), BigInt('-9223372036854775808'),
        BigInt('12345678901234567890'),
      ];

      for (const v of targets) {
        const xorNot = v.operatorBitwiseXor(BigInt(-1)).toString();
        const bitwiseNot = v.operatorBitwiseNot().toString();
        expect(xorNot).assertEqual(bitwiseNot);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2500
     * @tc.name testBigIntOperatorBitwiseXorIncrementalToggle2500
     * @tc.desc operatorBitwiseXor toggling bits incrementally from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorIncrementalToggle2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let acc = BigInt(0);
      const bits: BigInt[] = [
        BigInt(1), BigInt(2), BigInt(4), BigInt(8),
        BigInt(16), BigInt(32), BigInt(64), BigInt(128),
      ];

      for (let i = 0; i < bits.length; i++) {
        acc = acc.operatorBitwiseXor(bits[i]);
        expect(acc.toString()).assertEqual(BigInt(Math.pow(2, i + 1) - 1).toString());
      }
      acc = acc.operatorBitwiseXor(BigInt(128));
      expect(acc.toString()).assertEqual('127');
      acc = acc.operatorBitwiseXor(BigInt(64));
      expect(acc.toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2600
     * @tc.name testBigIntOperatorBitwiseXorCommutativeExtensive2600
     * @tc.desc operatorBitwiseXor commutativity validated across 12 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCommutativeExtensive2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: BigInt[] = [
        BigInt(0), BigInt(1), BigInt(-1),
        BigInt(127), BigInt(-128),
        BigInt(32767), BigInt(-32768),
        BigInt(2147483647), BigInt(-2147483648),
        BigInt('9223372036854775807'), BigInt('-9223372036854775808'),
        BigInt('12345678901234567890'),
      ];

      for (let i = 0; i < values.length; i++) {
        for (let j = i; j < values.length; j++) {
          const ij = values[i].operatorBitwiseXor(values[j]).toString();
          const ji = values[j].operatorBitwiseXor(values[i]).toString();
          expect(ij).assertEqual(ji);
        }
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2700
     * @tc.name testBigIntOperatorBitwiseXorDisjointHighLow2700
     * @tc.desc operatorBitwiseXor combining disjoint high and low bit regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorDisjointHighLow2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const low16 = BigInt(65535);
      const high16 = BigInt('4294901760');
      const full32 = BigInt('4294967295');

      expect(low16.operatorBitwiseXor(high16).toString()).assertEqual('4294967295');
      expect(high16.operatorBitwiseXor(low16).toString()).assertEqual('4294967295');
      expect(low16.operatorBitwiseXor(full32).toString()).assertEqual('4294901760');
      expect(high16.operatorBitwiseXor(full32).toString()).assertEqual('65535');
      expect(low16.operatorBitwiseXor(low16).toString()).assertEqual('0');
      expect(high16.operatorBitwiseXor(high16).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2800
     * @tc.name testBigIntOperatorBitwiseXorBasicMissing2800
     * @tc.desc operatorBitwiseXor basic function cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBasicMissing2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseXor(BigInt(-5)).toString()).assertEqual('-5');
      expect(BigInt(-5).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-5');
      expect(BigInt(2).operatorBitwiseXor(BigInt(4)).toString()).assertEqual('6');
      expect(BigInt(7).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('4');
      expect(BigInt(15).operatorBitwiseXor(BigInt(240)).toString()).assertEqual('255');
      expect(BigInt(0x0F).operatorBitwiseXor(BigInt(0xF0)).toString()).assertEqual('255');
      expect(BigInt(0b1010).operatorBitwiseXor(BigInt(0b0101)).toString()).assertEqual('15');
      expect(BigInt(0b1111).operatorBitwiseXor(BigInt(0b0000)).toString()).assertEqual('15');
      expect(BigInt(0b1100).operatorBitwiseXor(BigInt(0b1010)).toString()).assertEqual('6');
      expect(BigInt(0b1010).operatorBitwiseXor(BigInt(0b1010)).toString()).assertEqual('0');
      expect(BigInt(0b1111).operatorBitwiseXor(BigInt(0b0111)).toString()).assertEqual('8');
      expect(BigInt(0b11110000).operatorBitwiseXor(BigInt(0b00001111)).toString()).assertEqual('255');
      expect(BigInt(0b11001100).operatorBitwiseXor(BigInt(0b11001100)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_2900
     * @tc.name testBigIntOperatorBitwiseXorBoundaryMissing2900
     * @tc.desc operatorBitwiseXor boundary cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBoundaryMissing2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').operatorBitwiseXor(BigInt(0)).toString()).assertEqual('9223372036854775807');
      expect(BigInt('9223372036854775807').operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-9223372036854775808');
      expect(BigInt(32767).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('32767');
      expect(BigInt(-32768).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-32768');
      expect(BigInt(127).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-128');
      const u32max = BigInt('4294967295');
      const u32next = BigInt('4294967296');
      const u64max = BigInt('18446744073709551615');
      const u64next = BigInt('18446744073709551616');
      expect(u32max.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('4294967295');
      expect(u32max.operatorBitwiseXor(u32next).toString()).assertEqual('8589934591');
      expect(u64max.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('18446744073709551615');
      expect(u64max.operatorBitwiseXor(u64next).toString()).assertEqual('36893488147419103231');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3000
     * @tc.name testBigIntOperatorBitwiseXorSingleBitMissing3000
     * @tc.desc operatorBitwiseXor single-bit test cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSingleBitMissing3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorBitwiseXor(BigInt(4)).toString()).assertEqual('6');
      expect(BigInt(4).operatorBitwiseXor(BigInt(8)).toString()).assertEqual('12');
      expect(BigInt(8).operatorBitwiseXor(BigInt(16)).toString()).assertEqual('24');
      expect(BigInt(128).operatorBitwiseXor(BigInt(256)).toString()).assertEqual('384');
      expect(BigInt(32768).operatorBitwiseXor(BigInt(65536)).toString()).assertEqual('98304');
      expect(BigInt(2147483648).operatorBitwiseXor(BigInt('4294967296')).toString()).assertEqual('6442450944');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3100
     * @tc.name testBigIntOperatorBitwiseXorMultiBitMissing3100
     * @tc.desc operatorBitwiseXor multi-bit combination cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorMultiBitMissing3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0x0F).operatorBitwiseXor(BigInt(0x0F)).toString()).assertEqual('0');
      expect(BigInt(0x0F).operatorBitwiseXor(BigInt(0xF0)).toString()).assertEqual('255');
      expect(BigInt(0x0F0F0F0F).operatorBitwiseXor(BigInt(0xF0F0F0F0)).toString()).assertEqual('4294967295');
      expect(BigInt(0x11111111).operatorBitwiseXor(BigInt(0x22222222)).toString()).assertEqual('858993459');
      expect(BigInt(0x000F).operatorBitwiseXor(BigInt(0x00F0)).toString()).assertEqual('255');
      expect(BigInt(0x000000FF).operatorBitwiseXor(BigInt(0x0000FF00)).toString()).assertEqual('65535');
      expect(BigInt(0x55).operatorBitwiseXor(BigInt(0x55)).toString()).assertEqual('0');
      expect(BigInt(0xAAF).operatorBitwiseXor(BigInt(0xAAF)).toString()).assertEqual('0');
      expect(BigInt(0x07).operatorBitwiseXor(BigInt(0x38)).toString()).assertEqual('63');
      expect(BigInt(0x03).operatorBitwiseXor(BigInt(0x0C)).toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3200
     * @tc.name testBigIntOperatorBitwiseXorNegativeMissing3200
     * @tc.desc operatorBitwiseXor negative number cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNegativeMissing3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).operatorBitwiseXor(BigInt(2)).toString()).assertEqual('-4');
      expect(BigInt(-3).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('-2');
      expect(BigInt(-4).operatorBitwiseXor(BigInt(4)).toString()).assertEqual('-8');
      expect(BigInt(-8).operatorBitwiseXor(BigInt(8)).toString()).assertEqual('-16');
      expect(BigInt(-16).operatorBitwiseXor(BigInt(16)).toString()).assertEqual('-32');
      expect(BigInt(-256).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('-1');
      expect(BigInt(-65536).operatorBitwiseXor(BigInt(65535)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3300
     * @tc.name testBigIntOperatorBitwiseXorLargePowerOfTwo3300
     * @tc.desc operatorBitwiseXor with 2^100 and 2^200 large power-of-two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLargePowerOfTwo3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const two = BigInt(2);
      const twoPow100 = BigInt('1267650600228229401496703205376');
      expect(twoPow100.operatorBitwiseXor(twoPow100).toString()).assertEqual('0');
      const twoPow101 = BigInt('2535301200456458802993406410752');
      const expected097 = BigInt('3802951800684688204490109616128');
      expect(twoPow100.operatorBitwiseXor(twoPow101).toString()).assertEqual(expected097.toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3400
     * @tc.name testBigIntOperatorBitwiseXorLargePowerOfTen3400
     * @tc.desc operatorBitwiseXor with 10^50 large number cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLargePowerOfTen3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const tenPow50 = BigInt('100000000000000000000000000000000000000000000000000');
      const negTenPow50 = BigInt('-100000000000000000000000000000000000000000000000000');
      expect(tenPow50.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('100000000000000000000000000000000000000000000000000');
      expect(tenPow50.operatorBitwiseXor(tenPow50).toString()).assertEqual('0');
      expect(tenPow50.operatorBitwiseXor(BigInt(1)).toString()).assertEqual('100000000000000000000000000000000000000000000000001');
      expect(tenPow50.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-100000000000000000000000000000000000000000000000001');
      expect(negTenPow50.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-100000000000000000000000000000000000000000000000000');
      expect(negTenPow50.operatorBitwiseXor(negTenPow50).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3500
     * @tc.name testBigIntOperatorBitwiseXorOperationResult3500
     * @tc.desc operatorBitwiseXor with operation results as operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorOperationResult3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorAdd(BigInt(200)).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('467');
      expect(BigInt(100).operatorMultiply(BigInt(100)).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('10223');
      expect(BigInt(1).operatorLeftShift(BigInt(8)).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('511');
      expect(BigInt(1024).operatorRightShift(BigInt(5)).operatorBitwiseXor(BigInt(15)).toString()).assertEqual('47');
      expect(BigInt(7).operatorBitwiseXor(BigInt(3)).operatorBitwiseXor(BigInt(4)).toString()).assertEqual('0');
      expect(BigInt(15).operatorBitwiseXor(BigInt(7)).operatorBitwiseXor(BigInt(8)).toString()).assertEqual('0');
      const a = BigInt(255);
      expect(a.operatorBitwiseXor(BigInt(15)).toString()).assertEqual('240');

      expect(getBigInt().operatorBitwiseXor(BigInt(255)).toString()).assertEqual('255');
      expect((true ? BigInt(0xFF) : BigInt(0x00)).operatorBitwiseXor(BigInt(0x0F)).toString()).assertEqual('240');
      const arr: BigInt[] = [BigInt(0x0F), BigInt(0xF0)];
      expect(arr[0].operatorBitwiseXor(arr[1]).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3600
     * @tc.name testBigIntOperatorBitwiseXorPowerAndSpecial3600
     * @tc.desc operatorBitwiseXor power-of-two and special pattern cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorPowerAndSpecial3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorBitwiseXor(BigInt(8)).toString()).assertEqual('10');
      const allOnes64 = BigInt('18446744073709551615');
      expect(BigInt(0).operatorBitwiseXor(allOnes64).toString()).assertEqual('18446744073709551615');
      expect(allOnes64.operatorBitwiseXor(allOnes64).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3700
     * @tc.name testBigIntOperatorBitwiseXorPerformance3700
     * @tc.desc operatorBitwiseXor performance and stress test cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorPerformance3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let acc = BigInt(0);
      for (let i = 0; i < 1000; i++) {
        acc = acc.operatorBitwiseXor(BigInt(i));
      }
      expect(acc instanceof BigInt).assertTrue();
      let acc2 = BigInt(0);
      for (let i = 0; i < 10000; i++) {
        acc2 = acc2.operatorBitwiseXor(BigInt(i));
      }
      expect(acc2 instanceof BigInt).assertTrue();
      const large = BigInt('12345678901234567890');
      let acc3 = large;
      for (let i = 0; i < 100; i++) {
        acc3 = acc3.operatorBitwiseXor(BigInt(i));
      }
      expect(acc3 instanceof BigInt).assertTrue();
      expect(BigInt(100).operatorBitwiseXor(BigInt(200)).equals(BigInt(100).operatorBitwiseXor(BigInt(200)))).assertTrue();
      let acc4 = BigInt(0);
      for (let i = 1; i <= 1000; i++) {
        acc4 = acc4.operatorBitwiseXor(BigInt(i));
      }
      expect(acc4 instanceof BigInt).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3800
     * @tc.name testBigIntOperatorBitwiseXorBooleanStringConstruct3800
     * @tc.desc operatorBitwiseXor: zero with boolean and "-0" string constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBooleanStringConstruct3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseXor(BigInt(true)).toString()).assertEqual('1');
      expect(BigInt(0).operatorBitwiseXor(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(0).operatorBitwiseXor(BigInt('-0')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_3900
     * @tc.name testBigIntOperatorBitwiseXorMixedConstruct3900
     * @tc.desc operatorBitwiseXor: mixed constructor sources (double, string, copy, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorMixedConstruct3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5.0).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('6');
      expect(BigInt('123').operatorBitwiseXor(BigInt('456')).toString()).assertEqual('435');
      const original = BigInt(10);
      expect(BigInt(original).operatorBitwiseXor(BigInt(true)).toString()).assertEqual('11');
      const result = BigInt(123456.0).operatorBitwiseXor(BigInt('654321'));
      expect(result instanceof BigInt).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4000
     * @tc.name testBigIntOperatorBitwiseXorNearMinAdjacent4000
     * @tc.desc operatorBitwiseXor with value adjacent to long minimum (nearMin ^ 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNearMinAdjacent4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nearMin = BigInt('-9223372036854775807');
      expect(nearMin.operatorBitwiseXor(BigInt(1)).toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4100
     * @tc.name testBigIntOperatorBitwiseXorNegativeZero4100
     * @tc.desc operatorBitwiseXor: 0 ^ negative = negative; negative ^ 0 = negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNegativeZero4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseXor(BigInt(-5)).toString()).assertEqual('-5');
      expect(BigInt(-5).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-5');
      expect(BigInt(0).operatorBitwiseXor(BigInt(-128)).toString()).assertEqual('-128');
      expect(BigInt(0).operatorBitwiseXor(BigInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt(0).operatorBitwiseXor(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4200
     * @tc.name testBigIntOperatorBitwiseXorZeroSelfCross4200
     * @tc.desc operatorBitwiseXor: zero with self across all signed int boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorZeroSelfCross4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorBitwiseXor(BigInt(4294967295)).toString()).assertEqual('4294967295');
      expect(BigInt(0).operatorBitwiseXor(BigInt('18446744073709551615')).toString()).assertEqual('18446744073709551615');
      expect(BigInt('999999999999999999999999999999').operatorBitwiseXor(BigInt(0)).toString()).assertEqual('999999999999999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4300
     * @tc.name testBigIntOperatorBitwiseXorCrossBoundaryByteShort4300
     * @tc.desc operatorBitwiseXor crossing byte->short and short->int boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCrossBoundaryByteShort4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorBitwiseXor(BigInt(128)).toString()).assertEqual('127');
      expect(BigInt(65535).operatorBitwiseXor(BigInt(32768)).toString()).assertEqual('32767');
      expect(BigInt(4294967295).operatorBitwiseXor(BigInt(2147483648)).toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4400
     * @tc.name testBigIntOperatorBitwiseXorLargeNegative4400
     * @tc.desc operatorBitwiseXor: large negative with large positive, large negative ^ -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLargeNegative4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-999999999999999999999999999999').operatorBitwiseXor(BigInt('-111111111111111111111111111111')).toString()).assertEqual('1106767244072376933172941917752');
      expect(BigInt('123456789012345678901234567890').operatorBitwiseXor(BigInt('-123456789012345678901234567890')).toString()).assertEqual('-4');
      expect(BigInt('123456789012345678901234567890').operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-123456789012345678901234567891');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_4500
     * @tc.name testBigIntOperatorBitwiseXorErrorPath4500
     * @tc.desc operatorBitwiseXor error handling for object/array invalid arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorErrorPath4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(10);
      expect((): void => {
        (null as Object as BigInt).operatorBitwiseXor(left);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(('5' as object as BigInt));
      }).assertThrowError('ClassCastError');
    });
  });
}
