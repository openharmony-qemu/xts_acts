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
      console.info(TAG, 'afterAll case');
    });

    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110';
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
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_112
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_112
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_112', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_112';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_113
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_113
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_113', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_113';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_114
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_114
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_114', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_114';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_115
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_115
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_115', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_115';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116
     * @tc.desc       opacitySync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117
     * @tc.desc       opacitySync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_118
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_118
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_118', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_118';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_119
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_119
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_119', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_119';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_120
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_120
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_120', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_120';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_121
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_121
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_121', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_121';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_122
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_122
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_122', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_122';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_123
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_123
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_123', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_123';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_124
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_124
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_124', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_124';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_125
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_125
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_125', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_125';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_130
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_130
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_130', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_130';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_131
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_131
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_131', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_131';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_132
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_132
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_132', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_132';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_133
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_133
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_133', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_133';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_134
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_134
     * @tc.desc       scale cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_134', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_134';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_135
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_135
     * @tc.desc       scale cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_135', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_135';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_136
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_136
     * @tc.desc       scale cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_136', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_136';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141
     * @tc.desc       scaleSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144
     * @tc.desc       scaleSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_156
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_156
     * @tc.desc       rotate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_156', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_156';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_157
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_157
     * @tc.desc       rotate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_157', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_157';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_158
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_158
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_158', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_158';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_159
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_159
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_159', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_159';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160';
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
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161';
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
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162';
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
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163
     * @tc.desc       CreateIncrementalSource cover sourceDensity,sourcePixelFormat,sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163';
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
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164';
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166';
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167';
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