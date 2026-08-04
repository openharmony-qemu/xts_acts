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

export default function TextTimerModifierTest() {
  describe('TextTimerModifierTest', () => {
    let driver: Driver;
    beforeAll(async (done: Function) => {
      driver = await Driver.create();
      console.info('TextTimerModifierTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextTimerModifierTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerModifierPage' == pages.name)) {
          console.info('get TextTimerModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextTimerModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextTimerModifierTest page error:' + err);
      }
      console.info('TextTimerModifierTest beforeAll end');
      done();
    });

    /**
     * @tc.name   textTimerModifierFontColor_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_ATTRIBUTEMODIFIER_FONTCOLOR_0100
     * @tc.desc   Test TextTimer fontColor initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textTimerModifierFontColor_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textTimerModifierFontColor_0100] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_texttimer_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontColor: string = AppStorage.get('texttimer_fontColor') as string;
        console.info("[textTimerModifierFontColor_0100] fontColor: " + fontColor);
        expect(fontColor).assertEqual('#FFFFC0CB');
      } else {
        expect().assertFail();
      }
      console.info('[textTimerModifierFontColor_0100] END');
      done();
    });

    /**
     * @tc.name   textTimerModifierFontSize_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_ATTRIBUTEMODIFIER_FONTSIZE_0100
     * @tc.desc   Test TextTimer fontSize initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textTimerModifierFontSize_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textTimerModifierFontSize_0100] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_texttimer_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontSize: string = AppStorage.get('texttimer_fontSize') as string;
        console.info("[textTimerModifierFontSize_0100] fontSize: " + fontSize);
        expect(fontSize).assertEqual('20.00fp');
      } else {
        expect().assertFail();
      }
      console.info('[textTimerModifierFontSize_0100] END');
      done();
    });

    /**
     * @tc.name   textTimerModifierFontColor_dynamic_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_ATTRIBUTEMODIFIER_FONTCOLOR_0200
     * @tc.desc   Test TextTimer fontColor dynamic change by AttributeModifier state change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textTimerModifierFontColor_dynamic_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textTimerModifierFontColor_dynamic_0100] START');
      let btnChange = await driver.findComponent(ON.id('btn_change_texttimer_color'));
      let btnGet = await driver.findComponent(ON.id('btn_get_texttimer_attr'));
      if (btnChange && btnGet) {
        await btnChange.click();
        await Utils.sleep(1000);
        await btnGet.click();
        await Utils.sleep(1000);
        let fontColor: string = AppStorage.get('texttimer_fontColor') as string;
        console.info("[textTimerModifierFontColor_dynamic_0100] fontColor: " + fontColor);
        expect(fontColor).assertEqual('#FFFF0000');
      } else {
        expect().assertFail();
      }
      console.info('[textTimerModifierFontColor_dynamic_0100] END');
      done();
    });

    /**
     * @tc.name   textTimerModifierFontWeight_dynamic_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_ATTRIBUTEMODIFIER_FONTWEIGHT_0200
     * @tc.desc   Test TextTimer fontWeight dynamic change by toggling isBold state in AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('textTimerModifierFontWeight_dynamic_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[textTimerModifierFontWeight_dynamic_0100] START');
      let btnToggle = await driver.findComponent(ON.id('btn_toggle_texttimer_bold'));
      let btnGet = await driver.findComponent(ON.id('btn_get_texttimer_attr'));
      if (btnToggle && btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let fontWeightBefore: string = AppStorage.get('texttimer_fontWeight') as string;
        console.info("[textTimerModifierFontWeight_dynamic_0100] before fontWeight: " + fontWeightBefore);

        await btnToggle.click();
        await Utils.sleep(1000);
        await btnGet.click();
        await Utils.sleep(1000);
        let fontWeightAfter: string = AppStorage.get('texttimer_fontWeight') as string;
        console.info("[textTimerModifierFontWeight_dynamic_0100] after fontWeight: " + fontWeightAfter);
        expect(fontWeightAfter).assertEqual('FontWeight.Bold');
      } else {
        expect().assertFail();
      }
      console.info('[textTimerModifierFontWeight_dynamic_0100] END');
      done();
    });
  })
}
