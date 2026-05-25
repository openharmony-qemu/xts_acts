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

export default function BigIntOperatorDecrementTest(): void {
  describe('BigInt.operatorDecrement (mindmap operatorDecrement)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0100
     * @tc.name testBigIntOperatorDecrementBasic0100
     * @tc.desc Verify operatorDecrement basic cases including zero and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v1 = BigInt(43);
        expect(v1.operatorDecrement().toString()).assertEqual('42');
        const v2 = BigInt(1);
        expect(v2.operatorDecrement().toString()).assertEqual('0');
        const v3 = BigInt(0);
        expect(v3.operatorDecrement().toString()).assertEqual('-1');
        expect(BigInt('9223372036854775807').operatorDecrement().toString())
          .assertEqual('9223372036854775806');
        expect(BigInt('-9223372036854775807').operatorDecrement().toString())
          .assertEqual('-9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0200
     * @tc.name testBigIntOperatorDecrementImmutable0200
     * @tc.desc Verify operatorDecrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementImmutable0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = BigInt(5);
        const orig = v.toString();
        const result = v.operatorDecrement();
        expect(v.toString()).assertEqual(orig);
        expect(result.toString()).assertEqual('4');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0300
     * @tc.name testBigIntOperatorDecrementReturnType0300
     * @tc.desc Verify operatorDecrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorDecrement() === 'bigint').assertTrue();
      });
  });
}
