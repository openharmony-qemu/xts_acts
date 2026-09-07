'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  describe, beforeAll, afterAll, beforeEach, afterEach, it, expect, Level
} from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import { LevelOrder, LevelMode } from '@ohos.promptAction';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const PAGE = 'MainAbility/pages/OpenOrderOverlay/OpenOrderOverlayTestPage';
const BUNDLE = 'com.arkui.ace.alert.static';
const LOG_TAG = '[ARKUI_NEW] OpenOrderOverlayStatic';
const SLEEP_TIME = 1000;

async function clickById(driver: Driver, id: string): Promise<void> {
  let button = await driver.waitForComponent(ON.id(id), 5000);
  expect(button !== undefined && button !== null).assertTrue();
  await (button as Component).click();
}

async function getResultText(driver: Driver): Promise<string> {
  let resultText = await driver.findComponent(ON.id('OpenOrderOverlayTestPage_result_text'));
  if (resultText === undefined || resultText === null) {
    return '';
  }
  return await (resultText as Component).getText() as string;
}

async function getActualCode(driver: Driver): Promise<string> {
  let actualComp = await driver.findComponent(ON.id('OpenOrderOverlayTestPage_result_actual'));
  if (actualComp === undefined || actualComp === null) {
    return '';
  }
  return await (actualComp as Component).getText() as string;
}


/**
 * FilePicker Modal UEC 会搞挂「当前 aa test 进程内」的 UiTest/AAMS（FindWidgets 失联）。
 * 同会话内无法彻底恢复；本清理用于：关掉残留选择器，并降低对「下一次」aa test 的污染。
 * 约定：Err103307 必须是本 Suite/本 List 最后一个依赖 UiTest 的用例。
 */
async function cleanupSystemFilePicker(): Promise<void> {
  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let cmds: string[] = [
    'aa force-stop com.ohos.filepicker',
    'aa force-stop com.ohos.UserFile.ExternalFileManager',
    'uitest uiInput keyEvent Back'
  ];
  for (let i = 0; i < cmds.length; i++) {
    try {
      await delegator.executeShellCommand(cmds[i]);
      console.info(`${LOG_TAG} cleanup: ${cmds[i]} ok`);
    } catch (e) {
      console.info(`${LOG_TAG} cleanup: ${cmds[i]} fail ${e}`);
    }
  }
  await Utils.sleep(800);
}

export default function OpenOrderOverlayTest(): void {
  describe('OpenOrderOverlayTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeAll start`);
      await UtilsTest.startAbility(BUNDLE, 'EntryAbility');
      console.info(`${LOG_TAG} beforeAll end`);
    });

    afterAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} afterAll cleanup FilePicker`);
      await cleanupSystemFilePicker();
    });

    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl({ url: PAGE });
      await Utils.sleep(1000);
      console.info(`${LOG_TAG} beforeEach end`);
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      let removeBtn = await driver.findComponent(ON.id('OpenOrderOverlayTestPage_btn_remove'));
      if (removeBtn !== undefined && removeBtn !== null) {
        await (removeBtn as Component).click();
        await Utils.sleep(300);
      }
      await Utils.sleep(500);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100
     * @tc.desc   LevelOrder.clamp 边界与溢出 clamp 行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100 START`);
      expect(LevelOrder.clamp(200000).getOrder()).assertEqual(100000);
      expect(LevelOrder.clamp(-200000).getOrder()).assertEqual(-100000);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_Content_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_Content_0100
     * @tc.desc   openOrderOverlay 仅传 ComponentContent 无 options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_Content_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_Content_0100 START`);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let btn = await driver.waitForComponent(ON.id('OpenOrderOverlayTestPage_btn_content_only'), 5000);
      expect(btn !== undefined && btn !== null).assertTrue();
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_content_only');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_Content_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100
     * @tc.desc   levelMode 为 OVERLAY 时 openOrderOverlay 成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100 START`);
      expect(LevelMode.OVERLAY).assertEqual(0);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_overlay_mode');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200
     * @tc.desc   levelMode 为 EMBEDDED 时 openOrderOverlay 成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200 START`);
      expect(LevelMode.EMBEDDED).assertEqual(1);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_embedded_mode');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100
     * @tc.desc   levelOrder LevelOrder.clamp(0) 与 openOrderOverlay 组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100 START`);
      expect(LevelOrder.clamp(0).getOrder()).assertEqual(0);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_order_0');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200
     * @tc.desc   levelOrder LevelOrder.clamp(100) 与 openOrderOverlay 组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200 START`);
      expect(LevelOrder.clamp(100).getOrder()).assertEqual(100);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_order_100');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300
     * @tc.desc   levelOrder LevelOrder.clamp(-100) 边界值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300 START`);
      expect(LevelOrder.clamp(-100).getOrder()).assertEqual(-100);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_order_neg100');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400
     * @tc.desc   levelOrder LevelOrder.clamp(100000) 上边界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400 START`);
      expect(LevelOrder.clamp(100000).getOrder()).assertEqual(100000);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_order_max');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100
     * @tc.desc   levelUniqueId 为 0 且 EMBEDDED 模式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100 START`);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_uniqueid_0');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100
     * @tc.desc   openOrderOverlay 同时传入 levelOrder/levelMode/levelUniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100 START`);
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_all_params');
      await Utils.sleep(SLEEP_TIME);
      let text = await getResultText(driver);
      expect(text.indexOf('Success')).assertLarger(-1);
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100 END`);
    });

    /**
     * @tc.number SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100
     * @tc.name   SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100
     * @tc.desc   1.2 错误码 103307：DocumentViewPicker 拉起系统 Modal UEC 后真实抛出 Error:103307
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100', Level.LEVEL1, async (): Promise<void> => {
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100 START`);
      AppStorage.setOrCreate<string>('ooo_err103307_text', '');
      AppStorage.setOrCreate<string>('ooo_err103307_code', '');
      let driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      await clickById(driver, 'OpenOrderOverlayTestPage_btn_err_103307');
      // 页面：DocumentViewPicker + sleep(3000) + openOrderOverlay
      await Utils.sleep(5000);
      let text = AppStorage.get<string>('ooo_err103307_text') as string;
      let actual = AppStorage.get<string>('ooo_err103307_code') as string;
      if (text.length === 0) {
        text = await getResultText(driver);
        actual = await getActualCode(driver);
      }
      console.info(`${LOG_TAG} Err103307 result=${text} actual=${actual}`);
      let okSystemUec = text.indexOf('Error:103307') >= 0 && actual === '103307';
      console.info(`${LOG_TAG} Err103307 REAL check ok=${okSystemUec}`);
      // 本用例要求真实抛出 103307（DocumentViewPicker → Modal UEC）
      expect(okSystemUec).assertTrue();
      // 关键：立刻杀掉 FilePicker / ExternalFileManager，避免 UEC 异常退出毒化 UiTest
      await cleanupSystemFilePicker();
      console.info(`${LOG_TAG} SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100 END`);
    });

  });
}
