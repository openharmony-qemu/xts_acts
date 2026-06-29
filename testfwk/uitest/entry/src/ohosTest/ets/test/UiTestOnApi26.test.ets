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

import { describe, it, expect, TestType, Level, Size, beforeAll, beforeEach, afterAll } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit'
import { startAbility, stopApplication } from './Util.test'

const waitUiReadyMs: number = 1000;
const TestTag = 'UiTest_TAG';
const ParameterErrorCode = 17000007;

export default function uitestOnApi26Test() {
  describe('UitestOnApi26Test', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create()
      await driver.delayMs(1000)
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    afterAll(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testOnBeforeComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_BEFORECOMPONENT_COMPONENT_PARAM_0100
     * @tc.desc   Test On.beforeComponent(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnBeforeComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnBeforeComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('dialog'));
      let text = await driver.findComponent(ON.text('toast').beforeComponent(text2));
      let msg = await text.getText();
      expect(msg).assertEqual('toast')
      let text3 = await driver.findComponent(ON.text('toastNot').beforeComponent(text2));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnBeforeComponentValid over');
    });

    /**
     * @tc.name   testOnBeforeComponentInvalid
     * @tc.number SUB_testfwk_UITEST_ON_BEFORECOMPONENT_COMPONENT_PARAM_0200
     * @tc.desc   Test On.beforeComponent(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnBeforeComponentInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnBeforeComponentInvalid start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let text2 = await driver.findComponent(ON.text('dialog'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        ON.beforeComponent(text2);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnBeforeComponentInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnBeforeComponentInvalid over`);
    });

    /**
     * @tc.name   testOnAfterComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_AFTERCOMPONENT_COMPONENT_PARAM_0300
     * @tc.desc   Test On.afterComponent(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnAfterComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnAfterComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let text2 = await driver.findComponent(ON.text('toast'));
      let text = await driver.findComponent(ON.text('dialog').afterComponent(text2));
      let msg = await text.getText();
      expect(msg).assertEqual('dialog')
      let text3 = await driver.findComponent(ON.text('dialogNot').afterComponent(text2));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnAfterComponentValid over');
    });

    /**
     * @tc.name   testOnAfterComponentInvalid
     * @tc.number SUB_testfwk_UITEST_ON_AFTERCOMPONENT_COMPONENT_PARAM_0400
     * @tc.desc   Test On.afterComponent(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnAfterComponentInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnAfterComponentInvalid start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let text2 = await driver.findComponent(ON.text('dialog'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        ON.afterComponent(text2);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnAfterComponentInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnAfterComponentInvalid over`);
    });

    /**
     * @tc.name   testOnWithinComponentValid
     * @tc.number SUB_testfwk_UITEST_ON_WITHINCOMPONENT_PARAM_0500
     * @tc.desc   Test On.withinComponent(com: Component) with valid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(TestTag + 'testOnWithinComponentValid start');
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let scroller = await driver.findComponent(ON.type('Scroll'));
      let text = await driver.findComponent(ON.withinComponent(scroller).text('next page'));
      let msg = await text.getText();
      expect(msg).assertEqual('next page')
      let text3 = await driver.findComponent(ON.withinComponent(scroller).text('next pageNot'));
      expect(text3).assertNull();
      await stopApplication('com.uitestScene.acts');
      console.info(TestTag + 'testOnWithinComponentValid over');
    });

    /**
     * @tc.name   testOnWithinComponentInvalid
     * @tc.number SUB_testfwk_UITEST_ON_WITHINCOMPONENT_PARAM_0600
     * @tc.desc   Test On.withinComponent(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnWithinComponentInvalid start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let scroller = await driver.findComponent(ON.type('Scroll'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        ON.withinComponent(scroller)
        expect().assertFail();
      } catch (error) {
        console.info(`testOnWithinComponentInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnWithinComponentInvalid over`);
    });
  })
}