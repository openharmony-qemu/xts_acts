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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager, Callback} from '../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
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


export default function scrollXOffsetJsunit() {
  describe('scrollXOffsetJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollXOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollXOffset',
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollXOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollXOffset" == pages.name)) {
          console.info("get scrollXOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollXOffsetJsunit page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_ACE_SCROLL_scrollXOffsetJsunit_0100
     * @tc.name: scrollXOffsetJsunit_0100
     * @tc.desc: Trigger onWillScroll and onDidScroll callbacks
     * @tc.level: Level 1
     * @tc.type:
     * @tc.size:
     */
    it('scrollXOffsetJsunit_0100', 0, async (done: () => void): Promise<void> => {
      console.info('scrollXOffsetJsunit_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver!.findComponent(ON.id('scroll_x'));
      await button!.click();
      await CommonFunc.sleep(2000);
      console.info("[scrollXOffsetJsunit_0100] scroll x success");

      let strJson = inspector.getInspectorByKey('scroll_mess');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollXOffsetJsunit_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('x:10');
      console.info('[scrollXOffsetJsunit_0100] END');
      done();
    });
  })
}

