/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { fetchOption, getPermission, driveFn, sleep, pushCreateAsset } from '../common'
import common from '@ohos.app.ability.common'

class MediaHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture | undefined, imageSource: image.ImageSource | null, map?: Map<string, string>): void {
    console.info(`MediaHandler succeed`);
  }
}

class TestHandler implements photoAccessHelper.MediaAssetProgressHandler {
  onProgress(progress: number): void {
    console.info(`on video request onProgress: ${progress}`);
  }
}

export default function quickRequestImageTest() {
  describe('quickRequestImageTest',() => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   quick_request_image_001
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0100
     * @tc.desc   quick request image with DeliveryMode FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0100';
      try {
        const fileNames = ["quick_request_image_001.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_001.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        console.info( `${testNum} success`);
        done();
      } catch (error) {
        console.info( `${testNum} error: ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_002
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0200
     * @tc.desc   quick request image with DeliveryMode HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0200';
      try {
        const fileNames = ["quick_request_image_002.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_002.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        console.info( `${testNum} success`);
        done();
      } catch (error) {
        console.info( `${testNum} error: ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_005
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0500
     * @tc.desc   quick request image with null asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_005', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0500';
      try {
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_005.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error: ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_007
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0700
     * @tc.desc   quick request image with null photoAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_007', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0700';
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, null, requestOptions, handler);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_008
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0800
     * @tc.desc   quick request image with null requestOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_008', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0800';
      try {
        const fileNames = ["quick_request_image_008.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_008.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, null, handler);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_009
     * @tc.number SUB_PHOTOACCESS_HELPER_quick_request_image_0900
     * @tc.desc   quick request image with null handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_009', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_quick_request_image_0900';
      try {
        const fileNames = ["quick_request_image_009.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_009.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, null);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_011
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1100
     * @tc.desc   quick request image with undefined photoAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_011', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1100';
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, undefined, requestOptions, handler);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_012
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1200
     * @tc.desc   quick request image with undefined requestOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_012', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1200';
      try {
        const fileNames = ["quick_request_image_012.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_012.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, undefined, handler);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_013
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1300
     * @tc.desc   quick request image with undefined handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('quick_request_image_013', Level.LEVEL2, async (done: Function) => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_1300';
      try {
        const fileNames = ["quick_request_image_013.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_013.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, undefined);
        console.info( `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info( `${testNum} error:${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

  });
}