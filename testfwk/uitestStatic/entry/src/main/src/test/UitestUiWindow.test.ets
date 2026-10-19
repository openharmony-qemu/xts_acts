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
import { beforeAll, afterAll, beforeEach, describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation,
  ResizeDirection,
  UiWindow
} from '@kit.TestKit'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestUiWindowTest';
const waitUiReadyMs: int = 1000;
const DeviceErrorCode = 17000005;
const WindowsErrorCode = 17000005;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) {
  }
  return
}

async function initSpite(driver: Driver, window: UiWindow | null) {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode != WindowMode.FLOATING) {
        await window.resume();
        await driver.delayMs(8000);
      }
      await window.maximize();
    } catch (error) {
      console.log(`${tag}, initSpite error,${JSON.stringify(error)}`);
    }
  } else {
    console.log(`${tag}, initSpite null`);
  }
    let stepFirst = await driver.findComponent(ON.text('下一步'))
    if (stepFirst != null) {
        await stepFirst.click()
        await driver.delayMs(1000)
    }
    let stepSecond = await driver.findComponent(ON.text('下一步'))
    if (stepSecond != null) {
        await stepSecond.click()
        await driver.delayMs(1000)
    }
    let stepThird = await driver.findComponent(ON.text('完成'))
    if (stepThird != null) {
        await stepThird.click()
        await driver.delayMs(1000)
    }
  await driver.delayMs(3000);
}

async function maxUiWindow(driver: Driver, window: UiWindow | null): Promise<boolean> {
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode == WindowMode.FULLSCREEN) {
        console.log(`${tag}, maxUiWindow FULLSCREEN`);
        return true;
      }
      await window.maximize();
      await driver.delayMs(3000);
      return true;
    } catch (error) {
      console.log(`${tag}, maxUiWindow error,${JSON.stringify(error)}`);
      return false;
    }
  } else {
    console.log(`${tag}, maxUiWindow null`);
    return false;
  }
}

async function setFull(driver: Driver| undefined) {
  let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${TestTag}, setFull findWindow, ${JSON.stringify(window)}`);
  let windowMode = await window!.getWindowMode()
  console.log(`${TestTag}, setFull getWindowMode, ${JSON.stringify(windowMode)}`);
  if (windowMode != WindowMode.FULLSCREEN) {
    await window!.resume()
    console.log(`${TestTag}, setFloat resume success`);
  }
}

async function setFloat(driver: Driver| undefined) {
  let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${tag}, setFloat findWindow, ${JSON.stringify(window)}`);
  let windowMode = await window!.getWindowMode()
  console.log(`${tag}, setFloat getWindowMode, ${JSON.stringify(windowMode)}`);
  if (windowMode != WindowMode.FLOATING) {
    await window!.resume()
    console.log(`${tag}, setFloat resume success`);
  }
}

async function setSplit(driver: Driver| undefined) {
  let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
  console.log(`${TestTag}, setSplit window,${JSON.stringify(window)}`);
  await window!.split()
  await driver!.delayMs(waitUiReadyMs * 2)
  let scbCom = await driver!.findComponent(ON.id('scb_block_cover'))
  console.log(`${TestTag}, setSplit scbCom,${JSON.stringify(scbCom)}`);
  if (scbCom != null) {
    await startAbility('com.uitest.acts', 'EntryAbility')
    await driver!.delayMs(waitUiReadyMs * 2)
    let btn0 = await driver!.findComponent(ON.text('稍后提示'))
    console.log(`${TestTag}, setSplit scbCom,${JSON.stringify(btn0)}`);
    if (btn0 != null) {
      await btn0!.click()
      await driver!.delayMs(waitUiReadyMs * 7)
    }
    let btn = await driver!.findComponent(ON.text('下一步'))
    if (btn != null) {
      await btn!.click()
      await driver!.delayMs(waitUiReadyMs * 3)
      let btn1 = await driver!.findComponent(ON.text('完成'))
      if (btn1 != null) {
        await btn1!.click()
        await driver!.delayMs(waitUiReadyMs * 7)
      }
    }
    let btn3 = await driver!.findComponent(ON.text('下一步'))
    if (btn3 != null) {
      await btn3!.click()
      await driver!.delayMs(waitUiReadyMs * 3)
      let btn1 = await driver!.findComponent(ON.text('完成'))
      if (btn1 != null) {
        await btn1!.click()
        await driver!.delayMs(waitUiReadyMs * 7)
      }
    }
    let btn1 = await driver!.findComponent(ON.text('完成'))
    if (btn1 != null) {
      await btn1!.click()
      await driver!.delayMs(waitUiReadyMs * 7)
    }
    let btn2 = await driver!.findComponent(ON.text('点击显示操作按钮'))
    if (btn2 != null) {
      await driver!.delayMs(waitUiReadyMs * 7)
    }
  } else {
    let testLabel = await driver!.findComponent(ON.text('test label'));
    await driver!.delayMs(waitUiReadyMs * 2)
    await testLabel!.click()
  }
}

async function envRecovery(driver: Driver| undefined) {
  try {
    let scbCom = await driver!.findComponent(ON.id('scb_block_cover'))
    if (scbCom != null) {
      await driver!.pressBack()
      await driver!.delayMs(waitUiReadyMs * 3)
    }
    let resumeWindow = await driver!.findWindow({ bundleName: 'com.uitest.acts' })
    if (resumeWindow != null) {
      await resumeWindow!.resume()
    }
  } catch (error) {
    console.log('envRecovery error is ' + error)
    expect(error.code === WindowsErrorCode).assertTrue()
  }
}

export default function uitestUiWindowTest(): void {
  describe('uitestUiWindowTest', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, "uitestUiWindowTest loadup start!!!!!")
      driver = Driver.create();
      await Utils.msSleep(1000);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      await driver!.delayMs(waitUiReadyMs);
      await initSpite(driver!, window);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestUiWindowTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })
    afterAll(async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      const driver = Driver.create();
      await driver!.delayMs(waitUiReadyMs);
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      await driver!.delayMs(waitUiReadyMs);
      await maxUiWindow(driver!, window);
      await driver!.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testFindWindowWithId_static
     * @tc.number uitestUiWindowTest_0014
     * @tc.desc findWindow with id.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testFindWindowWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowWithId_static start !!!!");
      try {
        let disPlay = display.getDefaultDisplaySync();
        hilog.info(domain, tag, `testFindWindowWithId_static id, ${JSON.stringify(disPlay)}`);
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', displayId: disPlay.id.toInt() });
        hilog.info(domain, tag, `testFindWindowWithId_static window , ${JSON.stringify(window)}`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindowWithId_static name , ${JSON.stringify(name)}`);
          expect(name == 'com.uitestScene.acts').assertTrue();
          let uiId = await window.getDisplayId();
          hilog.info(domain, tag, `testFindWindowWithId_static uiId , ${JSON.stringify(uiId)}`);
          expect(uiId).assertEqual(disPlay.id);
        }
      } catch (error) {
        hilog.info(domain, tag, `testFindWindowWithId_static error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowWithId_static over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_UiWindow_getBundleName_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0001
     * @tc.desc   get the size of the device display.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getBundleName_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowBundleName start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testFindWindowBundleName window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindowBundleName name , ${ name }`);
          expect(name == 'com.uitestScene.acts').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowBundleName error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindow over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_UiWindow_getTitle_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0002
     * @tc.desc   get the title of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getTitle_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
      let title = await window!.getTitle()
      expect(title == '').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testFindWindowActive_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0003
     * @tc.desc   get the size of the device display.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFindWindowActive_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowActive start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let window = await driver!.findWindow({active: true});
        hilog.info(domain, tag, `testFindWindowActive window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testFindWindowActive isActive , ${ isActive }`);
          expect(isActive).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowActive error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowActive over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_UiWindow_Attr_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0004
     * @tc.desc   set the focused status of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_Attr_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({
        bundleName: 'com.uitestScene.acts',
        focused: true,
        active: true,
        title: ''
      })
      await window!.focus()
      await driver!.delayMs(waitUiReadyMs)
      let isFocused = await window!.isFocused()
      let isActive = await window!.isActive()
      expect(isFocused == true).assertTrue()
      expect(isActive == true).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResume_split_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0005
     * @tc.desc   Call the resume interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_split_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs);
      let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      expect(window1 != null).assertTrue();
      try {
        if (window1 != null) {
          await window1.split();
          await driver!.delayMs(waitUiReadyMs * 2)
        }
        let scbCom = await driver!.findComponent(ON.id('scb_block_cover'));
        hilog.info(domain, tag, `testSplit_static scbCom, ${JSON.stringify(scbCom)}`);
        if (scbCom != null) {
          expect(scbCom != null).assertTrue();
        } else {
          let testLabel = await driver!.findComponent(ON.text('test label'));
          hilog.info(domain, tag, `testSplit_static testLabel, ${JSON.stringify(testLabel)}`);
          if (testLabel != null) {
            await testLabel.click();
            await driver!.delayMs(waitUiReadyMs);
            let window2 = await driver!.findWindow({bundleName:'com.uitestScene.acts'});
            await driver!.delayMs(waitUiReadyMs);
            expect(window2 != null).assertTrue();
            if (window2 != null) {
              let window2Mode = await window2.getWindowMode();
              expect(window2Mode == WindowMode.PRIMARY).assertTrue();
            }
            let testWindow = await driver!.findWindow({bundleName:'com.uitest.acts.static'});
            expect(testWindow != null).assertTrue();
            if (testWindow != null) {
              let testWindowMode = await testWindow.getWindowMode();
              expect(testWindowMode == WindowMode.SECONDARY).assertTrue();
              expect(testWindowMode != WindowMode.FLOATING).assertTrue()
            }
          }
        }
      } catch (err) {
        err = err as BusinessError;
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue();
          expect((err as BusinessError).code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testWindowMoveTo_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0007
     * @tc.desc move this UiWindow to the specified points.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMoveTo_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMoveTo_float_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver!.delayMs(waitUiReadyMs)
        let windowFloat = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        let bounds1 = await windowFloat!.getBounds()
        await windowFloat!.moveTo(100, 100)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window2!.getBounds()
        expect(bounds1.left != bounds2.left).assertTrue()
        await window2!.moveTo(bounds1.left, bounds1.top)
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMoveTo_static error, ${JSON.stringify(err)} `);
        expect(err.code).assertEqual(17000005);
      }
      hilog.info(domain, tag, `testWindowMoveTo_float_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeA_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0008
     * @tc.desc   Call the resize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver!.delayMs(waitUiReadyMs)
        let windowFloat = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await windowFloat!.getBounds()
        let bounds1x = Math.floor(bounds1.right - bounds1.left).toInt()
        let bounds1y = Math.floor(bounds1.bottom - bounds1.top).toInt()
        let resizex = Math.floor(bounds1x / 2).toInt()
        let resizey = Math.floor(bounds1y / 2).toInt()
        await windowFloat!.resize(resizex, resizey, ResizeDirection.RIGHT_DOWN)
        console.log(`${TestTag}, testWindowResizeA_float_static windowFloat.resize success `);
        await driver!.delayMs(waitUiReadyMs)
        let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeA_float_static findWindow2 success, ${JSON.stringify(window2)}`);
        let bounds2 = await window2!.getBounds()
        console.log(`${TestTag}, testWindowResizeA_float_static getBounds2 success, ${JSON.stringify(bounds2)}`);
        expect(bounds2.right != bounds1.right).assertTrue()
        await window2!.resize(bounds1x, bounds1y, ResizeDirection.RIGHT_DOWN)

        let window3 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds3 = await window2!.getBounds()
        await window3!.resize(resizex, resizey, ResizeDirection.LEFT_DOWN)
        await driver!.delayMs(waitUiReadyMs)
        let window4 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeA_float_static findWindow4 success, ${JSON.stringify(window4)}`);
        let bounds4 = await window4!.getBounds()
        console.log(`${TestTag}, testWindowResizeA_float_static getBounds4 success, ${JSON.stringify(bounds4)}`);
        expect(bounds3.bottom != bounds4.bottom).assertTrue()
        await window4!.resize(bounds1x, bounds1y, ResizeDirection.LEFT_DOWN)
      } catch (error) {
        console.log('testWindowResizeA_float_static error is ' + error)
        expect(error.code === WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeA_UP_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0009
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the top of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_UP_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver!.delayMs(waitUiReadyMs)
        let floatbtn = await driver!.findComponent(ON.id('floatingButtonMaximize'))
        if (floatbtn == null) {
          let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds1 = await window1!.getBounds()
          let bounds1x = Math.floor(bounds1.right - bounds1.left).toInt()
          let bounds1y = Math.floor(bounds1.bottom - bounds1.top).toInt()
          let resizex = Math.floor(bounds1x / 2).toInt()
          let resizey = Math.floor(bounds1y / 2).toInt()
          await window1!.resize(resizex, resizey, ResizeDirection.RIGHT_UP)
          await driver!.delayMs(waitUiReadyMs)
          let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeA_UP_float_static findWindow2 success, ${JSON.stringify(window2)}`);
          let bounds2 = await window2!.getBounds()
          console.log(`${TestTag}, testWindowResizeA_UP_float_static getBounds2 success, ${JSON.stringify(bounds2)}`);
          expect(bounds2.top != bounds1.top).assertTrue()
          await window2!.resize(bounds1x, bounds1y, ResizeDirection.RIGHT_UP)

          let window3 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds3 = await window3!.getBounds()
          await window3!.resize(resizex, resizey, ResizeDirection.LEFT_UP)
          await driver!.delayMs(waitUiReadyMs)
          let window4 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeA_UP_float_static findWindow4 success, ${JSON.stringify(window4)}`);
          let bounds4 = await window4!.getBounds()
          console.log(`${TestTag}, testWindowResizeA_UP_float_static getBounds4 success, ${JSON.stringify(bounds4)}`);
          expect(bounds4.top != bounds3.top).assertTrue()
          await window4!.resize(bounds1x, bounds1y, ResizeDirection.LEFT_UP)
        }
      } catch (error) {
        console.log('testWindowResizeA_UP_float_static error is ' + error)
        expect(error.code === WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeB_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0010
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the down/right/left of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver!.delayMs(waitUiReadyMs)
        let windowFloat = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await windowFloat!.getBounds()
        let bounds1x = Math.floor(bounds1.right - bounds1.left).toInt()
        let bounds1y = Math.floor(bounds1.bottom - bounds1.top).toInt()
        let resizex = Math.floor(bounds1x / 2).toInt()
        let resizey = Math.floor(bounds1y / 2).toInt()
        await windowFloat!.resize(bounds1x, resizey, ResizeDirection.DOWN)
        await driver!.delayMs(waitUiReadyMs)
        let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float_static findWindow2 success, ${JSON.stringify(window2)}`);
        let bounds2 = await window2!.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float_static getBounds2 success, ${JSON.stringify(bounds2)}`);
        expect(bounds2.bottom != bounds1.bottom).assertTrue()
        await window2!.resize(bounds1x, bounds1y, ResizeDirection.DOWN)

        let window6 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds6 = await window6!.getBounds()
        await window6!.resize(resizex, bounds1y, ResizeDirection.RIGHT)
        await driver!.delayMs(waitUiReadyMs)
        let window7 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float_static findWindow7 success, ${JSON.stringify(window7)}`);
        let bounds7 = await window7!.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float_static getBounds7 success, ${JSON.stringify(bounds7)}`);
        expect(bounds7.right != bounds6.right).assertTrue()
        await window7!.resize(bounds1x, bounds1y, ResizeDirection.RIGHT)

        let window8 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds8 = await window8!.getBounds()
        await window8!.resize(resizex, bounds1y, ResizeDirection.LEFT)
        await driver!.delayMs(waitUiReadyMs)
        let window9 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
        console.log(`${TestTag}, testWindowResizeB_float_static findWindow9 success, ${JSON.stringify(window9)}`);
        let bounds9 = await window9!.getBounds()
        console.log(`${TestTag}, testWindowResizeB_float_static getBounds9 success, ${JSON.stringify(bounds9)}`);
        expect(bounds8.left != bounds9.left).assertTrue()
        await window9!.resize(bounds1x, bounds1y, ResizeDirection.LEFT)
      } catch (error) {
        error = error as BusinessError;
        console.log('testWindowResizeB_float_static error is ' + JSON.stringify(error))
        expect((error as BusinessError).code === WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowResizeB_UP_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0011
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the UP of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_UP_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      try {
        await setFloat(driver)
        await driver!.delayMs(waitUiReadyMs)
        let floatbtn = await driver!.findComponent(ON.id('floatingButtonMaximize'))
        if (floatbtn == null) {
          let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          let bounds1 = await window1!.getBounds()
          let bounds1x = Math.floor(bounds1.right - bounds1.left).toInt()
          let bounds1y = Math.floor(bounds1.bottom - bounds1.top).toInt()
          let resizey = Math.floor(bounds1y / 2).toInt()
          await window1!.resize(bounds1x, resizey, ResizeDirection.UP)
          await driver!.delayMs(waitUiReadyMs)
          let window6 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
          console.log(`${TestTag}, testWindowResizeB_UP_float_static findWindow6 success, ${JSON.stringify(window6)}`);
          let bounds6 = await window6!.getBounds()
          console.log(`${TestTag}, testWindowResizeB_UP_float_static getBounds6 success, ${JSON.stringify(bounds6)}`);
          expect(bounds6.top != bounds1.top).assertTrue()
          await window6!.resize(bounds1x, bounds1y, ResizeDirection.UP)
        }
      } catch (error) {
        error = error as BusinessError;
        console.log('testWindowResizeB_UP_float_static error is ' + JSON.stringify(error))
        expect((error as BusinessError).code === WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name testWindowMinimize_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0012
     * @tc.desc minimize this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMinimize_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMinimize_float_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' })
      hilog.info(domain, tag, `testWindowMinimize_float_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          await window.minimize();
          await driver!.delayMs(waitUiReadyMs)
          let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
          hilog.info(domain, tag, `testWindowMinimize_float_static window1, ${JSON.stringify(window1)} `);
          expect(window1 == null).assertTrue();
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMinimize_float_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
      hilog.info(domain, tag, `testWindowMinimize_static end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowClose_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0013
     * @tc.desc close this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowClose_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowClose_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      hilog.info(domain, tag, `testWindowClose_static window, ${JSON.stringify(window)} `);
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          await window.close();
          hilog.info(domain, tag, `testWindowClose_static close sccessful`);
        }
        let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        hilog.info(domain, tag, `testWindowClose_static window1, ${JSON.stringify(window1)} `);
        expect(window1 == null).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowClose_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue();
        }
      }
      hilog.info(domain, tag, `testWindowClose_static end `);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testWindowMaximize_float_static
     * @tc.number SUB_testfwk_uitest_UiWindow_0014
     * @tc.desc maximize this UiWindow.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowMaximize_float_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowMaximize_static start `);
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      expect(window != null).assertTrue();
      try {
        if (window != null) {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
        }
        let window2 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        expect(window2 != null).assertTrue();
        if (window2 != null) {
          await window2.maximize();
          hilog.info(domain, tag, `testWindowMaximize_static maximize sccessful`);
        }
        //  await driver!.delayMs(1000);
        let window3 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
        hilog.info(domain, tag, `testWindowMaximize_static window3, ${JSON.stringify(window3)} `);
        expect(window3 != null).assertTrue();
        if (window3 != null) {
          let mode = await window3.getWindowMode();
          hilog.info(domain, tag, `testWindowMaximize_static mode, ${JSON.stringify(mode)} `);
          expect(mode == WindowMode.FULLSCREEN).assertTrue();
        }
        await stopApplication('com.uitestScene.acts')
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `testWindowMaximize_static error, ${JSON.stringify(err)} `);
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue();
          expect(err.code).assertEqual(DeviceErrorCode);
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name testWindowIsFocused_static
     * @tc.number uitestUiWindowTest_0007
     * @tc.desc testWindowIsFocused.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowIsFocused_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsFocused start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', focused: true });
        hilog.info(domain, tag, `testWindowIsFocused window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsFocused focus sccessful`);
          let isFocused = await window.isFocused();
          hilog.info(domain, tag, `testWindowIsFocused isFocused, ${JSON.stringify(isFocused)} `);
          expect(isFocused).assertTrue()
        }
        let focusedWindow1 = await driver.findWindow({focused: false});
        if (focusedWindow1 != null) {
          let falseFocused1 = await focusedWindow1.isFocused();
          expect(falseFocused1).assertFalse()
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowIsFocused error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsFocused end `);
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name testWindowIsActive_static
     * @tc.number uitestUiWindowTest_0008
     * @tc.desc testWindowIsFocused.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testWindowIsActive_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWindowIsActive start `);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver!.delayMs(waitUiReadyMs)
        let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', focused: true, active: true });
        hilog.info(domain, tag, `testWindowIsActive window, ${JSON.stringify(window)} `);
        expect(window != null).assertTrue();
        if (window != null) {
          await window.focus();
          hilog.info(domain, tag, `testWindowIsActive focus sccessful`);
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testWindowIsActive isActive, ${JSON.stringify(isActive)} `);
          expect(isActive).assertTrue()
        }
        let window1 = await driver!.findWindow({ bundleName: 'com.uitestScene.acts', focused: false, active: false });
        hilog.info(domain, tag, `testWindowIsActive window1, ${JSON.stringify(window1)} `);
        expect(window1 == null).assertTrue();
        let uitestWindow = await driver.findWindow({active: false})
        if (uitestWindow != null) {
          let isActive1 = await uitestWindow.isActive()
          expect(isActive1).assertFalse();
        }
      } catch (error) {
        hilog.info(domain, tag, `testWindowIsActive error, ${JSON.stringify(error)} `);
        expect().assertFail()
      }
      hilog.info(domain, tag, `testWindowIsActive end `);
      await stopApplication('com.uitestScene.acts')
    })
  })
}
