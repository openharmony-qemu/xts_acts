'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium";
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from "@kit.BasicServicesKit";
// import Utils from './Util.test';
import { Context } from "@kit.ArkUI";
let TAG: string = ' MediaLibraryNoPermission: ';
export default function photoMediaLibraryNoPermissionStatic(): void {
  describe("photoMediaLibraryNoPermissionStatic", (): void => {


    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0100
     * @tc.desc   test MediaLibrary Availability on with no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0100", Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum: string =
          "SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0100";
        try {
          const availabilityStatusList: Array<string> = ['available', 'unavailable']
          const unavailabilityReasonList: Array<string> =
            ['', 'Database corrupted', 'Database occupied by Clone application']
          const handleMediaLibraryChange =
            (changeData: photoAccessHelper.MediaLibraryAvailability) => {
              const availabilityStatus: photoAccessHelper.AvailabilityStatus = changeData.availabilityStatus;
              const unavailabilityReason: string = changeData.unavailabilityReason;
              console.info(TAG,`媒体库状态变化：状态=${availabilityStatus}，原因=${unavailabilityReason}`);
            };
          helper!.onMediaLibraryAvailability(handleMediaLibraryChange);
          console.error(TAG,`${testNum} :: test failed ,权限校验失败`);
          expect().assertFail();
          done();
        } catch (error) {
          console.log(TAG,'媒体库监听注册失败无读权限');
          expect(Number(error.code)).assertEqual(201);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0200
     * @tc.desc   test MediaLibrary Availability off with no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0200", Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum: string =
          "SUB_MULTIMEDIA_PHOTO_MEDIALIBRARYAVAILABILITY_NO_PERMISSION_STATIC_0200";
        try {
          helper!.offMediaLibraryAvailability();
          console.error(TAG,`${testNum} :: test failed ,权限校验失败`);
          expect().assertFail();
          done();
        } catch (error) {
          console.log(TAG,'媒体库监听解除失败无读权限');
          expect(Number(error.code)).assertEqual(201);
          done();
        }
      })

  })
}