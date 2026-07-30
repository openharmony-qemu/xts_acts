/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function smartGestureShortcutTest() {
  describe('smartGestureShortcutTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SmartGesture/SmartGestureShortcut',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get smartGestureShortcutTest state pages: ' + JSON.stringify(pages));
        if (!('SmartGestureShortcut' == pages.name)) {
          console.info('get smartGestureShortcutTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push smartGestureShortcutTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push smartGestureShortcutTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('smartGestureShortcutTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_0100
     * @tc.name      SUB_ARKUI_SMART_GESTURE_0100
     * @tc.desc      Test smartGestureShortcut action is enums and enable/selectable is true.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_SMART_GESTURE_0100] START');
      let strJson = getInspectorByKey('button_PA');
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(strJson);
      console.info('button Component action is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.action));
      console.info('button Component enabled is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.enabled));
      console.info('button Component selectable is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.selectable));
      expect(obj.$attrs.smartGestureShortcut.action).assertEqual(0);
      expect(obj.$attrs.smartGestureShortcut.enabled).assertEqual(true);
      expect(obj.$attrs.smartGestureShortcut.selectable).assertEqual(true);
      await CommonFunc.sleep(500);
      console.info('[SUB_ARKUI_SMART_GESTURE_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_0200
     * @tc.name      SUB_ARKUI_SMART_GESTURE_0200
     * @tc.desc      Test smartGestureShortcut action is 0 and enable/selectable is false.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_SMART_GESTURE_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let text1 = await driver.findComponent(ON.id('text_false'));
      await text1.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('button_PA');
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(strJson);
      console.info('button Component action is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.action));
      console.info('button Component enabled is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.enabled));
      console.info('button Component selectable is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.selectable));
      expect(obj.$attrs.smartGestureShortcut.action).assertEqual(0);
      expect(obj.$attrs.smartGestureShortcut.enabled).assertEqual(false);
      expect(obj.$attrs.smartGestureShortcut.selectable).assertEqual(false);
      await CommonFunc.sleep(500);
      console.info('[SUB_ARKUI_SMART_GESTURE_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_0300
     * @tc.name      SUB_ARKUI_SMART_GESTURE_0300
     * @tc.desc      Test smartGestureShortcut action/enable/selectable is undefined.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_SMART_GESTURE_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let text2 = await driver.findComponent(ON.id('text_un'));
      await text2.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('button_PA');
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(strJson);
      console.info('button Component action is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.action));
      console.info('button Component enabled is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.enabled));
      console.info('button Component selectable is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.selectable));
      expect(obj.$attrs.smartGestureShortcut.action).assertEqual(0);
      expect(obj.$attrs.smartGestureShortcut.enabled).assertEqual(false);
      expect(obj.$attrs.smartGestureShortcut.selectable).assertEqual(false);
      await CommonFunc.sleep(500);
      console.info('[SUB_ARKUI_SMART_GESTURE_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_0400
     * @tc.name      SUB_ARKUI_SMART_GESTURE_0400
     * @tc.desc      Test smartGestureShortcut action/enable/selectable is null.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_SMART_GESTURE_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let text3 = await driver.findComponent(ON.id('text_null'));
      await text3.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('button_PA');
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(strJson);
      console.info('button Component action is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.action));
      console.info('button Component enabled is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.enabled));
      console.info('button Component selectable is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.selectable));
      expect(obj.$attrs.smartGestureShortcut.action).assertEqual(0);
      expect(obj.$attrs.smartGestureShortcut.enabled).assertEqual(false);
      expect(obj.$attrs.smartGestureShortcut.selectable).assertEqual(false);
      await CommonFunc.sleep(500);
      console.info('[SUB_ARKUI_SMART_GESTURE_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_0500
     * @tc.name      SUB_ARKUI_SMART_GESTURE_0500
     * @tc.desc      Test smartGestureShortcut action/enable/selectable is null.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_SMART_GESTURE_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let text4 = await driver.findComponent(ON.id('text_1'));
      await text4.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('button_PA');
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(strJson);
      console.info('button Component action is: ' + JSON.stringify(obj.$attrs.smartGestureShortcut.action));
      expect(obj.$attrs.smartGestureShortcut.action).assertEqual(0);
      await CommonFunc.sleep(500);
      console.info('[SUB_ARKUI_SMART_GESTURE_0500] END');
      done();
    });
  })
}