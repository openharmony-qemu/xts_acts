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

let DOMAIN: int = 0x0000;
let TAG: string = 'testTag';

export default function BackgroundLoaderErrorCodeStaticTest() {
  describe('BackgroundLoaderErrorCodeStaticTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100
     * @tc.desc   Test registerTask with empty abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 3,
        abilityName: ''
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0100 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200
     * @tc.desc   Test registerTask with excessively long abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200 begin---');
      let longName: string = 'A'.repeat(256);
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 4,
        abilityName: longName
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0200 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300
     * @tc.desc   Test registerTask with mismatched bundleName abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 5,
        abilityName: 'NonExistentAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0300 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400
     * @tc.desc   Test unregisterTask with invalid taskId negative number returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: -1,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0400 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500
     * @tc.desc   Test registerTask with special characters in abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 6,
        abilityName: '!@#$%^&*()'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0500 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600
     * @tc.desc   Test unregisterTask with empty abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 8,
        abilityName: ''
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0600 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700
     * @tc.desc   Test unregisterTask with non-existent abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 9,
        abilityName: 'NonExistentAbility'
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0700 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800
     * @tc.desc   Test unregisterTask unregistered task returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 999,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0800 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900
     * @tc.desc   Test getTaskInfo with negative taskId returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900 begin---');
      backgroundLoader.getTaskInfo(-1).then((res: backgroundLoader.TaskInfo) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900 getTaskInfo unexpected success: ${JSON.stringify(res)}`);
        done();
      }).catch((error: Error) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_0900 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
        expect(error.code).assertEqual(9700004);
        done();
      })
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000
     * @tc.desc   Test getTaskInfo with taskId 0 returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000 begin---');
      backgroundLoader.getTaskInfo(0).then((res: backgroundLoader.TaskInfo) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000 getTaskInfo unexpected success: ${JSON.stringify(res)}`);
        expect(false).assertTrue();
        done();
      }).catch((error: Error) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1000 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
        expect(error.code).assertEqual(9700004);
        done();
      })
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100
     * @tc.desc   Test getTaskInfo with unregistered taskId returns error 9700004
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100 begin---');
      backgroundLoader.getTaskInfo(99999).then((res: backgroundLoader.TaskInfo) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100 getTaskInfo unexpected success: ${JSON.stringify(res)}`);
        expect(false).assertTrue();
        done();
      }).catch((error: Error) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1100 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
        expect(error.code).assertEqual(9700004);
        done();
      })
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300
     * @tc.desc   Test finishTask with invalid taskId negative number returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: -1,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1300 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400
     * @tc.desc   Test finishTask with empty abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 17,
        abilityName: ''
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1400 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500
     * @tc.desc   Test finishTask with non-existent abilityName returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 18,
        abilityName: 'NonExistentAbility'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1500 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600
     * @tc.desc   Test finishTask with taskId 0 returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 0,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1600 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700
     * @tc.desc   Test finishTask for unregistered task returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 999,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1700 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800
     * @tc.desc   Test registerTask duplicate taskId returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 21,
        abilityName: 'EntryAbility'
      }
      let callbackFlag = 0;
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800 first registerTask success');
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800 duplicate registerTask unexpected success`);
        callbackFlag = callbackFlag + 1;
        expect(callbackFlag).assertEqual(1);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1800 duplicate registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        backgroundLoader.unregisterTask(taskInfo);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900
     * @tc.desc   Test getTaskInfo after unregisterTask returns error 9700004
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 22,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 registerTask success');
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 unregisterTask success');
        backgroundLoader.getTaskInfo(22).then((res: backgroundLoader.TaskInfo) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 getTaskInfo unexpected success: ${JSON.stringify(res)}`);
          expect(false).assertTrue();
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 getTaskInfo failed. code is ${error.code} message is ${error.message}`);
          expect(error.code).assertEqual(9700004);
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_1900 failed. code is ${e.code} message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000
     * @tc.desc   Test unregisterTask with excessively long abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000 begin---');
      let longName: string = 'A'.repeat(256);
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 24,
        abilityName: longName
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2000 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100
     * @tc.desc   Test finishTask with excessively long abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100 begin---');
      let longName: string = 'A'.repeat(256);
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 25,
        abilityName: longName
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2100 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300
     * @tc.desc   Test registerTask with special characters in abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 27,
        abilityName: '!@#$%^&*()_+-={}[]|\\:;<>,.?/'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2300 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400
     * @tc.desc   Test unregisterTask with special characters abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 29,
        abilityName: '!@#'
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400 unregisterTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2400 unregisterTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500
     * @tc.desc   Test registerTask with abilityName containing spaces returns error 9700004
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 28,
        abilityName: 'Entry Ability'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500 registerTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2500 registerTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600
     * @tc.desc   Test finishTask with special characters abilityName returns error 9700004
     * @tc.level  LEVEL4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 30,
        abilityName: '!@#'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600 finishTask unexpected success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2600 finishTask failed. code is ${e.code} message is ${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700
     * @tc.desc   Test multiple registerTask with different taskIds
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 begin---');
      let taskInfo1: backgroundLoader.TaskInfo = {
        taskId: 281,
        abilityName: 'EntryAbility'
      }
      let taskInfo2: backgroundLoader.TaskInfo = {
        taskId: 282,
        abilityName: 'EntryAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 registerTask1 success');
        backgroundLoader.registerTask(taskInfo2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 registerTask2 success');
        backgroundLoader.unregisterTask(taskInfo1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 unregisterTask1 success');
        done();
      } catch (error) {
        backgroundLoader.unregisterTask(taskInfo2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 unregisterTask2 success');
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2700 failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(e.code).assertEqual(9700004);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800
     * @tc.desc   Test getTaskInfo query unregistered taskId returns error 9700004
     * @tc.level  LEVEL2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800 begin---');
      backgroundLoader.getTaskInfo(99999).then((res: backgroundLoader.TaskInfo) => {
        console.info(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800 getTaskInfo unexpected success: ${JSON.stringify(res)}`);
        expect(false).assertTrue();
        done();
      }).catch((error: Error) => {
        console.error(`SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_ERR_STATIC_XTS_2800 getTaskInfo failed as expected. code is ${error.code} message is ${error.message}`);
        expect(error.code).assertEqual(9700004);
        done();
      })
    })

  })
}
