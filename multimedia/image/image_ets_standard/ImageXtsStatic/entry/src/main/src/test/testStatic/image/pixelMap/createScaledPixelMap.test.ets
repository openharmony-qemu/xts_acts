'use static';
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

import { Context } from '@kit.AbilityKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = 'xts.createScaledPixelMap';

async function createPixelMapFromImage(pathUri: string, sourceDensity: int = 98): Promise<image.PixelMap> {
  let context: Context = Hypium.get("Context") as Context;
  let array = new ArrayBuffer(30000);
  let path = `file://${context.filesDir}/${pathUri}`;
  const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  let ops: image.SourceOptions = {
    sourceDensity: Double.toInt(sourceDensity),
  };
  let imageSource: image.ImageSource | undefined = image.createImageSource(array, ops);
  if (imageSource === undefined) {
    throw new Error('Failed to create image source');
  }
  let pixelmap = await imageSource.createPixelMap();
  await imageSource.release();
  if (pixelmap === undefined) {
    throw new Error('Failed to create pixelmap');
  }
  return pixelmap;
}

export default function createScaledPixelMapTest(): void {
  describe('createScaledPixelMapTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0100
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0200
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0300
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0300';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0400
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0400';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0500
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0500';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0600
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0600';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0700
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0700';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0800
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0800';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0900
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_SCALED_PIXELMAP_static_0900';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap!.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })
  })
}