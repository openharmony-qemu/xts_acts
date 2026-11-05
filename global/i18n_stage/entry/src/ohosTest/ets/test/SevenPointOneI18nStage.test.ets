import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';

export default function SevenPointOneI18nStageTest() {
  describe('SevenPointOneI18nStageTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0100
     * @tc.number SUB_GLOBAL_getCurrency_test_0100
     * @tc.desc getCurrency with locale zh-Hans-CN, expect Currency with ISO4217 code CNY
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0100', Level.LEVEL0, () => {
      let locale = new Intl.Locale('zh-Hans-CN');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0100 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0100 ISO4217Code:', code);
      expect(code).assertEqual('CNY');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0200
     * @tc.number SUB_GLOBAL_getCurrency_test_0200
     * @tc.desc getCurrency with locale en-US, expect Currency with ISO4217 code USD
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0200', Level.LEVEL0, () => {
      let locale = new Intl.Locale('en-US');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0200 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0200 ISO4217Code:', code);
      expect(code).assertEqual('USD');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0300
     * @tc.number SUB_GLOBAL_getCurrency_test_0300
     * @tc.desc getCurrency with locale ja-JP, expect Currency with ISO4217 code JPY
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0300', Level.LEVEL0, () => {
      let locale = new Intl.Locale('ja-JP');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0300 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0300 ISO4217Code:', code);
      expect(code).assertEqual('JPY');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0400
     * @tc.number SUB_GLOBAL_getCurrency_test_0400
     * @tc.desc getCurrency with locale de-DE, expect Currency with ISO4217 code EUR
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0400', Level.LEVEL0, () => {
      let locale = new Intl.Locale('de-DE');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0400 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0400 ISO4217Code:', code);
      expect(code).assertEqual('EUR');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0500
     * @tc.number SUB_GLOBAL_getCurrency_test_0500
     * @tc.desc getCurrency with locale ru-RU, expect Currency with ISO4217 code RUB
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0500', Level.LEVEL0, () => {
      let locale = new Intl.Locale('ru-RU');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0500 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0500 ISO4217Code:', code);
      expect(code).assertEqual('RUB');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0600
     * @tc.number SUB_GLOBAL_getCurrency_test_0600
     * @tc.desc getCurrency with locale ar-AE, expect Currency with ISO4217 code AED
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL0
     */
    it('SUB_GLOBAL_getCurrency_test_0600', Level.LEVEL0, () => {
      let locale = new Intl.Locale('ar-AE');
      let currency = i18n.getCurrency(locale);
      console.log('SUB_GLOBAL_getCurrency_test_0600 currency:', JSON.stringify(currency));
      expect(currency !== null && currency !== undefined).assertTrue();
      let code = currency.getISO4217Code();
      console.log('SUB_GLOBAL_getCurrency_test_0600 ISO4217Code:', code);
      expect(code).assertEqual('AED');
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0700
     * @tc.number SUB_GLOBAL_getCurrency_test_0700
     * @tc.desc getCurrency with null locale, expect throw error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GLOBAL_getCurrency_test_0700', Level.LEVEL3, () => {
      try {
        let currency = i18n.getCurrency(null);
        console.log('SUB_GLOBAL_getCurrency_test_0700 currency:', JSON.stringify(currency));
        expect().assertFail();
      } catch (e) {
        console.log('SUB_GLOBAL_getCurrency_test_0700 catch error:', e.code, e.message);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name SUB_GLOBAL_getCurrency_test_0800
     * @tc.number SUB_GLOBAL_getCurrency_test_0800
     * @tc.desc getCurrency with undefined locale, expect throw error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('SUB_GLOBAL_getCurrency_test_0800', Level.LEVEL3, () => {
      try {
        let currency = i18n.getCurrency(undefined);
        console.log('SUB_GLOBAL_getCurrency_test_0800 currency:', JSON.stringify(currency));
        expect().assertFail();
      } catch (e) {
        console.log('SUB_GLOBAL_getCurrency_test_0800 catch error:', e.code, e.message);
        expect(e.code).assertEqual(401);
      }
    })

  })
}