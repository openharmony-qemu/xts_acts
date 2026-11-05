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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { AppStorage, Context } from '@kit.ArkUI';
let isEmptyCameraManager = (data: camera.CameraManager) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
const TAG = "CameraStaticTests";
let context = Hypium.get('Context') as Context;

export default function CameraStaticTest():void {
  describe('CameraStaticTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_STATIC_1001
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_STATIC_1001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_STATIC_1001', Level.LEVEL0, (done: () => void):void => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_STATIC_1001';
      try {
        let cameraManager = camera.getCameraManager(context);
        expect(isEmptyCameraManager(cameraManager)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
    })
  })
}