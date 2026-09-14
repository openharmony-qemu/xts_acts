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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowSyncLoadTest() {
  describe('WaterFlowSyncLoadTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeEach(async (): Promise<void> => {
      console.info('WaterFlowSyncLoadTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get WaterFlowSyncLoadTest state pages:' + JSON.stringify(pages));
        if (!('waterFlowSyncLoad' == pages.name)) {
          console.info('get  WaterFlowSyncLoadTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/WaterFlow/waterFlowSyncLoad',
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push WaterFlowSyncLoadTest page error:' + err);
      }
      console.info('WaterFlowSyncLoadTest foreEach end');
    });

    /**
     * @tc.number   WaterFlowSyncLoad_static_0100
     * @tc.name     WaterFlowSyncLoad_static_0100
     * @tc.desc     WaterFlowSyncLoad_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowSyncLoad_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowSyncLoad_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('waterFlowSyncLoad_001');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowSyncLoadStr = obj.getElement('$attrs').getBoolean('syncLoad');
      console.info('[WaterFlowSyncLoad_static_0100] waterFlowSyncLoad obj is: ' + waterFlowSyncLoadStr);
      expect(waterFlowSyncLoadStr).assertEqual(true);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   WaterFlowSyncLoad_static_0200
     * @tc.name     WaterFlowSyncLoad_static_0200
     * @tc.desc     WaterFlowSyncLoad_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowSyncLoad_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowSyncLoad_static_0200';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('waterFlowSyncLoad_002');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowSyncLoadStr = obj.getElement('$attrs').getBoolean('syncLoad');
      console.info('[WaterFlowSyncLoad_static_0200] waterFlowSyncLoad obj is: ' + waterFlowSyncLoadStr);
      expect(waterFlowSyncLoadStr).assertEqual(false);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   WaterFlowSyncLoad_static_0300
     * @tc.name     WaterFlowSyncLoad_static_0300
     * @tc.desc     WaterFlowSyncLoad_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowSyncLoad_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowSyncLoad_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('waterFlowSyncLoad_003');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowSyncLoadStr = obj.getElement('$attrs').getBoolean('syncLoad');
      console.info('[WaterFlowSyncLoad_static_0300] waterFlowSyncLoad obj is: ' + waterFlowSyncLoadStr);
      expect(waterFlowSyncLoadStr).assertEqual(true);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}
