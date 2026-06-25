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

const TAG = 'xts.createPixelMapUsingAllocator ';

async function createPixelMapUsingAllocatorPromiseTest(done: () => void, testName: string, pathUri: string,
  options?: image.DecodingOptions | undefined, allocatorType?: image.AllocatorType | undefined) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let pixelMap: image.PixelMap | undefined;
  if (options == undefined && allocatorType == undefined) {
    pixelMap = await imageSourceApi!.createPixelMapUsingAllocator();
  } else {
    pixelMap = await imageSourceApi!.createPixelMapUsingAllocator(options, allocatorType);
  }
  imageSourceApi!.release();
  expect(pixelMap != undefined).assertTrue();
  done();
}

export default function ImageSourceCreatePixelMapUsingAllocatorTest(): void {
  describe('ImageSourceCreatePixelMapUsingAllocatorTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0100
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0100
     * @tc.desc   imageSource_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0100';
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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0200
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0200
     * @tc.desc   imageSource_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0200';
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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0300
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0300
     * @tc.desc   imageSource_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0300';
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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0400
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0400
     * @tc.desc   imageSource_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0400';
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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0500
     * @tc.number SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0500
     * @tc.desc   imageSource_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PixelMap_UsingAllocator_static_0500';
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

  })
}