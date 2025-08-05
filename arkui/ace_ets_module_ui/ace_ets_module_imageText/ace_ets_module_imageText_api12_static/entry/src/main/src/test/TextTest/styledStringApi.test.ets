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
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, loadAndSetUpUiTest} from '@ohos.UiTest';
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

export default function styledStringApi() {
  describe('styledStringApi', () => {
    beforeAll(() => {
      console.info("styledStringApi beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("styledStringApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/styledStringApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get styledStringApi state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get styledStringApi pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push styledStringApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push styledStringApi page error:" + err);
      }
      console.info("styledStringApi beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringApi after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Styled_String_001
     * @tc.desc      appendStyledString test of Styled_String
     * @tc.level     Level 3
     * @tc.type
     */

    it('styledStringApi_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[styledStringApi_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringBt1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringBt3'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('tring');
      console.info('[styledStringApi_001] END');
      done();

    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_Styled_String_002
     * @tc.desc      insertStyledString test of Styled_String
     * @tc.level     Level 3
     * @tc.type
     */

    it('styledStringApi_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('[styledStringApi_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('styledStringBt2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('styledStringBt3'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('styledStringText');
      // await CommonFunc.sleep(200);
      // let obj  = JSON.parseJsonElement(strJson);
      // console.info("[styledStringApi_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      // expect(obj.getElement('$attrs').getString('content')).assertEqual('string');
      console.info('[styledStringApi_002] END');
      done();

    });





  })
}
