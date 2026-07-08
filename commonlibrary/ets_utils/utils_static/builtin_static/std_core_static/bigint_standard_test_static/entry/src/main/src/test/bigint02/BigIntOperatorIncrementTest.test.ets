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
import { describe, it, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic/Constant';

export default function BigIntOperatorIncrementTest(): void {
  describe('BigInt.operatorIncrement (mindmap operatorIncrement)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0100
     * @tc.name testBigIntOperatorIncrementBasic0100
     * @tc.desc Mindmap input and return value: verify operatorIncrement basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1 = BigInt(41);
      expect(v1.operatorIncrement().toString()).assertEqual('42');
      const v2 = BigInt(0);
      expect(v2.operatorIncrement().toString()).assertEqual('1');
      const v3 = BigInt(-2);
      expect(v3.operatorIncrement().toString()).assertEqual('-1');
      expect(BigInt('9223372036854775807').operatorIncrement().toString()).assertEqual('9223372036854775808');
      expect(BigInt('-9223372036854775807').operatorIncrement().toString()).assertEqual('-9223372036854775806');
      expect(BigInt(-9223372036854775808).operatorIncrement().toString()).assertEqual('-9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0200
     * @tc.name testBigIntOperatorIncrementImmutable0200
     * @tc.desc Mindmap return value: operatorIncrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementImmutable0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(5);
      const orig = v.toString();
      const result = v.operatorIncrement();

      expect(v.toString()).assertEqual(orig);
      expect(result.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0300
     * @tc.name testBigIntOperatorIncrementReturnType0300
     * @tc.desc Mindmap return value: operatorIncrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorIncrement() as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0400
     * @tc.name testBigIntOperatorIncrementLarge0400
     * @tc.desc Mindmap input: operatorIncrement on large string-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';
      expect(BigInt(huge).operatorIncrement().toString()).assertEqual('1000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0500
     * @tc.name testBigIntOperatorIncrementInvalidArg0500
     * @tc.desc Mindmap error handling: operatorIncrement rejects invalid receiver cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        (null as Object as BigInt).operatorIncrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (undefined as Object as BigInt).operatorIncrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        ('abc' as object as BigInt).operatorIncrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (123 as object as BigInt).operatorIncrement();
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (true as object as BigInt).operatorIncrement();
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0600
     * @tc.name testBigIntOperatorIncrementLongBounds0600
     * @tc.desc Mindmap input: operatorIncrement at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorIncrement().toString()).assertEqual('9223372036854775808');
      expect(min.operatorIncrement().toString()).assertEqual('-9223372036854775807');
      expect(BigInt(-1).operatorIncrement().toString()).assertEqual('0');
      expect(BigInt(0).operatorIncrement().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0700
     * @tc.name testBigIntOperatorIncrementBeyondLongRange0700
     * @tc.desc Mindmap input: operatorIncrement with magnitudes beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementBeyondLongRange0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').operatorIncrement().toString()).assertEqual('9223372036854775808');
      expect(BigInt('-9223372036854775809').operatorIncrement().toString()).assertEqual('-9223372036854775808');
      expect(BigInt('999999999999999999999999999998').operatorIncrement().toString()).assertEqual('999999999999999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0800
     * @tc.name testBigIntOperatorIncrementChained0800
     * @tc.desc Mindmap return value: chained operatorIncrement adds two to receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementChained0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorIncrement().operatorIncrement().toString()).assertEqual('12');
      expect(BigInt(-2).operatorIncrement().operatorIncrement().toString()).assertEqual('0');
      expect(BigInt('999999999999999999999999999998').operatorIncrement().operatorIncrement().toString()).assertEqual('1000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0900
     * @tc.name testBigIntOperatorIncrementDoubleSafeInteger0900
     * @tc.desc Mindmap boundary: operatorIncrement near double safe-integer magnitude (string operands)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementDoubleSafeInteger0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740990').operatorIncrement().toString()).assertEqual('9007199254740991');
      expect(BigInt('9007199254740991').operatorIncrement().toString()).assertEqual('9007199254740992');
      expect(BigInt('-9007199254740992').operatorIncrement().toString()).assertEqual('-9007199254740991');
    });
  });
}
