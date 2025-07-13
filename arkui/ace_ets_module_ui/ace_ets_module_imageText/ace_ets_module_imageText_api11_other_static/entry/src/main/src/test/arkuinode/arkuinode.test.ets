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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../main/index";
import router from '@ohos.router';
import CommonFunc from '../../../../../src/main/ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import {
  State,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage
} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {Component, Driver, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function arkuiNodeTest() {
  describe('arkuiNodeTest', () => {
    beforeAll(() => {
      console.info("arkuiNodeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("arkuiNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/NodeContainer/arkuinode/arkui_node",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MarqueeDynamicSyncSceneTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get MarqueeDynamicSyncSceneTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MarqueeDynamicSyncSceneTest page error:" + err);
      }
      console.info("MarqueeDynamicSyncSceneTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arkuinode after each called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUINODE_0100
     * @tc.name      testarkuinode
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('arkuinode_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[arkuinode_static_0100] START');
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('nodeButton');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("arkuinode_static_0100 json info " + JSON.stringify(json));
      expect(Obj1.getElement('$attrs').getString('label')).assertEqual('button this is a string');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      // rebuild
      let btn1 = await driver.findComponent(ON.id('nodeButton'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let json2 = inspector.getInspectorByKey('nodeButton');
      let Obj2 = JSON.parseJsonElement(json2);
      expect(Obj2.getElement('$attrs').getString('label')).assertEqual('button this is a string');
      console.info('[arkuinode_static_0100] END');
      done();
    });

  })
}
