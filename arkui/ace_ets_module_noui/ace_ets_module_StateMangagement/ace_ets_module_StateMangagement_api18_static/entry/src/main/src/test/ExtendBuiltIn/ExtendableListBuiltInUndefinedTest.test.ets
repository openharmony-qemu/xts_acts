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

export default function ExtendableListBuiltInUndefinedTest() {
  describe('ExtendableListBuiltInUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableListBuiltInUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableListBuiltInUndefined",
      }
      try {
        const ExtendableListBuiltInUndefinedTest = AppStorage.get<Router>("router") as Router
        ExtendableListBuiltInUndefinedTest.clear();
        let pages: router.RouterState = ExtendableListBuiltInUndefinedTest.getState();
        console.info("get ExtendableListBuiltInUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableListBuiltInUndefined" == pages.name)) {
          console.info("get ExtendableListBuiltInUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableListBuiltInUndefinedTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableListBuiltInUndefinedTest page error:" + err);
      }
      console.info("ExtendableListBuiltInUndefinedTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableListBuiltInUndefinedTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableListBuiltInUndefinedTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableListBuiltInUndefined_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_UNDEFINED_ATTRIBUTE_0100
     * @tc.desc: Test ExtendableList with custom newAttribute method that sets height and width
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListBuiltInUndefined_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListBuiltInUndefined_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableList_undefined_001');
      await CommonFunc.sleep(1000);
      let space=JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')
      expect(space).assertEqual('0.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableListBuiltInUndefined_CustomAttribute_0100] END');
      done();
    });
  });
}