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

export default function BigIntOperatorLeftShiftTest(): void {
  describe('BigInt.operatorLeftShift (mindmap operatorLeftShift)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0100
     * @tc.name testBigIntOperatorLeftShiftBasic0100
     * @tc.desc Verify operatorLeftShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(1).operatorLeftShift(new BigInt(8)).toString()).assertEqual('256');
        expect(new BigInt(5).operatorLeftShift(new BigInt(1)).toString()).assertEqual('10');
        expect(new BigInt(-1).operatorLeftShift(new BigInt(1)).toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0200
     * @tc.name testBigIntOperatorLeftShiftZero0200
     * @tc.desc Verify operatorLeftShift with zero shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(42).operatorLeftShift(new BigInt(0)).toString()).assertEqual('42');
        expect(new BigInt(0).operatorLeftShift(new BigInt(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0300
     * @tc.name testBigIntOperatorLeftShiftReturnType0300
     * @tc.desc Verify operatorLeftShift returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(Class.of(new BigInt(1).operatorLeftShift(new BigInt(2)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0400
     * @tc.name testBigIntOperatorLeftShiftLarge0400
     * @tc.desc Mindmap input: operatorLeftShift on large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').operatorLeftShift(BigInt(1)).toString()).assertEqual('1999999999999999999999999999998');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0500
     * @tc.name testBigIntOperatorLeftShiftInvalidArg0500
     * @tc.desc Mindmap error handling: operatorLeftShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(1);
      expect((): void => {
        a.operatorLeftShift(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorLeftShift(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorLeftShift('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorLeftShift(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorLeftShift(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0600
     * @tc.name testBigIntOperatorLeftShiftLongBounds0600
     * @tc.desc Mindmap input: operatorLeftShift crossing signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLeftShift(BigInt(63)).toString()).assertEqual('9223372036854775808');
      expect(BigInt(9223372036854775807).operatorLeftShift(BigInt(0)).toString()).assertEqual('9223372036854775807');
      expect(BigInt(-9223372036854775808).operatorLeftShift(BigInt(0)).toString()).assertEqual('-9223372036854775808');
      expect(BigInt(0).operatorLeftShift(BigInt(100)).toString()).assertEqual('0');
    });
  });
}
