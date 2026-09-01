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

export default function progressButtonV2PageTest() {
  describe('progressButtonV2Page', () => {

    beforeEach(async (): Promise<void> => {
      console.info("progressButtonV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progressButtonV2/progressButtonV2Page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get progressButtonV2Page state pages:" + JSON.stringify(pages));
        if (!("progressButtonV2Page" == pages.name)) {
          console.info("get progressButtonV2Page pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push progressButtonV2Page page error:" + err);
      }
      console.info("progressButtonV2Page beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('progressButtonV2PageTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('progressButtonV2Page after each called');
    })

    /**
     * @tc.number   progressButtonV2PageTest_static_0100
     * @tc.name     progressButtonV2PageTest_static_0100
     * @tc.desc     progressButtonV2PageTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('progressButtonV2PageTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[progressButtonV2PageTest_static_0100] START');
      try {
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      // 查看progressButtonV2Page是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('下载'));
      expect(itemText !== null).assertTrue();
      console.info('[progressButtonV2PageTest_static_0100] END');
      done();
      } catch (err) {
        console.error('progressButtonV2PageTest_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}