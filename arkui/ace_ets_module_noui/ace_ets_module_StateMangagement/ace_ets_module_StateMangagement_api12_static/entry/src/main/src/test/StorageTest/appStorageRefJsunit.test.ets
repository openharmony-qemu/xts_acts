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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function appStorageRefJsunit() {
  describe('appStorageRefJsunit', () => {
    beforeAll(() => {
      console.info("appStorageRefJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("appStorageRefJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/appStorageRef",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appStorageRefJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get appStorageRefJsunit pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push appStorageRefJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appStorageRefJsunit page error:" + err);
      }
      console.info("appStorageRefJsunit beforeEach end");
    });
    /**
     * @tc.number: SUB_ACE_BASIC_ETS_REF_0100
     * @tc.name: appStorageRefJsunit_static_0100
     * @tc.desc: aceEtsTest_ref
     * @tc.level: Level 2
     * @tc.type:
     * @tc.size:
     */
    it('appStorageRefJsunit_static_0100', 0, async (): Promise<void> => {
      console.info('appStorageRefJsunit001 START');
      let strJson = inspector.getInspectorByKey('app_ref_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[appStorageRefJsunit001] component obj is: " + JSON.stringify(obj));
      console.info("[appStorageRefJsunit001] ref: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("ref:52");

      let strJson2 = inspector.getInspectorByKey('app_ref_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[appStorageRefJsunit001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[appStorageRefJsunit001] setAndRef: " + JSON.stringify(obj2.getElement('$attrs').getString('label')));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual("setAndRef:37");
      console.info('appStorageRefJsunit_static_0100 END');
    });
  })
}