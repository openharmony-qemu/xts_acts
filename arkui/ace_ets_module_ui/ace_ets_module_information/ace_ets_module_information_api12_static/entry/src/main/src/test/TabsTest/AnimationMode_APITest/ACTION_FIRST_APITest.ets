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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

export default function ACTION_FIRST_APITest() {
  describe('ACTION_FIRST_APITest', () => {
    beforeAll(() => {
      console.info("ACTION_FIRST_APITest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("ACTION_FIRST_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/AnimationMode_API/ACTION_FIRST",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ACTION_FIRST_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ACTION_FIRST_APITest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ACTION_FIRST_APITest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number ACTION_FIRST
     * @tc.name ACTION_FIRST_APITest_static_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ACTION_FIRST_APITest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ACTION_FIRST_APITest_static_0100 START');
      await CommonFunc.sleep(1000);
      let ACTION_FIRST = inspector.getInspectorByKey('ACTION_FIRST');
      console.info("[ACTION_FIRST_APITest_static_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(ACTION_FIRST).getElement('$attrs')));
      expect(JSON.parseJsonElement(ACTION_FIRST).getElement('$attrs').getString('animationMode')).assertEqual('AnimationMode.ACTION_FIRST');
      console.info('[ACTION_FIRST_APITest_static_0100] END');
      done();
    });
  })
}