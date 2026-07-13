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

import { Context, } from '@kit.ArkUI';
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  Hypium,
  it,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';

const TAG = 'xts.createPixelMapSync ';

async function createPixelMapSyncPromiseTest(done: () => void, testName: string, pathUri: string,
  options?: image.DecodingOptions) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let pixelMap: image.PixelMap | undefined = imageSourceApi!.createPixelMapSync(options);
  expect(pixelMap != undefined).assertTrue();
  imageSourceApi!.release();
  done();
}

async function createPixelMapSyncPromiseTest_color(done: () => void, testName: string,
  color: ArrayBuffer, opts: image.InitializationOptions) {
  try {
    let pixelMap = image.createPixelMapSync(color, opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapSyncOptsPromiseTest(done: () => void, testName: string,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = image.createPixelMapSync(opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);
    expect().assertFail();
  }
  done();
}

async function createPixelMapSyncAbnormalPromiseTest(done: () => void, testName: string,
  color: ArrayBuffer | null | undefined,
  opts: image.InitializationOptions, callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(color!, opts);
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code, testName);
    callback(error.code);
  }
  done();
}

export default function ImageSourceCreatePixelMapSyncTest(): void {
  describe('ImageSourceCreatePixelMapSyncTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_static_0100
     * @tc.desc   imageSource.createPixelMapSync with jpg and DecodingOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_static_0100';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_static_0200
     * @tc.desc   imageSource.createPixelMapSync with svg and DecodingOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_static_0200';
      const path = 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_static_0300
     * @tc.desc   imageSource.createPixelMapSync with svg and rotate 360
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_static_0300';
      const path = 'test.svg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapSyncPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_static_0400
     * @tc.desc   imageSource.createPixelMapSync without DecodingOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_static_0400';
      const path = 'test.svg';
      try {
        await createPixelMapSyncPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0100
     * @tc.number SUB_MEDIA_IMAGE_color_static_0100
     * @tc.desc   createPixelMapSync with color and pixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0200
     * @tc.number SUB_MEDIA_IMAGE_color_static_0200
     * @tc.desc   createPixelMapSync with color and pixelFormat UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0300
     * @tc.number SUB_MEDIA_IMAGE_color_static_0300
     * @tc.desc   createPixelMapSync with color and pixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0400
     * @tc.number SUB_MEDIA_IMAGE_color_static_0400
     * @tc.desc   createPixelMapSync with color and pixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0500
     * @tc.number SUB_MEDIA_IMAGE_color_static_0500
     * @tc.desc   createPixelMapSync with color and pixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0600
     * @tc.number SUB_MEDIA_IMAGE_color_static_0600
     * @tc.desc   createPixelMapSync with color and pixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0700
     * @tc.number SUB_MEDIA_IMAGE_color_static_0700
     * @tc.desc   createPixelMapSync with color and pixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0800
     * @tc.number SUB_MEDIA_IMAGE_color_static_0800
     * @tc.desc   createPixelMapSync with color and pixelFormat RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0800';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_0900
     * @tc.number SUB_MEDIA_IMAGE_color_static_0900
     * @tc.desc   createPixelMapSync with color and pixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_0900';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1000
     * @tc.number SUB_MEDIA_IMAGE_color_static_1000
     * @tc.desc   createPixelMapSync with color and pixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1000';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1100
     * @tc.number SUB_MEDIA_IMAGE_color_static_1100
     * @tc.desc   createPixelMapSync with color and pixelFormat ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1200
     * @tc.number SUB_MEDIA_IMAGE_color_static_1200
     * @tc.desc   createPixelMapSync with color and alphaType OPAQUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1300
     * @tc.number SUB_MEDIA_IMAGE_color_static_1300
     * @tc.desc   createPixelMapSync with color and alphaType UNPREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1400
     * @tc.number SUB_MEDIA_IMAGE_color_static_1400
     * @tc.desc   createPixelMapSync with color and scaleMode CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1500
     * @tc.number SUB_MEDIA_IMAGE_color_static_1500
     * @tc.desc   createPixelMapSync with color and scaleMode FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1600
     * @tc.number SUB_MEDIA_IMAGE_color_static_1600
     * @tc.desc   createPixelMapSync with color and srcPixelFormat UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1700
     * @tc.number SUB_MEDIA_IMAGE_color_static_1700
     * @tc.desc   createPixelMapSync with color and srcPixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1800
     * @tc.number SUB_MEDIA_IMAGE_color_static_1800
     * @tc.desc   createPixelMapSync with color and srcPixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1800';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_1900
     * @tc.number SUB_MEDIA_IMAGE_color_static_1900
     * @tc.desc   createPixelMapSync with color and srcPixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_1900';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2000
     * @tc.number SUB_MEDIA_IMAGE_color_static_2000
     * @tc.desc   createPixelMapSync with color and srcPixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2000';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2100
     * @tc.number SUB_MEDIA_IMAGE_color_static_2100
     * @tc.desc   createPixelMapSync with color and srcPixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2200
     * @tc.number SUB_MEDIA_IMAGE_color_static_2200
     * @tc.desc   createPixelMapSync with color and srcPixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2300
     * @tc.number SUB_MEDIA_IMAGE_color_static_2300
     * @tc.desc   createPixelMapSync with color and srcPixelFormat RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2400
     * @tc.number SUB_MEDIA_IMAGE_color_static_2400
     * @tc.desc   createPixelMapSync with color and srcPixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2500
     * @tc.number SUB_MEDIA_IMAGE_color_static_2500
     * @tc.desc   createPixelMapSync with color and srcPixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2600
     * @tc.number SUB_MEDIA_IMAGE_color_static_2600
     * @tc.desc   createPixelMapSync with color and srcPixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2700
     * @tc.number SUB_MEDIA_IMAGE_color_static_2700
     * @tc.desc   createPixelMapSync with color and srcPixelFormat YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_static_2800
     * @tc.number SUB_MEDIA_IMAGE_color_static_2800
     * @tc.desc   createPixelMapSync with color and srcPixelFormat ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_static_2800';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest_color(done, testName, color, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_abnormal_static_0100
     * @tc.number SUB_MEDIA_IMAGE_color_abnormal_static_0100
     * @tc.desc   createPixelMapSync with empty buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_abnormal_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_abnormal_static_0100';
      const color: ArrayBuffer = new ArrayBuffer(0);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096)
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_abnormal_static_0200
     * @tc.number SUB_MEDIA_IMAGE_color_abnormal_static_0200
     * @tc.desc   createPixelMapSync with pixelFormat YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_abnormal_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_abnormal_static_0200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_abnormal_static_0300
     * @tc.number SUB_MEDIA_IMAGE_color_abnormal_static_0300
     * @tc.desc   createPixelMapSync with pixelFormat YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_abnormal_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_abnormal_static_0300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_abnormal_static_0400
     * @tc.number SUB_MEDIA_IMAGE_color_abnormal_static_0400
     * @tc.desc   createPixelMapSync with pixelFormat YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_abnormal_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_abnormal_static_0400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_color_abnormal_static_0500
     * @tc.number SUB_MEDIA_IMAGE_color_abnormal_static_0500
     * @tc.desc   createPixelMapSync with pixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_color_abnormal_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_color_abnormal_static_0500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts, (errCode) => {
        expect(errCode).assertEqual(62980096)
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0100
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0100
     * @tc.desc   createPixelMapSync with opts only and alphaType UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0100';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNKNOWN,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0200
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0200
     * @tc.desc   createPixelMapSync with opts only and alphaType OPAQUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0200';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.OPAQUE,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0300
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0300
     * @tc.desc   createPixelMapSync with opts only and alphaType UNPREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0300';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0400
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0400
     * @tc.desc   createPixelMapSync with opts only and alphaType PREMUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0400';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.PREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0500
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0500
     * @tc.desc   createPixelMapSync with opts only and editable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0500';
      const opts: image.InitializationOptions =
        {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          alphaType: image.AlphaType.UNPREMUL,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0600
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0600
     * @tc.desc   createPixelMapSync with opts only and scaleMode CENTER_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0600';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.CENTER_CROP,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0700
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0700
     * @tc.desc   createPixelMapSync with opts only and scaleMode FIT_TARGET_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0700';
      const opts: image.InitializationOptions =
        {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 4, width: 6 }
        };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0800
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0800
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0800';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_0900
     * @tc.number SUB_MEDIA_IMAGE_opts_static_0900
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_0900';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1000
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1000
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1000';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1100
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1100
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1100';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1200
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1200
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1200';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1300
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1300
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1300';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1400
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1400
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1400';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1500
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1500
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1500';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1600
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1600
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1600';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1700
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1700
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1700';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1800
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1800
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1800';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_1900
     * @tc.number SUB_MEDIA_IMAGE_opts_static_1900
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_1900';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_2000
     * @tc.number SUB_MEDIA_IMAGE_opts_static_2000
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_2000';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opts_static_2100
     * @tc.number SUB_MEDIA_IMAGE_opts_static_2100
     * @tc.desc   createPixelMapSync with opts only and srcPixelFormat ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opts_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opts_static_2100';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })
  })
}