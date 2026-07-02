'use static';
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
  describe('BigIntToLocaleStringOptions properties (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0100
     * @tc.name testBigIntToLocaleStringOptionsCompactRead0100
     * @tc.desc Mindmap input: read compactDisplay when set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsCompactRead0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { compactDisplay: 'short' };

      expect(options.compactDisplay).assertEqual('short');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0200
     * @tc.name testBigIntToLocaleStringOptionsCompactWrite0200
     * @tc.desc Mindmap input: write compactDisplay short and long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsCompactWrite0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { compactDisplay: 'long' };

      expect(options.compactDisplay).assertEqual('long');
      options.compactDisplay = 'short';
      expect(options.compactDisplay).assertEqual('short');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0300
     * @tc.name testBigIntToLocaleStringOptionsOptional0300
     * @tc.desc Mindmap input: optional compactDisplay unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsOptional0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { notation: 'compact' };

      expect(options.compactDisplay).assertUndefined();
      options = { compactDisplay: undefined };
      expect(options.compactDisplay).assertUndefined();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0400
     * @tc.name testBigIntToLocaleStringOptionsNotation0400
     * @tc.desc Mindmap input: notation property read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsNotation0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { notation: 'standard' };

      expect(options.notation).assertEqual('standard');
      options.notation = 'compact';
      expect(options.notation).assertEqual('compact');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0500
     * @tc.name testBigIntToLocaleStringOptionsEmptyString0500
     * @tc.desc Mindmap boundary: empty compactDisplay string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsEmptyString0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { compactDisplay: '' };

      expect(options.compactDisplay).assertEqual('');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_PROPS_0600
     * @tc.name testBigIntToLocaleStringOptionsCombined0600
     * @tc.desc Mindmap return value: combined options fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsCombined0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let options: BigIntToLocaleStringOptions = { compactDisplay: 'long', notation: 'compact' };

      expect(options.compactDisplay).assertEqual('long');
      expect(options.notation).assertEqual('compact');
    });
  });
}
