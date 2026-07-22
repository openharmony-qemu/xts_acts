'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import hilog from '@ohos.hilog';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { ButtonType, ControlSize } from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';

export default function EntryParamsTest() {
  describe('EntryParamsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMgmtUI.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("EntryParamsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/entry/EntryParams",
      }
      try {
        const EntryParamsTest = AppStorage.get<Router>("router") as Router
        EntryParamsTest.clear();
        let pages: router.RouterState = EntryParamsTest.getState();
        console.info("get EntryParamsTest state pages: " + JSON.stringify(pages));
        if (!("EntryParams" == pages.name)) {
          console.info("get EntryParamsTest state pages.name: " + JSON.stringify(pages.name));
          EntryParamsTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push EntryParamsTest page error:" + err);
      }
      console.info("EntryParamsTest beforeEach end");
    });
    afterEach(async () => {
      console.info("EntryParamsTest after each called");
    });

    afterAll(async () => {
      console.info('EntryParamsTest afterAll: all tests finished');
    });

    /**
     * @tc.name: EntryParamsTest_0100
     * @tc.number: SUB_ARKUI_EntryParamsTest_0100
     * @tc.desc: SUB_ARKUI_EntryParamsTest_0100
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('EntryParamsTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EntryParamsTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("btn2"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('propA');
      await CommonFunc.sleep(1000);
      let text_1 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      expect(text_1).assertEqual('49');
      await CommonFunc.sleep(1000);
      let btn1= await driver.findComponent(ON.id("btn1"));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3= await driver.findComponent(ON.id("btn3"));
      await (btn3?.click() as Promise<void>);
      let strJson1: string = inspector.getInspectorByKey('clear');
      await CommonFunc.sleep(1000);
      let text_2 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content');
      expect(text_2).assertEqual('true');
      console.info('[EntryParamsTest_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  });
}