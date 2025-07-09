/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index";
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'

import {UtilsTest} from '../Util.test';
let testAbilityContext:common.UIAbilityContext;
let domain: number = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function scrollDidJsunit() {
  describe('scrollDidJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollDidJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollDid",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollDidJsunit state pages:" + JSON.stringify(pages));
        if (!("scrollDid" == pages.name)) {
          console.info("get scrollDidJsunit pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollDidJsunit page error:" + err);
      }
      console.info("scrollDidJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollDidJsunit after each called");
    });

    /**
     * @tc.number    SCROLL_ONDIDSCROLL_001
     * @tc.name      scrollDidJsunit_001
     * @tc.desc      The scroll component triggers the onDidScroll event
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('scrollDidJsunit_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[scrollDidJsunit_0100] START');
      let scrollRect = CommonFunc.getComponentRectOnScreen('scrollSource_scroll')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(scrollRect.right - scrollRect.left) * 0.5 + scrollRect.left}`),
        y: Number.parseInt(`${(scrollRect.bottom - scrollRect.top) * 0.6 + scrollRect.top}`)
      },
        {
          x: Number.parseInt(`${(scrollRect.right - scrollRect.left) * 0.5 + scrollRect.left}`),
          y: Number.parseInt(`${(scrollRect.bottom - scrollRect.top) * 0.2 + scrollRect.top}`)
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('scroll_onDidScroll');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollDidJsunit_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[scrollDidJsunit_0100] content: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(JSON.stringify(obj.getElement('$attrs').getString('content'))).assertEqual('scrollState: 0');
      console.info('[scrollDidJsunit_0100] END');
      done();
    });
  })
}
