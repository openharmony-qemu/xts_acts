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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

export default function appearJsunit() {
  describe('appearTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("appearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/appearTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appearTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get appearTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push appearTest page error:" + err);
      }
      console.info("appearTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appear after each called");
    })

    /*
     * @tc.number    testAppear_static_01
     * @tc.name      testAppear_static_01
     * @tc.desc      testAppear_static_01
     * @tc.level     2
     */
    it('testAppear_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testAppear01] START');
      await CommonFunc.sleep(1000);
      try {
        let callBackAppear1 = (backData: events_emitter.EventData) => {
          console.info("testAppear01 get appearEvent result is: " + JSON.stringify(backData));
          expect(((backData.data) as ESObject).getProperty('ACTION').toBoolean()).assertEqual(false);
          done()
        }
        let appearEvent1: events_emitter.InnerEvent = {
          eventId: 58,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(appearEvent1, callBackAppear1);
      } catch (err) {
        console.info("testAppear01 on appearEvent err : " + JSON.stringify(err));
      }
      console.info("testAppear01 click result is: " + JSON.stringify(inspector.sendEventByKey('appear', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('[testAppear01] END');

      console.info('[testAppear02] START');
      try {
        let callBackDisAppear = (backData1: events_emitter.EventData) => {
          console.info("testAppear02 get disAppearEvent result is: " + JSON.stringify(backData1));
          console.info("testAppear02 get backData1.data.ACTION result is: " +
          ((backData1.data) as ESObject).getProperty('ACTION'));
          expect(((backData1.data) as ESObject).getProperty('ACTION').toBoolean()).assertEqual(true);
          done()
        }
        let disAppearEvent: events_emitter.InnerEvent = {
          eventId: 60,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(disAppearEvent, callBackDisAppear);
      } catch (err) {
        console.info("testAppear02 on disAppearEvent err : " + JSON.stringify(err));
      }

      await CommonFunc.sleep(1000);
      console.info('[testAppear03] START');
      let callBackAppear2 = (backData2: events_emitter.EventData) => {
        console.info("testAppear03 get appearEvent result is: " + JSON.stringify(backData2));
        console.info("testAppear03 get backData2.data.APPEAR: " + ((backData2.data) as ESObject).getProperty('APPEAR'));
        expect(((backData2.data) as ESObject).getProperty('APPEAR')).assertEqual("appearStatusOn");
        done()
      }
      let appearEvent2: events_emitter.InnerEvent = {
        eventId: 59,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testAppear03 appearEvent click result is: " +
        JSON.stringify(inspector.sendEventByKey('appear', 10, "")));
        events_emitter.on(appearEvent2, callBackAppear2);
      } catch (err) {
        console.info("testAppear03 on appearEvent err : " + JSON.stringify(err));
      }

    });
  })
}
