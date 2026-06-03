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
    /**
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6300
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, null, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6400
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6400
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, undefined, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6500
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6500
     * @tc.desc       scale cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6600
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6600
     * @tc.desc       scale cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6700
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6700
     * @tc.desc       scale cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_6700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6800
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6800
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(null, scaleY, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6900
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6900
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_6900';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7000
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7000
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7000';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, null, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7100
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7100
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7200
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7200
     * @tc.desc       scaleSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7300
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7400
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7400
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7500
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7500
     * @tc.desc       scaleSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_SCALE_SYNC_7500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7600
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7600
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        pixelMap.translate(null, translateY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7700
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7700
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        pixelMap.translate(undefined, translateY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7800
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7800
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        pixelMap.translate(translateX, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7900
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7900
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_7900';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        pixelMap.translate(translateX, undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8000
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8000
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8000';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        let Pixelmap = pixelMap.translate(null, translateY);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8100
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8100
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        let Pixelmap = pixelMap.translate(undefined, translateY);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8200
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8200
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        let Pixelmap = pixelMap.translate(translateX, null);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8300
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_8300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        let Pixelmap = pixelMap.translate(translateX, undefined);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8400
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8400
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8400';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY : number = 10.0;
        pixelMap.translateSync(null, translateY);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8500
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8500
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8500';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY : number = 10.0;
        pixelMap.translateSync(undefined, translateY);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8600
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8600
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8600';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX : number = 50.0;
        pixelMap.translateSync(translateX, null);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8700
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8700
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_TRANSLATE_SYNC_8700';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX : number = 50.0;
        pixelMap.translateSync(translateX, undefined);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8800
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8800
     * @tc.desc       rotate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8800';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotate(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in rotating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8900
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8900
     * @tc.desc       rotate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8900', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_8900';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotate(undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in rotating pixelmap.');
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9000
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9000
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9000', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9000';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.rotate(null);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9100
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9100
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_9100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.rotate(undefined);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9200
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9200
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotateSync(null);
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
     * @tc.number     SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9300
     * @tc.name       SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9300
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXELMAP_ROTATE_SYNC_9300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotateSync(undefined);
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
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9400
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9400
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9400';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength)
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.supportedFormats);
        expect(imageSourceIncrementalSApi.supportedFormats != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.release);
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9500
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9500
     * @tc.desc       CreateIncrementalSource cover sourceDensity,sourcePixelFormat,sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9500';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength),sourceOptions
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi);
        expect(imageSourceIncrementalSApi != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.release);
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9600
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9600
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_INCREMENTAL_SOURCE_9600';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength),sourceOptions
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.supportedFormats);
        expect(imageSourceIncrementalSApi.supportedFormats != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.release);
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9700
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9700
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9700';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        creator.dequeueImage((err: BusinessError, img: image.Image) => {
          if (err) {
            console.error(TAG, testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', img.format);
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', img.timestamp);
            expect(img.clipRect.size.width).assertEqual(8192);
            expect(img.clipRect.size.height).assertEqual(8192);
            expect(img.clipRect.x).assertEqual(0);
            expect(img.clipRect.y).assertEqual(0);
            expect(img.size.height).assertEqual(8192);
            expect(img.size.width).assertEqual(8192);
            expect(img.format).assertEqual(12);
            expect(img.timestamp).assertEqual(0);
          }
        })
      }catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9800
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9800
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9800', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_9800';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        let img = await creator.dequeueImage();
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.format);
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.timestamp);
        expect(img.clipRect.size.width).assertEqual(8192);
        expect(img.clipRect.size.height).assertEqual(8192);
        expect(img.clipRect.x).assertEqual(0);
        expect(img.clipRect.y).assertEqual(0);
        expect(img.size.height).assertEqual(8192);
        expect(img.size.width).assertEqual(8192);
        expect(img.format).assertEqual(12);
        expect(img.timestamp).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })

  })
}