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

import { describe, it, expect, TestType, Level, Size, beforeAll } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'

const ParameterErrorCode = 17000007;

export default function uitestOnApi26Test() {
  describe('UitestOnApi26ErrorCodeTest', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create()
      await driver.delayMs(1000)
    })

    /**
     * @tc.name   testOnIsBeforeComponentNullInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0100
     * @tc.desc   Test On.isBefore(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsBeforeComponentNullInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnIsBeforeComponentNullInvalid start`);
      try {
        ON.beforeComponent(null);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnIsBeforeComponentNullInvalid,error.code, ${JSON.stringify(error)}`);
        console.info(`testOnIsBeforeComponentNullInvalid,error.message, ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
        expect(error.message).assertContain('Check arg0 failed');
      }
      console.info(`testOnIsBeforeComponentNullInvalid over`);
    });

    /**
     * @tc.name   testOnIsBeforeComponentUndefinedInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0200
     * @tc.desc   Test On.isBefore(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsBeforeComponentUndefinedInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnIsBeforeComponentUndefinedInvalid start`);
      try {
        ON.beforeComponent(undefined);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnIsBeforeComponentUndefinedInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnIsBeforeComponentUndefinedInvalid over`);
    });

    /**
     * @tc.name   testOnIsAfterComponentNullInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0300
     * @tc.desc   Test On.isAfter(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsAfterComponentNullInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnIsAfterComponentNullInvalid start`);
      try {
        ON.afterComponent(null);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnIsAfterComponentNullInvalid,error.code, ${JSON.stringify(error)}`);
        console.info(`testOnIsAfterComponentNullInvalid,error.message, ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
        expect(error.message).assertContain('Check arg0 failed');
      }
      console.info(`testOnIsAfterComponentNullInvalid over`);
    });

    /**
     * @tc.name   testOnIsAfterComponentUndefinedInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0400
     * @tc.desc   Test On.isAfter(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIsAfterComponentUndefinedInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnIsAfterComponentUndefinedInvalid start`);
      try {
        ON.afterComponent(undefined);
        expect().assertFail();
      } catch (error) {
        console.info(`testOnIsAfterComponentUndefinedInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnIsAfterComponentUndefinedInvalid over`);
    });

    /**
     * @tc.name   testOnWithinComponentNullInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0500
     * @tc.desc   Test On.isAfter(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentNullInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnWithinComponentNullInvalid start`);
      try {
        ON.withinComponent(null)
        expect().assertFail();
      } catch (error) {
        console.info(`testOnWithinComponentNullInvalid,error.code, ${JSON.stringify(error)}`);
        console.info(`testOnWithinComponentNullInvalid,error.message, ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
        expect(error.message).assertContain('Check arg0 failed');
      }
      console.info(`testOnWithinComponentNullInvalid over`);
    });

    /**
     * @tc.name   testOnWithinComponentUndefinedInvalid
     * @tc.number SUB_testfwk_UITEST_ON_ISBEFORE_COMPONENT_PARAM_0600
     * @tc.desc   Test On.isAfter(com: Component) with invalid Component parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWithinComponentUndefinedInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.info(`testOnWithinComponentUndefinedInvalid start`);
      try {
        ON.withinComponent(undefined)
        expect().assertFail();
      } catch (error) {
        console.info(`testOnWithinComponentUndefinedInvalid,error.code, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.info(`testOnWithinComponentUndefinedInvalid over`);
    });

  })
}