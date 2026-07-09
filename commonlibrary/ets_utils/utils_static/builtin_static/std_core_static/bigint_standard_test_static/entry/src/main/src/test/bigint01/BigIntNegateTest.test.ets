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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntNegateTest(): void {
  describe('BigInt.negate (mindmap negate)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0100
     * @tc.name testBigIntNegateSigns0100
     * @tc.desc Mindmap input and return value: negate positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateSigns0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(8).negate().toString()).assertEqual('-8');
      expect(BigInt(1).negate().toString()).assertEqual('-1');
      expect(BigInt(-8).negate().toString()).assertEqual('8');
      expect(BigInt(-1).negate().toString()).assertEqual('1');
      expect(BigInt(0).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0200
     * @tc.name testBigIntNegateLarge0200
     * @tc.desc Mindmap return value: negate very large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt(huge).negate().toString()).assertEqual('-' + huge);
      expect(BigInt('-' + huge).negate().toString()).assertEqual(huge);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0300
     * @tc.name testBigIntNegateDoubleNegate0300
     * @tc.desc Mindmap return value: double negate restores value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleNegate0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).negate().negate().toString()).assertEqual('42');
      expect(BigInt(-123).negate().negate().toString()).assertEqual('-123');
      expect(BigInt(0).negate().negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0400
     * @tc.name testBigIntNegateLongBounds0400
     * @tc.desc Mindmap input: negate near double safe integer magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongBounds0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').negate().toString()).assertEqual('-9007199254740991');
      expect(BigInt('-9007199254740991').negate().toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0500
     * @tc.name testBigIntNegateReturnType0500
     * @tc.desc Mindmap return value: negate returns new BigInt without mutating receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = BigInt(100);
      const result = value.negate();

      expect(Class.of(result as Object)).assertEqual(Class.from<BigInt>());
      expect(value.toString()).assertEqual('100');
      expect(result !== value).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0600
     * @tc.name testBigIntNegateSources0600
     * @tc.desc Mindmap input: negate string and boolean constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateSources0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('77').negate().toString()).assertEqual('-77');
      expect(BigInt(true).negate().toString()).assertEqual('-1');
      expect(BigInt(false).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0700
     * @tc.name testBigIntNegateLongMin0700
     * @tc.desc Mindmap input: negate signed long minimum and maximum magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongMin0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-9223372036854775808).negate().toString()).assertEqual('9223372036854775808');
      expect(BigInt(9223372036854775807).negate().toString()).assertEqual('-9223372036854775807');
      expect(BigInt(-9223372036854775808).negate().negate().toString()).assertEqual('-9223372036854775808');
    });
  });
}
