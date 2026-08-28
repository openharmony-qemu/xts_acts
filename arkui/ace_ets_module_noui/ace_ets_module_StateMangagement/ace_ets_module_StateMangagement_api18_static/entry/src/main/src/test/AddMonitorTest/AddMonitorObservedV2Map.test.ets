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

export default function AddMonitorObservedV2Map(): void {
  describe('AddMonitorObservedV2Map', () => {
    beforeEach(async (): Promise<void> => {
      console.info("AddMonitorObservedV2Map beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorObservedV2Map",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AddMonitorObservedV2Map state pages:" + JSON.stringify(pages));
        if (!("AddMonitorObservedV2Map" == pages.name)) {
          console.info("get AddMonitorObservedV2Map pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AddMonitorObservedV2Map page error:" + err);
      }
      console.info("AddMonitorObservedV2Map beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorObservedV2Map after each called");
    })

    /**
     * @tc.number   AddMonitorObservedV2Map_static_0100
     * @tc.name     AddMonitorObservedV2Map_static_0100
     * @tc.desc     AddMonitorObservedV2Map_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('AddMonitorObservedV2Map_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorObservedV2Map_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = await Driver.create();
      let btn_true = await driver.findComponent(ON.id('ObservedMap1')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ObservedMap');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] Map has changed from 0,a,1,b,3,c to 0,a,1,b,3,c');
      let btn_true1 = await driver.findComponent(ON.id('ObservedMapClear')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      let btn_true2 = await driver.findComponent(ON.id('ObservedMap2')) as Component;
      await btn_true2.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('ObservedMap');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] Map has changed from 0,a,1,b,3,c to 0,a,1,b,3,c');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

