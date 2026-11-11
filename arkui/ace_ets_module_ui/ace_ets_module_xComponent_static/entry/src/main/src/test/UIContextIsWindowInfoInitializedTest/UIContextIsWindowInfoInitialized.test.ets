'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, afterEach, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const PAGE = 'MainAbility/pages/uicontextIsWindowInfoInitialized/uicontextIsWindowInfoInitialized';
const TITLE_ID = 'iwii_title';
const SLEEP_TIME = 500;
const SUITE = 'UIContextIsWindowInfoInitializedTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

export default function UIContextIsWindowInfoInitializedTest() {
  describe('UIContextIsWindowInfoInitializedTest', () => {
    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('iwii_appear_result');
      AppStorage.delete('iwii_appear_error');
      AppStorage.delete('iwii_valid_result');
      AppStorage.delete('iwii_valid_error');
      AppStorage.delete('iwii_calling_scope_defined');
      AppStorage.delete('iwii_calling_scope_result');
      AppStorage.delete('iwii_calling_scope_error');
      AppStorage.delete('iwii_repeat_first');
      AppStorage.delete('iwii_repeat_consistent');
      AppStorage.delete('iwii_repeat_error');
      AppStorage.delete('iwii_type_is_boolean');
      AppStorage.delete('iwii_type_error');
      AppStorage.delete('iwii_invalid_result');
      AppStorage.delete('iwii_invalid_error');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        await routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }
      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');
      try {
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        arkuiNewErr(SUITE, 'afterEach', 'sleep err: ' + JSON.stringify(err));
      }
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0100
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0100
     * @tc.desc Test UIContext isWindowInfoInitialized in startup phase (aboutToAppear) with valid context returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_appear START');
      try {
        const found = !!await Driver.create().findComponent(ON.id(TITLE_ID));
        arkuiNewLog(SUITE, 'step', `iwii_appear | title found=${found}`);
        expect(found).assertTrue();
        expect(AppStorage.get<boolean>('iwii_appear_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_appear_result')).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'iwii_appear END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0200
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0200
     * @tc.desc Test UIContext isWindowInfoInitialized with valid context obtained by getUIContext returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_valid START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('iwii_btn_valid'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `iwii_valid | error=${AppStorage.get<boolean>('iwii_valid_error')} ` +
            `result=${AppStorage.get<boolean>('iwii_valid_result')}`,
        );
        expect(AppStorage.get<boolean>('iwii_valid_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_valid_result')).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'iwii_valid END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0300
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0300
     * @tc.desc Test UIContext isWindowInfoInitialized with context obtained by getCallingScopeUIContext returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_calling_scope START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('iwii_btn_calling_scope'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `iwii_calling_scope | error=${AppStorage.get<boolean>('iwii_calling_scope_error')} ` +
            `defined=${AppStorage.get<boolean>('iwii_calling_scope_defined')} ` +
            `result=${AppStorage.get<boolean>('iwii_calling_scope_result')}`,
        );
        expect(AppStorage.get<boolean>('iwii_calling_scope_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_calling_scope_defined')).assertTrue();
        expect(AppStorage.get<boolean>('iwii_calling_scope_result')).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'iwii_calling_scope END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0400
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0400
     * @tc.desc Test UIContext isWindowInfoInitialized repeated calls return consistent true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_repeat START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('iwii_btn_repeat'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `iwii_repeat | error=${AppStorage.get<boolean>('iwii_repeat_error')} ` +
            `first=${AppStorage.get<boolean>('iwii_repeat_first')} ` +
            `consistent=${AppStorage.get<boolean>('iwii_repeat_consistent')}`,
        );
        expect(AppStorage.get<boolean>('iwii_repeat_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_repeat_first')).assertTrue();
        expect(AppStorage.get<boolean>('iwii_repeat_consistent')).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'iwii_repeat END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0500
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0500
     * @tc.desc Test UIContext isWindowInfoInitialized return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_type START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('iwii_btn_type'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `iwii_type | error=${AppStorage.get<boolean>('iwii_type_error')} ` +
            `isBoolean=${AppStorage.get<boolean>('iwii_type_is_boolean')}`,
        );
        expect(AppStorage.get<boolean>('iwii_type_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_type_is_boolean')).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'iwii_type END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0600
     * @tc.name SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0600
     * @tc.desc Test UIContext isWindowInfoInitialized with invalid context created by new UIContext returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it(
      'SUB_ARKUI_UICONTEXT_ISWINDOWINFOINITIALIZED_RETURN_0600',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'iwii_invalid START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('iwii_btn_invalid'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `iwii_invalid | error=${AppStorage.get<boolean>('iwii_invalid_error')} ` +
            `result=${AppStorage.get<boolean>('iwii_invalid_result')}`,
        );
        expect(AppStorage.get<boolean>('iwii_invalid_error')).assertFalse();
        expect(AppStorage.get<boolean>('iwii_invalid_result')).assertFalse();
        arkuiNewLog(SUITE, 'execute', 'iwii_invalid END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
