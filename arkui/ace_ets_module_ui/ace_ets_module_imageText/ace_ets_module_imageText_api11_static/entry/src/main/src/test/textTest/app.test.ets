/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function appVersionCodeJsunit() {
  describe('appVersionCodeTest', () => {

    beforeAll(() => {
      console.info("appVersionCodeTest beforeEach start");


      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("appVersionCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/app',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get appVersionCodeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get appVersionCodeTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push appVersionCodeTest page error:" + err);
      }
      console.info("appVersionCodeTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appVersionCode after each called");
    });

    
    /*
     * @tc.number   testappVersionCode_static_0011
     * @tc.name     testappVersionCode_static_0011
     * @tc.desc     testappVersionCode_static_0011
     * @tc.level    Level.LEVEL1
     */
it('testappVersionCode_static_0011', Level.LEVEL1, async (done: ()=>void) => {
      console.info('appVersionCode testappVersionCode_static_0011 START');
      await CommonFunc.sleep(1000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testappVersionCode_0011 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as Record<String, RecordData>)?.['Code']).assertEqual(1000000);
        }
        console.info("testappVersion click result is: " + JSON.stringify(inspector.sendEventByKey('versionCodeText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {



        console.info("testappVersionCode_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testappVersionCode_0011 END');
      done();
    });
  })
}
