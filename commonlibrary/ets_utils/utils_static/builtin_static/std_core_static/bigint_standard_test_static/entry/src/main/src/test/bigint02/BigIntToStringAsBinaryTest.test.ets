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

export default function BigIntToStringAsBinaryTest(): void {
  describe('BigInt.toStringAsBinary（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_BINARY_0100
     * @tc.name testBigIntToStringAsBinary0100
     * @tc.desc Verify toStringAsBinary output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsBinary0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toStringAsBinary()).assertEqual('11111111');
        expect(new BigInt(-8).toStringAsBinary()).assertEqual('1000');
      });
  });
}
