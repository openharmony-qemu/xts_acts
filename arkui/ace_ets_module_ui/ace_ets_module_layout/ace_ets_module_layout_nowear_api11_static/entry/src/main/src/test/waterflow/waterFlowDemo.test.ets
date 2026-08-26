'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function waterFlowDemoJsunit() {
  describe('waterFlowDemoJsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("waterFlow beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterflow/WaterflowDemo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get waterflowDemo state pages:" + "");
        if (!("waterflowDemo" == pages.name)) {
          console.info("get waterflowDemo pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterflowDemo page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (error) {
        console.error("waterflowDemo afterEach error:" + error);
      }
      console.info("waterflowDemo after each called");
    });


    /**
     * @tc.number   waterflowTest_static_0001
     * @tc.name     waterflowTest_static_0001
     * @tc.desc     waterflowTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('waterflowTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('waterflowDemo testalphabetIndexerWidth0001 START');
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('waterFlow');
        console.info("[waterflowTest_static_0001] component width strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('WaterFlow');
      } catch (error) {
        console.error('[waterflowTest_static_0001] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  })
}
