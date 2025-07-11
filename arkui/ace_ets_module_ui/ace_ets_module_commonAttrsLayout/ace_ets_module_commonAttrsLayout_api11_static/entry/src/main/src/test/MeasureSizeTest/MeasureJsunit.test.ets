/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { vp2px } from '@ohos.arkui.component';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MeasureJsunit() {
  describe('MeasureJsunit', () => {
    beforeAll(() => {
      console.info("MeasureJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(()  => {
      console.info("MeasureJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasureSize/measureSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get measureJsunit state pages: " + JSON.stringify(pages));
        if (!("measureSize" == pages.name)) {
          console.info("get measureJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await CommonFunc.sleep(3000);
          // console.info("push measureJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push measureJsunit page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_ARKUI_MEASURE_JSAPI_001
     * @tc.name  : Test measureJsunit_static_0100
     * @tc.desc  : Test measureTextSize function
     */
    it('measureJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('measureJsunit_static_0100 START');
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parseJsonElement(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parseJsonElement(strJsonMaxLine3);

      console.log("[measureJsunit_static_0100] component strJsonMaxLine2 is: " + JSON.stringify(strJsonMaxLine2Obj));
      console.log("[measureJsunit_static_0100] component strJsonMaxLine3 is: " + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.getElement('$attrs').getString('content')).assertEqual(strJsonMaxLine3Obj.getElement('$attrs').getString('content'));
      done();
    });

    /**
     * @tc.number: SUB_ARKUI_MEASURE_JSAPI_002
     * @tc.name  : Test measureJsunit_static_0200
     * @tc.desc  : Test measureTextSize function
     */
    it('measureJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('measureJsunit_static_0200 START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndent'));
      await CommonFunc.sleep(500);
      await (testForTextIndentButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parseJsonElement(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parseJsonElement(strJsonMaxLine3);

      console.log("[measureJsunit_static_0200] component strJsonMaxLine2 is: " + JSON.stringify(strJsonMaxLine2Obj));
      console.log("[measureJsunit_static_0200] component strJsonMaxLine3 is: " + JSON.stringify(strJsonMaxLine3Obj));
      expect(Number.parseInt(strJsonMaxLine3Obj.getElement('$attrs').getString('content'))).assertLarger(Number.parseInt(strJsonMaxLine2Obj.getElement('$attrs').getString('content')));
      done();
    });

    /**
     * @tc.number: SUB_ARKUI_MEASURE_JSAPI_003
     * @tc.name  : Test measureJsunit_static_0300
     * @tc.desc  : Test measureTextSize function
     */
    it('measureJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('measureJsunit_static_0300 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('reset'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parseJsonElement(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parseJsonElement(strJsonMaxLine3);

      console.log("[measureJsunit_static_0300] component strJsonMaxLine2 is: " + JSON.stringify(strJsonMaxLine2Obj));
      console.log("[measureJsunit_static_0300] component strJsonMaxLine3 is: " + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.getElement('$attrs').getString('content')).assertEqual(strJsonMaxLine3Obj.getElement('$attrs').getString('content'));

      let testForWordBreakButton = await driver.findComponent(ON.id('testForWordBreak'));
      await CommonFunc.sleep(500);
      await (testForWordBreakButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');


      console.log("[measureJsunit_static_0300] component strJsonMaxLine2 is: " + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine2)));
      console.log("[measureJsunit_static_0300] component strJsonMaxLine3 is: " + JSON.stringify(JSON.parseJsonElement(strJsonMaxLine3)));
      expect(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine3).getElement('$attrs').getString('content')))
        .assertLarger(Number.parseInt(JSON.parseJsonElement(strJsonMaxLine2).getElement('$attrs').getString('content')));
      done();
    });

    /**
     * @tc.number: SUB_ARKUI_MEASURE_JSAPI_004
     * @tc.name  : Test measureJsunit_static_0400
     * @tc.desc  : Test measureTextSize function
     */
    it('measureJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('measureJsunit_static_0400 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parseJsonElement(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parseJsonElement(strJsonMaxLine3);

      console.log("[measureJsunit_static_0400] component strJsonMaxLine2 is: " + JSON.stringify(strJsonMaxLine2Obj));
      console.log("[measureJsunit_static_0400] component strJsonMaxLine3 is: " + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.getElement('$attrs').getString('content')).assertEqual(strJsonMaxLine3Obj.getElement('$attrs').getString('content'));
      done();
    });

    /**
     * @tc.number: SUB_ARKUI_MEASURE_JSAPI_005
     * @tc.name  : Test measureJsunit_static_0500
     * @tc.desc  : Test measureTextSize function
     */
    it('measureJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('measureJsunit_static_0500 START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndentInChinese'));
      await CommonFunc.sleep(500);
      await (testForTextIndentButton?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = inspector.getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = inspector.getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parseJsonElement(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parseJsonElement(strJsonMaxLine3);

      console.log("[measureJsunit_static_0500] component strJsonMaxLine2 is: " + JSON.stringify(strJsonMaxLine2Obj));
      console.log("[measureJsunit_static_0500] component strJsonMaxLine3 is: " + JSON.stringify(strJsonMaxLine3Obj));
      expect(Number.parseInt(strJsonMaxLine3Obj.getElement('$attrs').getString('content'))).assertLarger(Number.parseInt(strJsonMaxLine2Obj.getElement('$attrs').getString('content')));
      done();
    });

  })
}
