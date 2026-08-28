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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function AddMonitorNoPath(): void {
  describe('AddMonitorNoPath', () => {
    beforeEach(async (): Promise<void> => {
      console.info("AddMonitorNoPath beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorNoPath",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AddMonitorNoPath state pages:" + JSON.stringify(pages));
        if (!("AddMonitorNoPath" == pages.name)) {
          console.info("get AddMonitorNoPath pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AddMonitorNoPath page error:" + err);
      }
      console.info("AddMonitorNoPath beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorNoPath after each called");
    })

    /**
     * @tc.number   AddMonitorNoPath_static_0100
     * @tc.name     AddMonitorNoPath_static_0100
     * @tc.desc     AddMonitorNoPath_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('AddMonitorNoPath_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorNoPath_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = await Driver.create();
      let NoPathButton = await driver.findComponent(ON.id('NoPathButton')) as Component;
      await NoPathButton.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('text');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] value MONITOR_0 has changed from 5 to 6');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

