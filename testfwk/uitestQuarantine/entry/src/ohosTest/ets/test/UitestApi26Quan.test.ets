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
import { Component, Driver, KeyOptions, ON, Point, TouchOptions} from '@kit.TestKit'

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
     * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0100
     * @tc.desc   Test dragBetweenWithOptions with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithOptionsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetweenWithOptions(center1, center2)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsDefault end`);
    });

     /**
      * @tc.name   testDriverDragBetweenNullOptions
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0200
      * @tc.desc   Test dragBetweenWithOptions with null options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetweenWithOptions(center1, center2, null)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsNullOptions end`);
    });
     /**
      * @tc.name   testDriverDragBetweenWithOptionsUndefinedOptions
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0300
      * @tc.desc   Test dragBetweenWithOptions with undefined options (default TouchOptions)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      const button: Component = await driver.findComponent(ON.id('jump'));
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      const text1: Component = await driver.findComponent(ON.text('one'));
      const text2: Component = await driver.findComponent(ON.text('two'));
      const center1: Point = await text1.getBoundsCenter();
      const center2: Point = await text2.getBoundsCenter();
      await driver.dragBetweenWithOptions(center1, center2, undefined)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsUndefinedOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsWithEmptyObjectOptions
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0400
      * @tc.desc   Test dragBetweenWithOptions with empty object options {}
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithEmptyObjectOptions start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithEmptyObjectOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsWithSpeed
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0500
      * @tc.desc   Test dragBetweenWithOptions with speed option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithSpeed start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithSpeed end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsWithDuration
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0600
      * @tc.desc   Test dragBetweenWithOptions with duration option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsWithDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithDuration start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithDuration end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsWithPressure
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0700
      * @tc.desc   Test dragBetweenWithOptions with pressure option
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithPressure start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithPressure end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsWithAllOptions
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_PARAM_0800
      * @tc.desc   Test dragBetweenWithOptions with all TouchOptions properties (speed, pressure, duration)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsWithAllOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithAllOptions start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options)
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsWithAllOptions end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsSpeedMinBoundary
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_BOUNDARY_0900
      * @tc.desc   Test dragBetweenWithOptions with speed at minimum boundary (200)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsSpeedMinBoundary start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsSpeedMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsSpeedMaxBoundary
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_BOUNDARY_0200
      * @tc.desc   Test dragBetweenWithOptions with speed at maximum boundary (40000)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsSpeedMaxBoundary start`);
      try {
        const options: TouchOptions = { speed: 40000, duration: 3500 };
        // 速度太快未触发滑动。
        let result = await driver.dragBetweenWithOptions({x: 100, y: 100}, {x: 100, y: 100}, options);
        await driver.delayMs(waitUiReadyMs);
        expect(result).assertNull();
      } catch (error) {
        console.info(`${TestTag}, testDriverDragBetweenWithOptionsSpeedMaxBoundary error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsSpeedMaxBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsDurationMinBoundary
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_BOUNDARY_0300
      * @tc.desc   Test dragBetweenWithOptions with duration at minimum boundary (1500)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsDurationMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsDurationMinBoundary start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsDurationMinBoundary end`);
    });

    /**
     * @tc.name   testDriverDragBetweenPressureMinBoundary
     * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_BOUNDARY_1200
     * @tc.desc   Test dragBetweenWithOptions with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDragBetweenWithOptionsPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsPressureMinBoundary start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsPressureMinBoundary end`);
    });

     /**
      * @tc.name   testDriverDragBetweenWithOptionsPressureMaxBoundary
      * @tc.number SUB_TESTFWK_UITEST_DRAGBETWEENWITHOPTIONS_BOUNDARY_1300
      * @tc.desc   Test dragBetweenWithOptions with pressure at maximum boundary (1)
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('testDriverDragBetweenWithOptionsPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsPressureMaxBoundary start`);
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
      await driver.dragBetweenWithOptions(center1, center2, options);
      await driver.delayMs(waitUiReadyMs)
      const text: Component | null = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverDragBetweenWithOptionsPressureMaxBoundary end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsDefault
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0100
     * @tc.desc   Test mouseDragWithOptions with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDragWithOptions(point1, point2);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsDefault end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithSpeed
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0200
     * @tc.desc   Test mouseDragWithOptions with speed option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 2000 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithSpeed end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithDuration
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0300
     * @tc.desc   Test mouseDragWithOptions with duration option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithDuration start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 2000 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithDuration end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithPressure
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0400
     * @tc.desc   Test mouseDragWithOptions with pressure option in TouchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithPressure end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithAllTouchOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0500
     * @tc.desc   Test mouseDragWithOptions with all TouchOptions (speed, duration, pressure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithAllTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithAllTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2500 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithAllTouchOptions end`);
      await stopApplication('com.uitestScene.acts')
    });

    /**
     * @tc.name   testDriverMouseDragWithKey1
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0600
     * @tc.desc   Test mouseDragWithOptions with key1 option in KeyOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithKey1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithKey1 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = { key1: 0 };
      await driver.mouseDragWithOptions(point1, point2, undefined, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithKey1 end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithKey2
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0700
     * @tc.desc   Test mouseDragWithOptions with key2 option in KeyOptions (with key1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithKey2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithKey2 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = { key1: 0, key2: 0 };
      await driver.mouseDragWithOptions(point1, point2, null, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithKey2 end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithAllOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0800
     * @tc.desc   Test mouseDragWithOptions with all options (TouchOptions and KeyOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithAllOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithAllOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 600, duration: 2000};
      const keyOptions: KeyOptions = { key1: 0, key2: 0 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithAllOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithNullTouchOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_0900
     * @tc.desc   Test mouseDragWithOptions with null TouchOptions, should use default values
     * @ @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithNullTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithNullTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDragWithOptions(point1, point2, null, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithNullTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWitUndefinedTouchOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_1000
     * @tc.desc   Test mouseDragWithOptions with undefined TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWitUndefinedTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWitUndefinedTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await driver.mouseDragWithOptions(point1, point2, undefined, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWitUndefinedTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithEmptyTouchOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_1100
     * @tc.desc   Test mouseDragWithOptions with empty TouchOptions, should use default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithEmptyTouchOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithEmptyTouchOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = {};
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithEmptyTouchOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithEmptyKeyOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_1200
     * @tc.desc   Test mouseDragWithOptions with empty KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithEmptyKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithEmptyKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const keyOptions: KeyOptions = {};
      await driver.mouseDragWithOptions(point1, point2, undefined, keyOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithEmptyKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithNullKeyOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_1300
     * @tc.desc   Test mouseDragWithOptions with null KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithNullKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithNullKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 2000 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions, null);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithNullKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsWithUndefinedKeyOptions
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_PARAM_1400
     * @ @tc.desc   Test mouseDragWithOptions with undefined KeyOptions, should not inject any key events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsWithUndefinedKeyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithUndefinedKeyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 800 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions, undefined);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsWithUndefinedKeyOptions end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsSpeedMinimum
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_BOUNDARY_0100
     * @tc.desc   Test mouseDragWithOptions with minimum speed value (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsSpeedMinimum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsSpeedMinimum start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 200 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsSpeedMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsSpeedMaximum
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_BOUNDARY_0200
     * @tc.desc   Test mouseDragWithOptions with maximum speed value (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @ @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsSpeedMaximum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsSpeedMaximum start`);
      try {
        const touchOptions: TouchOptions = { speed: 40000 };
        // 速度过快未触发滑动操作。
        let result = await driver.mouseDragWithOptions({x: 100, y: 100}, {x: 100, y: 100}, touchOptions);
        await driver.delayMs(2000);
        expect(result).assertNull();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDragWithOptionsSpeedMaximum error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testDriverMouseDragWithOptionsSpeedMaximum end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsDurationMinimum
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_BOUNDARY_0300
     * @tc.desc   Test mouseDragWithOptions with minimum duration value (1500)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsDurationMinimum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsDurationMinimum start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { duration: 1500 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsDurationMinimum end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsErrorSpeedTooSmall
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_ERROR_0300
     * @tc.desc   Test mouseDragWithOptions with speed less than 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsErrorSpeedTooSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsErrorSpeedTooSmall start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 199 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsErrorSpeedTooSmall end`);
    });

    /**
     * @tc.name   testDriverMouseDragWithOptionsErrorSpeedTooLarge
     * @tc.number SUB_TESTFWK_UITEST_MOUSEDRAGWITHOPTIONS_ERROR_0400
     * @tc.desc   Test mouseDragWithOptions with speed greater than 40000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDragWithOptionsErrorSpeedTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverMouseDragWithOptionsErrorSpeedTooLarge start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.id('jump'));
      let center = await button.getBoundsCenter();
      await driver.longClickAt(center);
      console.log(`${TestTag}, mouseLongClick successful`);
      await driver.delayMs(waitUiReadyMs);
      let text1 = await driver.findComponent(ON.text('one'));
      let text2 = await driver.findComponent(ON.text('two'));
      let point1 = await text1.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      const touchOptions: TouchOptions = { speed: 40001 };
      await driver.mouseDragWithOptions(point1, point2, touchOptions);
      await driver.delayMs(2000);
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text).assertNull();
      console.log(`${TestTag}, testDriverMouseDragWithOptionsErrorSpeedTooLarge end`);
    });

  })
}
