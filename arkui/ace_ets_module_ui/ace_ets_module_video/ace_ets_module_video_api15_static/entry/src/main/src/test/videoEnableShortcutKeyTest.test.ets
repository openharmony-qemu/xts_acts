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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import events_emitter from '@ohos.events.emitter';
import {KeyCode} from '@ohos.multimodalInput.keyCode'
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function videoEnableShortcutKeyTest() {
  describe('videoEnableShortcutKeyTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.video.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("videoEnableShortcutKeyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/videoEnableShortcutKey',
      }
      try {
        const videoEnableShortcutKey = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        videoEnableShortcutKey.clear();
        let pages = videoEnableShortcutKey.getState();
        console.info("get videoEnableShortcutKeyTest state pages: " + JSON.stringify(pages));
        if (!("VideoCallback" == pages.name)) {
          console.info("get videoEnableShortcutKeyTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await videoEnableShortcutKey.pushUrl(options);
          videoEnableShortcutKey.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push videoEnableShortcutKeyTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push videoEnableShortcutKeyTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number
     * @tc.name      SUB_ACESUB_ACE_UI_COMPONENT_MEDIA_VIDEO_KEYBOARD_0020
     * @tc.desc      Video component support for shortcut key response
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('videoEnableShortcutKeyTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('videoEnableShortcutKeyTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      // enableShortcutKey is true, controls is true, Shortcut Keys is effective.
      console.info("[videoEnableShortcutKeyTest_static_0100] set enableShortcutKey is true and showControls is true");
      let strJson_video = inspector.getInspectorByKey('videoEnableShortcutKey_video');
      let obj_video = JSON.parseJsonElement(strJson_video);
      console.info("[videoEnableShortcutKeyTest_static_0100] get enableShortcutKey is: " + JSON.stringify(obj_video.getElement('$attrs').getString('attrs.enableShortcutKey')));
      expect(obj_video.getElement('$attrs').getString('attrs.enableShortcutKey')).assertEqual('true');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(2000);

      let strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      let obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('onStart');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('onPause');

      let strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      let obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time1 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      let time_1 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time2 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      let time_2 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));
      expect(time_2).assertEqual(time_1 + 1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time3 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      let time_3 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));
      expect(time_3).assertEqual(time_2 - 1);

      // reset
      let button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // change controls is false (enableShortcutKey is true), Shortcut Keys is effective.
      console.info("[videoEnableShortcutKeyTest_static_0100] set enableShortcutKey is true and showControls is false");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_showControls'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(2000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('onStart');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('onPause');

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time1 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      time_1 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time2 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      time_2 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));
      expect(time_2).assertEqual(time_1 + 1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time3 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      time_3 = Number(obj_text2.getElement('$attrs').getString('attrs.content'));
      expect(time_3).assertEqual(time_2 - 1);

      // reset
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // change enableShortcutKey false (showControls is false), Shortcut Keys is invaild.
      console.info("[videoEnableShortcutKeyTest_static_0100] set enableShortcutKey is false and showControls is false");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_enableShortcutKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson_video = inspector.getInspectorByKey('videoEnableShortcutKey_video');
      obj_video = JSON.parseJsonElement(strJson_video);
      console.info("[videoEnableShortcutKeyTest_static_0100] get enableShortcutKey is: " + JSON.stringify(obj_video.getElement('$attrs').getString('attrs.enableShortcutKey')));
      expect(obj_video.getElement('$attrs').getString('attrs.enableShortcutKey')).assertEqual('false');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time2 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      expect(Number(obj_text2.getElement('$attrs').getString('attrs.content'))).assertEqual(0);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time3 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      expect(Number(obj_text2.getElement('$attrs').getString('attrs.content'))).assertEqual(0);

      // reset
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // change controls is true (enableShortcutKey is false), only left and right keys respond.
      console.info("[videoEnableShortcutKeyTest_static_0100] set enableShortcutKey is false and showControls is true");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_showControls'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = inspector.getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parseJsonElement(strJson_text);
      console.info("[videoEnableShortcutKeyTest_static_0100] state is: " + JSON.stringify(obj_text.getElement('$attrs').getString('attrs.content')));
      expect(obj_text.getElement('$attrs').getString('attrs.content')).assertEqual('init');


      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time3 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      expect(Number(obj_text2.getElement('$attrs').getString('attrs.content'))).assertEqual(1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = inspector.getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parseJsonElement(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_static_0100] current time2 is: " + JSON.stringify(obj_text2.getElement('$attrs').getString('attrs.content')));
      expect(Number(obj_text2.getElement('$attrs').getString('attrs.content'))).assertEqual(0);

      console.info('[videoEnableShortcutKeyTest_static_0100] END');
      done();
    });
  })
}

