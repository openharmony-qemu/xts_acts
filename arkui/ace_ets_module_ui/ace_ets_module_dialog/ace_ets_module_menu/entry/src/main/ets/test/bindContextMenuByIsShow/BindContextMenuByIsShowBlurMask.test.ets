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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

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

async function assertTextId(textId: string, expected: string): Promise<void> {
  let driver = Driver.create();
  let textComp = await driver.findComponent(ON.id(textId));
  expect(!!textComp).assertTrue();
  if (textComp) {
    let actual = await textComp.getText();
    expect(actual).assertEqual(expected);
  }
}

async function assertTextIdContains(textId: string, fragment: string): Promise<void> {
  let driver = Driver.create();
  let textComp = await driver.findComponent(ON.id(textId));
  expect(!!textComp).assertTrue();
  if (textComp) {
    let actual = await textComp.getText();
    expect(actual.indexOf(fragment)).assertLarger(-1);
  }
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

async function pushPage(): Promise<void> {
  let options: router.RouterOptions = { url: PAGE_URL };
  router.clear();
  let pages = router.getState();
  if (pages.name !== PAGE_NAME) {
    await router.pushUrl(options);
  }
  await Utils.sleep(SLEEP_MS);
}

export default function BindContextMenuByIsShowBlurMaskTest(): void {
  describe('BindContextMenuByIsShowBlurMaskTest', () => {
    beforeEach(async (): Promise<void> => {
      await pushPage();
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(2000);
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_backgroundBlurStyle_all_0100
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_backgroundBlurStyle_all_0100
     * @tc.desc   bindContextMenuByIsShow backgroundBlurStyle all enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_backgroundBlurStyle_all_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      let ids = ['Thin', 'Regular', 'Thick', 'BGThin', 'BGReg', 'BGThick', 'BGUltra',
        'None', 'CUltraThin', 'CThin', 'CReg', 'CThick', 'CUltraThick'];
      for (let i = 0; i < ids.length; i++) {
        await clickShowAndDismiss(bgBlurBtnId(i));
        await assertTextId(bgBlurTxtId(i), ids[i]);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200
     * @tc.desc   bindContextMenuByIsShow mask.backgroundBlurStyle all enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      let ids = ['Thin', 'Regular', 'Thick', 'BGThin', 'BGReg', 'BGThick', 'BGUltra',
        'None', 'CUltraThin', 'CThin', 'CReg', 'CThick', 'CUltraThick'];
      for (let i = 0; i < ids.length; i++) {
        await clickShowAndDismiss(maskBlurBtnId(i));
        await assertTextId(maskBlurTxtId(i), ids[i]);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300
     * @tc.desc   bindContextMenuByIsShow backgroundBlurStyleOptions policy all enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_policy_all_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_01');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurPolicy_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_02');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurPolicy_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurPolicy_03');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurPolicy_03', '2');
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
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_colorMode_all_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_01');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurColorMode_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_02');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurColorMode_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurColorMode_03');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurColorMode_03', '2');
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
    it('SUB_ARKUI_MENU_BCMByIsShow_blurOptions_adaptiveColor_all_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_01');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnBlurAdaptiveColor_02');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtBlurAdaptiveColor_02', '1');
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
    it('SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_adaptiveColor_all_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_01');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectAdaptiveColor_02');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtEffectAdaptiveColor_02', '1');
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
    it('SUB_ARKUI_MENU_BCMByIsShow_backgroundEffect_policy_all_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await pushPage();
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_01');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtEffectPolicy_01', '0');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_02');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtEffectPolicy_02', '1');
      await clickShowAndDismiss('BindContextMenuByIsShowBlurMask_btnEffectPolicy_03');
      await assertTextId('BindContextMenuByIsShowBlurMask_txtEffectPolicy_03', '2');
      done();
    });
  });
}
