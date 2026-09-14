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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'requestContent';

export default function MovingPhotoRequestContentTest() {

  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);

  type TestFunction = (movingPhoto: photoAccessHelper.MovingPhoto) => void

  class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
    async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
      if (movingPhoto === undefined) {
        console.error('Error occurred when preparing data');
        return;
      }
      testRequestContent(movingPhoto)
    }
  }

  let testRequestContent: TestFunction = async () => {}

  const createMovingPhoto = async (testNum: string, extension: string) => {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let options: photoAccessHelper.CreateOptions = {
      title: testNum,
      subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
    }
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, (context.filesDir + "/01.jpg"));
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, (context.filesDir + "/01.mp4"));
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info(`${testNum}::apply create moving photo successfully`);
  }

  const getMovingPhotoAsset = async (testNum: string) => {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
    const fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
    let asset: photoAccessHelper.PhotoAsset = await assetResult.getLastObject();
    console.info(`${testNum}::get moving photo successfully`)
    return asset
  }

  const getUriPromiseTest = async (testName: string, requestOptions: photoAccessHelper.RequestOptions) => {
    await createMovingPhoto(testName, 'jpg')
    let movingPhoto: photoAccessHelper.PhotoAsset = await getMovingPhotoAsset(testName)
    const handler = new MovingPhotoHandler();
    const movingPhotoPromise = new Promise<photoAccessHelper.MovingPhoto>(resolve => {
      testRequestContent = (movingPhoto: photoAccessHelper.MovingPhoto) => resolve(movingPhoto)
    })
    try {
      console.info(`${testName}::moving photo uri: ${movingPhoto.uri}, requestOptions: ${JSON.stringify(requestOptions)}`)
      let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(context, movingPhoto, requestOptions, handler);
      console.info(`${testName}::moving photo requested successfully, requestId: ${requestId}`);
    } catch (err) {
      console.error(`${testName}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
    }
    return movingPhotoPromise
  }

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
     * @tc.desc   MovingPhoto_requestContent ResourceType - VIDEO_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MovingPhoto_requestContent_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MovingPhoto_requestContent_promise_0001';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      try {
        const movingPhoto: photoAccessHelper.MovingPhoto = await getUriPromiseTest(testName, requestOptions)
        let buffer: ArrayBuffer = await movingPhoto.requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE);
        console.log("moving photo contents retrieved successfully");
        expect(buffer.byteLength > 0).assertTrue()
      } catch (err) {
        console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /**
     * @tc.name   SUB_MovingPhoto_requestContent_promise_0002
     * @tc.number SUB_MovingPhoto_requestContent_promise_0002
     * @tc.desc   MovingPhoto_requestContent ResourceType - null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MovingPhoto_requestContent_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MovingPhoto_requestContent_promise_0002';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      try {
        const movingPhoto: photoAccessHelper.MovingPhoto = await getUriPromiseTest(testName, requestOptions)
        const resourceType: photoAccessHelper.ResourceType = null as ESObject
        await movingPhoto.requestContent(resourceType);
        console.log("moving photo contents retrieved successfully");
        expect(false).assertTrue()
      } catch (err) {
        console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(String(ErrorCode.SYSTEM_INNER_ERROR_CODE))
      }
      done()
    })

    /**
     * @tc.name   SUB_MovingPhoto_requestContent_promise_0003
     * @tc.number SUB_MovingPhoto_requestContent_promise_0003
     * @tc.desc   MovingPhoto_requestContent ResourceType - undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MovingPhoto_requestContent_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MovingPhoto_requestContent_promise_0003';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      try {
        const movingPhoto: photoAccessHelper.MovingPhoto = await getUriPromiseTest(testName, requestOptions)
        const resourceType: photoAccessHelper.ResourceType = undefined as ESObject
        await movingPhoto.requestContent(resourceType);
        console.log("moving photo contents retrieved successfully");
        expect(false).assertTrue()
      } catch (err) {
        console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(String(ErrorCode.SYSTEM_INNER_ERROR_CODE))
      }
      done()
    })

    /**
     * @tc.name   SUB_MovingPhoto_requestContent_promise_0004
     * @tc.number SUB_MovingPhoto_requestContent_promise_0004
     * @tc.desc   MovingPhoto_requestContent ResourceType - OTHER_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MovingPhoto_requestContent_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MovingPhoto_requestContent_promise_0004';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      try {
        const movingPhoto: photoAccessHelper.MovingPhoto = await getUriPromiseTest(testName, requestOptions)
        const resourceType: photoAccessHelper.ResourceType = 'OTHER_RESOURCE' as ESObject
        await movingPhoto.requestContent(resourceType);
        console.log("moving photo contents retrieved successfully");
        expect(false).assertTrue()
      } catch (err) {
        console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(String(ErrorCode.SYSTEM_INNER_ERROR_CODE))
      }
      done()
    })
  })
}