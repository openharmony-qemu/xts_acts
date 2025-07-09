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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function listScrollerBar() {
  describe('listScrollerBar', () => {
    beforeAll(() => {
      console.info("listScrollerBar beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("listScrollerBar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/listScrollerBar",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get listScrollerBar state pages:" + JSON.stringify(pages));
        if (!("listScrollerBar" == pages.name)) {
          console.info("get listScrollerBar pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push listScrollerBar page error:" + err);
      }
      console.info("listScrollerBar beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listScrollerBar after each called");
    });

    /**
     * @tc.number    listScrollerBar_001
     * @tc.name      listScrollerBar_0100
     * @tc.desc      Dragging the scrollBar component triggers a callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('listScrollerBar_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[listScrollerBar_static_0100] START');
      let driver = Driver.create()
      let swiperBar = CommonFunc.getComponentRectOnScreen('scroller_list_scrollbar');
      let top = swiperBar.top;
      let bottom = swiperBar.bottom;
      let right = swiperBar.right;
      let left = swiperBar.left;
      let widthBar = right - left;
      console.info("listScrollerBar_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      const uiContext = new UIContext();
      await (driver.swipe(Math.round(left + widthBar/2),Math.round(top + uiContext.vp2px(10)),Math.round(left + widthBar/2),Math.round(bottom - uiContext.vp2px(10))) as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list_scrollBar_onText');
      console.info("[listScrollerBar_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[listScrollerBar_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('bar: reachStart3-reachStart1-scrollStart3-scrollStart1-reachEnd1-reachEnd3-scrollStop1-scrollStop3-');
      console.info('[listScrollerBar_static_0100] END');
      done();
    });
  })
}
