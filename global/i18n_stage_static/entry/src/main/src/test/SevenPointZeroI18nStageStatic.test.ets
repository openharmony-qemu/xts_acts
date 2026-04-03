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
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function SevenPointZeroI18nStageStaticTest() {

  describe("SevenPointZeroI18nStageStaticTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start SevenPointZeroI18nStageTest*************');

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
     * @tc.name test_SymbolDateTimeFormat_0100
     * @tc.number test_SymbolDateTimeFormat_0100
     * @tc.desc test SymbolDateTimeFormat with empty SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0100', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolDateTimeFormat_0200
     * @tc.desc test SymbolDateTimeFormat with undefined SymbolDateTimeFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0200', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolDateTimeFormat_0300
     * @tc.desc test SymbolDateTimeFormat with custom PM character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0300', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolDateTimeFormat_0400
     * @tc.desc test SymbolDateTimeFormat with custom AM character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0400', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolDateTimeFormat_0500
     * @tc.desc test SymbolDateTimeFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0500', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolDateTimeFormat_0600
     * @tc.desc test SymbolDateTimeFormat with empty amPMSymbol param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolDateTimeFormat_0600', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_0100
     * @tc.number test_SymbolNumberFormat_0100
     * @tc.desc test SymbolNumberFormat with empty SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0100', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_0200
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0200', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_0400
     * @tc.number test_SymbolNumberFormat_0400
     * @tc.desc test SymbolNumberFormat with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0400', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_0600
     * @tc.number test_SymbolNumberFormat_0600
     * @tc.desc test SymbolNumberFormat with undefined SymbolNumberFormatOptions param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0600', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_0700
     * @tc.desc test SymbolNumberFormat with custom null character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0700', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_0800
     * @tc.desc test SymbolNumberFormat with resolvedOptions function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_0800', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_1000
     * @tc.number test_SymbolNumberFormat_1000
     * @tc.desc test SymbolNumberFormat with undefined nan option
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1000', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_1100
     * @tc.desc test SymbolNumberFormat with custom minusSign character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1100', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_1200
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1200', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_1400
     * @tc.number test_SymbolNumberFormat_1400
     * @tc.desc test SymbolNumberFormat with undefined minusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1400', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_1500
     * @tc.desc test SymbolNumberFormat with custom plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1500', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_1600
     * @tc.desc test SymbolNumberFormat with resolveOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1600', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_1800
     * @tc.number test_SymbolNumberFormat_1800
     * @tc.desc test SymbolNumberFormat with empty plusSign param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1800', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_1900
     * @tc.desc test SymbolNumberFormat with custom infinity symbol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_1900', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_2000
     * @tc.desc test SymbolNumberFormat with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2000', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name test_SymbolNumberFormat_2200
     * @tc.number test_SymbolNumberFormat_2200
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2200', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_2300
     * @tc.desc test SymbolNumberFormat with undefined infinity param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2300', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_2400
     * @tc.desc test SymbolNumberFormat with groupingSeparator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2400', Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.number test_SymbolNumberFormat_2600
     * @tc.desc test SymbolNumberFormat with empty groupingSeparator param
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('test_SymbolNumberFormat_2600', Level.LEVEL2, async (): Promise<void> => {
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
