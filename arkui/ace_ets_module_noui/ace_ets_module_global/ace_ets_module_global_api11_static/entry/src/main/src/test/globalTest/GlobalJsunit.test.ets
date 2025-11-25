'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils'
import deviceInfo from '@ohos.deviceInfo';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

// import { canIUse } from '@ohos.arkui.component'
// isApiVersionGreaterOrEqual 搜不到

export default function globalJsunit() {
  describe('globalJsunit', () => {
    beforeAll(() => {
      console.info("global beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("global beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/global/global',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global" == pages.name)) {
          console.info("get global pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push global page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
      console.info("global beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
    });


    /*
         * @tc.number   ACE_global_setTimeout_static
         * @tc.name     ACE_global_setTimeout_static
         * @tc.desc     ACE_global_setTimeout_static
         * @tc.level    Level.LEVEL0
         */
    it('ACE_global_setTimeout_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "ACE_global_setTimeout"
      console.info(`${caseName} START`);
      setTimeout(() => {
        expect(true).assertTrue();
      }, 100)
      console.info(`${caseName} END`);
      done()
    });


    /*
         * @tc.number   ACE_global_canIUse_static
         * @tc.name     ACE_global_canIUse_static
         * @tc.desc     ACE_global_canIUse_static
         * @tc.level    Level.LEVEL0
         */
    it('ACE_global_canIUse_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let caseName: string = "ACE_global_canIUse"
        console.info(`${caseName} START`);
        let syscapName: string = "";
        // let result = canIUse(syscapName);
        // expect(result === false).assertTrue();
        console.info(`${caseName} END`);
        done()
      } catch (error) {
        expect().assertFail();
      }
    });


    /*
         * @tc.number   ACE_global_console_log_static_0100
         * @tc.name     ACE_global_console_log_static_0100
         * @tc.desc     ACE_global_console_log_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('ACE_global_console_log_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let casename: string = "ACE_global_001";
      console.log("-----------------------ACE_global_console_log Test is starting-----------------------");
      try {
        console.log("ACE_global_console_log test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_log Test end-----------------------");
      done()
    });


    /*
         * @tc.number   ACE_global_console_info_static_0100
         * @tc.name     ACE_global_console_info_static_0100
         * @tc.desc     ACE_global_console_info_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('ACE_global_console_info_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let casename: string = "ACE_global_002";
      console.log("-----------------------ACE_global_console_info Test is starting-----------------------");
      try {
        console.info("ACE_global_console_info test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_info Test end-----------------------");
      done()
    });


    /*
         * @tc.number   ACE_global_console_warn_static_0100
         * @tc.name     ACE_global_console_warn_static_0100
         * @tc.desc     ACE_global_console_warn_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('ACE_global_console_warn_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let casename: string = "ACE_global_003";
      console.log("-----------------------ACE_global_console_warn Test is starting-----------------------");
      try {
        console.warn("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_warn Test end-----------------------");
      done()
    });
  })
}