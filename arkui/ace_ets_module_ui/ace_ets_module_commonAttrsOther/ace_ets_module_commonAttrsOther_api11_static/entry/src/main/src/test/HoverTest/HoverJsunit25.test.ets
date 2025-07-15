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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, Point,Rect, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import  display   from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function HoverJsunit25() {
  describe('HoverJsunit25', () => {
    beforeAll(() => {
      console.info("HoverJsunit25 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("HoverJsunit25 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/Hover/Hover25',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HoverJsunit25 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get HoverJsunit25 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push HoverJsunit25 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HoverJsunit25 page error:" + err);
      }
      console.info("HoverJsunit25 beforeEach end");
    });


    it('HoverJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('HoverJsunit_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover25');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit25sun] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');
      console.info('[HoverJsunit_0100] END');
      done();
    });

    it('HoverJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('HoverJsunit_0200 START');
      let driver =  Driver.create()
      let buttonCl = await driver.findComponent(ON.id('hover25'));
      await CommonFunc.sleep(500);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo({x:point.x , y:point.y })
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('hover25');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFC0CB');
      console.info('[HoverJsunit_0200] END');
      done();
    });





  })
}

