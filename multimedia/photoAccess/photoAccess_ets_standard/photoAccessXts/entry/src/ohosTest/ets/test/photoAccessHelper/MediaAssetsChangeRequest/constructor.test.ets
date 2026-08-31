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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'constructor';

export default function MediaAssetsChangeRequestConstructorTest() {

  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

  const createAsset = async (testNum: string, title: string): Promise<photoAccessHelper.PhotoAsset> => {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let options: photoAccessHelper.CreateOptions = {
      title: title
    }
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, 'jpg', options);
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, (testContext.filesDir + "/01.jpg"));
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info(`${testNum} :: apply createAssetRequest successfully !`);
    const asset = assetChangeRequest.getAsset()
    return asset;
  }

  const deleteAsset = async (asset: photoAccessHelper.PhotoAsset) => {
    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
    console.info('deleteAssets successfully');
  }

  describe('MediaAssetsChangeRequestConstructorTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.name   SUB_MediaAssetsChangeRequest_constructor_0001
     * @tc.number SUB_MediaAssetsChangeRequest_constructor_0001
     * @tc.desc   constructor false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetsChangeRequest_constructor_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetsChangeRequest_constructor_0001';
      try {
        const asset: photoAccessHelper.PhotoAsset = await createAsset(testName, testName)
        await deleteAsset(asset)
        new photoAccessHelper.MediaAssetsChangeRequest([asset]);
        expect().assertFail();
        done()
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
        expect(error.code).assertEqual(String(ErrorCode.SYSTEM_INNER_ERROR_CODE));
        done();
      }
    })
  })
}