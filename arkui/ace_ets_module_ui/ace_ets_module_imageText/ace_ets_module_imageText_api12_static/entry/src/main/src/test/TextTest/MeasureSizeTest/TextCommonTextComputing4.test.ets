/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, loadAndSetUpUiTest, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextCommonTextComputing4() {
  describe('TextCommonTextComputing4', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing4 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0160",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing4 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextCommonTextComputing4 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextCommonTextComputing4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCommonTextComputing4 page error:" + err);
      }
      console.info("TextCommonTextComputing4 beforeEach end");
    }); 

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontStyle passes to Normal, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0160', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_normalBtn = await driver.findComponent(ON.id('fontStyle_normal'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await (fontStyle_normalBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0160_1?.getText();
      let width2 = textComputing0160_2?.getText();
      let width12 = textComputing0160_12?.getText();
      let width22 = textComputing0160_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0160] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontStyle passes to Italic, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0170', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_ItalicBtn = await driver.findComponent(ON.id('fontStyle_Italic'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await (fontStyle_ItalicBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0160_1?.getText();
      let width2 = textComputing0160_2?.getText();
      let width12 = textComputing0160_12?.getText();
      let width22 = textComputing0160_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0170] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontStyle passes to -100, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0190', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontStyle_100Btn = await driver.findComponent(ON.id('fontStyle-100'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await (fontStyle_100Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0160_1?.getText();
      let width2 = textComputing0160_2?.getText();
      let width12 = textComputing0160_12?.getText();
      let width22 = textComputing0160_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0190] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontFamily passes to $(app.string.fontFanily), view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0270', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_resBtn = await driver.findComponent(ON.id('fontFamily_res'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await (fontFamily_resBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0160_1?.getText();
      let width2 = textComputing0160_2?.getText();
      let width12 = textComputing0160_12?.getText();
      let width22 = textComputing0160_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0270] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontFamily set value, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0280', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontFamily_ohBtn = await driver.findComponent(ON.id('fontFamily_oh'));
      let textComputing0160_1 = await driver.findComponent(ON.id('textComputing0160_1'));
      let textComputing0160_12 = await driver.findComponent(ON.id('textComputing0160_12'));
      let textComputing0160_2 = await driver.findComponent(ON.id('textComputing0160_2'));
      let textComputing0160_22 = await driver.findComponent(ON.id('textComputing0160_22'));
      await CommonFunc.sleep(500);
      await (fontFamily_ohBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0160_1?.getText();
      let width2 =  textComputing0160_2?.getText();
      let width12 =  textComputing0160_12?.getText();
      let width22 =  textComputing0160_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0280] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}