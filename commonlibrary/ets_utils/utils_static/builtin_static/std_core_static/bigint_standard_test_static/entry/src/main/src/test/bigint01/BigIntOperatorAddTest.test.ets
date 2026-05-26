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
import { LONG_MAX, LONG_MIN, LONG_MAX_STR, LONG_MIN_STR, LONG_MAX_PLUS_ONE_STR, LONG_MIN_MINUS_ONE_STR } from '../BigIntTestLimits';

export default function BigIntOperatorAddTest(): void {
  describe('BigInt.operatorAdd (mindmap operatorAdd)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0100
     * @tc.name testBigIntOperatorAddBasic0100
     * @tc.desc Mindmap input and return value: operatorAdd basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorAdd(BigInt(5)).toString()).assertEqual('17');
      expect(BigInt(12).operatorAdd(BigInt(-5)).toString()).assertEqual('7');
      expect(BigInt(-12).operatorAdd(BigInt(-5)).toString()).assertEqual('-17');
      expect(BigInt(-12).operatorAdd(BigInt(15)).toString()).assertEqual('3');
      expect(BigInt(1).operatorAdd(BigInt(1)).toString()).assertEqual('2');
      expect(BigInt(50).operatorAdd(BigInt(-50)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0200
     * @tc.name testBigIntOperatorAddZero0200
     * @tc.desc Mindmap input: zero identity for operatorAdd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = BigInt(0);
      const a = BigInt(100);

      expect(a.operatorAdd(zero).toString()).assertEqual('100');
      expect(zero.operatorAdd(a).toString()).assertEqual('100');
      expect(zero.operatorAdd(zero).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0300
     * @tc.name testBigIntOperatorAddLarge0300
     * @tc.desc Mindmap input: values beyond double safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddLarge0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxSafe = '9007199254740991';

      expect(BigInt(maxSafe).operatorAdd(BigInt(maxSafe)).toString()).assertEqual('18014398509481982');
      expect(BigInt(maxSafe).operatorAdd(BigInt('-' + maxSafe)).toString()).assertEqual('0');
      expect(BigInt('999999999999999999999999999999').operatorAdd(BigInt(1)).toString()).assertEqual('1000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0400
     * @tc.name testBigIntOperatorAddAlgebra0400
     * @tc.desc Mindmap return value: commutativity, associativity, immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddAlgebra0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const b = BigInt(5);
      const c = BigInt(3);

      expect(a.operatorAdd(b).toString()).assertEqual(b.operatorAdd(a).toString());
      expect(a.operatorAdd(b).operatorAdd(c).toString()).assertEqual(a.operatorAdd(b.operatorAdd(c)).toString());
      const origA = a.toString();
      a.operatorAdd(b);
      expect(a.toString()).assertEqual(origA);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0500
     * @tc.name testBigIntOperatorAddReturnType0500
     * @tc.desc Mindmap return value: operatorAdd returns BigInt and supports chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = BigInt(10).operatorAdd(BigInt(5));

      expect(Class.of(result as Object)).assertEqual(Class.from<BigInt>());
      expect(BigInt(1).operatorAdd(BigInt(2)).operatorAdd(BigInt(3)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0600
     * @tc.name testBigIntOperatorAddInvalidArg0600
     * @tc.desc Mindmap error handling: operatorAdd rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddInvalidArg0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        a.operatorAdd(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorAdd(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorAdd('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorAdd(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorAdd(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0700
     * @tc.name testBigIntOperatorAddLongBounds0700
     * @tc.desc Mindmap input: operatorAdd at signed long extrema and one step beyond
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddLongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(LONG_MAX);
      const min = BigInt(LONG_MIN);

      expect(max.operatorAdd(BigInt(1)).toString()).assertEqual(LONG_MAX_PLUS_ONE_STR);
      expect(min.operatorAdd(BigInt(-1)).toString()).assertEqual(LONG_MIN_MINUS_ONE_STR);
      expect(max.operatorAdd(min).toString()).assertEqual('-1');
      expect(BigInt(0).operatorAdd(max).toString()).assertEqual(LONG_MAX_STR);
      expect(BigInt(0).operatorAdd(min).toString()).assertEqual(LONG_MIN_STR);
    });
  });
}
