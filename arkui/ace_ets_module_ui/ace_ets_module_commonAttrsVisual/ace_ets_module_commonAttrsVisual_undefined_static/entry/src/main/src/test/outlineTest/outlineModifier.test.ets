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

export default function OutlineModifierTest() {
  describe('OutlineModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("OutlineModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/outline/outlineModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OutlineModifierTest state pages:" + JSON.stringify(pages));
        if (!("outlineModifier" == pages.name)) {
          console.info("get OutlineModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OutlineModifierTest page error:" + err);
      }
      console.info("OutlineModifierTest beforeEach end");
    });
    /**
     * @tc.number    OutlineModifierUndefinedTest_static_0100
     * @tc.name      OutlineModifierUndefinedTest_static_0100
     * @tc.desc      OutlineModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('OutlineModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OutlineModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('outlineModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[OutlineModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[OutlineModifierUndefinedTest_static_0100] outline: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outline')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outline')))
        .assertEqual('\"{\\"style\\":{\\"left\\":\\"OutlineStyle.DOTTED\\",\\"top\\":\\"OutlineStyle.SOLID\\",\\"right\\":\\"OutlineStyle.DOTTED\\",\\"bottom\\":\\"OutlineStyle.DASHED\\"},\\"color\\":{\\"left\\":\\"#FFE3BBBB\\",\\"right\\":\\"#FF0000FF\\",\\"top\\":\\"#FFFF0000\\",\\"bottom\\":\\"#FF008000\\"},\\"width\\":{\\"left\\":\\"3.00vp\\",\\"top\\":\\"10.00vp\\",\\"start\\":\\"0.00vp\\",\\"end\\":\\"0.00vp\\",\\"right\\":\\"6.00vp\\",\\"bottom\\":\\"15.00vp\\"},\\"radius\\":{\\"topLeft\\":\\"10.00vp\\",\\"topRight\\":\\"20.00vp\\",\\"bottomLeft\\":\\"40.00vp\\",\\"bottomRight\\":\\"80.00vp\\"}}\"');
      let changeBtn = await driver.findComponent(ON.id('outlineModifier'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[OutlineModifierUndefinedTest_static_0100] click outline");
      strJson = inspector.getInspectorByKey('outlineModifierTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outline')))
        .assertEqual('\"{\\"style\\":\\"OutlineStyle.SOLID\\",\\"color\\":\\"#FF000000\\",\\"width\\":\\"0.00vp\\",\\"radius\\":{\\"topLeft\\":\\"0.00vp\\",\\"topRight\\":\\"0.00vp\\",\\"bottomLeft\\":\\"0.00vp\\",\\"bottomRight\\":\\"0.00vp\\"}}\"');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('OutlineModifierUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info('[OutlineModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
