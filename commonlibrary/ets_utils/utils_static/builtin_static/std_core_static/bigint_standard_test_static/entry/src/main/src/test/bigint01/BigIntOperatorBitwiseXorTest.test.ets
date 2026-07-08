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
import { describe, it, expect,afterAll, afterEach, beforeAll, beforeEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseXorTest(): void {
  describe('BigInt.operatorBitwiseXor (mindmap operatorBitwiseXor)', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0100
     * @tc.name testBigIntOperatorBitwiseXorBasic0100
     * @tc.desc Mindmap input and return value: operatorBitwiseXor basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('6');
      expect(BigInt(12).operatorBitwiseXor(BigInt(10)).toString()).assertEqual('6');
      expect(BigInt(255).operatorBitwiseXor(BigInt(15)).toString()).assertEqual('240');
      expect(BigInt(-12).operatorBitwiseXor(BigInt(10)).toString()).assertEqual('-2');
      expect(BigInt(-3).operatorBitwiseXor(BigInt(-5)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0200
     * @tc.name testBigIntOperatorBitwiseXorSpecial0200
     * @tc.desc Mindmap input: operatorBitwiseXor zero, self, and mask patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSpecial0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(123).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('123');
      expect(BigInt(255).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('0');
      expect(BigInt(5).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0300
     * @tc.name testBigIntOperatorBitwiseXorCommutative0300
     * @tc.desc Mindmap return value: operatorBitwiseXor commutative property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCommutative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const b = BigInt(10);
      expect(a.operatorBitwiseXor(b).toString()).assertEqual(b.operatorBitwiseXor(a).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0400
     * @tc.name testBigIntOperatorBitwiseXorReturnType0400
     * @tc.desc Mindmap return value: operatorBitwiseXor returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(5).operatorBitwiseXor(BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0500
     * @tc.name testBigIntOperatorBitwiseXorInvalidArg0500
     * @tc.desc Mindmap error handling: operatorBitwiseXor rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(5);
      expect((): void => {
        left.operatorBitwiseXor(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0600
     * @tc.name testBigIntOperatorBitwiseXorLarge0600
     * @tc.desc Mindmap input: operatorBitwiseXor on large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLarge0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt('999999999999999999999999999990');
      expect(a.operatorBitwiseXor(a).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0700
     * @tc.name testBigIntOperatorBitwiseXorLongBounds0700
     * @tc.desc Mindmap input: operatorBitwiseXor at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorBitwiseXor(max).toString()).assertEqual('0');
      expect(min.operatorBitwiseXor(min).toString()).assertEqual('0');
      expect(max.operatorBitwiseXor(min).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0800
     * @tc.name testBigIntOperatorBitwiseXorNegativeBoundary0800
     * @tc.desc Mindmap boundary: operatorBitwiseXor at -9223372036854775808 and negative mask operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorNegativeBoundary0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const min = BigInt('-9223372036854775808');

      expect(min.operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('9223372036854775807');
      expect(min.operatorBitwiseXor(BigInt(0)).toString()).assertEqual('-9223372036854775808');
      expect(BigInt('-999999999999999999999999999999').operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('999999999999999999999999999998');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0900
     * @tc.name testBigIntOperatorBitwiseXorImmutable0900
     * @tc.desc Mindmap return value: operatorBitwiseXor does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorImmutable0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);
      const orig = left.toString();
      left.operatorBitwiseXor(BigInt(5));
      expect(left.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_1000
     * @tc.name testBigIntOperatorBitwiseXorUlongBoundary1000
     * @tc.desc Mindmap boundary: operatorBitwiseXor at unsigned 64-bit maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorUlongBoundary1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551615').operatorBitwiseXor(BigInt(1)).toString()).assertEqual('18446744073709551614');
      expect(BigInt('18446744073709551615').operatorBitwiseXor(BigInt('18446744073709551615')).toString()).assertEqual('0');
    });
  });
}
