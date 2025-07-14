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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils2';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback,Message } from '../../../ets/MainAbility/common/MessageManager';
import { Alignment } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface optionsObj {
  uri: string
}
interface eventDataObj {
  data : dataObj
}
interface dataObj {
  alignContentValue : Alignment
}
interface innerEventObj {
  eventId: number
  priority : events_emitter.EventPriority
}

export default function StackAlignContentTest() {
  describe('StackAlignContentTest',  () => {
    beforeAll(() => {
      console.info("StackAlignContentTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("StackAlignContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/stackAlignContentPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackAlignContentTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get StackAlignContentTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StackAlignContentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackAlignContentTest page error:" + err);
      }
      console.info("StackAlignContentTest beforeEach end");
    });
  

    afterEach(async ():Promise<void> => {
      await Utils.sleep(1000);
      console.info("stackAlignContent after each called");
    })

    /**
     * @tc.number testStackAlignContent
     * @tc.name   Test the stackAlignContent property of the gridcol component
     * @tc.desc   set the stackAlignConten property value is number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testStackAlignContent_static', 0, async (done: () => void): Promise<void> => {
      let tagName = 'testStackAlignContent';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('keyAlignContent');
      let obj  = JSON.parseJsonElement(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('$attrs')));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.TopStart");

      try {
        let eventData : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.Top
          } as Record<String,Object>
        }
        let innerEvent : events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keyAlignContent');
      let objNew  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringify(objNew));
      
      expect(objNew.getString('$type')).assertEqual('Stack');
      expect(objNew.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.Top");

      try {
        let eventData2 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.TopEnd
          } as Record<String,Object>
        }
        let innerEvent2 : events_emitter.InnerEvent = {
          eventId: 182,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('keyAlignContent');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[' + tagName + '] component strJson2 is: ' + JSON.stringify(strJson2));
      expect(obj2.getString('$type')).assertEqual('Stack');
      expect(obj2.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.TopEnd");

      try {
        let eventData3 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.Start
          } as Record<String,Object>
        }
        let innerEvent3 : events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('keyAlignContent');
      let obj3  = JSON.parseJsonElement(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + JSON.stringify(strJson3));
      expect(obj3.getString('$type')).assertEqual('Stack');
      expect(obj3.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.Start");

      try {
        let eventData4 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.Center
          } as Record<String,Object>
        }
        let innerEvent4 : events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent4, eventData4);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson4 = inspector.getInspectorByKey('keyAlignContent');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('[' + tagName + '] component strJson4 is: ' + JSON.stringify(strJson4));
      expect(obj4.getString('$type')).assertEqual('Stack');
      expect(obj4.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.Center");

      try {
        let eventData5 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.End
          } as Record<String,Object>
        }
        let innerEvent5 : events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent5, eventData5);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson5 = inspector.getInspectorByKey('keyAlignContent');
      let obj5  = JSON.parseJsonElement(strJson5);
      console.info('[' + tagName + '] component strJson5 is: ' + JSON.stringify(strJson5));
      expect(obj5.getString('$type')).assertEqual('Stack');
      expect(obj5.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.End");
      
      try {
        let eventData6 : events_emitter.EventData = {
          data: {
            "alignContentValue": Alignment.BottomStart
          } as Record<String,Object>
        }
        let innerEvent6 : events_emitter.InnerEvent = {
          eventId: 186,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent6, eventData6);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson6 = inspector.getInspectorByKey('keyAlignContent');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info('[' + tagName + '] component strJson6 is: ' + JSON.stringify(strJson6));
      expect(obj6.getString('$type')).assertEqual('Stack');
      expect(obj6.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.BottomStart");

      try {
        let eventData7 : events_emitter.EventData = {
          data: {
            "alignContentValue":Alignment.Bottom
          } as Record<String,Object>
        }
        let innerEvent7 : events_emitter.InnerEvent = {
          eventId: 187,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent7, eventData7);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson7 = inspector.getInspectorByKey('keyAlignContent');
      let obj7 = JSON.parseJsonElement(strJson7);
      console.info('[' + tagName + '] component strJson7 is: ' + JSON.stringify(strJson7));
      expect(obj7.getString('$type')).assertEqual('Stack');
      expect(obj7.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.Bottom");

       try {
        let eventData8 : events_emitter.EventData = {
          data: {
            "alignContentValue":Alignment.BottomEnd
          } as Record<String,Object>
        }
        let innerEvent8 : events_emitter.InnerEvent = {
          eventId: 188,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent8, eventData8);
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson8 = inspector.getInspectorByKey('keyAlignContent');
      let obj8 = JSON.parseJsonElement(strJson8);
      console.info('[' + tagName + '] component strJson8 is: ' + JSON.stringify(strJson8));
      expect(obj8.getString('$type')).assertEqual('Stack');
      expect(obj8.getElement('$attrs').getString('$attrs')).assertEqual("Alignment.BottomEnd");

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
