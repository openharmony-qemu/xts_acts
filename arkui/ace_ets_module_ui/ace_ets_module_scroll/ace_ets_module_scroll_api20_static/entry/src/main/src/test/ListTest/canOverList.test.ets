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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function canOverList() {
  describe('canOverList', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("canOverList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/canOverList",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get canOverList state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/List/canOverList" == pages.name)) {
          console.info("get canOverList pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push canOverList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canOverList page error:" + err);
      }
      console.info("canOverList beforeEach end");
    });

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    
    /*
     * @tc.number   canOverList_static_0100
     * @tc.name     canOverList_static_0100
     * @tc.desc     canOverList_static_0100
     * @tc.level    Level.LEVEL0
     */
it('canOverList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverList_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_true')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info(`[canOverList_static_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_static_0100] vp2px(30)=
        ${uiContext.vp2px(30)}`);
      console.info(`[canOverList_static_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.floor(Math.abs(listItem0.top - uiContext.vp2px(30) - list.top)) <= 1).assertTrue();
      console.info('[canOverList_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   canOverList_static_0200
     * @tc.name     canOverList_static_0200
     * @tc.desc     canOverList_static_0200
     * @tc.level    Level.LEVEL0
     */
it('canOverList_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverList_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_false')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_static_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_static_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_static_0200] END');
      done();
    });

    
    /*
     * @tc.number   canOverList_static_0300
     * @tc.name     canOverList_static_0300
     * @tc.desc     canOverList_static_0300
     * @tc.level    Level.LEVEL0
     */
it('canOverList_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverList_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_null')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_static_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_static_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_static_0300] END');
      done();
    });

    
    /*
     * @tc.number   canOverList_static_0400
     * @tc.name     canOverList_static_0400
     * @tc.desc     canOverList_static_0400
     * @tc.level    Level.LEVEL0
     */
it('canOverList_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverList_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_list_ude')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let list = CommonFunc.getComponentRectOnScreen('canOverScroll_list');
      let listItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_list_0');

      console.info(`[canOverList_static_0100] list.top=
        ${list.top}`);
      console.info(`[canOverList_static_0100] listItem0.top=
        ${listItem0.top}`);
      expect(Math.abs(Math.floor(listItem0.top - list.top)) <= 1).assertTrue();
      console.info('[canOverList_static_0400] END');
      done();
    });
  })
}
