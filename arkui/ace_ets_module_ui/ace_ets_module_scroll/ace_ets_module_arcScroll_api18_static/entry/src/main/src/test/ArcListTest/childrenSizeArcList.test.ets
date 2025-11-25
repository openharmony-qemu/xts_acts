'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function childrenSizeArcList() {
  describe('childrenSizeArcList', () => {
    beforeAll(() => {
      console.info("childrenSizeArcList beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.arcScroll_api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("childrenSizeArcList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcList/childrenSizeArcList",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get childrenSizeArcList state pages:" + JSON.stringify(pages));
        if (!("childrenSizeArcList" == pages.name)) {
          console.info("get childrenSizeArcList pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push childrenSizeArcList page error:" + err);
      }
      console.info("childrenSizeArcList beforeEach end");
    });

    
    /*
     * @tc.number   childrenSizeArcList_static_0100
     * @tc.name     childrenSizeArcList_static_0100
     * @tc.desc     childrenSizeArcList_static_0100
     * @tc.level    Level.LEVEL0
     */
it('childrenSizeArcList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[childrenSizeArcList_static_0100] START');
      let driver = Driver.create()
      let btn1 = await driver.findComponent(ON.id('arcList_splice'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let btn2 = await driver.findComponent(ON.id('arcList_update'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('arcList_Count');
      console.info("[childrenSizeArcList_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[childrenSizeArcList_static_0100] getString('content'): " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[childrenSizeArcList_static_0100] END');
      done();
    });
  })
}
