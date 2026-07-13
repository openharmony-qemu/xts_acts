'use static';
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

import Context from "application.Context"
import image from '@ohos.multimedia.image'
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from '@ohos/hypium-binary/src/main/indexStatic'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import hilog from '@ohos.hilog'
import { fetchOption, getPermission, driveFn, sleep, pushCreateAsset } from '../Common.test.ets';

let domain: int = 0x0000;
let tag: string = 'testTag';

class MediaHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture | undefined, imageSource: image.ImageSource | null, map?: Map<string, string>): void {
    hilog.info(domain, tag, `MediaHandler succeed`);
  }
}

class TestHandler implements photoAccessHelper.MediaAssetProgressHandler {
  onProgress(progress: int): void {
    console.info(`on video request onProgress: ${progress}`);
  }
}

export default function quickRequestImageTest() {
  describe('quickRequestImageTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   quick_request_image_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0100
     * @tc.desc   quick request image with DeliveryMode FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0100';
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
        hilog.info(domain, tag, `${testNum} success`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0200
     * @tc.desc   quick request image with DeliveryMode HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0200';
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
        hilog.info(domain, tag, `${testNum} success`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0300
     * @tc.desc   quick request image with sourceMode(unsupported system api) ORIGINAL_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0300';
      try {
        const fileNames = ["quick_request_image_003.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_003.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        hilog.info(domain, tag, `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0400
     * @tc.desc   quick request image with sourceMode (unsupported system api) EDITED_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0400';
      try {
        const fileNames = ["quick_request_image_004.jpg"];
        await pushCreateAsset(testContext, fileNames);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "quick_request_image_004.jpg");
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler: new TestHandler(),
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        hilog.info(domain, tag, `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   quick_request_image_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0500
     * @tc.desc   quick request image with null asset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('quick_request_image_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_STATIC_0500';
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
        hilog.info(domain, tag, `${testNum} success, expect fail`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    })

  })
}