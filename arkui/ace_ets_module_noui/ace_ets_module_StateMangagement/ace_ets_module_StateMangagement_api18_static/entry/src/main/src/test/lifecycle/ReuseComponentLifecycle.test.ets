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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import hilog from '@ohos.hilog'

export default function reuseComponentLifecycleTest(): void {
  describe('ReuseComponentLifecycle', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async (): Promise<void> => {
      console.info("ReuseComponentLifecycle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/ReuseComponentLifecycle",
      }
      try {
        const ReuseComponentLifecycle = AppStorage.get<Router>("router") as Router
        ReuseComponentLifecycle.clear();
        let pages:router.RouterState = ReuseComponentLifecycle.getState();
        console.info("get ReuseComponentLifecycle state pages: " + JSON.stringify(pages));
        if (!("ReuseComponentLifecycle" == pages.name)) {
          console.info("get ReuseComponentLifecycle state pages.name: " + JSON.stringify(pages.name));
          // let result = await ReuseComponentLifecycle.pushUrl(options);
          ReuseComponentLifecycle.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ReuseComponentLifecycle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseComponentLifecycle page error:" + err);
      }
      console.info("ReuseComponentLifecycle beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });



    /**
     * @tc.name   SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100
     * @tc.number SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100
     * @tc.desc   Test @ComponentInactive triggers when @Reusable component becomes inactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentInactive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtn'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2  = inspector.getInspectorByKey('inactiveText');
      let text = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'inactiveText: ' + text);
      expect(text.includes('Inactive')).assertTrue();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentInactive_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_REUSE_COMPONENTACTIVE_0100
     * @tc.number SUB_ARKUI_REUSE_COMPONENTACTIVE_0100
     * @tc.desc   Test @ComponentActive triggers when @Reusable component becomes active
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSE_COMPONENTACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentActive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtn'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2  = inspector.getInspectorByKey('activeText');
      let text = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'activeText: ' + text);
      expect(text.includes('Active')).assertTrue();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentActive_0100 END');
    });

  });
}