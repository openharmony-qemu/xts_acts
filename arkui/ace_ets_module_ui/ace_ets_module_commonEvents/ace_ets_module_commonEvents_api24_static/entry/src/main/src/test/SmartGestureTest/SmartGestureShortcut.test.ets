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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, MouseButton, Point, Component } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';

export default function smartGestureShortcutStaticTest(): void {
  describe('smartGestureShortcutStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("smartGestureShortcutStaticTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SmartGesture/SmartGestureShortcut',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get smartGestureShortcutStaticTest pages:' + JSON.stringify(pages));
        if (!('SmartGestureShortcut' == pages.name)) {
          console.info('get smartGestureShortcutStaticTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push smartGestureShortcutStaticTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('smartGestureShortcutStaticTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_STATIC_0100
     * @tc.name      SUB_ARKUI_SMART_GESTURE_STATIC_0100
     * @tc.desc      Test smartGestureShortcut action is enums and enable/selectable is true.
     * @tc.level:    Level.LEVEL0
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0100] START');
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('button_PA_Static');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0100] strJson is: ' + strJson);
      let a: int = 0;
      let obj1 = obj.getElement('$attrs').getElement('smartGestureShortcut').getInteger('action');
      let obj2 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('enabled');
      let obj3 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('selectable');
      await CommonFunc.sleep(500);
      expect(obj1).assertEqual(a);
      expect(obj2).assertEqual(true);
      expect(obj3).assertEqual(true);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0100] END')
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_STATIC_0200
     * @tc.name      SUB_ARKUI_SMART_GESTURE_STATIC_0200
     * @tc.desc      Test smartGestureShortcut action and enable/selectable is undefined.
     * @tc.level:    Level.LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0200] START');
      let driver = Driver.create();
      let text1: Component = await driver.findComponent(ON.id('text_undefined_Static')) as Component;
      await text1.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('button_PA_Static');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0200] strJson is: ' + strJson);
      let b: int = 0;
      let obj1 = obj.getElement('$attrs').getElement('smartGestureShortcut').getInteger('action');
      let obj2 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('enabled');
      let obj3 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('selectable');
      await CommonFunc.sleep(500);
      expect(obj1).assertEqual(b);
      expect(obj2).assertEqual(false);
      expect(obj3).assertEqual(false);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0200] END')
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_SMART_GESTURE_STATIC_0300
     * @tc.name      SUB_ARKUI_SMART_GESTURE_STATIC_0300
     * @tc.desc      Test smartGestureShortcut enable and selectable is false.
     * @tc.level:    Level.LEVEL0
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEXT
     */
    it('SUB_ARKUI_SMART_GESTURE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0300] START');
      let driver = Driver.create();
      let text1: Component = await driver.findComponent(ON.id('text_false_Static')) as Component;
      await text1.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('button_PA_Static');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0300] strJson is: ' + strJson);
      let c: int = 0;
      let obj1 = obj.getElement('$attrs').getElement('smartGestureShortcut').getInteger('action');
      let obj2 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('enabled');
      let obj3 = obj.getElement('$attrs').getElement('smartGestureShortcut').getBoolean('selectable');
      await CommonFunc.sleep(500);
      expect(obj1).assertEqual(c);
      expect(obj2).assertEqual(false);
      expect(obj3).assertEqual(false);
      console.info('[SUB_ARKUI_SMART_GESTURE_STATIC_0300] END')
      done();
    });
  })
}