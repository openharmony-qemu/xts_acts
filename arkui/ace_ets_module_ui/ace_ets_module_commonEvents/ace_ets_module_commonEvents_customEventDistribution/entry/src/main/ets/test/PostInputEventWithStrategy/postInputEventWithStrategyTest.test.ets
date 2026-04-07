/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@kit.TestKit';
import CommonFunc from '../../MainAbility/common/Common'

export default function postInputEventWithStrategyTest() {
  describe('postInputEventWithStrategyTest', () => {
    beforeAll(async () => {
      console.info("[postInputEventWithStrategyTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PostInputEventWithStrategy/PostInputEventWithStrategyTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[postInputEventWithStrategyTest] get state success " + JSON.stringify(pages));
        if (!("PostInputEventWithStrategyTest" == pages.name)) {
          console.info("[postInputEventWithStrategyTest] page name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("[postInputEventWithStrategyTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[postInputEventWithStrategyTest] push page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   postInputEventWithStrategyEventNullV24001
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_001
     * @tc.desc   Test postInputEventWithStrategy with null event parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyEventNullV24001', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyEventNullV24001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnEventNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyEventNullV24001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('EventNull');
      console.info('[postInputEventWithStrategyEventNullV24001] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyEventUndefinedV24002
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_002
     * @tc.desc   Test postInputEventWithStrategy with undefined event parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyEventUndefinedV24002', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyEventUndefinedV24002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnEventUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyEventUndefinedV24002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('EventUndefined');
      console.info('[postInputEventWithStrategyEventUndefinedV24002] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyStrategyNullV24003
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_003
     * @tc.desc   Test postInputEventWithStrategy with null strategy parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyStrategyNullV24003', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyStrategyNullV24003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      await eventArea.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnStrategyNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyStrategyNullV24003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('StrategyNull');
      console.info('[postInputEventWithStrategyStrategyNullV24003] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyStrategyUndefinedV24004
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_004
     * @tc.desc   Test postInputEventWithStrategy with undefined strategy parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyStrategyUndefinedV24004', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyStrategyUndefinedV24004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      await eventArea.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnStrategyUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyStrategyUndefinedV24004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('StrategyUndefined');
      console.info('[postInputEventWithStrategyStrategyUndefinedV24004] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyTouchDefaultV24005
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_005
     * @tc.desc   Test postInputEventWithStrategy with TouchEvent and CompetitionStrategy.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyTouchDefaultV24005', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyTouchDefaultV24005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btnDefault = await driver.findComponent(ON.id('btnDefault'));
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      await eventArea.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyTouchDefaultV24005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Touch_DEFAULT');
      console.info('[postInputEventWithStrategyTouchDefaultV24005] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyTouchCompetitionV24006
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_006
     * @tc.desc   Test postInputEventWithStrategy with TouchEvent and CompetitionStrategy.COMPETITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyTouchCompetitionV24006', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyTouchCompetitionV24006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btnCompetition = await driver.findComponent(ON.id('btnCompetition'));
      await btnCompetition.click();
      await CommonFunc.sleep(500);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      await eventArea.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyTouchCompetitionV24006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Touch_COMPETITION');
      console.info('[postInputEventWithStrategyTouchCompetitionV24006] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyMouseDefaultV24007
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_007
     * @tc.desc   Test postInputEventWithStrategy with MouseEvent and CompetitionStrategy.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyMouseDefaultV24007', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyMouseDefaultV24007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btnDefault = await driver.findComponent(ON.id('btnDefault'));
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      let bounds = await eventArea.getBounds();
      let centerX = (bounds.left + bounds.right) / 2;
      let centerY = (bounds.top + bounds.bottom) / 2;
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyMouseDefaultV24007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Mouse_DEFAULT');
      console.info('[postInputEventWithStrategyMouseDefaultV24007] END');
    });

    /**
     * @tc.name   postInputEventWithStrategyMouseCompetitionV24008
     * @tc.number SUB_ARKUI_POSTINPUTEVENTWITHSTRATEGY_PARAM_008
     * @tc.desc   Test postInputEventWithStrategy with MouseEvent and CompetitionStrategy.COMPETITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('postInputEventWithStrategyMouseCompetitionV24008', Level.LEVEL0, async () => {
      console.info('[postInputEventWithStrategyMouseCompetitionV24008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btnCompetition = await driver.findComponent(ON.id('btnCompetition'));
      await btnCompetition.click();
      await CommonFunc.sleep(500);
      let eventArea = await driver.findComponent(ON.id('eventArea'));
      let bounds = await eventArea.getBounds();
      let centerX = (bounds.left + bounds.right) / 2;
      let centerY = (bounds.top + bounds.bottom) / 2;
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PostInputEventWithStrategyResultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[postInputEventWithStrategyMouseCompetitionV24008] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Mouse_COMPETITION');
      console.info('[postInputEventWithStrategyMouseCompetitionV24008] END');
    });
  })
}