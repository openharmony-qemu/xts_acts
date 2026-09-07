'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from '../../../hypium/index'
import backgroundLoader from '@ohos.resourceschedule.backgroundLoader'
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Util.test';

let DOMAIN: int = 0x0000;
let TAG: string = 'testTag';

export default function BackgroundLoaderNormalStaticTest() {
  describe('BackgroundLoaderNormalStaticTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100
     * @tc.desc   Test registerTask normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 1,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100 registerTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0100 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200
     * @tc.desc   Test unregisterTask normal call after registerTask
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 2,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200 registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200 unregisterTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0200 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300
     * @tc.desc   Test getTaskInfo promise normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 3,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 registerTask success');
        backgroundLoader.getTaskInfo(3).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 getTaskInfo promise success');
          console.info(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 getTaskInfo result: ${JSON.stringify(res)}`);
          expect(res.taskId).assertEqual(3);
          expect(res.abilityName).assertEqual('EntryAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 getTaskInfo promise failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0300 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400
     * @tc.desc   Test finishTask normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 4,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400 registerTask success');
        let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let cmd = "hidumper -s 1901 -a 'backgroundLoader com.acts.actsbackgroundloadertest.static EntryAbility'";
        delegator.executeShellCommand(cmd)
        await Utils.msSleep(1500);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400 delegator success');
        backgroundLoader.finishTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400 finishTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0500
     * @tc.desc   Test constant ON_START value equals 'onStart'
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0500 begin---');
      let onStartValue = backgroundLoader.ON_START;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0500 ON_START: ' + onStartValue);
      expect(onStartValue).assertEqual('onStart');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0600
     * @tc.desc   Test constant ON_STOP value equals 'onStop'
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0600 begin---');
      let onStopValue = backgroundLoader.ON_STOP;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0600 ON_STOP: ' + onStopValue);
      expect(onStopValue).assertEqual('onStop');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0700
     * @tc.desc   Test enum StopCode.SUCCESS value equals 0
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0700 begin---');
      let stopCode = backgroundLoader.StopCode.SUCCESS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0700 StopCode.SUCCESS: ' + stopCode);
      expect(stopCode).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0800
     * @tc.desc   Test enum StopCode.SYSTEM_ERROR value equals 1
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0800 begin---');
      let stopCode = backgroundLoader.StopCode.SYSTEM_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0800 StopCode.SYSTEM_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0900
     * @tc.desc   Test enum StopCode.PERCEPTIBLE_ERROR value equals 2
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0900 begin---');
      let stopCode = backgroundLoader.StopCode.PERCEPTIBLE_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_0900 StopCode.PERCEPTIBLE_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1000
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1000
     * @tc.desc   Test enum StopCode.TIMEOUT_ERROR value equals 3
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1000 begin---');
      let stopCode = backgroundLoader.StopCode.TIMEOUT_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1000 StopCode.TIMEOUT_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(3);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1100
     * @tc.desc   Test enum StopCode.EXECUTE_ERROR value equals 4
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1100 begin---');
      let stopCode = backgroundLoader.StopCode.EXECUTE_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1100 StopCode.EXECUTE_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200
     * @tc.desc   Test registerTask then getTaskInfo combined call
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 12,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 registerTask success');
        backgroundLoader.getTaskInfo(12).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 getTaskInfo success');
          expect(res.taskId).assertEqual(12);
          expect(res.abilityName).assertEqual('EntryAbility');
          backgroundLoader.unregisterTask(taskInfo);
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 unregisterTask success');
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1200 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300
     * @tc.desc   Test registerTask then unregisterTask then getTaskInfo unregistered task
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 13,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 unregisterTask success');
        backgroundLoader.getTaskInfo(13).then((res: backgroundLoader.TaskInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 getTaskInfo after unregister result: ${JSON.stringify(res)}`);
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 getTaskInfo failed as expected. code is ${error.code} message is ${error.message}`);
          expect(error.code).assertEqual(9700004);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1300 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400
     * @tc.desc   Test TaskInfo structure property assignment and validation
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 14,
        abilityName: 'EntryAbility'
      }
      expect(taskInfo.taskId).assertEqual(14);
      expect(taskInfo.abilityName).assertEqual('EntryAbility');
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400 registerTask success');
        backgroundLoader.getTaskInfo(14).then((res: backgroundLoader.TaskInfo) => {
          expect(res.taskId).assertEqual(14);
          expect(res.abilityName).assertEqual('EntryAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700
     * @tc.desc   Test registerTask unregisterTask registerTask same taskId again
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 19,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 first registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 unregisterTask success');
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 second registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 second unregisterTask success');
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1700 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900
     * @tc.desc   Test getTaskInfo returns correct TaskInfo after registerTask
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 22,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        backgroundLoader.getTaskInfo(22).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900 getTaskInfo success');
          expect(res.taskId).assertEqual(22);
          expect(res.abilityName).assertEqual('EntryAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_1900 failed. code is ${e.code} message is ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2200
     * @tc.desc   Test constants ON_START and ON_STOP type is string
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2200 begin---');
      expect(typeof backgroundLoader.ON_START).assertEqual('string');
      expect(typeof backgroundLoader.ON_STOP).assertEqual('string');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2300
     * @tc.desc   Test StopCode enum values are number type
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2300 begin---');
      expect(typeof backgroundLoader.StopCode.SUCCESS).assertEqual('int');
      expect(typeof backgroundLoader.StopCode.SYSTEM_ERROR).assertEqual('int');
      expect(typeof backgroundLoader.StopCode.PERCEPTIBLE_ERROR).assertEqual('int');
      expect(typeof backgroundLoader.StopCode.TIMEOUT_ERROR).assertEqual('int');
      expect(typeof backgroundLoader.StopCode.EXECUTE_ERROR).assertEqual('int');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400
     * @tc.desc   Test registerTask then finishTask then unregisterTask combined call
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 27,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 registerTask success');
        let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let cmd = "hidumper -s 1901 -a 'backgroundLoader com.acts.actsbackgroundloadertest.static EntryAbility'";
        delegator.executeShellCommand(cmd)
        await Utils.msSleep(1500);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 delegator success');
        backgroundLoader.finishTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 finishTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 unregisterTask success');
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700
     * @tc.desc   Test registerTask normal call taskId is 0
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 0,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700 registerTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_STATIC_XTS_2700 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
