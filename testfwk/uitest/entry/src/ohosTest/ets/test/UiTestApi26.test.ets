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
import { Driver, ON, TouchOptions, } from '@kit.TestKit'
import { display } from '@kit.ArkUI';
import { startAbility, stopApplication } from './Util.test';

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';

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
     * @tc.name   testDriverClickAtDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0100
     * @tc.desc   Test clickAt with point parameter (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtDefault start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index');
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtDefault over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0200
     * @tc.desc   Test clickAt with options={} (empty object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      let promiseResult = await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(promiseResult).assertNull();
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverClickAtBoundaryPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_BOUNDARY_0300
     * @tc.desc   Test clickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverClickAtBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverClickAtBoundaryPressureMin end`);
    });


    /**
     * @tc.name   testDriverClickAtPressureMax
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0400
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 1.0, maximum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressureMax start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1.0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressureMax over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0500
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressure start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressure over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0600
     * @tc.desc   Test clickAt with point and pressure parameter (pressure = 0.0, minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtPressureMin start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.0 };
      await driver.clickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtPressureMin over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0700
     * @tc.desc   Test clickAt with point parameter (options = null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtNullOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtNullOptions over');
      await stopApplication('com.uitestScene.acts');
    });

    /**
     * @tc.name   testDriverClickAtUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_CLICKAT_PARAM_0800
     * @tc.desc   Test clickAt with point parameter (options = undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverClickAtUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testDriverClickAtUndefinedOptions start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.clickAt(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('back to index'))
      let text = await newButton.getText()
      expect(text).assertEqual('back to index')
      await newButton.click()
      console.log(TestTag, 'testDriverClickAtUndefinedOptions over');
    });

    /**
     * @tc.name   testDriverLongClickAtDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_0900
     * @tc.desc   Test longClickAt with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDefault end`);
    });

    /**
     * @tc.name   testDriverLongClickAtEmptyOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1000
     * @tc.desc   Test longClickAt with empty TouchOptions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtEmptyOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtEmptyOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = {};
      let promiseResult = await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      expect(promiseResult).assertNull();
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtEmptyOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtDurationMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1100
     * @tc.desc   Test longClickAt with duration=1500 (minimum value)
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
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDurationMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1200
     * @tc.desc   Test longClickAt with pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0.5 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtDurationAndPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1300
     * @tc.desc   Test longClickAt with duration=3000 and pressure=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtDurationAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtDurationAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { duration: 3000, pressure: 0.5 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtDurationAndPressure end`);
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMin
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1400
     * @tc.desc   Test longClickAt with pressure=0 (minimum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMin start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 0 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMin end`);
    });

    /**
     * @tc.name   testDriverLongClickAtBoundaryPressureMax
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_BOUNDARY_1500
     * @tc.desc   Test longClickAt with pressure=1 (maximum boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtBoundaryPressureMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMax start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      const options: TouchOptions = { pressure: 1 };
      await driver.longClickAt(center, options)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtBoundaryPressureMax end`);
    });

    /**
     * @tc.name   testDriverLongClickAtNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1600
     * @tc.desc   Test longClickAt with options=null (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center, null)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtNullOptions end`);
    });

    /**
     * @tc.name   testDriverLongClickAtUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_LONGCLICKAT_PARAM_1700
     * @tc.desc   Test longClickAt with options=undefined (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverLongClickAtUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testDriverLongClickAtUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('next page'))
      let center = await button.getBoundsCenter()
      await driver.longClickAt(center, undefined)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(ON.text('longClick'))
      let text = await newButton.getText()
      expect(text).assertEqual('longClick')
      await newButton.click()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testDriverLongClickAtUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenDefault
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1800
     * @tc.desc   Test swipeBetween with default parameters (no options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenDefault start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenDefault disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id })
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenDefault end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeed
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_1900
     * @tc.desc   Test swipeBetween with speed option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeed end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2000
     * @tc.desc   Test swipeBetween with pressure option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0.5 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithSpeedAndPressure
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2100
     * @tc.desc   Test swipeBetween with both speed and pressure options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithSpeedAndPressure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 2000, pressure: 0.5 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithSpeedAndPressure end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenReturnVoid
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_RETURN_2200
     * @tc.desc   Test swipeBetween returns Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenReturnVoid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenReturnVoid start`);
      let result: void = await driver.swipeBetween({x: 100, y: 100, displayId: 0},
        { x: 200, y: 200, displayId: 0}, {speed: 600})
      expect(result).assertNull()
      await driver.delayMs(waitUiReadyMs)
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenReturnVoid end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenNullOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2300
     * @tc.desc   Test swipeBetween with null options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenNullOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, null)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenNullOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenUndefinedOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2400
     * @tc.desc   Test swipeBetween with undefined options (default TouchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenUndefinedOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, undefined)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenUndefinedOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenWithEmptyObjectOptions
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_PARAM_2500
     * @tc.desc   Test swipeBetween with empty object options {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithEmptyObjectOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = {} as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithEmptyObjectOptions end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2600
     * @tc.desc   Test swipeBetween with speed at minimum boundary (200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenSpeedMaxBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2700
     * @tc.desc   Test swipeBetween with speed at maximum boundary (40000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenSpeedMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 40000 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenSpeedMaxBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMinBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2800
     * @tc.desc   Test swipeBetween with pressure at minimum boundary (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 0 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMinBoundary end`);
    });

    /**
     * @tc.name   testDriverSwipeBetweenPressureMaxBoundary
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_2900
     * @tc.desc   Test swipeBetween with pressure at maximum boundary (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenPressureMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { pressure: 1 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenPressureMaxBoundary end`);
    });


    /**
     * @tc.name   testDriverSwipeBetweenWithAllBoundaryValues
     * @tc.number SUB_testfwk_UITEST_DRIVER_SWIPEBETWEEN_BOUNDARY_3000
     * @tc.desc   Test swipeBetween with all properties at boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSwipeBetweenWithAllBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let disPlay = await display.getDefaultDisplay();
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues disPlay is: ${JSON.stringify(disPlay)}`);
      let scoll = await driver.findComponent(ON.type('Scroll'))
      let rect = await scoll.getBounds()
      let center = await scoll.getBoundsCenter()
      let options = { speed: 200, pressure: 1 } as TouchOptions
      await driver.swipeBetween({
        x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4)
      , displayId: disPlay.id
      },
        { x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4), displayId: disPlay.id }, options)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(ON.text('toast'))
      expect(text).assertNull();
      await stopApplication('com.uitestScene.acts')
      console.info(`${TestTag}, testDriverSwipeBetweenWithAllBoundaryValues end`);
    });

  })
}