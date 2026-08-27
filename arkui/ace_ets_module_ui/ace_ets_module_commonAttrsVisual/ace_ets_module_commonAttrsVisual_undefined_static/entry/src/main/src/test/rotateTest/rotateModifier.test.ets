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

export default function RotateModifierTest() {
  describe('RotateModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RotateModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rotate/rotateModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RotateModifierTest state pages:" + JSON.stringify(pages));
        if (!("rotateModifier" == pages.name)) {
          console.info("get RotateModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RotateModifierTest page error:" + err);
      }
      console.info("RotateModifierTest beforeEach end");
    });
    /**
     * @tc.number    RotateModifierUndefinedTest_static_0100
     * @tc.name      RotateModifierUndefinedTest_static_0100
     * @tc.desc      RotateModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('RotateModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[RotateModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RotateModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('rotateModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RotateModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[RotateModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[RotateModifierUndefinedTest_static_0100] rotate: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rotate')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rotate')))
        .assertEqual('{"x":"0.000000","y":"0.000000","z":"1.000000","angle":"90.000000","perspective":"0.000000","centerX":"50.00%","centerY":"50.00%","centerZ":"50.00%"}');
      let changeBtn = await driver.findComponent(ON.id('rotateModifier'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('RotateModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RotateModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[RotateModifierUndefinedTest_static_0100] click rotate");
      strJson = inspector.getInspectorByKey('rotateModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('RotateModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('rotate')))
        .assertEqual('{"x":"0.000000","y":"0.000000","z":"0.000000","angle":"0.000000","perspective":"0.000000","centerX":"0.00vp","centerY":"0.00vp","centerZ":"0.00vp"}');
      console.info('[RotateModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
