/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import {Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON, loadAndSetUpUiTest} from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function DragInteractionOptionsTest() {

  describe('DragInteractionOptionsTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragInteractionOptions',
      }
      try {
        const router = AppStorage.get<Router>('router', Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get DragInteractionOptions state pages: " + JSON.stringify(pages));
        if (!("DragInteractionOptions" == pages.name)) {
          console.info("get DragInteractionOptions state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DragInteractionOptions success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DragInteractionOptions page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DragInteractionOptions after each called");
    });

    /**
     * @tc.number    DragInteractionOptions_0010
     * @tc.name      DragInteractionOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DragInteractionOptions_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DragInteractionOptions_0010 START');
      let driver = Driver.create()
      let grid = await driver.findComponent(ON.id('DragInteractionOptionsGridItem1'));
      let button = await driver.findComponent(ON.id('dragPreviewOptions_button'));
      await (grid?.dragTo(button!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dragPreviewOptions_button');
      let obj = JSON.parseJsonElement(strJson);
      let strJson1 = inspector.getInspectorByKey('DragInteractionOptionsGridItem1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1));
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1.getElement('$attrs')));
      console.info("[DragInteractionOptions_0010] dragPreviewOptions: " + JSON.stringify(obj1.getElement('$attrs').getElement('mode')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('drag succ');
      console.info('[DragInteractionOptions_0010] END');
      done();
    });

    /**
     * @tc.number    DragInteractionOptions_0020
     * @tc.name      DragInteractionOptions
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('DragInteractionOptions_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DragInteractionOptions_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('dragPreviewOptions_button'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let grid = await driver.findComponent(ON.id('DragInteractionOptionsGridItem1'));
      await (grid?.dragTo(button1!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dragPreviewOptions_button');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DragInteractionOptions_0020] dragPreviewOptions: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('drag succ');
      console.info('[DragInteractionOptions_0020] END');
      done();
    });
  })
}
