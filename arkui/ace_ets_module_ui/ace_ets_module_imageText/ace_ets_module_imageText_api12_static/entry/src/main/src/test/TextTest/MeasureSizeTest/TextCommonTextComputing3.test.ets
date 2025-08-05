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

export default function TextCommonTextComputing3() {
  describe('TextCommonTextComputing3', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing3 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0110",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing3 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextCommonTextComputing3 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextCommonTextComputing3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCommonTextComputing3 page error:" + err);
      }
      console.info("TextCommonTextComputing3 beforeEach end");
    }); 

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0110
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontSize passes to 20fp, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0110', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0110 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontSize_20Btn = await driver.findComponent(ON.id('fontSize_20'));
      let textComputing0110_1 = await driver.findComponent(ON.id('textComputing0110_1'));
      let textComputing0110_12 = await driver.findComponent(ON.id('textComputing0110_12'));
      let textComputing0110_2 = await driver.findComponent(ON.id('textComputing0110_2'));
      let textComputing0110_22 = await driver.findComponent(ON.id('textComputing0110_22'));
      await CommonFunc.sleep(500);
      await (fontSize_20Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0110_1?.getText();
      let width2 = textComputing0110_2?.getText();
      let width12 = textComputing0110_12?.getText();
      let width22 = textComputing0110_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0110] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0120
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontSize passes to $-30, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0120', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0120 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontSize_30Btn = await driver.findComponent(ON.id('fontSize_30'));
      let textComputing0110_1 = await driver.findComponent(ON.id('textComputing0110_1'));
      let textComputing0110_12 = await driver.findComponent(ON.id('textComputing0110_12'));
      let textComputing0110_2 = await driver.findComponent(ON.id('textComputing0110_2'));
      let textComputing0110_22 = await driver.findComponent(ON.id('textComputing0110_22'));
      await CommonFunc.sleep(500);
      await (fontSize_30Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0110_1?.getText();
      let width2 = textComputing0110_2?.getText();
      let width12 = textComputing0110_12?.getText();
      let width22 = textComputing0110_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0120] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0130
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontSize passes to -10, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0130', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0130 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontSize_10Btn = await driver.findComponent(ON.id('fontSize_-10'));
      let textComputing0110_1 = await driver.findComponent(ON.id('textComputing0110_1'));
      let textComputing0110_12 = await driver.findComponent(ON.id('textComputing0110_12'));
      let textComputing0110_2 = await driver.findComponent(ON.id('textComputing0110_2'));
      let textComputing0110_22 = await driver.findComponent(ON.id('textComputing0110_22'));
      await CommonFunc.sleep(500);
      await (fontSize_10Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0110_1?.getText();
      let width2 = textComputing0110_2?.getText();
      let width12 = textComputing0110_12?.getText();
      let width22 = textComputing0110_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0130] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0140
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontSize passes to calc(20%-20px), view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0140', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0140 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontSize_calcBtn = await driver.findComponent(ON.id('fontSize_calc'));
      let textComputing0110_1 = await driver.findComponent(ON.id('textComputing0110_1'));
      let textComputing0110_12 = await driver.findComponent(ON.id('textComputing0110_12'));
      let textComputing0110_2 = await driver.findComponent(ON.id('textComputing0110_2'));
      let textComputing0110_22 = await driver.findComponent(ON.id('textComputing0110_22'));
      await CommonFunc.sleep(500);
      await (fontSize_calcBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0110_1?.getText();
      let width2 = textComputing0110_2?.getText();
      let width12 = textComputing0110_12?.getText();
      let width22 = textComputing0110_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0140] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0150
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when fontSize passes to 50%, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0150', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0150 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let fontSize_50Btn = await driver.findComponent(ON.id('fontSize_50%'));
      let textComputing0110_1 = await driver.findComponent(ON.id('textComputing0110_1'));
      let textComputing0110_12 = await driver.findComponent(ON.id('textComputing0110_12'));
      let textComputing0110_2 = await driver.findComponent(ON.id('textComputing0110_2'));
      let textComputing0110_22 = await driver.findComponent(ON.id('textComputing0110_22'));
      await CommonFunc.sleep(500);
      await (fontSize_50Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0110_1?.getText();
      let width2 = textComputing0110_2?.getText();
      let width12 = textComputing0110_12?.getText();
      let width22 = textComputing0110_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0150] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}