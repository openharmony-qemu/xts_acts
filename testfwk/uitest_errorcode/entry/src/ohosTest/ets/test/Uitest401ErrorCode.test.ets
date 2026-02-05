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

import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, Point, ComponentEventType, On, WindowChangeType } from '@ohos.UiTest'
import { startAbility, stopApplication } from './Utils.test.ets';

const TestTag = 'testTag';
const ErrorCode = 401;
const OldErrorCode = 5;
const NewErrorCode = 17000007;
const DeviceErrorCode = 801;

export default function abilityTest() {
  describe('uitest401', () => {
    let driver: Driver
    beforeAll(async (done: Function) => {
      driver = Driver.create()
      await driver.delayMs(1000)
      done()
    })

    /**
     * @tc.name   test_injectMultiPointerAction_401
     * @tc.number UiTest_uitest401_001
     * @tc.desc   injectMultiPointerAction 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_injectMultiPointerAction_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_injectMultiPointerAction_401 start`);
      try {
        await driver.injectMultiPointerAction(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.injectMultiPointerAction(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 pointers = [] error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100})
        await driver.injectMultiPointerAction(points, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_injectMultiPointerAction_401 speed = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_injectMultiPointerAction_401 END`);
    })

    /**
     * @tc.name   test_PointerMatrix_401
     * @tc.number UiTest_uitest401_002
     * @tc.desc   create 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_PointerMatrix_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PointerMatrix_401 start`);
      try {
        PointerMatrix.create(-1, 1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 fingers = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        PointerMatrix.create(1, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 steps = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(100, 1);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 fingers = 100 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1500);
        await driver.injectMultiPointerAction(points);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_PointerMatrix_401 steps = 1500 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_PointerMatrix_401 END`);
    })

    /**
     * @tc.name   test_setPoint_401
     * @tc.number UiTest_uitest401_003
     * @tc.desc   setPoint 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setPoint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_setPoint_401 start`);
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 finger = 1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 1, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 steps = 1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: -1, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: -1})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.y = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100, displayId: -1})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_setPoint_401 point.displayId = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_setPoint_401 END`);
    })
    /**
     * @tc.name   test_swipe_401
     * @tc.number UiTest_uitest401_008
     * @tc.desc   swipe 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_swipe_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_swipe_401 start`);
      try {
        await driver.swipe(-1, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 startx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, -1, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 starty = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, -1, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 endx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 endy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, 100, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_swipe_401 speed = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_swipe_401 END`);
    })
    /**
     * @tc.name   test_type_401
     * @tc.number UiTest_uitest401_009
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_type_401 start`);
      try {
        ON.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_type_401 type = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        ON.type(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, test_type_401 type = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, test_type_401 END`);
    })

    /**
     * @tc.name   testApi8_BY_text_5
     * @tc.number UiTest_uitest401_010
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_text_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_text_5 start`);
      try {
        BY.text(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_text_5 txt = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.text(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_text_5 txt = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_text_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_key_5
     * @tc.number UiTest_uitest401_011
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_key_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_key_5 start`);
      try {
        BY.key(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_key_5 key = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.key(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_key_5 key = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_text_5 END`);
    })    

    /**
     * @tc.name   testApi8_BY_id_5
     * @tc.number UiTest_uitest401_012
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_id_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_id_5 start`);
      try {
        BY.id(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_id_5 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.id(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_id_5 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_id_5 END`);
    })    

    /**
     * @tc.name   testApi8_BY_type_5
     * @tc.number UiTest_uitest401_013
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_type_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_type_5 start`);
      try {
        BY.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_type_5 tp = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.type(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_type_5 tp = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_type_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_isBefore_5
     * @tc.number UiTest_uitest401_014
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_isBefore_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_isBefore_5 start`);
      try {
        BY.isBefore(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isBefore_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.isBefore(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isBefore_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_isBefore_5 END`);
    })

    /**
     * @tc.name   testApi8_BY_isAfter_5
     * @tc.number UiTest_uitest401_015
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_BY_isAfter_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_BY_isAfter_5 start`);
      try {
        BY.isAfter(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isAfter_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        BY.isAfter(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_BY_isAfter_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_BY_isAfter_5 END`);
    })

    /**
     * @tc.name   testApi8_UiComponent_inputText_5
     * @tc.number UiTest_uitest401_016
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiComponent_inputText_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiComponent_inputText_5 start`);
      let driver = UiDriver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      try {
        let input = await driver.findComponent(ON.type('TextInput'))
        if (input == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          input = await scorll.scrollSearch(ON.type('TextInput'))
        }
        await input.inputText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_inputText_5 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        let input = await driver.findComponent(ON.type('TextInput'))
        if (input == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          input = await scorll.scrollSearch(ON.type('TextInput'))
        }
        await input.inputText(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_inputText_5 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiComponent_inputText_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiComponent_scrollSearch_5
     * @tc.number UiTest_uitest401_017
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiComponent_scrollSearch_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 start`);
      let driver = UiDriver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      try {
        let scroll = await driver.findComponent(ON.type('Scroll')) 
        await scroll.scrollSearch(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        let scroll = await driver.findComponent(ON.type('Scroll')) 
        await scroll.scrollSearch(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiComponent_scrollSearch_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_delayMs_5
     * @tc.number UiTest_uitest401_018
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_delayMs_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.delayMs(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.delayMs(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 d = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_findComponent_5
     * @tc.number UiTest_uitest401_019
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_findComponent_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.findComponent(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.findComponent(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_findComponents_5
     * @tc.number UiTest_uitest401_020
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_findComponents_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.findComponents(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.findComponents(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_assertComponentExist_5
     * @tc.number UiTest_uitest401_021
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_assertComponentExist_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.assertComponentExist(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.assertComponentExist(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_triggerKey_5
     * @tc.number UiTest_uitest401_022
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_triggerKey_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.triggerKey(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 keycode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.triggerKey(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 keycode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_click_5
     * @tc.number UiTest_uitest401_023
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_click_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_click_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.click(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.click(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }      
      try {
        await driver.click(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.click(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      console.log(`${TestTag}, testApi8_UiDriver_click_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_doubleClick_5
     * @tc.number UiTest_uitest401_024
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_doubleClick_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.doubleClick(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.doubleClick(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }      
      try {
        await driver.doubleClick(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.doubleClick(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_longClick_5
     * @tc.number UiTest_uitest401_025
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_longClick_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_longClick_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.longClick(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.longClick(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }      
      try {
        await driver.longClick(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.longClick(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      console.log(`${TestTag}, testApi8_UiDriver_longClick_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_swipe_5
     * @tc.number UiTest_uitest401_026
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_swipe_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_swipe_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.swipe(null, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 startx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(undefined, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 startx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }      
      try {
        await driver.swipe(100, null, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 starty = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.swipe(100, undefined, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 starty = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.swipe(100, 100, null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      } 
      try {
        await driver.swipe(100, 100, undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_swipe_5 END`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi8_UiDriver_savePath_401
     * @tc.number UiTest_uitest401_027
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_savePath_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_savePath_401 start`);
      let driver = UiDriver.create();
      try {
        await driver.savePath('');
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_savePath_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.savePath(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_savePath_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.savePath(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_savePath_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_savePath_401 END`);
      await stopApplication('com.uitestScene.acts');
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
      let driver = Driver.create();
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
        observer.once(null, WindowChangeType.WINDOE_ADDED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange type = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once(undefined, WindowChangeType.WINDOE_ADDED, {}, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange type = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOE_ADDED, null, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange options = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOE_ADDED, undefined, (elementInfo) => {})
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange options = undefined, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOE_ADDED, {}, null)
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_once_401 windowChange callback = null, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        observer.once('windowChange', WindowChangeType.WINDOE_ADDED, {}, undefined)
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
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testApi9_ON_text_401
     * @tc.number UiTest_uitest401_029
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_text_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_text_401 start`);
      try {
        ON.text(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_text_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.text(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_text_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_text_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_id_401
     * @tc.number UiTest_uitest401_030
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_id_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_id_401 start`);
      try {
        ON.id(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_id_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.id(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_id_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_id_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_type_401
     * @tc.number UiTest_uitest401_031
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_type_401 start`);
      try {
        ON.type(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_type_401 type = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.id(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_type_401 type = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_type_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_isBefore_401
     * @tc.number UiTest_uitest401_032
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_isBefore_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_isBefore_401 start`);
      try {
        ON.isBefore(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isBefore_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.isBefore(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isBefore_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_isBefore_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_isAfter_401
     * @tc.number UiTest_uitest401_033
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_isAfter_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_isAfter_401 start`);
      try {
        ON.isAfter(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isAfter_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.isAfter(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_isAfter_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_isAfter_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_within_401
     * @tc.number UiTest_uitest401_034
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_within_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_within_401 start`);
      try {
        ON.within(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_within_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.within(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_within_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_within_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_inWindow_401
     * @tc.number UiTest_uitest401_035
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_inWindow_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_inWindow_401 start`);
      try {
        ON.inWindow(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_inWindow_401 bundleName = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.inWindow(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_inWindow_401 bundleName = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_inWindow_401 END`);
    })

    /**
     * @tc.name   testApi9_ON_description_401
     * @tc.number UiTest_uitest401_036
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_ON_description_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_ON_description_401 start`);
      try {
        ON.description(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.description(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_ON_description_401 val = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_ON_description_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_description_401
     * @tc.number UiTest_uitest401_037
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_description_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_description_401 start`);
      try {
        ON.id(null, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_description_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.id(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_description_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_ON_description_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_type_401
     * @tc.number UiTest_uitest401_038
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_type_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_type_401 start`);
      try {
        ON.type(null, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.type(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_type_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_ON_type_401 END`);
    })

    /**
     * @tc.name   testApi18_ON_hint_401
     * @tc.number UiTest_uitest401_039
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_ON_hint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_ON_hint_401 start`);
      try {
        ON.hint(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 val = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.hint(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi18_ON_hint_401 val = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi18_ON_hint_401 END`);
    })
 
     /**
     * @tc.name   testApi20_ON_originalText_401
     * @tc.number UiTest_uitest401_040
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_ON_originalText_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_ON_originalText_401 start`);
      try {
        ON.originalText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        ON.originalText(undefined, MatchPattern.EQUALS);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_ON_originalText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi20_ON_originalText_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_inputText_401
     * @tc.number UiTest_uitest401_041
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_inputText_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_inputText_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.inputText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.inputText(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_inputText_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_inputTextMode_401
     * @tc.number UiTest_uitest401_042
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_inputTextMode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_inputTextMode_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()      
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.inputText(null, {paste: false});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputTextMode_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.inputText(undefined, {addition: false});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputTextMode_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_inputTextMode_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_scrollToTop_401
     * @tc.number UiTest_uitest401_043
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollToTop_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_inputTextMode_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToTop(null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = null error, ${JSON.stringify(error)}`);
         expect().assertFail();
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToTop(undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = undefined error, ${JSON.stringify(error)}`);
         expect().assertFail();
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToTop(-1);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollToTop_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_scrollToBottom_401
     * @tc.number UiTest_uitest401_044
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollToBottom_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToBottom(null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 text = null error, ${JSON.stringify(error)}`);
         expect().assertFail();
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToBottom(undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 text = undefined error, ${JSON.stringify(error)}`);
         expect().assertFail();
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollToBottom(-1);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 text = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_dragTo_401
     * @tc.number UiTest_uitest401_045
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_dragTo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_dragTo_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.dragTo(null);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_dragTo_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.dragTo(undefined);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_dragTo_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_dragTo_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_pinchOut_401
     * @tc.number UiTest_uitest401_046
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_pinchOut_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_pinchOut_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.pinchOut(null);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.pinchOut(undefined);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_pinchOut_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_pinchIn_401
     * @tc.number UiTest_uitest401_047
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_pinchIn_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_pinchIn_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.pinchIn(null);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchIn_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.pinchIn(undefined);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchIn_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_pinchIn_401 END`);
    })

     /**
     * @tc.name   testApi9_Component_scrollSearch_401
     * @tc.number UiTest_uitest401_048
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollSearch_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create()
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollSearch(null, false, 100);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollSearch(undefined, false, 100);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollSearch(ON.text('next page'), false, null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = null error, ${JSON.stringify(error)}`);
         expect().assertFail(); 
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollSearch(ON.text('next page'), false, undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = undefined error, ${JSON.stringify(error)}`);
         expect().assertFail(); 
      } 
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))        
        await input1.scrollSearch(ON.text('next page'), false, -1);
         expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 END`);
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
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 start`);
      let driver = Driver.create()
      try {
        driver.delayMs(null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.delayMs(undefined)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.delayMs(-1)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_delayMs_401 dur = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 END`);
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
      let driver = Driver.create()
      try {
        driver.findComponent(null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponent_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.findComponent(undefined)
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
      let driver = Driver.create()
      try {
        driver.findWindow(null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findWindow_401 filter = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.findWindow(undefined)
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
      let driver = Driver.create()
      try {
        driver.waitForComponent(null, 500)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.waitForComponent(undefined, 500)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForComponent(ON.text('next page'), null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 time = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForComponent(ON.text('next page'), undefined)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForComponent_401 time = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForComponent(ON.text('next page'), -1)
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
      let driver = Driver.create()
      try {
        driver.findComponents(null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_findComponents_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.findComponents(undefined)
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
      let driver = Driver.create()
      try {
        driver.assertComponentExist(null)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_assertComponentExist_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.assertComponentExist(undefined)
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
      let driver = Driver.create()
      try {
        driver.pressBack(null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      } 
      try {
        driver.pressBack(undefined)     
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      } 
      try {
        driver.pressBack(-1)
        expect().assertFail();        
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      console.log(`${TestTag}, testApi20_Driver_pressBack_17000007 END`);
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
      let driver = Driver.create()
      try {
        driver.triggerKey(null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerKey_401 id = null error, ${JSON.stringify(error)}`);
         
      } 
      try {
        driver.triggerKey(undefined)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerKey_401 id = undefined error, ${JSON.stringify(error)}`);
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
      let driver = Driver.create()
      try {
        driver.triggerKey(null, 0)
        expect().assertFail();               
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      } 
      try {
        driver.triggerKey(undefined, 0)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      } 
      try {
        driver.triggerKey(0, null)     
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      } 
      try {
        driver.triggerKey(0, undefined)     
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerKey_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerKey(0, -1)     
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
      let driver = Driver.create()
      try {
        driver.triggerCombineKeys(null, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.triggerCombineKeys(undefined, 0)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      } 
      try {
        driver.triggerCombineKeys(-1, 0)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      }
      try {
        driver.triggerCombineKeys(0, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = null error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = undefined error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 kecode1 = -1 error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_triggerCombineKeys_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, -1)       
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
      let driver = Driver.create()
      try {
        driver.triggerCombineKeys(null, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.triggerCombineKeys(undefined, 0, 0, 0)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      } 
      try {
        driver.triggerCombineKeys(-1, 0, 0, 0)     
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode); 
      }
      try {
        driver.triggerCombineKeys(0, null, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = null error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, undefined, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = undefined error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, -1, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode1 = -1 error, ${JSON.stringify(error)}`);
       expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, 0, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, -1, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 kecode2 = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.triggerCombineKeys(0, 0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_triggerCombineKeys_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail(); 
      }
      try {
        driver.triggerCombineKeys(0, 0, 0, -1)       
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
      let driver = Driver.create()
      try {
        driver.click(null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.click(undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.click(-1, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.click(100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.click(100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_click_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.click(100, -1)       
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
      let driver = Driver.create()
      try {
        driver.doubleClick(null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.doubleClick(undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.doubleClick(-1, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.doubleClick(100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.doubleClick(100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_doubleClick_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.doubleClick(100, -1)       
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
      let driver = Driver.create()
      try {
        driver.longClick(null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.longClick(undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.longClick(-1, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 x = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.longClick(100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.longClick(100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_longClick_401 y = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.longClick(100, -1)       
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
      let driver = Driver.create()
      try {
        driver.swipe(null, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.swipe(undefined, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(-1, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, null, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, undefined, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, -1, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, null, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, undefined, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, -1, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ex = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, 100, null, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, 100, undefined, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, 100, -1, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 ey = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, 100, 100, -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.swipe(100, 100, 100, 100, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_swipe_401 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.swipe(100, 100, 100, 100, undefined)       
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
      let driver = Driver.create()
      try {
        driver.drag(null, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.drag(undefined, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(-1, 100, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sx = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, null, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, undefined, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, -1, 100, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sy = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, null, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, undefined, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, -1, 100, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ex = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, 100, null, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, 100, undefined, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, 100, -1, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 ey = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, 100, 100, -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.drag(100, 100, 100, 100, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.drag(100, 100, 100, 100, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_drag_401 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi9_Driver_drag_401 END`);
    })

     /**
     * @tc.name   testApi9_Driver_longClickAt_17000007
     * @tc.number UiTest_uitest401_065
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Driver_longClickAt_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 start`);
      let driver = Driver.create()
      try {
        driver.longClickAt(null, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.longClickAt(undefined, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.longClickAt({x: 100, y: 100}, -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 dur = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.longClickAt({x: 100, y: 100}, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_longClickAt_17000007 dur = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.longClickAt({x: 100, y: 100}, undefined)       
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
      let driver = Driver.create()
      try {
        driver.swipeBetween(null, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.swipeBetween(undefined, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.swipeBetween({x: 100, y: 100}, null , 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.swipeBetween({x: 100, y: 100}, undefined , 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.swipeBetween({x: 100, y: 100}, {x: 100, y: 100} , -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.swipeBetween({x: 100, y: 100}, {x: 100, y: 100} , null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.swipeBetween({x: 100, y: 100}, {x: 100, y: 100} , undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_swipeBetween_17000007 sp = undefined error, ${JSON.stringify(error)}`);
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
      let driver = Driver.create()
      try {
        driver.dragBetween(null, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.dragBetween(undefined, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.dragBetween({x: 100, y: 100}, null , 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.dragBetween({x: 100, y: 100}, undefined , 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100} , -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100} , null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.dragBetween({x: 100, y: 100}, {x: 100, y: 100} , undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_dragBetween_17000007 sp = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.screenCap(null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_screenCap_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.screenCap(undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_screenCap_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.screenCap('')       
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
      let driver = Driver.create()
      try {
        driver.screenCap(null, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.screenCap(undefined, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.screenCap('', 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/1.png'        
        driver.screenCap(savePath, -1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 id = -1, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/2.png'        
        driver.screenCap(savePath, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_screenCap_401 id = null, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let savePath = '/data/storage/el2/base/cache/3.png'        
        driver.screenCap(savePath, undefined)       
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
      let driver = Driver.create()
      try {
        driver.getDisplayRotation(-1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.getDisplayRotation(null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayRotation_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.getDisplayRotation(undefined)       
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
      let driver = Driver.create()
      try {
        driver.getDisplaySize(-1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.getDisplaySize(null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplaySize_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.getDisplaySize(undefined)       
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
      let driver = Driver.create()
      try {
        driver.getDisplayDensity(-1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.getDisplayDensity(null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_getDisplayDensity_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.getDisplayDensity(undefined)       
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
      let driver = Driver.create()
      try {
        driver.pressHome(-1)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      } 
      try {
        driver.pressHome(null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_pressHome_17000007 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.pressHome(undefined)       
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
      let driver = Driver.create()
      try {
        driver.waitForIdle(null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.waitForIdle(undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForIdle(-1, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 id = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForIdle(100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 time = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForIdle(100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_waitForIdle_401 time = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.waitForIdle(100, -1)       
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
      let driver = Driver.create()
      try {
        driver.fling(null, {x: 100, y: 100}, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.fling(undefined, {x: 100, y: 100}, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, null, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, undefined, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, 100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, 100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_fling_401 END`);
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
      let driver = Driver.create()
      try {
        driver.fling(null, {x: 100, y: 100}, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      } 
      try {
        driver.fling(undefined, {x: 100, y: 100}, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, null, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, undefined, 100, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, null, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, undefined, 100)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 ste = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, 100, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling({x: 100, y: 100}, {x: 100, y: 100}, 100, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 spe = undefined error, ${JSON.stringify(error)}`);
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
      let driver = Driver.create()
      try {
        driver.injectMultiPointerAction(null, 500)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 points = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.injectMultiPointerAction(undefined, 500)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 points = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})             
        driver.injectMultiPointerAction(points, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})             
        driver.injectMultiPointerAction(points, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi9_Driver_injectMultiPointerAction_401 END`);
    })

     /**
     * @tc.name   testApi9_Driver_fling_401
     * @tc.number UiTest_uitest401_077
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Driver_fling_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Driver_fling_401 start`);
      let driver = Driver.create()
      try {
        driver.fling(UiDirection.DOWN, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 dir = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling(UiDirection.DOWN, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Driver_fling_401 dir = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_Driver_fling_401 END`);
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
      let driver = Driver.create()
      try {
        driver.fling(UiDirection.DOWN, null, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling(UiDirection.DOWN, undefined, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.fling(UiDirection.DOWN, 500, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 id = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.fling(UiDirection.DOWN, 500, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_fling_401 id = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseClick(null, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseClick(undefined, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseClick({x: 100, y: 100}, null, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 btn = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseClick({x: 100, y: 100}, undefined, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 btn = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseClick({x: 100, y: 100}, 0, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseClick({x: 100, y: 100}, 0, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseClick({x: 100, y: 100}, 0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseClick({x: 100, y: 100}, 0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseMoveTo(null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseMoveTo_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseMoveTo(undefined)       
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
      let driver = Driver.create()
      try {
        driver.mouseScroll(null, true, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll(undefined, false, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, null, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, null, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi10_Driver_mouseScroll_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseScroll(null, true, 0, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll(undefined, false, 0, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, null, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, undefined, 0, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, null, 0, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, undefined, 0, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseScroll({x: 100, y: 100}, false, 0, 0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseScroll_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.screenCapture('', {left: 100, right: 100, top: 100, bottom: 100})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.screenCapture(null, {left: 100, right: 100, top: 100, bottom: 100})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.screenCapture(undefined, {left: 100, right: 100, top: 100, bottom: 100})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let savePath = '/data/storage/el2/base/cache/screenCapture_401.png'        
        driver.screenCapture(savePath, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_screenCapture_401 rect = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let savePath = '/data/storage/el2/base/cache/screenCapture_402.png'        
        driver.screenCapture(savePath, undefined)       
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
      let driver = Driver.create()
      try {
        driver.mouseDoubleClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDoubleClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDoubleClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDoubleClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDoubleClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDoubleClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDoubleClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseLongClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseLongClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, null, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, undefined, 0)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseLongClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseLongClick(null, MouseButton.MOUSE_BUTTON_MIDDLE, 0, 0, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseLongClick(undefined, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_MIDDLE, null, 0, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key1 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_LEFT, undefined, 0, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key1 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_LEFT, 0, null, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key2 = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, undefined, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 key2 = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseLongClick_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseLongClick({x: 100, y: 100}, MouseButton.MOUSE_BUTTON_RIGHT, 0, 0, 500)       
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
      let driver = Driver.create()
      try {
        driver.mouseMoveWithTrack(null, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseMoveWithTrack(undefined, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseMoveWithTrack({x: 100, y: 100}, null, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseMoveWithTrack({x: 100, y: 100}, undefined, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseMoveWithTrack({x: 100, y: 100}, {x: 100, y: 100}, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseMoveWithTrack({x: 100, y: 100}, {x: 100, y: 100}, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseMoveWithTrack_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseDrag(null, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag(undefined, {x: 100, y: 100}, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, null, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, undefined, 600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_mouseDrag_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
      try {
        driver.mouseDrag(null, {x: 100, y: 100}, 600, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 from = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag(undefined, {x: 100, y: 100}, 600, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 from = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, null, 600, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 to = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, undefined, 600, 1600)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 to = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, null, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, undefined, 1600)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, 500, null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, 500, undefined)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.mouseDrag({x: 100, y: 100}, {x: 100, y: 100}, 500, 1599)
        expect().assertFail();               
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_mouseDrag_401 dur = 1599 error, ${JSON.stringify(error)}`);
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
      let driver = Driver.create()
      try {
        driver.inputText(null, 'hello')       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText(undefined, 'hello')       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, null)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, undefined)       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi11_Driver_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, '')       
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
      let driver = Driver.create()
      try {
        driver.inputText(null, 'hello', {addition: false})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 point = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText(undefined, 'hello', {addition: false})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 point = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, null, {addition: false})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, undefined, {addition: false})       
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        driver.inputText({x: 100, y: 100}, '', {addition: false})       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 text = '' error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.inputText({x: 100, y: 100}, 'Hello', null)       
      } catch (error) {
        console.log(`${TestTag}, testApi20_Driver_inputText_401 model = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        driver.inputText({x: 100, y: 100}, 'Hello', undefined)       
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
      let driver = Driver.create()
      try {
        await driver.touchPadMultiFingerSwipe(null, UiDirection.Right);
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_touchPadMultiFingerSwipe_401, error is, ${JSON.stringify(error)}`);
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
      let driver = Driver.create()
      try {
        await driver.penLongClick({x: 100, y: 100}, null);
        console.log(TestTag, `testApi18_Driver_penLongClick_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penLongClick_401, p = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penLongClick({x: 100, y: 100}, undefined);
        console.log(TestTag, `testApi18_Driver_penLongClick_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penLongClick_401, p = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
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
      let driver = Driver.create()
      try {
        await driver.penSwipe(null, {x: 100, y: 100}, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe(undefined, {x: 100, y: 100}, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, null, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, ep = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, undefined, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, ep = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 100}, null, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 100}, undefined, 0.5);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, sp = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 100}, 600, null);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 100}, 600, undefined);
        console.log(TestTag, `testApi18_Driver_penSwipe_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_penSwipe_401, pre = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_Driver_penSwipe_401 END`);
    })

     /**
     * @tc.name   testApi18_Driver_injectPenPointAction_401
     * @tc.number UiTest_uitest401_095
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi18_Driver_injectPenPointAction_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi18_Driver_injectPenPointAction_401 start`);
      let driver = Driver.create()
      try {
        await driver.injectPenPointAction(null, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, points = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.injectPenPointAction(undefined, 600, 0.5);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, points = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})       
        await driver.injectPenPointAction(points, null, 0.5);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, spe = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})       
        await driver.injectPenPointAction(points, undefined, 0.5);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, spe = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})       
        await driver.injectPenPointAction(points, 600, null);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, pre = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(1, 0, {x: 100, y: 100})       
        await driver.injectPenPointAction(points, 600, undefined);
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401`);
      } catch (error) {
        console.log(TestTag, `testApi18_Driver_injectPenPointAction_401, pre = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.log(`${TestTag}, testApi18_Driver_injectPenPointAction_401 END`);
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
      let driver = Driver.create()
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
      let driver = Driver.create()
      try {
        await driver.isComponentPresentWhenLongClick(null, {x: 100, y: 100}, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, ON = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenLongClick(undefined, {x: 100, y: 100}, 1600);
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
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), {x: 100, y: 100}, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, spe = null error is, ${JSON.stringify(error)}`);
       expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenLongClick(ON.text('next page'), {x: 100, y: 100}, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenLongClick_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
       expect().assertFail();
      }
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenLongClick_17000007 END`);
    })

     /**
     * @tc.name   testApi20_Driver_isComponentPresentWhenDrag_17000007
     * @tc.number UiTest_uitest401_098
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi22_Driver_isComponentPresentWhenDrag_17000007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi22_Driver_isComponentPresentWhenDrag_17000007 start`);
      let driver = Driver.create()
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, null, 600, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, to = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, undefined, 600, 1600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, to = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, {x: 200, y: 200}, null, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = null error is, ${JSON.stringify(error)}`);
         expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, {x: 200, y: 200}, undefined, 1600);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, sp = undefined error is, ${JSON.stringify(error)}`);
         expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, {x: 200, y: 200}, 600, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, dur = null error is, ${JSON.stringify(error)}`);
         expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenDrag(ON.text('next page'), {x: 100, y: 100}, {x: 200, y: 200}, 600, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenDrag_17000007, dur = undefined error is, ${JSON.stringify(error)}`);
         expect().assertFail();
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
      let driver = Driver.create()
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), {x: 100, y: 100}, null, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, to = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), {x: 100, y: 100}, undefined, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, to = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), {x: 100, y: 100}, {x: 100, y: 100}, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = null error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.isComponentPresentWhenSwipe(ON.text('next page'), {x: 100, y: 100}, {x: 100, y: 100}, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_isComponentPresentWhenSwipe_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
        expect().assertFail();
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
      let driver = Driver.create()
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
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, null, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, d = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, undefined, 600);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, d = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, 50, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        await driver.touchPadTwoFingersScroll({x: 100, y: 100}, UiDirection.UP, 50, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_touchPadTwoFingersScroll_17000007, spe = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
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
      let driver = Driver.create()
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
        await driver.knuckleKnock([{x: 100, y: 100}], null);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, time = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
      }
      try {
        await driver.knuckleKnock([{x: 100, y: 100}], undefined);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_knuckleKnock_17000007, time = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(NewErrorCode);
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
      let driver = Driver.create()
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100})                
        await driver.injectKnucklePointerAction(points, null);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, {x: 100, y: 100})                
        await driver.injectKnucklePointerAction(points, undefined);
      } catch (error) {
        console.log(TestTag, `testApi22_Driver_injectKnucklePointerAction_17000005, spe = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(17000005);
      }
      console.log(`${TestTag}, testApi22_Driver_injectKnucklePointerAction_17000005 END`);
    })

     /**
     * @tc.name   testApi9_UiWindow_moveTo_401
     * @tc.number UiTest_uitest401_0102
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_moveTo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_UiWindow_moveTo_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, x = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, x = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, y = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, y = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testApi9_UiWindow_moveTo_401 END`);
    })

     /**
     * @tc.name   testApi9_UiWindow_resize_401
     * @tc.number UiTest_uitest401_0103
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_resize_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_UiWindow_resize_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(null, 100, ResizeDirection.UP)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, width = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(undefined, 100, ResizeDirection.DOWN)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, width = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(100, null, ResizeDirection.LEFT)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, height = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(100, undefined, ResizeDirection.RIGHT)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, height = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testApi9_UiWindow_resize_401 END`);
    })

     /**
     * @tc.name   testApi9_PointerMatrix_create_401
     * @tc.number UiTest_uitest401_0104
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_PointerMatrix_create_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_PointerMatrix_create_401 start`);
      try {
        let points = PointerMatrix.create(null, 1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, finger = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(undefined, 1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, finger = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, null);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, step = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, step = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_PointerMatrix_create_401 END`);
    })

     /**
     * @tc.name   testApi9_PointerMatrix_setPoint_401
     * @tc.number UiTest_uitest401_0105
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_PointerMatrix_setPoint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_PointerMatrix_setPoint_401 start`);
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(null, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, finger = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(undefined, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, finger = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, null, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, step = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, undefined, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, step = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, null)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, point = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, point = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_PointerMatrix_setPoint_401 END`);
    })
  })
}