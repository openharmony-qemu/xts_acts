/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import cameraObj from 'libentry.so'
import {
  cameraErrorCode,
  closeFd,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import image from '@ohos.multimedia.image';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import fs from '@ohos.file.fs';


const TAG = "CameraSessionNDKLOGTAG";

export default function CameraFunctionTest() {

  describe('CameraFunctionTest', () => {
    console.info(TAG + '-------------CameraFunctionTest--------------');
    beforeAll(async () => {
      console.info(TAG + 'beforeAll case');
      await getPermission();
      await driveFn();
      console.info(TAG + 'beforeAll case', indexSurfaceId);
      cameraObj.initWithSurface(indexSurfaceId);
      cameraObj.TestOhMediaAsset(1,indexSurfaceId);
      await sleep(3000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW ends here");
      cameraObj.captureSessionStart(1);
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW
     * @tc.name      : CameraInput api
     * @tc.desc      : CameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_SINGLE_PREVIEW ends here");

    });

  })
}