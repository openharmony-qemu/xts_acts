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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { ProcessInformation } from 'application.ProcessInformation'

let domain: int = 0x0000;
let tag: string = 'testTag';
let abilityContext: common.UIAbilityContext

export default function ApplicationContextStatic() {
  describe("ApplicationContextStatic", () => {
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.contexttest.static")
      await Utils.msSleep(2000);
      abilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.number    : ABILITY_TEST_GETRUNNINGPROCESSINFORMATION_PROMISE_0100
     * @tc.name      : testGetRunningProcessInformationStaticPromise001
     * @tc.desc      : test getRunningProcessInformation(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetRunningProcessInformationStaticPromise001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(appContext != null).assertTrue();

        appContext.getRunningProcessInformation().then((data: Array<ProcessInformation>) => {
          expect(data != undefined).assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 pid:` + data[0].pid);
          expect(data[0].pid > 0).assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 processName:` + data[0].processName);
          expect(data[0].processName == "com.example.contexttest.static").assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 bundleNames:` + data[0].bundleNames);
          expect(data[0].bundleNames[0] == "com.example.contexttest.static").assertTrue();
          console.log(`testGetRunningProcessInformationPromise001 success`);
          done();
        }).catch<void>((err: BusinessError): void => {
          console.log(`testGetRunningProcessInformationPromise001 fail ` + err.message);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`testGetRunningProcessInformationPromise001 fail ` + err);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : ABILITY_TEST_GETRUNNINGPROCESSINFORMATION_CALLBACK_0100
     * @tc.name      : testGetRunningProcessInformationStaticCb001
     * @tc.desc      : test getRunningProcessInformation(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetRunningProcessInformationStaticCb001', Level.LEVEL0,async (done: () => void): Promise<void> => {
      try {
        let appContext: common.ApplicationContext = abilityContext.getApplicationContext();
        expect(appContext != null).assertTrue();

        appContext.getRunningProcessInformation((err: BusinessError | null, data: Array<ProcessInformation> | undefined) => {
          expect(data != undefined).assertTrue();
          console.log(`testGetRunningProcessInformationCb001 pid:` + data![0].pid);
          expect(data![0].pid > 0).assertTrue();
          console.log(`testGetRunningProcessInformationCb001 processName:` + data![0].processName);
          expect(data![0].processName == "com.example.contexttest.static").assertTrue();
          console.log(`testGetRunningProcessInformationCb001 bundleNames:` + data![0].bundleNames);
          expect(data![0].bundleNames[0] == "com.example.contexttest.static").assertTrue();
          console.log(`testGetRunningProcessInformationCb001 success`);
          done();
        })
      } catch (err:BusinessError) {
        console.log(`testGetRunningProcessInformationCb001 fail ` + err);
        expect().assertFail();
        done();
      }
    })
  })
}
