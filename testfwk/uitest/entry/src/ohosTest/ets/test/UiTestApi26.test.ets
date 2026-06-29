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

import { describe, it, expect, TestType, Level, Size, beforeAll, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import { Driver, ON, PenKey, PenKeyOperation, PenMode, TouchOptions, } from '@kit.TestKit'
import { display } from '@kit.ArkUI';
import { startAbility, stopApplication } from './Util.test';
import fileIO from '@ohos.fileio';
import { hilog } from '@kit.PerformanceAnalysisKit';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';
const DeviceErrorCode = 17000005;

export default function uitestApi26Test() {
  describe('uitestApi26Test', () => {
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

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testDriverClickAtWithOptionsDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0100
     * @tc.desc   Test clickAtWithOptions with point parameter (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsDefault start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAtWithOptions(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index');
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsDefault over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0200
     * @tc.desc   Test clickAt with options={} (empty object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtWithOptionsEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      await driver.clickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtWithOptionsEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsBoundaryPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_BOUNDARY_0300
     * @tc.desc   Test clickAtWithOptions with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtWithOptionsBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.clickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtWithOptionsBoundaryPressureMin end`);
    });


    /**
     * @tc.name   testDriverClickAtWithOptionsPressureMax
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0400
     * @tc.desc   Test clickAtWithOptions with point and pressure parameter (pressure = 1.0, maximum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsPressureMax start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1.0 };
      await driver.clickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsPressureMax over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0500
     * @tc.desc   Test clickAtWithOptions with point and pressure parameter (pressure = 0.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsPressure start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.clickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsPressure over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0600
     * @tc.desc   Test clickAtWithOptions with point and pressure parameter (pressure = 0.0, minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsPressureMin start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.0 };
      await driver.clickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsPressureMin over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKATWITHOPTIONS_PARAM_0700
     * @tc.desc   Test clickAtWithOptions with point parameter (options = null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsNullOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAtWithOptions(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsNullOptions over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtWithOptionsUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_cLICKATWITHOPTIONS_PARAM_0800
     * @tc.desc   Test clickAtWithOptions with point parameter (options = undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtWithOptionsUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtWithOptionsUndefinedOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAtWithOptions(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtWithOptionsUndefinedOptions over');
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_0900
     * @tc.desc   Test longClickAtWithOptions with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAtWithOptions(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsDefault end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1000
     * @tc.desc   Test longClickAtWithOptions with empty TouchOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtDurationMin
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1100
     * @tc.desc   Test longClickAtWithOptions with duration=1500 (minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDurationMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { duration: 1500 };
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDurationMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsPressure
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1200
     * @tc.desc   Test longClickAtWithOptions with pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsDurationAndPressure
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1300
     * @tc.desc   Test longClickAtWithOptions with duration=3000 and pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsDurationAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsDurationAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { duration: 3000, pressure: 0.5 };
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsDurationAndPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsBoundaryPressureMin
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_BOUNDARY_1400
     * @tc.desc   Test longClickAtWithOptions with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsBoundaryPressureMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsBoundaryPressureMax
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_BOUNDARY_1500
     * @tc.desc   Test longClickAtWithOptions with pressure=1 (maximum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsBoundaryPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsBoundaryPressureMax start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1 };
      await driver.longClickAtWithOptions(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsBoundaryPressureMax end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsNullOptions
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1600
     * @tc.desc   Test longClickAtWithOptions with options=null (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAtWithOptions(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsNullOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtWithOptionsWithOptionsUndefinedOptions
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_LONGCLICKATWITHOPTIONS_PARAM_1700
     * @tc.desc   Test longClickAtWithOptions with options=undefined (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtWithOptionsWithOptionsUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsWithOptionsUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAtWithOptions(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtWithOptionsWithOptionsUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsDefault
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_1800
     * @tc.desc   Test swipeBetweenWithOptions with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenDefault disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id })
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsDefault end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsWithSpeed
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_1900
     * @tc.desc   Test swipeBetweenWithOptions with speed option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeed disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeed end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsWithPressure
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_2000
     * @tc.desc   Test swipeBetweenWithOptions with pressure option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0.5 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsWithSpeedAndPressure
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_2100
     * @tc.desc   Test swipeBetweenWithOptions with both speed and pressure options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsWithSpeedAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeedAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeedAndPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000, pressure: 0.5 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithSpeedAndPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsNullOptions
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_2300
     * @tc.desc   Test swipeBetweenWithOptions with null options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsNullOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, null)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsNullOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsUndefinedOptions
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_2400
     * @tc.desc   Test swipeBetweenWithOptions with undefined options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsUndefinedOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, undefined)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsWithEmptyObjectOptions
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_PARAM_2500
     * @tc.desc   Test swipeBetweenWithOptions with empty object options {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithEmptyObjectOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithEmptyObjectOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = {} as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithEmptyObjectOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsSpeedMinBoundary
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_BOUNDARY_2600
     * @tc.desc   Test swipeBetweenWithOptions with speed at minimum boundary (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsSpeedMaxBoundary
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_BOUNDARY_2700
     * @tc.desc   Test swipeBetweenWithOptions with speed at maximum boundary (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 40000 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedMaxBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsPressureMinBoundary
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_BOUNDARY_2800
     * @tc.desc   Test swipeBetweenWithOptions with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMaxBoundary
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_BOUNDARY_2900
     * @tc.desc   Test swipeBetweenWithOptions with pressure at maximum boundary (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 1 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsPressureMaxBoundary end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsWithAllBoundaryValues
     * @tc.number SUB_TESTFWK_UITEST_DRIVER_SWIPEBETWEENWITHOPTIONS_BOUNDARY_3000
     * @tc.desc   Test swipeBetweenWithOptions with all properties at boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsWithAllBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithAllBoundaryValues start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithAllBoundaryValues disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200, pressure: 1 } as TouchOptions
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsWithAllBoundaryValues end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithOptionsSpeedOutOfRangeLow
     * @tc.number SUB_TESTFWK_UITEST_SWIPEBETWEENWITHOPTIONS_BOUNDARY_3100
     * @tc.desc   Test swipeBetweenWithOptions with speed at min boundary (199)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsSpeedOutOfRangeLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeLow start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeLow disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scroll.getBounds()
      let center = await scroll.getBoundsCenter()
      const options: TouchOptions = { speed: 199 };
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeLow end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedOutOfRangeHigh
     * @tc.number SUB_TESTFWK_UITEST_SWIPEBETWEENWITHOPTIONS_ERROR_0500
     * @tc.desc   Test swipeBetweenWithOptions with speed at maximum boundary (400001)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithOptionsSpeedOutOfRangeHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeHigh start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeHigh disPlay is: ${JSON.stringify(disPlay)}`);
      let scroll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scroll.getBounds()
      let center = await scroll.getBoundsCenter()
      const options: TouchOptions = { speed: 40001 };
      await driver.swipeBetweenWithOptions({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithOptionsSpeedOutOfRangeHigh end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDefault
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0100
     * @tc.desc   Test dumpLayout with default displayId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let savePath = '/data/storage/el2/base/cache/dump_layout_001.json'
      const result: boolean = await driver.dumpLayout(savePath);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutWithDisplayId
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0200
     * @tc.desc   Test dumpLayout with displayId from getDefaultDisplay()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutWithDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let savePath = '/data/storage/el2/base/cache/dump_layout_003.json'
      const displayId: number = (await display.getDefaultDisplay()).id;
      const result: boolean = await driver.dumpLayout(savePath, displayId);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testDriverDumpLayoutVerifyJsonContent
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_RETURN_0300
     * @tc.desc   Test dumpLayout API 26.0 verifies JSON content structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutVerifyJsonContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent start`);
      const savePath = '/data/storage/el2/base/cache/dump_verify_content.json';

      const result: boolean = await driver.dumpLayout(savePath, 0);
      expect(result).assertTrue();

      const fileStat = await fileIO.stat(savePath);

      expect(fileStat.size).assertLarger(0)

      const content = await fileIO.readText(savePath);
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent content, ${content}`);
      expect(content.length).assertLarger(0)

      await fileIO.unlink(savePath);
      console.info(`${TestTag}, testDriverDumpLayoutVerifyJsonContent end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutZeroDisplayId
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_PARAM_0400
     * @tc.desc   Test dumpLayout API 26.0 with displayId=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutZeroDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutZeroDisplayId start`);
      let savePath = '/data/storage/el2/base/cache/dump_layout_004.json'
      const result: boolean = await driver.dumpLayout(savePath, 0);
      expect(result).assertTrue();
      console.info(`${TestTag}, testDriverDumpLayoutZeroDisplayId end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDisplayIdNull
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_NULLUNDEFINED_0500
     * @tc.desc   Test dumpLayout API 26.0 with displayId=null, should use default value and execute normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDisplayIdNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdNull start`);
      const savePath = '/data/storage/el2/base/cache/dump_display_null.json';

      const result: boolean = await driver.dumpLayout(savePath, null);
      expect(result).assertTrue();

      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdNull end`);
    });

    /**
     * @tc.name   testDriverDumpLayoutDisplayIdUndefined
     * @tc.number SUB_testfwk_UITEST_DUMPLAYOUT_NULLUNDEFINED_0600
     * @tc.desc   Test dumpLayout API 26.0 with displayId=undefined, should use default value and execute normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverDumpLayoutDisplayIdUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdUndefined start`);
      const savePath = '/data/storage/el2/base/cache/dump_display_undefined.json';
      const result: boolean = await driver.dumpLayout(savePath, undefined);
      expect(result).assertTrue();
      console.info(`${TestTag}, testDriverDumpLayoutDisplayIdUndefined end`);
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0100
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode)
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeySmartClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0200
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeySmartClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartClick start');
      try {
        await driver.triggerPenKey(PenKey.SMART, PenMode.HANDWRITING, PenKeyOperation.CLICK);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode)
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeySmartPointClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0300
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeySmartPointClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartPointClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        let clickPoint = await nextPageButton.getBoundsCenter();
        await driver.triggerPenKey(PenKey.SMART, PenMode.HANDWRITING, PenKeyOperation.CLICK,
          { point: clickPoint});
        await driver.delayMs(500);
        let backToIndexComponent = await driver.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        let componentText: string = await backToIndexComponent.getText();
        expect(componentText).assertEqual('back to index');
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartPointClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeySmartPointClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0400
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick start');
      try {
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK);
        await driver.delayMs(500);
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyHandwritingWithPointDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0500
     * @tc.desc   Test Driver.triggerPenKey with HANDWRITING mode, HANDWRITING key, DOUBLE_CLICK operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyHandwritingWithPointDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
        }
        let center = await doubleBtn.getBoundsCenter()
        await driver.triggerPenKey(PenKey.HANDWRITING, PenMode.HANDWRITING, PenKeyOperation.DOUBLE_CLICK, {point: center});
        await driver.delayMs(waitUiReadyMs)
        let newButton = await driver.findComponent(ON.text('doubleClick'))
        let text = await newButton.getText()
        expect(text).assertEqual('doubleClick')
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + '%{public}s', TestTag + 'testDriverTriggerPenKeyHandwritingDoubleClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0600
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let nextPageButton = await driver.findComponent(ON.text('next page'));
        expect(nextPageButton != null).assertTrue();
        let clickPoint = await nextPageButton.getBoundsCenter();
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.CLICK, { point: clickPoint });
        await driver.delayMs(500);
        let backToIndexComponent= await driver.findComponent(ON.text('back to index'));
        expect(backToIndexComponent != null).assertTrue();
        let componentText: string = await backToIndexComponent.getText();
        expect(componentText).assertEqual('back to index');
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseClick over');
    });

    /**
     * @tc.name   testDriverTriggerPenKeyAirMouseDoubleClick
     * @tc.number SUB_testfwk_UITEST_DRIVER_TRIGGERPENKEY_PARAM_0700
     * @tc.desc   Test Driver.triggerPenKey with AIR_MOUSE mode, AIR_MOUSE key, DOUBLE_CLICK operation with point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTriggerPenKeyAirMouseDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let doubleBtn = await driver.findComponent(ON.text('Click twice'))
        if (doubleBtn == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          doubleBtn = await scroll.scrollSearch(ON.text('Click twice'))
        }
        let clickPoint = await doubleBtn.getBoundsCenter();
        await driver.triggerPenKey(PenKey.AIR_MOUSE, PenMode.AIR_MOUSE, PenKeyOperation.DOUBLE_CLICK, { point: clickPoint });
        await driver.delayMs(waitUiReadyMs)
        let newButton = await driver.findComponent(ON.text('doubleClick'))
        let text = await newButton.getText()
        expect(text).assertEqual('doubleClick')
      } catch (error) {
        hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick error: ' + error.code);
        expect(error.code).assertEqual(DeviceErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(0x0000, 'Driver_Api26', '%{public}s', TestTag + 'testDriverTriggerPenKeyAirMouseDoubleClick over');
    });
  })
}