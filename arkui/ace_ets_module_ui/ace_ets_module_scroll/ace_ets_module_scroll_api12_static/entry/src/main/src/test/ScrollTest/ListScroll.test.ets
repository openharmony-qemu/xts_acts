/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager, Callback} from '../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest} from '../Util.test';
let testAbilityContext:common.UIAbilityContext;

let domain: number = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;


export default function ListScrollTest1() {
  describe('ListScrollTest1', () => {

    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number    ListScroll
     * @tc.name      ListScrollTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ListScrollTest1_0100', 0, async (done: () => void): Promise<void> => {
      console.info('ListScrollTest_0100 START');
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('listScroll_4');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("ListScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      driver.swipe(Math.round(left + width*0.2),Math.round(bottom - height/4),Math.round(left + width*0.2),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('listScroll_1');
      let strJson1 = inspector.getInspectorByKey('listScroll_2');
      let strJson2 = inspector.getInspectorByKey('listScroll_3');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ListScrollTest_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ListScrollTest_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[ListScrollTest_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillScroll');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onDidScroll');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onScrollVisibleContentChange');
      console.info('[ListScrollTest_0100] END');
      done();
    });
  })
}

