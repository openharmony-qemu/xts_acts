/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ActsAbilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupControl/popupfirst',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsAbilityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ActsAbilityTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ActsAbilityTest page error:" + err);
      }
      console.info("ActsAbilityTest beforeEach end");
    });


    /*
     * @tc.number    ArkUX_Stage_Popup_static_0100
     * @tc.name      ArkUX_Stage_Popup_static_0100
     * @tc.desc      ArkUX_Stage_Popup_static_0100
     * @tc.level     2
     */
    it('ArkUX_Stage_Popup_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Popup_0100 START');
      setTimeout(() => {
        try {
          console.info("ArkUX_Stage_Popup_0100 component obj is: " +
          JSON.stringify(JSON.parseJsonElement(inspector.getInspectorByKey('forPopup'))));
          expect(JSON.parseJsonElement(inspector.getInspectorByKey('forPopup'))
            .getElement('$attrs')
            .getString('bindPopup')).assertEqual(undefined);
          console.info('ArkUX_Stage_Popup_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Popup_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

  })
}