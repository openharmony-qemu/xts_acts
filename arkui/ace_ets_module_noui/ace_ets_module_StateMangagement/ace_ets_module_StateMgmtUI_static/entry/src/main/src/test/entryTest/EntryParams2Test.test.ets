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

export default function EntryParams2Test() {
  describe('EntryParams2Test', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMgmtUI.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("EntryParams2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/entry/EntryParams2",
      }
      try {
        const EntryParams2Test = AppStorage.get<Router>("router") as Router
        EntryParams2Test.clear();
        let pages: router.RouterState = EntryParams2Test.getState();
        console.info("get EntryParams2Test state pages: " + JSON.stringify(pages));
        if (!("EntryParams2" == pages.name)) {
          console.info("get EntryParams2Test state pages.name: " + JSON.stringify(pages.name));
          EntryParams2Test.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push EntryParams2Test page error:" + err);
      }
      console.info("EntryParams2Test beforeEach end");
    });
    afterEach(async () => {
      console.info("EntryParams2Test after each called");
    });

    afterAll(async () => {
      console.info('EntryParams2Test afterAll: all tests finished');
    });

    /**
     * @tc.name: EntryParams2Test_0100
     * @tc.number: SUB_ARKUI_EntryParams2Test_0100
     * @tc.desc: SUB_ARKUI_EntryParams2Test_0100
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('EntryParams2Test_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EntryParams2Test_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("EntryParams2_btn2"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('propB');
      await CommonFunc.sleep(1000);
      let text_1 = JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
      expect(text_1).assertEqual('2');
      await CommonFunc.sleep(1000);
      let btn1= await driver.findComponent(ON.id("EntryParams2_btn1"));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn3= await driver.findComponent(ON.id("EntryParams2_btn3"));
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('EntryParams2_clear');
      await CommonFunc.sleep(1000);
      let text_2 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content');
      expect(text_2).assertEqual('true');
      console.info('[EntryParams2Test_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  });
}