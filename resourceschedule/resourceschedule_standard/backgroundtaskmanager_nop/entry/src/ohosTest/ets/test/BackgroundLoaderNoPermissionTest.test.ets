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
let TAG: string = 'BackgroundLoaderNopTest';

const PERMISSION_DENIED_CODE = 201;

export default function BackgroundLoaderNoPermissionTest() {
  describe('BackgroundLoaderNoPermissionTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100
     * @tc.desc   Test registerTask without ohos.permission.KEEP_BACKGROUND_RUNNING permission returns error 201
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 1,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.registerTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100 registerTask unexpected success');
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0100 registerTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200
     * @tc.desc   Test unregisterTask without ohos.permission.KEEP_BACKGROUND_RUNNING permission returns error 201
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 2,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.unregisterTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200 unregisterTask unexpected success');
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0200 unregisterTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300
     * @tc.desc   Test getTaskInfo without ohos.permission.KEEP_BACKGROUND_RUNNING permission returns error 201
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300 begin---');
      backgroundLoader.getTaskInfo(3).then((res: backgroundLoader.TaskInfo) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300 getTaskInfo unexpected success');
        expect(false).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0300 getTaskInfo failed. code: %{public}s, message: %{public}s', `${error.code}`, `${error.message}`);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      })
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400
     * @tc.desc   Test finishTask without ohos.permission.KEEP_BACKGROUND_RUNNING permission returns error 201
     * @tc.level  LEVEL3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400 begin---');
      let taskInfo: backgroundLoader.TaskInfo = {
        taskId: 4,
        abilityName: 'TestAbility'
      }
      try {
        backgroundLoader.finishTask(taskInfo);
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400 finishTask unexpected success');
        expect(false).assertTrue();
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUNDLOADER_NO_PERMISSION_0400 finishTask failed. code: %{public}s, message: %{public}s', `${e.code}`, `${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        done();
      }
    })

  })
}
