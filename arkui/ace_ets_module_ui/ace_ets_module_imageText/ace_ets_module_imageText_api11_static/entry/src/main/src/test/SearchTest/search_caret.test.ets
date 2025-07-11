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


export default function search_caret() {
  describe('search_caret', () => {
    beforeAll(() => {
      console.info("search_caret beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/search_caret',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search_caret state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get search_caret pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_caret page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search_caret page error:" + err);
      }
      console.info("search_caret beforeEach end");
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0270
      * @tc.name  : search_caret_static_001
      * @tc.desc  : set caretPosition to 1
      * @tc.level : Level 3
      */
    it('search_caret_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_001] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_002 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[search_caret_static_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0290
      * @tc.name  : search_caret_static_002
      * @tc.desc  : set caretPosition to 5
      * @tc.level : Level 3
      */
    it('search_caret_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_002] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_002 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('5');
      console.info('[search_caret_static_002] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0310
      * @tc.name  : search_caret_static_003
      * @tc.desc  : set caretPosition to 3
      * @tc.level : Level 3
      */
    it('search_caret_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_003] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_003 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[search_caret_static_003] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0280
      * @tc.name  : search_caret_static_004
      * @tc.desc  : set caretPosition to 20
      * @tc.level : Level 3
      */
    it('search_caret_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_004] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret20'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_004 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('9');
      console.info('[search_caret_static_004] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_TEXT_NEWINTERFACE_0300
      * @tc.name  : search_caret_static_005
      * @tc.desc  : set caretPosition to -1
      * @tc.level : Level 3
      */
    it('search_caret_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[search_caret_static_005] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SearchCaret_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('search_caret_static_005 click success');
      let strJson1 = inspector.getInspectorByKey('SearchCaretText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[search_caret_static_005] END');
      done();
    });
  })
}
