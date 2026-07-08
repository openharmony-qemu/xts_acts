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

export default function BigIntEquals1Test(): void {
  describe('BigInt.equals(to: BigInt) overload (mindmap equals_1)', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{

    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0100
     * @tc.name testBigIntEqualsBigIntTrue0100
     * @tc.desc Mindmap input and return value: equals(to: BigInt) true for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntTrue0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).equals(BigInt(42))).assertTrue();
      expect(BigInt(0).equals(BigInt(0))).assertTrue();
      expect(BigInt(-42).equals(BigInt(-42))).assertTrue();
      expect(BigInt('99999999999999999999').equals(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt(42).equals(BigInt('42'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0200
     * @tc.name testBigIntEqualsBigIntFalse0200
     * @tc.desc Mindmap input: equals(to: BigInt) false for unequal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntFalse0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).equals(BigInt(99))).assertFalse();
      expect(BigInt(-42).equals(BigInt(42))).assertFalse();
      expect(BigInt(1).equals(BigInt(-1))).assertFalse();
      expect(BigInt('99999999999999999999').equals(BigInt('88888888888888888888'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0300
     * @tc.name testBigIntEqualsBigIntBoundary0300
     * @tc.desc Mindmap input: equals on large boundary magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntBoundary0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt(huge).equals(BigInt(huge))).assertTrue();
      expect(BigInt(huge).equals(BigInt('999999999999999999999999999998'))).assertFalse();
      const neg = '-' + huge;
      expect(BigInt(neg).equals(BigInt(neg))).assertTrue();
      expect(BigInt(neg).equals(BigInt(huge))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0400
     * @tc.name testBigIntEqualsBigIntReturnType0400
     * @tc.desc Mindmap return value: equals(to: BigInt) returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const t = BigInt(42).equals(BigInt(42));
      const f = BigInt(42).equals(BigInt(99));

      expect(Class.of(t)).assertEqual(Class.from<boolean>());
      expect(t).assertTrue();
      expect(f).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0500
     * @tc.name testBigIntEqualsBigIntInvalidArg0500
     * @tc.desc Mindmap error handling: equals(to: BigInt) throws ClassCastError for non-BigInt cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);

      expect((): void => {
        a.equals(null as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.equals(undefined as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.equals('42' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.equals(42 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.equals(true as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.equals({} as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0600
     * @tc.name testBigIntEqualsBigIntCopyConstructor0600
     * @tc.desc Mindmap input: equals(to: BigInt) with copy-constructed operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntCopyConstructor0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src = BigInt(42);

      expect(src.equals(BigInt(src))).assertTrue();
      expect(BigInt(0).equals(new BigInt())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0700
     * @tc.name testBigIntEqualsBigIntLongBounds0700
     * @tc.desc Mindmap input: equals on signed long extrema and adjacent magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntLongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.equals(BigInt('9223372036854775807'))).assertTrue();
      expect(min.equals(BigInt('-9223372036854775808'))).assertTrue();
      expect(max.equals(min)).assertFalse();
      expect(max.equals(BigInt('9223372036854775808'))).assertFalse();
      expect(min.equals(BigInt('9223372036854775808'))).assertFalse();
      expect(BigInt(0).equals(new BigInt())).assertTrue();
    });
  });
}
