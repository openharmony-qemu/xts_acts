'use static';
/**
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

import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function ContrastModifierTest() {
  describe('ContrastModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ContrastModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/contrast/contrastModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ContrastModifierTest state pages:" + JSON.stringify(pages));
        if (!("contrastModifier" == pages.name)) {
          console.info("get ContrastModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ContrastModifierTest page error:" + err);
      }
      console.info("ContrastModifierTest beforeEach end");
    });
    /**
     * @tc.number    ContrastModifierUndefinedTest_static_0100
     * @tc.name      ContrastModifierUndefinedTest_static_0100
     * @tc.desc      ContrastModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ContrastModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ContrastModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ContrastModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('contrastModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ContrastModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[ContrastModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ContrastModifierUndefinedTest_static_0100] contrast: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contrast')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contrast')))
        .assertEqual('5');
      let changeBtn = await driver.findComponent(ON.id('contrastModifier'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('ContrastModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ContrastModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[ContrastModifierUndefinedTest_static_0100] click contrast");
      strJson = inspector.getInspectorByKey('contrastModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ContrastModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('contrast')))
        .assertEqual('1');
      console.info('[ContrastModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
