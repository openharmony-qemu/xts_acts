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

export default function TextCommonTextComputing5() {
  describe('TextCommonTextComputing5', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing5 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing5 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0200",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing5 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextCommonTextComputing5 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextCommonTextComputing5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCommonTextComputing5 page error:" + err);
      }
      console.info("TextCommonTextComputing5 beforeEach end");
    }); 

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Bold, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_BoldBtn = await driver.findComponent(ON.id('fontWeight_Bold'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_BoldBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0200_1?.getText();
      let width2 =  textComputing0200_2?.getText();
      let width12 =  textComputing0200_12?.getText();
      let width22 =  textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0200] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Medium, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0210', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_MediumBtn = await driver.findComponent(ON.id('fontWeight_Medium'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_MediumBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0200_1?.getText();
      let width2 =  textComputing0200_2?.getText();
      let width12 =  textComputing0200_12?.getText();
      let width22 =  textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0210] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Lighter, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0220', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_LighterBtn = await driver.findComponent(ON.id('fontWeight_Lighter'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_LighterBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0200_1?.getText();
      let width2 =  textComputing0200_2?.getText();
      let width12 =  textComputing0200_12?.getText();
      let width22 =  textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0220] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to Normal, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0230', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_NormalBtn = await driver.findComponent(ON.id('fontWeight_Normal'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_NormalBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0200_1?.getText();
      let width2 = textComputing0200_2?.getText();
      let width12 = textComputing0200_12?.getText();
      let width22 = textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0230] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to 200, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0240', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_200Btn = await driver.findComponent(ON.id('fontWeight_200'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_200Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0200_1?.getText();
      let width2 = textComputing0200_2?.getText();
      let width12 = textComputing0200_12?.getText();
      let width22 = textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0240] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to 500, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0250', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_500Btn = await driver.findComponent(ON.id('fontWeight_500'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_500Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0200_1?.getText();
      let width2 =  textComputing0200_2?.getText();
      let width12 =  textComputing0200_12?.getText();
      let width22 =  textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0250] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontWeight passes to -700, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0260', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontWeight_700Btn = await driver.findComponent(ON.id('fontWeight_-700'));
      let textComputing0200_1 = await driver.findComponent(ON.id('textComputing0200_1'));
      let textComputing0200_12 = await driver.findComponent(ON.id('textComputing0200_12'));
      let textComputing0200_2 = await driver.findComponent(ON.id('textComputing0200_2'));
      let textComputing0200_22 = await driver.findComponent(ON.id('textComputing0200_22'));
      await CommonFunc.sleep(500);
      await (fontWeight_700Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0200_1?.getText();
      let width2 =  textComputing0200_2?.getText();
      let width12 =  textComputing0200_12?.getText();
      let width22 =  textComputing0200_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0260] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}