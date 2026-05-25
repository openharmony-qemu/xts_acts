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

export default function BigintTypeAliasTest(): void {
  describe('bigint type alias (mindmap bigint)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0100
     * @tc.name testBigIntTypeAliasAssign0100
     * @tc.desc Verify bigint type alias assignment from BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasAssign0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: bigint = BigInt(100);

      expect(value.toString()).assertEqual('100');
      let val: bigint = BigInt(42);
      expect(val.toString()).assertEqual('42');
      val = BigInt(200);
      expect(val.toString()).assertEqual('200');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0200
     * @tc.name testBigIntTypeAliasOps0200
     * @tc.desc Verify bigint supports BigInt operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasOps0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: bigint = BigInt(10);
      const b: bigint = BigInt(20);
      const sum: bigint = a.operatorAdd(b);

      expect(sum.toString()).assertEqual('30');
      expect(typeof a === 'bigint').assertTrue();
      const asClass: bigint = a;
      expect(asClass.equals(a)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0300
     * @tc.name testBigIntTypeAliasStatic0300
     * @tc.desc Verify static methods assign to bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasStatic0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const truncated: bigint = BigInt.asIntN(8, BigInt(256));

      expect(truncated.toString()).assertEqual('0');
      const asUint: bigint = BigInt.asUintN(8, BigInt(-1));
      expect(asUint.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0400
     * @tc.name testBigIntTypeAliasInvalidArgConstruct0400
     * @tc.desc Verify invalid BigInt construction throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasInvalidArgConstruct0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const invalidMsg = 'BigInt.parseFromString(): provided string is invalid';

      expect((): void => {
        BigInt('abc');
      }).assertThrow(invalidMsg);
      expect((): void => {
        BigInt(3.14 as double);
      }).assertThrowError('RangeError');
    });
  });
}
