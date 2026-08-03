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

export default function ProgressModifierTest() {
  describe('ProgressModifierTest', () => {
    let driver: Driver;
    beforeAll(async (done: Function) => {
      driver = await Driver.create();
      console.info('ProgressModifierTest beforeAll start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ProgressModifierTest state pages:' + JSON.stringify(pages));
        if (!('ProgressModifierPage' == pages.name)) {
          console.info('get ProgressModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ProgressModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ProgressModifierTest page error:' + err);
      }
      console.info('ProgressModifierTest beforeAll end');
      done();
    });

    /**
     * @tc.name   progressModifierBackgroundColor_0100
     * @tc.number SUB_ARKUI_PROGRESS_ATTRIBUTEMODIFIER_BACKGROUNDCOLOR_0100
     * @tc.desc   Test Progress Linear type backgroundColor initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('progressModifierBackgroundColor_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[progressModifierBackgroundColor_0100] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_progress_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let linearBgColor: string = AppStorage.get('progress_linear_bgColor') as string;
        console.info("[progressModifierBackgroundColor_0100] linearBgColor: " + linearBgColor);
        expect(linearBgColor).assertEqual('#FFFF0000');
      } else {
        expect().assertFail();
      }
      console.info('[progressModifierBackgroundColor_0100] END');
      done();
    });

    /**
     * @tc.name   progressModifierBackgroundColor_0200
     * @tc.number SUB_ARKUI_PROGRESS_ATTRIBUTEMODIFIER_BACKGROUNDCOLOR_0200
     * @tc.desc   Test Progress Ring type backgroundColor initial value set by AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('progressModifierBackgroundColor_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[progressModifierBackgroundColor_0200] START');
      let btnGet = await driver.findComponent(ON.id('btn_get_progress_attr'));
      if (btnGet) {
        await btnGet.click();
        await Utils.sleep(1000);
        let ringBgColor: string = AppStorage.get('progress_ring_bgColor') as string;
        console.info("[progressModifierBackgroundColor_0200] ringBgColor: " + ringBgColor);
        expect(ringBgColor).assertEqual('#FFFF0000');
      } else {
        expect().assertFail();
      }
      console.info('[progressModifierBackgroundColor_0200] END');
      done();
    });

    /**
     * @tc.name   progressModifierBackgroundColor_dynamic_0100
     * @tc.number SUB_ARKUI_PROGRESS_ATTRIBUTEMODIFIER_BACKGROUNDCOLOR_0300
     * @tc.desc   Test Progress backgroundColor dynamic change by AttributeModifier state change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('progressModifierBackgroundColor_dynamic_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[progressModifierBackgroundColor_dynamic_0100] START');
      let btnChange = await driver.findComponent(ON.id('btn_change_progress_color'));
      let btnGet = await driver.findComponent(ON.id('btn_get_progress_attr'));
      if (btnChange && btnGet) {
        await btnChange.click();
        await Utils.sleep(1000);
        await btnGet.click();
        await Utils.sleep(1000);
        let linearBgColor: string = AppStorage.get('progress_linear_bgColor') as string;
        console.info("[progressModifierBackgroundColor_dynamic_0100] linearBgColor: " + linearBgColor);
        expect(linearBgColor).assertEqual('#FF0000FF');
      } else {
        expect().assertFail();
      }
      console.info('[progressModifierBackgroundColor_dynamic_0100] END');
      done();
    });

    /**
     * @tc.name   progressModifierBackgroundColor_dynamic_0200
     * @tc.number SUB_ARKUI_PROGRESS_ATTRIBUTEMODIFIER_BACKGROUNDCOLOR_0400
     * @tc.desc   Test Progress backgroundColor reset by AttributeModifier state change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('progressModifierBackgroundColor_dynamic_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[progressModifierBackgroundColor_dynamic_0200] START');
      let btnChange = await driver.findComponent(ON.id('btn_change_progress_color'));
      let btnReset = await driver.findComponent(ON.id('btn_reset_progress_color'));
      let btnGet = await driver.findComponent(ON.id('btn_get_progress_attr'));
      if (btnChange && btnReset && btnGet) {
        await btnChange.click();
        await Utils.sleep(500);
        await btnGet.click();
        await Utils.sleep(500);
        let bgColor1: string = AppStorage.get('progress_linear_bgColor') as string;
        expect(bgColor1).assertEqual('#FF0000FF');

        await btnReset.click();
        await Utils.sleep(500);
        await btnGet.click();
        await Utils.sleep(500);
        let bgColor2: string = AppStorage.get('progress_linear_bgColor') as string;
        expect(bgColor2).assertEqual('#FFFF0000');
      } else {
        expect().assertFail();
      }
      console.info('[progressModifierBackgroundColor_dynamic_0200] END');
      done();
    });
  })
}
