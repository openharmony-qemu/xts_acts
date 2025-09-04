import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function SixPointZeroI18nStageTest() {
  describe('SixPointZeroI18nStageTest', () => {
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

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0100
    * @tc.name      : testi18n_getMilliseconds_0100
    * @tc.desc      : getMilliseconds with Africa/Cairo
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testi18n_getMilliseconds_0100', Level.LEVEL0, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('Africa/Cairo');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 3, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: 'Africa/Cairo',
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('2025/4/25 GMT+3 01:00:00');
      expect(sj2).assertEqual(3);
      expect(sj3).assertEqual(2);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0200
    * @tc.name      : testi18n_getMilliseconds_0200
    * @tc.desc      : getMilliseconds with America/Tijuana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0200', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('America/Tijuana');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 4, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: 'America/Tijuana',
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('2025/11/2 GMT-8 01:00:00');
      expect(sj2).assertEqual(-8);
      expect(sj3).assertEqual(-7);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0300
    * @tc.name      : testi18n_getMilliseconds_0300
    * @tc.desc      : getMilliseconds with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0300', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 1, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let tmzid = timeZone.getID();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: tmzid,
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0400
    * @tc.name      : testi18n_getMilliseconds_0400
    * @tc.desc      : getMilliseconds with abcd
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0400', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone('abcd');
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let date = new Date(2025, 1, 13);
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition(date.getTime());
      let sj = zoneOffsetTransition.getMilliseconds();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter() / 3600000;
      let sj3 = zoneOffsetTransition.getOffsetBefore() / 3600000;
      let getid = timeZone.getID();
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
      expect(getid).assertEqual('Etc/Unknown');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDaylightSavingTime_0500
    * @tc.name      : testi18n_getMilliseconds_0500
    * @tc.desc      : nextTransition with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testi18n_getMilliseconds_0500', Level.LEVEL2, () => {
      let timeZone: i18n.TimeZone = i18n.getTimeZone();
      let zoneRules: i18n.ZoneRules = timeZone.getZoneRules();
      let zoneOffsetTransition: i18n.ZoneOffsetTransition = zoneRules.nextTransition();
      let sj = zoneOffsetTransition.getMilliseconds();
      let tmzid = timeZone.getID();
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh', {
        timeZone: tmzid,
        dateStyle: 'long',
        timeStyle: 'long',
        hour12: false
      });
      let dateFormat = dateTimeFormat.format(new Date(sj));
      let sj2 = zoneOffsetTransition.getOffsetAfter();
      let sj3 = zoneOffsetTransition.getOffsetBefore();
      expect(dateFormat).assertEqual('1970/1/1 GMT+8 08:00:00');
      expect(sj2).assertEqual(0);
      expect(sj3).assertEqual(0);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0100
    * @tc.name      : test_getUnicodeWrappedFilePath_0100
    * @tc.desc      : Locale with en
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getUnicodeWrappedFilePath_0100', Level.LEVEL0, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("en");
      let mirrorpath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      expect(mirrorpath).assertEqual('/data/out/tmp')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0200
    * @tc.name      : test_getUnicodeWrappedFilePath_0200
    * @tc.desc      : Locale with zh
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getUnicodeWrappedFilePath_0200', Level.LEVEL2, () => {
      let path: string = '/data/out/tmp';
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("zh");
      let mirrorpath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      expect(mirrorpath).assertEqual('/data/out/tmp')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetUnicodeWrappedFilePath_0400
    * @tc.name      : test_getUnicodeWrappedFilePath_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getUnicodeWrappedFilePath_0400', Level.LEVEL2, () => {
      let delimiter: string = '/';
      let locale: Intl.Locale = new Intl.Locale("zh");
      try {
        i18n.I18NUtil.getUnicodeWrappedFilePath('error', delimiter, locale);
      } catch (e) {
        console.log('test_getUnicodeWrappedFilePath_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0100
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleDateTimeFormatByPattern_0100', Level.LEVEL0, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('ar');
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'month('M')'", locale);
      let formatteDate: string = formatter.format(date);
      expect(formatteDate).assertEqual('month(١٢)')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0200
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatByPattern_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'month('M')'", locale);
      let formatteDate: string = formatter.format(date);
      expect(formatteDate).assertEqual('month(12)')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatByPattern_0400
    * @tc.name      : test_getSimpleDateTimeFormatByPattern_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatByPattern_0400', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      try {
        i18n.getSimpleDateTimeFormatByPattern("error", locale);
      } catch (e) {
        console.log('test_getSimpleDateTimeFormatByPattern_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0100
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0100', Level.LEVEL0, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('ar');
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMd", locale);
      let formatteDate: string = skeletonFormatter.format(date);
      expect(formatteDate).assertEqual('١٣‏/١٢‏/٢٠٢٤')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0200
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0200', Level.LEVEL2, () => {
      let date: Date = new Date(2024, 11, 13);
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let skeletonFormatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton("yMd", locale);
      let formatteDate: string = skeletonFormatter.format(date);
      expect(formatteDate).assertEqual('2024/12/13')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleDateTimeFormatBySkeleton_0400
    * @tc.name      : test_getSimpleDateTimeFormatBySkeleton_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleDateTimeFormatBySkeleton_0400', Level.LEVEL2, () => {
      try {
        let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
        i18n.getSimpleDateTimeFormatBySkeleton("error", locale);
      } catch (e) {
        console.log('test_getSimpleDateTimeFormatBySkeleton_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0100
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0100
    * @tc.desc      : Locale with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_getSimpleNumberFormatBySkeleton_0100', Level.LEVEL0, () => {
      let locale: Intl.Locale = new Intl.Locale('ar');
      let formatter: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%", locale);
      let formattedNumber: string = formatter.format(10);
      expect(formattedNumber).assertEqual('١٠٪؜‏')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0200
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0200
    * @tc.desc      : Locale with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleNumberFormatBySkeleton_0200', Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let formatter: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("%", locale);
      let formattedNumber: string = formatter.format(10);
      expect(formattedNumber).assertEqual('10%')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testgetSimpleNumberFormatBySkeleton_0400
    * @tc.name      : test_getSimpleNumberFormatBySkeleton_0400
    * @tc.desc      : Locale with error
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_getSimpleNumberFormatBySkeleton_0400', Level.LEVEL2, () => {
      try {
        let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
        i18n.getSimpleNumberFormatBySkeleton("%", locale);
      } catch (e) {
        console.log('test_getSimpleNumberFormatBySkeleton_0400 error code:' + e.code);
        expect(e.code).assertEqual('890001')
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_I18N_getSystemLocaleInstance_0100
    * @tc.name      : testGetSystemLocaleInstance_0100
    * @tc.desc      : obtain the locale of current system
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testGetSystemLocaleInstance_0100', Level.LEVEL2, () => {
      let value = i18n.System.getSystemLocaleInstance();
      console.log('testGetSystemLocaleInstance_0100' + value.toString());
      expect(value.toString() == null).assertFalse();
      expect(value.baseName == null).assertFalse();
      expect(value.language == null).assertFalse();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0100
    * @tc.desc      : DisplayNames  with th & standard & th-TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_0100', Level.LEVEL1, () => {
      const dnDialect = new Intl.DisplayNames('th', { type: 'language', languageDisplay: 'standard' });
      let dn = dnDialect.of('th-TH');
      expect(dn).assertEqual('th-TH');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0200
    * @tc.desc      : DisplayNames  with th & dialect & th-TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_0200', Level.LEVEL1, () => {
      const dnDialect = new Intl.DisplayNames('th', { type: 'language', languageDisplay: 'dialect' });
      let dn = dnDialect.of('th-TH');
      expect(dn).assertEqual('th-TH');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0300
    * @tc.desc      : DisplayNames  with ar & standard & ar-EG
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0300', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('ar', { type: 'language', languageDisplay: 'standard' });
      let dn = dnDialect.of('ar-EG');
      expect(dn).assertEqual('ar-EG')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0400
    * @tc.desc      : DisplayNames  with ar & dialect & ar-EG
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0400', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('ar', { type: 'language', languageDisplay: 'dialect' });
      let dn = dnDialect.of('ar-EG');
      expect(dn).assertEqual('ar-EG');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0500
    * @tc.desc      : DisplayNames  with zh & standard & zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0500', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('zh', { type: 'language', languageDisplay: 'standard' });
      let dn = dnDialect.of('zh-Hans-CN');
      expect(dn).assertEqual('zh-Hans-CN')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0600
    * @tc.desc      : DisplayNames  with zh & dialect & zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0600', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('zh', { type: 'language', languageDisplay: 'dialect' });
      let dn = dnDialect.of('zh-Hans-CN');
      expect(dn).assertEqual('zh-Hans-CN');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0700
    * @tc.desc      : DisplayNames  with en & standard & en-GB
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0700', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('en', { type: 'language', languageDisplay: 'standard' });
      let dn = dnDialect.of('en-GB');
      expect(dn).assertEqual('British English')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0800
    * @tc.desc      : DisplayNames  with en & dialect & en-GB
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0800', Level.LEVEL2, () => {
      const dnDialect = new Intl.DisplayNames('en', { type: 'language', languageDisplay: 'dialect' });
      let dn = dnDialect.of('en-GB');
      expect(dn).assertEqual('British English');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_0900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_0900
    * @tc.desc      : DisplayNames  with th & region & CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_0900', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('CN');
      expect(dn).assertEqual('จีน');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1000
    * @tc.desc      : DisplayNames  with th & region & TW
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1000', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('TW');
      expect(dn).assertEqual('ไต้หวัน (จีน)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1100
    * @tc.desc      : DisplayNames  with th & region & SA
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1100', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('SA');
      expect(dn).assertEqual('ซาอุดีอาระเบีย');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1200
    * @tc.desc      : DisplayNames  with th & region & MM
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1200', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('MM');
      expect(dn).assertEqual('เมียนมา (พม่า)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1300
    * @tc.desc      : DisplayNames  with th & region & TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1300', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('TH');
      expect(dn).assertEqual('ไทย');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1400
    * @tc.desc      : DisplayNames  with th & region & US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1400', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('US');
      expect(dn).assertEqual('สหรัฐอเมริกา');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1500
    * @tc.desc      : DisplayNames  with th & region & JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1500', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['th'], { type: 'region' });
      let dn = regionNames.of('JP');
      expect(dn).assertEqual('ญี่ปุ่น');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1600
    * @tc.desc      : DisplayNames  with my & region & CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1600', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('CN');
      expect(dn).assertEqual('တရုတ်');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1700
    * @tc.desc      : DisplayNames  with my & region & TW
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1700', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('TW');
      expect(dn).assertEqual('ထိုင်ဝမ် (တရုတ်)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1800
    * @tc.desc      : DisplayNames  with my & region & SA
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1800', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('SA');
      expect(dn).assertEqual('ဆော်ဒီအာရေးဘီးယား');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_1900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_1900
    * @tc.desc      : DisplayNames  with my & region & MM
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_1900', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('MM');
      expect(dn).assertEqual('မြန်မာ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2000
    * @tc.desc      : DisplayNames  with my & region & TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2000', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('TH');
      expect(dn).assertEqual('ထိုင်း');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2100
    * @tc.desc      : DisplayNames  with my & region & US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2100', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('US');
      expect(dn).assertEqual('အမေရိကန် ပြည်ထောင်စု');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2200
    * @tc.desc      : DisplayNames  with my & region & JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2200', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['my'], { type: 'region' });
      let dn = regionNames.of('JP');
      expect(dn).assertEqual('ဂျပန်');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2300
    * @tc.desc      : DisplayNames  with ar & region & CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2300', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('CN');
      expect(dn).assertEqual('الصين');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2400
    * @tc.desc      : DisplayNames  with ar & region & TW
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2400', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('TW');
      expect(dn).assertEqual('تايوان (الصين)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2500
    * @tc.desc      : DisplayNames  with ar & region & SA
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2500', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('SA');
      expect(dn).assertEqual('المملكة العربية السعودية');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2600
    * @tc.desc      : DisplayNames  with ar & region & MM
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2600', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('MM');
      expect(dn).assertEqual('ميانمار (بورما)');
    })


    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2700
    * @tc.desc      : DisplayNames  with ar & region & TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2700', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('TH');
      expect(dn).assertEqual('تايلاند');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2800
    * @tc.desc      : DisplayNames  with ar & region & US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2800', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('US');
      expect(dn).assertEqual('الولايات المتحدة');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_2900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_2900
    * @tc.desc      : DisplayNames  with ar & region & JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_2900', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['ar'], { type: 'region' });
      let dn = regionNames.of('JP');
      expect(dn).assertEqual('اليابان');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3000
    * @tc.desc      : DisplayNames  with zh & region & CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3000', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('CN');
      expect(dn).assertEqual('中国');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3100
    * @tc.desc      : DisplayNames  with zh & region & TW
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3100', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('TW');
      expect(dn).assertEqual('中国台湾');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3200
    * @tc.desc      : DisplayNames  with zh & region & SA
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3200', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('SA');
      expect(dn).assertEqual('沙特阿拉伯');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3300
    * @tc.desc      : DisplayNames  with zh & region & MM
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3300', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('MM');
      expect(dn).assertEqual('缅甸');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3400
    * @tc.desc      : DisplayNames  with zh & region & TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3400', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('TH');
      expect(dn).assertEqual('泰国');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3500
    * @tc.desc      : DisplayNames  with zh & region & US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3500', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('US');
      expect(dn).assertEqual('美国');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3600
    * @tc.desc      : DisplayNames  with zh & region & JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3600', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['zh'], { type: 'region' });
      let dn = regionNames.of('JP');
      expect(dn).assertEqual('日本');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3700
    * @tc.desc      : DisplayNames  with en & region & CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3700', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('CN');
      expect(dn).assertEqual('China');
    })


    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3800
    * @tc.desc      : DisplayNames  with en & region & TW
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3800', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('TW');
      expect(dn).assertEqual('Taiwan (China)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_3900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_3900
    * @tc.desc      : DisplayNames  with en & region & SA
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_3900', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('SA');
      expect(dn).assertEqual('Saudi Arabia');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4000
    * @tc.desc      : DisplayNames  with en & region & MM
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4000', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('MM');
      expect(dn).assertEqual('Myanmar (Burma)');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4100
    * @tc.desc      : DisplayNames  with en & region & TH
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4100', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('TH');
      expect(dn).assertEqual('Thailand');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4200
    * @tc.desc      : DisplayNames  with en & region & US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4200', Level.LEVEL2, () => {
      const regionNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = regionNames.of('US');
      expect(dn).assertEqual('United States');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4300
    * @tc.desc      : DisplayNames  with en & region & JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4300', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['en'], { type: 'region' });
      let dn = scriptNames.of('JP');
      expect(dn).assertEqual('Japan');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4400
    * @tc.desc      : DisplayNames  with th & script & Latn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4400', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['th'], { type: 'script' });
      let dn = scriptNames.of('Latn');
      expect(dn).assertEqual('ละติน');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4500
    * @tc.desc      : DisplayNames  with th & script & Arab
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4500', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['th'], { type: 'script' });
      let dn = scriptNames.of('Arab');
      expect(dn).assertEqual('อาหรับ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4600
    * @tc.desc      : DisplayNames  with th & script & Kana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4600', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['th'], { type: 'script' });
      let dn = scriptNames.of('Kana');
      expect(dn).assertEqual('คะตะกะนะ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4700
    * @tc.desc      : DisplayNames  with my & script & Latn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4700', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['my'], { type: 'script' });
      let dn = scriptNames.of('Latn');
      expect(dn).assertEqual('လက်တင်');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4800
    * @tc.desc      : DisplayNames  with my & script & Kana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4800', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['my'], { type: 'script' });
      let dn = scriptNames.of('Kana');
      expect(dn).assertEqual('ခတခန');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_4900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_4900
    * @tc.desc      : DisplayNames  with my & script & Arab
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_4900', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['my'], { type: 'script' });
      let dn = scriptNames.of('Arab');
      expect(dn).assertEqual('အာရေဗျ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5000
    * @tc.desc      : DisplayNames  with ar & script & Latn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5000', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['ar'], { type: 'script' });
      let dn = scriptNames.of('Latn');
      expect(dn).assertEqual('اللاتينية');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5100
    * @tc.desc      : DisplayNames  with ar & script & Kana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5100', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['ar'], { type: 'script' });
      let dn = scriptNames.of('Kana');
      expect(dn).assertEqual('الكتكانا');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5200
    * @tc.desc      : DisplayNames  with ar & script & Arab
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5200', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['ar'], { type: 'script' });
      let dn = scriptNames.of('Arab');
      expect(dn).assertEqual('العربية');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5300
    * @tc.desc      : DisplayNames  with zh & script & Latn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5300', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['zh'], { type: 'script' });
      let dn = scriptNames.of('Latn');
      expect(dn).assertEqual('拉丁文');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5400
    * @tc.desc      : DisplayNames  with zh & script & Kana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5400', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['zh'], { type: 'script' });
      let dn = scriptNames.of('Kana');
      expect(dn).assertEqual('片假名');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5500
    * @tc.desc      : DisplayNames  with zh & script & Arab
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5500', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['zh'], { type: 'script' });
      let dn = scriptNames.of('Arab');
      expect(dn).assertEqual('阿拉伯文');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5600
    * @tc.desc      : DisplayNames  with en & script & Latn
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5600', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['en'], { type: 'script' });
      let dn = scriptNames.of('Latn');
      expect(dn).assertEqual('Latin');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5700
    * @tc.desc      : DisplayNames  with en & script & Kana
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5700', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['en'], { type: 'script' });
      let dn = scriptNames.of('Kana');
      expect(dn).assertEqual('Katakana');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5800
    * @tc.desc      : DisplayNames  with en & script & Arab
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5800', Level.LEVEL2, () => {
      const scriptNames = new Intl.DisplayNames(['en'], { type: 'script' });
      let dn = scriptNames.of('Arab');
      expect(dn).assertEqual('Arabic');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_5900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_5900
    * @tc.desc      : DisplayNames  with th & currency & USD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_5900', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['th'], { type: 'currency' });
      let dn = currencyNames.of('USD');
      expect(dn).assertEqual('ดอลลาร์สหรัฐ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6000
    * @tc.desc      : DisplayNames  with th & currency & EUR
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6000', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['th'], { type: 'currency' });
      let dn = currencyNames.of('EUR');
      expect(dn).assertEqual('ยูโร');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6100
    * @tc.desc      : DisplayNames  with th & currency & CNY
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6100', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['th'], { type: 'currency' });
      let dn = currencyNames.of('CNY');
      expect(dn).assertEqual('หยวนจีน');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6200
    * @tc.desc      : DisplayNames  with th & currency & TWD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6200', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['th'], { type: 'currency' });
      let dn = currencyNames.of('TWD');
      expect(dn).assertEqual('ดอลลาร์ไต้หวันใหม่');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6300
    * @tc.desc      : DisplayNames  with my & currency & USD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6300', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['my'], { type: 'currency' });
      let dn = currencyNames.of('USD');
      expect(dn).assertEqual('အမေရိကန် ဒေါ်လာ');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6400
    * @tc.desc      : DisplayNames  with my & currency & EUR
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6400', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['my'], { type: 'currency' });
      let dn = currencyNames.of('EUR');
      expect(dn).assertEqual('ယူရို');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6500
    * @tc.desc      : DisplayNames  with my & currency & CNY
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6500', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['my'], { type: 'currency' });
      let dn = currencyNames.of('CNY');
      expect(dn).assertEqual('တရုတ် ယွမ်');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6600
    * @tc.desc      : DisplayNames  with my & currency & TWD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6600', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['my'], { type: 'currency' });
      let dn = currencyNames.of('TWD');
      expect(dn).assertEqual('ထိုင်ဝမ် ဒေါ်လာအသစ်');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6700
    * @tc.desc      : DisplayNames  with ar & currency & USD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6700', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['ar'], { type: 'currency' });
      let dn = currencyNames.of('USD');
      expect(dn).assertEqual('دولار أمريكي');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6800
    * @tc.desc      : DisplayNames  with ar & currency & EUR
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6800', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['ar'], { type: 'currency' });
      let dn = currencyNames.of('EUR');
      expect(dn).assertEqual('يورو');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_6900
    * @tc.name      : SUB_GLOBAL_testDisplayNames_6900
    * @tc.desc      : DisplayNames  with ar & currency & CNY
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_6900', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['ar'], { type: 'currency' });
      let dn = currencyNames.of('CNY');
      expect(dn).assertEqual('يوان صيني');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7000
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7000
    * @tc.desc      : DisplayNames  with ar & currency & TWD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_7000', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['ar'], { type: 'currency' });
      let dn = currencyNames.of('TWD');
      expect(dn).assertEqual('دولار تايواني');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7100
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7100
    * @tc.desc      : DisplayNames  with zh & currency & USD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_7100', Level.LEVEL1, () => {
      const currencyNames = new Intl.DisplayNames(['zh'], { type: 'currency' });
      let dn = currencyNames.of('USD');
      expect(dn).assertEqual('美元');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7200
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7200
    * @tc.desc      : DisplayNames  with zh & currency & EUR
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_7200', Level.LEVEL1, () => {
      const currencyNames = new Intl.DisplayNames(['zh'], { type: 'currency' });
      let dn = currencyNames.of('EUR');
      expect(dn).assertEqual('欧元');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7300
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7300
    * @tc.desc      : DisplayNames  with zh & currency & CNY
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_7300', Level.LEVEL1, () => {
      const currencyNames = new Intl.DisplayNames(['zh'], { type: 'currency' });
      let dn = currencyNames.of('CNY');
      expect(dn).assertEqual('人民币');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7400
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7400
    * @tc.desc      : DisplayNames  with zh & currency & TWD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it(' SUB_GLOBAL_testDisplayNames_7400', Level.LEVEL1, () => {
      const currencyNames = new Intl.DisplayNames(['zh'], { type: 'currency' });
      let dn = currencyNames.of('TWD');
      expect(dn).assertEqual('新台币');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7500
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7500
    * @tc.desc      : DisplayNames  with en & currency & USD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_7500', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['en'], { type: 'currency' });
      let dn = currencyNames.of('USD');
      expect(dn).assertEqual('US Dollar');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7600
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7600
    * @tc.desc      : DisplayNames  with en & currency & EUR
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_7600', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['en'], { type: 'currency' });
      let dn = currencyNames.of('EUR');
      expect(dn).assertEqual('Euro');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7700
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7700
    * @tc.desc      : DisplayNames  with en & currency & CNY
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_7700', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['en'], { type: 'currency' });
      let dn = currencyNames.of('CNY');
      expect(dn).assertEqual('Chinese Yuan');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7800
    * @tc.name      : SUB_GLOBAL_testDisplayNames_7800
    * @tc.desc      : DisplayNames  with en & currency & TWD
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it(' SUB_GLOBAL_testDisplayNames_7800', Level.LEVEL2, () => {
      const currencyNames = new Intl.DisplayNames(['en'], { type: 'currency' });
      let dn = currencyNames.of('TWD');
      expect(dn).assertEqual('New Taiwan Dollar');
    })


    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_7900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_7900
     * @tc.desc      : DisplayNames  with th & roc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_7900', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["th"], {
        type: "calendar"
      });
      let calendar = dn.of("roc");
      expect(calendar).assertEqual("ปฏิทินไต้หวัน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8000
     * @tc.desc      : DisplayNames  with th & gregory
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8000', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["th"], {
        type: "calendar"
      });
      let calendar = dn.of("gregory");
      expect(calendar).assertEqual("ปฏิทินเกรกอเรียน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8100
     * @tc.desc      : DisplayNames  with th & chinese
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8100', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["th"], {
        type: "calendar"
      });
      let calendar = dn.of("chinese");
      expect(calendar).assertEqual("ปฏิทินจีน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8200
     * @tc.desc      : DisplayNames  with ar & roc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8200', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["ar"], {
        type: "calendar"
      });
      let calendar = dn.of("roc");
      expect(calendar).assertEqual("تقويم مينجو")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8300
     * @tc.desc      : DisplayNames  with ar & gregory
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8300', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["ar"], {
        type: "calendar"
      });
      let calendar = dn.of("gregory");
      expect(calendar).assertEqual("التقويم الميلادي")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8400
     * @tc.desc      : DisplayNames  with ar & chinese
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8400', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["ar"], {
        type: "calendar"
      });
      let calendar = dn.of("chinese");
      expect(calendar).assertEqual("التقويم الصيني")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8500
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8500
     * @tc.desc      : DisplayNames  with zh & roc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_8500', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames(["zh"], {
        type: "calendar"
      });
      let calendar = dn.of("roc");
      expect(calendar).assertEqual("民国纪年")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8600
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8600
     * @tc.desc      : DisplayNames  with zh & gregory
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_8600', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames(["zh"], {
        type: "calendar"
      });
      let calendar = dn.of("gregory");
      expect(calendar).assertEqual("公历")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8700
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8700
     * @tc.desc      : DisplayNames  with zh & chinese
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_8700', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames(["zh"], {
        type: "calendar"
      });
      let calendar = dn.of("chinese");
      expect(calendar).assertEqual("农历")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8800
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8800
     * @tc.desc      : DisplayNames  with en & roc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8800', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["en"], {
        type: "calendar"
      });
      let calendar = dn.of("roc");
      expect(calendar).assertEqual("Minguo Calendar")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_8900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_8900
     * @tc.desc      : DisplayNames  with en & gregory
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_8900', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["en"], {
        type: "calendar"
      });
      let calendar = dn.of("gregory");
      expect(calendar).assertEqual("Gregorian Calendar")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9000
     * @tc.desc      : DisplayNames  with en & chinese
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9000', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames(["en"], {
        type: "calendar"
      });
      let calendar = dn.of("chinese");
      expect(calendar).assertEqual("Chinese Calendar")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9100
     * @tc.desc      : DisplayNames  with th & era
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9100', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("era");
      expect(dateTimeField).assertEqual("สมัย")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9200
     * @tc.desc      : DisplayNames  with th & year
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9200', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("year");
      expect(dateTimeField).assertEqual("ปี")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9300
     * @tc.desc      : DisplayNames  with th & month
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9300', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("month");
      expect(dateTimeField).assertEqual("เดือน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9400
     * @tc.desc      : DisplayNames  with th & day
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9400', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("day");
      expect(dateTimeField).assertEqual("วัน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9500
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9500
     * @tc.desc      : DisplayNames  with th & second
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9500', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("second");
      expect(dateTimeField).assertEqual("วินาที")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9600
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9600
     * @tc.desc      : DisplayNames  with th & quarter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9600', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("quarter");
      expect(dateTimeField).assertEqual("ไตรมาส")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9700
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9700
     * @tc.desc      : DisplayNames  with th & weekOfYear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9700', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekOfYear");
      expect(dateTimeField).assertEqual("สัปดาห์")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9800
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9800
     * @tc.desc      : DisplayNames  with th & weekday
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9800', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekday");
      expect(dateTimeField).assertEqual("วันของสัปดาห์")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_9900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_9900
     * @tc.desc      : DisplayNames  with th & hour
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_9900', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("hour");
      expect(dateTimeField).assertEqual("ชั่วโมง")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10000
     * @tc.desc      : DisplayNames  with th & minute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10000', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("minute");
      expect(dateTimeField).assertEqual("นาที")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10100
     * @tc.desc      : DisplayNames  with th & dayPeriod
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10100', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("th", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("dayPeriod");
      expect(dateTimeField).assertEqual("ช่วงวัน")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10200
     * @tc.desc      : DisplayNames  with ar & era
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10200', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("era");
      expect(dateTimeField).assertEqual("العصر")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10300
     * @tc.desc      : DisplayNames  with ar & year
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10300', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("year");
      expect(dateTimeField).assertEqual("السنة")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10400
     * @tc.desc      : DisplayNames  with ar & month
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10400', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("month");
      expect(dateTimeField).assertEqual("الشهر")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10500
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10500
     * @tc.desc      : DisplayNames  with ar & day
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10500', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("day");
      expect(dateTimeField).assertEqual("يوم")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10600
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10600
     * @tc.desc      : DisplayNames  with ar & second
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10600', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("second");
      expect(dateTimeField).assertEqual("الثواني")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10700
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10700
     * @tc.desc      : DisplayNames  with ar & quarter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10700', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("quarter");
      expect(dateTimeField).assertEqual("ربع السنة")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10800
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10800
     * @tc.desc      : DisplayNames  with ar & weekOfYear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10800', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekOfYear");
      expect(dateTimeField).assertEqual("الأسبوع")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_10900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_10900
     * @tc.desc      : DisplayNames  with ar & weekday
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_10900', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekday");
      expect(dateTimeField).assertEqual("اليوم")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11000
     * @tc.desc      : DisplayNames  with ar & hour
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_11000', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("hour");
      expect(dateTimeField).assertEqual("الساعات")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11100
     * @tc.desc      : DisplayNames  with ar & minute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_11100', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("minute");
      expect(dateTimeField).assertEqual("الدقائق")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11200
     * @tc.desc      : DisplayNames  with ar & dayPeriod
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_11200', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("ar", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("dayPeriod");
      expect(dateTimeField).assertEqual("ص/م")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11300
     * @tc.desc      : DisplayNames  with zh & era
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_11300', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("era");
      expect(dateTimeField).assertEqual("纪元")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11400
     * @tc.desc      : DisplayNames  with zh & year
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_11400', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("year");
      expect(dateTimeField).assertEqual("年")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11500
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11500
     * @tc.desc      : DisplayNames  with zh & month
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_testDisplayNames_11500', Level.LEVEL0, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("month");
      expect(dateTimeField).assertEqual("月")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11600
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11600
     * @tc.desc      : DisplayNames  with zh & day
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_11600', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("day");
      expect(dateTimeField).assertEqual("日")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11700
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11700
     * @tc.desc      : DisplayNames  with zh & second
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_11700', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("second");
      expect(dateTimeField).assertEqual("秒")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11800
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11800
     * @tc.desc      : DisplayNames  with zh & quarter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_11800', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("quarter");
      expect(dateTimeField).assertEqual("季度")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_11900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_11900
     * @tc.desc      : DisplayNames  with zh & weekOfYear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_11900', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekOfYear");
      expect(dateTimeField).assertEqual("周")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12000
     * @tc.desc      : DisplayNames  with zh & weekday
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_12000', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekday");
      expect(dateTimeField).assertEqual("工作日")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12100
     * @tc.desc      : DisplayNames  with zh & hour
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_12100', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("hour");
      expect(dateTimeField).assertEqual("小时")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12200
     * @tc.desc      : DisplayNames  with zh & hour
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_12200', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("minute");
      expect(dateTimeField).assertEqual("分钟")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12300
     * @tc.desc      : DisplayNames  with zh & dayPeriod
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_GLOBAL_testDisplayNames_12300', Level.LEVEL1, () => {
      const dn = new Intl.DisplayNames("zh", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("dayPeriod");
      expect(dateTimeField).assertEqual("上午/下午")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12400
     * @tc.desc      : DisplayNames  with en & era
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12400', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("era");
      expect(dateTimeField).assertEqual("era")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12500
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12500
     * @tc.desc      : DisplayNames  with en & year
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12500', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("year");
      expect(dateTimeField).assertEqual("year")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12600
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12600
     * @tc.desc      : DisplayNames  with en & month
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12600', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("month");
      expect(dateTimeField).assertEqual("month")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12700
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12700
     * @tc.desc      : DisplayNames  with en & day
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12700', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("day");
      expect(dateTimeField).assertEqual("day")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12800
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12800
     * @tc.desc      : DisplayNames  with en & second
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12800', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("second");
      expect(dateTimeField).assertEqual("second")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_12900
     * @tc.name      : SUB_GLOBAL_testDisplayNames_12900
     * @tc.desc      : DisplayNames  with en & quarter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_12900', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("quarter");
      expect(dateTimeField).assertEqual("quarter")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_13000
     * @tc.name      : SUB_GLOBAL_testDisplayNames_13000
     * @tc.desc      : DisplayNames  with en & weekOfYear
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_13000', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekOfYear");
      expect(dateTimeField).assertEqual("week")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_13100
     * @tc.name      : SUB_GLOBAL_testDisplayNames_13100
     * @tc.desc      : DisplayNames  with en & weekday
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_13100', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("weekday");
      expect(dateTimeField).assertEqual("day of the week")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_13200
     * @tc.name      : SUB_GLOBAL_testDisplayNames_13200
     * @tc.desc      : DisplayNames  with en & hour
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_13200', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("hour");
      expect(dateTimeField).assertEqual("hour")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_13300
     * @tc.name      : SUB_GLOBAL_testDisplayNames_13300
     * @tc.desc      : DisplayNames  with en & minute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_13300', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("minute");
      expect(dateTimeField).assertEqual("minute")
    })

    /* *
     * @tc.number    : SUB_GLOBAL_Intl_testDisplayNames_13400
     * @tc.name      : SUB_GLOBAL_testDisplayNames_13400
     * @tc.desc      : DisplayNames  with en & dayPeriod
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_testDisplayNames_13400', Level.LEVEL2, () => {
      const dn = new Intl.DisplayNames("en", {
        type: "dateTimeField"
      });
      let dateTimeField = dn.of("dayPeriod");
      expect(dateTimeField).assertEqual("AM/PM")
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0100
    * @tc.name      : test_NumberFormatRange_0100
    * @tc.desc      : formatRange  with zh & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_NumberFormatRange_0100', Level.LEVEL0, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('zh', { style: 'unit', unit: 'kilometer-per-hour' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3 km/h');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0200
    * @tc.name      : test_NumberFormatRange_0200
    * @tc.desc      : formatRange  with th & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0200', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('th', { style: 'unit', unit: 'kilometer-per-hour' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3 กม./ชม.');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0300
    * @tc.name      : test_NumberFormatRange_0300
    * @tc.desc      : formatRange  with ja & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0300', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('ja', { style: 'unit', unit: 'kilometer-per-hour' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0～3 km/h');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0400
    * @tc.name      : test_NumberFormatRange_0400
    * @tc.desc      : formatRange  with ar & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0400', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('ar', { style: 'unit', unit: 'kilometer-per-hour' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('٠–٣ كم/س');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0500
    * @tc.name      : test_NumberFormatRange_0500
    * @tc.desc      : formatRange  with zh & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0500', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('zh', { style: 'unit', unit: 'liter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3升');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0600
    * @tc.name      : test_NumberFormatRange_0600
    * @tc.desc      : formatRange  with th & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0600', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('th', { style: 'unit', unit: 'liter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3 ล.');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0700
    * @tc.name      : test_NumberFormatRange_0700
    * @tc.desc      : formatRange  with en & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0700', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('en', { style: 'unit', unit: 'liter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0–3 L');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0800
    * @tc.name      : test_NumberFormatRange_0800
    * @tc.desc      : formatRange  with ja & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0800', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('ja', { style: 'unit', unit: 'liter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0～3 L');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_0900
    * @tc.name      : test_NumberFormatRange_0900
    * @tc.desc      : formatRange  with ar & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_0900', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('ar', { style: 'unit', unit: 'liter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('٠–٣ لتر');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_1000
    * @tc.name      : test_NumberFormatRange_1000
    * @tc.desc      : formatRange  with zh & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1000', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('zh', { style: 'unit', unit: 'meter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3米');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_1100
    * @tc.name      : test_NumberFormatRange_1100
    * @tc.desc      : formatRange  with th & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1100', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('th', { style: 'unit', unit: 'meter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3 ม.');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_1200
    * @tc.name      : test_NumberFormatRange_1200
    * @tc.desc      : formatRange  with ja & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1200', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('en', { style: 'unit', unit: 'meter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0–3 m');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_1300
    * @tc.name      : test_NumberFormatRange_1300
    * @tc.desc      : formatRange  with ja & 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1300', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat =
        new Intl.NumberFormat('ja', { style: 'unit', unit: 'meter' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0～3 m');
    })


    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1400
    * @tc.name      : test_NumberFormatRange_1400
    * @tc.desc      : formatRange  with 0,3 & ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1400', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('ar', {
        style: 'unit', unit: 'meter', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('٠–٣ أمتار');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1500
    * @tc.name      : test_NumberFormatRange_1500
    * @tc.desc      : formatRange  with 3500,9500 & zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1500', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('zh-CN', {
        style: 'currency', currency: 'CNY', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(3500, 9500);
      expect(formattedRange).assertEqual('¥3,500.00 - ¥9,500.00');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1600
    * @tc.name      : test_NumberFormatRange_1600
    * @tc.desc      : formatRange  with 3500,9500 & de-DE
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1600', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('de-DE', {
        style: 'currency', currency: 'EUR', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(3500, 9500);
      expect(formattedRange).assertEqual('3.500,00–9.500,00 €');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1700
    * @tc.name      : test_NumberFormatRange_1700
    * @tc.desc      : formatRange  with 3500,9500 & en
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1700', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('en', {
        style: 'currency', currency: 'USD', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(3500, 9500);
      expect(formattedRange).assertEqual('$3,500.00 – $9,500.00');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1800
    * @tc.name      : test_NumberFormatRange_1800
    * @tc.desc      : formatRange  with 3500,9500 & ja-JP
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1800', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('ja-JP', {
        style: 'currency', currency: 'JPY', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(3500, 9500);
      expect(formattedRange).assertEqual('￥3,500 ～ ￥9,500');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_1900
    * @tc.name      : test_NumberFormatRange_1900
    * @tc.desc      : formatRange  with 0,3 & ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_1900', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('ar', {
        style: 'currency', currency: 'USD', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('‏٠٫٠٠–٣٫٠٠ US$');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_2000
    * @tc.name      : test_NumberFormatRange_2000
    * @tc.desc      : formatRange  with 0,3 & zh
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_2000', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('zh', {
        style: 'percent', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0% - 300%');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_2100
    * @tc.name      : test_NumberFormatRange_2100
    * @tc.desc      : formatRange  with 0,3 & ja
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_2100', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('ja', {
        style: 'percent', unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0% ～ 300%');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_2200
    * @tc.name      : test_NumberFormatRange_2200
    * @tc.desc      : formatRange  with 0,3 & ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_2200', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('ar', { style: 'percent' });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('٠–٣٠٠٪؜‏');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementNumberFormat_2300
    * @tc.name      : test_NumberFormatRange_2300
    * @tc.desc      : formatRange  with 0,3 & zh
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRange_2300', Level.LEVEL2, () => {
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat('zh', {
        unitDisplay: "short"
      });
      let formattedRange: string = numFmt.formatRange(0, 3);
      expect(formattedRange).assertEqual('0-3');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_2500
    * @tc.name      : test_NumberFormatRangeToParts_0100
    * @tc.desc      : formatRange  with 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_NumberFormatRangeToParts_0100', Level.LEVEL0, () => {
      let range: string = JSON.stringify([{ "type": "integer", "value": "٠" }, { "type": "literal", "value": "–" },
        { "type": "integer", "value": "٣" }, { "type": "literal", "value": " " }, { "type": "unit", "value": "لتر" }]);
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat("ar", {
        style: 'unit', unit: "liter", unitDisplay: "short"
      });
      let formattedRange = numFmt.formatRangeToParts(0, 3);
      expect(JSON.stringify(formattedRange)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_2600
    * @tc.name      : test_NumberFormatRangeToParts_0200
    * @tc.desc      : formatRange  with 3500,9500
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRangeToParts_0200', Level.LEVEL2, () => {
      let range: string = JSON.stringify([{ "type": "integer", "value": "3" }, { "type": "group", "value": "." },
        { "type": "integer", "value": "500" }, { "type": "decimal", "value": "," },
        { "type": "fraction", "value": "00" }, { "type": "literal", "value": "–" }, { "type": "integer", "value": "9" },
        { "type": "group", "value": "." }, { "type": "integer", "value": "500" }, { "type": "decimal", "value": "," },
        { "type": "fraction", "value": "00" }, { "type": "literal", "value": " " },
        { "type": "currency", "value": "€" }]);
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat("de-DE", {
        style: 'currency', currency: "EUR", unitDisplay: "short"
      });
      let formattedRange = numFmt.formatRangeToParts(3500, 9500);
      expect(JSON.stringify(formattedRange)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_2700
    * @tc.name      : test_NumberFormatRangeToParts_0300
    * @tc.desc      : formatRange  with 0,3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRangeToParts_0300', Level.LEVEL2, () => {
      let range: string = JSON.stringify([{ "type": "integer", "value": "0" }, { "type": "percentSign", "value": "%" },
        { "type": "literal", "value": " - " }, { "type": "integer", "value": "300" },
        { "type": "percentSign", "value": "%" }]);
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat("zh", {
        style: 'percent', unitDisplay: "short"
      });
      let formattedRange = numFmt.formatRangeToParts(0, 3);
      expect(JSON.stringify(formattedRange)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_intl_SupplementNumberFormat_2800
    * @tc.name      : test_NumberFormatRangeToParts_0400
    * @tc.desc      : formatRange  with -30000.2,-10000.2
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_NumberFormatRangeToParts_0400', Level.LEVEL2, () => {
      let range: string = JSON.stringify([{
        "type": "minusSign", "value": "-"
      }, {
        "type": "integer", "value": "30"
      }, {
        "type": "group", "value": ","
      }, {
        "type": "integer", "value": "000"
      }, {
        "type": "decimal", "value": "."
      }, {
        "type": "fraction", "value": "2"
      }, {
        "type": "literal", "value": " ～ "
      }, {
        "type": "minusSign", "value": "-"
      }, {
        "type": "integer", "value": "10"
      }, {
        "type": "group", "value": ","
      }, {
        "type": "integer", "value": "000"
      }, {
        "type": "decimal", "value": "."
      }, {
        "type": "fraction", "value": "2"
      }]);
      let numFmt: Intl.NumberFormat = new Intl.NumberFormat("ja", {
        unitDisplay: "short"
      });
      let formattedRange = numFmt.formatRangeToParts(-30000.2, -10000.2);
      expect(JSON.stringify(formattedRange)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0100
    * @tc.name      : test_IntlPluralRules_0100
    * @tc.desc      : PluralRules  with en-US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_IntlPluralRules_0100', Level.LEVEL0, () => {
      const enCardinalRules = new Intl.PluralRules('en-US');
      expect(enCardinalRules.select(0)).assertEqual('other');
      expect(enCardinalRules.select(0.01)).assertEqual('other');
      expect(enCardinalRules.select(1)).assertEqual('one');
      expect(enCardinalRules.select(2)).assertEqual('other');
      expect(enCardinalRules.select(3)).assertEqual('other');
    })
    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0200
    * @tc.name      : test_IntlPluralRules_0200
    * @tc.desc      : PluralRules  with ar
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0200', Level.LEVEL2, () => {
      const enCardinalRules = new Intl.PluralRules('ar');
      expect(enCardinalRules.select(0)).assertEqual('zero');
      expect(enCardinalRules.select(0.01)).assertEqual('other');
      expect(enCardinalRules.select(1)).assertEqual('one');
      expect(enCardinalRules.select(2)).assertEqual('two');
      expect(enCardinalRules.select(9)).assertEqual('few');
      expect(enCardinalRules.select(10)).assertEqual('few');
      expect(enCardinalRules.select(11)).assertEqual('many');
      expect(enCardinalRules.select(19)).assertEqual('many');
      expect(enCardinalRules.select(900)).assertEqual('other');
      expect(enCardinalRules.select(9999)).assertEqual('many');
      expect(enCardinalRules.select(1000)).assertEqual('other');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0300
    * @tc.name      : test_IntlPluralRules_0300
    * @tc.desc      : PluralRules  with zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0300', Level.LEVEL2, () => {
      const enCardinalRules = new Intl.PluralRules('zh-CN', { type: 'ordinal' });
      expect(enCardinalRules.select(0.1)).assertEqual('other');
      expect(enCardinalRules.select(0)).assertEqual('other');
      expect(enCardinalRules.select(1)).assertEqual('other');
      expect(enCardinalRules.select(2)).assertEqual('other');
      expect(enCardinalRules.select(100)).assertEqual('other');
    })
    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0400
    * @tc.name      : test_IntlPluralRules_0400
    * @tc.desc      : PluralRules  with en-US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0400', Level.LEVEL2, () => {
      const pr = new Intl.PluralRules('en-US', { type: 'ordinal' });
      const suffixes = new Map([['one', 'st'], ['two', 'nd'], ['few', 'rd'], ['other', 'th']]);
      const formatOrdinals = (n: number) => {
        const rule = pr.select(n);
        const suffix = suffixes.get(rule);
        return `${n}${suffix}`;
      }
      expect(formatOrdinals(0)).assertEqual('0th');
      expect(formatOrdinals(1)).assertEqual('1st');
      expect(formatOrdinals(2)).assertEqual('2nd');
      expect(formatOrdinals(3)).assertEqual('3rd');
      expect(formatOrdinals(4)).assertEqual('4th');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0500
    * @tc.name      : test_IntlPluralRules_0500
    * @tc.desc      : PluralRules  with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0500', Level.LEVEL2, () => {
      try {
        new Intl.PluralRules('').select(0);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })
    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0600
    * @tc.name      : test_IntlPluralRules_0600
    * @tc.desc      : PluralRules  with abcd
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0600', Level.LEVEL2, () => {
      try {
        new Intl.PluralRules('abcd').select(0);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0700
    * @tc.name      : test_IntlPluralRules_0700
    * @tc.desc      : PluralRules  with abcd
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0700', Level.LEVEL2, () => {
      const enCardinalRules = new Intl.PluralRules('en-US', { minimumIntegerDigits: 3, maximumFractionDigits: 0 });
      expect(enCardinalRules.select(0)).assertEqual('other');
      expect(enCardinalRules.select(0.1)).assertEqual('other');
      expect(enCardinalRules.select(0.47)).assertEqual('other');
      expect(enCardinalRules.select(0.5)).assertEqual('one');
      expect(enCardinalRules.select(1.1)).assertEqual('one');
      expect(enCardinalRules.select(1.5)).assertEqual('other');
      expect(enCardinalRules.select(2)).assertEqual('other');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0800
    * @tc.name      : test_IntlPluralRules_0800
    * @tc.desc      : PluralRules  with ar-AE
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0800', Level.LEVEL2, () => {
      const enCardinalRules = new Intl.PluralRules('ar-AE', { minimumIntegerDigits: 3, maximumFractionDigits: 1 });
      expect(enCardinalRules.select(0)).assertEqual('zero');
      expect(enCardinalRules.select(0.01)).assertEqual('zero');
      expect(enCardinalRules.select(0.047)).assertEqual('zero');
      expect(enCardinalRules.select(0.05)).assertEqual('other');
      expect(enCardinalRules.select(0.1)).assertEqual('other');
      expect(enCardinalRules.select(1.5)).assertEqual('other');
      expect(enCardinalRules.select(2.04)).assertEqual('two');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_0900
    * @tc.name      : test_IntlPluralRules_0900
    * @tc.desc      : PluralRules  with ar-AE && type: 'ordinal', minimumIntegerDigits:1, maximumFractionDigits:0
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRules_0900', Level.LEVEL2, () => {
      try {
        new Intl.PluralRules('ar-AE', { type: 'ordinal', minimumIntegerDigits: 1, maximumFractionDigits: 0 });
      } catch (e) {
        expect(e.name).assertEqual('RangError');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1000
    * @tc.name      : test_IntlPluralRulesResolvedOptions_0100
    * @tc.desc      : PluralRules  with zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesResolvedOptions_0100', Level.LEVEL2, () => {
      let expected = JSON.stringify({
        'locale': 'zh',
        'type': 'cardinal',
        'minimumIntegerDigits': 1,
        'minimumFractionDigits': 0,
        'maximumFractionDigits': 3,
        'pluralCategories': ['other']
      });
      const enCardinalRules = new Intl.PluralRules('zh-CN');
      let Options = enCardinalRules.resolvedOptions();
      expect(JSON.stringify(Options)).assertEqual(expected);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1100
    * @tc.name      : test_IntlPluralRulesResolvedOptions_0200
    * @tc.desc      : PluralRules  with ar-AE
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesResolvedOptions_0200', Level.LEVEL2, () => {
      let enCardinalRules = new Intl.PluralRules('ar-AE');
      let Options = enCardinalRules.resolvedOptions();
      expect(Options.locale).assertEqual('ar');
      expect(Options.type).assertEqual('cardinal');
      expect(Options.minimumIntegerDigits).assertEqual(1);
      expect(Options.minimumFractionDigits).assertEqual(0);
      expect(Options.maximumFractionDigits).assertEqual(3);
      expect(Options.pluralCategories.toString()).assertEqual('few,many,one,two,zero,other');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1200
    * @tc.name      : test_IntlPluralRulesResolvedOptions_0300
    * @tc.desc      : PluralRules  with ar-AE && type: 'ordinal', minimumIntegerDigits: 3, minimumFractionDigits: 3, maximumFractionDigits: 5
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesResolvedOptions_0300', Level.LEVEL2, () => {
      let enCardinalRules = new Intl.PluralRules('ar-AE', {
        type: 'ordinal',
        minimumIntegerDigits: 3,
        minimumFractionDigits: 3,
        maximumFractionDigits: 5
      });
      let Options = enCardinalRules.resolvedOptions();
      expect(Options.locale).assertEqual('ar');
      expect(Options.type).assertEqual('ordinal');
      expect(Options.minimumIntegerDigits).assertEqual(3);
      expect(Options.minimumFractionDigits).assertEqual(3);
      expect(Options.maximumFractionDigits).assertEqual(5);
      expect(Options.pluralCategories.toString()).assertEqual('other');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1300
    * @tc.name      : test_IntlPluralRulesResolvedOptions_0400
    * @tc.desc      : PluralRules  with NULL
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesResolvedOptions_0400', Level.LEVEL2, () => {
      try {
        let enCardinalRules = new Intl.PluralRules('');
        enCardinalRules.resolvedOptions();
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1400
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0100
    * @tc.desc      : supportedLocalesOf  with zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0100', Level.LEVEL2, () => {
      let localesOf = Intl.PluralRules.supportedLocalesOf('zh-CN');
      expect(localesOf.toString()).assertEqual('zh-CN');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1500
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0200
    * @tc.desc      : supportedLocalesOf  with 'en-US', 'ban', 'ar-OM', 'de-DE', 'abc', 'sss'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0200', Level.LEVEL2, () => {
      const locales = ['en-US', 'ban', 'ar-OM', 'de-DE', 'abc', 'sss'];
      let localesOf = Intl.PluralRules.supportedLocalesOf(locales);
      expect(localesOf.toString()).assertEqual('en-US,ar-OM,de-DE');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1600
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0300
    * @tc.desc      : supportedLocalesOf  with zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0300', Level.LEVEL2, () => {
      try {
        Intl.PluralRules.supportedLocalesOf('');
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1700
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0400
    * @tc.desc      : supportedLocalesOf  with zh-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0400', Level.LEVEL2, () => {
      try {
        Intl.PluralRules.supportedLocalesOf('abcd');
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1800
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0500
    * @tc.desc      : supportedLocalesOf  with 'en-US', 'en-US', 'ar-OM', 'de-DE', 'zh', 'zh'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0500', Level.LEVEL2, () => {
      const locales = ['en-US', 'en-US', 'ar-OM', 'de-DE', 'zh', 'zh'];
      let localesOf = Intl.PluralRules.supportedLocalesOf(locales);
      expect(localesOf.toString()).assertEqual('en-US,ar-OM,de-DE,zh');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementPluralRules_1900
    * @tc.name      : test_IntlPluralRulesSupportedLocalesOf_0600
    * @tc.desc      : supportedLocalesOf  with 'null', '1', '@', '#', '_', '*', '/', '&'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlPluralRulesSupportedLocalesOf_0600', Level.LEVEL2, () => {
      const locales = ['null', '1', '@', '#', '_', '*', '/', '&'];
      try {
        Intl.PluralRules.supportedLocalesOf(locales);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0100
    * @tc.name      : test_IntlRelativeTimeFormat_0100
    * @tc.desc      : RelativeTimeFormat  with zh-Hans-AF & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test_IntlRelativeTimeFormat_0100', Level.LEVEL0, () => {
      let rtf = new Intl.RelativeTimeFormat("zh-Hans-AF", {
        numeric: "auto"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('昨天');
      expect(expected(0)).assertEqual('今天');
      expect(expected(1)).assertEqual('明天');
      expect(expected(100)).assertEqual('100天后');
    })
    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0200
    * @tc.name      : test_IntlRelativeTimeFormat_0200
    * @tc.desc      : RelativeTimeFormat  with zh-Hans-AF & numeric: "always" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0200', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("zh-Hans-AF", {
        numeric: "always"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('1天前');
      expect(expected(0)).assertEqual('0天后');
      expect(expected(1)).assertEqual('1天后');
      expect(expected(100)).assertEqual('100天后');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0300
    * @tc.name      : test_IntlRelativeTimeFormat_0300
    * @tc.desc      : RelativeTimeFormat  with ar-AE & numeric: "auto" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0300', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("ar-AE", {
        numeric: "auto"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('أمس');
      expect(expected(0)).assertEqual('اليوم');
      expect(expected(1)).assertEqual('غدًا');
      expect(expected(100)).assertEqual('خلال 100 يوم');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0400
    * @tc.name      : test_IntlRelativeTimeFormat_0400
    * @tc.desc      : RelativeTimeFormat  with ar-AE & numeric: "always" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0400', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("ar-AE", {
        numeric: "always"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('قبل يوم واحد');
      expect(expected(0)).assertEqual('خلال 0 يوم');
      expect(expected(1)).assertEqual('خلال يوم واحد');
      expect(expected(100)).assertEqual('خلال 100 يوم');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0500
    * @tc.name      : test_IntlRelativeTimeFormat_0500
    * @tc.desc      : RelativeTimeFormat  with en-US & numeric: "auto" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0500', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("en-US", {
        numeric: "auto"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('yesterday');
      expect(expected(0)).assertEqual('today');
      expect(expected(1)).assertEqual('tomorrow');
      expect(expected(100)).assertEqual('in 100 days');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0600
    * @tc.name      : test_IntlRelativeTimeFormat_0600
    * @tc.desc      : RelativeTimeFormat  with en-US & numeric: "always" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0600', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("en-US", {
        numeric: "always"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('1 day ago');
      expect(expected(0)).assertEqual('in 0 days');
      expect(expected(1)).assertEqual('in 1 day');
      expect(expected(100)).assertEqual('in 100 days');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0700
    * @tc.name      : test_IntlRelativeTimeFormat_0700
    * @tc.desc      : RelativeTimeFormat  with en-AE-u-nu-hanidec & numeric: "auto" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0700', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("en-AE-u-nu-hanidec", {
        numeric: "auto"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('yesterday');
      expect(expected(0)).assertEqual('today');
      expect(expected(1)).assertEqual('tomorrow');
      expect(expected(100)).assertEqual('in 一〇〇 days');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_0800
    * @tc.name      : test_IntlRelativeTimeFormat_0800
    * @tc.desc      : RelativeTimeFormat  with en-AE-u-nu-hanidec & numeric: "always" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_0800', Level.LEVEL2, () => {
      let rtf = new Intl.RelativeTimeFormat("en-AE-u-nu-hanidec", {
        numeric: "always"
      });
      const expected = (n: number) => {
        let expected = rtf.format(n, "day");
        return expected;
      }
      expect(expected(-1)).assertEqual('一 day ago');
      expect(expected(0)).assertEqual('in 〇 days');
      expect(expected(1)).assertEqual('in 一 day');
      expect(expected(100)).assertEqual('in 一〇〇 days');
    })


    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1000
    * @tc.name      : test_IntlRelativeTimeFormat_1000
    * @tc.desc      : RelativeTimeFormat  with null & numeric: "always",style: 'narrow' & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_1000', Level.LEVEL2, () => {
      try {
        new Intl.RelativeTimeFormat('', { numeric: "always", style: 'narrow' });
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1100
    * @tc.name      : test_IntlRelativeTimeFormat_1100
    * @tc.desc      : RelativeTimeFormat  with abcd & numeric: "always",style: 'narrow' & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormat_1100', Level.LEVEL2, () => {
      try {
        new Intl.RelativeTimeFormat('abcd', { numeric: "always", style: 'narrow' });
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1200
    * @tc.name      : test_IntlRelativeTimeFormatToParts_0100
    * @tc.desc      : RelativeTimeFormat  with zh-hans-AF & numeric: "always" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('test_IntlRelativeTimeFormatToParts_0100', Level.LEVEL1, () => {
      let range: string = JSON.stringify([{ 'type': "integer", 'value': '10', 'unit': 'day' },
        { 'type': 'group', 'value': ',', 'unit': 'day' }, { 'type': 'integer', 'value': '000', 'unit': 'day' },
        { 'type': 'literal', 'value': '天后' }])
      let rtf = new Intl.RelativeTimeFormat('zh-hans-AF', { numeric: "always" });
      let expected = rtf.formatToParts(1000, 'day');
      expect(JSON.stringify(expected)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1300
    * @tc.name      : test_IntlRelativeTimeFormatToParts_0200
    * @tc.desc      : RelativeTimeFormat  with en-US & numeric: "auto" & day
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatToParts_0200', Level.LEVEL2, () => {
      let range: string = JSON.stringify([{ 'type': "literal", 'value': 'yesterday' }])
      let rtf = new Intl.RelativeTimeFormat('en-US', { numeric: "auto" });
      let expected = rtf.formatToParts(-1, 'day');
      expect(JSON.stringify(expected)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1400
    * @tc.name      : test_IntlRelativeTimeFormatResolvedOptions_0100
    * @tc.desc      : resolvedOptions  with en-US
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('test_IntlRelativeTimeFormatResolvedOptions_0100', Level.LEVEL1, () => {
      let range: string = JSON.stringify({
        'locale': "en-US",
        'style': 'long',
        'numeric': 'always',
        'numberingSystem': 'latn'
      })
      let rtf = new Intl.RelativeTimeFormat('en-US');
      let expected = rtf.resolvedOptions();
      expect(JSON.stringify(expected)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1500
    * @tc.name      : test_IntlRelativeTimeFormatResolvedOptions_0200
    * @tc.desc      : resolvedOptions  with en-US-u-nu-hanidec & numeric: 'auto', localeMatcher: 'best fit'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatResolvedOptions_0200', Level.LEVEL2, () => {
      let range: string = JSON.stringify({
        'locale': "en-US-u-nu-hanidec",
        'style': 'long',
        'numeric': 'auto',
        'numberingSystem': 'hanidec'
      })
      let rtf = new Intl.RelativeTimeFormat('en-US-u-nu-hanidec', { numeric: 'auto', localeMatcher: 'best fit' });
      let expected = rtf.resolvedOptions();
      expect(JSON.stringify(expected)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1600
    * @tc.name      : test_IntlRelativeTimeFormatResolvedOptions_0300
    * @tc.desc      : resolvedOptions  with ar & numeric: 'auto', localeMatcher: 'best fit'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatResolvedOptions_0300', Level.LEVEL2, () => {
      let range: string = JSON.stringify({
        'locale': "ar",
        'style': 'long',
        'numeric': 'auto',
        'numberingSystem': 'arab'
      })
      let rtf = new Intl.RelativeTimeFormat('ar', { numeric: 'auto', localeMatcher: 'best fit' });
      let expected = rtf.resolvedOptions();
      expect(JSON.stringify(expected)).assertEqual(range);
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1700
    * @tc.name      : test_IntlRelativeTimeFormatResolvedOptions_0400
    * @tc.desc      : resolvedOptions  with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatResolvedOptions_0400', Level.LEVEL2, () => {
      try {
        new Intl.RelativeTimeFormat('').resolvedOptions();
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1800
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0100
    * @tc.desc      : supportedLocalesOf  with zh-Hans-CN
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0100', Level.LEVEL2, () => {

      let localesOf = Intl.RelativeTimeFormat.supportedLocalesOf('zh-Hans-CN');
      expect(localesOf.toString()).assertEqual('zh-Hans-CN');

    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_1900
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0200
    * @tc.desc      : resolvedOptions  with 'en-US','ban', 'ar-OM', 'de-DE', 'abc', 'sss'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0200', Level.LEVEL2, () => {
      const locatles = ['en-US', 'ban', 'ar-OM', 'de-DE', 'abc', 'sss']
      let localesOf = Intl.RelativeTimeFormat.supportedLocalesOf(locatles);
      expect(localesOf.toString()).assertEqual('en-US,ar-OM,de-DE');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_2000
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0300
    * @tc.desc      : resolvedOptions  with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0300', Level.LEVEL2, () => {
      try {
        Intl.RelativeTimeFormat.supportedLocalesOf('');
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_2100
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0400
    * @tc.desc      : resolvedOptions  with abcd
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0400', Level.LEVEL2, () => {
      try {
        Intl.RelativeTimeFormat.supportedLocalesOf('abcd');
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_2200
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0500
    * @tc.desc      : resolvedOptions  with 'en-US','ban', 'ar-OM', 'de-DE', 'abc', 'sss'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0500', Level.LEVEL2, () => {
      const locatles = ['en-US', 'en-US', 'ar-OM', 'de-DE', 'zh', 'zh']
      let localesOf = Intl.RelativeTimeFormat.supportedLocalesOf(locatles);
      expect(localesOf.toString()).assertEqual('en-US,ar-OM,de-DE,zh');
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_SupplementRelativeTimeFormat_2300
    * @tc.name      : test_IntlRelativeTimeFormatSupportedLocalesOf_0600
    * @tc.desc      : resolvedOptions  with 'en-US','ban', 'ar-OM', 'de-DE', 'abc', 'sss'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('test_IntlRelativeTimeFormatSupportedLocalesOf_0600', Level.LEVEL2, () => {
      const locatles = ['null', '1', '@', '#', '-', '*', '/', '&']
      try {
        Intl.RelativeTimeFormat.supportedLocalesOf(locatles);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0100
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0100
    * @tc.desc      : supportedLocalesOf  with 'zh-Hans-TW'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0100', Level.LEVEL0, () => {
      const locales1 = ['zh-Hans-TW'];
      const support = Intl.Collator.supportedLocalesOf(locales1, { localeMatcher: 'lookup' });
      expect(support.toString()).assertEqual('zh-Hans-TW')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0200
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0200
    * @tc.desc      : supportedLocalesOf  with 'ar','my','tr','zh','sk','ja','zh-Hans-TW-u-um-arab','en-Latn-CN', 'id-u-co-pinyin','de-ID'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0200', Level.LEVEL2, () => {
      const locales1 =
        ['ar', 'my', 'tr', 'zh', 'sk', 'ja', 'zh-Hans-TW-u-um-arab', 'en-Latn-CN', 'id-u-co-pinyin', 'de-ID'];
      const support = Intl.Collator.supportedLocalesOf(locales1, { localeMatcher: 'lookup' });
      expect(support.toString()).assertEqual('ar,my,tr,zh,sk,ja,zh-Hans-TW-u-mu-arad,en-Latn-CN,id-u-co-pinyin,de-ID')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0300
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0300
    * @tc.desc      : supportedLocalesOf  with 'ban', 'id-u-co-pinyin', 'de-Id'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0300', Level.LEVEL2, () => {
      const locales1 = ['ban', 'id-u-co-pinyin', 'de-Id'];
      const support = Intl.Collator.supportedLocalesOf(locales1);
      expect(support.toString()).assertEqual('id-u-co-pinyin,de-ID')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0400
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0400
    * @tc.desc      : supportedLocalesOf  with 'zh-Hans-TW', '123', 'aaa','%'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0400', Level.LEVEL2, () => {
      try {
        const locales1 = ['zh-Hans-TW', '123', 'aaa', '%'];
        Intl.Collator.supportedLocalesOf(locales1);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0500
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0500
    * @tc.desc      : supportedLocalesOf  with []
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0500', Level.LEVEL2, () => {
      const locales1 = [];
      const support = Intl.Collator.supportedLocalesOf(locales1);
      expect(support.toString()).assertEqual('')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0600
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0600
    * @tc.desc      : supportedLocalesOf  with 'null', '1', '@','#','-','*','/','&'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0600', Level.LEVEL2, () => {
      try {
        const locales1 = ['null', '1', '@', '#', '-', '*', '/', '&'];
        Intl.Collator.supportedLocalesOf(locales1);
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testsupportedLocalesOf_0700
    * @tc.name      : SUB_GLOBAL_testsupportedLocalesOf_0700
    * @tc.desc      : supportedLocalesOf  with 'abcd'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('SUB_GLOBAL_testsupportedLocalesOf_0700', Level.LEVEL2, () => {
      try {
        Intl.Collator.supportedLocalesOf('abcd');
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })


    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testresolvedOptions_0100
    * @tc.name      : SUB_GLOBAL_testresolvedOptions_0100
    * @tc.desc      : supportedLocalesOf  with 'ar'
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_GLOBAL_testresolvedOptions_0100', Level.LEVEL0, () => {
      const de = new Intl.Collator("ar");
      const usedOptions = de.resolvedOptions().locale;
      expect(usedOptions).assertEqual('ar')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testresolvedOptions_0200
    * @tc.name      : SUB_GLOBAL_testresolvedOptions_0200
    * @tc.desc      : supportedLocalesOf  with "de",{sensitivity: 'base'}
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_GLOBAL_testresolvedOptions_0200', Level.LEVEL0, () => {
      const de = new Intl.Collator("de", { sensitivity: 'base' });
      const usedOptions = de.resolvedOptions().locale;
      expect(usedOptions).assertEqual('de')
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testresolvedOptions_0300
    * @tc.name      : SUB_GLOBAL_testresolvedOptions_0300
    * @tc.desc      : supportedLocalesOf  with "abcd",{sensitivity: 'base'}
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_GLOBAL_testresolvedOptions_0300', Level.LEVEL0, () => {
      try {
        Intl.Collator("abcd", { sensitivity: 'base' }).resolvedOptions().locale;
      } catch (e) {
        expect(e.message).assertEqual('invalid locale');
      }
    })

    /* *
    * @tc.number    : SUB_GLOBAL_Intl_testresolvedOptions_0400
    * @tc.name      : SUB_GLOBAL_testresolvedOptions_0400
    * @tc.desc      : supportedLocalesOf  with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_GLOBAL_testresolvedOptions_0400', Level.LEVEL0, () => {
      const de = new Intl.Collator();
      const usedOptions = de.resolvedOptions().locale;
      expect(usedOptions).assertEqual('en-US')
    })

  })
}