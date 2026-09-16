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
import { Component, Driver, ON, On, MatchPattern, MouseButton,ResizeDirection, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, Rect,ComponentEventType,WindowChangeType } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';

import { Utils, startAbility, stopApplication, getInputMethodPermission } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestTag';
const waitUiReadyMs : int = 1000;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

export default function uitestEnumTest(): void {
  describe('UiTest_API10', (): void => {
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
     * @tc.name   testWithIn_static
     * @tc.number SUB_testfwk_uitest_Api10_0001
     * @tc.desc   find UiComponent inside of the given UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWithIn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWithIn_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('next page'))
        let text = await btn!.getText();
        expect(text).assertEqual('next page');
      } catch(error) {
        hilog.info(domain, tag, `testWithIn_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testWithIn_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScreenCapture_static
     * @tc.number SUB_testfwk_uitest_Api10_0063
     * @tc.desc   capture the specified area of current screen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCapture_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScreenCapture_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(1000);
        let savePath = '/data/storage/el2/base/cache/testScreenCapture_1.png'
        let success = await driver!.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100});
        expect(success == true).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testScreenCapture_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScreenCapture_static end`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScreenCaptureRectUndefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0023
     * @tc.desc   capture the specified area of current screen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCaptureRectUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let savePath = '/data/storage/el2/base/cache/1.png'
        let success = await driver!.screenCapture(savePath, undefined)
        expect(success == true).assertTrue()
        await stopApplication('com.uitestScene.acts')
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testScreenCapture_default_static
     * @tc.number SUB_testfwk_uitest_Api10_0003
     * @tc.desc   capture the specified area of current screen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScreenCapture_default_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let savePath = '/data/storage/el2/base/cache/1.png'
      let success = await driver!.screenCapture(savePath)
      expect(success == true).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testMouseClick_static
     * @tc.number SUB_testfwk_uitest_Api10_0004
     * @tc.desc   mouseClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseClick_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let Button = await driver!.findComponent(ON.id('jump'))
        if (Button == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          Button = await scorll!.scrollSearch(ON.id('jump'))
        }
        let center = await Button!.getBoundsCenter()
        await driver!.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_RIGHT)
        await driver!.delayMs(waitUiReadyMs)
        let Button1 = await driver!.findComponent(ON.text('right'))
        expect(Button1 != null).assertTrue()
        await driver!.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_MIDDLE, 2072, 2045)
        await driver!.delayMs(waitUiReadyMs)
        let Button2 = await driver!.findComponent(ON.text('middle'))
        expect(Button2 != null).assertTrue()
        await driver!.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_LEFT, 0)
        await driver!.delayMs(waitUiReadyMs)
        let Button3 = await driver!.findComponent(ON.id('jump'))
        expect(Button3 == null).assertTrue()
        await driver!.click(center.x, center.y)
        await stopApplication('com.uitestScene.acts')
      } catch (error) {
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_MIDDLE over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testMouseClickKey1Undefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0024
     * @tc.desc   click in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseClickKey1Undefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let Button = await driver!.findComponent(ON.id('jump'))
        if (Button == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          Button = await scorll!.scrollSearch(ON.id('jump'))
        }
        let center = await Button!.getBoundsCenter()
        await driver!.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_RIGHT, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let Button1 = await driver!.findComponent(ON.text('right'))
        expect(Button1 != null).assertTrue()
        await stopApplication('com.uitestScene.acts')
      } catch (error) {
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMouseClickKey2Undefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0044
     * @tc.desc   click in the specified location on the screen by mouse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseClickKey2Undefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let Button = await driver!.findComponent(ON.id('jump'))
        if (Button == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          Button = await scorll!.scrollSearch(ON.id('jump'))
        }
        let center = await Button!.getBoundsCenter()
        await driver!.mouseClick({ x: center.x, y: center.y }, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let Button1 = await driver!.findComponent(ON.text('right'))
        expect(Button1 != null).assertTrue()
        await stopApplication('com.uitestScene.acts')
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMouseMoveTo_static
     * @tc.number SUB_testfwk_uitest_Api10_0005
     * @tc.desc   move the mouse cursor to the specified location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseMoveTo_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseMoveTo_static start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(1000);
      try {
        let button = await driver!.findComponent(ON.id('jump'));
        if (button == null) {
          let scroll = await driver!.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button = await scroll.scrollSearch(ON.id('jump'))
          }
        }
        let center = await button!.getBoundsCenter();
        // jump 按钮 349, 472
        await driver!.mouseMoveTo(center);
        await driver!.delayMs(1000);
        let newButton = await driver!.findComponent(ON.text('hover'));
        expect(newButton != null).assertTrue();
      } catch(error) {
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testMouseScrollAdapt001_static
     * @tc.number SUB_testfwk_uitest_Api10_0006
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseScrollAdapt001_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.id('jump'))
      if (btn == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        btn = await scorll!.scrollSearch(ON.id('jump'))
      }
      await btn!.click()
      await driver!.delayMs(waitUiReadyMs)
      let img1 = await driver!.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
      let bounds1 = await img1!.getBounds()
      let center1 = await img1!.getBoundsCenter()
      await driver!.click(center1.x, center1.y)
      await driver!.delayMs(waitUiReadyMs)
      await driver!.mouseScroll(center1, false, 5, 2072, 0)
      await driver!.delayMs(waitUiReadyMs)
      let img2 = await driver!.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
      let bounds2 = await img2!.getBounds()
      expect(bounds1 != bounds2).assertTrue()

      await driver!.pressBack()
      await driver!.delayMs(waitUiReadyMs)
      let btn2 = await driver!.findComponent(ON.text('1'))
      if (btn2 == null) {
        let scorll = await driver!.findComponent(ON.type('Scroll'))
        btn2 = await scorll!.scrollSearch(ON.text('1'))
      }
      let center = await btn2!.getBoundsCenter()
      await driver!.mouseScroll(center, true, 30)
      await driver!.delayMs(waitUiReadyMs)
      let button1 = await driver!.findComponent(ON.text('next page'))
      expect(button1 == null).assertTrue()
    })

    /**
     * @tc.name   testMouseScrollAdapt001Key1Undefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0026
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseScrollAdapt001Key1Undefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let btn2 = await driver!.findComponent(ON.text('1'))
        if (btn2 == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          btn2 = await scorll!.scrollSearch(ON.text('1'))
        }
        let center = await btn2!.getBoundsCenter()
        await driver!.mouseScroll(center, true, 30, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let button1 = await driver!.findComponent(ON.text('next page'))
        expect(button1 == null).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMouseScrollAdapt001Key2Undefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0046
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseScrollAdapt001Key2Undefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let btn2 = await driver!.findComponent(ON.text('1'))
        if (btn2 == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          btn2 = await scorll!.scrollSearch(ON.text('1'))
        }
        let center = await btn2!.getBoundsCenter()
        await driver!.mouseScroll(center, true, 30, 0, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let button1 = await driver!.findComponent(ON.text('next page'))
        expect(button1 == null).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testMouseScrollAdapt001SpeedUndefined_static
     * @tc.number SUB_testfwk_uitest_Api10_0066
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMouseScrollAdapt001SpeedUndefined_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let btn2 = await driver!.findComponent(ON.text('1'))
        if (btn2 == null) {
          let scorll = await driver!.findComponent(ON.type('Scroll'))
          btn2 = await scorll!.scrollSearch(ON.text('1'))
        }
        let center = await btn2!.getBoundsCenter()
        await driver!.mouseScroll(center, true, 30, 0, 0, undefined)
        await driver!.delayMs(waitUiReadyMs)
        let button1 = await driver!.findComponent(ON.text('next page'))
        expect(button1 == null).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testInWindow_static
     * @tc.number SUB_testfwk_uitest_Api10_0007
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.inWindow('com.uitestScene.acts').text('next page'))
      expect(btn != null).assertTrue()
      let btn1 = await driver!.findComponent(ON.inWindow('').text('next page'))
      expect(btn1 != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testMonitor1_static
     * @tc.number SUB_testfwk_uitest_Api10_0008
     * @tc.desc   monitor toast appearance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMonitor1_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let observer = driver!.createUIEventObserver();
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testMonitor1_static UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testMonitor1_static UIElementInfo bundleName , ${ uiElementInfo.bundleName }`);
            expect(uiElementInfo.bundleName == "com.uitestScene.acts").assertTrue();
            hilog.info(domain, tag, `testMonitor1_static  text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.text == 'toastShow').assertTrue();
            hilog.info(domain, tag, `testMonitor1_static  type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.type == 'Toast').assertTrue();
            expect(uiElementInfo.windowChangeType == WindowChangeType.WINDOW_UNDEFINED).assertTrue();
            expect(uiElementInfo.componentEventType == ComponentEventType.COMPONENT_UNDEFINED).assertTrue();
            expect(uiElementInfo.windowId != null).assertTrue();
            expect(uiElementInfo.componentId == '').assertTrue();
            expect(uiElementInfo.componentRect != null).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, `testMonitor1_static  error, ${ JSON.stringify(err) }`);
          }
        }
        observer.onceToastShow(callback);
        // 点击toast按钮
        let btn = await driver!.findComponent(ON.text('toast'));
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click()
        }
        await driver!.delayMs(1000);
      } catch(error) {
        hilog.info(domain, tag, `testMonitor1_static error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testMonitor1_static over!!!!")
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testMonitor2_static
     * @tc.number SUB_testfwk_uitest_Api10_0009
     * @tc.desc   monitor toast appearance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMonitor2_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testMonitor2_static UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testMonitor2_static bundleName , ${ uiElementInfo.bundleName }`);
            expect(uiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
            hilog.info(domain, tag, `testMonitor2_static text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.type == 'AlertDialog').assertTrue()
            hilog.info(domain, tag, `testMonitor2_static UIElementInfo type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.text == 'dialogShow').assertTrue()
            expect(uiElementInfo.windowChangeType == WindowChangeType.WINDOW_UNDEFINED).assertTrue();
            expect(uiElementInfo.componentEventType == ComponentEventType.COMPONENT_UNDEFINED).assertTrue();
            expect(uiElementInfo.windowId != null).assertTrue();
            expect(uiElementInfo.componentId == '').assertTrue();
            expect(uiElementInfo.componentRect != null).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, `testMonitor2_static callback error, ${ JSON.stringify(err) }`);
          }
        }
        let observer = driver!.createUIEventObserver();
        observer.onceDialogShow(callback);
        hilog.info(domain, tag, `testMonitor2_static dialogShow success`);
        // 点击toast按钮
        let btn = await driver!.findComponent(ON.text('dialog'));
        await btn!.click()
        await driver!.delayMs(1000);
        hilog.info(domain, tag, `testMonitor2_static click success`);
      } catch(error) {
      }
      await stopApplication('com.uitestScene.acts');
    })
  })
}