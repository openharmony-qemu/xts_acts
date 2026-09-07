'use static';
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

import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

export default function BindContextMenuByIsShowBlurMaskMaskTest(): void {
  describe('BindContextMenuByIsShowBlurMaskMaskTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('BindContextMenuByIsShowBlurMaskMask beforeEach err: ' + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('BindContextMenuByIsShowBlurMaskMask afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200
     * @tc.desc   bindContextMenuByIsShow mask.backgroundBlurStyle all enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await navigatePage();
        let ids = ['Thin', 'Regular', 'Thick', 'BGThin', 'BGReg', 'BGThick', 'BGUltra',
          'None', 'CUltraThin', 'CThin', 'CReg', 'CThick', 'CUltraThick'];
        for (let i = 0; i < ids.length; i++) {
          await clickShowAndDismiss(maskBlurBtnId(i));
          assertTextKey(maskBlurTxtId(i), ids[i]);
        }
        done();
      } catch (err) {
        console.info('BindContextMenuByIsShowBlurMaskMask err: ' + JSON.stringify(err));
        done();
      }
    });
  });
}
