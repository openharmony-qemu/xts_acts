/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function backgroundJsunit() {
  describe('backgroundTest', () => {
    beforeAll(() => {
      console.info("backgroundTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() => {
      console.info("backgroundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Background/background',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get background state success " + JSON.stringify(pages));
        if (!("background" == pages.name)) {
          console.info("get background state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // Utils.sleep(2000);
          // console.info("push background page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push background page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      Utils.sleep(1000);
      console.info("background after each called");
    });
    /**
     * @tc.number    testBackground_static_0100
     * @tc.name      testBackground_static_0100
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testBackground_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0100 START');
      Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('fontColor');
      console.info("testBackground_0100 component strJson:" + strJson);

      console.info("testBackground_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      console.info('testBackground_0100 END');
      done();
    });
    /**
     * @tc.number    testBackground_static_0200
     * @tc.name      testBackground_static_0200
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testBackground_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0200 START');
      Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "color": '0xFF0000'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testBackground_0200 start pages");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("testBackground_0200 change component data error: " + err.message);
      }
      Utils.sleep(3000);
      let strJson = inspector.getInspectorByKey('backgroundColor');
      console.info("testBackground_0200 component strJson:" + strJson);
      console.info("testBackground_0200 rowDirection: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('direction'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual("#FFEEEE00");
      done();
    });
    /**
     * @tc.number    testBackground_static_0300
     * @tc.name      testBackground_static_0300
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testBackground_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testBackground_0300 START');
      Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey('backgroundColor');
      console.info("testBackground_0300 component strJson:" + strJson);
      console.info("testBackground_0300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth')).assertEqual("1.00vp");
      console.info('testBackground_0300 END');
      done();
    });
  })
}
