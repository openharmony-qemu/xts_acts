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
import { Component, UiWindow, ON, Driver, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function swiperSyncType() {
  describe('swiperSyncType', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("swiperSyncType beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperSyncType",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get swiperSyncType state pages:" + JSON.stringify(pages));
        if (!("swiperSyncType" == pages.name)) {
          console.info("get swiperSyncType pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperSyncType page result:");
        }
      } catch (err) {
        console.error("push swiperSyncType page error:" + err);
      }
      console.info("swiperSyncType beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperSyncType after each called");
    });

    /**
     * @tc.number    swiperSyncType_static_001
     * @tc.name      swiperSyncType_static_001
     * @tc.desc      Set SwinperDynamicSyncSceneType.
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('swiperSyncType_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[swiperSyncType_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('sceneType_set'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('sceneType_swiper');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperSyncType_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setFrameRateRangeSwiper1: 60Swiper11: 30');
      console.info('[swiperSyncType_static_0100] END');
      done();
    });
  })
}
