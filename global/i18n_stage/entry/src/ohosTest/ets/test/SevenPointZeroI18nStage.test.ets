import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function SevenPointZeroI18nStageTest() {
  describe('SevenPointZeroI18nStageTest', () => {
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
     * @tc.name SUB_GLOBAL_detectEncoding_test_0100
     * @tc.number SUB_GLOBAL_detectEncoding_test_0100
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0100', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xE4,0xB8, 0xAD, 0xE5, 0x9B, 0xBD]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0100 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0100 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-8');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0200
     * @tc.number SUB_GLOBAL_detectEncoding_test_0200
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0200', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0x44,0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0200 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0200 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-1');
      expect(info.confidence).assertEqual(75);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0300
     * @tc.number SUB_GLOBAL_detectEncoding_test_0300
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0300', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xC2,0xC8]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0300 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0300 value:', info.confidence);
      expect(info.encodingName).assertEqual('GB18030');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0400
     * @tc.number SUB_GLOBAL_detectEncoding_test_0400
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0400', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xD6,0xD0, 0xCE, 0xC4]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0400 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0400 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-16BE');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0500
     * @tc.number SUB_GLOBAL_detectEncoding_test_0500
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0500', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0x00,0x00, 0x4E, 0x2D]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0500 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0500 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-32BE');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0600
     * @tc.number SUB_GLOBAL_detectEncoding_test_0600
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0600', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0600 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0600 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-7');
      expect(info.confidence).assertEqual(60);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0700
     * @tc.number SUB_GLOBAL_detectEncoding_test_0700
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0700', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xF0,0xF4, 0xF6]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0700 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0700 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0800
     * @tc.number SUB_GLOBAL_detectEncoding_test_0800
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0800', Level.LEVEL2, () => {
      let uint8Array1 = new Uint8Array([0x44,0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let uint8Array2 = new Uint8Array([0x44,0x65]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_test_0800 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_test_0800 value:', info2.confidence);
      expect(info1.confidence < info2.confidence).assertTrue();
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0900
     * @tc.number SUB_GLOBAL_detectEncoding_test_0900
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0900', Level.LEVEL2, () => {
      let uint8Array1 = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5]);
      let uint8Array2 = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5, 0x1111111111, 0x1111111111, 0x1111111111]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_test_0900 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_test_0900 value:', info2.confidence);
      expect(info1.confidence > info2.confidence).assertTrue();
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_1000
     * @tc.number SUB_GLOBAL_detectEncoding_test_1000
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_1000', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array();
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_1100
     * @tc.number SUB_GLOBAL_detectEncoding_test_1100
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_1100', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array(0x000000000);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_1100 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_1100 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0100
     * @tc.desc test SymbolDateTimeFormat with empty SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0100', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = {};
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_0100 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "AM,PM").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0200
     * @tc.desc test SymbolDateTimeFormat with undefined SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0200', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, undefined);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_0200 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "AM,PM").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0300
     * @tc.desc test SymbolDateTimeFormat with custom PM character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0300', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 14, 8);
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let dateFormat = symbolFormat.format(date);
        console.log('test_SymbolDateTimeFormat_0300 result:', dateFormat);
        expect(dateFormat).assertContain("test2");
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0400
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0400', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"], "timeStyle": "full" };
      let date: Date = new Date(2026, 2, 18, 10, 8);
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let dateFormat = symbolFormat.format(date);
        console.log('test_SymbolDateTimeFormat_0400 result:', dateFormat);
        expect(dateFormat).assertContain("test1");
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0400 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0500
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0500
     * @tc.desc test SymbolDateTimeFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0500', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": ["test1", "test2"] };
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_0500 result:', options.amPMSymbol);
        expect(options.amPMSymbol?.toString() == "test1,test2").assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0500 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0600
     * @tc.desc test SymbolDateTimeFormat with empty amPMSymbol param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0600', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": [] };
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_0600 result:');
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0600 catch error:', e.code + e.message);
        expect(Number(e.code) === 890001).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolDateTimeFormat_0700
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0700
     * @tc.desc test SymbolDateTimeFormat with undefined amPMSymbol param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0700', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "hourCycle": "h12" });
      let customSymbol: i18n.SymbolDateTimeFormatOptions = { "amPMSymbol": undefined };
      try {
        let symbolFormat = new i18n.SymbolDateTimeFormat(locale, customSymbol);
        symbolFormat.resolvedOptions();
        console.log('test_SymbolDateTimeFormat_0700 result:');
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_SymbolDateTimeFormat_0700 catch error:', e.code + e.message);
        expect(Number(e.code) === 401).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0800
     * @tc.desc test SymbolNumberFormat with empty SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0100', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = {};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0100 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_0900
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0200', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, undefined);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0200 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1000
     * @tc.desc test SymbolNumberFormat with custom 0 character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0300', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(12345.06);
        console.log('test_SymbolNumberFormat_0300 result:', numberFormat);
        expect(numberFormat === '12,345.B6').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1100
     * @tc.desc test SymbolNumberFormat with
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0400', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0400 result:', options.zero);
        expect(options.zero === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0400 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0500
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1200
     * @tc.desc test SymbolNumberFormat with empty SymbolNumberFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0500', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0500 result:', options.zero);
        expect(options.zero === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0500 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1300
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0600', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "zero": undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0600 result:', options.zero);
        expect(options.zero === '0').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0600 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0700
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1400
     * @tc.desc test SymbolNumberFormat with custom null character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0700', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(NaN);
        console.log('test_SymbolNumberFormat_0700 result:', numberFormat);
        expect(numberFormat === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0700 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0800
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1500
     * @tc.desc test SymbolNumberFormat with resolvedOptions function
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0800', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0800 result:', options.nan);
        expect(options.nan === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0800 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_0900
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1600
     * @tc.desc test SymbolNumberFormat with empty nan option
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0900', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_0900 result:', options.nan);
        expect(options.nan === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_0900 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1000
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1700
     * @tc.desc test SymbolNumberFormat with undefined nan option
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1000', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "nan": undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1000 result:', options.nan);
        expect(options.nan === 'NaN').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_1000 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1800
     * @tc.desc test SymbolNumberFormat with custom minusSign character
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1100', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(-12345.06);
        console.log('test_SymbolNumberFormat_1100 result:', numberFormat);
        expect(numberFormat === 'B12,345.06').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_1100 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_1900
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1200', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "B" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1200 result:', options.minusSign);
        expect(options.minusSign === 'B').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_1200 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2000
     * @tc.desc test SymbolNumberFormat with empty minusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1300', Level.LEVEL2, () => {
      let locale = new Intl.Locale("en-US", { "numberingSystem": "latn" });
      let customSymbol: i18n.SymbolNumberFormatOptions = { "minusSign": "" };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1300 result:', options.minusSign);
        expect(options.minusSign === '').assertTrue();
      } catch (e) {
        console.log('test_SymbolNumberFormat_1300 catch error:', e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2100
     * @tc.desc test SymbolNumberFormat with undefined minusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1400', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'minusSign': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1400 result:' + options.minusSign);
        expect(options.minusSign === '-').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1400 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1500
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2200
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1500', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B', signDisplay: 'always'};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(12345.06);
        console.log('test_SymbolNumberFormat_1500 result:' + numberFormat);
        expect(numberFormat === 'B12,345.06').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1500 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2300
     * @tc.desc test SymbolNumberFormat with resolveOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1600', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': 'B'};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1600 result:' + options.plusSign);
        expect(options.plusSign === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1600 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1700
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2400
     * @tc.desc test SymbolNumberFormat with empty plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1700', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': ""};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1700 result:' + options.plusSign);
        expect(options.plusSign === '').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1700 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1800
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2500
     * @tc.desc test SymbolNumberFormat with empty plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1800', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US', { 'numberingSystem': 'latn' });
      let customSymbol: i18n.SymbolNumberFormatOptions = {'plusSign': undefined};
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_1800 result:' + options.plusSign);
        expect(options.plusSign === '+').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1800 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_1900
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2600
     * @tc.desc test SymbolNumberFormat with custom infinity symbol
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1900', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': 'B' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(Infinity);
        console.log('test_SymbolNumberFormat_1900 result:' + numberFormat);
        expect(numberFormat === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_1900 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2000
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2700
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2000', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': 'B' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_2000 result:' + options.infinity);
        expect(options.infinity === 'B').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2000 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2100
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2800
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2100', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': '' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_2100 result:' + options.infinity);
        expect(options.infinity === '').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2100 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2200
     * @tc.number SUB_GLOBAL_I18N_customSymbol_2900
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2200', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'infinity': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_2200 result:' + options.infinity);
        expect(options.infinity === '∞').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2200 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2300
     * @tc.number SUB_GLOBAL_I18N_customSymbol_3000
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2300', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': '-' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let numberFormat = symbolFormat.format(123456);
        console.log('test_SymbolNumberFormat_2300 result:' + numberFormat);
        expect(numberFormat === '123-456').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2300 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2400
     * @tc.number SUB_GLOBAL_I18N_customSymbol_3100
     * @tc.desc test SymbolNumberFormat with groupingSeparator
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2400', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': '-' };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_2400 result:' + options.groupingSeparator);
        expect(options.groupingSeparator === '-').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2400 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name test_SymbolNumberFormat_2600
     * @tc.number SUB_GLOBAL_I18N_customSymbol_3200
     * @tc.desc test SymbolNumberFormat with empty groupingSeparator param
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2600', Level.LEVEL2, () => {
      let locale = new Intl.Locale('en-US');
      let customSymbol: i18n.SymbolNumberFormatOptions = { 'groupingSeparator': undefined };
      try {
        let symbolFormat = new i18n.SymbolNumberFormat(locale, customSymbol);
        let options = symbolFormat.resolvedOptions();
        console.log('test_SymbolNumberFormat_2600 result:' + options.groupingSeparator);
        expect(options.groupingSeparator === ',').assertTrue();
      }catch(e){
        console.log('test_SymbolNumberFormat_2600 catch error:' + e.code + e.message);
        expect(false).assertTrue();
      }
    })

  })
}