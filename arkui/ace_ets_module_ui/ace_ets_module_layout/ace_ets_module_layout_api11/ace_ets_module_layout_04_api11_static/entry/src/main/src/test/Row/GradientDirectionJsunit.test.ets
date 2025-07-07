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
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GradientDirection } from '@ohos.arkui.component'
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

export default function gradientDirectionJsunit() {
  describe('gradientDirectionJsunit', () => {
    beforeAll(() => {
      console.info("gradientDirectionJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info('beforeEach ===================GradientDirection test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/gradientDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('beforeEach get GradientDirection state pages:' + "");
        if (!('gradientDirection' == pages.name)) {
          console.info('beforeEach get GradientDirection state pages.name:' + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info('beforeEach push GradientDirection page result:' + "");
        }
      } catch (err) {
        console.error('beforeEach push GradientDirection page error:' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('[ afterEach ] ===================GradientDirection test after each called===================');
    });

    it('GradientDirectionTest_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('GradientDirectionTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('GradientDirection');
      console.info("GradientDirectionTest_static_0100 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("GradientDirectionTest_static_0100 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.LeftTop');
      console.info('GradientDirectionTest_static_0100 END');
      done();
    });

    it('GradientDirectionTest_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('GradientDirectionTest_static_0200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "ACTION": GradientDirection.LeftBottom
          } as Record<String,Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 106,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("GradientDirectionTest_static_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("GradientDirectionTest_static_0200 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('GradientDirection');
      console.info("GradientDirectionTest_static_0200 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("GradientDirectionTest_static_0200 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.LeftBottom');
      console.info('GradientDirectionTest_static_0200 END');
      done();
    });

    it('GradientDirectionTest_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('GradientDirectionTest_static_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "ACTION": GradientDirection.RightBottom
          } as Record<String,Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 107,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("GradientDirectionTest_static_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("GradientDirectionTest_static_0300 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('GradientDirection');
      console.info("GradientDirectionTest_static_0300 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("GradientDirectionTest_static_0300 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.RightBottom');
      console.info('GradientDirectionTest_static_0300 END');
      done();
    });

    it('GradientDirectionTest_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('GradientDirectionTest_static_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "ACTION": GradientDirection.None
          } as Record<String,Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 108,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("GradientDirectionTest_static_0400 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("GradientDirectionTest_static_0400 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('GradientDirection');
      console.info("GradientDirectionTest_static_0400 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("GradientDirectionTest_static_0400 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getElement('linearGradient').getString('direction')).assertEqual('GradientDirection.None');
      console.info('GradientDirectionTest_static_0400 END');
      done();
    });
  })
}
