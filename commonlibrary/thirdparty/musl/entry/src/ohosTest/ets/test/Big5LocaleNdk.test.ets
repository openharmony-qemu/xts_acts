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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import big5locale from 'liblocalebig5ndk.so'

export default function big5LocaleNdkTest() {
  describe('MuslBig5LocaleTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testSetlocaleBig5Localeconv
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0001_0100
     * @tc.desc   test setlocale zh_HK.Big5 and localeconv HK format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleBig5Localeconv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleBig5Localeconv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleLowercase
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0002_0100
     * @tc.desc   test zh_hk.Big5 lowercase returns NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleLowercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleLowercase();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleTooLong
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0003_0100
     * @tc.desc   test too long locale name falls back to C.UTF-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleTooLong();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleIcuMissing
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0004_0100
     * @tc.desc   test ICU missing zh_HK data localeconv default format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleIcuMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleIcuMissing();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleHkscsLocaleconv
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0005_0100
     * @tc.desc   test zh_HK.Big5-HKSCS localeconv format consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleHkscsLocaleconv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleHkscsLocaleconv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleHkscsLowercase
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0006_0100
     * @tc.desc   test zh_hk.Big5-HKSCS lowercase returns NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleHkscsLowercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleHkscsLowercase();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleEnvCleared
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0007_0100
     * @tc.desc   test zh_HK.Big5 returns non-NULL after env cleared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleEnvCleared', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleEnvCleared();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleSlash
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0008_0100
     * @tc.desc   test locale name with slash falls back to C.UTF-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleSlash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleSlash();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWctypeNewlocaleYue
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0009_0100
     * @tc.desc   test newlocale locale_t for Yue char U+7CA4 ICU delegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWctypeNewlocaleYue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wctypeNewlocaleYue();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWctypeSetlocaleYue
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0010_0100
     * @tc.desc   test setlocale locale_t for Yue char U+7CA4 ICU delegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWctypeSetlocaleYue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wctypeSetlocaleYue();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWctypeHkscsSupplementary
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0011_0100
     * @tc.desc   test HKSCS locale_t extended char U+233E6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWctypeHkscsSupplementary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wctypeHkscsSupplementary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWctypeCLocaleYue
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0012_0100
     * @tc.desc   test C locale_t Yue char U+7CA4 classified as alpha by Unicode table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWctypeCLocaleYue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wctypeCLocaleYue();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWctypeAsciiConsistent
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0013_0100
     * @tc.desc   test zh_HK.Big5 ASCII chars consistent with C locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWctypeAsciiConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wctypeAsciiConsistent();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStrtodLBig5_314
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0014_0100
     * @tc.desc   test strtod_l parses 3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrtodLBig5_314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.strtodLBig5_314();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStrtodLBig5Overflow
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0016_0100
     * @tc.desc   test strtod_l overflow 1e999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrtodLBig5Overflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.strtodLBig5Overflow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWcstodLBig5_314
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0017_0100
     * @tc.desc   test wcstod_l parses 3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstodLBig5_314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wcstodLBig5_314();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testWcstodLBig5Overflow
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0019_0100
     * @tc.desc   test wcstod_l overflow 1e999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstodLBig5Overflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.wcstodLBig5Overflow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testLocaleconvBig5Fields
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0020_0100
     * @tc.desc   test zh_HK format fields non-C default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleconvBig5Fields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.localeconvBig5Fields();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testLocaleconvStaticInvalidation
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0021_0100
     * @tc.desc   test accessing old pointer after setlocale switch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocaleconvStaticInvalidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.localeconvStaticInvalidation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testHkscsVariantConsistency
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0022_0100
     * @tc.desc   test HKSCS variant behavior consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHkscsVariantConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.hkscsVariantConsistency();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStrtodLStructLayout
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0023_0100
     * @tc.desc   test cross-architecture precision and struct layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrtodLStructLayout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.strtodLStructLayout();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvBig5ToUtf8
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0024_0100
     * @tc.desc   test Big5 to UTF8 valid byte sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvBig5ToUtf8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvBig5ToUtf8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvBig5InvalidByte
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0025_0100
     * @tc.desc   test Big5 to UTF8 invalid byte U+FFFD substitution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvBig5InvalidByte', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvBig5InvalidByte();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvBig5Incomplete
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0026_0100
     * @tc.desc   test Big5 to UTF8 incomplete sequence U+FFFD substitution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvBig5Incomplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvBig5Incomplete();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvBig5BufferTooSmall
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0027_0100
     * @tc.desc   test Big5 to UTF8 output buffer too small E2BIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvBig5BufferTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvBig5BufferTooSmall();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvHkscsToUtf8Reuse
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0028_0100
     * @tc.desc   test HKSCS to UTF8 handle reuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvHkscsToUtf8Reuse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvHkscsToUtf8Reuse();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvUtf8ToBig5
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0029_0100
     * @tc.desc   test UTF8 to Big5 valid character sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvUtf8ToBig5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvUtf8ToBig5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvUtf8ToBig5Unrepresentable
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0030_0100
     * @tc.desc   test UTF8 to Big5 unrepresentable char U+FFFD substitution and continue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvUtf8ToBig5Unrepresentable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvUtf8ToBig5Unrepresentable();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvUtf8ToHkscsSupplementary
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0031_0100
     * @tc.desc   test UTF8 to HKSCS supplementary plane char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvUtf8ToHkscsSupplementary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvUtf8ToHkscsSupplementary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvCp950Alias
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0032_0100
     * @tc.desc   test cp950 alias recognition and Big5 to UTF8 conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvCp950Alias', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvCp950Alias();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testIconvUnsupportedCharset
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0033_0100
     * @tc.desc   test unsupported charset name returns EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIconvUnsupportedCharset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.iconvUnsupportedCharset();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnLocaleconv
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0034_0100
     * @tc.desc   test regression zh_CN setlocale and localeconv format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnLocaleconv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnLocaleconv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnWctype
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0035_0100
     * @tc.desc   test regression zh_CN wctype char classification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnWctype', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnWctype();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnStrtod
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0036_0100
     * @tc.desc   test regression zh_CN strtod_l and wcstod_l numeric parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnStrtod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnStrtod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressEnUsLocaleconv
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0037_0100
     * @tc.desc   test regression en_US.UTF-8 setlocale and localeconv format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressEnUsLocaleconv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressEnUsLocaleconv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressEnUsWctype
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0038_0100
     * @tc.desc   test regression en_US.UTF-8 wctype char classification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressEnUsWctype', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressEnUsWctype();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressEnUsStrtod
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0039_0100
     * @tc.desc   test regression en_US.UTF-8 strtod_l and wcstod_l numeric parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressEnUsStrtod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressEnUsStrtod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnUtf8Localeconv
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0040_0100
     * @tc.desc   test regression zh_CN.UTF-8 setlocale and localeconv format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnUtf8Localeconv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnUtf8Localeconv();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnUtf8Wctype
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0041_0100
     * @tc.desc   test regression zh_CN.UTF-8 wctype char classification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnUtf8Wctype', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnUtf8Wctype();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressZhCnUtf8Strtod
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0042_0100
     * @tc.desc   test regression zh_CN.UTF-8 strtod_l and wcstod_l numeric parse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressZhCnUtf8Strtod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressZhCnUtf8Strtod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRegressIconvLocaleIndependent
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0043_0100
     * @tc.desc   test regression iconv encoding conversion locale independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegressIconvLocaleIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.regressIconvLocaleIndependent();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultiThreadLocaleIsolation
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0044_0100
     * @tc.desc   test multithread locale_t isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiThreadLocaleIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.multiThreadLocaleIsolation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultiThreadSetlocaleIsolation
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0045_0100
     * @tc.desc   test multithread setlocale and locale_t isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiThreadSetlocaleIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.multiThreadSetlocaleIsolation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMultiThreadLocaleconvSafety
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0046_0100
     * @tc.desc   test multithread localeconv static pointer race safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiThreadLocaleconvSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.multiThreadLocaleconvSafety();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMemLeakNewlocaleFreelocale
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0047_0100
     * @tc.desc   test loop newlocale and freelocale memory leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMemLeakNewlocaleFreelocale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.memLeakNewlocaleFreelocale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMemLeakIconvOpenClose
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0048_0100
     * @tc.desc   test loop iconv_open and close resource leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMemLeakIconvOpenClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.memLeakIconvOpenClose();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixedMaskLocale
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0049_0100
     * @tc.desc   test mixed mask locale classification and parse path separation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMixedMaskLocale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.mixedMaskLocale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleEmptyString
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0050_0100
     * @tc.desc   test setlocale empty string input does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleEmptyString();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetlocaleNullQuery
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0051_0100
     * @tc.desc   test setlocale NULL query current locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetlocaleNullQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.setlocaleNullQuery();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUselocaleThreadIsolation
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0052_0100
     * @tc.desc   test uselocale thread local locale and global setlocale isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUselocaleThreadIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.uselocaleThreadIsolation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUselocaleRestoreGlobal
     * @tc.number SUB_THIRDPARTY_MUSL_BIG5_LOCALE_0053_0100
     * @tc.desc   test uselocale restore global locale behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUselocaleRestoreGlobal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = big5locale.uselocaleRestoreGlobal();
      expect(result).assertEqual(0);
      done();
    });
  })
}
