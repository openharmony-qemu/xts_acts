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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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


export default function btnMonoTouch() {
  describe('btnMonoTouch', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      console.info("btnMonoTouch beforeEach start");
      try {
        const router = AppStorage.get<Router>('router', Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get btnMonoTouch state pages:" + JSON.stringify(pages));
        if (!("btnMonoTouch" == pages.name)) {
          console.info("get  btnMonoTouch pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl({
          //   url: "MainAbility/pages/customGestureTest/btnMonoTouch"
          // })
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/btnMonoTouch"
          })
          await CommonFunc.sleep(2000);
          // console.info("push btnMonoTouch page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnMonoTouch page error:" + err);
      }
      console.info("btnMonoTouch foreEach end");
      // done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnMonoTouch after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_MONOPOLIZE_0020_btnMonoTouch_001
     * @tc.desc button monopolize touch and button touch test
     * @tc.level Level 0
     * @tc.type
     */

    it('btnMonoTouch_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[btnMonoTouch_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id("button2"));
      let button1 = await driver.findComponent(ON.id("button1"));
      await (button2?.click() as Promise<void>);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey("buttonText");
      await CommonFunc.sleep(200);
      console.info("[btnMonoTouch_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') == 'onTouch2 success;onTouch1 success').assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[btnMonoTouch_001] END');
      done();
    });
  })
}
