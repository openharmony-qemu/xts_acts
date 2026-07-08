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

export default function BigIntEquals2Test(): void {
  describe('BigInt.equals(other: Any) overload (mindmap equals_2)', () => {
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
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0100
     * @tc.name testBigIntEqualsAnyBigIntTrue0100
     * @tc.desc Mindmap input and return value: equals(Any) true when other is equal BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBigIntTrue0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).equals(BigInt(42))).assertTrue();
      expect(BigInt(0).equals(BigInt(0))).assertTrue();
      expect(BigInt(-42).equals(BigInt(-42))).assertTrue();
      expect(BigInt(42).equals(BigInt('42'))).assertTrue();
      const a = BigInt(42);
      expect(a.equals(a)).assertTrue();
      expect(BigInt('99999999999999999999').equals(BigInt('99999999999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0200
     * @tc.name testBigIntEqualsAnyBigIntFalse0200
     * @tc.desc Mindmap input: equals(Any) false when other is unequal BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBigIntFalse0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).equals(BigInt(99))).assertFalse();
      expect(BigInt(42).equals(BigInt(-42))).assertFalse();
      expect(BigInt(0).equals(BigInt(1))).assertFalse();
      expect(BigInt('99999999999999999999').equals(BigInt('88888888888888888888'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0300
     * @tc.name testBigIntEqualsAnyNonBigIntFalse0300
     * @tc.desc Mindmap error handling: equals(Any) returns false for non-BigInt without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyNonBigIntFalse0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);

      expect(a.equals(42)).assertFalse();
      expect(a.equals('42')).assertFalse();
      expect(a.equals(true)).assertFalse();
      expect(a.equals(false)).assertFalse();
      expect(a.equals(null)).assertFalse();
      expect(a.equals(undefined)).assertFalse();
      expect(a.equals({})).assertFalse();
      expect(BigInt(0).equals(0)).assertFalse();
      expect(BigInt(9223372036854775807).equals(9223372036854775807 as object)).assertFalse();
      expect(BigInt(-9223372036854775808).equals('-9223372036854775808')).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0400
     * @tc.name testBigIntEqualsAnyReturnType0400
     * @tc.desc Mindmap return value: equals(Any) returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const t = BigInt(42).equals(BigInt(42));
      const f = BigInt(42).equals(42);

      expect(Class.of(t)).assertEqual(Class.from<boolean>());
      expect(t).assertTrue();
      expect(f).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0500
     * @tc.name testBigIntEqualsAnyLargeBoundary0500
     * @tc.desc Mindmap input: equals(Any) on very large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyLargeBoundary0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt(huge).equals(BigInt(huge))).assertTrue();
      expect(BigInt(huge).equals(BigInt('999999999999999999999999999998'))).assertFalse();
      const neg = '-' + huge;
      expect(BigInt(neg).equals(BigInt(neg))).assertTrue();
      expect(BigInt(huge).equals(BigInt('-' + huge))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0600
     * @tc.name testBigIntEqualsAnySequentialNoThrow0600
     * @tc.desc Mindmap return value: mixed BigInt and non-BigInt equals does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnySequentialNoThrow0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);

      expect(a.equals(BigInt(42))).assertTrue();
      expect(a.equals(42)).assertFalse();
      expect(a.equals(null)).assertFalse();
      expect(a.equals(BigInt('42'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0700
     * @tc.name testBigIntEqualsAnyLongBounds0700
     * @tc.desc Mindmap input: equals(Any) on signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyLongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.equals(BigInt('9223372036854775807'))).assertTrue();
      expect(min.equals(BigInt('-9223372036854775808'))).assertTrue();
      expect(max.equals(BigInt('-9223372036854775808'))).assertFalse();
      expect(min.equals(BigInt('9223372036854775808'))).assertFalse();
      expect(max.equals(BigInt('9223372036854775808'))).assertFalse();
      expect(BigInt(0).equals(new BigInt())).assertTrue();
    });
  });
}
