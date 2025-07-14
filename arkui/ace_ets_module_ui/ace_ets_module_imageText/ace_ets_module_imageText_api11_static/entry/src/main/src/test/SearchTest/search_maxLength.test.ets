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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


export default function search_maxLength() {
  describe('search_maxLength', () => {
    beforeAll(() => {
      console.info("search_maxLength beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("search_maxLength beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/search_maxLength',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search_maxLength state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get search_maxLength pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_maxLength page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_maxLength page error:" + err);
      }
      console.info("search_maxLength beforeEach end");
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0010
      * @tc.name  : SearchMaxLength_static_001
      * @tc.desc  : set maxLength to 6
      * @tc.level : Level 3
      */
    it('SearchMaxLength_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SearchMaxLength_static_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength6'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await (setText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength_static_001 click success');
      let strJson1 = inspector.getInspectorByKey('SearchMaxLength');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength_static_001] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(obj1.getElement('$attrs').getString('value')).assertEqual('123456');
      console.info('[SearchMaxLength_static_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0030
      * @tc.name  : SearchMaxLength_static_003
      * @tc.desc  : set maxLength to 4
      * @tc.level : Level 3
      */
    it('SearchMaxLength_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SearchMaxLength_static_003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchMaxLength4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let setText = await driver.findComponent(ON.id('setText'));
      await (setText?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('SearchMaxLength_static_003 click success');
      let strJson1 = inspector.getInspectorByKey('SearchMaxLength');
      let obj3 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SearchMaxLength_static_003] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(obj3.getElement('$attrs').getString('value')).assertEqual('1234');
      console.info('[SearchMaxLength_static_003] END');
      done();
    });
  })
}
