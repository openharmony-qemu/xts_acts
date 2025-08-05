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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function APIContentTypeTest() {
  describe('APIContentTypeTest', () => {
    beforeAll(() => {
      console.info("APIContentTypeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("APIContentTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/APIContentType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APIContentTypeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get APIContentTypeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APIContentTypeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIContentTypeTest page error:" + err);
      }
      console.info("APIContentTypeTest beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIContentTypeTest after each called");
    });

    /**
     * @tc.number    APIContentTypeTest_001
     * @tc.desc      api
     * @tc.level     Level 3
     * @tc.type
     */

    it('APIContentTypeTest_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[APIContentTypeTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('APIContentTypeButton'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIContentTypeTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextContentType.VISIBLE_PASSWORD');
      console.info('[APIContentTypeTest_001] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_CONTENTTYPE_0200
    * @tc.name  : APIContentTypeTest_002
    * @tc.desc  : ContentType setting NICKNAME
    * @tc.level : Level 3
    * @tc.type :
    * @tc.size :
    */
    it('APIContentTypeTest_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('APIContentTypeTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_23'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIContentTypeTest_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextContentType.NICKNAME');
      console.info('[APIContentTypeTest_0200] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_CONTENTTYPE_0300
    * @tc.name  : APIContentTypeTest_003
    * @tc.desc  : ContentType setting DETAIL_INFO_WITHOUT_STREET
    * @tc.level : Level 3
    * @tc.type :
    * @tc.size :
    */
    it('APIContentTypeTest_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('APIContentTypeTest_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_24'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIContentTypeTest_0300] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextContentType.DETAIL_INFO_WITHOUT_STREET');
      console.info('[APIContentTypeTest_0300] END');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_CONTENTTYPE_0400
    * @tc.name  : APIContentTypeTest_004
    * @tc.desc  : ContentType setting FORMAT_ADDRESS
    * @tc.level : Level 3
    * @tc.type :
    * @tc.size :
    */
    it('APIContentTypeTest_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('APIContentTypeTest_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_25'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIContentTypeTest_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('TextContentType.FORMAT_ADDRESS');
      console.info('[APIContentTypeTest_0400] END');
      done();
    });
  })
}