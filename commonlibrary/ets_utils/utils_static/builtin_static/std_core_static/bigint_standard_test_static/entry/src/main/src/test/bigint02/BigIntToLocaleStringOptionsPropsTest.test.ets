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

export default function BigIntToLocaleStringOptionsPropsTest(): void {
  describe('BigIntToLocaleStringOptions properties (mindmap toLocaleString_options_props)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_PROPS_0100
     * @tc.name testBigIntToLocaleStringOptionsProps0100
     * @tc.desc Verify BigIntToLocaleStringOptions property read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsProps0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { compactDisplay: 'short' };

      expect(options.compactDisplay).assertEqual('short');
      options = { notation: 'compact' };
      expect(options.compactDisplay).assertUndefined();
      options = { compactDisplay: 'long', notation: 'compact' };
      expect(options.compactDisplay).assertEqual('long');
      expect(options.notation).assertEqual('compact');
    });
  });
}
