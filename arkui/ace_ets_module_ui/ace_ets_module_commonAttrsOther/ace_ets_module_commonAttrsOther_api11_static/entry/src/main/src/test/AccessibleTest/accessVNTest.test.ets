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
import { beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'

export default function accessVnTest(): void {
  describe('accessVnTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("accessVnTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Accessible/accessVN',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get accessVnTest state pages:" + JSON.stringify(pages));
        if (!("accessVN" == pages.name)) {
          console.info("get accessVnTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push accessVnTest page error:" + err);
      }
      console.info("accessVnTest beforeEach end");
    });


    
    
/**
     * @tc.number   accessVnTest_static_0100
     * @tc.name     accessVnTest_static_0100
     * @tc.desc     accessVnTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('accessVnTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('accessVnTest_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('accessVnTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('accessVn_1');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('accessVnTest sleep err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Row');
      console.info('[accessVnTest_static_0100] END');
      done();
    });
  })
}

