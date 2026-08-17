'use static';
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function LayoutManagerEncodingTest() {
  describe('LayoutManagerEncodingTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('LayoutManagerEncodingTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('LayoutManagerEncodingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LayoutManager/LayoutManagerEncoding',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('LayoutManagerEncodingTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'LayoutManagerEncoding') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('LayoutManagerEncodingTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info('LayoutManagerEncodingTest after each called');
    });

    // ========================================================================
    // getCharacterPositionAtCoordinate tests (API version 26.0.0)
    // Text content: "世界Hello"
    // UTF-8: 11 bytes (世=3, 界=3, Hello=5)
    // UTF-16: 7 code units (世=1, 界=1, Hello=5)
    // ========================================================================

    /**
     * @tc.name   getCharacterPositionAtCoordinate_utf8_start_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF8_START_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF8 encoding at coordinate (0,0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_utf8_start_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_utf8_start_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_utf8_start'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_utf8_start_0100] result = ' + label);
        expect(label).assertContain('pos_utf8_start:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(0);
        console.info('[getCharacterPositionAtCoordinate_utf8_start_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_utf8_start_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_utf16_start_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF16_START_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF16 encoding at coordinate (0,0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_utf16_start_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_utf16_start_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_utf16_start'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_utf16_start_0100] result = ' + label);
        expect(label).assertContain('pos_utf16_start:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(0);
        console.info('[getCharacterPositionAtCoordinate_utf16_start_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_utf16_start_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_utf8_end_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF8_END_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF8 encoding at large coordinate returns last position (11)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_utf8_end_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_utf8_end_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_utf8_end'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_utf8_end_0100] result = ' + label);
        expect(label).assertContain('pos_utf8_end:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(11);
        console.info('[getCharacterPositionAtCoordinate_utf8_end_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_utf8_end_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_utf16_end_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_UTF16_END_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with UTF16 encoding at large coordinate returns last position (7)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_utf16_end_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_utf16_end_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_utf16_end'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_utf16_end_0100] result = ' + label);
        expect(label).assertContain('pos_utf16_end:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(7);
        console.info('[getCharacterPositionAtCoordinate_utf16_end_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_utf16_end_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_undefined_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_UNDEFINED_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with undefined encoding defaults to UTF8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_undef'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_undefined_0100] result = ' + label);
        expect(label).assertContain('pos_undef:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(0);
        console.info('[getCharacterPositionAtCoordinate_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_undefined_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_null_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_NULL_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with null encoding does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_null_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_null_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_null'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_null_0100] result = ' + label);
        expect(label).assertContain('pos_null:');
        console.info('[getCharacterPositionAtCoordinate_null_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_null_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_negative_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_NEGATIVE_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with negative coordinates does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_negative_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_negative_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_negative'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_negative_0100] result = ' + label);
        expect(label).assertContain('pos_negative:');
        let parts = label.split(':')[1].split('|');
        expect(parseInt(parts[0])).assertEqual(0);
        console.info('[getCharacterPositionAtCoordinate_negative_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_negative_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterPositionAtCoordinate_vp2px_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARACTERPOSITION_VP2PX_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate with vp2px converted coordinates (resolution-independent)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterPositionAtCoordinate_vp2px_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterPositionAtCoordinate_vp2px_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_pos_vp2px'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_pos_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterPositionAtCoordinate_vp2px_0100] result = ' + label);
        expect(label).assertContain('pos_vp2px:');
        let valuePart = label.split(':')[1];
        expect(valuePart).not().assertContain('undefined');
        expect(valuePart).not().assertContain('caught');
        let parts = valuePart.split('|');
        let position = parseInt(parts[0]);
        expect(position >= 0).assertTrue();
        console.info('[getCharacterPositionAtCoordinate_vp2px_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterPositionAtCoordinate_vp2px_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ========================================================================
    // getGlyphRangeForCharacterRange tests (API version 26.0.0)
    // Text content: "世界Hello"
    // UTF-8: 世=[0,3], 界=[3,6], H=[6,7], e=[7,8], l=[8,9], l=[9,10], o=[10,11]
    // UTF-16: 世=[0,1], 界=[1,2], H=[2,3], e=[3,4], l=[4,5], l=[5,6], o=[6,7]
    // Glyph: 世=[0,1], 界=[1,2], H=[2,3], e=[3,4], l=[4,5], l=[5,6], o=[6,7]
    // ========================================================================

    /**
     * @tc.name   getGlyphRangeForCharacterRange_utf8_aligned_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_UTF8_ALIGNED_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with UTF8 encoding and aligned range [0,3]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_utf8_aligned_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_utf8_aligned_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_utf8_aligned'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_utf8_aligned_0100] result = ' + label);
        expect(label).assertContain('glyph_utf8_aligned:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let glyphRange = ranges[0].split(',');
        let charRange = ranges[1].split(',');
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(1);
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(3);
        console.info('[getGlyphRangeForCharacterRange_utf8_aligned_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_utf8_aligned_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getGlyphRangeForCharacterRange_utf16_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_UTF16_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with UTF16 encoding and range [0,1]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_utf16_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_utf16_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_utf16'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_utf16_0100] result = ' + label);
        expect(label).assertContain('glyph_utf16:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let glyphRange = ranges[0].split(',');
        let charRange = ranges[1].split(',');
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(1);
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(1);
        console.info('[getGlyphRangeForCharacterRange_utf16_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_utf16_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getGlyphRangeForCharacterRange_undefined_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_UNDEFINED_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with undefined encoding defaults to UTF8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_undef'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_undefined_0100] result = ' + label);
        expect(label).assertContain('glyph_undef:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let glyphRange = ranges[0].split(',');
        let charRange = ranges[1].split(',');
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(1);
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(3);
        console.info('[getGlyphRangeForCharacterRange_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_undefined_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getGlyphRangeForCharacterRange_null_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_NULL_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with null encoding does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_null_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_null_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_null'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_null_0100] result = ' + label);
        expect(label).assertContain('glyph_null:');
        console.info('[getGlyphRangeForCharacterRange_null_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_null_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getGlyphRangeForCharacterRange_utf8_unaligned_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_UTF8_UNALIGNED_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with UTF8 unaligned range [0,1] returns aligned actual char range [0,3]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_utf8_unaligned_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_utf8_unaligned_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_utf8_unaligned'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_utf8_unaligned_0100] result = ' + label);
        expect(label).assertContain('glyph_utf8_unaligned:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let glyphRange = ranges[0].split(',');
        let charRange = ranges[1].split(',');
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(1);
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(3);
        console.info('[getGlyphRangeForCharacterRange_utf8_unaligned_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_utf8_unaligned_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getGlyphRangeForCharacterRange_outofrange_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETGLYPHRANGE_OUTOFRANGE_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange with out-of-range [100,200] returns -1 values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getGlyphRangeForCharacterRange_outofrange_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getGlyphRangeForCharacterRange_outofrange_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_glyph_outofrange'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_glyph_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getGlyphRangeForCharacterRange_outofrange_0100] result = ' + label);
        expect(label).assertContain('glyph_outofrange:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let glyphRange = ranges[0].split(',');
        let charRange = ranges[1].split(',');
        expect(parseInt(glyphRange[0])).assertEqual(-1);
        expect(parseInt(glyphRange[1])).assertEqual(-1);
        expect(parseInt(charRange[0])).assertEqual(-1);
        expect(parseInt(charRange[1])).assertEqual(-1);
        console.info('[getGlyphRangeForCharacterRange_outofrange_0100] END');
        done();
      } catch (error) {
        console.error('[getGlyphRangeForCharacterRange_outofrange_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ========================================================================
    // getCharacterRangeForGlyphRange tests (API version 26.0.0)
    // Text content: "世界Hello"
    // Glyph total: 7 (世, 界, H, e, l, l, o)
    // UTF-8 char total: 11 bytes
    // UTF-16 char total: 7 code units
    // ========================================================================

    /**
     * @tc.name   getCharacterRangeForGlyphRange_utf8_full_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_UTF8_FULL_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF8 encoding and full glyph range [0,7]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_utf8_full_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_utf8_full_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_utf8_full'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_utf8_full_0100] result = ' + label);
        expect(label).assertContain('char_utf8_full:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let charRange = ranges[0].split(',');
        let glyphRange = ranges[1].split(',');
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(11);
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(7);
        console.info('[getCharacterRangeForGlyphRange_utf8_full_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_utf8_full_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterRangeForGlyphRange_utf16_full_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_UTF16_FULL_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF16 encoding and full glyph range [0,7]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_utf16_full_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_utf16_full_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_utf16_full'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_utf16_full_0100] result = ' + label);
        expect(label).assertContain('char_utf16_full:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let charRange = ranges[0].split(',');
        let glyphRange = ranges[1].split(',');
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(7);
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(7);
        console.info('[getCharacterRangeForGlyphRange_utf16_full_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_utf16_full_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterRangeForGlyphRange_undefined_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_UNDEFINED_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with undefined encoding defaults to UTF8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_undefined_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_undef'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_undefined_0100] result = ' + label);
        expect(label).assertContain('char_undef:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let charRange = ranges[0].split(',');
        let glyphRange = ranges[1].split(',');
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(11);
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(7);
        console.info('[getCharacterRangeForGlyphRange_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_undefined_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterRangeForGlyphRange_null_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_NULL_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with null encoding does not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_null_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_null_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_null'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_null_0100] result = ' + label);
        expect(label).assertContain('char_null:');
        console.info('[getCharacterRangeForGlyphRange_null_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_null_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterRangeForGlyphRange_utf8_exceed_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_UTF8_EXCEED_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF8 exceed glyph count [0,11] returns actual glyph [0,7]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_utf8_exceed_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_utf8_exceed_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_utf8_exceed'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_utf8_exceed_0100] result = ' + label);
        expect(label).assertContain('char_utf8_exceed:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let charRange = ranges[0].split(',');
        let glyphRange = ranges[1].split(',');
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(11);
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(7);
        console.info('[getCharacterRangeForGlyphRange_utf8_exceed_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_utf8_exceed_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getCharacterRangeForGlyphRange_utf8_single_0100
     * @tc.number SUB_ARKUI_LAYOUTMANAGER_GETCHARRANGE_UTF8_SINGLE_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange with UTF8 single glyph [0,1] returns char range [0,3]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('getCharacterRangeForGlyphRange_utf8_single_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCharacterRangeForGlyphRange_utf8_single_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn_char_utf8_single'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let resultComp = await driver.findComponent(ON.id('text_char_result'));
        let label = await (resultComp?.getText() as Promise<string>);
        console.info('[getCharacterRangeForGlyphRange_utf8_single_0100] result = ' + label);
        expect(label).assertContain('char_utf8_single:');
        let valuePart = label.split(':')[1];
        let ranges = valuePart.split('|');
        let charRange = ranges[0].split(',');
        let glyphRange = ranges[1].split(',');
        expect(parseInt(charRange[0])).assertEqual(0);
        expect(parseInt(charRange[1])).assertEqual(3);
        expect(parseInt(glyphRange[0])).assertEqual(0);
        expect(parseInt(glyphRange[1])).assertEqual(1);
        console.info('[getCharacterRangeForGlyphRange_utf8_single_0100] END');
        done();
      } catch (error) {
        console.error('[getCharacterRangeForGlyphRange_utf8_single_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
