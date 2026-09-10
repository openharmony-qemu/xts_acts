'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function RepeatReusableTrue1(): void {
  describe('RepeatReusableTrue', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RepeatReusableTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Reusable/RepeatReusableTrue1",
      }
      try {
        const RepeatReusableTrue = AppStorage.get<Router>("router") as Router
        RepeatReusableTrue.clear();
        let pages:router.RouterState = RepeatReusableTrue.getState();
        console.info("get RepeatReusableTrue state pages: " + JSON.stringify(pages));
        if (!("RepeatReusableTrue" == pages.name)) {
          console.info("get RepeatReusableTrue state pages.name: " + JSON.stringify(pages.name));
          // let result = await RepeatReusableTrue.pushUrl(options);
          RepeatReusableTrue.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RepeatReusableTrue success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatReusableTrue page error:" + err);
      }
      console.info("RepeatReusableTrue beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatReusableTrue after each called");
    });

    
    /**
     * @tc.number   SUB_ARKUI_RepeatReusableTrue_static_0100
     * @tc.name     SUB_ARKUI_RepeatReusableTrue_static_0100
     * @tc.desc     SUB_ARKUI_RepeatReusableTrue_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_RepeatReusableTrue_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_RepeatReusableTrue_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("reusabletrue"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      let text = await driver.findComponent(ON.text('[a] index99: item_99'))
      expect(text != null).assertTrue()
      console.info('[SUB_ARKUI_RepeatReusableTrue_static_0100] END');
      done();
    });
  })
}

