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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';


export default function AtomicServiceSearchTest() {
  describe('AtomicServiceSearchTest', () => {
    beforeAll(() => {
      console.info("AtomicServiceSearchTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.acts.arkui.atomicservice.ui.component.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AtomicServiceSearchTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/atomicservicesearch/AtomicServiceSearchTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AtomicServiceSearchTest state pages:" + JSON.stringify(pages));
        if (!("AtomicServiceSearch" == pages.name)) {
          console.info("get AtomicServiceSearchTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AtomicServiceSearchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AtomicServiceSearchTest page error:" + err);
      }
      console.info("AtomicServiceSearchTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('chipDirectionTest after each called');
    });

    
    /*
     * @tc.number   AtomicServiceSearchTest_0100
     * @tc.name     AtomicServiceSearchTest_0100
     * @tc.desc     AtomicServiceSearchTest_0100
     * @tc.level    Level.LEVEL0
     */
it('AtomicServiceSearchTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AtomicServiceSearchTest_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 查看AtomicServiceSearchTest是否存在以下入口。
      let tab1 = await driver.findComponent(ON.text("修改placeholder"));
      expect(tab1 !== null).assertTrue();
      console.info('[AtomicServiceSearchTest_0100] END');
      done();
    });
  })
}