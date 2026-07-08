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

export default function BigIntOperatorRightShiftTest(): void {
  describe('BigInt.operatorRightShift (mindmap operatorRightShift)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0100
     * @tc.name testBigIntOperatorRightShiftBasic0100
     * @tc.desc Verify operatorRightShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(256).operatorRightShift(new BigInt(8)).toString()).assertEqual('1');
        expect(new BigInt(10).operatorRightShift(new BigInt(1)).toString()).assertEqual('5');
        expect(new BigInt(-8).operatorRightShift(new BigInt(1)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0200
     * @tc.name testBigIntOperatorRightShiftNegative0200
     * @tc.desc Mindmap input: operatorRightShift on negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftNegative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-8).operatorRightShift(BigInt(1)).toString()).assertEqual('-4');
      expect(BigInt(-1).operatorRightShift(BigInt(100)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0300
     * @tc.name testBigIntOperatorRightShiftReturnType0300
     * @tc.desc Mindmap return value: operatorRightShift returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(256).operatorRightShift(BigInt(8)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0400
     * @tc.name testBigIntOperatorRightShiftLarge0400
     * @tc.desc Mindmap input: operatorRightShift on large magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').operatorRightShift(BigInt(1)).toString()).assertEqual('499999999999999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0500
     * @tc.name testBigIntOperatorRightShiftInvalidArg0500
     * @tc.desc Mindmap error handling: operatorRightShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(256);
      expect((): void => {
        a.operatorRightShift(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorRightShift(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorRightShift('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorRightShift(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorRightShift(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0600
     * @tc.name testBigIntOperatorRightShiftLongBounds0600
     * @tc.desc Mindmap input: operatorRightShift from magnitude above signed long max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775808').operatorRightShift(BigInt(1)).toString()).assertEqual('4611686018427387904');
      expect(BigInt(-9223372036854775808).operatorRightShift(BigInt(1)).toString()).assertEqual('-4611686018427387904');
      expect(BigInt(9223372036854775807).operatorRightShift(BigInt(0)).toString()).assertEqual('9223372036854775807');
    });
  });
}
