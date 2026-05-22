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

export default function BigIntFromULongTest(): void {
  describe('BigInt.fromULong (mindmap fromULong)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0100
     * @tc.name testBigIntFromULongPositiveValues0100
     * @tc.desc Verify BigInt.fromULong maps non-negative long values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongPositiveValues0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.fromULong(0).toString()).assertEqual('0');
        expect(BigInt.fromULong(1).toString()).assertEqual('1');
        expect(BigInt.fromULong(100).toString()).assertEqual('100');
        expect(BigInt.fromULong(2147483647).toString()).assertEqual('2147483647');
        expect(BigInt.fromULong(2147483648).toString()).assertEqual('2147483648');
        expect(BigInt.fromULong(4294967295).toString()).assertEqual('4294967295');
        expect(BigInt.fromULong(4294967296).toString()).assertEqual('4294967296');
        expect(BigInt.fromULong(9223372036854775807).toString()).assertEqual('9223372036854775807');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0200
     * @tc.name testBigIntFromULongUnsignedInterpretation0200
     * @tc.desc Verify negative long arguments are interpreted as unsigned 64-bit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongUnsignedInterpretation0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
        expect(BigInt.fromULong(-2).toString()).assertEqual('18446744073709551614');
        expect(BigInt.fromULong(-100).toString()).assertEqual('18446744073709551516');
        expect(BigInt.fromULong(-2147483648).toString()).assertEqual('18446744071562067968');
        expect(BigInt.fromULong(-4294967296).toString()).assertEqual('18446744069414584320');
        expect(BigInt.fromULong(-9223372036854775808).toString()).assertEqual('9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0300
     * @tc.name testBigIntFromULongReturnType0300
     * @tc.desc Verify fromULong returns a non-null BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = BigInt.fromULong(1);
        expect(typeof result === 'bigint').assertTrue();
        expect(result.toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0400
     * @tc.name testBigIntFromULongVsSignedValue0400
     * @tc.desc Compare fromULong with valueOf for positive and negative long inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongVsSignedValue0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const unsignedPos = BigInt.fromULong(100);
        const signedPos = BigInt(100);
        expect(unsignedPos.toString()).assertEqual(signedPos.toString());
        const unsignedNeg = BigInt.fromULong(-1);
        const signedNeg = BigInt(-1);
        expect(unsignedNeg.toString()).assertEqual('18446744073709551615');
        expect(signedNeg.toString()).assertEqual('-1');
        expect(unsignedNeg.equals(signedNeg)).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0500
     * @tc.name testBigIntFromULongResultUsable0500
     * @tc.desc Verify fromULong result supports add, equals, and toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongResultUsable0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt.fromULong(5);
        const sum = a.operatorAdd(BigInt(3));
        expect(sum.toString()).assertEqual('8');
        const hundred = BigInt.fromULong(100);
        expect(hundred.equals(BigInt(100))).assertTrue();
        expect(BigInt.fromULong(123).toString()).assertEqual('123');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0600
     * @tc.name testBigIntFromULongNormalPathNoThrow0600
     * @tc.desc Verify fromULong on valid input does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongNormalPathNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.fromULong(1).toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0700
     * @tc.name testBigIntFromULongInvalidArgThrows0700
     * @tc.desc Verify fromULong rejects null cast to long at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongInvalidArgThrows0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          BigInt.fromULong(null as Object as long);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          BigInt.fromULong(undefined as Object as long);
        }).assertThrowError('ClassCastError');
      });
  });
}
