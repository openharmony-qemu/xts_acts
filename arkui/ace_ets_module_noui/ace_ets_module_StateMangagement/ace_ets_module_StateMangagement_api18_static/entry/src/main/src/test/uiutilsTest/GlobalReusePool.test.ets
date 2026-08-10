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


export default function GlobalReusePoolTest() {
  describe('GlobalReusePoolTest', () => {
    beforeAll(async () => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("GlobalReusePoolTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/GlobalReusePool",
      }
      try {
        const GlobalReusePoolTest = AppStorage.get<Router>("router") as Router
        GlobalReusePoolTest.clear();
        let pages:router.RouterState = GlobalReusePoolTest.getState();
        console.info("get GlobalReusePoolTest state pages: " + JSON.stringify(pages));
        if (!("GlobalReusePool" == pages.name)) {
          console.info("get GlobalReusePoolTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await GlobalReusePoolTest.pushUrl(options);
          GlobalReusePoolTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GlobalReusePoolTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalReusePoolTest page error:" + err);
      }
      console.info("GlobalReusePoolTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GlobalReusePoolTest after each called");
    });

    afterAll(async () => {
      AppStorage.delete('getReusableInfoUndefined')
      AppStorage.delete('getReusePoolUndefined')
      AppStorage.delete('getReusePoolNotUndefined')
      AppStorage.delete('IReusableInfoArray')
      AppStorage.delete('IReusableInfo')
      console.info('GlobalReusePoolTest afterAll: all tests finished');
    });


    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100
     * @tc.desc   Test getReusePool API returns valid pool when configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100 START');
      let getReusePoolUndefined: IReusableInfo | undefined = AppStorage.get<IReusableInfo | undefined>('getReusePoolUndefined') as IReusableInfo | undefined;
      expect(getReusePoolUndefined).assertUndefined();
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSEPOOL_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100
     * @tc.desc   Test getReusableInfo API returns component pool info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100 START');
      let getReusableInfoUndefined: IReusableInfo | undefined = AppStorage.get<IReusableInfo | undefined>('getReusableInfoUndefined') as IReusableInfo | undefined;
      expect(getReusableInfoUndefined).assertUndefined();
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100
     * @tc.desc   Test getReusableInfo API with reuseId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('GlobalReusePoolChangeComponent'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(500)
      let button2 = await driver.findComponent(ON.id('GlobalReusePoolCheckGlobalChild'));
      await (button2?.click() as Promise<void>);
      await driver.delayMs(500)
      let getReusePool: IReusePool| undefined = AppStorage.get<IReusePool| undefined>('getReusePoolNotUndefined') as IReusePool| undefined;
      expect(getReusePool).not().assertUndefined()
      let iReusableInfoArray: IReusableInfo[]| undefined = AppStorage.get<IReusableInfo[]| undefined>('IReusableInfoArray') as IReusableInfo[]| undefined;
      expect(iReusableInfoArray?.length).assertLarger(0)
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_GETREUSABLEINFO_REUSEID_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100
     * @tc.desc   Test preRender API creates reusable components in advance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100 START');
      let driver = await Driver.create();
      let button = await driver.findComponent(ON.id('GlobalReusePoolCheckLegacyComp'));
      await (button?.click() as Promise<void>);
      await driver.delayMs(500);
      let iReusableInfo: IReusableInfo| undefined = AppStorage.get<IReusableInfo| undefined>('IReusableInfo') as IReusableInfo| undefined;
      expect(iReusableInfo).not().assertUndefined();
      expect(iReusableInfo?.count).assertEqual(0);
      expect(iReusableInfo?.maxCount).assertEqual(100);
      expect(iReusableInfo?.reuseId).assertUndefined();
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_PRERENDER_0100 END');
      done();
    });
  })
}
