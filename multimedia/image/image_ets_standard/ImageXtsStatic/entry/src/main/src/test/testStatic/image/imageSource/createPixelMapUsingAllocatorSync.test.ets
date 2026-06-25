'use static'
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

import { Context, } from '@kit.ArkUI';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
import { image } from '@kit.ImageKit';

const TAG = 'xts.createPixelMapUsingAllocatorSync ';

let isEmpty = (data: image.PixelMap | undefined): boolean => {
  if (data == undefined) {
    return true;
  }
  return false;
}

async function createPixelMapUsingAllocatorPromiseTest(done: () => void, testName: string, pathUri: string,
  options?: image.DecodingOptions | undefined, allocatorType?: image.AllocatorType | undefined) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let pixelMap: image.PixelMap | undefined;
  if (options == undefined && allocatorType == undefined) {
    pixelMap = await imageSourceApi!.createPixelMapUsingAllocatorSync();
  } else {
    pixelMap = await imageSourceApi!.createPixelMapUsingAllocatorSync(options, allocatorType);
  }
  imageSourceApi!.release();
  expect(pixelMap != undefined).assertTrue();
  done();
}

export default function ImageSourceCreatePixelMapUsingAllocatorSyncTest(): void {
  describe('ImageSourceCreatePixelMapUsingAllocatorSyncTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    })

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    })

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0100
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0100
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0100';
      const path = 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.AUTO;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0200
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0200
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0200';
      const path = 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.DMA;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0300
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0300
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0300';
      const path = 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType: image.AllocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0400
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0400
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0400';
      const path = 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0500
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0500
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0500';
      const path = 'test.jpg';
      const decodingOptions: image.DecodingOptions = {
        editable: false,
        desiredSize: { width: 3072, height: 4096 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: { size: { height: 3072, width: 4096 }, x: 0, y: 0 },
        index: 0
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0600
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0600
     * @tc.desc   imageSource_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0600';
      const path = 'test.jpg';
      const decodingOptions = undefined;
      const allocatorType = undefined;
      try {
        await createPixelMapUsingAllocatorPromiseTest(done, testName, path, decodingOptions, allocatorType);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0700
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0700
     * @tc.desc   image createPixelMapUsingAllocatorSync the pixelFormat is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0700';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.UNKNOWN,
            pixelFormat: image.PixelMapFormat.UNKNOWN,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.UNKNOWN).assertTrue();
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect(Number(error.code)).assertEqual(0);
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0800
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0800
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is ARGB_8888 the pixelFormat is ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0800';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ARGB_8888,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.ARGB_8888).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0900
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0900
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGB_565 the pixelFormat is RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_0900';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_565,
            pixelFormat: image.PixelMapFormat.RGB_565,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.RGB_565).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1000
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1000
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGBA_8888 the editable is false the isEditable is false the isStrideAlignment is false the alphaType is UNKNOWN the scaleMode is FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1000';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: false,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
            alphaType: image.AlphaType.UNKNOWN,
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        expect(res.alphaType == image.AlphaType.PREMUL).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1100
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1100
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1100';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.BGRA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 },
            scaleMode: image.ScaleMode.FIT_TARGET_SIZE
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1200
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1200
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGB_888 the pixelFormat is RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1200';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGB_888,
            pixelFormat: image.PixelMapFormat.RGB_888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.RGB_888).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1300
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1300
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is ALPHA_8 the pixelFormat is ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1300';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.ALPHA_8,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.ALPHA_8).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1400
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1400
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1400';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_F16,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(isEmpty(pixelMap)).assertFalse();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1500
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1500
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is NV21 the pixelFormat is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1500';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV21,
            pixelFormat: image.PixelMapFormat.NV21,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.NV21).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1600
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1600
     * @tc.desc   image createPixelMapUsingAllocatorSync the srcPixelFormat is NV12 the pixelFormat is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_Sync_static_1600';
      let pixelMap: image.PixelMap | undefined;
      try {
        let opts: image.InitializationOptions =
          {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.NV12,
            pixelFormat: image.PixelMapFormat.NV12,
            size: { height: 4, width: 6 }
          }
        pixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        let res = await pixelMap.getImageInfo();
        expect(isEmpty(pixelMap)).assertFalse();
        expect(res.pixelFormat == image.PixelMapFormat.NV12).assertTrue();
        console.info(TAG, testName, ' createPixelMapUsingAllocatorSync success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMapUsingAllocatorSync error', error.message, error.code);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    })

  })
}