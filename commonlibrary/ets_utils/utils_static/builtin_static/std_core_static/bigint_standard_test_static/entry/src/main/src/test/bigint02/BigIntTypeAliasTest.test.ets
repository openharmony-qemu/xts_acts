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

export default function BigIntTypeAliasTest(): void {
  describe('bigint type alias (mindmap bigint)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0100
     * @tc.name testBigIntTypeAliasConstLet0100
     * @tc.desc Mindmap input: const and let bigint declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasConstLet0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: bigint = BigInt(100);

      expect(value.toString()).assertEqual('100');
      let val: bigint = BigInt(42);

      expect(val.toString()).assertEqual('42');
      val = BigInt(200);
      expect(val.toString()).assertEqual('200');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0200
     * @tc.name testBigIntTypeAliasCopy0200
     * @tc.desc Mindmap input: copy constructor assigns to bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasCopy0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original: bigint = BigInt(999);
      const copied: bigint = BigInt(original);

      expect(copied.equals(999n)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0300
     * @tc.name testBigIntTypeAliasIntegral0300
     * @tc.desc Mindmap input: byte short int long assign to bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasIntegral0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const byteVal: byte = 127;
      const shortVal: short = 32767;
      const fromByte: bigint = BigInt(byteVal);
      const fromShort: bigint = BigInt(shortVal);
      const fromInt: bigint = BigInt(2147483647);
      const fromLong: bigint = BigInt(9223372036854775807);

      expect(fromByte.toString()).assertEqual('127');
      expect(fromShort.toString()).assertEqual('32767');
      expect(fromInt.toString()).assertEqual('2147483647');
      expect(fromLong.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0400
     * @tc.name testBigIntTypeAliasStringBoolean0400
     * @tc.desc Mindmap input: string and boolean sources for bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasStringBoolean0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromStr: bigint = BigInt('9007199254740993');
      const fromTrue: bigint = BigInt(true);
      const fromFalse: bigint = BigInt(false);

      expect(fromStr.toString()).assertEqual('9007199254740993');
      expect(fromTrue.toString()).assertEqual('1');
      expect(fromFalse.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0500
     * @tc.name testBigIntTypeAliasOps0500
     * @tc.desc Mindmap return value: bigint supports operator methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasOps0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: bigint = BigInt(10);
      const sum: bigint = a.operatorAdd(20n);

      expect(sum.toString()).assertEqual('30');
      expect(Class.of(a)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0600
     * @tc.name testBigIntTypeAliasStatic0600
     * @tc.desc Mindmap return value: asIntN asUintN assign to bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasStatic0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const truncated: bigint = BigInt.asIntN(8, BigInt(256));
      const asUint: bigint = BigInt.asUintN(8, BigInt(-1));

      expect(truncated.toString()).assertEqual('0');
      expect(asUint.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0700
     * @tc.name testBigIntTypeAliasValueOf0700
     * @tc.desc Mindmap return value: valueOf assigns to bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasValueOf0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original: bigint = BigInt(123);
      const val: bigint = original.valueOf();

      expect(val.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0800
     * @tc.name testBigIntTypeAliasReassign0800
     * @tc.desc Mindmap input: let bigint reassignment and operator result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasReassign0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: bigint = BigInt(5);

      val = val.operatorAdd(10n);
      expect(val.toString()).assertEqual('15');
    });
  });
}
