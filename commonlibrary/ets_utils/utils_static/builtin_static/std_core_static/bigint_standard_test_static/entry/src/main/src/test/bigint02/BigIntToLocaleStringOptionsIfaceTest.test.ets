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
import { describe, it, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic/Constant';

export default function BigIntToLocaleStringOptionsIfaceTest(): void {
  describe('BigInt.toLocaleString with options (mindmap toLocaleString_options_iface)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0100
     * @tc.name testBigIntToLocaleStringOptionsIfaceLocaleAndOptions0100
     * @tc.desc Mindmap input: locales and BigIntToLocaleStringOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceLocaleAndOptions0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = BigInt(1234567);
      const opts: BigIntToLocaleStringOptions = { notation: 'standard' };

      expect(val.toLocaleString('en-US', opts).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0200
     * @tc.name testBigIntToLocaleStringOptionsIfaceStyle0200
     * @tc.desc Mindmap input: style option with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceStyle0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = BigInt(1000000);
      const opts: BigIntToLocaleStringOptions = { style: 'decimal' };

      expect(val.toLocaleString('en-US', opts).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0300
     * @tc.name testBigIntToLocaleStringOptionsIfaceOptionsOnly0300
     * @tc.desc Mindmap input: undefined locales with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceOptionsOnly0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = BigInt(1000000);
      const opts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'short' };

      expect(val.toLocaleString(undefined, opts).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0400
     * @tc.name testBigIntToLocaleStringOptionsIfaceLocaleOnly0400
     * @tc.desc Mindmap input: locale without options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceLocaleOnly0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString('en-US').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0500
     * @tc.name testBigIntToLocaleStringOptionsIfaceDefaultNoArg0500
     * @tc.desc Mindmap input: no-arg toLocaleString uses defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceDefaultNoArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0600
     * @tc.name testBigIntToLocaleStringOptionsIfaceBothUndefined0600
     * @tc.desc Mindmap input: explicit undefined locales and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceBothUndefined0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString(undefined, undefined).length > 0).assertTrue();
    });
  });
}
