'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
const SLEEP_TIME = 1000;

export default function arcButtonTest() {
  describe('arcButtonTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("arcButtonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcButton/arcButton',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arcButtonTest state pages:" + JSON.stringify(pages));
        if (!("arcButton" == pages.name)) {
          console.info("get arcButtonTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push arcButtonTest page error:" + err);
      }
      console.info("arcButtonTest beforeEach end");
    });
    afterEach(async () => {
      try {
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('arcButtonTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("arcButtonTest after each called");
    });
    /**
     * @tc.number   ArcButton_static_001
     * @tc.name     ArcButton_static_001
     * @tc.desc     call and override the native component/API
     * @tc.level    Level.LEVEL0
     */
    it('ArcButton_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArcButton_static_001 START');
      const driver = Driver.create();
      try {
        const button = await driver.findComponent(ON.text('Test Progress'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('ArcButton_static_001 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('arcButtonTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');
      console.info('ArcButton_static_001 END');
      done();
    });
  })
}
