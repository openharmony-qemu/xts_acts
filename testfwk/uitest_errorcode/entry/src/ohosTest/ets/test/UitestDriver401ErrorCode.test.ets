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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Level, Size, afterAll } from '@ohos/hypium';
import { ComponentEventType, Driver, ON, PointerMatrix, UiDirection, WindowChangeType, MouseButton,
  Point } from '@ohos.UiTest';
import { startAbility, stopApplication } from './Utils.test';

const TestTag = 'testTag';
const ErrorCode = 401;
const NewErrorCode = 17000007;
const DeviceErrorCode = 801;
let btnCenter: Point = {x: 500, y: 500}

function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}
export default function uitestEnumTest() {
  describe('UitestDriver401ErrorCode', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create()
      await driver.delayMs(1000)

    })

    beforeEach(async () => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await sleep(1000);
      let button = await driver.findComponent(ON.text('MainPage'));
      await sleep(1000);
      if (button) {
        btnCenter = await button.getBoundsCenter();
      }
      await sleep(1000);
    })

    afterEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })    


    afterAll(async() => {
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testApi9_Driver_delayMs_401
     * @tc.number UiTest_uitest401_049
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_delayMs_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_delayMs_401 start`);
      try {
        await driver.delayMs(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.delayMs(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.delayMs(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_delayMs_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_findComponent_401
     * @tc.number UiTest_uitest401_050
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_findComponent_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_findComponent_401 start`);
      try {
        await driver.findComponent(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponent_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.findComponent(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponent_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_findComponent_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_findWindow_401
     * @tc.number UiTest_uitest401_051
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_findWindow_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_findWindow_401 start`);
      try {
        await driver.findWindow(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findWindow_401 filter = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.findWindow(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findWindow_401 filter = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_findWindow_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_waitForComponent_401
     * @tc.number UiTest_uitest401_052
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_waitForComponent_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 start`);
      try {
        await driver.waitForComponent(null, 500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForComponent(undefined, 500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForComponent(ON.text('next page'), null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 time = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForComponent(ON.text('next page'), undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 time = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForComponent(ON.text('next page'), -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 time = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_findComponents_401
     * @tc.number UiTest_uitest401_053
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_findComponents_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_findComponents_401 start`);
      try {
        await driver.findComponents(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponents_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.findComponents(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponents_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_findComponents_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_assertComponentExist_401
     * @tc.number UiTest_uitest401_054
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_assertComponentExist_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_assertComponentExist_401 start`);
      try {
        await driver.assertComponentExist(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_assertComponentExist_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.assertComponentExist(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_assertComponentExist_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_assertComponentExist_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_pressBack_17000007
     * @tc.number UiTest_uitest401_055
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_pressBack_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 start`);
      try {
        await driver.pressBack(null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.pressBack(undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.pressBack(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 END`);
    })

    /**
     * @tc.name   testApi11_Driver_once_401
     * @tc.number UiTest_uitest401_028
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_once_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_once_401 start`);
      let observer = driver.createUIEventObserver();
      try {
        observer.once(null, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 type = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(undefined, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 type = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('toastShow', null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 toastShow callcack = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('toastShow', undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 toastShow callcack = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('dialogShow', null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 dialogShow callcack = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('dialogShow', undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 dialogShow callcack = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(null, WindowChangeType.WINDOW_ADDED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange type = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(undefined, WindowChangeType.WINDOW_ADDED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange type = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('windowChange', null, {timeout: 2000}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange windowChangeType = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', undefined, {timeout: 2000}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange windowChangeType = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOW_ADDED, null, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange options = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOW_ADDED, undefined, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange options = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOW_ADDED, {}, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange callback = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOW_ADDED, {}, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange callback = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(null, ComponentEventType.COMPONENT_CLICKED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType type = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(undefined, ComponentEventType.COMPONENT_CLICKED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType type = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('componentEventOccur', null, {timeout: 2000}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('componentEventOccur', undefined, {timeout: 2000}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, null, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType options = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, undefined, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType options = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, {}, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType callback = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('componentEventOccur', ComponentEventType.COMPONENT_CLICKED, {}, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 ComponentEventType callback = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_once_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_triggerKey_401
     * @tc.number UiTest_uitest401_056
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_triggerKey_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_triggerKey_401 start`);
      try {
        await driver.triggerKey(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerKey_401 keycode = null error, ${JSON.stringify(error)}`);

      }
      try {
        await driver.triggerKey(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerKey_401 keycode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerKey_401 keycode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_triggerKey_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_triggerKey_401
     * @tc.number UiTest_uitest401_057
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_triggerKey_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_triggerKey_401 start`);
      try {
        await driver.triggerKey(null, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(undefined, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(-1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 kecode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerKey(0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerKey(0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_triggerKey_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_triggerCombineKeys_401
     * @tc.number UiTest_uitest401_058
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_triggerCombineKeys_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 start`);
      try {
        await driver.triggerCombineKeys(null, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(undefined, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(-1, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, null, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, undefined, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_triggerCombineKeys_401
     * @tc.number UiTest_uitest401_059
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_triggerCombineKeys_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 start`);
      try {
        await driver.triggerCombineKeys(null, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(undefined, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(-1, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, null, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, undefined, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, -1, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, 0, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, 0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.triggerCombineKeys(0, 0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_click_401
     * @tc.number UiTest_uitest401_060
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_click_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_click_401 start`);
      try {
        await driver.click(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(-1, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(100, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 y = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_click_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_doubleClick_401
     * @tc.number UiTest_uitest401_061
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_doubleClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_doubleClick_401 start`);
      try {
        await driver.doubleClick(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(-1, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(100, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 y = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_doubleClick_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_longClick_401
     * @tc.number UiTest_uitest401_062
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_longClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_longClick_401 start`);
      try {
        await driver.longClick(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(-1, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.longClick(100, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 y = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_longClick_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_swipe_401
     * @tc.number UiTest_uitest401_063
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_swipe_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_swipe_401 start`);
      let centerX = btnCenter.x;
      let centerY = btnCenter.y;
      try {
        await driver.swipe(null, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(undefined, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(-1, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, null, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, undefined, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, -1, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, null, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, undefined, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, -1, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, centerX, null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, centerX, undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, centerX, -1, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, centerX, centerY, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(centerX, centerY, centerX, centerY, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipe(centerX, centerY, centerX, centerY, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipe(centerX, centerY, centerX, centerY, null)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipe(centerX, centerY, centerX, centerY, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi9_Driver_swipe_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_drag_401
     * @tc.number UiTest_uitest401_064
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_drag_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_drag_401 start`);
      let centerX = btnCenter.x;
      let centerY = btnCenter.y;
      try {
        await driver.drag(null, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(undefined, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(-1, centerY, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, null, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, undefined, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, -1, centerX, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, null, 100, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, undefined, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, -1, centerY, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, centerX, null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, centerX, undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, centerX, -1, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, centerX, centerY, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(centerX, centerY, centerX, centerY, null)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.drag(centerX, centerY, centerX, centerY, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.drag(centerX, centerY, centerX, centerY, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.drag(centerX, centerY, centerX, centerY, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi9_Driver_drag_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_longClickAt_17000007
     * @tc.number UiTest_uitest401_065
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_longClickAt_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 start`);
      try {
        await driver.longClickAt(null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.longClickAt(undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.longClickAt(btnCenter, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 dur = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.longClickAt(btnCenter, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 dur = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.longClickAt(btnCenter, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 dur = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 END`);
    })

    /**
     * @tc.name   testApi20_Driver_swipeBetween_17000007
     * @tc.number UiTest_uitest401_066
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_swipeBetween_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 start`);
      try {
        await driver.swipeBetween(null, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.swipeBetween(undefined, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.swipeBetween(btnCenter, null , 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.swipeBetween(btnCenter, undefined , 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.swipeBetween(btnCenter, btnCenter , -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.swipeBetween(btnCenter, btnCenter , null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipeBetween(btnCenter, btnCenter, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipeBetween(btnCenter, btnCenter , 199)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.swipeBetween(btnCenter, btnCenter , 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 END`);
    })

    /**
     * @tc.name   testApi20_Driver_dragBetween_17000007
     * @tc.number UiTest_uitest401_067
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_dragBetween_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 start`);
      try {
        await driver.dragBetween(null, btnCenter, 600, 1500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(undefined, btnCenter, 600, 1500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(btnCenter, null , 600, 1500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(btnCenter, undefined , 600, 1500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , -1, 1500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , null, 1500)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , undefined, 1500)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 199, 1500)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 41000, 1500)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 600, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 duration = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 600, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 duration = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 600, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 duration = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.dragBetween(btnCenter, btnCenter , 600, 1499)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 duration = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 END`);
    })

    /**
     * @tc.name   testApi9_Driver_screenCap_401
     * @tc.number UiTest_uitest401_068
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_screenCap_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_screenCap_401 start`);
      try {
        await driver.screenCap(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_screenCap_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_screenCap_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap('')
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_screenCap_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_screenCap_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_screenCap_401
     * @tc.number UiTest_uitest401_069
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_screenCap_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_screenCap_401 start`);
      try {
        await driver.screenCap(null, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap(undefined, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap('', 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/1.png'
        await driver.screenCap(savePath, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 id = -1, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/2.png'
        await driver.screenCap(savePath, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 id = null, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let savePath = '/data/storage/el2/base/cache/3.png'
        await driver.screenCap(savePath, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 id = undefined, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_screenCap_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_getDisplayRotation_17000007
     * @tc.number UiTest_uitest401_070
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_getDisplayRotation_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 start`);
      try {
        await driver.getDisplayRotation(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.getDisplayRotation(null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.getDisplayRotation(undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 END`);
    })

    /**
     * @tc.name   testApi20_Driver_getDisplaySize_17000007
     * @tc.number UiTest_uitest401_071
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_getDisplaySize_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 start`);
      try {
        await driver.getDisplaySize(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.getDisplaySize(null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.getDisplaySize(undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 END`);
    })

    /**
     * @tc.name   testApi20_Driver_getDisplayDensity_17000007
     * @tc.number UiTest_uitest401_072
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_getDisplayDensity_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 start`);
      try {
        await driver.getDisplayDensity(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.getDisplayDensity(null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.getDisplayDensity(undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 END`);
    })

    /**
     * @tc.name   testApi20_Driver_pressHome_17000007
     * @tc.number UiTest_uitest401_073
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_pressHome_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 start`);
      try {
        await driver.pressHome(-1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.pressHome(null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.pressHome(undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 END`);
    })

    /**
     * @tc.name   testApi9_Driver_waitForIdle_401
     * @tc.number UiTest_uitest401_074
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_waitForIdle_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 start`);
      try {
        await driver.waitForIdle(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(-1, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 time = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 time = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(100, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 time = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_fling_401
     * @tc.number UiTest_uitest401_075
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_fling_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_fling_401 start`);
      try {
        await driver.fling(null, btnCenter, 100, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(undefined, btnCenter, 100, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, null, 100, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, undefined, 100, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, -1, 100)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, 100, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, 100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, 100, 199)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, 100, 41000)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(btnCenter, btnCenter, 100, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_fling_401 END`);
    })

    /**
     * @tc.name   testApi9_Driver_injectMultiPointerAction_401
     * @tc.number UiTest_uitest401_076
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_injectMultiPointerAction_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 start`);
      try {
        await driver.injectMultiPointerAction(null, 500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 points = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.injectMultiPointerAction(undefined, 500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 points = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectMultiPointerAction(points, null)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectMultiPointerAction(points, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectMultiPointerAction(points, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectMultiPointerAction(points, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectMultiPointerAction(points, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = -1 error, ${JSON.stringify(error)}`);
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = -1 error.message, ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 END`);
    })


    /**
     * @tc.name   testApi9_Driver_flingDir_401
     * @tc.number UiTest_uitest401_077
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_flingDir_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_flingDir_401 start`);
      try {
        await driver.fling(null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 dir = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 dir = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 speed = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 speed = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 speed = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 speed = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_flingDir_401 speed = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_flingDir_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_fling_401
     * @tc.number UiTest_uitest401_078
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_fling_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_fling_401 start`);
      try {
        await driver.fling(UiDirection.DOWN, null, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, undefined, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 500, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 500, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 500, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_fling_401 END`);
    })

    /**
     * @tc.name   testApi10_Driver_mouseClick_401
     * @tc.number UiTest_uitest401_079
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi10_Driver_mouseClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi10_Driver_mouseClick_401 start`);
      try {
        await driver.mouseClick(null, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick(undefined, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick(btnCenter, null, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 btn = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick(btnCenter, undefined, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 btn = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick(btnCenter, 0, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseClick(btnCenter, 0, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseClick(btnCenter, 0, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseClick(btnCenter, 0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseClick(btnCenter, 0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseClick(btnCenter, 0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi10_Driver_mouseClick_401 END`);
    })

    /**
     * @tc.name   testApi10_Driver_mouseMoveTo_401
     * @tc.number UiTest_uitest401_080
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi10_Driver_mouseMoveTo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi10_Driver_mouseMoveTo_401 start`);
      try {
        await driver.mouseMoveTo(null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseMoveTo_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveTo(undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseMoveTo_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi10_Driver_mouseMoveTo_401 END`);
    })

    /**
     * @tc.name   testApi10_Driver_mouseScroll_401
     * @tc.number UiTest_uitest401_081
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi10_Driver_mouseScroll_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 start`);
      try {
        await driver.mouseScroll(null, true, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(undefined, false, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, null, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, undefined, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 d = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, -1, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 d = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_mouseScroll_401
     * @tc.number UiTest_uitest401_082
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_mouseScroll_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 start`);
      try {
        await driver.mouseScroll(null, true, 0, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(undefined, false, 0, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, null, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, undefined, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, -1, 0, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 d = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, null, 0, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, undefined, 0, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, -1, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, 0, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, 0, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseScroll(btnCenter, false, 0, 0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_screenCapture_401
     * @tc.number UiTest_uitest401_083
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_screenCapture_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_screenCapture_401 start`);
      try {
        await driver.screenCapture('', {left: 100, right: 100, top: 100, bottom: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCapture(null, {left: 100, right: 100, top: 100, bottom: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCapture(undefined, {left: 100, right: 100, top: 100, bottom: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/screenCapture_401.png'
        await driver.screenCapture(savePath, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 rect = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let savePath = '/data/storage/el2/base/cache/screenCapture_402.png'
        await driver.screenCapture(savePath, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 rect = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi11_Driver_screenCapture_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_mouseDoubleClick_401
     * @tc.number UiTest_uitest401_084
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_mouseDoubleClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 start`);
      try {
        await driver.mouseDoubleClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDoubleClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_mouseLongClick_401
     * @tc.number UiTest_uitest401_085
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_mouseLongClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 start`);
      try {
        await driver.mouseLongClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, null, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, undefined, 0)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, -1, 0)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_mouseLongClick_401
     * @tc.number UiTest_uitest401_086
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_mouseLongClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 start`);
      try {
        await driver.mouseLongClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_MIDDLE, null, 0, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_LEFT, undefined, 0, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_LEFT, -1, 0, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key1 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_LEFT, 0, null, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, -1, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseLongClick(btnCenter, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 500)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = 500 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_mouseMoveWithTrack_401
     * @tc.number UiTest_uitest401_087
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_mouseMoveWithTrack_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 start`);
      try {
        await driver.mouseMoveWithTrack(null, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack(undefined, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, btnCenter, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, btnCenter, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, btnCenter, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, btnCenter, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseMoveWithTrack(btnCenter, btnCenter, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_mouseDrag_401
     * @tc.number UiTest_uitest401_088
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_mouseDrag_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 start`);
      try {
        await driver.mouseDrag(null, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(undefined, btnCenter, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, null, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, undefined, 600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, null)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 199)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 41000)
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_mouseDrag_401
     * @tc.number UiTest_uitest401_089
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_mouseDrag_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 start`);
      try {
        await driver.mouseDrag(null, btnCenter, 600, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(undefined, btnCenter, 600, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, null, 600, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, undefined, 600, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, null, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, undefined, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 199, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = 199 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 41000, 1600)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, -1, 1600)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 500, null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 500, undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.mouseDrag(btnCenter, btnCenter, 500, -1)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 END`);
    })

    /**
     * @tc.name   testApi11_Driver_inputText_401
     * @tc.number UiTest_uitest401_090
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi11_Driver_inputText_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi11_Driver_inputText_401 start`);
      try {
        await driver.inputText(null, 'hello')
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(undefined, 'hello')
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, '')
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 text = '' error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi11_Driver_inputText_401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_inputText_401
     * @tc.number UiTest_uitest401_091
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_inputText_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_inputText_401 start`);
      try {
        await driver.inputText(null, 'hello', {addition: false})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(undefined, 'hello', {addition: false})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, null, {addition: false})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, undefined, {addition: false})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.inputText(btnCenter, '', {addition: false})
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = '' error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.inputText(btnCenter, 'Hello', null)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 model = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.inputText(btnCenter, 'Hello', undefined)
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 model = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi20_Driver_inputText_401 END`);
    })

    /**
     * @tc.name   testApi18_Driver_touchPadMultiFingerSwipe_401
     * @tc.number UiTest_uitest401_092
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_Driver_touchPadMultiFingerSwipe_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_Driver_touchPadMultiFingerSwipe_401 start`);
      try {
        await driver.touchPadMultiFingerSwipe(null, UiDirection.RIGHT);
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, fingers = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(undefined, UiDirection.LEFT, {stay: false});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, fingers = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(-1, UiDirection.DOWN, {stay: false});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, fingers = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(5, UiDirection.UP, {stay: false});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, fingers = 5 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(2, UiDirection.LEFT, {stay: true});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, fingers = 2 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(3, UiDirection.LEFT, {stay: true, speed: -1});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, speed = 2 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(1, null, {stay: true});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, direction = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.touchPadMultiFingerSwipe(1, undefined, {stay: true});
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, direction = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_Driver_touchPadMultiFingerSwipe_401 END`);
    })

    /**
     * @tc.name   testApi18_Driver_penLongClick_401
     * @tc.number UiTest_uitest401_093
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_Driver_penLongClick_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_Driver_penLongClick_401 start`);
      try {
        await driver.penLongClick(btnCenter, null);
        console.log(TestTag, `testApi18_Driver_penLongClick_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penLongClick_401, p = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penLongClick(btnCenter, undefined);
        console.log(TestTag, `testApi18_Driver_penLongClick_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penLongClick_401, p = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_Driver_penLongClick_401 END`);
    })

    /**
     * @tc.name   testApi18_Driver_penSwipe_401
     * @tc.number UiTest_uitest401_094
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_Driver_penSwipe_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_Driver_penSwipe_401 start`);
      try {
        await driver.penSwipe(null, btnCenter, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(undefined, btnCenter, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(btnCenter, null, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, ep = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(btnCenter, undefined, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, ep = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, null, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, undefined, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 199, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401 199`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = 199 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 41000, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401 41000`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = 41000 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, -1, 0.5);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 600, null);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 600, undefined);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 600, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(btnCenter, btnCenter, 600, 2);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = 2 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_Driver_penSwipe_401 END`);
    })

    /**
     * @tc.name   testApi18_Driver_injectPenPointerAction401
     * @tc.number UiTest_uitest401_095
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_Driver_injectPenPointerAction401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_Driver_injectPenPointerAction401 start`);
      try {
        await driver.injectPenPointerAction(null, 600, 0.5);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, points = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.injectPenPointerAction(undefined, 600, 0.5);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, points = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, null, 0.5);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, spe = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, undefined, 0.5);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, spe = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 199, 0.5);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, spe = 199 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 41000, 0.5);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, spe = 41000 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, -1, 0.5);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, spe = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 600, null);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, pre = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 600, undefined);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, pre = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 600, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, pre = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectPenPointerAction(points, 600, 2);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointerAction401, pre = 2 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_Driver_injectPenPointerAction401 END`);
    })

    /**
     * @tc.name   testApi20_Driver_crownRotate_801
     * @tc.number UiTest_uitest401_096
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_crownRotate_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_crownRotate_801 start`);
      try {
        await driver.crownRotate(300,null);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi20_Driver_crownRotate_801, spe = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      try {
        await driver.crownRotate(300,undefined);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi20_Driver_crownRotate_801, spe = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      try {
        await driver.crownRotate(300, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi20_Driver_crownRotate_801, spe = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.crownRotate(300, 0);
      } catch (error) {
        console.log(TestTag, `testApi20_Driver_crownRotate_801, spe = 0 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      try {
        await driver.crownRotate(300, 501);
      } catch (error) {
        console.log(TestTag, `testApi20_Driver_crownRotate_801, spe = 501 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_crownRotate_801 END`);
    })

    /**
     * @tc.name   testApi22_Driver_isComponentPresentWhenLongClick_17000007
     * @tc.number UiTest_uitest401_097
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_isComponentPresentWhenLongClick_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenLongClick_17000007 start`);
      try {
        await driver.isComponentPresentWhenLongClick(null, btnCenter, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, ON = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(undefined, btnCenter, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, ON = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), null, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, point = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), undefined, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, point = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), btnCenter, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, spe = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), btnCenter, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenLongClick_17000007 END`);
    })

    /**
     * @tc.name   testApi22_Driver_isComponentPresentWhenDrag_17000007
     * @tc.number UiTest_uitest401_098
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_isComponentPresentWhenDrag_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenDrag_17000007 start`);
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, null, 600, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, to = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, undefined, 600, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, to = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, null, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, undefined, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, 199, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = 199 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, 41000, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = 41000 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, -1, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, 600, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, dur = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, 600, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, dur = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), btnCenter, btnCenter, 600, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, dur = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenDrag_17000007 END`);
    })

    /**
     * @tc.name   testApi22_Driver_isComponentPresentWhenSwipe_17000007
     * @tc.number UiTest_uitest401_099
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_isComponentPresentWhenSwipe_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenSwipe_17000007 start`);
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, null, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, to = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, undefined, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, to = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, btnCenter, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, btnCenter, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, btnCenter, 199);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = 199 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, btnCenter, 41000);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = 41000 error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), btnCenter, btnCenter, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenSwipe_17000007 END`);
    })

    /**
     * @tc.name   testApi22_Driver_touchPadTwoFingersScroll_17000007
     * @tc.number UiTest_uitest401_0100
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_touchPadTwoFingersScroll_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_touchPadTwoFingersScroll_17000007 start`);
      try {
        await driver.touchPadTwoFingersScroll(null, UiDirection.LEFT, 30, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, point = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(undefined, UiDirection.RIGHT, 30, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, point = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, null, 30, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, direction = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, undefined, 30, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, direction = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, null, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, d = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, undefined, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, d = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, -1, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, d = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, 50, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, 50, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, 50, 199);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = 199 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, 50, 41000);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = 41000 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        await driver.touchPadTwoFingersScroll(btnCenter, UiDirection.UP, 50, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi22_Driver_touchPadTwoFingersScroll_17000007 END`);
    })

    /**
     * @tc.name   testApi22_Driver_knuckleKnock_17000007
     * @tc.number UiTest_uitest401_0101
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_knuckleKnock_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_knuckleKnock_17000007 start`);
      try {
        await driver.knuckleKnock([], 2);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, points = [] error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.knuckleKnock(null, 2);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, points = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.knuckleKnock(undefined, 2);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, points = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.knuckleKnock([btnCenter], null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, time = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.knuckleKnock([btnCenter], undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, time = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi22_Driver_knuckleKnock_17000007 END`);
    })

    /**
     * @tc.name   testApi22_Driver_injectKnucklePointerAction_17000005
     * @tc.number UiTest_uitest401_0102
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_injectKnucklePointerAction_17000005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_injectKnucklePointerAction_17000005 start`);
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectKnucklePointerAction(points, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectKnucklePointerAction(points, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectKnucklePointerAction(points, 199);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = 199 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectKnucklePointerAction(points, 41000);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = 41000 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, btnCenter)
        await driver.injectKnucklePointerAction(points, -1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = -1 error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi22_Driver_injectKnucklePointerAction_17000005 END`);
    })

 })
}