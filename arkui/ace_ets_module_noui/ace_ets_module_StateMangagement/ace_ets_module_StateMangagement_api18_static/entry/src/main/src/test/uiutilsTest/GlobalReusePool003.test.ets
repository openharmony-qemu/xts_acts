'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { IReusableInfo, IReusePool, AppStorage } from '@kit.ArkUI';


export default function GlobalReusePool003Test() {
  describe('GlobalReusePool003Test', () => {
    beforeAll(async () => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("GlobalReusePool003Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/GlobalReusePool003",
      }
      try {
        const GlobalReusePool003Test = AppStorage.get<Router>("router") as Router
        GlobalReusePool003Test.clear();
        let pages:router.RouterState = GlobalReusePool003Test.getState();
        console.info("get GlobalReusePool003Test state pages: " + JSON.stringify(pages));
        if (!("GlobalReusePool003" == pages.name)) {
          console.info("get GlobalReusePool003Test state pages.name: " + JSON.stringify(pages.name));
          // let result = await GlobalReusePool003Test.pushUrl(options);
          GlobalReusePool003Test.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GlobalReusePool003Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalReusePool003Test page error:" + err);
      }
      console.info("GlobalReusePool003Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GlobalReusePool003Test after each called");
    });

    afterAll(async () => {
      AppStorage.delete('GlobalReuse003')
      console.info('GlobalReusePool003Test afterAll: all tests finished');
    });


    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_OFF_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_OFF_0100
     * @tc.desc   Test getReusePool API returns valid pool when configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_OFF_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_OFF_0100 START');
      let driver = Driver.create();
      let globalReuse003: boolean | undefined = AppStorage.get<boolean | undefined>('GlobalReuse003') as boolean | undefined;
      expect(globalReuse003).assertUndefined();
      let button = await driver.findComponent(ON.id('GlobalReuse003Change'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(500);
      globalReuse003  = AppStorage.get<boolean | undefined>('GlobalReuse003')
      expect(globalReuse003).assertUndefined()
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_OFF_0100 END');
      done();
    });
  })
}
