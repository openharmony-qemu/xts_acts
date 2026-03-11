/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import appRecovery from "@ohos.app.ability.appRecovery";


export default function AppRecoveryTest() {
  describe('AppRecoveryTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testapprecovery_0001
     * @tc.number SUB_DFX_DFR_AppRecovery_Ets_0001
     * @tc.desc   验证appRecovery.enableAppRecovery()，第1个参数未覆盖枚举:['RESTART_WHEN_JS_CRASH', 'RESTART_WHEN_APP_FREEZE', 'NO_RESTART']；
     * 第2个参数未覆盖枚举:['SAVE_WHEN_BACKGROUND']；
     * 第3个参数未覆盖枚举:['SAVE_WITH_SHARED_MEMORY']；
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testapprecovery_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testapprecovery_0001 start");
      try{
        appRecovery.enableAppRecovery(
          appRecovery.RestartFlag.RESTART_WHEN_JS_CRASH,
          appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND,
          appRecovery.SaveModeFlag.SAVE_WITH_SHARED_MEMORY);
        console.info("====> testapprecovery_0001 RESTART_WHEN_JS_CRASH end 01");

        appRecovery.enableAppRecovery(
          appRecovery.RestartFlag.RESTART_WHEN_APP_FREEZE,
          appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND,
          appRecovery.SaveModeFlag.SAVE_WITH_SHARED_MEMORY);
        console.info("====> testapprecovery_0001 RESTART_WHEN_APP_FREEZE end 02");

        appRecovery.enableAppRecovery(
          appRecovery.RestartFlag.NO_RESTART,
          appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND,
          appRecovery.SaveModeFlag.SAVE_WITH_SHARED_MEMORY);
        console.info("====> testapprecovery_0001 NO_RESTART end 03");
        done();
      }catch(err){
        console.error(`====>testapprecovery_0001 NO_RESTART catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testapprecovery_0001 end");
    })

    /**
     * @tc.name   testapprecovery_0002
     * @tc.number SUB_DFX_DFR_AppRecovery_Ets_0002
     * @tc.desc   验证appRecovery.setRestartWant(undefined/null)第1个参数缺少null/undefined覆盖;;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testapprecovery_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testapprecovery_0002 start");
      try{
        appRecovery.setRestartWant(undefined);
        console.info("====> testapprecovery_0002 undefined end 01");
        appRecovery.setRestartWant(null);
        console.info("====> testapprecovery_0002 undefined end 02");
        done();
      }catch(err){
        console.error(`====>testapprecovery_0002 undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testapprecovery_0002 end");
    })

    /**
     * @tc.name   testapprecovery_0003
     * @tc.number SUB_DFX_DFR_AppRecovery_Ets_0003
     * @tc.desc   验证appRecovery.saveAppState(undefined/null),第1个参数缺少null/undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testapprecovery_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testapprecovery_0003 start");
      try{
        appRecovery.saveAppState(undefined);
        console.info("====> testapprecovery_0003 saveAppState undefined end 01");
        appRecovery.saveAppState(null);
        console.info("====> testapprecovery_0003 saveAppState undefined end 02");
        done();
      }catch(err){
        console.error(`====>testapprecovery_0003 saveAppState undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testapprecovery_0003 end");
    })

  })
}
