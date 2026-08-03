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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from '@ohos/hypium'
import { backgroundLoader } from '@kit.BackgroundTasksKit'
import { BusinessError } from '@kit.BasicServicesKit'
import hilog from '@ohos.hilog'

let DOMAIN: number = 0x0000;
let TAG: string = 'BackgroundLoaderTest';

export default function BackgroundLoaderNormalTest() {
  describe('BackgroundLoaderNormalTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100
     * @tc.desc   Test registerTask normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 1,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100 registerTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0100 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200
     * @tc.desc   Test unregisterTask normal call after registerTask
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 2,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200 registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200 unregisterTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0200 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300
     * @tc.desc   Test getTaskInfo promise normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 3,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 registerTask success');
        backgroundLoader.getTaskInfo(3).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 getTaskInfo promise success');
          console.info(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 getTaskInfo result: ${JSON.stringify(res)}`);
          expect(res.taskId).assertEqual(3);
          expect(res.abilityName).assertEqual('TestAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 getTaskInfo promise failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0300 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400
     * @tc.desc   Test finishTask normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 4,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400 registerTask success');
        backgroundLoader.finishTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400 finishTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0500
     * @tc.desc   Test constant ON_START value equals 'onStart'
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0500 begin---');
      let onStartValue = backgroundLoader.ON_START;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0500 ON_START: ' + onStartValue);
      expect(onStartValue).assertEqual('onStart');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0600
     * @tc.desc   Test constant ON_STOP value equals 'onStop'
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0600 begin---');
      let onStopValue = backgroundLoader.ON_STOP;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0600 ON_STOP: ' + onStopValue);
      expect(onStopValue).assertEqual('onStop');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0700
     * @tc.desc   Test enum StopCode.SUCCESS value equals 0
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0700 begin---');
      let stopCode = backgroundLoader.StopCode.SUCCESS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0700 StopCode.SUCCESS: ' + stopCode);
      expect(stopCode).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0800
     * @tc.desc   Test enum StopCode.SYSTEM_ERROR value equals 1
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0800 begin---');
      let stopCode = backgroundLoader.StopCode.SYSTEM_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0800 StopCode.SYSTEM_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0900
     * @tc.desc   Test enum StopCode.PERCEPTIBLE_ERROR value equals 2
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0900 begin---');
      let stopCode = backgroundLoader.StopCode.PERCEPTIBLE_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_0900 StopCode.PERCEPTIBLE_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1000
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1000
     * @tc.desc   Test enum StopCode.TIMEOUT_ERROR value equals 3
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1000 begin---');
      let stopCode = backgroundLoader.StopCode.TIMEOUT_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1000 StopCode.TIMEOUT_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(3);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1100
     * @tc.desc   Test enum StopCode.EXECUTE_ERROR value equals 4
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1100 begin---');
      let stopCode = backgroundLoader.StopCode.EXECUTE_ERROR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1100 StopCode.EXECUTE_ERROR: ' + stopCode);
      expect(stopCode).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200
     * @tc.desc   Test registerTask then getTaskInfo combined call
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 12,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 registerTask success');
        backgroundLoader.getTaskInfo(12).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 getTaskInfo success');
          expect(res.taskId).assertEqual(12);
          expect(res.abilityName).assertEqual('TestAbility');
          backgroundLoader.unregisterTask(taskInfo);
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 unregisterTask success');
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1200 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300
     * @tc.desc   Test registerTask then unregisterTask then getTaskInfo unregistered task
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 13,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 unregisterTask success');
        backgroundLoader.getTaskInfo(13).then((res: backgroundLoader.TaskInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 getTaskInfo after unregister result: ${JSON.stringify(res)}`);
          expect(false).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 getTaskInfo failed as expected. code is ${error.code} message is ${error.message}`);
          expect(error.code).assertEqual(9700004);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1300 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400
     * @tc.desc   Test TaskInfo structure property assignment and validation
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 14,
        abilityName: 'TestAbility'
      }
      expect(taskInfo.taskId).assertEqual(14);
      expect(taskInfo.abilityName).assertEqual('TestAbility');
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400 registerTask success');
        backgroundLoader.getTaskInfo(14).then((res: backgroundLoader.TaskInfo) => {
          expect(res.taskId).assertEqual(14);
          expect(res.abilityName).assertEqual('TestAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1500
     * @tc.desc   Test TaskStopInfo structure property assignment and validation
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1500 begin---');
      let taskStopInfo: backgroundLoader.TaskStopInfo = {
        taskId: 15,
        abilityName: 'TestAbility',
        stopCode: backgroundLoader.StopCode.SUCCESS,
        stopMessage: 'Task completed successfully'
      }
      expect(taskStopInfo.taskId).assertEqual(15);
      expect(taskStopInfo.abilityName).assertEqual('TestAbility');
      expect(taskStopInfo.stopCode).assertEqual(0);
      expect(taskStopInfo.stopMessage).assertEqual('Task completed successfully');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1600
     * @tc.desc   Test TaskStopInfo with each StopCode enum value
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1600 begin---');
      let stopInfos: backgroundLoader.TaskStopInfo[] = [
        { taskId: 1, abilityName: 'Ability1', stopCode: backgroundLoader.StopCode.SUCCESS, stopMessage: 'SUCCESS' },
        { taskId: 2, abilityName: 'Ability2', stopCode: backgroundLoader.StopCode.SYSTEM_ERROR, stopMessage: 'SYSTEM_ERROR' },
        { taskId: 3, abilityName: 'Ability3', stopCode: backgroundLoader.StopCode.PERCEPTIBLE_ERROR, stopMessage: 'PERCEPTIBLE_ERROR' },
        { taskId: 4, abilityName: 'Ability4', stopCode: backgroundLoader.StopCode.TIMEOUT_ERROR, stopMessage: 'TIMEOUT_ERROR' },
        { taskId: 5, abilityName: 'Ability5', stopCode: backgroundLoader.StopCode.EXECUTE_ERROR, stopMessage: 'EXECUTE_ERROR' },
      ]
      expect(stopInfos[0].stopCode).assertEqual(0);
      expect(stopInfos[1].stopCode).assertEqual(1);
      expect(stopInfos[2].stopCode).assertEqual(2);
      expect(stopInfos[3].stopCode).assertEqual(3);
      expect(stopInfos[4].stopCode).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700
     * @tc.desc   Test registerTask unregisterTask registerTask same taskId again
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 19,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 first registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 unregisterTask success');
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 second registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 second unregisterTask success');
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1700 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800
     * @tc.desc   Test registerTask with maximum safe integer taskId boundary value
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: Number.MAX_SAFE_INTEGER,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800 registerTask with MAX_SAFE_INTEGER success');
        backgroundLoader.unregisterTask(taskInfo);
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1800 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900
     * @tc.desc   Test getTaskInfo returns correct TaskInfo after registerTask
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 22,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        backgroundLoader.getTaskInfo(22).then((res: backgroundLoader.TaskInfo) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900 getTaskInfo success');
          expect(res.taskId).assertEqual(22);
          expect(res.abilityName).assertEqual('TestAbility');
          backgroundLoader.unregisterTask(taskInfo);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertTrue();
          backgroundLoader.unregisterTask(taskInfo);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_1900 failed. code is ${e.code} message is ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2000
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2000
     * @tc.desc   Test TaskStopInfo with stopCode SYSTEM_ERROR and stopMessage
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2000 begin---');
      let taskStopInfo: backgroundLoader.TaskStopInfo = {
        taskId: 23,
        abilityName: 'TestAbility',
        stopCode: backgroundLoader.StopCode.SYSTEM_ERROR,
        stopMessage: 'System error occurred'
      }
      expect(taskStopInfo.stopCode).assertEqual(backgroundLoader.StopCode.SYSTEM_ERROR);
      expect(taskStopInfo.stopCode).assertEqual(1);
      expect(taskStopInfo.stopMessage).assertEqual('System error occurred');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2100
     * @tc.desc   Test TaskStopInfo with stopCode TIMEOUT_ERROR and stopMessage
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2100 begin---');
      let taskStopInfo: backgroundLoader.TaskStopInfo = {
        taskId: 24,
        abilityName: 'TestAbility',
        stopCode: backgroundLoader.StopCode.TIMEOUT_ERROR,
        stopMessage: 'Task execution timeout'
      }
      expect(taskStopInfo.stopCode).assertEqual(backgroundLoader.StopCode.TIMEOUT_ERROR);
      expect(taskStopInfo.stopCode).assertEqual(3);
      expect(taskStopInfo.stopMessage).assertEqual('Task execution timeout');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2200
     * @tc.desc   Test constants ON_START and ON_STOP type is string
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2200 begin---');
      expect(typeof backgroundLoader.ON_START).assertEqual('string');
      expect(typeof backgroundLoader.ON_STOP).assertEqual('string');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2300
     * @tc.desc   Test StopCode enum values are number type
     * @tc.level  LEVEL1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2300 begin---');
      expect(typeof backgroundLoader.StopCode.SUCCESS).assertEqual('number');
      expect(typeof backgroundLoader.StopCode.SYSTEM_ERROR).assertEqual('number');
      expect(typeof backgroundLoader.StopCode.PERCEPTIBLE_ERROR).assertEqual('number');
      expect(typeof backgroundLoader.StopCode.TIMEOUT_ERROR).assertEqual('number');
      expect(typeof backgroundLoader.StopCode.EXECUTE_ERROR).assertEqual('number');
      done();
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400
     * @tc.desc   Test registerTask then finishTask then unregisterTask combined call
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 27,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400 registerTask success');
        backgroundLoader.finishTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400 finishTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400 unregisterTask success');
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2400 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500
     * @tc.desc   Test TaskInfo with taskId as float number boundary value
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 30.5,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500 registerTask with float taskId success');
        backgroundLoader.unregisterTask(taskInfo);
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2500 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600
     * @tc.desc   Test registerTask with excessively large negative taskId
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: Number.MIN_SAFE_INTEGER,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        callbackFlag = callbackFlag + 1;
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600 registerTask unexpected success`);
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2600 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700
     * @tc.desc   Test registerTask normal call taskId is 0
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 0,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700 registerTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2700 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800
     * @tc.desc   Test registerTask normal call taskId is -1
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: -1,
        abilityName: 'TestAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800 registerTask success');
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_2800 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
