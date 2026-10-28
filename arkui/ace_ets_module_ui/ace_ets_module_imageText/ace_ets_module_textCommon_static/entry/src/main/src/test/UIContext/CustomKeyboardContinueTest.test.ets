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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function CustomKeyboardContinueTest() {
  describe('CustomKeyboardContinueTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('CustomKeyboardContinueTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
      console.info('CustomKeyboardContinueTest beforeAll end');
    });

    beforeEach(async (): Promise<void> => {
      console.info('CustomKeyboardContinueTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/CustomKeyboardContinueTest',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('CustomKeyboardContinueTest state pages: ' + JSON.stringify(pages));
        if (!('CustomKeyboardContinueTest' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('push CustomKeyboardContinueTest page error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('CustomKeyboardContinueTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      console.info('CustomKeyboardContinueTest afterEach called');
      await CommonFunc.sleep(500);
    });
    afterAll(async (): Promise<void> => {
      AppStorage.delete('CustomKeyboardContinueFeature')
      AppStorage.delete('CustomKeyboardContinueFeature_Result')
      AppStorage.delete('CustomKeyboardContinueFeature_Null')
      AppStorage.delete('CustomKeyboardContinueFeature_Invalid')
      AppStorage.delete('CustomKeyboardContinueFeature_Number')
    });

    /**
     * @tc.name   CustomKeyboardContinueTest_0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETCUSTOMKEYBOARDCONTINUEFEATURE_PARAM_0100
     * @tc.desc   Test CustomKeyboardContinueFeature.ENABLED enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[CustomKeyboardContinueTest_0100] START');
      expect(CustomKeyboardContinueFeature.ENABLED).assertEqual(0);
      console.info('[CustomKeyboardContinueTest_0100] END');
      done();
    });

    /**
     * @tc.name   CustomKeyboardContinueTest_0200
     * @tc.number SUB_ARKUI_UICONTEXT_SETCUSTOMKEYBOARDCONTINUEFEATURE_PARAM_0200
     * @tc.desc   Test CustomKeyboardContinueFeature.DISABLED enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[CustomKeyboardContinueTest_0200] START');
      expect(CustomKeyboardContinueFeature.DISABLED).assertEqual(1);
      console.info('[CustomKeyboardContinueTest_0200] END');
      done();
    });

    /**
     * @tc.name   CustomKeyboardContinueTest_0300
     * @tc.number SUB_ARKUI_UICONTEXT_SETCUSTOMKEYBOARDCONTINUEFEATURE_PARAM_0300
     * @tc.desc   Test setCustomKeyboardContinueFeature with ENABLED, AppStorage should store 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[CustomKeyboardContinueTest_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let btnSetEnabled = await driver.findComponent(ON.id('btn_set_enabled'));
      if (btnSetEnabled === null) {
        expect().assertFail();
        console.error('[CustomKeyboardContinueTest_0300] btn_set_enabled not found');
        done();
        return;
      }
      await (btnSetEnabled?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let storedValue: number = AppStorage.get<number>('CustomKeyboardContinueFeature') as number;
      console.info('[CustomKeyboardContinueTest_0300] AppStorage value: ' + storedValue);
      expect(storedValue).assertEqual(0);

      let resultValue: string = AppStorage.get<string>('CustomKeyboardContinueFeature_Result') as string;
      console.info('[CustomKeyboardContinueTest_0300] AppStorage result: ' + resultValue);
      expect(resultValue).assertEqual('success');

      console.info('[CustomKeyboardContinueTest_0300] END');
      done();
    });

    /**
     * @tc.name   CustomKeyboardContinueTest_0400
     * @tc.number SUB_ARKUI_UICONTEXT_SETCUSTOMKEYBOARDCONTINUEFEATURE_PARAM_0400
     * @tc.desc   Test setCustomKeyboardContinueFeature with DISABLED, AppStorage should store 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[CustomKeyboardContinueTest_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let btnSetDisabled = await driver.findComponent(ON.id('btn_set_disabled'));
      if (btnSetDisabled === null) {
        expect().assertFail();
        console.error('[CustomKeyboardContinueTest_0400] btn_set_disabled not found');
        done();
        return;
      }
      await (btnSetDisabled?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let storedValue: number = AppStorage.get<number>('CustomKeyboardContinueFeature') as number;
      console.info('[CustomKeyboardContinueTest_0400] AppStorage value: ' + storedValue);
      expect(storedValue).assertEqual(1);

      let resultValue: string = AppStorage.get<string>('CustomKeyboardContinueFeature_Result') as string;
      console.info('[CustomKeyboardContinueTest_0400] AppStorage result: ' + resultValue);
      expect(resultValue).assertEqual('success');

      console.info('[CustomKeyboardContinueTest_0400] END');
      done();
    });

    /**
     * @tc.name   CustomKeyboardContinueTest_0500
     * @tc.number SUB_ARKUI_UICONTEXT_SETCUSTOMKEYBOARDCONTINUEFEATURE_ERROR_0100
     * @tc.desc   Test setCustomKeyboardContinueFeature with invalid number 3, should not crash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[CustomKeyboardContinueTest_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      if (driver === null) {
        expect().assertFail();
        done();
        return;
      }

      let btnSetInvalid3 = await driver.findComponent(ON.id('btn_set_invalid_3'));
      if (btnSetInvalid3 === null) {
        expect().assertFail();
        console.error('[CustomKeyboardContinueTest_0500] btn_set_invalid_3 not found');
        done();
        return;
      }
      await (btnSetInvalid3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let statusText = await driver.findComponent(ON.id('text_current_feature'));
      expect(statusText !== null).assertTrue();
      console.info('[CustomKeyboardContinueTest_0500] Page still responsive after invalid number 3');

      let resultValue: string = AppStorage.get<string>('CustomKeyboardContinueFeature_Result') as string;
      console.info('[CustomKeyboardContinueTest_0500] AppStorage result: ' + resultValue);
      expect(resultValue !== null && resultValue !== undefined).assertTrue();

      console.info('[CustomKeyboardContinueTest_0500] END');
      done();
    });
  });
}
