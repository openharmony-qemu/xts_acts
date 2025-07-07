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
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { Direction } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function direction2Jsunit() {
  describe('direction2Jsunit', () =>{
    beforeAll(() => {
      console.info("direction2Jsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/direction2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get direction state success " + "");
        if (!("direction2" == pages.name)) {
          console.info("get direction state success " + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push direction page success " + "");
        }
      } catch (err) {
        console.error("push direction page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("direction after each called");
    });

    it('direction2Test_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('direction2Test_static_0200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction": Direction.Rtl,
          } as Record<String,Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1082,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("direction2Test_static_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("direction2Test_static_0200 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('direction_2');
     let objNew = JSON.parseJsonElement(strJsonNew);
     console.info("direction2Test_static_0200 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      console.info('direction2Test_static_0200 END');
      done();
    });

   it('direction2Test_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('direction2Test_static_0100 START');
      let strJson = inspector.getInspectorByKey('direction_2');
      console.info("direction2Test_static_0100 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("direction2Test_static_0100 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('direction')).assertEqual("Direction.Rtl");
      done();
    });

    it('direction2Test_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('direction2Test_static_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction":  Direction.Auto,
          } as Record<String,Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1083,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("direction2Test_static_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("direction2Test_static_0300 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('direction_2');
     let objNew = JSON.parseJsonElement(strJsonNew);
     console.info("direction2Test_static_0300 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      console.info('direction2Test_static_0300 END');
      done();
    });
  })
}