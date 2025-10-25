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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, ComponentEventType,
  WindowChangeType, Point} from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const waitUiReadyMs : number = 1000;
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
  describe('uitest_Api22ErrorTest', (): void => {
    let driver: Driver;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverErrorTest loadup start!!!!!")
      driver = Driver.create();
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestDriverErrorTest loadup over!!!!!")
    })
    /**
     * @tc.number UitestDriver_Api22ErrorTest_001
     * @tc.name testComponentEventOccurOptionsMonitor_17000007_static
     * @tc.desc createUIEventObserver 17000007 test.
     */
    it('testComponentEventOccurOptionsMonitor_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static start`);
      let observer = driver.createUIEventObserver();
      let callback = (elementInfo : UIElementInfo) => {
        try {
          console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static elementInfo,${JSON.stringify(elementInfo)}`);
        } catch (err) {
          console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static callback error, ${JSON.stringify(err)}`);
          expect().assertFail();
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_UNDEFINED, {
          timeout: 3000
        } , callback);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static ComponentEventType = undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000007);
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: -1
        } , callback);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static timeout = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000007);
      }
      console.log(`${TestTag}, testComponentEventOccurOptionsMonitor_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_002
     * @tc.name testWindowChangeOptionsMonitor_17000007_static
     * @tc.desc WindowChange 17000007 test.
     */
    it('testWindowChangeOptionsMonitor_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static start`);
      let observer = driver.createUIEventObserver();
      let callback = (elementInfo : UIElementInfo) => {
        try {
          console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static elementInfo,${JSON.stringify(elementInfo)}`);
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static callback error, ${JSON.stringify(err)}`);
          expect().assertFail();
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_UNDEFINED, {
          timeout: 3000,
        } , callback);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static WindowChangeType = undefined is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000007);
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          timeout: -1,
        } , callback);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static timeout = -1 is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(17000007);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, testWindowChangeOptionsMonitor_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_003
     * @tc.name testIsComponentPresentWhenLongClick_17000002_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenLongClick_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000002_static start`);
      try {
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.isComponentPresentWhenLongClick(on, {x: 100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_004
     * @tc.name testIsComponentPresentWhenLongClick_17000007_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenLongClick_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static start`);
      try {
        await driver.isComponentPresentWhenLongClick(ON.enabled(true), {
          x: -1,
          y: 100
        })
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static error point.x = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.enabled(true), {
          x: 100,
          y: -1
        })
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static error point.y = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.enabled(true), {
          x: 100,
          y: 100,
          displayId: -1
        })
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static error point.displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.enabled(true), {
          x: 100,
          y: 100
        }, 1499)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static error duration = 1499: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, testIsComponentPresentWhenLongClick_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_005
     * @tc.name testIsComponentPresentWhenDrag_17000002_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenDrag_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000002_static start`);
      try {
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.isComponentPresentWhenDrag(on, {x: 100, y: 100}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_006
     * @tc.name testIsComponentPresentWhenDrag_17000007_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenDrag_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static start`);
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: -1,
          y: 100
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error from.x = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: -1
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error from.y = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100,
          displayId: -1
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error from.y = -displayId: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: -1, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error to.x = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: -1})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error to.y = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: 100, displayId: -1 })
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error to.displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100,
          displayId: 0
        }, {x: 100, y: 100, displayId: 1})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error diff.displayId: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: 100}, -1)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error speed = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: 100}, 3000, 1499)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static error duration = 1499: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, testIsComponentPresentWhenDrag_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_007
     * @tc.name testIsComponentPresentWhenSwipe_17000002_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenSwipe_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000002_static start`);
      try {
        let on  = ON.enabled(true);
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.isComponentPresentWhenSwipe(on, {x: 100, y: 100}, {x:100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_008
     * @tc.name testIsComponentPresentWhenSwipe_17000007_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testIsComponentPresentWhenSwipe_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static start`);
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: -1,
          y: 100
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error from.x = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: -1
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error from.y = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100,
          displayId: -1
        }, {x: 100, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error from.displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: -1, y: 100})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error to.x = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: -1})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error to.y = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: 100, displayId: -1})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error to.displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100,
          displayId: 0
        }, {x: 100, y: 100, displayId: 1})
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error diff.displayId: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.enabled(true), {
          x: 100,
          y: 100
        }, {x: 100, y: 100}, -1)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static error speed = -1: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      await sleep(waitUiReadyMs);
      console.log(`${TestTag}, testIsComponentPresentWhenSwipe_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_009
     * @tc.name testKnuckleKnock_17000002
     * @tc.desc isComponentPresentWhenLongClick 17000002 test.
     */
    it('testKnuckleKnock_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testKnuckleKnock_17000002_static start`);
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.knuckleKnock([{x: 100, y: 100}], 2);
        console.log(`${TestTag}, testKnuckleKnock_17000002_static knuckleKnock end`);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testKnuckleKnock_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_010
     * @tc.name testKnuckleKnock_17000007_static
     * @tc.desc isComponentPresentWhenLongClick 17000007 test.
     */
    it('testKnuckleKnock_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testKnuckleKnock_17000007_static start`);
      try {
        await driver.knuckleKnock([{x: -1, y: 100}],  2)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static error x = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: -1}],  2)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static y = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100, displayId: -1}],  2)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100, displayId: 0}, {x: 100, y: 100, displayId: 2}],  2)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static error displayId = 2: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100, displayId: 0}],  0)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static error times = 0: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100, displayId: 0}],  3)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static error times = 3: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100, displayId: 0}],  -1)
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testKnuckleKnock_17000007_static error times = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      console.log(`${TestTag}, testKnuckleKnock_17000007_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_011
     * @tc.name testInjectKnucklePointerAction_17000002_static
     * @tc.desc isComponentPresentWhenLongClick 17000002 test.
     */
    it('testInjectKnucklePointerAction_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testInjectKnucklePointerAction_17000002_static start`);
      try {
        let pointers = PointerMatrix.create(1,1);
        pointers.setPoint(0, 0 ,{x: 100, y: 100})
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.injectKnucklePointerAction(pointers);
        console.log(`${TestTag}, testInjectKnucklePointerAction_17000002_static knuckleKnock end`);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, testInjectKnucklePointerAction_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, testInjectKnucklePointerAction_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_012
     * @tc.name teTouchPadTwoFingersScroll_17000002_static
     * @tc.desc touchPadTwoFingersScroll 17000002 test.
     */
    it('teTouchPadTwoFingersScroll_17000002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000002_static start`);
      try {
        driver.delayMs(waitUiReadyMs * 3);
        await sleep(100);
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, 2);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000002_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      await sleep(waitUiReadyMs * 8);
      console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000002_static end`);
    })

    /**
     * @tc.number UitestDriver_Api22ErrorTest_013
     * @tc.name teTouchPadTwoFingersScroll_17000007
     * @tc.desc touchPadTwoFingersScroll 17000007 test.
     */
    it('teTouchPadTwoFingersScroll_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static start`);
      try {
        await driver.touchPadTwoFingersScroll({x: -1, y: 100}, UiDirection.UP, 2);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static error x = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: -1}, UiDirection.UP, 2);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static y = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100, displayId: -1}, UiDirection.UP, 2);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static displayId = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, -1);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static error d = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100,}, UiDirection.UP, 10, -1);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static error speed = -1: ${JSON.stringify(e)}`);
        expect(e.code == 17000005||e.code == 17000007).assertTrue();
      }
      console.log(`${TestTag}, teTouchPadTwoFingersScroll_17000007_static end`);
    })
  })
}