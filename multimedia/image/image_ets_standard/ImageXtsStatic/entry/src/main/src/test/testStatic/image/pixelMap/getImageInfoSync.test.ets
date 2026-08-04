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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium/index';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = 'xts.pixelMapGetImageInfoSync';

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

export default function pixelMapGetImageInfoSyncTest(): void {
  describe('pixelMapGetImageInfoSyncTest', () => {

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
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.height: `+ imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(226);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.weidth: `+ imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(98);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(1888);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(3);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(2);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.height: `+ imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(75);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.weidth: `+ imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(98);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(1888);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(3);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(2);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.height: `+ imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(221);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.weidth: `+ imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(286);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(98);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(1144);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(3);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(2);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0100';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.height: `+ imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(1476);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo!.size.weidth: `+ imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(1446);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(98);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(5784);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(3);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(2);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200
     * @tc.desc       getImageInfoSync cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_static_0200';
      const pathUri = 'test.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfoSync();
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap!.release();
      done();
    })
  })
}