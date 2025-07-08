
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { BarState} from '@ohos.arkui.component'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function scrollBarJsunitt() {
  describe('scrollBarJsunitt', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/scrollBarr',
      }
      const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("scrollBarr" == pages.name)) {
          console.info("get scrollBar success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("scrollBar after each called");
    });

    it('testScrollBar001_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar001_static_01] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar001_static_01] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar001_static_01] direction:" + obj.getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      done();
    });

    it('testScrollBar002_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar002_static_02] START');
      let objectT: Record<string, string> = {
        "directionValue": "ScrollBarDirection.Horizontal"
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "directionObject": JSON.stringify(objectT)
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar002_static_02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar002_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar002_static_02] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      console.info('testScrollBar002_static_02 END');
      done();
    });

    it('testScrollBar003_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar003_static_03] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar003_static_03] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar003_static_03] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off');
      done();
    });

    it('testScrollBar004_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar004_static_04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.On
          } as Record<string, Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar004_static_04] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar004_static_04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar004_static_04] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar004_static_04] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual("BarState.On");
      done();
    });

    it('testScrollBar005_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('[testScrollBar005_static_05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.Auto
          } as Record<string, Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar005_static_05] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("[testScrollBar005_static_05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('scroll');
      console.info("[testScrollBar005_static_05] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScrollBar005_static_05] state:" + obj.getElement('$attrs').getString('state'));
      expect(obj.getElement('$attrs').getString('state')).assertEqual("BarState.Auto");
      done();
    });
  })
}