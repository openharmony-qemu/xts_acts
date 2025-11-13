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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from "../../../../hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function ModifierTest() {

  describe('ModifierTest', () => {
    beforeAll(() => {
      console.info("EventLocationInfo beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.open.harmony.nowear.acetestcommenventapi20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("EventLocationInfo beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DragEvent/DragModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get EventLocationInfo state pages:" + JSON.stringify(pages));
        if (!("DragModifier" == pages.name)) {
          console.info("get EventLocationInfo pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push EventLocationInfo page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EventLocationInfo page error:" + err);
      }
      console.info("EventLocationInfo beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("EventLocationInfo after each called");
    });

    

    /*
     * @tc.number   ModifierTest_static_0010
     * @tc.name     ModifierTest_static_0010
     * @tc.desc     ModifierTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('EventLocationInfo_on_beforePanStart_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let startDrag = await driver.findComponent(ON.id('startDrag'));
      let endDrag = await driver.findComponent(ON.id('endDrag'));
      await (startDrag?.dragTo(endDrag as Component) as Promise<void>);
      await CommonFunc.sleep(1000);
      console.log('999999999'+AppStorage.get('dragSource2'))
      expect(AppStorage.get('dragSource2')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote2')).assertEqual(false);
      expect(AppStorage.get('dragSource4')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote4')).assertEqual(false);
      expect(AppStorage.get('dragSource5')).assertEqual('com.open.harmony.nowear.acetestcommenventapi20');
      expect(AppStorage.get('isRemote5')).assertEqual(false);
      console.info('[EventLocationInfo_on_beforePanStart_static_0010] END');
      done();
    });
  })
}