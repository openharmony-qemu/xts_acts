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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const waitUiReadyMs: int = 1000;
const TestTag: string = 'UitestDriverErrorTest';
const ParameterErrorCode: int = 17000007;
const InvisibleErrorCode: int = 17000004;
const CapabilityCode: int = 801;
const ErrorCode: int = 401;

export default function uitestDriverErrorTest() {
  describe('uitest_Api20ErrorTest', (): void => {
    let driver: Driver;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverErrorTest loadup start!!!!!")
      driver = Driver.create();
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestDriverErrorTest loadup over!!!!!")
    })

    /**
     * @tc.name test_getDisplayId_17000004_static
     * @tc.number Uitest_Api20ErrorTest_002
     * @tc.desc getDisplayId 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getDisplayId_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_getDisplayId_17000004_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (button != null) {
          await button.getDisplayId();
        }
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_getDisplayId_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, test_getDisplayId_17000004_static end`);
    })

    /**
     * @tc.name test_getOriginalText_17000004_static
     * @tc.number Uitest_Api20ErrorTest_004
     * @tc.desc getOriginalText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getOriginalText_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_getOriginalText_17000004_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        if (button != null) {
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          await button.getOriginalText();
        }
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_getOriginalText_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, test_getOriginalText_17000004_static end`);
    })

    /**
     * @tc.name test_driver_ClickAt_17000007_static
     * @tc.number Uitest_Api20ErrorTest_007
     * @tc.desc ClickAt 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_ClickAt_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_driver_ClickAt_17000007_static start`);
      try {
        await driver.clickAt({x: -1, y:100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007_static point.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y:-1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007_static point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.clickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_ClickAt_17000007_static point.displayId = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_ClickAt_17000007_static end`);
    })

    /**
     * @tc.name test_driver_DoubleClickAt_17000007_static
     * @tc.number Uitest_Api20ErrorTest_009
     * @tc.desc doubleClickAt 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_DoubleClickAt_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000007_static start`);
      try {
        await driver.doubleClickAt({x: -1, y:100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007_static point.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y:-1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007_static point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.doubleClickAt({x: 100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_DoubleClickAt_17000007_static point.displayId = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_DoubleClickAt_17000007_static end`);
    })

    /**
     * @tc.name test_driver_longClickAt_17000007_static
     * @tc.number Uitest_Api20ErrorTest_011
     * @tc.desc longClickAt 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_longClickAt_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_driver_longClickAt_17000007_static start`);
      try {
        await driver.longClickAt({x: -1, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static point.x = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: 100, y: -1}, 1500);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static point.y = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: 100, y: 100, displayId: -1}, 1500);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static point.displayId = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.longClickAt({x: 10000, y: 100}, 1500);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static point.X = 10000 error is: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.longClickAt({x: 100, y: 10000}, 1500);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static point.y = 10000 error is: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      try {
        await driver.longClickAt({x: 100, y: 100}, 1499);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_longClickAt_17000007_static duration = 1499 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_longClickAt_17000007_static end`);
    })

    /**
     * @tc.name test_driver_swipeBetween_17000007_static
     * @tc.number Uitest_Api20ErrorTest_013
     * @tc.desc swipeBetween 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_swipeBetween_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_driver_swipeBetween_17000007_static start`);
      try {
        await driver.swipeBetween({x: -1, y:100}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static from.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:-1}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static from.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100, displayId: -1}, {x: 100, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static from.displayId=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:-1, y: 100});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static to.x=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: -1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static to.y=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: 100, displayId: -1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static to.displayId=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100}, {x:100, y: 100}, -1);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static speed=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        await driver.swipeBetween({x: 100, y:100, displayId: 0}, {x:100, y: 100, displayId: 1});
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_swipeBetween_17000007_static diff error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_driver_swipeBetween_17000007_static end`);
    })

    /**
     * @tc.name test_driver_crownRotate_17000007_static
     * @tc.number Uitest_Api20ErrorTest_017
     * @tc.desc crownRotate 17000007 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_driver_crownRotate_17000007_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_driver_crownRotate_17000007_static start`);
      try {
        await driver.crownRotate(-1, 100);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_crownRotate_17000007_static d=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code == 801 || e.code == 17000007).assertTrue();
      }
      try {
        await driver.crownRotate(1, -1);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_driver_crownRotate_17000007_static speed=-1 error is: ${JSON.stringify(e)}`);
        expect(e.code == 801 || e.code == 17000007).assertTrue();
      }
      console.log(`${TestTag}, test_driver_crownRotate_17000007_static end`);
    })
  })
}