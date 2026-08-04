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

export default function ExtendableListBuiltInTest() {
  describe('ExtendableListBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableListBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableListBuiltIn",
      }
      try {
        const ExtendableListBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableListBuiltInTest.clear();
        let pages: router.RouterState = ExtendableListBuiltInTest.getState();
        console.info("get ExtendableListBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableListBuiltIn" == pages.name)) {
          console.info("get ExtendableListBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableListBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableListBuiltInTest page error:" + err);
      }
      console.info("ExtendableListBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableListBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableListBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableListBuiltIn_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_CUSTOM_ATTRIBUTE_0100
     * @tc.desc: Test ExtendableList with custom newAttribute method that sets height and width
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListBuiltIn_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListBuiltIn_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableList_001');
      await CommonFunc.sleep(1000);
      let height=JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')
      let width=JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')
      console.info("[ExtendableListBuiltIn_CustomAttribute_0100] height is: " + height + ", width is: " + width);
      expect(height).assertEqual('50.00%');
      expect(width).assertEqual('30.00%');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableListBuiltIn_CustomAttribute_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableListBuiltIn_Divider_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_DIVIDER_0200
     * @tc.desc: Test ExtendableList with divider property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListBuiltIn_Divider_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("ExtendableList_002"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ExtendableList_002');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('a');
      console.info('[ExtendableListBuiltIn_Divider_0200] END');
      done();
    });
  });
}