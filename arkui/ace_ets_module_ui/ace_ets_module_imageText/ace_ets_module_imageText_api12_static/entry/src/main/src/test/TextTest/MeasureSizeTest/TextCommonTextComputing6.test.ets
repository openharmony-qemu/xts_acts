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

export default function TextCommonTextComputing6() {
  describe('TextCommonTextComputing6', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing6 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0290",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing6 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextCommonTextComputing6 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextCommonTextComputing6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCommonTextComputing6 page error:" + err);
      }
      console.info("TextCommonTextComputing6 beforeEach end");
    }); 

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to 10vp, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0290', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_10vpBtn = await driver.findComponent(ON.id('letterSpacing_10vp'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (letterSpacing_10vpBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0290] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to -5, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0310', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_5Btn = await driver.findComponent(ON.id('letterSpacing_-5'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (letterSpacing_5Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0310] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when letterSpacing passes to 20, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0320', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let letterSpacing_20Btn = await driver.findComponent(ON.id('letterSpacing_20'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (letterSpacing_20Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0320] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.End, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0330', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_endBtn = await driver.findComponent(ON.id('textAlign_end'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (textAlign_endBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0330] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.JUSTIFY, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0340', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_JUSTIFYBtn = await driver.findComponent(ON.id('textAlign_JUSTIFY'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (textAlign_JUSTIFYBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0340] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textAlign passes to TextAlign.Start, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0360', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360 START');
      await CommonFunc.sleep(1000);
      let driver =  Driver.create();
      await CommonFunc.sleep(500);
      let textAlign_StartBtn = await driver.findComponent(ON.id('textAlign_Start'));
      let textComputing0290_1 = await driver.findComponent(ON.id('textComputing0290_1'));
      let textComputing0290_12 = await driver.findComponent(ON.id('textComputing0290_12'));
      let textComputing0290_2 = await driver.findComponent(ON.id('textComputing0290_2'));
      let textComputing0290_22 = await driver.findComponent(ON.id('textComputing0290_22'));
      await CommonFunc.sleep(500);
      await (textAlign_StartBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0290_1?.getText();
      let width2 =  textComputing0290_2?.getText();
      let width12 =  textComputing0290_12?.getText();
      let width22 =  textComputing0290_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0360] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}