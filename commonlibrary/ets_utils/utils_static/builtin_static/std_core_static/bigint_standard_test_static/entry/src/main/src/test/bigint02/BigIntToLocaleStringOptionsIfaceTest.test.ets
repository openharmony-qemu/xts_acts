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

export default function BigIntToLocaleStringOptionsIfaceTest(): void {
  describe('BigInt.toLocaleString with options (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0100
     * @tc.name testBigIntToLocaleStringWithOptions0100
     * @tc.desc Verify BigInt uses BigIntToLocaleStringOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringWithOptions0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = new BigInt(1234567);
        const opts: BigIntToLocaleStringOptions = { notation: 'standard' };
        const s = val.toLocaleString('en-US', opts);
        expect(s.length > 0).assertTrue();
      });
  });
}
