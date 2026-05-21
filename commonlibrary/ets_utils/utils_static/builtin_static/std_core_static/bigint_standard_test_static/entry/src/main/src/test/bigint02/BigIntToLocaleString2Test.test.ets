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

export default function BigIntToLocaleString2Test(): void {
  describe('BigInt.toLocaleString(locales, options)（导图 toLocaleString_2）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0100
     * @tc.name testBigIntToLocaleString2Locale0100
     * @tc.desc Verify toLocaleString with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locale0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const s = new BigInt(1000000).toLocaleString('en-US');
        expect(s.length > 0).assertTrue();
        const zh = new BigInt(1000000).toLocaleString('zh-CN', { notation: 'compact', compactDisplay: 'short' });
        expect(zh.length > 0).assertTrue();
      });
  });
}
