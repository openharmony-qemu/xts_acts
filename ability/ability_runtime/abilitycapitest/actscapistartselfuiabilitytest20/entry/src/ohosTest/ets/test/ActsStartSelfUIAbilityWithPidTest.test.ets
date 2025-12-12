/*
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AbilityKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function ActsStartSelfUIAbilityWithPidTest() {
  describe('ActsStartSelfUIAbilityWithPidTest', () => {
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsNoError();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

      
    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000079.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsInstanceKeyNotSupport();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000079).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000077.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsUpperLimitReached();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000077).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsNoSuchAbility();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000001).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000018.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsCodeCrossApp();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000018).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsCodeInternal();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000050).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000076.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsInvalidAppInstanceKey();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000076).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000067.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsVisibilitySettingDisabled();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000067).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

  })
}