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
import { dataSharePredicates } from '@kit.ArkData';
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { ErrorCode } from '@kit.AbilityKit';


const TAG = LOG_TAG + 'GetAssetChange';


async function getWriteCacheHandlerPromiseTest(done: Function, testName: string,
  photoType: photoAccessHelper.PhotoType | null | undefined, type: string| null | undefined, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let extension: string| null | undefined = type;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let fd: number = await assetChangeRequest.getWriteCacheHandler();
    console.info(TAG,'getWriteCacheHandler successfully'+ fd);
    await fileIo.close(fd);
    await phAccessHelper.applyChanges(assetChangeRequest)
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    callback(error.code)
  }
  done();
}
let power: ESObject;

export default function mediaAssetManagerGetAssetsTest() {
  describe('mediaAssetManagerGetAssetsTest', () => {
    let dr = Driver.create();
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
 * @tc.number    : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_001
 * @tc.name      : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_001
 * @tc.desc      : phAccessHelper.getAssets fileUri ""
 * @tc.size      : MEDIUM
 * @tc.type      : Function
 * @tc.level     : Level 0
 */
    it('PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_001', Level.LEVEL0, async (done: Function, pathUri: string) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        const uri=""
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          await photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, uri);
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
        console.info(TAG,'create asset successfully with uri = ' + asset.uri);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
        expect(error.code == 13900002).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_002
     * @tc.name      : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_002
     * @tc.desc      : phAccessHelper.getAssets fileUri null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_002', Level.LEVEL0, async (done: Function, pathUri: string) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        const uri = null
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          await photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, uri);
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
        console.info(TAG,'create asset successfully with uri = ' + asset.uri);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_003
     * @tc.name      : PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_003
     * @tc.desc      : phAccessHelper.getAssets fileUri undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_003', Level.LEVEL0, async (done: Function, pathUri: string) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        const uri = undefined
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          await photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, uri);
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
        console.info(TAG,'create asset successfully with uri = ' + asset.uri);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_001
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_001
     * @tc.desc      : getWriteCacheHandler photoType undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_001';
      const extension = 'mp4';
      await getWriteCacheHandlerPromiseTest(done, testName, undefined, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_001 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_002
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_002
     * @tc.desc      : getWriteCacheHandler photoType null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_002';
      const extension = 'webp';
      await getWriteCacheHandlerPromiseTest(done, testName, null, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_002 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_003
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_003
     * @tc.desc      : getWriteCacheHandler photoType 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_003';
      const extension = 'webp';
      await getWriteCacheHandlerPromiseTest(done, testName, 3, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_003 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_004
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_004
     * @tc.desc      : getWriteCacheHandler photoType 0
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_004';
      const extension = 'webp';
      await getWriteCacheHandlerPromiseTest(done, testName, 0, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_004 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_005
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_005
     * @tc.desc      : getWriteCacheHandler extension  null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_005';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const extension = null;
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_005 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_006
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_006
     * @tc.desc      : getWriteCacheHandler extension  undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_006';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const extension = undefined;
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_006 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_007
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_007
     * @tc.desc      : getWriteCacheHandler extension string
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_007';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const extension: string = '1234mp4'
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_007 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_008
     * @tc.name      : MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_008
     * @tc.desc      : getWriteCacheHandler extension string empty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_008';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      const extension = '';
      await getWriteCacheHandlerPromiseTest(done, testName, photoType, extension,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_ERROR_008 + getWriteCacheHandlerPromiseTest: " + getWriteCacheHandlerPromiseTest);
      done();
    })



  })
}