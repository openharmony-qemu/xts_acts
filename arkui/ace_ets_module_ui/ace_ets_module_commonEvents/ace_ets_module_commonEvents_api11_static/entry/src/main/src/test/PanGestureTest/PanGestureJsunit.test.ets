/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { TouchObject, TouchType } from '@ohos.arkui.component'
import { sendTouchEvent } from '@kit.ArkUI';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function PanGesture3Jsunit() {
  describe('PanGesture3Jsunit', () => {
    let x_value: number;
    let y_value: number;
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("PanGesture3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/PanGesture3Jsunit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PanGesture3Jsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get PanGesture3Jsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push PanGesture3Jsunit page error:" + err);
      }
      console.info("PanGesture3Jsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PanGesture after each called");
    });

    /*
     * @tc.number    testPanGesture_static_01
     * @tc.name      testPanGesture_static_01
     * @tc.desc      testPanGesture_static_01
     * @tc.level     2
     */
    it('testPanGesture_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[testPanGesture01] START');
        try {
          let eventData: events_emitter.EventData = {
            data: {
              "touchable": true,
            } as Record<string, Object>
          }
          let innerEvent: events_emitter.InnerEvent = {
            eventId: 23,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[testPanGesture01] start to publish emit:" + JSON.stringify(eventData.data));
          events_emitter.emit(innerEvent, eventData);
        } catch (err: Error) {
          console.log("[testPanGesture01] change component data error: " + err.message);
        }
        await CommonFunc.sleep(1000);
        console.info('[testPanGesture01] END');
        done();
      } catch (err: Error) {
        expect().assertFail();
      }
    });

    /*
     * @tc.number    testPanGesture_static_02
     * @tc.name      testPanGesture_static_02
     * @tc.desc      testPanGesture_static_02
     * @tc.level     2
     */
    it('testPanGesture_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rect = CommonFunc.getComponentRect('PanGesture')
      console.info("[testPanGesture02] rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 10
      y_value = rect.top + (rect.bottom - rect.top) / 10
      console.info("[testPanGesture02] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Move,
        displayX: 0,
        displayY: 0,
        windowX: 0,
        windowY: 0


      }
      let callbackTwo = (eventDataOne: events_emitter.EventData) => {
        console.info("[testPanGesture02] get event state result is: " + JSON.stringify(eventDataOne));
        expect(((eventDataOne.data) as ESObject).getProperty('ACTION')).assertEqual(true)
        expect(((eventDataOne.data) as ESObject).getProperty('EVENT_TYPE')).assertEqual('Move')
      }
      let innerEventTwo: events_emitter.InnerEvent = {
        eventId: 24,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err: Error) {
        console.info("[testPanGesture02] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testPanGesture02] testSendTouchEvent ' + sendTouchEvent(point));
      await CommonFunc.sleep(1000)
      console.info('[testPanGesture02] END');
      done();
    });
  })
}
