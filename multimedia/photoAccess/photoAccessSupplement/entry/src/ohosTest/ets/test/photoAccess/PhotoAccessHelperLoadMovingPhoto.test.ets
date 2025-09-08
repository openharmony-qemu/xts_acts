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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';


const TAG = LOG_TAG + 'LoadMovingPhotoSupp';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}
class QuickImageDataHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
    console.info('on image data prepared');
  }
}

async function requestImagePromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  console.info(TAG, 'testContext successfully', JSON.stringify(testContext));
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, 'phAccessHelper successfully', phAccessHelper);
  const handler = new MediaHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success');
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImage successfully', requestId);
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, error.code);
    callback(error.code)
    done();
  }
}

async function requestImageDataPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions,callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new MediaDataHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success');
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImageData successfully',requestId);
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    callback(error.code)
    done();
  }
}

let power: ESObject;

export default function PhotoAccessHelperLoadMovingPhoto() {
  describe('PhotoAccessHelperLoadMovingPhoto', () => {
    let dr = Driver.create();
    const imageDisplayName = 'testGetAsset.jpg';
    const videoDisplayName = 'testGetAsset.mp4';
    const abnormalDisplayName = 'text';
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
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001', Level.LEVEL0, async (done: Function, videoPahUri: string, imagePathUri: string) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(undefined, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002', Level.LEVEL0, async (done: Function) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(null, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003', Level.LEVEL0, async (done: Function) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, '');
        let uri = movingPhoto.getUri();
        const uris = uri.split(';') as string[];
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest photo: " + uris.length);
        expect(uris[0].length > 0).assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004 + loadMoving errcode: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, null);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', videoFileUri);
        let uri = movingPhoto.getUri();
        const uris = uri.split(';') as string[];
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest photo: " + uris.length);
        expect(uris[1].length > 0).assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, null, videoFileUri);
        expect().assertTrue();
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008 + loadMovingPhotoPromiseTest photo: " + movingPhoto);
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, undefined, videoFileUri);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009 + loadMovingPhotoPromiseTest photo: " + movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(null, null, null);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(undefined, undefined, undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, undefined, '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013
     * @tc.name      : MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013
     * @tc.desc      : loadMovingPhoto
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code==401).assertTrue();
      }
      done();
    })


  })
}