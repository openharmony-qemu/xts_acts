/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, UiDriver, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

const SUBWINDOW_PREFIX = 'subwindowDialog_';
const KEY_LONG_CLICK_MENU = SUBWINDOW_PREFIX + 'longClickMenu';
const KEY_CLICK_CLOSE = SUBWINDOW_PREFIX + 'clickClose';

export default function subwindowDialog() {
  describe('subwindowDialog', () => {
    beforeEach(async (done: Function) => {
      console.info("subwindowDialog beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/subwindowDialog',
      }
      try {
        let pages = router.getState();
        console.info("get subwindowDialog state pages: " + JSON.stringify(pages));
        if (pages.name !== 'subwindowDialog') {
          router.clear();
          console.info("get subwindowDialog state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push subwindowDialog success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push subwindowDialog page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_subwindowDialog_0100
     * @tc.name      subwindowDialog_0100
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('subwindowDialog_0100', Level.LEVEL2, async (done: Function) => {
      console.info('subwindowDialog_0100 START');
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('subwindowDialog_clickFalse', 10, '')).assertTrue();
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('subwindowDialog_clickOpen', 10, '')).assertTrue();
      await CommonFunc.sleep(1500);

      let windowClassFirst: window.Window | undefined = undefined;
      windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
      let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
      expect(propertiesFirst.type).assertEqual(1)

      let uiDriver = await UiDriver.create();
      let buttonSubwindowMenu = await uiDriver.findComponent(BY.key(KEY_LONG_CLICK_MENU));
      expect(!!buttonSubwindowMenu).assertTrue();
      await buttonSubwindowMenu.longClick();
      await CommonFunc.sleep(1000);

      let windowClassSecond: window.Window | undefined = undefined;
      windowClassSecond = await window.getLastWindow(globalThis.abilityContext);
      let propertiesSecond: window.WindowProperties = windowClassSecond.getWindowProperties();
      console.info("[subwindowDialog_0100] title: " + JSON.stringify(propertiesSecond));
      console.info("[subwindowDialog_0100] title: " + JSON.stringify(propertiesSecond.type));
      expect(propertiesSecond.type).assertEqual(0)//0表示应用子窗口TYPE_APP

      await CommonFunc.sleep(1000);
      await uiDriver.click(Math.round(globalThis.winLeft + vp2px(100)), Math.round(globalThis.winTop + vp2px(100)));
      await CommonFunc.sleep(1000);
      let buttonCloseDialog = await uiDriver.findComponent(BY.key(KEY_CLICK_CLOSE));
      if (buttonCloseDialog) {
        await buttonCloseDialog.click();
        await CommonFunc.sleep(1000);
      }
      console.info('[subwindowDialog_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_subwindowDialog_0200
     * @tc.name      subwindowDialog_0200
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('subwindowDialog_0200', Level.LEVEL2, async (done: Function) => {
      console.info('subwindowDialog_0200 START');
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('subwindowDialog_clickTrue', 10, '')).assertTrue();
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('subwindowDialog_clickOpen', 10, '')).assertTrue();
      await CommonFunc.sleep(1500);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      expect(properties.type).assertEqual(0)

      let uiDriver = await UiDriver.create();
      let buttonSubwindowMenu = await uiDriver.findComponent(BY.key(KEY_LONG_CLICK_MENU));
      expect(!!buttonSubwindowMenu).assertTrue();
      await buttonSubwindowMenu.longClick();
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let menuBtn = await driver.findComponent(ON.text('菜单选项'));
      await CommonFunc.sleep(1000);
      await menuBtn.click();
      await CommonFunc.sleep(2000);

      let buttonCloseDialog = await uiDriver.findComponent(BY.key(KEY_CLICK_CLOSE));
      if (buttonCloseDialog) {
        await buttonCloseDialog.click();
        await CommonFunc.sleep(1000);
      }
      console.info('[subwindowDialog_0200] END');
      done();
    });

  })
}

