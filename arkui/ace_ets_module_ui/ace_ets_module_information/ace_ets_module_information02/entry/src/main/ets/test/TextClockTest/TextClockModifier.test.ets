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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { ON, Driver } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function TextClockModifierTest() {
  describe('TextClockModifierTest', () => {
    let driver: Driver;
    beforeAll(async (done: Function) => {
      driver = await Driver.create();
      console.info('TextClockModifierTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextClockModifierTest state pages:' + JSON.stringify(pages));
        if (!('TextClockModifierPage' == pages.name)) {
          console.info('get TextClockModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextClockModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextClockModifierTest page error:' + err);
      }
      console.info('TextClockModifierTest beforeAll end');
      done();
    });

    /**
     * @tc.name   textClockModifierFontColor_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_ATTRIBUTEMODIFIER_FONTCOLOR_0100
     * @tc.desc   Test TextClock fontColor initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textClockModifierFontColor_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textClockModifierFontColor_0100] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_textclock_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontColor: string = AppStorage.get('textclock_fontColor') as string;
        console.info("[textClockModifierFontColor_0100] fontColor: " + fontColor);
        expect(fontColor).assertEqual('#FFE65100');
      } else {
        expect().assertFail();
      }
      console.info('[textClockModifierFontColor_0100] END');
      done();
    });

    /**
     * @tc.name   textClockModifierFontSize_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_ATTRIBUTEMODIFIER_FONTSIZE_0100
     * @tc.desc   Test TextClock fontSize initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textClockModifierFontSize_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textClockModifierFontSize_0100] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_textclock_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontSize: string = AppStorage.get('textclock_fontSize') as string;
        console.info("[textClockModifierFontSize_0100] fontSize: " + fontSize);
        expect(fontSize).assertEqual('20.00fp');
      } else {
        expect().assertFail();
      }
      console.info('[textClockModifierFontSize_0100] END');
      done();
    });

    /**
     * @tc.name   textClockModifierFontColor_dynamic_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_ATTRIBUTEMODIFIER_FONTCOLOR_0200
     * @tc.desc   Test TextClock fontColor dynamic change by AttributeModifier state change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textClockModifierFontColor_dynamic_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textClockModifierFontColor_dynamic_0100] START');
      let btnChange = await driver.findComponent(ON.id('btn_change_textclock_color'));
      let btnGet = await driver.findComponent(ON.id('btn_get_textclock_attr'));
      if (btnChange && btnGet) {
        await btnChange.click();
        await Utils.sleep(1000);
        await btnGet.click();
        await Utils.sleep(1000);
        let fontColor: string = AppStorage.get('textclock_fontColor') as string;
        console.info("[textClockModifierFontColor_dynamic_0100] fontColor: " + fontColor);
        expect(fontColor).assertEqual('#FF0000FF');
      } else {
        expect().assertFail();
      }
      console.info('[textClockModifierFontColor_dynamic_0100] END');
      done();
    });

    /**
     * @tc.name   textClockModifierFontWeight_dynamic_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_ATTRIBUTEMODIFIER_FONTWEIGHT_0200
     * @tc.desc   Test TextClock fontWeight dynamic change by toggling isBold state in AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textClockModifierFontWeight_dynamic_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textClockModifierFontWeight_dynamic_0100] START');
      let btnToggle = await driver.findComponent(ON.id('btn_toggle_textclock_bold'));
      let btnGet = await driver.findComponent(ON.id('btn_get_textclock_attr'));
      if (btnToggle && btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontWeightBefore: string = AppStorage.get('textclock_fontWeight') as string;
        console.info("[textClockModifierFontWeight_dynamic_0100] before fontWeight: " + fontWeightBefore);

        await btnToggle.click();
        await Utils.sleep(1000);
        await btnGet.click();
        await Utils.sleep(1000);
        let fontWeightAfter: string = AppStorage.get('textclock_fontWeight') as string;
        console.info("[textClockModifierFontWeight_dynamic_0100] after fontWeight: " + fontWeightAfter);
        expect(fontWeightAfter).assertEqual('FontWeight.Bold');
      } else {
        expect().assertFail();
      }
      console.info('[textClockModifierFontWeight_dynamic_0100] END');
      done();
    });
  })
}
