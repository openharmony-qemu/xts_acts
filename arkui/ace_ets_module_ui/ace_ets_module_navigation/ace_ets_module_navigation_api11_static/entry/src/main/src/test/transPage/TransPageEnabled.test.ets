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
import { describe, beforeEach, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium-static/src/main/indexStatic"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function TransPageEnabledTest() {
  describe('TransPageEnabledTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('TransPageEnabledTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/transPage/TransPageEnabled',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TransPageEnabledTest state pages: ' + JSON.stringify(pages));
        if (!("TransPageEnabled" == pages.name)) {
          console.info('TransPageEnabledTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TransPageEnabledTest page success');
        }
      } catch (err) {
        console.error('push TransPageEnabledTest page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TransPageEnabledTest afterEach called');
    });

    /**
     * @tc.name   testIsTransPageEnabledDefault_static_0100
     * @tc.number SUB_ARKUI_UICONTEXT_ISTRANSPAGEENABLED_DEFAULT_static_0100
     * @tc.desc   Test isTransPageEnabled returns true by default without calling setTransPageEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTransPageEnabledDefault_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testIsTransPageEnabledDefault_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let checkBtn = await (driver.findComponent(ON.id('transPage_check_btn')) as Promise<Component>);
      await checkBtn.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('transPage_result_text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testIsTransPageEnabledDefault_static_0100] result: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[testIsTransPageEnabledDefault_static_0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledFalse_static_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_FALSE_static_0100
     * @tc.desc   Test setTransPageEnabled(false) makes isTransPageEnabled return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTransPageEnabledFalse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSetTransPageEnabledFalse_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let setFalseBtn = await (driver.findComponent(ON.id('transPage_setFalse_btn')) as Promise<Component>);
      await setFalseBtn.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('transPage_result_text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testSetTransPageEnabledFalse_static_0100] result: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('false');

      console.info('[testSetTransPageEnabledFalse_static_0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledTrue_static_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_TRUE_static_0100
     * @tc.desc   Test setTransPageEnabled(true) makes isTransPageEnabled return true after being disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTransPageEnabledTrue_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSetTransPageEnabledTrue_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let setFalseBtn = await (driver.findComponent(ON.id('transPage_setFalse_btn')) as Promise<Component>);
      await setFalseBtn.click();
      await CommonFunc.sleep(500);

      let setTrueBtn = await (driver.findComponent(ON.id('transPage_setTrue_btn')) as Promise<Component>);
      await setTrueBtn.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('transPage_result_text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[testSetTransPageEnabledTrue_static_0100] result: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('true');

      console.info('[testSetTransPageEnabledTrue_static_0100] END');
      done();
    });
  })
}
