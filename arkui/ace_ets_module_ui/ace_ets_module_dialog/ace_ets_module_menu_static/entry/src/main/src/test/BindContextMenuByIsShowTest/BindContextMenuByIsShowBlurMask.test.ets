/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE_URL = 'MainAbility/pages/bindContextMenuByIsShow/BindContextMenuByIsShowBlurMask';
const PAGE_NAME = 'BindContextMenuByIsShowBlurMaskIndex';

const SLEEP_MS = 1500;
const DISMISS_SLEEP_MS = 2000;
const MENU_ITEM_TEXT = '菜单选项1';

async function clickShowAndDismiss(btnId: string): Promise<void> {
  let driver = Driver.create();
  let btn = await driver.findComponent(ON.id(btnId));
  expect(!!btn).assertTrue();
  if (btn) {
    await btn.click();
  }
  await Utils.sleep(DISMISS_SLEEP_MS);
  let menuItem = await driver.findComponent(ON.text(MENU_ITEM_TEXT));
  expect(menuItem !== undefined).assertTrue();
  if (menuItem) {
    await menuItem.click();
  }
  await Utils.sleep(DISMISS_SLEEP_MS);
}

async function clickShowAndDismissMenu(btnId: string): Promise<void> {
  await clickShowAndDismiss(btnId);
}

function assertTextKey(key: string, expected: string): void {
  let node = JSON.parseJsonElement(inspector.getInspectorByKey(key));
  expect(node.getElement('$attrs').getString('content')).assertEqual(expected);
}

function assertTextContains(key: string, fragment: string): void {
  let node = JSON.parseJsonElement(inspector.getInspectorByKey(key));
  expect(node.getElement('$attrs').getString('content').indexOf(fragment)).assertLarger(-1);
}

function fmtIdx(i: number): string {
  let n: number = i + 1;
  return n < 10 ? `0${n}` : `${n}`;
}

function bgBlurBtnId(i: number): string {
  return `BindContextMenuByIsShowBlurMask_btnBgBlur_${fmtIdx(i)}`;
}

function bgBlurTxtId(i: number): string {
  return `BindContextMenuByIsShowBlurMask_txtBgBlur_${fmtIdx(i)}`;
}

function maskBlurBtnId(i: number): string {
  return `BindContextMenuByIsShowBlurMask_btnMaskBlur_${fmtIdx(i)}`;
}

function maskBlurTxtId(i: number): string {
  return `BindContextMenuByIsShowBlurMask_txtMaskBlur_${fmtIdx(i)}`;
}

async function navigatePage(): Promise<void> {
  let options: router.RouterOptions = { url: PAGE_URL };
  try {
    const routerInstance = AppStorage.get<Router>('router') as Router;
    let pages = routerInstance.getState();
    if (pages.name !== PAGE_NAME) {
      routerInstance.replaceUrl(options);
    }
    await Utils.sleep(SLEEP_MS);
  } catch (err) {
    expect().assertFail();
  }
}

export default function BindContextMenuByIsShowBlurMaskTest(): void {
  describe('BindContextMenuByIsShowBlurMaskTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(2000);
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300
     * @tc.desc   bindContextMenuByIsShow backgroundBlurStyleOptions policy all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_01');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurPolicy_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_02');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurPolicy_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_03');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurPolicy_03', '2');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_blurOptions_colorMode_all_0400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_blurOptions_colorMode_all_0400
     * @tc.desc   bindContextMenuByIsShow backgroundBlurStyleOptions colorMode all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_colorMode_all_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_01');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurColorMode_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_02');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurColorMode_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_03');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurColorMode_03', '2');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_blurOptions_adaptiveColor_all_0500
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_blurOptions_adaptiveColor_all_0500
     * @tc.desc   bindContextMenuByIsShow backgroundBlurStyleOptions adaptiveColor all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_adaptiveColor_all_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_01');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_02');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_adaptiveColor_all_0600
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_adaptiveColor_all_0600
     * @tc.desc   bindContextMenuByIsShow backgroundEffect adaptiveColor all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_adaptiveColor_all_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_01');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_02');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_policy_all_0700
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_policy_all_0700
     * @tc.desc   bindContextMenuByIsShow backgroundEffect policy all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_policy_all_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_01');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtEffectPolicy_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_02');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtEffectPolicy_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_03');
      assertTextKey('BindContextMenuByIsShowBlurMask_txtEffectPolicy_03', '2');
      done();
    });
  });
}
