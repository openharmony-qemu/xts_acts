'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton,ResizeDirection, WindowMode,UiWindow, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, Rect } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';

import { Utils, startAbility, stopApplication, getInputMethodPermission } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestTag';
const waitUiReadyMs : int = 1000;
const DeviceErrorCode = 17000005;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}
async function maxUiWindow(driver: Driver, window: UiWindow | null) {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode == WindowMode.FULLSCREEN) {
        return;
      }
      await window.maximize();
    } catch (error) {
      console.log(`${TestTag}, maxUiWindow error,${JSON.stringify(error)}`);
    }
  } else {
    console.log(`${TestTag}, maxUiWindow null`);
  }
  await driver.delayMs(3000);
}

export default function uitestEnumTest(): void {
  describe('UiTest_API16', (): void => {
    let driver: Driver | undefined;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestEnumTest loadup start!!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      driver = Driver.create();
      await Utils.msSleep(1000);
      await getInputMethodPermission(driver!);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestEnumTest loadup over!!!!!");
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   test_touchPadMultiFingerSwipe_Up_Down_3_static
     * @tc.number SUB_testfwk_uitest_Api16_0001
     * @tc.desc   Swipe UP or Down with three point.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_touchPadMultiFingerSwipe_Up_Down_3_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (): Promise<void> => {
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(1000);
        // 三指上划返回桌面。
        await driver!.touchPadMultiFingerSwipe(3, UiDirection.UP);
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static UiDirection.UP success`);
        await driver!.delayMs(1000);
        let mainPageCom = await driver!.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static mainPageCom, ${JSON.stringify(mainPageCom)}`);
        expect(mainPageCom == null).assertTrue();
        // 三指下划,应用返回前台
        await driver!.touchPadMultiFingerSwipe(3, UiDirection.DOWN, {stay: false});
        await driver!.delayMs(1000);
        let mainPageCom1 = await driver!.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static mainPageCom1, ${JSON.stringify(mainPageCom1)}`);
        expect(mainPageCom1 != null).assertTrue();
      } catch (error ) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static error, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code == 17000005).assertTrue();
      }
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_3_static end`);
      await stopApplication('com.uitestScene.acts');

    })

    /**
     * @tc.name   test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static
     * @tc.number SUB_testfwk_uitest_Api16_0002
     * @tc.desc   Swipe Up or Down with three point then  in more task statue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(1000);
        // 三指上划停留, 进入多任务中心。
        await driver!.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: true, speed: 3000});
        let mainPageCom = await driver!.findComponent(ON.text('MainPage'));
        await driver!.delayMs(1000);
        expect(mainPageCom).assertNull();
      } catch (error) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static up, error is, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code == 17000005).assertTrue();
      }
      await driver!.delayMs(1000);
      try {
        // 三指下划,应用返回前台。
        await driver!.touchPadMultiFingerSwipe(3, UiDirection.DOWN, {stay: true, speed: 3000});
        await driver!.delayMs(1000);
        let mainPageCom = await driver!.findComponent(ON.text('MainPage'));
        await driver!.delayMs(1000);
        expect(mainPageCom).not().assertNull();
      } catch (error) {
        hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static down, error is, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code == 17000005).assertTrue();
      }
      await driver!.delayMs(1000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_static end`);
    })

    /**
     * @tc.name   test_touchPadMultiFingerSwipe_other_static
     * @tc.number SUB_testfwk_uitest_Api16_0003
     * @tc.desc   Swipe Left, Swipe with four point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_touchPadMultiFingerSwipe_other_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_touchPadMultiFingerSwipe_other_static start');
      try {
        // 3指左划
        await driver!.touchPadMultiFingerSwipe(3, UiDirection.LEFT);
        console.log(TestTag, `test_touchPadMultiFingerSwipe_other_static`);
      } catch (error) {
        console.log(TestTag, `test_touchPadMultiFingerSwipe_other_static, error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      try {
        // 4指上划
        await driver!.touchPadMultiFingerSwipe(4, UiDirection.UP);
        console.log(TestTag, `test_touchPadMultiFingerSwipe_other_static`);
      } catch (error) {
        console.log(TestTag, `test_touchPadMultiFingerSwipe_other_static, error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      console.log(TestTag, 'test_touchPadMultiFingerSwipe_other_static end');
    })

    /**
     * @tc.name   test_penClick_function_static
     * @tc.number SUB_testfwk_uitest_Api16_0007
     * @tc.desc   penClick function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penClick_function_static start!!!!")
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver!.findComponent(ON.text('next page'));
        await driver!.delayMs(waitUiReadyMs);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          await driver!.penClick(btnPoint);
          await driver!.delayMs(waitUiReadyMs);
        }
        let strCom = await driver!.findComponent(ON.text('back to index'));
        await driver!.delayMs(waitUiReadyMs);
        expect(strCom != null).assertTrue();
        if (strCom != null) {
          let strText = await strCom.getText();
          await driver!.delayMs(waitUiReadyMs);
          expect(strText).assertEqual('back to index');
          await strCom.click();
          await driver!.delayMs(waitUiReadyMs);
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penClick_function_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testPenClick over!!!!")
    })

    /**
     * @tc.name   test_penLongClick_function_static
     * @tc.number SUB_testfwk_uitest_Api16_0009
     * @tc.desc   penLongClick function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penLongClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penLongClick_function_static start!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let button = await driver!.findComponent(ON.text('next page'));
        expect(button != null).assertTrue();
        if (button != null) {
          let btnPoint = await button.getBoundsCenter();
          await driver!.penLongClick(btnPoint);
          await driver!.delayMs(waitUiReadyMs);
          let newButton = await driver!.findComponent(ON.text('longClick'));
          expect(newButton != null).assertTrue();
          if (newButton != null) {
            let text = await newButton.getText();
            expect(text == 'longClick').assertTrue();
            await newButton.click();
            await driver!.delayMs(waitUiReadyMs);
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penLongClick_function_static error, ${ JSON.stringify(error)} `);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "test_penLongClick_function_static end!!!!");
    })

    /**
     * @tc.name   testPenLongClickPressure_static
     * @tc.number SUB_testfwk_uitest_Api16_0099
     * @tc.desc   penLongClick function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenLongClickPressure_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPenLongClickPressure_static start!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      let btnPoint = await button!.getBoundsCenter();
      try {
        await driver!.penLongClick(btnPoint, 0.5);
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        let text = await newButton!.getText()
        expect(text == 'longClick').assertTrue()
        await newButton!.click()
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        hilog.info(domain, tag, `testPenLongClickPressure error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, `testPenLongClickPressure end`);
    })

    /**
     * @tc.name   testPenLongClickPressureUndefined_static
     * @tc.number SUB_testfwk_uitest_Api16_0129
     * @tc.desc   penLongClick function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenLongClickPressureUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testPenLongClickPressureUndefined_static start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('next page'))
      let btnPoint = await button!.getBoundsCenter();
      try {
        await driver!.penLongClick(btnPoint, undefined);
        await driver!.delayMs(waitUiReadyMs)
        let newButton = await driver!.findComponent(ON.text('longClick'))
        let text = await newButton!.getText()
        expect(text == 'longClick').assertTrue()
        await newButton!.click()
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        console.log(TestTag, `testPenLongClickPressureUndefined_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(TestTag, 'testPenLongClickPressureUndefined_static end');
    })

    /**
     * @tc.name   test_penDoubleClick_function_static
     * @tc.number SUB_testfwk_uitest_Api16_0011
     * @tc.desc   penDoubleClick function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penDoubleClick_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_penDoubleClick_function_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver!.findComponent(ON.text('Click twice'));
        await driver!.delayMs(1000);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          hilog.info(domain, tag, `test_penDoubleClick_function_static btnPoint, ${ JSON.stringify(btnPoint)}`);
          await driver!.penDoubleClick(btnPoint);
        }
        await driver!.delayMs(1000);
        let newButton = await driver!.findComponent(ON.text('doubleClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          hilog.info(domain, tag, `test_penDoubleClick_function_static newButton, ${ JSON.stringify(newButton)}`);
          let text = await newButton.getText();
          hilog.info(domain, tag, `test_penDoubleClick_function_static text, ${ JSON.stringify(text)}`);
          expect(text == 'doubleClick').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penDoubleClick_function_static error, ${ JSON.stringify(error)} }`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "test_penDoubleClick_function_static over!!!!")
    })

    /**
     * @tc.name   test_penSwipe_function_static
     * @tc.number SUB_testfwk_uitest_Api16_0013
     * @tc.desc   penSwipe function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penSwipe_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_static start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver!.delayMs(waitUiReadyMs);
        await maxUiWindow(driver!, window);
        // 垂直滑动
        let scroll = await driver!.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver!.penSwipe({x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt()},
            {x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() },600, 0.5);
          let text = await driver!.findComponent(ON.text('toast'));
          await driver!.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
          await driver!.delayMs(waitUiReadyMs);
          let pressureCom = await driver!.findComponent(ON.id('pressure'));
          await driver!.delayMs(waitUiReadyMs);
          expect(pressureCom != null).assertTrue();
          if (pressureCom != null) {
            let pressure = await pressureCom.getText();
            await driver!.delayMs(waitUiReadyMs);
            expect(pressure).assertEqual('0.5');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   test_penSwipe_function_pressure_static
     * @tc.number SUB_testfwk_uitest_Api16_0044
     * @tc.desc   penSwipe function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penSwipe_function_pressure_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_pressure_static start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver!.delayMs(waitUiReadyMs);
        await maxUiWindow(driver!, window);
        // 垂直滑动
        let scroll = await driver!.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver!.penSwipe({x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt()},
            {x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() },600);
          let text = await driver!.findComponent(ON.text('toast'));
          await driver!.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_pressure_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_pressure_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   test_penSwipe_function_speed_static
     * @tc.number SUB_testfwk_uitest_Api16_0058
     * @tc.desc   penSwipe function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_penSwipe_function_speed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_penSwipe_function_speed_static start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver!.delayMs(waitUiReadyMs);
        await maxUiWindow(driver!, window);
        // 垂直滑动
        let scroll = await driver!.findComponent(ON.type('Scroll'));
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          await driver!.penSwipe({x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt()},
            {x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() });
          let text = await driver!.findComponent(ON.text('toast'));
          await driver!.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `test_penSwipe_function_speed_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "test_penSwipe_function_speed_static over!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testPenSwipeSpeedUndefined_static
     * @tc.number SUB_testfwk_uitest_Api16_0043
     * @tc.desc   penSwipe function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSwipeSpeedUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testPenSwipeSpeedUndefined_static start');
      await driver!.delayMs(waitUiReadyMs);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs);
      try {
        // 垂直滑动
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        let scrollRect = await scroll!.getBounds()
        let screenWidth = scrollRect.right - scrollRect.left;
        let screenHeight = scrollRect.bottom - scrollRect.top;
        console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
        await driver!.penSwipe({ x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt() },
          { x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() }, undefined);
        await driver!.delayMs(waitUiReadyMs);
        let text = await driver!.findComponent(ON.text('toast'));
        await driver!.delayMs(waitUiReadyMs);
        expect(text == null).assertTrue();
      } catch (error) {
        console.log(TestTag, `testPenSwipeSpeedUndefined_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(TestTag, 'testPenSwipeSpeedUndefined_static end');
    })

    /**
     * @tc.name   testPenSwipeSpeedLowRange_static
     * @tc.number SUB_testfwk_uitest_Api16_0143
     * @tc.desc   penSwipe function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSwipeSpeedLowRange_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testPenSwipeSpeedLowRange_static start');
      await driver!.delayMs(waitUiReadyMs);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs);
      try {
        // 垂直滑动
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        let scrollRect = await scroll!.getBounds()
        let screenWidth = scrollRect.right - scrollRect.left;
        let screenHeight = scrollRect.bottom - scrollRect.top;
        console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
        await driver!.penSwipe({ x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt() },
          { x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() }, 199);
        await driver!.delayMs(waitUiReadyMs);
        let text = await driver!.findComponent(ON.text('toast'));
        await driver!.delayMs(waitUiReadyMs);
        expect(text == null).assertTrue();
      } catch (error) {
        console.log(TestTag, `testPenSwipeSpeedLowRange_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(TestTag, 'testPenSwipeSpeedLowRange_static end');
    })

    /**
     * @tc.name   testPenSwipeSpeedAboveMax_static
     * @tc.number SUB_testfwk_uitest_Api16_0243
     * @tc.desc   penSwipe function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSwipeSpeedAboveMax_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testPenSwipeSpeedAboveMax_static start');
      await driver!.delayMs(waitUiReadyMs);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs);
      try {
        // 垂直滑动
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        let scrollRect = await scroll!.getBounds()
        let screenWidth = scrollRect.right - scrollRect.left;
        let screenHeight = scrollRect.bottom - scrollRect.top;
        console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
        await driver!.penSwipe({ x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt() },
          { x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() }, 40001);
        await driver!.delayMs(waitUiReadyMs);
        let text = await driver!.findComponent(ON.text('toast'));
        await driver!.delayMs(waitUiReadyMs);
        expect(text == null).assertTrue();
      } catch (error) {
        console.log(TestTag, `testPenSwipeSpeedAboveMax_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(TestTag, 'testPenSwipeSpeedAboveMax_static end');
    })

    /**
     * @tc.name   testPenSwipePressureUndefined_static
     * @tc.number SUB_testfwk_uitest_Api16_0063
     * @tc.desc   penSwipe function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSwipePressureUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        console.log(TestTag, 'testPenSwipePressureUndefined_static start');
        await driver!.delayMs(waitUiReadyMs);
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs);
        // 垂直滑动
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        let scrollRect = await scroll!.getBounds()
        let screenWidth = scrollRect.right - scrollRect.left;
        let screenHeight = scrollRect.bottom - scrollRect.top;
        console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
        await driver!.penSwipe({ x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 + screenHeight / 4).toInt() },
          { x: Math.floor(screenWidth / 2).toInt(), y: Math.floor(screenHeight / 2 - screenHeight / 4).toInt() }, 600, undefined);
        await driver!.delayMs(waitUiReadyMs);
        let text = await driver!.findComponent(ON.text('toast'));
        await driver!.delayMs(waitUiReadyMs);
        expect(text == null).assertTrue();
      } catch (error) {
        console.log(TestTag, `testPenSwipePressureUndefined_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(TestTag, 'testPenSwipePressureUndefined_static end');
    })

    /**
     * @tc.name   test_injectPenPointAction_function_static
     * @tc.number SUB_testfwk_uitest_Api16_0015
     * @tc.desc   injectPenPointAction function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_injectPenPointAction_function_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_function_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8).toInt();
          let startX = Math.floor(screenWidth / 2).toInt();
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step).toInt();
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver!.injectPenPointerAction(pointer, 600, 0.5);
          await driver!.delayMs(2000);
          let text = await driver!.findComponent(ON.text('toast'));
          hilog.info(domain, tag, `test_injectPenPointAction_function_static text, ${ JSON.stringify(text)}`);
          expect(text == null).assertTrue();
          await driver!.delayMs(waitUiReadyMs);
          let pressureCom = await driver!.findComponent(ON.id('pressure'));
          hilog.info(domain, tag, `test_injectPenPointAction_function_static pressureCom, ${ JSON.stringify(pressureCom)}`);
          await driver!.delayMs(waitUiReadyMs);
          if (pressureCom != null) {
            let pressure = await pressureCom.getText();
            await driver!.delayMs(waitUiReadyMs);
            expect(pressure).assertEqual('0.5');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_function_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "test_injectPenPointAction_function_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testInjectPenPointActionDefault_static
     * @tc.number SUB_testfwk_uitest_Api16_0025
     * @tc.desc   injectPenPointAction function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectPenPointActionDefault_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_speed_function_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8).toInt();
          let startX = Math.floor(screenWidth / 2).toInt();
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step).toInt();
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver!.injectPenPointerAction(pointer);
          await driver!.delayMs(2000);
          let text = await driver!.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
          let pressureCom = await driver!.findComponent(ON.id('pressure'));
          await driver!.delayMs(waitUiReadyMs);
          let pressure = await pressureCom!.getText();
          await driver!.delayMs(waitUiReadyMs);
          expect(pressure).assertEqual('1.0');
        }
      } catch(error) {
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      hilog.info(domain, tag, "test_injectPenPointAction_speed_function_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testInjectPenPointActionSpeed_static
     * @tc.number SUB_testfwk_uitest_Api16_0035
     * @tc.desc   injectPenPointAction function test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectPenPointActionSpeed_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        await driver!.delayMs(waitUiReadyMs);
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        expect(scroll != null).assertTrue();
        if (scroll != null) {
          let scrollRect = await scroll.getBounds()
          let screenWidth = scrollRect.right - scrollRect.left;
          let screenHeight = scrollRect.bottom - scrollRect.top;
          let stepLength = Math.floor((screenHeight / 4) * 2 / 8).toInt();
          let startX = Math.floor(screenWidth / 2).toInt();
          let pointer = PointerMatrix.create(1,8);
          for (let step = 0; step < 8; step++) {
            let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step).toInt();
            pointer.setPoint(0, step, {x: startX, y: startY });
          }
          await driver!.injectPenPointerAction(pointer, 800);
          await driver!.delayMs(2000);
          let text = await driver!.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
          let pressureCom = await driver!.findComponent(ON.id('pressure'));
          await driver!.delayMs(waitUiReadyMs);
          let pressure = await pressureCom!.getText();
          await driver!.delayMs(waitUiReadyMs);
          expect(pressure).assertEqual('1.0');
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_static error, ${ JSON.stringify(error) }`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      hilog.info(domain, tag, "test_injectPenPointAction_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testInjectPenPointActionSpeedUndefined_static
     * @tc.number SUB_testfwk_uitest_Api16_0045
     * @tc.desc   injectPenPointAction function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectPenPointActionSpeedUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        console.log(TestTag, `testInjectPenPointActionSpeedUndefined_static start`);
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs)
        let scroll = await driver!.findComponent(ON.type('Scroll'))
        let scrollRect = await scroll!.getBounds()
        let screenWidth = scrollRect.right - scrollRect.left;
        let screenHeight = scrollRect.bottom - scrollRect.top;
        console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
        let pointer = PointerMatrix.create(1, 8);
        let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
        console.log(TestTag, `stepLength is, ${stepLength}`);
        let startX = Math.floor(screenWidth / 2).toInt();
        for (let step = 0; step < 8; step++) {
          let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step).toInt();
          console.log(TestTag, `startX is, ${startX}, startY is, ${startY}`);
          pointer.setPoint(0, step, { x: startX, y: startY });
        }
        await driver!.injectPenPointerAction(pointer, undefined);
        await driver!.delayMs(waitUiReadyMs * 2);
        let text = await driver!.findComponent(ON.text('toast'));
        expect(text == null).assertTrue();
        await driver!.delayMs(waitUiReadyMs);
        let pressureCom = await driver!.findComponent(ON.id('pressure'));
        await driver!.delayMs(waitUiReadyMs);
        let pressure = await pressureCom!.getText();
        await driver!.delayMs(waitUiReadyMs);
        expect(pressure).assertEqual('1.0');
        await driver!.delayMs(waitUiReadyMs);
        let scrollBar = await driver!.findComponent(ON.type('Scroll'));
        await driver!.delayMs(waitUiReadyMs);
        await scrollBar!.scrollToTop();
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        console.log(TestTag, `testInjectPenPointActionSpeedUndefined_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts')
      }
      console.log(TestTag, `testInjectPenPointActionSpeedUndefined_static end`);
    })

    /**
     * @tc.name   testInjectPenPointActionPressureUndefined_static
     * @tc.number SUB_testfwk_uitest_Api16_0065
     * @tc.desc   injectPenPointAction function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectPenPointActionPressureUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, `testInjectPenPointActionPressureUndefined_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs)
      let scroll = await driver!.findComponent(ON.type('Scroll'))
      let scrollRect = await scroll!.getBounds()
      let screenWidth = scrollRect.right - scrollRect.left;
      let screenHeight = scrollRect.bottom - scrollRect.top;
      console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' + screenHeight);
      let pointer = PointerMatrix.create(1, 8);
      let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
      console.log(TestTag, `stepLength is, ${stepLength}`);
      let startX = Math.floor(screenWidth / 2).toInt();
      for (let step = 0; step < 8; step++) {
        let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step).toInt();
        console.log(TestTag, `startX is, ${startX}, startY is, ${startY}`);
        pointer.setPoint(0, step, { x: startX, y: startY});
      }
      try {
        await driver!.injectPenPointerAction(pointer, 600, undefined);
        await driver!.delayMs(waitUiReadyMs * 2);
        let text = await driver!.findComponent(ON.text('toast'));
        expect(text == null).assertTrue();
        await driver!.delayMs(waitUiReadyMs);
        let pressureCom = await driver!.findComponent(ON.id('pressure'));
        await driver!.delayMs(waitUiReadyMs);
        let pressure = await pressureCom!.getText();
        await driver!.delayMs(waitUiReadyMs);
        expect(pressure).assertEqual('1.0');
        await driver!.delayMs(waitUiReadyMs);
        let scrollBar = await driver!.findComponent(ON.type('Scroll'));
        await driver!.delayMs(waitUiReadyMs);
        await scrollBar!.scrollToTop();
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        console.log(TestTag, `testInjectPenPointActionPressureUndefined_static error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      } finally {
        await stopApplication('com.uitestScene.acts')
      }
      console.log(TestTag, `testInjectPenPointActionPressureUndefined_static end`);
    })

    /**
     * @tc.name   testScrollSearchVertical_static
     * @tc.number SUB_testfwk_uitest_Api16_0017
     * @tc.desc   scroll vertically on this UiComponent to find matched UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollSearchVertical_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testScrollSearchVertical start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let button = await driver!.findComponent(ON.text('scroll'))
      if (button == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        button = await scorll!.scrollSearch(ON.text('scroll'))
      }
      await driver!.delayMs(waitUiReadyMs)
      await button!.click()
      await driver!.delayMs(waitUiReadyMs)
      let scrollBar = await driver!.findComponent(ON.id('verticalScroll'))
      await driver!.delayMs(waitUiReadyMs)
      let text1 = await scrollBar!.scrollSearch(ON.text('11'), true, 80);
      await driver!.delayMs(waitUiReadyMs)
      expect(text1 == null).assertTrue()
      await driver!.delayMs(waitUiReadyMs)
      let text2 = await scrollBar!.scrollSearch(ON.text('2'), true);
      let text2Msg = await text2!.getText();
      console.log(TestTag, `testScrollSearchVertical 2 is , ${text2Msg}`);
      await driver!.delayMs(waitUiReadyMs)
      expect(await text2!.getText()).assertEqual('2')
      await driver!.delayMs(waitUiReadyMs)
      let text3 = await scrollBar!.scrollSearch(ON.text('8'));
      await driver!.delayMs(waitUiReadyMs);
      let text3Msg = await text3!.getText();
      console.log(TestTag, `testScrollSearchVertical 2 is , ${text3Msg}`);
      expect(await text3!.getText()).assertEqual('8')
      await driver!.delayMs(waitUiReadyMs)
      await stopApplication('com.uitestScene.acts');
      console.log(TestTag, 'testScrollSearchVertical end');
    })

    /**
     * @tc.name   testMatchPatternIcase_static
     * @tc.number SUB_testfwk_uitest_Api16_0020
     * @tc.desc   find button component by Regular Expression ignore icase，and doubleClick button by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatchPatternIcase_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let Button = await driver!.findComponent(ON.text('click twice', MatchPattern.REG_EXP_ICASE));
      if (Button == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        Button = await scorll!.scrollSearch(ON.text('Click twice'))
      }
      await driver!.delayMs(waitUiReadyMs);
      let center = await Button!.getBoundsCenter();
      await driver!.delayMs(waitUiReadyMs);
      await driver!.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.text('doublec\\w{2,4}', MatchPattern.REG_EXP_ICASE));
      await driver!.delayMs(waitUiReadyMs);
      let text = await button!.getText();
      await driver!.delayMs(waitUiReadyMs);
      expect(text == 'doubleClick').assertTrue();
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testMatchPatternRegExp_static
     * @tc.number SUB_testfwk_uitest_Api16_0021
     * @tc.desc   find button component by Regular Expression, and longClick button by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatchPatternRegExp_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let btn = await driver!.findComponent(ON.text('next \\w{2,6}', MatchPattern.REG_EXP));
      if (btn == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        btn = await scorll!.scrollSearch(ON.text('next \\w{2,6}', MatchPattern.REG_EXP))
      }
      await driver!.delayMs(waitUiReadyMs);
      let center = await btn!.getBoundsCenter();
      await driver!.delayMs(waitUiReadyMs);
      await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
      await driver!.delayMs(waitUiReadyMs);
      let newButton = await driver!.findComponent(ON.text('longClick'));
      await driver!.delayMs(waitUiReadyMs);
      let text = await newButton!.getText();
      await driver!.delayMs(waitUiReadyMs);
      expect(text == 'longClick').assertTrue();
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testGetHint_static
     * @tc.number SUB_testfwk_uitest_Api16_0022
     * @tc.desc   find button component by Regular Expression, and get Hint of the component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetHint Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP));
        if (text == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          let hint = await text.getHint();
          hilog.info(domain, tag, `testGetHint_static hint is, ${ hint }`);
          expect(hint == 'welcome').assertTrue();
        }
        let text1 = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP_ICASE));
        if (text1 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text1 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP_ICASE))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let hint1 = await text1.getHint();
          hilog.info(domain, tag, `testGetHint_static hint1 is, ${ hint1 }`);
          expect(hint1 == 'welcome').assertTrue();
        }
        let text2 = await driver.findComponent(ON.hint('welcome', MatchPattern.ENDS_WITH));
        if (text2 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text2 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.ENDS_WITH))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text2, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue();
        if (text2 != null) {
          let hint2 = await text2.getHint();
          hilog.info(domain, tag, `testGetHint_static hint2 is, ${ hint2 }`);
          expect(hint2 == 'welcome').assertTrue();
        }

        let text3 = await driver.findComponent(ON.hint('welcome', MatchPattern.STARTS_WITH));
        if (text3 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text3 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.STARTS_WITH))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text3, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue();
        if (text3 != null) {
          let hint3 = await text3.getHint();
          hilog.info(domain, tag, `testGetHint_static hint3 is, ${ hint3 }`);
          expect(hint3 == 'welcome').assertTrue();
        }

        let text4 = await driver.findComponent(ON.hint('welcome', MatchPattern.CONTAINS));
        if (text4 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text4 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.CONTAINS))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text4, ${ JSON.stringify(text4) }`);
        expect(text4 != null).assertTrue();
        if (text4 != null) {
          let hint4 = await text4.getHint();
          hilog.info(domain, tag, `testGetHint_static hint4 is, ${ hint4 }`);
          expect(hint4 == 'welcome').assertTrue();
        }

        let text5 = await driver.findComponent(ON.hint('welcome', undefined));
        if (text5 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text5 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.EQUALS))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text5, ${ JSON.stringify(text5) }`);
        expect(text5 != null).assertTrue();
        if (text5 != null) {
          let hint5 = await text5.getHint();
          hilog.info(domain, tag, `testGetHint_static hint5 is, ${ hint5 }`);
          expect(hint5 == 'welcome').assertTrue();
        }

        let text6 = await driver.findComponent(ON.hint('welcome'));
        if (text6 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text6 = await scroll.scrollSearch(ON.hint('welcome'))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text6, ${ JSON.stringify(text6) }`);
        expect(text6 != null).assertTrue();
        if (text6 != null) {
          let hint6 = await text6.getHint();
          hilog.info(domain, tag, `testGetHint_static hint6 is, ${ hint6 }`);
          expect(hint6 == 'welcome').assertTrue();
        }
        let button7 = await driver.findComponent(ON.hint('', MatchPattern.EQUALS).text('next page'));
        if (button7 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button7 = await scroll.scrollSearch(ON.hint('', MatchPattern.EQUALS).text('next page'))
          }
        }
        await driver.delayMs(waitUiReadyMs);
        expect(button7 != null).assertTrue();
        if (button7 != null) {
          let hint7 = await button7.getHint();
          await driver.delayMs(waitUiReadyMs);
          console.log(`${tag}, testGetHint hint7, ${JSON.stringify(hint7)}`)
          expect(hint7).assertEqual('');
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetHint_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetHint_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testGetHint1_static
     * @tc.number SUB_testfwk_uitest_Api16_0023
     * @tc.desc   find button component by Hint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHint1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP));
      if (button == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        button = await scorll!.scrollSearch(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP))
      }
      await driver!.delayMs(waitUiReadyMs);
      let hint = await button!.getHint();
      await driver!.delayMs(waitUiReadyMs);
      expect(hint == 'welcome').assertTrue();
      await stopApplication('com.uitestScene.acts');
    })
  })
}