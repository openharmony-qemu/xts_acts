'use static';
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium';
import { getPermission, LOG_TAG, sleep } from '../common';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'createPhotoAssetTest';

export default function MediaLibraryAvailabilitySupp(): void {
  describe('MediaLibraryAvailabilitySupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
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

    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0100
     * @tc.desc   MediaLibraryAvailability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0100", Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = "SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0100";
        try {
          const availabilityStatusList: Array<string> = ['available', 'unavailable']
          const unavailabilityReasonList: Array<string> =
            ['', 'Database corrupted', 'Database occupied by Clone application']
          console.info(TAG,`媒体库状态变化：状态=${availabilityStatusList}，原因=${unavailabilityReasonList}`);
          const handleMediaLibraryChange =
            (changeData: photoAccessHelper.MediaLibraryAvailability) => {
              const availabilityStatus: photoAccessHelper.AvailabilityStatus = changeData.availabilityStatus;
              const unavailabilityReason: string = changeData.unavailabilityReason;
              console.info(TAG,`媒体库状态变化：状态=${availabilityStatus}，原因=${unavailabilityReason}`);
              expect(availabilityStatusList.includes(availabilityStatus)).assertTrue();
              expect(unavailabilityReasonList.includes(unavailabilityReason)).assertTrue();
            };
          console.log(TAG,'媒体库监听注册');
          helper!.onMediaLibraryAvailability(handleMediaLibraryChange);
          console.log(TAG,'媒体库监听注册成功');
          await sleep(2000);
          helper!.offMediaLibraryAvailability(handleMediaLibraryChange);
          console.log(TAG,'媒体库监听解除成功');
          done();
        } catch (error) {
          console.error(`${testNum} :: test failed ,error is ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0200
     * @tc.desc   MediaLibraryAvailability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0200", Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = "SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0200";
        try {
          const availabilityStatusList: Array<string> = ['available', 'unavailable']
          const unavailabilityReasonList: Array<string> =
            ['', 'Database corrupted', 'Database occupied by Clone application']
          const handleMediaLibraryChange =
            (changeData: photoAccessHelper.MediaLibraryAvailability) => {
              const availabilityStatus: photoAccessHelper.AvailabilityStatus = changeData.availabilityStatus;
              const unavailabilityReason: string = changeData.unavailabilityReason;
              console.info(TAG,`媒体库状态变化：状态=${availabilityStatus}，原因=${unavailabilityReason}`);
              expect(availabilityStatusList.includes(availabilityStatus)).assertTrue();
              expect(unavailabilityReasonList.includes(unavailabilityReason)).assertTrue();
            };
          helper!.onMediaLibraryAvailability(handleMediaLibraryChange);
          console.log(TAG,'媒体库监听注册成功');
          await sleep(2000);
          helper!.offMediaLibraryAvailability();
          console.log(TAG,'媒体库监听解除成功');
          done();
        } catch (error) {
          console.error(TAG,`${testNum} :: test failed ,error is ${error}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0300
     * @tc.desc   MediaLibraryAvailability-enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0300", Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = "SUB_MULTIMEDIA_MEDIALIBRARY_PHOTOACCESSHELPER_MEDIALIBRARYAVAILABILITY_STATIC_0300";
        try {
          expect(photoAccessHelper.AvailabilityStatus.AVAILABLE).assertEqual('available');
          expect(photoAccessHelper.AvailabilityStatus.UNAVAILABLE).assertEqual('unavailable');
          done();
        } catch (error) {
          console.error(TAG,`${testNum} :: test failed ,error is ${error}`);
          expect().assertFail();
          done();
        }
      })


  });
}
