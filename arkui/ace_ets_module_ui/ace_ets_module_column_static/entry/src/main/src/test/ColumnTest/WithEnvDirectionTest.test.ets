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
import { Driver, ON } from '@ohos.UiTest';

import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';

export default function WithEnvDirectionTest() {
  describe('WithEnvDirectionTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("WithEnvDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/WithEnvDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WithEnvDirection state pages:" + JSON.stringify(pages));
        if (!("WithEnvDirection" == pages.name)) {
          console.info("get WithEnvDirection pages.name:" + JSON.stringify(pages.name));
          
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push WithEnvDirection page error:" + err);
      }
      console.info("WithEnvDirection beforeEach end");
      
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   WithEnvDirectionTest_0100
     * @tc.number SUB_ARKUI_API_WithEnvDirectionTest_0100
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WithEnvDirectionTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[WithEnvDirectionTest_0100] START');
      try {
        let driver = Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson1 = inspector.getInspectorByKey('WithEnvDirectionText2');

        let button = await driver.findComponent(ON.id('SetDirectionLtrButton'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson2 = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson3 = inspector.getInspectorByKey('WithEnvDirectionText2');

        let button1 = await driver.findComponent(ON.id('SetDirectionRtlButton'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson4 = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson5 = inspector.getInspectorByKey('WithEnvDirectionText2');

        let button2 = await driver.findComponent(ON.id('SetDirectionAutoButton'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson6 = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson7 = inspector.getInspectorByKey('WithEnvDirectionText2');

        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
        expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
        expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      } catch (error) {
        console.error('[WithEnvDirectionTest_0100] error: ' + error);
        expect().assertFail();
      }
      console.info('[WithEnvDirectionTest_0100] END');
      done();
    });

    /**
     * @tc.name   WithEnvDirectionTest_0200
     * @tc.number SUB_ARKUI_API_WithEnvDirectionTest_0200
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WithEnvDirectionTest_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[WithEnvDirectionTest_0200] START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let text1: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText1');
        let text2: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText2');

        let button = await driver.findComponent(ON.id('SetLanguageUg'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let text3: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText1');
        let text4: RectValue = CommonFunc.getComponentRect('WithEnvDirectionText2');
        let strJson = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson1 = inspector.getInspectorByKey('WithEnvDirectionText2');

        let button1 = await driver.findComponent(ON.id('SetDirectionLtrButton'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson2 = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson3 = inspector.getInspectorByKey('WithEnvDirectionText2');

        let button2 = await driver.findComponent(ON.id('SetDirectionRtlButton'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson4 = inspector.getInspectorByKey('WithEnvDirectionText1');
        let strJson5 = inspector.getInspectorByKey('WithEnvDirectionText2');

        expect(text1.right - text2.left < 0).assertTrue();
        expect(text3.left - text4.right > 0).assertTrue();
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
        expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      } catch (error) {
        console.error('[WithEnvDirectionTest_0200] error: ' + error);
        expect().assertFail();
      }
      console.info('[WithEnvDirectionTest_0200] END');
      done();
    });

  })
}