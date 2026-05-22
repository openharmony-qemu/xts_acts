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

export default function BigIntOperatorAddTest(): void {
  describe('BigInt.operatorAdd (mindmap operatorAdd)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0100
     * @tc.name testBigIntOperatorAddBasic0100
     * @tc.desc Verify operatorAdd for positive, negative, and zero operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(12).operatorAdd(new BigInt(5)).toString()).assertEqual('17');
        expect(new BigInt(12).operatorAdd(new BigInt(-5)).toString()).assertEqual('7');
        expect(new BigInt(-12).operatorAdd(new BigInt(-5)).toString()).assertEqual('-17');
        expect(new BigInt(-12).operatorAdd(new BigInt(15)).toString()).assertEqual('3');
        expect(new BigInt(1).operatorAdd(new BigInt(1)).toString()).assertEqual('2');
        expect(new BigInt(50).operatorAdd(new BigInt(-50)).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0200
     * @tc.name testBigIntOperatorAddZero0200
     * @tc.desc Verify zero identity for operatorAdd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt(0);
        const a = new BigInt(100);
        expect(a.operatorAdd(zero).toString()).assertEqual('100');
        expect(zero.operatorAdd(a).toString()).assertEqual('100');
        expect(zero.operatorAdd(zero).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0300
     * @tc.name testBigIntOperatorAddLarge0300
     * @tc.desc Verify operatorAdd beyond Number safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorAdd(new BigInt(maxSafe)).toString()).assertEqual('18014398509481982');
        expect(new BigInt(maxSafe).operatorAdd(new BigInt('-' + maxSafe)).toString()).assertEqual('0');
        expect(new BigInt('999999999999999999999999999999').operatorAdd(new BigInt(1)).toString())
          .assertEqual('1000000000000000000000000000000');
        expect(new BigInt(maxSafe).operatorAdd(new BigInt(1)).toString()).assertEqual('9007199254740992');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0400
     * @tc.name testBigIntOperatorAddAlgebra0400
     * @tc.desc Verify commutativity, associativity, and operand immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddAlgebra0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(12);
        const b = new BigInt(5);
        const c = new BigInt(3);
        expect(a.operatorAdd(b).toString()).assertEqual(b.operatorAdd(a).toString());
        expect(a.operatorAdd(b).operatorAdd(c).toString())
          .assertEqual(a.operatorAdd(b.operatorAdd(c)).toString());
        const origA = a.toString();
        const origB = b.toString();
        a.operatorAdd(b);
        expect(a.toString()).assertEqual(origA);
        expect(b.toString()).assertEqual(origB);
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0500
     * @tc.name testBigIntOperatorAddReturnType0500
     * @tc.desc Verify operatorAdd returns BigInt instance and supports chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        const b = new BigInt(5);
        const result = a.operatorAdd(b);
        expect(result instanceof BigInt).assertTrue();
        expect(new BigInt(1).operatorAdd(new BigInt(2)).operatorAdd(new BigInt(3)).toString()).assertEqual('6');
        const a2 = new BigInt(1);
        const b2 = new BigInt(2);
        const sum = a2.operatorAdd(b2);
        expect(sum !== a2).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_ADD_0600
     * @tc.name testBigIntOperatorAddInvalidArgThrows0600
     * @tc.desc Verify operatorAdd rejects null, undefined, and wrong types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorAddInvalidArgThrows0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
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
  });
}
