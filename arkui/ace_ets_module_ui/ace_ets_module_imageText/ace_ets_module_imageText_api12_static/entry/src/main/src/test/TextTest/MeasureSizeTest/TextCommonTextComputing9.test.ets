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
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextCommonTextComputing9() {
  describe('TextCommonTextComputing9', () => {
    beforeAll(() => {
      console.info("TextCommonTextComputing9 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextCommonTextComputing9 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/MeasureSize/TextCommonTextComputing0570",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextCommonTextComputing9 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextCommonTextComputing9 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextCommonTextComputing9 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextCommonTextComputing9 page error:" + err);
      }
      console.info("TextCommonTextComputing9 beforeEach end");
    }); 

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when wordBreak passes to WordBreak.BREAK_ALL, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0570', 0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_allBtn =  await driver.findComponent(ON.id('wordBreak_all'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (wordBreak_allBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 = textComputing0570_1?.getText();
      let width2 = textComputing0570_2?.getText();
      let width12 = textComputing0570_12?.getText();
      let width22 = textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0570] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when wordBreak passes to WordBreak.NORMAL, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0580', 0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_NORMALBtn = await driver.findComponent(ON.id('wordBreak_NORMAL'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (wordBreak_NORMALBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0580] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when wordBreak passes to WordBreak.BREAK_WORD, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0590', 0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let wordBreak_wordBtn = await driver.findComponent(ON.id('wordBreak_word'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (wordBreak_wordBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0590] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when wordBreak does not pass on value, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0600', 0, (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0600] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textIndent passes to 5%, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0610', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_5Btn = await driver.findComponent(ON.id('textIndent-5%'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (textIndent_5Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0610] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textIndent passes to -10, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0620', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_10Btn = await driver.findComponent(ON.id('textIndent-10'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (textIndent_10Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0620] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test MeasureTextSize when textIndent passes to 100, view the return width/size result result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_static_0630', 0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let textIndent_100Btn = await driver.findComponent(ON.id('textIndent_100'));
      let textComputing0570_1 = await driver.findComponent(ON.id('textComputing0570_1'));
      let textComputing0570_12 = await driver.findComponent(ON.id('textComputing0570_12'));
      let textComputing0570_2 = await driver.findComponent(ON.id('textComputing0570_2'));
      let textComputing0570_22 = await driver.findComponent(ON.id('textComputing0570_22'));
      await CommonFunc.sleep(500);
      await (textIndent_100Btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let width1 =  textComputing0570_1?.getText();
      let width2 =  textComputing0570_2?.getText();
      let width12 =  textComputing0570_12?.getText();
      let width22 =  textComputing0570_22?.getText();
      console.log('[SUB_ACE_UI_COMPONENT_TEXT_COMMON_TEXT_COMPUTING_0630] component width1 is: ' + width1 +
        "  width2=" + width2 + " width12=" + width12 + " width22=" + width22);
      await CommonFunc.sleep(500);
      expect(width1).assertEqual(width12);
      expect(width2).assertEqual(width22);
      await CommonFunc.sleep(500);
      done();
    });
  })
}