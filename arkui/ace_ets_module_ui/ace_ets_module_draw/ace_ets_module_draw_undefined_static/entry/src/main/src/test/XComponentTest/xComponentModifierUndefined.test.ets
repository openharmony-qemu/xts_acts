'use static';
/*
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


import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function XComponentModifierUndefinedTest() {
  describe('XComponentModifierUndefinedTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("XComponentModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/xComponentModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get XComponentModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("xComponentModifierUndefined" == pages.name)) {
          console.info("get xComponentModifierUndefined pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push xComponentModifierUndefined page error:" + err);
      }
      console.info("XComponentModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    XComponentModifierUndefinedTest_static_0100
     * @tc.name      XComponentModifierUndefinedTest_static_0100
     * @tc.desc      XComponentModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('XComponentModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[XComponentModifierUndefinedTest_static_0100] START');
      try {
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('XComponentM');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('XComponentM_enableSecure'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('XComponentM');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure'))
        .assertEqual('false');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[XComponentModifierUndefinedTest_static_0100] END');
      done();
      } catch (err) {
        console.error('XComponentModifierUndefinedTest_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    XComponentModifierUndefinedTest_static_0200
     * @tc.name      XComponentModifierUndefinedTest_static_0200
     * @tc.desc      XComponentModifierUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('XComponentModifierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[XComponentModifierUndefinedTest_static_0200] START');
      try {
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('XComponentM');
      let resetTextBtn = await driver.findComponent(ON.id('XComponentM_resetText'));

      let text = await driver.findComponent(ON.id('XComponentM_text'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('onLoad');

      let changeBtn_show = await driver.findComponent(ON.id('XComponentM_show'));
      await (changeBtn_show?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('XComponentM');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onDestroy');
      await CommonFunc.sleep(1000);
      await (resetTextBtn?.click() as Promise<void>);

      let changeBtn_onLoad = await driver.findComponent(ON.id('XComponentM_onLoad'));
      await (changeBtn_onLoad?.click() as Promise<void>);
      let changeBtn_onDestroy = await driver.findComponent(ON.id('XComponentM_onDestroy'));
      await (changeBtn_onDestroy?.click() as Promise<void>);
      await (changeBtn_show?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      await (changeBtn_show?.click() as Promise<void>);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[XComponentModifierUndefinedTest_static_0200] END');
      done();
      } catch (err) {
        console.error('XComponentModifierUndefinedTest_static_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    });

  })
}
