
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
import events_emitter from '@ohos.events.emitter';
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

export default function zIndexJsunit() {
  describe('zIndexTest', () => {
    beforeAll(() => {
      console.info("zIndexJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("zIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/zIndex/zIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get zIndexTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get zIndexTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push zIndexTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push zIndexTest page error:" + err);
      }
      console.info("zIndexTest beforeEach end");
    });

       afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("zIndex after each called");
    });

    it('testZIndex_static_01', 0, async () => {
      console.info('[testZIndex01] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('zIndex');
      console.info("[testZIndex01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getString('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('zIndex')).assertEqual(1);
      console.info('[testZIndex01] END');

    });

    it('testZIndex_static_02', 0, async () => {
      console.info('[testZIndex02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": 4
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 236,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testZIndex02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('zIndex');
      console.info("[testZIndex02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('zIndex')).assertEqual(4);
      console.info('testZIndex02 END');

    });

    it('testZIndex_static_03', 0, async () => {
      console.info('[testZIndex03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": -5
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 236,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testZIndex03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('zIndex');
      console.info("[testZIndex03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('zIndex')).assertEqual(-5);
      console.info('testZIndex03 END');

    });

    it('testZIndex_static_04', 0, async () => {
      console.info('[testZIndex04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": 889900444
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1113,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testZIndex04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('zIndex');
      console.info("[testZIndex04] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('zIndex')).assertEqual(889900444);
      console.info('testZIndex04 END');
    });
  })
}
