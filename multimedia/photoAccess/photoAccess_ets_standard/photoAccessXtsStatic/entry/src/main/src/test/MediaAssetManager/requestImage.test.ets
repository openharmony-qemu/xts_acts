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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { getPermission, LOG_TAG } from '../common';
import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import { Context } from '@kit.ArkUI';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'requestImage';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(
    data: image.ImageSource | undefined,
    map: Map<string, string> | undefined
  ): void {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}
class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(
    data: ArrayBuffer | undefined,
    map: Map<string, string> | undefined
  ): undefined {
    return undefined;
  }
}
class MediaDataHandler1 implements photoAccessHelper.MediaAssetDataHandler<boolean> {
  onDataPrepared(
    data: boolean | undefined,
    map: Map<string, string> | undefined
  ): undefined {
    console.info('on video request status prepared');
    return undefined;
  }
}

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(
    data: photoAccessHelper.MovingPhoto | undefined,
    map: Map<string, string> | undefined
  ): undefined {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return undefined;
    }
    console.info("moving photo acquired successfully, uri: " + data.getUri());
    return undefined;
  }
}

export default function MediaAssetRequestImageSuppStatic(): void {
  describe('MediaAssetRequestImageSuppStatic', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0010
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0010
     * @tc.desc   requestImage-HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        const handler = new MediaHandler();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        console.info(TAG, 'requestImage successfully', requestId);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0020
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0020
     * @tc.desc   requestImage-FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        };
        const handler = new MediaHandler();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        console.info(TAG, 'requestImage successfully', requestId);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0030
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0030
     * @tc.desc   requestImage-BALANCE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_IMAGE_STATIC_0030';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        };
        const handler = new MediaHandler();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        console.info(TAG, 'requestImage successfully', requestId);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0010
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0010
     * @tc.desc   requestImageData-HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        const handler = new MediaDataHandler();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        console.info(TAG, 'requestImage successfully', requestId);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0020
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0020
     * @tc.desc   requestImageData-FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_DATA_IMAGE_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        };
        const handler = new MediaDataHandler();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        console.info(TAG, 'requestImage successfully', requestId);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0010
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0010
     * @tc.desc   requestVideoFile-HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        let fileUri = testContext.filesDir + '/01.mp4';
        const handler = new MediaDataHandler1();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0020
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0020
     * @tc.desc   requestVideoFile-BALANCE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        };
        let fileUri = testContext.filesDir + '/01.mp4';
        const handler = new MediaDataHandler1();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0030
     * @tc.number SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0030
     * @tc.desc   requestVideoFile-FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_VIDEO_FILE_STATIC_0030';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        };
        let fileUri = testContext.filesDir + '/01.mp4';
        const handler = new MediaDataHandler1();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, 'fetchResult success');
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId =
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

  })
}