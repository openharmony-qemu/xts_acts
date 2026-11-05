'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'

export default function SevenPointOneI18nStageStaticTest(): void {

  describe("SevenPointOneI18nStageStaticTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start SevenPointOneI18nStageStaticTest*************');

    beforeAll(() => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(() => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0100
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0100
     * @tc.desc getCurrency with locale zh-Hans-CN, expect Currency with ISO4217 code CNY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0100', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0100 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0100 ISO4217Code:', code);
      expect(code).assertEqual('CNY');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0200
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0200
     * @tc.desc getCurrency with locale en-US, expect Currency with ISO4217 code USD
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0200', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('en-US');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0200 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0200 ISO4217Code:', code);
      expect(code).assertEqual('USD');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0300
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0300
     * @tc.desc getCurrency with locale ja-JP, expect Currency with ISO4217 code JPY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0300', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('ja-JP');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0300 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0300 ISO4217Code:', code);
      expect(code).assertEqual('JPY');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0400
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0400
     * @tc.desc getCurrency with locale de-DE, expect Currency with ISO4217 code EUR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0400', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('de-DE');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0400 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0400 ISO4217Code:', code);
      expect(code).assertEqual('EUR');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0500
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0500
     * @tc.desc getCurrency with locale ru-RU, expect Currency with ISO4217 code RUB
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0500', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('ru-RU');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0500 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0500 ISO4217Code:', code);
      expect(code).assertEqual('RUB');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_static_0600
     * @tc.number SUB_GLOBAL_getCurrency_test_static_0600
     * @tc.desc getCurrency with locale ar-AE, expect Currency with ISO4217 code AED
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_static_0600', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('ar-AE');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_static_0600 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code: string = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_static_0600 ISO4217Code:', code);
      expect(code).assertEqual('AED');
    })

  })
}
