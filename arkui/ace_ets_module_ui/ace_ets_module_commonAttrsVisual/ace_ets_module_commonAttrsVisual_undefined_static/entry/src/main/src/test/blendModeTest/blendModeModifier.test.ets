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

export default function BlendModeModifierTest() {
  describe('BlendModeModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("BlendModeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/blendMode/blendModeModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get BlendModeModifierTest state pages:" + JSON.stringify(pages));
        if (!("blendModeModifier" == pages.name)) {
          console.info("get BlendModeModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BlendModeModifierTest page error:" + err);
      }
      console.info("BlendModeModifierTest beforeEach end");
    });
    /**
     * @tc.number    BlendModeModifierUndefinedTest_static_0100
     * @tc.name      BlendModeModifierUndefinedTest_static_0100
     * @tc.desc      BlendModeModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('BlendModeModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[BlendModeModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BlendModeModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blendModeModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BlendModeModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[BlendModeModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[BlendModeModifierUndefinedTest_static_0100] blendMode: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blendMode')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blendMode')))
        .assertEqual('7');
      let changeBtn = await driver.findComponent(ON.id('blendModeModifier'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('BlendModeModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BlendModeModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[BlendModeModifierUndefinedTest_static_0100] click blendMode");
      strJson = inspector.getInspectorByKey('blendModeModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BlendModeModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('blendMode')))
        .assertEqual('0');
      console.info('[BlendModeModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
