'use static'
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { BusinessError } from '@ohos.base'
import { describe, it, expect, beforeAll, Level, afterAll, Hypium } from '../../../../hypium'
import { createUserAlbum, fetchAllOption, getPermission, sleep } from '../common'
import { Context } from '@kit.ArkUI'

let testContext: Context = Hypium.get('Context')! as Context;
let helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;

export default function ApplyChangesSuppTestStatic(): void {
  let TAG: string = 'ApplyChangesSuppTestStatic';
  describe('ApplyChangesSuppTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(1000);
    });
    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0300
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testName = 'SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0300';
      try {
        console.info(TAG, testName, 'Start');
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = '';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        if(assetChangeRequest != null){
          await helper!.applyChanges(assetChangeRequest);
        }
        console.info(TAG, testName, 'applyChanges success:');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName, 'applyChanges failed; err:', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0400
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testName = 'SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0400';
      try {
        console.info(TAG, testName, 'Start');
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        if(assetChangeRequest != null){
          await helper!.applyChanges(assetChangeRequest);
        }
        console.info(TAG, testName, 'applyChanges success:');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName, 'applyChanges failed; err:', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0500
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testName = 'SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0500';
      try {
        console.info(TAG, testName, 'Start');
        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = '';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        if(assetChangeRequest != null){
          await helper!.applyChanges(assetChangeRequest);
        }
        console.info(TAG, testName, 'applyChanges success:');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName, 'applyChanges failed; err:', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0600
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let testName = 'SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_CHANGE_REQUEST_STATIC_0600';
      try {
        console.info(TAG, testName, 'Start');
        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        if(assetChangeRequest != null){
          await helper!.applyChanges(assetChangeRequest);
        }
        console.info(TAG, testName, 'applyChanges success:');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName, 'applyChanges failed; err:', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

  })
}