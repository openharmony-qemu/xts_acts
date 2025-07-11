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
import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON ,Component} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function onHoverStatusChange() {
  describe('onHoverStatusChange', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
 beforeEach(async (): Promise<void> => {
      console.info("onHoverStatusChange beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onHoverStatusChange state pages:" + JSON.stringify(pages));
        if (!("onHoverStatusChange" == pages.name)) {
          console.info("get  onHoverStatusChange pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/onHoverStatusChange/onHoverStatusChange"
          })
          await CommonFunc.sleep(2000);
          // let result = await onHoverStatusChange.pushUrl({
          //   url: "MainAbility/pages/onHoverStatusChange/onHoverStatusChange"
          // })
          // await CommonFunc.sleep(2000);
          // console.info("push onHoverStatusChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onHoverStatusChange page error:" + err);
      }
      console.info("onHoverStatusChange foreEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("onHoverStatusChange after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_Common_onHoverStatusChange_static_001
     * @tc.desc onHoverStatusChange test
     * @tc.level Level 3
     * @tc.type
     */

    it('onHoverStatusChange_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onHoverStatusChange_static_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onHoverStatusChangeText');
      await CommonFunc.sleep(200);
      console.info("[onHoverStatusChange_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('');
      console.info('[onHoverStatusChange_static_001] END');
      done();
    });


  })
}
