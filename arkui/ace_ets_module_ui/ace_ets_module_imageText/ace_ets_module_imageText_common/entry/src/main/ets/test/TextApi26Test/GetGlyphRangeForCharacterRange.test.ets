/**
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetGlyphRangeForCharacterRangeTest() {
  describe('GetGlyphRangeForCharacterRangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GetGlyphRangeForCharacterRangeTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextLayoutManagerApi26',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('get TextLayoutManagerApi26 state pages: ' + JSON.stringify(pages));
        if (!pages.name.includes('TextLayoutManagerApi26')) {
          const result = await router.replaceUrl(options);
          console.info('push TextLayoutManagerApi26 page success: ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error('push TextLayoutManagerApi26 page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      AppStorage.delete('glyphRange_utf8');
      AppStorage.delete('glyphRange_utf16');
      AppStorage.delete('glyphRange_default');
      AppStorage.delete('glyphRange_partial');
      AppStorage.delete('glyphRange_oob');
      AppStorage.delete('glyphRange_undefined_range');
      AppStorage.delete('glyphRange_null_textEncoding');
      AppStorage.delete('glyphRange_undfined_textEncoding');
      AppStorage.delete('glyphRange_exceeds_textEncoding');
      await CommonFunc.sleep(500);
      console.info('GetGlyphRangeForCharacterRangeTest afterEach called');
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0010
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_UTF8_0010
     * @tc.desc   Test getGlyphRangeForCharacterRange with UTF8 encoding, charRange {0,3} for "世"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0010] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_utf8');
        console.info('[GetGlyphRangeForCharacterRangeTest_0010] result: ' + result);
        expect(result !== 'undefined').assertTrue();
        expect(result).assertContain('first:[');
        expect(result).assertContain('second:[');

        const ranges: string[] = result!.split('],');
        const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
        const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
        const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
        const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

        expect(firstStart).assertEqual(0);
        expect(firstEnd).assertEqual(1);
        expect(secondStart).assertEqual(0);
        expect(secondEnd).assertEqual(3);
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0010 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0010] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0020
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_UTF16_0020
     * @tc.desc   Test getGlyphRangeForCharacterRange with UTF16 encoding, charRange {0,1} for "世"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0020] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_utf16');
        console.info('[GetGlyphRangeForCharacterRangeTest_0020] result: ' + result);
        expect(result !== 'undefined').assertTrue();

        const ranges: string[] = result!.split('],');
        const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
        const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
        const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
        const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

        expect(firstStart).assertEqual(0);
        expect(firstEnd).assertEqual(1);
        expect(secondStart).assertEqual(0);
        expect(secondEnd).assertEqual(1);
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0020 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0020] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0030
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_DEFAULT_0030
     * @tc.desc   Test getGlyphRangeForCharacterRange with undefined encoding (default UTF8)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0030] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const resultDefault: string | undefined = AppStorage.get<string>('glyphRange_default');
        const resultUtf8: string | undefined = AppStorage.get<string>('glyphRange_utf8');
        console.info('[GetGlyphRangeForCharacterRangeTest_0030] default: ' + resultDefault);
        expect(resultDefault !== 'undefined').assertTrue();
        expect(resultDefault).assertEqual(resultUtf8);
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0030 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0030] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0040
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_PARTIAL_0040
     * @tc.desc   Test getGlyphRangeForCharacterRange with partial UTF-8 char range {0,1} rounds to full char {0,3}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0040] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_partial');
        console.info('[GetGlyphRangeForCharacterRangeTest_0040] result: ' + result);
        expect(result !== 'undefined').assertTrue();

        const ranges: string[] = result!.split('],');
        const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
        const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
        const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
        const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

        expect(firstStart).assertEqual(0);
        expect(firstEnd).assertEqual(1);
        expect(secondStart).assertEqual(0);
        expect(secondEnd).assertEqual(3);
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0040 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0040] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0050
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_OOB_0050
     * @tc.desc   Test getGlyphRangeForCharacterRange with out-of-bounds char range {0,100} does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0050] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_oob');
        console.info('[GetGlyphRangeForCharacterRangeTest_0050] result: ' + result);
        expect(result !== 'undefined').assertTrue();
        expect(result).assertContain('first:[');
        expect(result).assertContain('second:[');
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0050 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0050] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0060
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_UNDEFINED_RANGE_0060
     * @tc.desc   Test getGlyphRangeForCharacterRange with TextRange having undefined start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlyphRangeForCharacterRangeTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0060] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_undefined_range');
        console.info('[GetGlyphRangeForCharacterRangeTest_0060] result: ' + result);
        expect(result !== undefined).assertTrue();
        expect(result !== 'undefined').assertTrue();
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0060 error: ' + err);
        expect(true).assertEqual(false);
      }
      
      console.info('[GetGlyphRangeForCharacterRangeTest_0060] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0070
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_NULL_TEXTENCODING_0070
     * @tc.desc   Test getGlyphRangeForCharacterRange with null TextEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetGlyphRangeForCharacterRangeTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0070] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_null_textEncoding');
        console.info('[GetGlyphRangeForCharacterRangeTest_0070] result: ' + result);
        expect(result !== 'undefined').assertTrue();
        expect(result).assertContain('first:[');
        expect(result).assertContain('second:[');
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0070 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0070] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0080
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_UNDEFINED_TEXTENCODING_0080
     * @tc.desc   Test getGlyphRangeForCharacterRange with undefined TextEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetGlyphRangeForCharacterRangeTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0080] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_undfined_textEncoding');
        console.info('[GetGlyphRangeForCharacterRangeTest_0080] result: ' + result);
        expect(result !== 'undefined').assertTrue();
        expect(result).assertContain('first:[');
        expect(result).assertContain('second:[');
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0080 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0080] END');
      done();
    });

    /**
     * @tc.name   GetGlyphRangeForCharacterRangeTest_0090
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGE_EXCEEDS_TEXTENCODING_0090
     * @tc.desc   Test getGlyphRangeForCharacterRange with exceeds TextEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetGlyphRangeForCharacterRangeTest_0090', Level.LEVEL2, async (done: Function) => {
      console.info('[GetGlyphRangeForCharacterRangeTest_0090] START');
      try {
        await CommonFunc.sleep(500);

        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn_glyph_range_api26'));
        await button.click();
        await CommonFunc.sleep(1000);

        const result: string | undefined = AppStorage.get<string>('glyphRange_exceeds_textEncoding');
        console.info('[GetGlyphRangeForCharacterRangeTest_0090] result: ' + result);
        expect(result !== 'undefined').assertTrue();
        expect(result).assertContain('first:[');
        expect(result).assertContain('second:[');
      }catch (err) {
        console.error('GetGlyphRangeForCharacterRangeTest_0090 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[GetGlyphRangeForCharacterRangeTest_0090] END');
      done();
    });
  });
}
