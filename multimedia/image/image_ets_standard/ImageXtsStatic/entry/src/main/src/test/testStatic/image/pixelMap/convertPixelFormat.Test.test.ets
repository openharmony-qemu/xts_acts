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

import { PixelMap } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium';

const TAG = 'ImagePixelMapConvertPixelFormatTestSupp';

export default function ImagePixelMapConvertPixelFormatTest(): void {
  describe('ImagePixelMapConvertPixelFormatTest', (): void => {

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
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0100
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0100
     * @tc.desc   pixelMap-convertPixelFormat枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0100';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ASTC_4x4);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0200
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0200
     * @tc.desc   pixelMap-convertPixelFormat枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0200';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.YCBCR_P010);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0300
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0300
     * @tc.desc   pixelMap-convertPixelFormat枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0300';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_1010102);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0400
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0400
     * @tc.desc   pixelMap-convertPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0400';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0500
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0500
     * @tc.desc   pixelMap-convertPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0500';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ARGB_8888);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0600
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0600
     * @tc.desc   pixelMap-convertPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0600';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0700
     * @tc.number SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0700
     * @tc.desc   pixelMap-convertPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_static_0700';
      const path = 'test7.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.YCRCB_P010);
        console.info(TAG,'Success convertPixelFormat');
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })
  })
}