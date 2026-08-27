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

import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';

export default function panelBackgroundMaskJsunit() {
  describe('panelBackgroundMaskTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/panel/panel',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get panel state pages:" + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get panel pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('panelBackgroundMaskTest sleep err: ' + JSON.stringify(err));
      }
      console.info("panelBackgroundMask after each called");
    });


    
    /**
     * @tc.number   testpanelOnHeightChange_static_0002
     * @tc.name     testpanelOnHeightChange_static_0002
     * @tc.desc     testpanelOnHeightChange_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testpanelOnHeightChange_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('panelBackgroundMask testpanelOnHeightChange_static_0002 START');
      let panelOnHeightChangeEvent: emitter.InnerEvent = {
        eventId: 10111,
        priority: emitter.EventPriority.LOW
      }
      let callback1 = (backData: emitter.EventData) => {
        console.info("testpanelOnHeightChange_static_0002 backData.data.result is: " +
          ((backData.data) as Record<String,RecordData>)?.['result']);
        try {
          console.info("testpanelOnHeightChange_static_0002 callback1 success");
          expect(((backData.data) as Record<String,RecordData>)?.['result']).assertEqual("success");

        } catch (err) {
          console.info("testpanelOnHeightChange_static_0002 on emitter err : " + JSON.stringify(err));
        }
      }
      try {
        console.info("testpanelOnHeightChange_static_0002 click result is: " +
        JSON.stringify(inspector.sendEventByKey('onHeightChangeText', 10, "")));
        emitter.on(panelOnHeightChangeEvent, callback1);
      } catch (err) {
        console.info("testpanelOnHeightChange_static_0002 on emitter err : " + JSON.stringify(err));
      }
    });

  })
}
