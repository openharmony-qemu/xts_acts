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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const waitUiReadyMs : number = 1000;
const TestTag = 'uitestUiWindowTest';
const WindowsErrorCode = 17000005;

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`${TestTag}, start abilityFinished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`${TestTag}, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`${TestTag}, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`${TestTag},stop application failed: ${err}`)
  })
}

async function firstSplit(driver: Driver) {
  await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
  await driver.delayMs(waitUiReadyMs);
  let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
  console.log(`${TestTag}, firstSplit window,${JSON.stringify(window)}`);
  if (window != null) {
    try {
      let windowMode = await window.getWindowMode();
      if (windowMode != WindowMode.FLOATING) {
        await window.resume();
        await driver.delayMs(8000);
      }
    } catch (error) {
      console.log(`${TestTag}, firstSplit resume error,${JSON.stringify(error)}`);
    }
  }
  await stopApplication('com.uitestScene.acts');
}


export default function uiUiWindowTest() {
  describe('uitestUiWindowTest', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000);
      await firstSplit(driver);
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      const driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
      console.log(`${TestTag}, afterAll window,${JSON.stringify(window)}`);
      if (window != null) {
        try {
          let windowMode = await window.getWindowMode();
          if (windowMode != WindowMode.FLOATING) {
            await window.resume();
          }
          await window.maximize();
        } catch (error) {
          console.log(`${TestTag}, afterAll maximize error,${JSON.stringify(error)}`);
        }
      }
      await driver.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_UiWindow_getWindowMode
     * @tc.number uitestUiWindowTest_001
     * @tc.desc   get the window mode of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getWindowMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      let mode1 = await window1.getWindowMode()
      try {
        await window1.resume()
        let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let mode2 = await window2.getWindowMode()
        if (mode1 == WindowMode.FULLSCREEN) {
          expect(mode2 == WindowMode.FLOATING).assertTrue()
          expect(mode2 != WindowMode.SECONDARY).assertTrue()
          expect(mode2 != WindowMode.PRIMARY).assertTrue()
        } else {
          expect(mode2 == WindowMode.FULLSCREEN).assertTrue()
        }
        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_getBundleName
     * @tc.number uitestUiWindowTest_002
     * @tc.desc   get the bundleName of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      let name = await window.getBundleName()
      expect(name == 'com.uitestScene.acts').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_UiWindow_getTitle
     * @tc.number uitestUiWindowTest_003
     * @tc.desc   get the title of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_getTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      let title = await window.getTitle()
      expect(title == '').assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_UiWindow_moveTo
     * @tc.number uitestUiWindowTest_004
     * @tc.desc   move this UiWindow to the specified points.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_moveTo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds1 = await window1.getBounds()
        await window1.moveTo(100,100)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds2 = await window2.getBounds()
        expect(bounds1 != bounds2).assertTrue()
        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_resizeA
     * @tc.number uitestUiWindowTest_005
     * @tc.desc   resize this UiWindow to the specified size for the specified direction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_resizeA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)

        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds1 = await window1.getBounds()
        await window1.resize(600,600,ResizeDirection.RIGHT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds2 = await window2.getBounds()
        expect(bounds2 != bounds1).assertTrue()

        await window2.resize(400,400,ResizeDirection.RIGHT_UP)
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds3= await window3.getBounds()
        expect(bounds3 != bounds2).assertTrue()
        await window3.resize(300,300,ResizeDirection.LEFT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window4 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds4= await window4.getBounds()
        expect(bounds4 != bounds3).assertTrue()

        await window4.resize(500,500,ResizeDirection.LEFT_UP)
        await driver.delayMs(waitUiReadyMs)
        let window5 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds5= await window5.getBounds()
        expect(bounds5 != bounds4).assertTrue()
        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_resizeB
     * @tc.number uitestUiWindowTest_006
     * @tc.desc   testWindowResizeB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_resizeB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)

        let window5 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds5= await window5.getBounds()
        await window5.resize(bounds5.right - bounds5.left,300,ResizeDirection.DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window6 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds6= await window6.getBounds()
        expect(bounds6 != bounds5).assertTrue()

        await window6.resize(bounds6.right - bounds6.left,500,ResizeDirection.UP)
        await driver.delayMs(waitUiReadyMs)
        let window7 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds7 = await window7.getBounds()
        expect(bounds7 != bounds6).assertTrue()

        await window7.resize(300,bounds7.bottom - bounds7.top,ResizeDirection.LEFT)
        await driver.delayMs(waitUiReadyMs)
        let window8 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds8 = await window8.getBounds()
        expect(bounds8 != bounds7).assertTrue()

        await window8.resize(500,bounds8.bottom - bounds8.top,ResizeDirection.RIGHT)
        await driver.delayMs(waitUiReadyMs)
        let window9 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let bounds9 = await window9.getBounds()
        expect(bounds9 != bounds8).assertTrue()

        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_Attr
     * @tc.number uitestUiWindowTest_007
     * @tc.desc   set the focused status of this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_Attr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,actived:true,title:''})
      await window.focus()
      await driver.delayMs(waitUiReadyMs)
      let isFocused = await window.isFocused()
      let isActived = await window.isActived()
      expect(isFocused == true).assertTrue()
      expect(isActived == true).assertTrue()
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_UiWindow_minimize
     * @tc.number uitestUiWindowTest_008
     * @tc.desc   minimize this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_minimize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        await window.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        expect(window1 == null).assertTrue()
        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_close
     * @tc.number uitestUiWindowTest_009
     * @tc.desc   close this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_close', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        await window.close()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        expect(window1 == null).assertTrue()
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_maximize
     * @tc.number uitestUiWindowTest_010
     * @tc.desc   maximize this UiWindow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_maximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try{
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        let mode = await window3.getWindowMode()
        expect(mode == WindowMode.FULLSCREEN).assertTrue()
        await stopApplication('com.uitestScene.acts')
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
    })

    /**
     * @tc.name   testApi9_UiWindow_split
     * @tc.number uitestUiWindowTest_011
     * @tc.desc   change this UiWindow into split screen mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_split', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
      try {
        await window1.split()
        await driver.delayMs(waitUiReadyMs * 2)
        let scbCom = await driver.findComponent(ON.id('scb_block_cover'));
        if (scbCom != null) {
          expect(scbCom != null).assertTrue();
        } else {
          let testLabel = await driver.findComponent(ON.text('test label'));
          if (testLabel != null) {
            await driver.delayMs(waitUiReadyMs);
            await testLabel.click();
            await driver.delayMs(waitUiReadyMs);
            let window2 = await driver.findWindow({bundleName:'com.uitestScene.acts'})
            let window2Mode = await window2.getWindowMode();
            expect(window2Mode == WindowMode.PRIMARY).assertTrue();
            let testWindow = await driver.findWindow({bundleName:'com.uitest.acts'})
            let testWindowMode = await testWindow.getWindowMode();
            expect(testWindowMode == WindowMode.SECONDARY).assertTrue();
          }
        }
      }
      catch (err) {
        if (err.message == 'this device can not support this action') {
          expect(window1 != null).assertTrue()
        } else {
          expect(false).assertTrue()
        }
      }
      await stopApplication('com.uitestScene.acts')
    })

  })
  describe('uitestUiWindowTest_new', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
    })

    afterEach(async () => {
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResume_full
     * @tc.number uitestUiWindowTest_new0010
     * @tc.desc   Call the resume interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowmode = await window.getWindowMode()
      if (windowmode != WindowMode.FULLSCREEN) {
        await window.resume()
      }
      try {
        await window.resume()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let windowmode1 = await window1.getWindowMode()
        expect(windowmode1 == WindowMode.FLOATING).assertTrue()
      } catch (error) {
        console.log('testWindowResume_full error is' + error)
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResume_float
     * @tc.number uitestUiWindowTest_new0020
     * @tc.desc   Call the resume interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowmode = await window.getWindowMode()
      if (windowmode != WindowMode.FLOATING) {
        await window.resume()
      }
      try {
        await window.resume()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let windowmode1 = await window1.getWindowMode()
        expect(windowmode1 == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowResume_float error is' + error)
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResume_split1
     * @tc.number uitestUiWindowTest_new0030
     * @tc.desc   Call the resume interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        await window.split()
        await driver.delayMs(waitUiReadyMs * 2)
        let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
        if (scbCom != null) {
          await startAbility('com.uitest.acts', 'EntryAbility')
          await driver.delayMs(waitUiReadyMs * 2)
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          await window1.resume()
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowmode2 = await window2.getWindowMode()
          expect(windowmode2 == WindowMode.FLOATING).assertTrue()
        }else {
          let testLabel = await driver.findComponent(ON.text('test label'));
          await testLabel.click()
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          await window1.resume()
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowmode2 = await window2.getWindowMode()
          expect(windowmode2 == WindowMode.FLOATING).assertTrue()
        }
      }catch (error) {
        console.log('testWindowResume_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowResume_split2
     * @tc.number uitestUiWindowTest_new0040
     * @tc.desc   Call the resume interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResume_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window.split()
      await driver.delayMs(waitUiReadyMs * 2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      try {
        if (scbCom != null) {
          await startAbility('com.uitest.acts', 'EntryAbility')
          await driver.delayMs(waitUiReadyMs * 2)
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          await window1.resume()
          let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowmode2 = await window3.getWindowMode()
          expect(windowmode2 == WindowMode.FLOATING).assertTrue()
        }else {
          let testLabel = await driver.findComponent(ON.text('test label'));
          await testLabel.click()
          let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          await window1.resume()
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowmode2 = await window2.getWindowMode()
          expect(windowmode2 == WindowMode.FLOATING).assertTrue()
        }
      }catch (error) {
        console.log('testWindowResume_split2 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testSplit_full
     * @tc.number uitestUiWindowTest_new0050
     * @tc.desc   Call the split interface in fullscreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowmode = await window1.getWindowMode()
      if (windowmode != WindowMode.FULLSCREEN) {
        await window1.resume()
      }
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      try {
        if (scbCom != null) {
          expect(scbCom != null).assertTrue();
          await driver.pressBack()
          await driver.delayMs(waitUiReadyMs*2)
        }
        else {
          let testLabel = await driver.findComponent(ON.text('test label'))
          await driver.delayMs(waitUiReadyMs)
          await testLabel.click()
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowMode = await window2.getWindowMode()
          expect(windowMode == WindowMode.PRIMARY)
        }
      } catch (error) {
        console.log('testSplit error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testSplit_float
     * @tc.number uitestUiWindowTest_new0060
     * @tc.desc   Call the split interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowmode = await window1.getWindowMode()
      if (windowmode != WindowMode.FLOATING) {
        await window1.resume()
      }
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      try {
        if (scbCom != null) {
          expect(scbCom != null).assertTrue()
          await driver.pressBack()
          await driver.delayMs(waitUiReadyMs*2)
        }else {
          let testLabel = await driver.findComponent(ON.text('test label'))
          await driver.delayMs(waitUiReadyMs)
          await testLabel.click()
          await driver.delayMs(waitUiReadyMs)
          let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
          let windowMode = await window2.getWindowMode()
          expect(windowMode == WindowMode.PRIMARY).assertTrue()
        }
      } catch (error) {
        console.log('testSplit error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testSplit_split1
     * @tc.number uitestUiWindowTest_new0070
     * @tc.desc   Call the split interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs*2)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window2.split()
        await driver.delayMs(waitUiReadyMs)
      } catch (error) {
        console.log('testSplit error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      await driver.delayMs(waitUiReadyMs*3)
      if (scbCom != null) {
        await driver.pressBack()
        await driver.delayMs(waitUiReadyMs*3)
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testSplit_split2
     * @tc.number uitestUiWindowTest_new0080
     * @tc.desc   Call the split interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSplit_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
      await window1.split()
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs)
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window2 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        await window2.split();
        await driver.delayMs(waitUiReadyMs*2);
        let window3 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        let windowMode = await window3.getWindowMode();
        expect(windowMode == WindowMode.PRIMARY).assertTrue();
      } catch (error) {
        console.log('testSplit error is ' + error);
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(waitUiReadyMs*3)
      if (scbCom != null) {
        await driver.pressBack()
        await driver.delayMs(waitUiReadyMs*3)
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_full
     * @tc.number uitestUiWindowTest_new0090
     * @tc.desc   Call the moveTo interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FULLSCREEN) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await window1.getBounds()
        await window1.moveTo(100, 100)
      } catch (error) {
        console.log('testWindowMoveTo_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_float
     * @tc.number uitestUiWindowTest_new0100
     * @tc.desc   Call the moveTo interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await window1.getBounds()
        await window1.moveTo(100, 100)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window2.getBounds()
        expect(bounds1.left != bounds2.left).assertTrue()
      } catch (error) {
        console.log('testWindowMoveTo_float error is' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_split1
     * @tc.number uitestUiWindowTest_new0110
     * @tc.desc   Call the moveTo interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs*2);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window1.moveTo(100, 100)
      } catch (error) {
        console.log('testWindowMoveTo_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      await driver.delayMs(waitUiReadyMs*2)
      if (scbCom != null) {
        await driver.pressBack()
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMoveTo_split2
     * @tc.number uitestUiWindowTest_new0120
     * @tc.desc   Call the moveTo interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMoveTo_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window.split()
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs*2);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitest.acts' })
        await window1.moveTo(100, 100)
      } catch (error) {
        console.log('testWindowMoveTo_split2 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      await driver.delayMs(waitUiReadyMs*2)
      if (scbCom != null) {
        await driver.pressBack()
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowResize_full
     * @tc.number uitestUiWindowTest_new0130
     * @tc.desc   Call the resize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FULLSCREEN) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await window1.getBounds()
        await window1.resize(600, 600, ResizeDirection.RIGHT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window2.getBounds()
        expect(bounds2 != bounds1).assertTrue()
      } catch (error) {
        console.log('testWindowResize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeA_float
     * @tc.number uitestUiWindowTest_new0140
     * @tc.desc   Call the resize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)

        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await window1.getBounds()
        await window1.resize(800, 800, ResizeDirection.RIGHT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window2.getBounds()
        expect(bounds2.right != bounds1.right).assertTrue()

        await window2.resize(700, 700, ResizeDirection.LEFT_DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds3 = await window3.getBounds()
        expect(bounds3.bottom != bounds2.bottom).assertTrue()
      } catch (error) {
        console.log('testWindowResizeA_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeA_UP_float
     * @tc.number uitestUiWindowTest_new0150
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the top of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeA_UP_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)

        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds1 = await window1.getBounds()
        await window1.resize(800, 800, ResizeDirection.RIGHT_UP)
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window2.getBounds()
        expect(bounds2.top != bounds1.top).assertTrue()

        await window2.resize(700, 700, ResizeDirection.LEFT_UP)
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds3 = await window3.getBounds()
        expect(bounds3.top != bounds2.top).assertTrue()
      } catch (error) {
        console.log('testWindowResizeA_UP_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeB_float
     * @tc.number uitestUiWindowTest_new0160
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the down/right/left of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)

        let window5 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds5 = await window5.getBounds()
        await window5.resize(bounds5.right - bounds5.left, 800, ResizeDirection.DOWN)
        await driver.delayMs(waitUiReadyMs)
        let window6 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds6 = await window6.getBounds()
        expect(bounds6.bottom != bounds5.bottom).assertTrue()

        await window6.resize(800, bounds6.bottom - bounds6.top, ResizeDirection.RIGHT)
        await driver.delayMs(waitUiReadyMs)
        let window7 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds7 = await window7.getBounds()
        expect(bounds7.right != bounds6.right).assertTrue()

        await window7.resize(700, bounds7.bottom - bounds7.top, ResizeDirection.LEFT)
        await driver.delayMs(waitUiReadyMs)
        let window8 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds8 = await window8.getBounds()
        expect(bounds8.left != bounds7.left).assertTrue()
      } catch (error) {
        console.log('testWindowResizeB_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeB_UP_float
     * @tc.number uitestUiWindowTest_new0170
     * @tc.desc   in a float state, Call the resize interface to adjust the window size from the UP of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_UP_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        await driver.delayMs(waitUiReadyMs)
        let window5 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds5 = await window5.getBounds()
        await window5.resize(bounds5.right - bounds5.left, 800, ResizeDirection.UP)
        await driver.delayMs(waitUiReadyMs)
        let window6 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds6 = await window6.getBounds()
        expect(bounds6.top != bounds5.top).assertTrue()
      } catch (error) {
        console.log('testWindowResizeB_UP_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowResizeB_split1
     * @tc.number uitestUiWindowTest_new0180
     * @tc.desc   in a split state, Call the resize interface to adjust the window size from the right of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
      let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let bounds1 = await window2.getBounds()
      try {
        await window2.resize(0, bounds1.bottom - bounds1.top, ResizeDirection.RIGHT)
        await driver.delayMs(waitUiReadyMs*5)
        let window3 = await driver.findWindow({ bundleName: 'com.uitest.acts' })
        let windowmode = await window3.getWindowMode()
        expect(windowmode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowResizeB_split2
     * @tc.number uitestUiWindowTest_new0190
     * @tc.desc   in a split state, Call the resize interface to adjust the window size from the left of the window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowResizeB_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs*2)
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
        await driver.delayMs(waitUiReadyMs*2)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      let window2 = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      let bounds1 = await window2.getBounds()
      try {
        await window2.resize(0, bounds1.bottom - bounds1.top, ResizeDirection.LEFT)
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let bounds2 = await window3.getBounds()
        let windowmode = await window3.getWindowMode()
        expect(windowmode == WindowMode.FULLSCREEN)
      } catch (error) {
        console.log('testWindowMinimize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMinimize_full
     * @tc.number uitestUiWindowTest_new0200
     * @tc.desc   Call the minimize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowMode = await window.getWindowMode()
      if (windowMode != WindowMode.FULLSCREEN) {
        await window.resume()
      }
      try {
        await window.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowMinimize_float
     * @tc.number uitestUiWindowTest_new0210
     * @tc.desc   Call the minimize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowMode = await window.getWindowMode()
      if (windowMode != WindowMode.FLOATING) {
        await window.resume()
      }
      try {
        await window.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowMinimize_split1
     * @tc.number uitestUiWindowTest_new0220
     * @tc.desc   Call the minimize interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        await window1.minimize()
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window2 == null).assertTrue()
      } catch (error) {
        console.log('testWindowMinimize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      if (scbCom != null) {
        await driver.pressBack()
        await driver.delayMs(waitUiReadyMs*3)
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMinimize_split2
     * @tc.number uitestUiWindowTest_new0230
     * @tc.desc   Call the minimize interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMinimize_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
      await window1.split();
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window2 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        await window2.minimize();
        await driver.delayMs(waitUiReadyMs);
        let window3 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        expect(window3 == null).assertTrue();
      } catch (error) {
        console.log('testWindowMinimize_split2 error is ' + error);
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      if (scbCom != null) {
        await driver.pressBack()
        await driver.delayMs(waitUiReadyMs*3)
      }
      await stopApplication('com.uitestScene.acts');
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowClose_full
     * @tc.number uitestUiWindowTest_new0240
     * @tc.desc   Call the close interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowMode = await window.getWindowMode()
      if (windowMode != WindowMode.FULLSCREEN) {
        await window.resume()
      }
      await driver.delayMs(waitUiReadyMs)
      try {
        await window.close()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
    })

    /**
     * @tc.name   testWindowClose_float
     * @tc.number uitestUiWindowTest_new0250
     * @tc.desc   Call the close interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      let windowMode = await window.getWindowMode()
      if (windowMode != WindowMode.FLOATING) {
        await window.resume()
      }
      try {
        await window.close()
        await driver.delayMs(waitUiReadyMs)
        let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window1 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_float error is ' + error)
        expect(error.code == WindowsErrorCode)
      }
    })

    /**
     * @tc.name   testWindowClose_split1
     * @tc.number uitestUiWindowTest_new0260
     * @tc.desc   Call the close interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window1.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        await window1.close()
        await driver.delayMs(waitUiReadyMs)
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        expect(window2 == null).assertTrue()
      } catch (error) {
        console.log('testWindowClose_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      if (scbCom != null) {
        await driver.pressBack()
        await driver.delayMs(waitUiReadyMs*3)
      }
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowClose_split2
     * @tc.number uitestUiWindowTest_new0270
     * @tc.desc   Call the close interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowClose_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let window1 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
      await window1.split();
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'));
        await driver.delayMs(waitUiReadyMs);
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window5 = await driver.findWindow({ bundleName: 'com.uitest.acts' });
        await window5.split()
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
        await window3.close();
        await driver.delayMs(waitUiReadyMs);
        let window4 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' });
        expect(window4 == null).assertTrue();
      } catch (error) {
        console.log('testWindowClose_split2 error is ' + error);
        expect(error.code == WindowsErrorCode).assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMaximize_full
     * @tc.number uitestUiWindowTest_new0280
     * @tc.desc   Call the maximize interface in fullscreen.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FULLSCREEN) {
          await window.resume()
        }
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
      } catch (error) {
        console.log('testWindowMaximize_full error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowMaximize_float
     * @tc.number uitestUiWindowTest_new0290
     * @tc.desc   Call the maximize interface in float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      try {
        let windowMode = await window.getWindowMode()
        if (windowMode != WindowMode.FLOATING) {
          await window.resume()
        }
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
        let window3 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        let mode = await window3.getWindowMode()
        expect(mode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMaximize_float error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testWindowMaximize_split1
     * @tc.number uitestUiWindowTest_new0300
     * @tc.desc   Call the maximize interface in split-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_split1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs);
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'))
        await driver.delayMs(waitUiReadyMs)
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window2 = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
        let windowmode = await window2.getWindowMode()
        expect(windowmode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMaximize_split1 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

    /**
     * @tc.name   testWindowMaximize_split2
     * @tc.number uitestUiWindowTest_new0310
     * @tc.desc   Call the maximize interface in split-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowMaximize_split2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs);
      let window = await driver.findWindow({ bundleName: 'com.uitestScene.acts' })
      await window.split()
      await driver.delayMs(waitUiReadyMs*2)
      let scbCom = await driver.findComponent(ON.id('scb_block_cover'))
      await driver.delayMs(waitUiReadyMs);
      if (scbCom != null) {
        await startAbility('com.uitest.acts', 'EntryAbility')
        await driver.delayMs(waitUiReadyMs)
      }else {
        let testLabel = await driver.findComponent(ON.text('test label'))
        await driver.delayMs(waitUiReadyMs)
        await testLabel.click()
        await driver.delayMs(waitUiReadyMs)
      }
      try {
        let window2 = await driver.findWindow({ bundleName: 'com.uitest.acts' })
        await window2.maximize()
        await driver.delayMs(waitUiReadyMs)
        let windowmode = await window2.getWindowMode()
        expect(windowmode == WindowMode.FULLSCREEN).assertTrue()
      } catch (error) {
        console.log('testWindowMaximize_split2 error is ' + error)
        expect(error.code == WindowsErrorCode).assertTrue()
      }
      await stopApplication('com.uitestScene.acts')
      let resumeWindow = await driver.findWindow({ bundleName: 'com.uitest.acts' })
      if (resumeWindow != null) {
        await resumeWindow.resume()
      }
    })

  })
}
