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
import { describe, it, expect ,afterAll, afterEach, beforeAll, beforeEach} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntFromULongTest(): void {
  describe('BigInt.fromULong (mindmap fromULong)', () => {
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0100
     * @tc.name testBigIntFromULongPositiveValues0100
     * @tc.desc Mindmap input: fromULong maps non-negative long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongPositiveValues0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).toString()).assertEqual('0');
      expect(BigInt.fromULong(1).toString()).assertEqual('1');
      expect(BigInt.fromULong(100).toString()).assertEqual('100');
      expect(BigInt.fromULong(2147483647).toString()).assertEqual('2147483647');
      expect(BigInt.fromULong(4294967295).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0200
     * @tc.name testBigIntFromULongUnsignedInterpretation0200
     * @tc.desc Mindmap input: negative long interpreted as unsigned 64-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongUnsignedInterpretation0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(-2).toString()).assertEqual('18446744073709551614');
      expect(BigInt.fromULong(-2147483648).toString()).assertEqual('18446744071562067968');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0300
     * @tc.name testBigIntFromULongReturnType0300
     * @tc.desc Mindmap return value: fromULong returns BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = BigInt.fromULong(1);

      expect(Class.of(result as Object)).assertEqual(Class.from<BigInt>());
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0400
     * @tc.name testBigIntFromULongVsSignedValue0400
     * @tc.desc Mindmap return value: fromULong differs from signed BigInt for negative long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongVsSignedValue0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(100).toString()).assertEqual(BigInt(100).toString());
      expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(-1).equals(BigInt(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0500
     * @tc.name testBigIntFromULongResultUsable0500
     * @tc.desc Mindmap return value: fromULong result supports operatorAdd and equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongResultUsable0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(5).operatorAdd(BigInt(3)).toString()).assertEqual('8');
      expect(BigInt.fromULong(123).toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0600
     * @tc.name testBigIntFromULongNormalPathNoThrow0600
     * @tc.desc Mindmap return value: valid fromULong does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongNormalPathNoThrow0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0700
     * @tc.name testBigIntFromULongInvalidArg0700
     * @tc.desc Mindmap error handling: fromULong rejects null and undefined cast to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongInvalidArg0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt.fromULong(null as Object as long);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt.fromULong(undefined as Object as long);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0800
     * @tc.name testBigIntFromULongLongBoundary0800
     * @tc.desc Mindmap input: fromULong at long min and max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongLongBoundary0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(9223372036854775807).toString()).assertEqual('9223372036854775807');
      expect(BigInt.fromULong(-9223372036854775808).toString()).assertEqual('9223372036854775808');
    });
  });
}
