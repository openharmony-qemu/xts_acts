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

export default function BigIntEquals2Test(): void {
  describe('BigInt.equals Any（导图 equals_2）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0100
     * @tc.name testBigIntEqualsAnyBigIntTrue0100
     * @tc.desc Verify equals returns true for equal BigInt operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBigIntTrue0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).equals(new BigInt(42))).assertTrue();
        expect(new BigInt(0).equals(new BigInt(0))).assertTrue();
        expect(new BigInt(-42).equals(new BigInt(-42))).assertTrue();
        const a = new BigInt(42);
        expect(a.equals(a)).assertTrue();
        expect(new BigInt('99999999999999999999').equals(new BigInt('99999999999999999999'))).assertTrue();
        expect(new BigInt(42).equals(new BigInt('42'))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0200
     * @tc.name testBigIntEqualsAnyBigIntFalse0200
     * @tc.desc Verify equals returns false for unequal BigInt operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBigIntFalse0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).equals(new BigInt(99))).assertFalse();
        expect(new BigInt(42).equals(new BigInt(-42))).assertFalse();
        expect(new BigInt(0).equals(new BigInt(1))).assertFalse();
        expect(new BigInt(1).equals(new BigInt(-1))).assertFalse();
        expect(new BigInt('99999999999999999999').equals(new BigInt('88888888888888888888'))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0300
     * @tc.name testBigIntEqualsAnyNonBigIntFalse0300
     * @tc.desc Verify equals returns false for non-BigInt Any operands without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyNonBigIntFalse0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(42);
        expect(a.equals(42)).assertFalse();
        expect(a.equals('42')).assertFalse();
        expect(a.equals(true)).assertFalse();
        expect(a.equals(false)).assertFalse();
        expect(a.equals(null)).assertFalse();
        expect(a.equals(undefined)).assertFalse();
        expect(a.equals({})).assertFalse();
        const emptyList: number[] = [];
        expect(a.equals(emptyList)).assertFalse();
        const list42: number[] = [42];
        expect(a.equals(list42)).assertFalse();
        expect(new BigInt(0).equals(0)).assertFalse();
        expect(new BigInt(0).equals('')).assertFalse();
        expect(new BigInt(42).equals(NaN)).assertFalse();
        expect(new BigInt(42).equals(Infinity)).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0400
     * @tc.name testBigIntEqualsAnyReturnType0400
     * @tc.desc Verify equals return value is strict boolean, not number or string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const t = new BigInt(42).equals(new BigInt(42));
        const f = new BigInt(42).equals(42);
        expect(typeof t === 'boolean').assertTrue();
        expect(t).assertTrue();
        expect(f).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0500
     * @tc.name testBigIntEqualsAnyLargeBoundary0500
     * @tc.desc Verify equals on very large BigInt magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyLargeBoundary0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const huge = '999999999999999999999999999999';
        expect(new BigInt(huge).equals(new BigInt(huge))).assertTrue();
        expect(new BigInt(huge).equals(new BigInt('-' + huge))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_0600
     * @tc.name testBigIntEqualsAnySequentialNoThrow0600
     * @tc.desc Verify repeated equals calls with mixed operand types do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnySequentialNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          const a = new BigInt(42);
          expect(a.equals(new BigInt(42))).assertTrue();
          expect(a.equals(42)).assertFalse();
          expect(a.equals('42')).assertFalse();
          expect(a.equals(null)).assertFalse();
          expect(a.equals(undefined)).assertFalse();
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
