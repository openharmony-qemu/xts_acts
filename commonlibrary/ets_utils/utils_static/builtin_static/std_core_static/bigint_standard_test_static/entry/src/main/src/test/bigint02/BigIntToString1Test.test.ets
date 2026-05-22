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

export default function BigIntToString1Test(): void {
  describe('BigInt.toString 无参（导图 toString_1）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0100
     * @tc.name testBigIntToString1Decimal0100
     * @tc.desc Verify no-arg toString returns decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Decimal0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).toString()).assertEqual('42');
        expect(new BigInt(-42).toString()).assertEqual('-42');
        expect(new BigInt(0).toString()).assertEqual('0');
        expect(new BigInt(9007199254740993).toString()).assertEqual('9007199254740993');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0200
     * @tc.name testBigIntToString1Large0200
     * @tc.desc Verify toString on very large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Large0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('999999999999999999999999999999').toString())
          .assertEqual('999999999999999999999999999999');
      });
  });
}
