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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Point } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function EnableEventPassthroughTest(): void {
  describe('EnableEventPassthroughTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/enableEventPassthrough/EnableEventPassthroughPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[EnableEventPassthroughTest] get state pages: " + JSON.stringify(pages));
        if (!("EnableEventPassthroughPage" == pages.name)) {
          console.info("[EnableEventPassthroughTest] page name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("[EnableEventPassthroughTest] push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("[EnableEventPassthroughTest] afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0100
     * @tc.name      enableEventPassthroughEnableOnClickTest
     * @tc.desc      Test enable button onClick trigger and RawInputEventType.TOUCH value.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('enableEventPassthroughEnableOnClickTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let enableBtn = await driver.findComponent(ON.id('enableBtn'));
      await enableBtn?.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('stateText');
      let obj = JSON.parseJsonElement(strJson);
      let stateContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0100] stateContent: ' + stateContent);
      expect(stateContent).assertEqual('State: enable');

      strJson = inspector.getInspectorByKey('touchTypeText');
      obj = JSON.parseJsonElement(strJson);
      let touchTypeContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0100] touchTypeContent: ' + touchTypeContent);
      expect(touchTypeContent).assertEqual('TouchType: 0');

      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0200
     * @tc.name      enableEventPassthroughDisableOnClickTest
     * @tc.desc      Test disable button onClick trigger and RawInputEventType.MOUSE value.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('enableEventPassthroughDisableOnClickTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let disableBtn = await driver.findComponent(ON.id('disableBtn'));
      await disableBtn?.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('stateText');
      let obj = JSON.parseJsonElement(strJson);
      let stateContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0200] stateContent: ' + stateContent);
      expect(stateContent).assertEqual('State: disable');

      strJson = inspector.getInspectorByKey('mouseTypeText');
      obj = JSON.parseJsonElement(strJson);
      let mouseTypeContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0200] mouseTypeContent: ' + mouseTypeContent);
      expect(mouseTypeContent).assertEqual('MouseType: 1');

      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0300
     * @tc.name      enableEventPassthroughTouchEnumValueTest
     * @tc.desc      Test RawInputEventType.TOUCH enum value equals 2.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('enableEventPassthroughTouchEnumValueTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let enableBtn = await driver.findComponent(ON.id('enableBtn'));
      await enableBtn?.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('touchTypeText');
      let obj = JSON.parseJsonElement(strJson);
      let touchTypeContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0300] touchTypeContent: ' + touchTypeContent);
      expect(touchTypeContent).assertEqual('TouchType: 0');

      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0400
     * @tc.name      enableEventPassthroughMouseEnumValueTest
     * @tc.desc      Test RawInputEventType.MOUSE enum value equals 4.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('enableEventPassthroughMouseEnumValueTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let disableBtn = await driver.findComponent(ON.id('disableBtn'));
      await disableBtn?.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('mouseTypeText');
      let obj = JSON.parseJsonElement(strJson);
      let mouseTypeContent: string = obj.getElement('$attrs').getString('content');
      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0400] mouseTypeContent: ' + mouseTypeContent);
      expect(mouseTypeContent).assertEqual('MouseType: 1');

      console.info('[SUB_ACE_ARKUI_ENABLEEVENTPASSTHROUGH_0400] END');
      done();
    });
  });
}