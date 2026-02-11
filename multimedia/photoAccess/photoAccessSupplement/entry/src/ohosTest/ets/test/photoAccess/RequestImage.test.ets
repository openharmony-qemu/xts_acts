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

import image from '@ohos.multimedia.image'
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import {
  photoKeys,
  fetchOption, getPermission, driveFn, sleep, isEmpty,
} from '../common'
import common from '@ohos.app.ability.common'
import { dataSharePredicates } from '@kit.ArkData'
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG ='PhotoAssetsSetSupp';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class MediaHandlerPicture implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
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

class MediaDataHandlerVideo implements photoAccessHelper.MediaAssetDataHandler<boolean> {
  onDataPrepared(data: boolean) {
    console.info('on video request status prepared');
  }
}

export default function requestImageTest() {
  describe('requestImageTest', () => {
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001
     * @tc.desc      requestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002
     * @tc.desc      requestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
       catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
       }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001
     * @tc.desc      quickRequestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandlerPicture();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002
     * @tc.desc      quickRequestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandlerPicture();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001
     * @tc.desc      requestImageData-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaDataHandler();
        await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002
     * @tc.desc      requestImageData-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaDataHandler();
        await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, requestId);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, '');
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, requestId);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, '');
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, '');
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005
     * @tc.desc      requestVideoFile-801
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let phAsset = {uri : '',photoType:photoAsset.photoType,displayName:photoAsset.displayName} as photoAccessHelper.PhotoAsset;
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, phAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let phAsset = {uri : photoAsset.uri,photoType:photoAsset.photoType,displayName:''} as photoAccessHelper.PhotoAsset;
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, phAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(undefined, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, undefined, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, null,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, undefined,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,'', handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,null, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,undefined, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(undefined, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, undefined, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, null,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, undefined,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,'', handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,null, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions, undefined, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029
     * @tc.desc      close-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030
     * @tc.desc      close-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`,JSON.stringify(error));
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031
     * @tc.desc      close-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(null, (err) => {
          if (err === undefined) {
            console.info('asset close succeed.');
          } else {
            console.error(`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032
     * @tc.desc      close-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(undefined, (err) => {
          if (err === undefined) {
            console.info('asset close succeed.');
          } else {
            console.error(`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail((err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035
     * @tc.desc      getThumbnail-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(null,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036
     * @tc.desc      getThumbnail-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(undefined,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038
     * @tc.desc      getThumbnail-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = null as ESObject;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = undefined as ESObject;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040
     * @tc.desc      clone-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = systemDateTime.getTime().toString();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(photoAsset.photoType == newAsset.photoType).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = null as ESObject;
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = undefined as ESObject;
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044
     * @tc.desc      clone-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '1';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(isEmpty(newAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '8z7M8y6N9x115P8w7Q8v6R9u5S8t7T8s6U9r5V8q7W8p6X9o5Y8n7Z8m6a9l5b8k7c8j6d9i5e8h7f8g6g9f5h8e7i8d6j9c5k8b7l8a6m9z5n8y7o8x6p9w5q8v7r8u6s9t5t8s7u8r6v9q5w8p7x8o6y9n5z8m7A8l6B9k5C8j7D8i6E9h5F8g7G8f6H9e5I8d7J8c6K9b5L8a7M8z6N9y5O8x7P8w6Q9v5R8u7S8t6T9s5U8r7V8q6W9p5X8';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'a9l5b8k7c8j6d9i5e8h7f8g6g9f5h8e7i8d6j9c5k8b7l8a6m9z5n8y7o8x6p9w58v7r8u6s9t5t8s7u8r6v9q5w8p7x8o6y9n5z8m7A8l6B9k5C8j7D8i6E9h5F8g7G8f6H9e5I8d7J8c6K9b5L8a7M8z6N9y5O8x7P8w6Q9v5R8u7S8t6T9s5U8r7V8q6W9p5X8o7Y8n6Z9m5a8l7b8k6c9j5d8i7e8h6f9g5g8f7h8e6i9d5j8c7k8b6l9a5m';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047
     * @tc.desc      getFirstObject-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(isEmpty(photoAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048
     * @tc.desc      getLastObject-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
        expect(isEmpty(photoAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    });
  }