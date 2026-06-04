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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import ImageGetImagePropertySyncEnumFrontCamera from './ImageGetImagePropertySyncEnumFrontCamera.test';
import { application } from '@kit.AbilityKit';

const TAG = 'ImageXts.CreatePixelMapSec'

let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

function getImageSource(path: string): image.ImageSource {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${path}`;
  const imageSourceApi = image.createImageSource(filePath);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function createPixelMapFromImage(pathUri: string, sourceDensity: number = 98): Promise<image.PixelMap> {
  let imageSource: image.ImageSource = getImageSource(pathUri);
  let pixelmap = await imageSource.createPixelMap();
  await imageSource.release();
  return pixelmap;
}

async function imageArray(): Promise<[Uint8Array, Uint8Array, Uint8Array]> {
  let appContext: Context= AppStorage.get('testContext') as common.UIAbilityContext;
  let testContext = await application.createModuleContext(appContext, "entry_test");
  let imageArray = testContext.resourceManager.getMediaContentSync($r('app.media.startIcon').id);
  let splitBuff1 = imageArray.slice(0, imageArray.byteLength / 2);
  let splitBuff2 = imageArray.slice(imageArray.byteLength / 2);
  return [splitBuff1,splitBuff2,imageArray]
}

export default function CreatePixelMapSuppSec() {
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  describe('CreatePixelMapSuppSec', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });
    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll');
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2400
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2500
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2600
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2700
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2800
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2900
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2900
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_2900';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3000
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3000
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3000';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3100
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3100';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3200
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3300
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3300';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3400
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3400';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3500
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3500';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3600
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3600';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3700
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3700';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3800
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3800';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3900
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3900
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_3900';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4000
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4000
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4000';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4100
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4100';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4200
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_SYNC_4200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4300
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacity(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName,`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in setting opacity.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4400
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4400
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacity(undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName,`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in setting opacity.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4500
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4500
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.opacity(null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4600
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4600
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_4600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.opacity(undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4700
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4700
     * @tc.desc       opacitySync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacitySync(null);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4800
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4800
     * @tc.desc       opacitySync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_OPACITY_SYNC_4800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacitySync(undefined);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_4900
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_4900
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_4900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_4900';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(null, scaleY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5000
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5000
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5000';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(undefined, scaleY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5100
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5100
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5200
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5200
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5300
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let Pixelmap = pixelMap.scale(null, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5400
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5400
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let Pixelmap = pixelMap.scale(undefined, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5500
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5500
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let Pixelmap = pixelMap.scale(scaleX, null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5600
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5600
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_5600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let Pixelmap = pixelMap.scale(scaleX, undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5700
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5700
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(null, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5800
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5800
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(undefined, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5900
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5900
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_5900';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, null);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6000
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6000
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6000';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, undefined);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6100
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6100
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(null, scaleY,image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6200
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6200
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })


  })
}