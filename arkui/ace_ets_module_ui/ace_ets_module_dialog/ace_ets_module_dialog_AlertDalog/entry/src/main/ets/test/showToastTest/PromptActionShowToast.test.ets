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
import { Driver, ON, Component } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function PromptActionShowToastTest() {
  describe('PromptActionShowToastTest', () => {
    const driver = Driver.create();

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptaction/PromptActionShowToastTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PromptActionShowToastTest state success " + JSON.stringify(pages));
        if (!("PromptActionShowToastTest" == pages.name)) {
          console.info("get PromptActionShowToastTest state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await Utils.sleep(1000);
          console.info("push PromptActionShowToastTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PromptActionShowToastTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   promptActionShowToastBottomEmpty_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_BOTTOM_0100
     * @tc.desc   Test promptAction.showToast with bottom property set to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastBottomEmpty_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastBottomEmpty_0100] START');

      try {
        const button = await driver.findComponent(ON.id('btn_toast_bottom_empty'));
        await button.click();
        await Utils.sleep(500);

        // Verify the test result from page state
        let strJson: string = getInspectorByKey('toast_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content as string;

        console.info("[promptActionShowToastBottomEmpty_0100] result: " + resultText);
        expect(resultText).toContain('bottom empty string');
        console.info('[promptActionShowToastBottomEmpty_0100] END');
      } catch (error) {
        console.error('[promptActionShowToastBottomEmpty_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   promptActionShowToastShowModeDefault_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_SHOWMODE_0100
     * @tc.desc   Test promptAction.showToast with showMode set to DEFAULT(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastShowModeDefault_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastShowModeDefault_0100] START');

      try {
        const button = await driver.findComponent(ON.id('btn_toast_showmode_default'));
        await button.click();
        await Utils.sleep(500);

        let strJson: string = getInspectorByKey('toast_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content as string;

        console.info("[promptActionShowToastShowModeDefault_0100] result: " + resultText);
        expect(resultText).toContain('showMode DEFAULT');
        console.info('[promptActionShowToastShowModeDefault_0100] END');
      } catch (error) {
        console.error('[promptActionShowToastShowModeDefault_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   promptActionShowToastShowModeTopMost_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_SHOWMODE_0200
     * @tc.desc   Test promptAction.showToast with showMode set to TOP_MOST(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastShowModeTopMost_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastShowModeTopMost_0100] START');

      try {
        const button = await driver.findComponent(ON.id('btn_toast_showmode_topmost'));
        await button.click();
        await Utils.sleep(500);

        let strJson: string = getInspectorByKey('toast_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content as string;

        console.info("[promptActionShowToastShowModeTopMost_0100] result: " + resultText);
        expect(resultText).toContain('showMode TOP_MOST');
        console.info('[promptActionShowToastShowModeTopMost_0100] END');
      } catch (error) {
        console.error('[promptActionShowToastShowModeTopMost_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   promptActionShowToastEnableHoverModeTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_ENABLEHOVERMODE_0100
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastEnableHoverModeTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastEnableHoverModeTrue_0100] START');

      try {
        const button = await driver.findComponent(ON.id('btn_toast_enablehovermode_true'));
        await button.click();
        await Utils.sleep(500);

        let strJson: string = getInspectorByKey('toast_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content as string;

        console.info("[promptActionShowToastEnableHoverModeTrue_0100] result: " + resultText);
        expect(resultText).toContain('enableHoverMode true');
        console.info('[promptActionShowToastEnableHoverModeTrue_0100] END');
      } catch (error) {
        console.error('[promptActionShowToastEnableHoverModeTrue_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   promptActionShowToastEnableHoverModeFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_ENABLEHOVERMODE_0200
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
it('promptActionShowToastEnableHoverModeFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastEnableHoverModeFalse_0100] START');

      try {
        const button = await driver.findComponent(ON.id('btn_toast_enablehovermode_false'));
        await button.click();
        await Utils.sleep(500);

        let strJson: string = getInspectorByKey('toast_test_result');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        let resultText: string = obj.$attrs.content as string;

        console.info("[promptActionShowToastEnableHoverModeFalse_0100] result: " + resultText);
        expect(resultText).toContain('enableHoverMode false');
        console.info('[promptActionShowToastEnableHoverModeFalse_0100] END');
      } catch (error) {
        console.error('[promptActionShowToastEnableHoverModeFalse_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
    })
  })
}
