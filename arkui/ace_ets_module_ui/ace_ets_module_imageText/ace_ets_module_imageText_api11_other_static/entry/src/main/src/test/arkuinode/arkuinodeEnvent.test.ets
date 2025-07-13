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
import {Component, Driver, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
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

export default function arkuiNodeEventTest() {
  describe('arkuiNodeEventTest', (): void => {

    beforeAll(() => {
      console.info("arkuiNodeEventTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("arkuiNodeEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/NodeContainer/arkuinode/arkuinodeEvent",
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
          // console.info("push MarqueeDynamicSyncSceneTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueeDynamicSyncSceneTest page error:" + err);
      }
      console.info("MarqueeDynamicSyncSceneTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("arkuiNodeEventTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_arkuinodeEvent0100
     * @tc.name      testarkuinodeevent_0100
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('arkuinodeevent_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[rkuinodeevent_static_0100] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let btn1 = await driver.findComponent(ON.id('nodeTest'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let json = inspector.getInspectorByKey('nodeeventButton');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("rkuinodeevent_static_0100 json info " + JSON.stringify(json));
      expect(Obj1.getElement('$attrs').getString('label')).assertEqual('button this is a string');


      done();
    });

    /**
     * @tc.number    SUB_ACE_arkuinodeEvent0200
     * @tc.name      testarkuinodeevent_0200
     * @tc.desc      test postTouchEvent
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('arkuinodeevent_static_0200', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[arkuinodeevent_static_0200] START');
      await CommonFunc.sleep(2000);
      // touch
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await driver.findComponent(ON.id('columnTest'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let json = inspector.getInspectorByKey('nodeeventButton');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("arkuinodeevent_static_0200 json info " + JSON.stringify(json));
      expect(Obj1.getElement('$attrs').getString('label')).assertEqual('button this is a string');

      done();
    });

  })
}
