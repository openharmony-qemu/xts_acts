
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
import { Visibility } from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

const uiContext = new UIContext();

export default function visibilityJsunit() {
  describe('visibilityTest', () => {
    beforeAll(() => {
      console.info("visibilityJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("visibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/visibility/visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get visibilityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get visibilityTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push visibilityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push visibilityTest page error:" + err);
      }
      console.info("visibilityTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });

    it('testVisibility_static_01', 0, async () => {
      console.info('[testVisibility01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      
      console.info("[testVisibility01] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[testVisibility01] END');

    });

    it('testVisibility_static_02', 0, async () => {
      console.info('[testVisibility02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.Hidden,
          } as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testVisibility02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      
      console.info("[testVisibility02] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      console.info('[testVisibility02] END');

    });

    it('testVisibility_static_03', 0, async () => {
      console.info('[testVisibility03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.None,
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 48,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility03] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testVisibility03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      
      console.info("[testVisibility03] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      console.info('[testVisibility03] END');

    });

    it('testVisibility_static_04', 0, async () => {
      console.info('[testVisibility04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": 0.11111
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1116,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility04] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testVisibility04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      
      console.info("[testVisibility04] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[testVisibility04] END');
    });

    it('testVisibility_static_05', 0, async () => {
      console.info('[testVisibility05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": 'nothing',
          }as Record<string,object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1116,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility05] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testVisibility05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      console.info("[testVisibility05] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[testVisibility05] END');
    });
  })
}
