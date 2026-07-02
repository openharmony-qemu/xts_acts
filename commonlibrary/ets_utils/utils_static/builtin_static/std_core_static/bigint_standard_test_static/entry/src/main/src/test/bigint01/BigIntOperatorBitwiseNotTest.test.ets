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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseNotTest(): void {
  describe('BigInt.operatorBitwiseNot (mindmap operatorBitwiseNot)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0100
     * @tc.name testBigIntOperatorBitwiseNotBasic0100
     * @tc.desc Mindmap input and return value: bitwise not on sample values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
      expect(BigInt(5).operatorBitwiseNot().toString()).assertEqual('-6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0200
     * @tc.name testBigIntOperatorBitwiseNotImmutable0200
     * @tc.desc Mindmap return value: receiver unchanged after operatorBitwiseNot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotImmutable0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(42);
      const orig = v.toString();

      v.operatorBitwiseNot();
      expect(v.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0300
     * @tc.name testBigIntOperatorBitwiseNotReturnType0300
     * @tc.desc Mindmap return value: operatorBitwiseNot returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorBitwiseNot() as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0400
     * @tc.name testBigIntOperatorBitwiseNotLarge0400
     * @tc.desc Mindmap input: bitwise not on large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt('999999999999999999999999999999');

      expect(v.operatorBitwiseNot().operatorBitwiseNot().equals(v)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0500
     * @tc.name testBigIntOperatorBitwiseNotInvalidReceiver0500
     * @tc.desc Mindmap error handling: invalid receiver for operatorBitwiseNot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotInvalidReceiver0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        (null as Object as BigInt).operatorBitwiseNot();
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0600
     * @tc.name testBigIntOperatorBitwiseNotLongBounds0600
     * @tc.desc Mindmap input: operatorBitwiseNot at signed long extrema and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.operatorBitwiseNot().toString()).assertEqual('-9223372036854775808');
      expect(min.operatorBitwiseNot().toString()).assertEqual('9223372036854775807');
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
    });
  });
}
