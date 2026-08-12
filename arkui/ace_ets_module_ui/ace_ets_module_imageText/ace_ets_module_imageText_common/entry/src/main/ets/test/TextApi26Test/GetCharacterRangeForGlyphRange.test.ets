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

export default function GetCharacterRangeForGlyphRangeTest() {
  describe('GetCharacterRangeForGlyphRangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GetCharacterRangeForGlyphRangeTest beforeEach start');
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
      AppStorage.delete('charRange_utf8');
      AppStorage.delete('charRange_utf16');
      AppStorage.delete('charRange_default');
      AppStorage.delete('charRange_oob_utf8');
      AppStorage.delete('charRange_oob_utf16');
      AppStorage.delete('charRange_undefined_range');
      await CommonFunc.sleep(500);
      console.info('GetCharacterRangeForGlyphRangeTest afterEach called');
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0010
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_UTF8_0010
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF8 encoding, glyphRange {0,7} for full text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0010] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const result: string | undefined = AppStorage.get<string>('charRange_utf8');
      console.info('[GetCharacterRangeForGlyphRangeTest_0010] result: ' + result);
      expect(result !== 'undefined').assertTrue();
      expect(result).assertContain('first:[');
      expect(result).assertContain('second:[');

      const ranges: string[] = result!.split('],');
      const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
      const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
      const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
      const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

      expect(firstStart).assertEqual(0);
      expect(firstEnd).assertEqual(11);
      expect(secondStart).assertEqual(0);
      expect(secondEnd).assertEqual(7);
      console.info('[GetCharacterRangeForGlyphRangeTest_0010] END');
      done();
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0020
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_UTF16_0020
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF16 encoding, glyphRange {0,7} for full text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0020] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const result: string | undefined = AppStorage.get<string>('charRange_utf16');
      console.info('[GetCharacterRangeForGlyphRangeTest_0020] result: ' + result);
      expect(result !== 'undefined').assertTrue();

      const ranges: string[] = result!.split('],');
      const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
      const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
      const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
      const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

      expect(firstStart).assertEqual(0);
      expect(firstEnd).assertEqual(7);
      expect(secondStart).assertEqual(0);
      expect(secondEnd).assertEqual(7);
      console.info('[GetCharacterRangeForGlyphRangeTest_0020] END');
      done();
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0030
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_DEFAULT_0030
     * @tc.desc   Test getCharacterRangeForGlyphRange with undefined encoding (default UTF8)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0030] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const resultDefault: string | undefined = AppStorage.get<string>('charRange_default');
      const resultUtf8: string | undefined = AppStorage.get<string>('charRange_utf8');
      console.info('[GetCharacterRangeForGlyphRangeTest_0030] default: ' + resultDefault);
      expect(resultDefault !== 'undefined').assertTrue();
      expect(resultDefault).assertEqual(resultUtf8);
      console.info('[GetCharacterRangeForGlyphRangeTest_0030] END');
      done();
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0040
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_OOB_UTF8_0040
     * @tc.desc   Test getCharacterRangeForGlyphRange with out-of-bounds glyphRange {0,11} UTF8, actual glyph range clamped to {0,7}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0040] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const result: string | undefined = AppStorage.get<string>('charRange_oob_utf8');
      console.info('[GetCharacterRangeForGlyphRangeTest_0040] result: ' + result);
      expect(result !== 'undefined').assertTrue();

      const ranges: string[] = result!.split('],');
      const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
      const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
      const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
      const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

      expect(firstStart).assertEqual(0);
      expect(firstEnd).assertEqual(11);
      expect(secondStart).assertEqual(0);
      expect(secondEnd).assertEqual(7);
      console.info('[GetCharacterRangeForGlyphRangeTest_0040] END');
      done();
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0050
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_OOB_UTF16_0050
     * @tc.desc   Test getCharacterRangeForGlyphRange with out-of-bounds glyphRange {0,11} UTF16, actual glyph range clamped to {0,7}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0050] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const result: string | undefined = AppStorage.get<string>('charRange_oob_utf16');
      console.info('[GetCharacterRangeForGlyphRangeTest_0050] result: ' + result);
      expect(result !== 'undefined').assertTrue();

      const ranges: string[] = result!.split('],');
      const firstStart: number = parseInt(ranges[0].split('[')[1].split(',')[0], 10);
      const firstEnd: number = parseInt(ranges[0].split(',')[1], 10);
      const secondStart: number = parseInt(ranges[1].split('[')[1].split(',')[0], 10);
      const secondEnd: number = parseInt(ranges[1].split(',')[1], 10);

      expect(firstStart).assertEqual(0);
      expect(firstEnd).assertEqual(7);
      expect(secondStart).assertEqual(0);
      expect(secondEnd).assertEqual(7);
      console.info('[GetCharacterRangeForGlyphRangeTest_0050] END');
      done();
    });

    /**
     * @tc.name   GetCharacterRangeForGlyphRangeTest_0060
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARRANGE_UNDEFINED_RANGE_0060
     * @tc.desc   Test getCharacterRangeForGlyphRange with TextRange having undefined start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCharacterRangeForGlyphRangeTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[GetCharacterRangeForGlyphRangeTest_0060] START');
      await CommonFunc.sleep(500);

      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('btn_char_range_api26'));
      await button.click();
      await CommonFunc.sleep(1000);

      const result: string | undefined = AppStorage.get<string>('charRange_undefined_range');
      console.info('[GetCharacterRangeForGlyphRangeTest_0060] result: ' + result);
      expect(result !== undefined).assertTrue();
      expect(result !== 'undefined').assertTrue();
      console.info('[GetCharacterRangeForGlyphRangeTest_0060] END');
      done();
    });
  });
}
