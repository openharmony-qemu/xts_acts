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
import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';

const KEYCODE_DPAD_UP: number = 2012;
const KEYCODE_DPAD_DOWN: number = 2013;

// Parse the current vertical offset from V_SCROLL_KB_OFFSET text, e.g. 'offset=123' -> 123
function getVScrollOffset(): number {
  let strJson: string = inspector.getInspectorByKey('V_SCROLL_KB_OFFSET');
  let obj = JSON.parseJsonElement(strJson);
  let content: string = obj.getElement('$attrs').getString('content');
  console.info('[scrollKeyboardTest] current offset content: ' + content);
  let start: number = content.indexOf('=') + 1;
  return parseInt(content.substring(start), 10);
}

export default function scrollKeyboardTest() {
  describe('scrollKeyboardTest', () => {

    beforeEach(async () => {
      console.info('scrollKeyboardTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollKeyboard',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get scrollKeyboardTest state pages:' + JSON.stringify(pages));
        if (!('scrollKeyboard' == pages.name)) {
          console.info('get scrollKeyboardTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push scrollKeyboardTest page error:' + err);
      }
      console.info('scrollKeyboardTest beforeEach end');
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      let driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(1500);
      console.info('scrollKeyboardTest afterEach called');
    });

    /**
     * @tc.number   SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_STATIC_0100
     * @tc.name     scrollKeyboard_static_0100
     * @tc.desc     Vertical Scroll scrolls with keyboard arrow keys when
     *              enableScrollWithKeyboard is set to true.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollKeyboard_static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollKeyboard_static_0100] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let btn = await driver.findComponent(ON.id('V_SCROLL_KB_TRUE'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(500);
        let resetBtn = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
        await (resetBtn?.click() as Promise<void>);
        await Utils.sleep(500);
        expect(getVScrollOffset()).assertEqual(0);

        let scrollComp = await driver.findComponent(ON.id('V_SCROLL_KB'));
        let displayId = await scrollComp!.getDisplayId();
        await (scrollComp?.click() as Promise<void>);
        await Utils.sleep(500);

        for (let i = 0; i < 3; i++) {
          await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
          await Utils.sleep(500);
        }
        let offsetDown: number = getVScrollOffset();
        console.info('[scrollKeyboard_static_0100] offset after DPAD_DOWN: ' + offsetDown);
        expect(offsetDown > 0).assertTrue();

        for (let i = 0; i < 2; i++) {
          await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
          await Utils.sleep(500);
        }
        let offsetUp: number = getVScrollOffset();
        console.info('[scrollKeyboard_static_0100] offset after DPAD_UP: ' + offsetUp);
        expect(offsetUp < offsetDown).assertTrue();
        console.info('[scrollKeyboard_static_0100] END');
        done();
      });

    /**
     * @tc.number   SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_STATIC_0200
     * @tc.name     scrollKeyboard_static_0200
     * @tc.desc     Vertical Scroll does not scroll with keyboard arrow keys when
     *              enableScrollWithKeyboard is set to false.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollKeyboard_static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollKeyboard_static_0200] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let btn = await driver.findComponent(ON.id('V_SCROLL_KB_FALSE'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(500);
        let resetBtn = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
        await (resetBtn?.click() as Promise<void>);
        await Utils.sleep(500);
        expect(getVScrollOffset()).assertEqual(0);

        let scrollComp = await driver.findComponent(ON.id('V_SCROLL_KB'));
        let displayId = await scrollComp!.getDisplayId();
        await (scrollComp?.click() as Promise<void>);
        await Utils.sleep(500);

        for (let i = 0; i < 3; i++) {
          await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
          await Utils.sleep(500);
        }
        let offsetDown: number = getVScrollOffset();
        console.info('[scrollKeyboard_static_0200] offset after DPAD_DOWN: ' + offsetDown);
        expect(offsetDown).assertEqual(0);
        console.info('[scrollKeyboard_static_0200] END');
        done();
      });

    /**
     * @tc.number   SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_STATIC_0300
     * @tc.name     scrollKeyboard_static_0300
     * @tc.desc     Vertical Scroll scrolls with keyboard arrow keys when
     *              enableScrollWithKeyboard is set to undefined (default value true).
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollKeyboard_static_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollKeyboard_static_0300] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let btn = await driver.findComponent(ON.id('V_SCROLL_KB_UNDEF'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(500);
        let resetBtn = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
        await (resetBtn?.click() as Promise<void>);
        await Utils.sleep(500);
        expect(getVScrollOffset()).assertEqual(0);

        let scrollComp = await driver.findComponent(ON.id('V_SCROLL_KB'));
        let displayId = await scrollComp!.getDisplayId();
        await (scrollComp?.click() as Promise<void>);
        await Utils.sleep(500);

        for (let i = 0; i < 3; i++) {
          await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
          await Utils.sleep(500);
        }
        let offsetDown: number = getVScrollOffset();
        console.info('[scrollKeyboard_static_0300] offset after DPAD_DOWN: ' + offsetDown);
        expect(offsetDown > 0).assertTrue();
        console.info('[scrollKeyboard_static_0300] END');
        done();
      });
  })
}
