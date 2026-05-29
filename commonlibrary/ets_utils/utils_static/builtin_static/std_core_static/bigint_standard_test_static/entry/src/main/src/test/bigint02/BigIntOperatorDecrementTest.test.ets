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

export default function BigIntOperatorDecrementTest(): void {
  describe('BigInt.operatorDecrement (mindmap operatorDecrement)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0100
     * @tc.name testBigIntOperatorDecrementBasic0100
     * @tc.desc Mindmap input and return value: verify operatorDecrement basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1 = BigInt(43);
      expect(v1.operatorDecrement().toString()).assertEqual('42');
      const v2 = BigInt(1);
      expect(v2.operatorDecrement().toString()).assertEqual('0');
      const v3 = BigInt(0);
      expect(v3.operatorDecrement().toString()).assertEqual('-1');
      expect(BigInt('9223372036854775807').operatorDecrement().toString()).assertEqual('9223372036854775806');
      expect(BigInt('-9223372036854775807').operatorDecrement().toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0200
     * @tc.name testBigIntOperatorDecrementImmutable0200
     * @tc.desc Mindmap return value: operatorDecrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementImmutable0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(5);
      const orig = v.toString();
      const result = v.operatorDecrement();

      expect(v.toString()).assertEqual(orig);
      expect(result.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0300
     * @tc.name testBigIntOperatorDecrementReturnType0300
     * @tc.desc Mindmap return value: operatorDecrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorDecrement() as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0400
     * @tc.name testBigIntOperatorDecrementLarge0400
     * @tc.desc Mindmap input: operatorDecrement on large string-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';
      expect(BigInt(huge).operatorDecrement().toString()).assertEqual('999999999999999999999999999998');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0500
     * @tc.name testBigIntOperatorDecrementInvalidArg0500
     * @tc.desc Mindmap error handling: operatorDecrement rejects invalid receiver cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        (null as Object as BigInt).operatorDecrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (undefined as Object as BigInt).operatorDecrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        ('abc' as object as BigInt).operatorDecrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (123 as object as BigInt).operatorDecrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (true as object as BigInt).operatorDecrement();
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0600
     * @tc.name testBigIntOperatorDecrementLongBounds0600
     * @tc.desc Mindmap input: operatorDecrement at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorDecrement().toString()).assertEqual('9223372036854775806');
      expect(min.operatorDecrement().toString()).assertEqual('-9223372036854775809');
      expect(BigInt(1).operatorDecrement().toString()).assertEqual('0');
      expect(BigInt(-1).operatorDecrement().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0700
     * @tc.name testBigIntOperatorDecrementBeyondLongRange0700
     * @tc.desc Mindmap input: operatorDecrement with magnitudes beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementBeyondLongRange0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775808').operatorDecrement().toString()).assertEqual('9223372036854775807');
      expect(BigInt('-9223372036854775809').operatorDecrement().toString()).assertEqual('-9223372036854775810');
      expect(BigInt('1000000000000000000000000000000').operatorDecrement().toString()).assertEqual('999999999999999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0800
     * @tc.name testBigIntOperatorDecrementChained0800
     * @tc.desc Mindmap return value: chained operatorDecrement subtracts two from receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementChained0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorDecrement().operatorDecrement().toString()).assertEqual('8');
      expect(BigInt(0).operatorDecrement().operatorDecrement().toString()).assertEqual('-2');
      expect(BigInt('-999999999999999999999999999999').operatorDecrement().operatorDecrement().toString()).assertEqual('-1000000000000000000000000000001');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0900
     * @tc.name testBigIntOperatorDecrementDoubleSafeInteger0900
     * @tc.desc Mindmap boundary: operatorDecrement near double safe-integer magnitude (string operands)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementDoubleSafeInteger0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740992').operatorDecrement().toString()).assertEqual('9007199254740991');
      expect(BigInt('9007199254740991').operatorDecrement().toString()).assertEqual('9007199254740990');
      expect(BigInt('-9007199254740991').operatorDecrement().toString()).assertEqual('-9007199254740992');
    });
  });
}
