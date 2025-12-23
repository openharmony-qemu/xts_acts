'use static';
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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function StepperJsunit11() {
  describe('StepperJsunit11', () => {

    beforeAll(() => {
      console.info("StepperJsunit11 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepper',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stepper state success " + JSON.stringify(pages));
        if (!("stepper" == pages.name)) {
          console.info("get stepper state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stepper page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepper after each called");
    });


    
/**
     * @tc.number   stepperTest_static_0100
     * @tc.name     stepperTest_static_0100
     * @tc.desc     stepperTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('stepperTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperTest_static_0100 START');
      let strJson: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0100 component strJson:" + strJson);
      console.info("stepperTest_static_0100 component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stepper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('0');
      console.info('stepperTest_static_0100 END');
      done()
    });


    
/**
     * @tc.number   stepperTest_static_0200
     * @tc.name     stepperTest_static_0200
     * @tc.desc     stepperTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('stepperTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperTest_static_0200 START');
      let strJson: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0200 component strJson:" + strJson);
      console.info("stepperTest_static_0200 component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('0');
      try {
        const globalMessage = AppStorage.get<MessageManager<number>>('messageManager');
        await Utils.sleep(1000);
        globalMessage!.notify({
          name: 'index', value: 1
        })
        await Utils.sleep(2000);
      } catch (err) {
        console.log("stepperTest_static_0200 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(3000);
      let strJsonNew: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0200 component objNew is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index')).assertEqual('1');
      console.info('stepperTest_static_0200 END');
      done()
    });


    
/**
     * @tc.number   stepperTest_static_0400
     * @tc.name     stepperTest_static_0400
     * @tc.desc     stepperTest_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('stepperTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      await Utils.sleep(1000);
      const globalMessage = AppStorage.get<MessageManager<number>>('messageManager');
      globalMessage!.notify({
        name: 'index', value: -558038585
      })
      await Utils.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0400 component objNew is: " + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index')).assertEqual('0');
      console.info('stepperTest_static_0400 END');
      done()
    });


    
/**
     * @tc.number   stepperTest_static_0500
     * @tc.name     stepperTest_static_0500
     * @tc.desc     stepperTest_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('stepperTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[stepperTest_static_0500] START');
      const globalMessage = AppStorage.get<MessageManager<number>>('messageManager');
      await Utils.sleep(1000);
      globalMessage!.notify({
        name: 'index', value: -10
      })
      await Utils.sleep(2000);
      let strJsonNew: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0500 component objNew is: " + JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index')).assertEqual('0');
      console.info('stepperTest_static_0400 END');
      done()
    });


    
/**
     * @tc.number   stepperTest_static_0300
     * @tc.name     stepperTest_static_0300
     * @tc.desc     stepperTest_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('stepperTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('stepperTest_static_0300v START');
      let strJson: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0300 component strJson:" + strJson);
      console.info("stepperTest_static_0300 component obj is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "currentIndex": 11111111,
          } as Record<String,undefined|null|Object>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 909,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("stepperTest_static_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("stepperTest_static_0300 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(3000);
      let strJsonNew: string = inspector.getInspectorByKey('stepper');
      console.info("stepperTest_static_0300 component objNew is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index')).assertEqual('0');
      console.info('stepperTest_static_0300 END');
      done()
    });

  })
}