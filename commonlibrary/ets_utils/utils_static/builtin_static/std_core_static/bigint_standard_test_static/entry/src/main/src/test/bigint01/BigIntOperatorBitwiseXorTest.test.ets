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

export default function BigIntOperatorBitwiseXorTest(): void {
  describe('BigInt.operatorBitwiseXor (mindmap operatorBitwiseXor)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0100
     * @tc.name testBigIntOperatorBitwiseXorBasic0100
     * @tc.desc Verify basic bitwise XOR results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorBitwiseXor(BigInt(3)).toString()).assertEqual('6');
      expect(BigInt(12).operatorBitwiseXor(BigInt(10)).toString()).assertEqual('6');
      expect(BigInt(255).operatorBitwiseXor(BigInt(15)).toString()).assertEqual('240');
      expect(BigInt(1).operatorBitwiseXor(BigInt(2)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0200
     * @tc.name testBigIntOperatorBitwiseXorSpecial0200
     * @tc.desc Verify XOR with zero, self, and minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorSpecial0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(123).operatorBitwiseXor(BigInt(0)).toString()).assertEqual('123');
      expect(BigInt(255).operatorBitwiseXor(BigInt(255)).toString()).assertEqual('0');
      expect(BigInt(5).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-6');
      expect(BigInt(0).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-100).operatorBitwiseXor(BigInt(-1)).toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0300
     * @tc.name testBigIntOperatorBitwiseXorCommutative0300
     * @tc.desc Verify commutative property of bitwise XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorCommutative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const b = BigInt(10);

      expect(a.operatorBitwiseXor(b).toString()).assertEqual(b.operatorBitwiseXor(a).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0400
     * @tc.name testBigIntOperatorBitwiseXorReturnType0400
     * @tc.desc Verify operatorBitwiseXor returns BigInt and supports chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = BigInt(5).operatorBitwiseXor(BigInt(3));

      expect(typeof result === 'bigint').assertTrue();
      expect(BigInt(1).operatorBitwiseXor(BigInt(2)).operatorBitwiseXor(BigInt(4)).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0500
     * @tc.name testBigIntOperatorBitwiseXorInvalidArg0500
     * @tc.desc Verify operatorBitwiseXor rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(5);

      expect((): void => {
        left.operatorBitwiseXor(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseXor(5 as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_XOR_0600
     * @tc.name testBigIntOperatorBitwiseXorLarge0600
     * @tc.desc Verify bitwise XOR on magnitudes beyond Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseXorLarge0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt('999999999999999999999999999990');
      const b = BigInt('18446744073709551615');

      expect(a.operatorBitwiseXor(b).toString()).assertEqual('1000000000008292855533099024393');
      expect(a.operatorBitwiseXor(a).toString()).assertEqual('0');
    });
  });
}
