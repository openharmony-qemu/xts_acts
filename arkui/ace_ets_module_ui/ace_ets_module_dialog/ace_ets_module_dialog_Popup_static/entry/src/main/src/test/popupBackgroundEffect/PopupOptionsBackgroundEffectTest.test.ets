'use static'
/*
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from
  '../../../../hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/popup/PopupOptionsBackgroundEffect';
const PAGE_NAME = 'PopupOptionsBackgroundEffect';

async function clickById(driver: Driver, id: string): Promise<void> {
  let button: Component = (await driver.findComponent(ON.id(id))) as Component;
  await (button?.click() as Promise<void>);
}

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(SLEEP_TIME);
  }
}

async function assertMsgPopup(driver: Driver, btnId: string, msg: string): Promise<void> {
  await clickById(driver, btnId);
  await CommonFunc.sleep(SLEEP_TIME);
  const popupText = await driver.findComponent(ON.text(msg));
  expect(!!popupText).assertEqual(true);
  await clickById(driver, btnId);
  await CommonFunc.sleep(SLEEP_TIME);
}

export default function PopupOptionsBackgroundEffectTest(): void {
  describe('PopupOptionsBackgroundEffectTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      await navigatePage();
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('PopupOptionsBackgroundEffect_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'radius_0', 'Popup radius 0');
      done();
    });
    it('PopupOptionsBackgroundEffect_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'radius_20', 'Popup radius 20');
      done();
    });
    it('PopupOptionsBackgroundEffect_0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'radius_60', 'Popup radius 60');
      done();
    });
    it('PopupOptionsBackgroundEffect_0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'saturation_0', 'Popup saturation 0');
      done();
    });
    it('PopupOptionsBackgroundEffect_0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'saturation_1', 'Popup saturation 1');
      done();
    });
    it('PopupOptionsBackgroundEffect_0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'saturation_2', 'Popup saturation 2');
      done();
    });
    it('PopupOptionsBackgroundEffect_0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'brightness_0', 'Popup brightness 0');
      done();
    });
    it('PopupOptionsBackgroundEffect_0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'brightness_1', 'Popup brightness 1');
      done();
    });
    it('PopupOptionsBackgroundEffect_0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'brightness_2', 'Popup brightness 2');
      done();
    });
    it('PopupOptionsBackgroundEffect_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'color_red', 'Popup color red');
      done();
    });
    it('PopupOptionsBackgroundEffect_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'color_string', 'Popup color string');
      done();
    });
    it('PopupOptionsBackgroundEffect_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'adaptiveColor_DEFAULT', 'Popup adaptiveColor DEFAULT');
      done();
    });
    it('PopupOptionsBackgroundEffect_0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'adaptiveColor_AVERAGE', 'Popup adaptiveColor AVERAGE');
      done();
    });
    it('PopupOptionsBackgroundEffect_0014', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'policy_ALWAYS_ACTIVE', 'Popup policy ALWAYS_ACTIVE');
      done();
    });
    it('PopupOptionsBackgroundEffect_0015', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'policy_ALWAYS_INACTIVE_inactiveColor',
        'Popup policy ALWAYS_INACTIVE inactiveColor');
      done();
    });
    it('PopupOptionsBackgroundEffect_0016', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await assertMsgPopup(Driver.create(), 'combinedOptions', 'Popup combined effect options');
      done();
    });
  });
}
