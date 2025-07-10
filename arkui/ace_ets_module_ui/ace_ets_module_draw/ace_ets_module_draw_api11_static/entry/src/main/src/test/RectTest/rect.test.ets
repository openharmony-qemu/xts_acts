/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function rectNeJsunit() {
  describe('rectNeTest', () => {
    beforeAll(async () => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options:router.RouterOptions = {
        url:'MainAbility/pages/Rect/rect',
      }
      try {
        const rect = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        rect.clear();
        let pages = rect.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          // let result = await rect.pushUrl(options);
          rect.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push rect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("rectNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testrectNe0001
     * @tc.desic         acerectNeEtsTest0001
     */
    it('testrectNe0001_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('rectNe testrectNe0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rect');
      console.info("[testrectNe0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("90.00%");
      console.info("[testrectNe0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testrectNe0002
     * @tc.desic         acerectNeEtsTest0002
     */
    it('testrectNe0002_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('rectNe testrectNe0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rect');
      console.info("[testrectNe0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("50.00px");
      console.info("[testrectNe0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
