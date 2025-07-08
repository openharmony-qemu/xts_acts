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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function waterFlow5Jsunit() {
  describe('waterFlow5Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow5Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow5",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlow5Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow5" == pages.name)) {
          console.info("get waterFlow5Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = await routerScroll.pushUrl(options);
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push waterFlow5Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlow5Jsunit page error:" + err);
      }
      console.info("waterFlow5Jsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow5Jsunit after each called");
    });

    /**
     * @tc.number    waterFlow5Jsunit_static_001
     * @tc.name      waterFlow5Jsunit_static_001
     * @tc.desc      Add and delete data to waterFlow component
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('waterFlow5Jsunit_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[waterFlow5Jsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('flowItem_hei');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlow5Jsunit_static_001] component obj is: " + JSON.stringify(obj));
      console.info("[waterFlow5Jsunit_static_001] content: " + JSON.stringify(obj.getElement('$attrs').getString('height')));
	    let heightStr:string = obj.getElement('$attrs').getString('height').slice(0,6)
      console.info("[waterFlow5Jsunit_static_001] heightStr: " + heightStr);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(Number(heightStr)) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      console.info('[waterFlow5Jsunit_static_001] END');
      done();
    });
  })
}
