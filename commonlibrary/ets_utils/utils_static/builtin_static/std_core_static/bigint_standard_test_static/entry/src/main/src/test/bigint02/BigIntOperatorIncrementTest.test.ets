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
import { LONG_MIN, LONG_MAX_STR, LONG_MAX_PLUS_ONE_STR, LONG_MAX_NEGATED_STR, LONG_MAX_MINUS_ONE_NEGATED_STR } from '../BigIntTestLimits.test';

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
      expect(BigInt(LONG_MAX_STR).operatorIncrement().toString()).assertEqual(LONG_MAX_PLUS_ONE_STR);
      expect(BigInt(LONG_MAX_NEGATED_STR).operatorIncrement().toString()).assertEqual(LONG_MAX_MINUS_ONE_NEGATED_STR);
      expect(BigInt(LONG_MIN).operatorIncrement().toString()).assertEqual(LONG_MAX_NEGATED_STR);
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
  });
}
