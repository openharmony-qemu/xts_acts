/*
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function curvesStepsJsunit() {
  describe('curvesStepsTest', () => {

    /**
     * run before testcase
     */
    beforeAll(async () => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('[curvesStepsTest] before each called')

      
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/curves'
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get curvesStepsTest state pages:" + JSON.stringify(pages));
        if (!("curvesSteps" == pages.name)) {
          console.info("get curvesStepsTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push curves page error " + JSON.stringify(err));
      }
      await Utils.sleep(4000)
    });

    /**
     * run after testcase
     */
    afterAll(async () => {
      console.info('[curvesStepsTest] after each called')
      await Utils.sleep(1000)
    });


    /*
     * @tc.number   testcurvesSteps_static_0001
     * @tc.name     testcurvesSteps_static_0001
     * @tc.desc     testcurvesSteps_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('testcurvesSteps_static_0001', Level.LEVEL0, async () => {
      console.info('curvesSteps testcurvesSteps_static_0001 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60229,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback success");
          console.info("curveApi ((eventData.data) as  Record<string, RecordData>)?.curveApi result is: " +
            ((eventData.data) as Record<string, RecordData>)?.['curveApi']);
          expect(((eventData.data) as Record<string, RecordData>)?.['curveApi']).assertEqual("callBackSuccess");
          console.info("curveApi end");
        } catch (err) {
          console.info("curveApi on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("curveApi click result is: " + JSON.stringify(inspector.sendEventByKey('stepsText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("curveApi on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
