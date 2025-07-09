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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function repeatAniGrid() {
  describe('repeatAniGrid', () => {
    beforeAll(() => {
      console.info("repeatAniGrid beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("repeatAniGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/repeatAniGrid",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get repeatAniGrid state pages:" + JSON.stringify(pages));
        if (!("repeatAniGrid" == pages.name)) {
          console.info("get repeatAniGrid pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push repeatAniGrid page error:" + err);
      }
      console.info("repeatAniGrid beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatAniGrid after each called");
    });

    /**
     * @tc.number    repeatAniGrid_001
     * @tc.name      repeatAniGrid_0100
     * @tc.desc      Grid component is loaded using Repeat and set the animation parameter of ScrollPage to true.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('repeatAniGrid_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[repeatAniGrid_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('grid_repeat_animation_true'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('grid_repeat_true_onText');
      console.info("[repeatAniGrid_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[repeatAniGrid_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Grid: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[repeatAniGrid_static_0100] END');
      done();
    });
  })
}
