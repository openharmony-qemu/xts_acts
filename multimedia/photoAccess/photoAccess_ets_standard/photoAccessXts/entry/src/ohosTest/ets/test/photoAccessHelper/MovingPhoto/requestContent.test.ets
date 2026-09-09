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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, copyImageToSandbox, getFileNameArray } from '../../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';
import { fileUri } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'requestContent';

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const imageFileUri = fileUri.getUriFromPath(testContext.filesDir + "/" + 'test6.gif');
    let videoFileUri: string = fileUri.getUriFromPath(testContext.filesDir + "/" + '1vp9_320x240_30.mp4');
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.log("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

async function getUriPromiseTest(done: Function, testName: string, requestOptions: photoAccessHelper.RequestOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  await createMovingPhoto(testName, testContext, 'jpg', testName)
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
  const fetchOptions: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
  console.log(`moving photo lengthL ${assetResult.getCount()}`)
  let asset: photoAccessHelper.PhotoAsset = await assetResult.getLastObject();
  const handler = new MovingPhotoHandler();
  try {
    console.log(TAG, JSON.stringify(asset), JSON.stringify(requestOptions), JSON.stringify(handler))
    let requestId: string =
      await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
    console.info("moving photo requested successfully, requestId: " + requestId);
    done();
  } catch (err) {
    console.error(TAG, testName,
      `failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
    expect().assertFail();
    done();
  }
}

async function createMovingPhoto(testNum: string, testContext: common.UIAbilityContext, extension: string, title: string) {
  let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
  let options: photoAccessHelper.CreateOptions = {
    title: title,
    subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
  }
  const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
  assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, (testContext.filesDir + "/01.jpg"));
  assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, (testContext.filesDir + "/01.mp4"));
  await phAccessHelper.applyChanges(assetChangeRequest);
  console.info(`${testNum} :: apply createAssetRequest successfully !`);
}

export default function MovingPhotoRequestContentTest() {
  describe('MovingPhotoRequestContentTest', () => {

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
     * @tc.name   SUB_MovingPhoto_requestContent_promise_0001
     * @tc.number SUB_MovingPhoto_requestContent_promise_0001
     * @tc.desc   MovingPhoto_requestContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MovingPhoto_requestContent_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MovingPhoto_requestContent_promise_0001';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const videoFileName = '1vp9_320x240_30.mp4';
      const videoPath = '1vp9_320x240_30.mp4';
      await copyImageToSandbox(fileName, path);
      await copyImageToSandbox(videoFileName, videoPath);
      await getUriPromiseTest(done, testName, requestOptions);
    })
  })
}