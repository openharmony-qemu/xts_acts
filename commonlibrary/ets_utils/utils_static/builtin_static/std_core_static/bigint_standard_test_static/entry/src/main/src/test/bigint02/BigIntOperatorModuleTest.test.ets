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

export default function BigIntOperatorModuleTest(): void {
  describe('BigInt.operatorModule (mindmap operatorModule)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0100
     * @tc.name testBigIntOperatorModuleBasic0100
     * @tc.desc Mindmap input and return value: operatorModule basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorModule(BigInt(5)).toString()).assertEqual('2');
      expect(BigInt(20).operatorModule(BigInt(-5)).toString()).assertEqual('0');
      expect(BigInt(-10).operatorModule(BigInt(3)).toString()).assertEqual('-1');
      expect(BigInt(-7).operatorModule(BigInt(3)).toString()).assertEqual('-1');
      expect(BigInt(7).operatorModule(BigInt(-3)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0200
     * @tc.name testBigIntOperatorModuleZero0200
     * @tc.desc Mindmap input: operatorModule zero dividend and zero remainder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorModule(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(10).operatorModule(BigInt(10)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0300
     * @tc.name testBigIntOperatorModuleReturnType0300
     * @tc.desc Mindmap return value: operatorModule returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(10).operatorModule(BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0400
     * @tc.name testBigIntOperatorModuleInvalidArg0400
     * @tc.desc Mindmap error handling: operatorModule rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        // Intentional cast: null at runtime to exercise ClassCastError on operand.
        a.operatorModule(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional cast: undefined at runtime to exercise ClassCastError on operand.
        a.operatorModule(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt string with static BigInt operand type.
        a.operatorModule('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt number with static BigInt operand type.
        a.operatorModule(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt boolean with static BigInt operand type.
        a.operatorModule(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0500
     * @tc.name testBigIntOperatorModuleDivByZero0500
     * @tc.desc Mindmap error handling: operatorModule throws on zero divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleDivByZero0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(10).operatorModule(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0600
     * @tc.name testBigIntOperatorModuleLongBounds0600
     * @tc.desc Mindmap input: operatorModule at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorModule(BigInt(2)).toString()).assertEqual('1');
      expect(min.operatorModule(BigInt(2)).toString()).assertEqual('0');
      expect(BigInt(0).operatorModule(max).toString()).assertEqual('0');
      expect(min.operatorModule(max).toString()).assertEqual('-1');
      expect(min.operatorModule(BigInt(-1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0700
     * @tc.name testBigIntOperatorModuleNegativeOperands0700
     * @tc.desc Mindmap input: operatorModule with negative dividend and divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleNegativeOperands0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorModule(BigInt(-3)).toString()).assertEqual('-1');
      expect(BigInt(-20).operatorModule(BigInt(-5)).toString()).assertEqual('0');
      expect(BigInt('-999999999999999999999999999999').operatorModule(BigInt(-2)).toString()).assertEqual('-1');
    });
  });
}
