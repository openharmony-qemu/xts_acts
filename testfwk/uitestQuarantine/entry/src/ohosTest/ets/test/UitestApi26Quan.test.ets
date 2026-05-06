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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { Component, Driver, ON, Point, TouchOptions} from '@kit.TestKit'

import { startAbility, stopApplication } from './Util.test';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_API16';


export default function UiTest() {
  describe('UiTest_API26', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testDriverDragBetweenDefault
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0100
     * @tc.desc   Test dragBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDefault end`);
    });

     /**
      * @tc.name   testDriverDragBetweenNullOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0200
      * @tc.desc   Test dragBetween with null options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2, null)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenNullOptions end`);
    });
     /**
      * @tc.name   testDriverDragBetweenUndefinedOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0300
      * @tc.desc   Test dragBetween with undefined options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetween(center1, center2, undefined)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenUndefinedOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithEmptyObjectOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0400
      * @tc.desc   Test dragBetween with empty object options {}
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = {} as TouchOptions;
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithEmptyObjectOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithSpeed
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0500
      * @tc.desc   Test dragBetween with speed option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000 };
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithSpeed end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithDuration
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0600
      * @tc.desc   Test dragBetween with duration option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithDuration start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 2000 } as TouchOptions;
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithDuration end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithPressure
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0700
      * @tc.desc   Test dragBetween with pressure option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0.5 };
      await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithPressure end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithAllOptions
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_PARAM_0800
      * @tc.desc   Test dragBetween with all TouchOptions properties (speed, pressure, duration)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithAllOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 2000, pressure: 0.8, duration: 3000 };
      let result = await driver.dragBetween(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      expect(result).assertNull()
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithAllOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMinBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0900
      * @tc.desc   Test dragBetween with speed at minimum boundary (200)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { speed: 200 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenSpeedMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenSpeedMaxBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0200
      * @tc.desc   Test dragBetween with speed at maximum boundary (40000)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary start`);
      try {
        const options: TouchOptions = { speed: 40000, duration: 3500 };
        let result = await driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100}, options);
        expect(result).assertNull();
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${TestTag}, testDriverDragBetweenSpeedMaxBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenDurationMinBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_0300
      * @tc.desc   Test dragBetween with duration at minimum boundary (1500)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenDurationMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { duration: 1500 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenDurationMinBoundary end`);
    });

    /**
     * @tc.name   testDriverDragBetweenPressureMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1200
     * @tc.desc   Test dragBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 0 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenPressureMaxBoundary
      * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_BOUNDARY_1300
      * @tc.desc   Test dragBetween with pressure at maximum boundary (1)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      const options: TouchOptions = { pressure: 1 };
      await driver.dragBetween(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenPressureMaxBoundary end`);
    });

  })
}
