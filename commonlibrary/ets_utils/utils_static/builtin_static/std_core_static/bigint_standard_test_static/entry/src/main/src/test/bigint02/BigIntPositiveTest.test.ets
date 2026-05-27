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

export default function BigIntPositiveTest(): void {
  describe('BigInt.positive (mindmap positive)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0100
     * @tc.name testBigIntPositiveSignCases0100
     * @tc.desc Verify positive() is true for non-negative values including zero per API spec
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSignCases0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(123).positive()).assertTrue();
        expect(new BigInt(-123).positive()).assertFalse();
        expect(new BigInt(0).positive()).assertTrue();
        expect(new BigInt(1).positive()).assertTrue();
        expect(new BigInt(-1).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0200
     * @tc.name testBigIntPositiveComplementNegative0200
     * @tc.desc Verify positive() and negative() are mutually exclusive sign checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveComplementNegative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(42).positive()).assertTrue();
        expect(new BigInt(42).negative()).assertFalse();
        expect(new BigInt(-42).positive()).assertFalse();
        expect(new BigInt(-42).negative()).assertTrue();
        expect(new BigInt(0).positive()).assertTrue();
        expect(new BigInt(0).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0300
     * @tc.name testBigIntPositiveReturnType0300
     * @tc.desc Mindmap return value: positive returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).positive())).assertEqual(Class.from<boolean>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0400
     * @tc.name testBigIntPositiveLarge0400
     * @tc.desc Mindmap input: positive on large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').positive()).assertTrue();
      expect(BigInt('-999999999999999999999999999999').positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0500
     * @tc.name testBigIntPositiveStringBoolean0500
     * @tc.desc Mindmap input: positive on string and boolean sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveStringBoolean0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('42').positive()).assertTrue();
      expect(BigInt('-42').positive()).assertFalse();
      expect(BigInt(true).positive()).assertTrue();
      expect(BigInt(false).positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0600
     * @tc.name testBigIntPositiveLongBounds0600
     * @tc.desc Mindmap input: positive() at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).positive()).assertTrue();
      expect(BigInt(-9223372036854775808).positive()).assertFalse();
      expect(BigInt(-9223372036854775807).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0700
     * @tc.name testBigIntPositiveFromULong0700
     * @tc.desc Mindmap input: positive() on values from unsigned long construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveFromULong0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).positive()).assertTrue();
      expect(BigInt.fromULong(9223372036854775807).positive()).assertTrue();
      expect(BigInt.fromULong(-1).positive()).assertTrue();
    });
  });
}
