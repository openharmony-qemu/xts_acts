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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator

export default function getResourceDirNdkHaveResTest() {
  describe('ActsGetLaunchAndLatestParameterTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
      abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100
     * @tc.desc: Buffer is empty, other parameters are normal
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100'
      let result = testNapi.Error_GetLaunchParameter_writelength_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200
     * @tc.desc: WriteLength is empty, other parameters are normal
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200'
      let result = testNapi.Error_GetLaunchParameter_buffersize_less();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300
     * @tc.desc: BufferSize is smaller than the actual written size
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300'
      let result = testNapi.Error_GetLaunchParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400
     * @tc.desc: Buffer is empty, other parameters are normal
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400'
      let result = testNapi.Error_GetLatestParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500
     * @tc.desc: WriteLength is empty, other parameters are normal
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500'
      let result = testNapi.Error_GetLaunchParameter_buffersize_less();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600
     * @tc.desc: BufferSize is smaller than the actual written size
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600'
      let result = testNapi.Error_GetLaunchParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0700
     * @tc.name: SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0700
     * @tc.desc: Obtain the resource path of the entry module (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0700', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0700'
      let want: Want = {
        bundleName: 'com.example.ndkgetpatameter',
        abilityName: 'EntryAbilityA'
      };
      context.startAbility(want).then(() => {
        console.info('startAbility succeed');
        try {
          let launchResult_cold = testNapi.getLaunchParameter().toString();
          let hasLaunchKey_cold: boolean = !launchResult_cold.includes("key1");
          expect(hasLaunchKey_cold).assertTrue();
          let LatestResult_cold = testNapi.getLatestParameter().toString();
          let hasLatestKey_cold: boolean = !LatestResult_cold.includes("key1");
          expect(hasLatestKey_cold).assertTrue();
        } catch (error) {
          console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
        }
        let cmd = 'aa start -b com.example.ndkgetpatameter -a EntryAbilityA --psn key1';
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
          hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', data.stdResult ?? '');
          hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', data.exitCode ?? '');
          if (err) {
            expect().assertFail();
            done();
          } else {
            try {
              let launchResult_hot = testNapi.getLaunchParameter().toString();
              let hasLaunchKey_hot: boolean = !launchResult_hot.includes("key1");
              expect(hasLaunchKey_hot).assertTrue();
              let latestResult_hot = testNapi.getLatestParameter().toString();
              let hasLatestKey_hot: boolean = latestResult_hot.includes("key1");
              expect(hasLatestKey_hot).assertTrue();
            } catch (error) {
              console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
            }
            done();
          }
        })
      }).catch((err: BusinessError) => {
        // 处理业务逻辑错误
        console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      });
    })
  })
}