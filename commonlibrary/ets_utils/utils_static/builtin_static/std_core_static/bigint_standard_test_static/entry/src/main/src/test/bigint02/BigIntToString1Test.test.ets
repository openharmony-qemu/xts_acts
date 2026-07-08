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

export default function BigIntToString1Test(): void {
  describe('BigInt.toString no-arg (mindmap toString_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0100
     * @tc.name testBigIntToString1Zero0100
     * @tc.desc Mindmap return value: no-arg toString for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Zero0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0200
     * @tc.name testBigIntToString1Positive0200
     * @tc.desc Mindmap return value: positive decimal toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Positive0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).toString()).assertEqual('42');
      expect(BigInt(10000).toString()).assertEqual('10000');
      expect(BigInt(1).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0300
     * @tc.name testBigIntToString1Negative0300
     * @tc.desc Mindmap return value: negative decimal toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Negative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).toString()).assertEqual('-1');
      expect(BigInt(-42).toString()).assertEqual('-42');
      expect(BigInt(-9223372036854775808).toString()).assertEqual('-9223372036854775808');
      expect(BigInt('-9223372036854775807').toString()).assertEqual('-9223372036854775807');
      expect(BigInt('-9007199254740991').toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0400
     * @tc.name testBigIntToString1Large0400
     * @tc.desc Mindmap return value: large string magnitude toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Large0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '9007199254740993';

      expect(BigInt(huge).toString()).assertEqual(huge);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0500
     * @tc.name testBigIntToString1LongBounds0500
     * @tc.desc Mindmap return value: signed long extrema toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1LongBounds0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).toString()).assertEqual('9223372036854775807');
      expect(BigInt(-9223372036854775808).toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0600
     * @tc.name testBigIntToString1ReturnType0600
     * @tc.desc Mindmap return value: no-arg toString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1ReturnType0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(255).toString())).assertEqual(Class.from<string>());
    });
  });
}
