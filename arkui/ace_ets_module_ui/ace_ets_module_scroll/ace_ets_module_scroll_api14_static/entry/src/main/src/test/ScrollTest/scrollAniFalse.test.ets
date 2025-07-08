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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test';

let testAbilityContext:common.UIAbilityContext;
let domain: number = 0x0000;
let tag: string = 'testTag';


export default function scrollAniFalse() {
  describe('scrollAniFalse', () => {

    beforeAll(() => {
      console.info("scrollAniFalse beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollAniFalse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollAniFalse",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scrollAniFalse state pages:" + JSON.stringify(pages));
        if (!("scrollAniFalse" == pages.name)) {
          console.info("get scrollAniFalse pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scrollAniFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollAniFalse page error:" + err);
      }
      console.info("scrollAniFalse beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollAniFalse after each called");
    });

    /**
     * @tc.number    scrollAniFalse_001
     * @tc.name      scrollAniFalse_static_0100
     * @tc.desc      Set the animation parameter of ScrollPage to false.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('scrollAniFalse_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[scrollAniFalse_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_animation_false')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll_false_onText');
      console.info("[scrollAniFalse_static_0100] component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[scrollAniFalse_static_0100] content: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Scroll: onWillScroll-onDidScroll-');
      console.info('[scrollAniFalse_static_0100] END');
      done();
    });
  })
}
