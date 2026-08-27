'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/LevelOrder/LevelOrderIndex';
const PAGE_NAME = 'LevelOrderIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function LevelOrderTest() {
  describe('LevelOrderTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        const options: router.RouterOptions = { url: PAGE_URL };
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(SLEEP_TIME);
        expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
      } catch (err) {
        console.info('LevelOrderTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('LevelOrderTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.number LevelOrderTest_001
     * @tc.name clamp
     * @tc.desc Verify LevelOrder.clamp method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('clamp', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('levelOrderClampBtn'));
        expect(btn !== null).assertTrue();
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(300);
        expect(getContentByKey('levelOrderClampStatus')).assertEqual('clamp_ok');
      } catch (error) {
        console.error('clamp error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
