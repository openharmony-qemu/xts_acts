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

export default function BigIntNegativeTest(): void {
  describe('BigInt.negative (mindmap negative)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0100
     * @tc.name testBigIntNegativeSignCases0100
     * @tc.desc Verify negative() for positive, negative, and zero BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeSignCases0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(123).negative()).assertFalse();
      expect(BigInt(-123).negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(1).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
      expect(BigInt('456').negative()).assertFalse();
      expect(BigInt('-456').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0200
     * @tc.name testBigIntNegativeBoundary0200
     * @tc.desc Verify negative() at int64 boundary magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeBoundary0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).negative()).assertFalse();
      expect(BigInt(-9223372036854775808).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0300
     * @tc.name testBigIntNegativeReturnType0300
     * @tc.desc Verify negative() returns boolean and is stable across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bn = BigInt(-100);
      const r1 = bn.negative();
      const r2 = bn.negative();
      const r3 = bn.negative();

      expect(Class.of(r1)).assertEqual(Class.from<boolean>());
      expect(r1 === r2 && r2 === r3).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0400
     * @tc.name testBigIntNegativeLargeMagnitude0400
     * @tc.desc Verify negative() on very large positive and negative magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeLargeMagnitude0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').negative()).assertFalse();
      expect(BigInt('-999999999999999999999999999999').negative()).assertTrue();
    });
  });
}
