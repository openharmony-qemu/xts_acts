'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

export default function curvesStepsJsunit() {
  describe('curvesStepsTest', () => {

    beforeEach(async () => {
      console.info('[curvesStepsTest] before each called')

      // let result = '';
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/curves'
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get curvesStepsTest state pages:" + JSON.stringify(pages));
        if (!("curves" == pages.name)) {
          console.info("get curvesStepsTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push curvesStepsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curves page error " + JSON.stringify(err));
      }
      try {
        await Utils.sleep(4000)
      } catch (err) {
        console.info('curvesStepsTest sleep err: ' + JSON.stringify(err));
      }
    });

    /**
     * run after testcase
     */
    afterAll(async () => {
      console.info('[curvesStepsTest] after each called')
      try {
        await Utils.sleep(1000)
      } catch (err) {
        console.info('curvesStepsTest sleep err: ' + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   testcurvesSteps_static_0001
     * @tc.name     testcurvesSteps_static_0001
     * @tc.desc     testcurvesSteps_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcurvesSteps_static_0001', Level.LEVEL0, async () => {
      console.info('curvesSteps testcurvesSteps_static_0001 START');
      let innerEvent: emitter.InnerEvent = {
        eventId: 60229,
        priority: emitter.EventPriority.LOW
      }
      let callback = (eventData: emitter.EventData) => {
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        try {
          console.info("callback success");
          console.info("curveApi ((eventData.data) as  Record<string, Object>)?.curveApi result is: " +
          data['curveApi']);
          expect(data['curveApi']).assertEqual("callBackSuccess");
          console.info("curveApi end");
        } catch (err) {
          console.info("curveApi on emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("curveApi click result is: " + JSON.stringify(inspector.sendEventByKey('stepsText', 10, "")));
        emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("curveApi on emitter err : " + JSON.stringify(err));
      }
    });
  })
}
