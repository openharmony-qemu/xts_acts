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

export default function BigIntEquals1Test_2(): void {
  describe('BigIntEquals1Test_2', ()=> {

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0001
     * @tc.name testBigIntEqualsBigIntBoolConstruct0001
     * @tc.desc equals(to: BigInt) with boolean-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntBoolConstruct0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).equals(BigInt(1))).assertTrue();
      expect(BigInt(false).equals(BigInt(0))).assertTrue();
      expect(BigInt(true).equals(BigInt(0))).assertFalse();
      expect(BigInt(false).equals(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0002
     * @tc.name testBigIntEqualsBigIntLeadingZeroPlus0002
     * @tc.desc equals(to: BigInt) with leading-zero and plus-sign string formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntLeadingZeroPlus0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('+123').equals(BigInt('123'))).assertTrue();
      expect(BigInt('007').equals(BigInt('7'))).assertTrue();
      expect(BigInt('+0').equals(BigInt(0))).assertTrue();
      expect(BigInt('00').equals(BigInt(0))).assertTrue();
      expect(BigInt('-007').equals(BigInt('-7'))).assertTrue();
      expect(BigInt('+127').equals(BigInt(127))).assertTrue();
      expect(BigInt('+2147483647').equals(BigInt(2147483647))).assertTrue();
      expect(BigInt('000000000042').equals(BigInt(42))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0003
     * @tc.name testBigIntEqualsBigIntCopyConstructorImmutability0003
     * @tc.desc equals(to: BigInt) copy-constructed instance unchanged after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntCopyConstructorImmutability0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src = BigInt(67890);
      const copy = BigInt(src);
      let modified = src.operatorAdd(BigInt(1));
      expect(copy.equals(BigInt(67890))).assertTrue();
      expect(copy.equals(modified)).assertFalse();
      const src2 = BigInt('99999999999999999999');
      const copy2 = BigInt(src2);
      modified = src2.operatorAdd(BigInt(1));
      expect(copy2.equals(BigInt('99999999999999999999'))).assertTrue();
      expect(copy2.equals(modified)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0004
     * @tc.name testBigIntEqualsBigIntAdjacentValues0004
     * @tc.desc equals(to: BigInt) for adjacent values not yet covered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntAdjacentValues0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(999).equals(BigInt(1000))).assertFalse();
      expect(BigInt(-999).equals(BigInt(-1000))).assertFalse();
      expect(BigInt(500).equals(BigInt(501))).assertFalse();
      expect(BigInt(-500).equals(BigInt(-501))).assertFalse();
      expect(BigInt(999).equals(BigInt(999))).assertTrue();
      expect(BigInt(-999).equals(BigInt(-999))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0005
     * @tc.name testBigIntEqualsBigIntImmutability0005
     * @tc.desc equals(to: BigInt) does not mutate left or right operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntImmutability0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(88);
      const b = BigInt(88);
      a.equals(b);
      expect(a.equals(BigInt(88))).assertTrue();
      const c = BigInt(2000);
      const d = BigInt(3000);
      c.equals(d);
      expect(d.toString()).assertEqual('3000');
      expect(c.toString()).assertEqual('2000');
      const e = BigInt('88888888888888888888');
      const f = BigInt('99999999999999999999');
      e.equals(f);
      expect(e.toString()).assertEqual('88888888888888888888');
      expect(f.toString()).assertEqual('99999999999999999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0006
     * @tc.name testBigIntEqualsBigIntBooleanCombine0006
     * @tc.desc equals(to: BigInt) result can combine with boolean operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntBooleanCombine0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(11);
      const b = BigInt(22);

      const r = a.equals(b);
      expect(!r).assertTrue();

      const r2 = a.equals(BigInt(11));
      expect(r2).assertTrue();

      const orResult1 = a.equals(BigInt(11)) || a.equals(BigInt(22));
      expect(orResult1).assertTrue();

      const orResult2 = a.equals(BigInt(99)) || a.equals(BigInt(22));
      expect(orResult2).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0007
     * @tc.name testBigIntEqualsBigIntNegPosLargeCrossSymmetry0007
     * @tc.desc equals(to: BigInt) cross-symmetry for large positive vs negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntNegPosLargeCrossSymmetry0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).equals(BigInt(-5))).assertFalse();
      expect(BigInt(-5).equals(BigInt(5))).assertFalse();
      expect(BigInt(1000).equals(BigInt(-1000))).assertFalse();
      expect(BigInt(-1000).equals(BigInt(1000))).assertFalse();
      expect(BigInt('123456789012345678901234567890').equals(BigInt('-123456789012345678901234567890'))).assertFalse();
      expect(BigInt('-123456789012345678901234567890').equals(BigInt('123456789012345678901234567890'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0008
     * @tc.name testBigIntEqualsBigIntCrossFormatConsistencyExt0008
     * @tc.desc equals(to: BigInt) cross-format: number vs string for ulong.MAX and extended boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntCrossFormatConsistencyExt0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551615').equals(BigInt('18446744073709551615'))).assertTrue();
      expect(BigInt(65535).equals(BigInt('65535'))).assertTrue();
      expect(BigInt(256).equals(BigInt('256'))).assertTrue();
      expect(BigInt(-129).equals(BigInt('-129'))).assertTrue();
      expect(BigInt(0).equals(BigInt('0'))).assertTrue();
      expect(BigInt(-1).equals(BigInt('-1'))).assertTrue();
      expect(BigInt('9007199254740993').equals(BigInt('9007199254740993'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0009
     * @tc.name testBigIntEqualsBigIntTransitivityExtended0009
     * @tc.desc equals(to: BigInt) transitivity verification for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntTransitivityExtended0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(777);
      const b = BigInt(777);
      const c = BigInt(777);
      const ab = a.equals(b);
      const bc = b.equals(c);
      const ac = a.equals(c);
      expect(ab && bc).assertEqual(ac);
      const x = BigInt('123456789012345678901234567890');
      const y = BigInt('123456789012345678901234567890');
      const z = BigInt('123456789012345678901234567890');
      const xy = x.equals(y);
      const yz = y.equals(z);
      const xz = x.equals(z);
      expect(xy && yz).assertEqual(xz);
    });


    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0010
     * @tc.name testBigIntEqualsBigIntZeroNegZeroExt0010
     * @tc.desc equals(to: BigInt) zero and negative zero with string constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntZeroNegZeroExt0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').equals(BigInt(0))).assertTrue();
      expect(BigInt(0).equals(BigInt('-0'))).assertTrue();
      expect(BigInt('-0').equals(BigInt('0'))).assertTrue();
      expect(BigInt('0').equals(BigInt('-0'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0011
     * @tc.name testBigIntEqualsBigIntBoundaryAdjacent0011
     * @tc.desc equals(to: BigInt) boundary adjacent: 256 vs 255, 65535 vs 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntBoundaryAdjacent0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(256).equals(BigInt(255))).assertFalse();
      expect(BigInt(65535).equals(BigInt(65536))).assertFalse();
      expect(BigInt(256).equals(BigInt(256))).assertTrue();
      expect(BigInt(65535).equals(BigInt(65535))).assertTrue();
      expect(BigInt(-129).equals(BigInt(-129))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0012
     * @tc.name testBigIntEqualsBigIntAsymmetricStr0012
     * @tc.desc equals(to: BigInt) asymmetric string: "9999999999999" vs "-9999999999999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntAsymmetricStr0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9999999999999').equals(BigInt('-9999999999999'))).assertFalse();
      expect(BigInt('-9999999999999').equals(BigInt('9999999999999'))).assertFalse();
      expect(BigInt('0').equals(BigInt('-0'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_BI_0013
     * @tc.name testBigIntEqualsBigIntUlongMaxStr0013
     * @tc.desc equals(to: BigInt) ulong.MAX string constructor comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsBigIntUlongMaxStr0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ulongMax = '18446744073709551615';
      expect(BigInt(ulongMax).equals(BigInt(ulongMax))).assertTrue();
      expect(BigInt(ulongMax).equals(BigInt('18446744073709551614'))).assertFalse();
    });

  });
}