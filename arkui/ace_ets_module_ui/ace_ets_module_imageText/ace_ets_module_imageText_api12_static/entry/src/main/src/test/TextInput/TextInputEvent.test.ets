/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextInputEvent() {
  describe('TextInputEvent', () => {
    beforeAll(() => {
      console.info("TextInputEvent beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputEvent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputEvent state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextInputEvent pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextInputEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEvent page error:" + err);
      }
      console.info("TextInputEvent beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputEvent after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0010
     * @tc.name       : TextInputEvent_001
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await (text?.inputText('9') as Promise<void>);
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[TextInputEvent_001] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0020
     * @tc.name       : TextInputEvent_002
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent2'));
      let point:Point = await (text?.getBoundsCenter() as Promise<Point>);
      await driver.inputText(point,'9');
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[TextInputEvent_002] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0030
     * @tc.name       : TextInputEvent_003
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_003', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      let point: Point = await (text?.getBoundsCenter() as Promise<Point>);
      await driver.inputText(point, '123');
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[TextInputEvent_003] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0040
     * @tc.name       : TextInputEvent_004
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_004', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent2'));
      let point: Point  = await (text?.getBoundsCenter() as Promise<Point>);
      await driver.inputText(point, '3');
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[TextInputEvent_004] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0090
     * @tc.name       : TextInputEvent_005
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_005', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_005] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await (text?.inputText('123')as Promise<void>);
      await CommonFunc.sleep(1000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText3')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText4');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_005] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[TextInputEvent_005] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0110
     * @tc.name       : TextInputEvent_006
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_006', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_006] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent'));
      await (text?.inputText('123')as Promise<void>);
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await (text?.clearText()as Promise<void>);
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText5')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText6');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_006] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[TextInputEvent_006] END');
      done();

    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TEXT_INPUT_DELETE_CALLBACK_0110
     * @tc.name       : TextInputEvent_007
     * @tc.desc       : onWillInsert Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TextInputEvent_static_007', 0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEvent_007] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInputEvent3'));
      await (text?.inputText('123')as Promise<void>);
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await (text?.clearText()as Promise<void>);
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('TextInputEventText5')
      let strJson2 = inspector.getInspectorByKey('TextInputEventText6');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[TextInputEvent_007] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('4');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[TextInputEvent_007] END');
      done();

    });

  })
}
