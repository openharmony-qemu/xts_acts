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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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

export default function canOverGrid() {
  describe('canOverGrid', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("canOverGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/canOverGrid",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get canOverGrid state pages:" + JSON.stringify(pages));
        if (!("canOverGrid" == pages.name)) {
          console.info("get canOverGrid pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push canOverGrid page error:" + err);
      }
      console.info("canOverGrid beforeEach end");
    });


    /*
     * @tc.number    canOverGrid_static_0100
     * @tc.name      canOverGrid_static_0100
     * @tc.desc      canOverGrid_static_0100
     * @tc.level     2
     */
    it('canOverGrid_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverGrid_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_true')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      await CommonFunc.sleep(5000);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_static_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_static_0100] gridItem0.top=
        ${gridItem0.top}`);
      const uiContext = new UIContext()
      console.info(`[canOverGrid_static_0100] gridItem0.top - UIContext.getFocusedUIContext()!.vp2px(30)=
        ${gridItem0.top - UIContext.getFocusedUIContext()!.vp2px(30)}`);
      expect(Math.floor(Math.abs(gridItem0.top - UIContext.getFocusedUIContext()!.vp2px(30) - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_static_0100] END');
      done();
    });


    /*
     * @tc.number    canOverGrid_static_0200
     * @tc.name      canOverGrid_static_0200
     * @tc.desc      canOverGrid_static_0200
     * @tc.level     2
     */
    it('canOverGrid_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverGrid_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_false')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_static_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_static_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_static_0200] END');
      done();
    });


    /*
     * @tc.number    canOverGrid_static_0300
     * @tc.name      canOverGrid_static_0300
     * @tc.desc      canOverGrid_static_0300
     * @tc.level     2
     */
    it('canOverGrid_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverGrid_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_null')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_static_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_static_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_static_0300] END');
      done();
    });


    /*
     * @tc.number    canOverGrid_static_0400
     * @tc.name      canOverGrid_static_0400
     * @tc.desc      canOverGrid_static_0400
     * @tc.level     2
     */
    it('canOverGrid_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[canOverGrid_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_grid_ude')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let grid = CommonFunc.getComponentRectOnScreen('canOverScroll_grid');
      let gridItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_grid_0');

      console.info(`[canOverGrid_static_0100] grid.top=
        ${grid.top}`);
      console.info(`[canOverGrid_static_0100] gridItem0.top=
        ${gridItem0.top}`);
      expect(Math.abs(Math.floor(gridItem0.top - grid.top)) <= 1).assertTrue();
      console.info('[canOverGrid_static_0400] END');
      done();
    });
  })
}
