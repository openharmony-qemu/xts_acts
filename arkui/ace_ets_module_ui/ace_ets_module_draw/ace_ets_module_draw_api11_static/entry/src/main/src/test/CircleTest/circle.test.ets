/*
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

// import ohosrouter from '@ohos.router';
import { $r } from '@ohos.arkui.component';
import resourceManager from '@ohos.resourceManager';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

interface ParamsData {
  data3: number[];
}
interface MyParams {
  data1: string;
  data2: ParamsData;
}
export default function circleNewJsunit() {
  describe('circleNewTest', () => {
    beforeAll(async () => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      let options:router.RouterOptions = {
        url:'MainAbility/pages/Circle/circle',
      }
      try {
        const circle = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        circle.clear();
        let pages = circle.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          // let result = await circle.pushUrl(options);
          circle.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push circle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("circleNew after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testcircleNew001
     * @tc.desic         acecircleNewEtsTest001
     */
    it('testcircleNew001_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('circleNew testcircleNew0011 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew001] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testcircleNew001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_002
     * @tc.name         testcircleNew002
     * @tc.desic         acecircleNewEtsTest002
     */
    it('testcircleNew002_static', Level.LEVEL0, async (): Promise<void> => {
      console.info('circleNew testcircleNew002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew002] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testcircleNew002] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /**
     * @tc.number ACE_global_console_debug_0100
     * @tc.name console::debug
     * @tc.desc Test console debug printing
     */
    it("ACE_global_console_debug_static_0100", Level.LEVEL0, async (): Promise<void> => {
      let casename = "ACE_global_003";
      console.log("-----------------------ACE_global_console_debug Test is starting-----------------------");
      try {
        console.debug("ACE_global_console_debug test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();

      }
      console.log("-----------------------ACE_global_console_debug Test end-----------------------");

    });

    /**
     * @tc.number ACE_global_console_error_0100
     * @tc.name console::error
     * @tc.desc Test console error printing
     */
    it("ACE_global_console_error_static_0200", Level.LEVEL0, async (): Promise<void> => {
      let casename = "ACE_global_004";
      console.log("-----------------------ACE_global_console_error Test is starting-----------------------");
      try {
        console.error("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();

      }
      console.log("-----------------------ACE_global_console_error Test end-----------------------");

    });

    /**
     * @tc.number pushUrl_callback_0100
     * @tc.name ACE_pushUrl_callback_0100
     * @tc.desc Test pushUrl
     */
    it("ACE_pushUrl_callback_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_pushUrl_callback_0100 start-----------------------");
      const ohosrouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/common',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }, (err) => {
        if (err) {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('pushUrl success');
          expect(true).assertTrue();
        }
      })
      console.info("-----------------------ACE_pushUrl_callback_0100 end-----------------------");

    });

    /**
     * @tc.number pushUrl_promise_0200
     * @tc.name ACE_pushUrl_promise_0200
     * @tc.desc Test pushUrl
     */
    it("ACE_pushUrl_callback_static_0200", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_pushUrl_promise_0200 start-----------------------");
      const ohosrouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Ellipse/ellipse1',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        expect(true).assertTrue();
      })
        .catch((err:Error) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        })
      console.info("-----------------------ACE_pushUrl_promise_0200 end-----------------------");

    });

    /**
     * @tc.number showAlertBeforeBackPage_0100
     * @tc.name ACE_showAlertBeforeBackPage_0100
     * @tc.desc Test showAlertBeforeBackPage
     */
    it("ACE_showAlertBeforeBackPage_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0100-----------------------");
      const ohosrouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      try {
        ohosrouter.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`showAlertBeforeBackPage_0100 failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.number showAlertBeforeBackPage_0200
     * @tc.name ACE_showAlertBeforeBackPage_0200
     * @tc.desc Test showAlertBeforeBackPage
     */
    it("ACE_showAlertBeforeBackPage_static_0200", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const ohosrouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      try {
        ohosrouter.showAlertBeforeBackPage({
          message:'undefined'
        });
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }

    });

    /**
     * @tc.number hideAlertBeforeBackPage_0100
     * @tc.name ACE_hideAlertBeforeBackPage_0100
     * @tc.desc Test hideAlertBeforeBackPage
     */
    it("ACE_hideAlertBeforeBackPage_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const ohosrouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      try {
        ohosrouter.hideAlertBeforeBackPage();
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testGlobal_attribute_0100
    * @tc.desc          test global attribute
   */
    it('testGlobal_attribute_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info('testGlobal_attribute_0100 START');
      await CommonFunc.sleep(1000);
      let resource: resourceManager.Resource = {
        bundleName: "com.arkui.ace.draw",
        moduleName: "phone",
        id: $r('app.string.app_name').id,
        params: undefined,
        type: 0
      };
      try {
        AppStorage.get<common.UIAbilityContext>('abilityContext', Type.from<common.UIAbilityContext>())?.resourceManager.getStringValue(resource, (error: BusinessError | null, value: string | undefined) => {
          if (error != null) {
            console.log("error is " + error);
            expect().assertFail();
          } else {
            expect(value).assertEqual('ohosProject');
          }
        });
      } catch (error: BusinessError) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`callback getStringValue failed, error code: ${code}, message: ${message}.`);
        expect().assertFail();
      }

    });

  })
}
