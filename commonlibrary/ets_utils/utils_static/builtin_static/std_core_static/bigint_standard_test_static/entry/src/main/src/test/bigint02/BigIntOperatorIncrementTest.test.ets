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

export default function BigIntOperatorIncrementTest(): void {
  describe('BigInt.operatorIncrement (mindmap operatorIncrement)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0100
     * @tc.name testBigIntOperatorIncrementBasic0100
     * @tc.desc Verify operatorIncrement basic cases including zero and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v1 = BigInt(41);
        expect(v1.operatorIncrement().toString()).assertEqual('42');
        const v2 = BigInt(0);
        expect(v2.operatorIncrement().toString()).assertEqual('1');
        const v3 = BigInt(-2);
        expect(v3.operatorIncrement().toString()).assertEqual('-1');
        expect(BigInt('9223372036854775806').operatorIncrement().toString())
          .assertEqual('9223372036854775807');
        expect(BigInt('-9223372036854775808').operatorIncrement().toString())
          .assertEqual('-9223372036854775807');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0200
     * @tc.name testBigIntOperatorIncrementImmutable0200
     * @tc.desc Verify operatorIncrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementImmutable0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = BigInt(5);
        const orig = v.toString();
        const result = v.operatorIncrement();
        expect(v.toString()).assertEqual(orig);
        expect(result.toString()).assertEqual('6');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0300
     * @tc.name testBigIntOperatorIncrementReturnType0300
     * @tc.desc Verify operatorIncrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorIncrement() === 'bigint').assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0400
     * @tc.name testBigIntOperatorIncrementLarge0400
     * @tc.desc Verify operatorIncrement on magnitudes beyond safe integer and long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementLarge0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('999999999999999999999999999999').operatorIncrement().toString())
          .assertEqual('1000000000000000000000000000000');
        expect(BigInt('-999999999999999999999999999999').operatorIncrement().toString())
          .assertEqual('-999999999999999999999999999998');
        expect(BigInt('9223372036854775807').operatorIncrement().toString())
          .assertEqual('9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0500
     * @tc.name testBigIntOperatorIncrementMaxSafeInteger0500
     * @tc.desc Verify operatorIncrement at Number.MAX_SAFE_INTEGER boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementMaxSafeInteger0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(BigInt(maxSafe).operatorIncrement().toString()).assertEqual('9007199254740992');
        expect(BigInt(`-${maxSafe}`).operatorIncrement().toString()).assertEqual('-9007199254740990');
      });
  });
}
