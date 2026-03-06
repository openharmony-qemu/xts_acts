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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const waitUiReadyMs : int = 1000;
const TestTag = 'UitestDriverErrorTest';
const AsyncErrorCode = 17000002;
const ParameterErrorCode = 17000007;
const CapabilityCode = 801;
const ErrorCode = 401;

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
  setTimeout(() => {
  resolve(0)
}, count)
})
}

export default function uitestDriverErrorTest() {
  describe('uitestDriverErrorTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverErrorTest loadup start!!!!!")
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestDriverErrorTest loadup over!!!!!")
    })

    /**
     * @tc.name   test_assertComponentExist_17000003_static
     * @tc.number uitestDriverErrorTest_001
     * @tc.desc   assertComponentExist 17000003 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_assertComponentExist_17000003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_assertComponentExist_17000003_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        await driver.assertComponentExist(ON.text('NotTest'));
        await driver.delayMs(waitUiReadyMs);
      }catch (e) {
        console.log(`${TestTag}, test_assertComponentExist_17000003_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(17000003);
      }
      await sleep(1000);
      console.log(`${TestTag}, test_assertComponentExist_17000003_static end`);
    })

    /**
     * @tc.name   test_driver_inputTextMode_801_static
     * @tc.number uitestDriverErrorTest_002
     * @tc.desc   inputText 801 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_inputTextMode_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_inputTextMode_801_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.inputText({x:100, y:100}, '123456', {
          paste: false
        });
      }catch (e) {
        hilog.info(domain, tag, `test_driver_inputTextMode_801_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(CapabilityCode);
      }
      hilog.info(domain, tag, `test_driver_inputTextMode_801_static end`);
    })

    /**
     * @tc.name   test_driver_pressBackWithId_17000007_static
     * @tc.number uitestDriverErrorTest_003
     * @tc.desc   mouseDrag 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_pressBackWithId_17000007_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressBack(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_pressBackWithId_17000007 end`);
    })

    /**
     * @tc.name   test_driver_getDisplaySizeWithId_17000007_static
     * @tc.number uitestDriverErrorTest_004
     * @tc.desc   getDisplayRotation 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_getDisplaySizeWithId_17000007_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.getDisplaySize(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_getDisplaySizeWithId_17000007_static end`);
    })

    /**
     * @tc.name   test_driver_pressHome_static
     * @tc.number uitestDriverErrorTest_005
     * @tc.desc   pressHome 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_pressHome_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_pressHome_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.pressHome(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_pressHome_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ParameterErrorCode);
      }
      hilog.info(domain, tag, `test_driver_pressHome_static end`);
    })

    /**
     * @tc.name   test_driver_delayMs_401_static
     * @tc.number uitestDriverErrorTest_006
     * @tc.desc   pressHome 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_delayMs_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_delayMs_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.delayMs(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_delayMs_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_delayMs_401_static end`);
    })

    /**
     * @tc.name   test_driver_waitForComponent_401_static
     * @tc.number uitestDriverErrorTest_007
     * @tc.desc   waitForComponent 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_waitForComponent_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_waitForComponent_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.waitForComponent(ON.text('next page'), -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForComponent_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_waitForComponent_401_static end`);
    })

    /**
     * @tc.name   test_driver_triggerKey_401_static
     * @tc.number uitestDriverErrorTest_008
     * @tc.desc   triggerKey 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerKey_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerKey_401_static start`);
      try {
        let driver: Driver = Driver.create();
        await driver.triggerKey(-1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKey_401_static error is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerKey_401_static end`);
    })

    /**
     * @tc.name   test_driver_triggerKeyWithId_401_static
     * @tc.number uitestDriverErrorTest_009
     * @tc.desc   triggerKey 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerKeyWithId_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.triggerKey(-1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static keycode = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerKey(0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerKeyWithId_401_static end`);
    })


    /**
     * @tc.name   test_driver_triggerCombineKeys_401_static
     * @tc.number uitestDriverErrorTest_010
     * @tc.desc   triggerCombineKeys 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_triggerCombineKeys_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.triggerCombineKeys(-1, 0, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static keycode1 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static keycode2 = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.triggerCombineKeys(0, 0, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_triggerCombineKeys_401_static end`);
    })

    /**
     * @tc.name   test_driver_click_401_static
     * @tc.number uitestDriverErrorTest_011
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_click_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_click_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.click(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_click_401_static x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.click(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_click_401_static y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_click_401_static end`);
    })

    /**
     * @tc.name   test_driver_doubleClick_401_static
     * @tc.number uitestDriverErrorTest_012
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_doubleClick_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_doubleClick_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.doubleClick(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClick_401_static x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.doubleClick(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_doubleClick_401_static y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_doubleClick_401_static end`);
    })

    /**
     * @tc.name   test_driver_swipe_401_static
     * @tc.number uitestDriverErrorTest_013
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_swipe_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_swipe_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.swipe(-1, 100, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static startx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, -1, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static starty = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, -1, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static endx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, -1, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static endy = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.swipe(100, 100, 100, 100, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_swipe_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_swipe_401_static end`);
    })

    /**
     * @tc.name   test_driver_drag_401_static
     * @tc.number uitestDriverErrorTest_014
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_drag_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_drag_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.drag(-1, 100, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static startx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, -1, 100, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static starty = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, -1, 100, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static endx = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, -1, 600);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static endy = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.drag(100, 100, 100, 100, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.drag(100, 100, 100, 100, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_drag_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_drag_401_static end`);
    })

    /**
     * @tc.name   test_driver_waitForIdle_401_static
     * @tc.number uitestDriverErrorTest_015
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_waitForIdle_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_waitForIdle_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.waitForIdle(-1, 100);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForIdle_401_static idleTime = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.waitForIdle(100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_waitForIdle_401_static timeout = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_waitForIdle_401_static end`);
    })

    /**
     * @tc.name   test_driver_fling_401_static
     * @tc.number uitestDriverErrorTest_016
     * @tc.desc   click 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_fling_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_fling_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling({x: -1, y: 100}, {x: 100, y: 100}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: -1}, {x: 100, y: 100}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: -1}, {x: 100, y: 100}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static from.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: -1, y: 100}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.x = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: -1}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.y = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: -1}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static to.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 1}, 100, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static diff.id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, -1, 200);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static stepLen = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 100, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 100, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling({x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 0}, 100, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_fling_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_fling_401_static end`);
    })

    /**
     * @tc.name   test_driver_injectMultiPointerAction_401_static
     * @tc.number uitestDriverErrorTest_017
     * @tc.desc   injectMultiPointerAction 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_injectMultiPointerAction_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static start`);
      let driver: Driver = Driver.create();
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static 199 = -1 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        let pointer = PointerMatrix.create(1,1);
        pointer.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(pointer, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static 41000 = -1 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_injectMultiPointerAction_401_static end`);
    })

    /**
     * @tc.name   test_driver_flingWithId_401_static
     * @tc.number uitestDriverErrorTest_018
     * @tc.desc   fling 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_flingWithId_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_flingWithId_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling(UiDirection.DOWN, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithId_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `test_driver_flingWithId_401_static end`);
    })

    /**
     * @tc.name   test_driver_flingWithIdSpeed_401_static
     * @tc.number uitestDriverErrorTest_019
     * @tc.desc   fling 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_flingWithIdSpeed_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling(UiDirection.DOWN, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 200, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static end`);
    })

    /**
     * @tc.name   test_driver_flingWithIdSpeed_401_static
     * @tc.number uitestDriverErrorTest_019
     * @tc.desc   fling 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_driver_flingWithIdSpeed_401_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static start`);
      let driver: Driver = Driver.create();
      try {
        await driver.fling(UiDirection.DOWN, -1, 0);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      try {
        await driver.fling(UiDirection.DOWN, 199, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 199 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 41000, 0);
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static speed = 41000 is, ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.fling(UiDirection.DOWN, 200, -1);
        expect().assertFail();
      } catch (e) {
        hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static id = -1 is, ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(ErrorCode);
      }
      hilog.info(domain, tag, `test_driver_flingWithIdSpeed_401_static end`);
    })

  })
}