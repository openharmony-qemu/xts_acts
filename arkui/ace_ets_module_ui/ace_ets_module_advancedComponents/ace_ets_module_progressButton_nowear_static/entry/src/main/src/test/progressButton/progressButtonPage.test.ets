'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function progressButtonPageTest() {
  describe('progressButtonPage', () => {

    beforeEach(async (): Promise<void> => {
      console.info("progressButtonPageTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progressButton/progressButtonPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progressButtonPageTest state pages:" + JSON.stringify(pages));
        if (!("progressButtonPage" == pages.name)) {
          console.info("get progressButtonPageTest pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push progressButtonPageTest page error:" + err);
      }
      console.info("progressButtonPageTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('progressButtonPageTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('progressButtonPage after each called');
    })

    
    
    
    /**
     * @tc.number   progressButtonPageTest_static_0100
     * @tc.name     progressButtonPageTest_static_0100
     * @tc.desc     progressButtonPageTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('progressButtonPageTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[progressButtonPageTest_static_0100] START');
      try {
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      // 查看progressButtonPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('下载'));
      expect(itemText !== null).assertTrue();
      console.info('[progressButtonPageTest_static_0100] END');
      done();
      } catch (err) {
        console.error('progressButtonPageTest_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}