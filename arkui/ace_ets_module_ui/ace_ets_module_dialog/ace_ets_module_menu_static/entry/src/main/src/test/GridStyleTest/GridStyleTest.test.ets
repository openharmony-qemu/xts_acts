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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { MenuGridPosition } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function GridStyleTest(): void {
  describe('GridStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      const pages = routerInstance.getState();
      if (pages.name !== 'GridStyleTestPageIndex') {
        routerInstance.replaceUrl({ url: 'MainAbility/pages/GridStyle/GridStyleTestPage' });
      }
      await Utils.sleep(500);
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('GridStyleTest_MenuGridPosition_TOP_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(MenuGridPosition.TOP).assertEqual(0);
      done();
    });

    it('GridStyleTest_MenuGridPosition_BOTTOM_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(MenuGridPosition.BOTTOM).assertEqual(1);
      done();
    });

    it('GridStyleTest_MenuGridPosition_UI_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      const btnTop = await driver.findComponent(ON.id('btn_enum_top'));
      expect(!!btnTop).assertEqual(true);
      if (btnTop) {
        await btnTop.click();
      }
      await CommonFunc.sleep(500);
      const resultText = await driver.findComponent(ON.id('result_text'));
      if (resultText) {
        const resultStr = await resultText.getText();
        expect(resultStr.indexOf('MenuGridPosition.TOP')).assertLarger(-1);
      }
      done();
    });

    it('GridStyleTest_Count_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      const btn = await driver.findComponent(ON.id('text_count_0'));
      if (btn) {
        await btn.click();
      }
      await CommonFunc.sleep(500);
      const resultText = await driver.findComponent(ON.id('result_text'));
      if (resultText) {
        const resultStr = await resultText.getText();
        expect(resultStr.indexOf('count=0')).assertLarger(-1);
      }
      done();
    });

    it('GridStyleTest_AllParams_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      const btn = await driver.findComponent(ON.id('text_all_params'));
      if (btn) {
        await btn.click();
      }
      await CommonFunc.sleep(500);
      const resultText = await driver.findComponent(ON.id('result_text'));
      if (resultText) {
        const resultStr = await resultText.getText();
        expect(resultStr.indexOf('count=4')).assertLarger(-1);
        expect(resultStr.indexOf('BOTTOM')).assertLarger(-1);
      }
      done();
    });

    it('GridStyleTest_BindMenu_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      const btn = await driver.findComponent(ON.id('text_bindmenu_grid'));
      if (btn) {
        await btn.click();
      }
      await CommonFunc.sleep(500);
      const resultText = await driver.findComponent(ON.id('result_text'));
      if (resultText) {
        const resultStr = await resultText.getText();
        expect(resultStr.indexOf('bindMenu')).assertLarger(-1);
      }
      done();
    });
  });
}
