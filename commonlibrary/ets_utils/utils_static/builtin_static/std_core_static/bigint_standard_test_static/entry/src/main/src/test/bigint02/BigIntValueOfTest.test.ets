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

export default function BigIntValueOfTest(): void {
  describe('BigInt.valueOf (mindmap valueOf)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0100
     * @tc.name testBigIntValueOfEquals0100
     * @tc.desc Verify valueOf returns equal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfEquals0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(123);
        expect(v.valueOf().equals(v)).assertTrue();
        expect(v.valueOf().toString()).assertEqual('123');
        expect(new BigInt(-456).valueOf().toString()).assertEqual('-456');
        expect(new BigInt(0).valueOf().toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0200
     * @tc.name testBigIntValueOfReturnType0200
     * @tc.desc Verify valueOf returns BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfReturnType0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).valueOf() instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0300
     * @tc.name testBigIntValueOfStable0300
     * @tc.desc Verify repeated valueOf is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfStable0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(99);
        expect(v.valueOf().equals(v.valueOf())).assertTrue();
      });
  });
}
