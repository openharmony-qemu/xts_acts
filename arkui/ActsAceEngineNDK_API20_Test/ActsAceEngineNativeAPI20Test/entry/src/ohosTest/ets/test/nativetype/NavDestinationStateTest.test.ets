/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeEach, afterAll } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import { ON } from '@kit.TestKit';
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function NavDestinationStateTest() {
  describe('NavDestinationStateTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.pushPageNoClear("NativeType/NavDestination", done);
    })
    /**
     * @tc.number  : SUB_ArkUI_ACE_NavDestinationState_0100
     * @tc.name    : testArkUIACENavDestinationState0100
     * @tc.desc    : testing ArkUI_NavDestinationState enum.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACENavDestinationState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0100 start====");
          let com = await Utils.driver.findComponent(ON.id("goto"));
          await com.click();
          await Utils.sleep(100);
          await Utils.triggerKey(2);
          await Utils.sleep(100);
          let result: number = libnativetype.GetNavDestinationStateResult(0);
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0100 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_NavDestinationState_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_NavDestinationState_0200
     * @tc.name    : testArkUIACENavDestinationState0200
     * @tc.desc    : testing ArkUI_NavDestinationState enum.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACENavDestinationState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0200 start====");
          let com = await Utils.driver.findComponent(ON.id("goto"));
          await com.click();
          await Utils.sleep(100);
          await Utils.triggerKey(2);
          await Utils.sleep(100);
          let result: number = libnativetype.GetNavDestinationStateResult(1);
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0200 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_NavDestinationState_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_NavDestinationState_0300
     * @tc.name    : testArkUIACENavDestinationState0300
     * @tc.desc    : testing ArkUI_NavDestinationState enum.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACENavDestinationState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0300 start====");
          let com = await Utils.driver.findComponent(ON.id("goto"));
          await com.click();
          await Utils.sleep(100);
          await Utils.triggerKey(2);
          await Utils.sleep(100);
          let result: number = libnativetype.GetNavDestinationStateResult(2);
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0300 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_NavDestinationState_0300 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_NavDestinationState_0500
     * @tc.name    : testArkUIACENavDestinationState0500
     * @tc.desc    : testing ArkUI_NavDestinationState enum.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACENavDestinationState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0500 start====");
          let com = await Utils.driver.findComponent(ON.id("goto"));
          await com.click();
          await Utils.sleep(100);
          await Utils.triggerKey(2);
          await Utils.sleep(100);
          let result: number = libnativetype.GetNavDestinationStateResult(4);
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0500 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_NavDestinationState_0500 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_ACE_NavDestinationState_0900
     * @tc.name    : testArkUIACENavDestinationState0900
     * @tc.desc    : testing ArkUI_NavDestinationState enum.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testArkUIACENavDestinationState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0900 start====");
          let com = await Utils.driver.findComponent(ON.id("goto"));
          await com.click();
          await Utils.sleep(100);
          await Utils.triggerKey(2);
          await Utils.sleep(100);
          let result: number = libnativetype.GetNavDestinationStateResult(100);
          console.info("====>SUB_ArkUI_ACE_NavDestinationState_0900 result: " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_NavDestinationState_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
          done()
        }
      })
  })
}
