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


import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE_URL = 'MainAbility/pages/bindContextMenuByIsShow/BindContextMenuByIsShowOptions';
const PAGE_NAME = 'BindContextMenuByIsShowOptionsIndex';

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

export default function BindContextMenuByIsShowOptionsTest(): void {
  describe('BindContextMenuByIsShowOptionsTest', () => {
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
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_enableArrow_true_0100
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_enableArrow_true_0100
     * @tc.desc   bindContextMenuByIsShow enableArrow=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_enableArrow_true_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnEnableArrow_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtEnableArrow_01', 'true');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_enableArrow_false_0200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_enableArrow_false_0200
     * @tc.desc   bindContextMenuByIsShow enableArrow=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_enableArrow_false_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnEnableArrow_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtEnableArrow_02', 'false');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_true_0300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_true_0300
     * @tc.desc   bindContextMenuByIsShow enableHoverMode=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_true_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnEnableHoverMode_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtEnableHoverMode_01', 'true');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_false_0400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_false_0400
     * @tc.desc   bindContextMenuByIsShow enableHoverMode=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_enableHoverMode_false_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnEnableHoverMode_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtEnableHoverMode_02', 'false');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_preview_none_0500
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_preview_none_0500
     * @tc.desc   bindContextMenuByIsShow preview=MenuPreviewMode.NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_preview_none_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreview_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtPreview_01', '0');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_preview_image_0600
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_preview_image_0600
     * @tc.desc   bindContextMenuByIsShow preview=MenuPreviewMode.IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_preview_image_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreview_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtPreview_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_preview_builder_0700
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_preview_builder_0700
     * @tc.desc   bindContextMenuByIsShow preview=CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_preview_builder_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreview_03');
      assertTextKey('BindContextMenuByIsShowOptions_txtPreview_03', 'builder');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_previewAnimationOptions_scale_0800
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_previewAnimationOptions_scale_0800
     * @tc.desc   bindContextMenuByIsShow previewAnimationOptions scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_previewAnimationOptions_scale_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreviewAnimation_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtPreviewAnimation_01', 'scale');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_false_0900
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_false_0900
     * @tc.desc   bindContextMenuByIsShow hoverScaleInterruption=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_false_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnHoverScaleInterruption_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtHoverScaleInterruption_01', 'false');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_true_1000
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_true_1000
     * @tc.desc   bindContextMenuByIsShow hoverScaleInterruption=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_hoverScaleInterruption_true_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnHoverScaleInterruption_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtHoverScaleInterruption_02', 'true');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_disabled_1100
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_disabled_1100
     * @tc.desc   bindContextMenuByIsShow hapticFeedbackMode=DISABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_disabled_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnHapticFeedback_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtHapticFeedback_01', '0');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_enabled_1200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_enabled_1200
     * @tc.desc   bindContextMenuByIsShow hapticFeedbackMode=ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_enabled_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnHapticFeedback_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtHapticFeedback_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_auto_1300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_auto_1300
     * @tc.desc   bindContextMenuByIsShow hapticFeedbackMode=AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_hapticFeedback_auto_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnHapticFeedback_03');
      assertTextKey('BindContextMenuByIsShowOptions_txtHapticFeedback_03', '2');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_modalMode_auto_1400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_modalMode_auto_1400
     * @tc.desc   bindContextMenuByIsShow modalMode=ModalMode.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_modalMode_auto_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnModalMode_01');
      assertTextContains('BindContextMenuByIsShowOptions_txtModalMode_01', 'AUTO');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_modalMode_none_1500
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_modalMode_none_1500
     * @tc.desc   bindContextMenuByIsShow modalMode=ModalMode.NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_modalMode_none_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnModalMode_02');
      assertTextContains('BindContextMenuByIsShowOptions_txtModalMode_02', 'NONE');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_modalMode_target_window_1600
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_modalMode_target_window_1600
     * @tc.desc   bindContextMenuByIsShow modalMode=ModalMode.TARGET_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_modalMode_target_window_1600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnModalMode_03');
      assertTextContains('BindContextMenuByIsShowOptions_txtModalMode_03', 'TARGET');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_auto_1700
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_auto_1700
     * @tc.desc   bindContextMenuByIsShow previewScaleMode=PreviewScaleMode.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_auto_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreviewScaleMode_01');
      assertTextContains('BindContextMenuByIsShowOptions_txtPreviewScaleMode_01', 'AUTO');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_constant_1800
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_constant_1800
     * @tc.desc   bindContextMenuByIsShow previewScaleMode=PreviewScaleMode.CONSTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_constant_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreviewScaleMode_02');
      assertTextContains('BindContextMenuByIsShowOptions_txtPreviewScaleMode_02', 'CONSTANT');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_maintain_1900
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_maintain_1900
     * @tc.desc   bindContextMenuByIsShow previewScaleMode=PreviewScaleMode.MAINTAIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_previewScaleMode_maintain_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnPreviewScaleMode_03');
      assertTextContains('BindContextMenuByIsShowOptions_txtPreviewScaleMode_03', 'MAINTAIN');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_availableLayoutArea_2000
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_availableLayoutArea_2000
     * @tc.desc   bindContextMenuByIsShow availableLayoutArea=SAFE_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_availableLayoutArea_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnAvailableLayoutArea_01');
      assertTextContains('BindContextMenuByIsShowOptions_txtAvailableLayoutArea_01', 'SAFE_AREA');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_none_2100
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_none_2100
     * @tc.desc   bindContextMenuByIsShow keyboardAvoidMode=NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_none_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnKeyboardAvoidMode_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtKeyboardAvoidMode_01', '0');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_translate_2200
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_translate_2200
     * @tc.desc   bindContextMenuByIsShow keyboardAvoidMode=TRANSLATE_AND_RESIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_keyboardAvoidMode_translate_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnKeyboardAvoidMode_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtKeyboardAvoidMode_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_system_2300
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_system_2300
     * @tc.desc   bindContextMenuByIsShow colorMode=FOLLOW_SYSTEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_system_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnColorMode_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtColorMode_01', '0');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_target_2400
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_target_2400
     * @tc.desc   bindContextMenuByIsShow colorMode=FOLLOW_TARGET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_colorMode_follow_target_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnColorMode_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtColorMode_02', '1');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_mask_true_2500
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_mask_true_2500
     * @tc.desc   bindContextMenuByIsShow mask=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_mask_true_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnMask_01');
      assertTextKey('BindContextMenuByIsShowOptions_txtMask_01', 'true');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_MENU_BCMByIsShow_mask_false_2600
     * @tc.number SUB_ARKUI_MENU_BCMByIsShow_mask_false_2600
     * @tc.desc   bindContextMenuByIsShow mask=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_MENU_BCMByIsShow_mask_false_2600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await navigatePage();
      await clickShowAndDismiss('BindContextMenuByIsShowOptions_btnMask_02');
      assertTextKey('BindContextMenuByIsShowOptions_txtMask_02', 'false');
      done();
    });
  });
}
