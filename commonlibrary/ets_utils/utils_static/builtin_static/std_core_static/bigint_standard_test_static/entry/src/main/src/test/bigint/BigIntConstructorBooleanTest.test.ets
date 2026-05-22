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

export default function BigIntConstructorBooleanTest(): void {
  describe('BigInt boolean constructor (mindmap constructor_8)', (): void => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0100
     * @tc.name testBigIntConstructorBooleanLiterals0100
     * @tc.desc Verify true maps to 1 and false maps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanLiterals0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(true).toString()).assertEqual('1');
        expect(new BigInt(false).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0200
     * @tc.name testBigIntConstructorBooleanVariables0200
     * @tc.desc Verify boolean variables construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanVariables0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const t: boolean = true;
        const f: boolean = false;
        expect(new BigInt(t).toString()).assertEqual('1');
        expect(new BigInt(f).toString()).assertEqual('0');
      });
  });
}
