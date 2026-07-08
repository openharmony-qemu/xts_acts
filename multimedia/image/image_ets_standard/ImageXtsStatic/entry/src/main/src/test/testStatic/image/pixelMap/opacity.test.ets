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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'imageXts.opacity';

async function opacityPromiseTest(done: () => void, testName: string, opts: image.InitializationOptions, rate: number,
  callback: (data: boolean) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    console.info(TAG, `createPixelMapSync`, testName);
    if (pixelMap != undefined) {
      await pixelMap.opacity(rate);
      callback(true);
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      callback(false);
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacityPromiseAbnormalTest(done: () => void, testName: string, opts: image.InitializationOptions,
  rate: number, errorCallback: (data: number) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      console.info(TAG, `createPixelMapSync`, testName);
      await pixelMap.opacity(rate);
      console.info(TAG, testName, 'opacity succeeded, but should have failed');
      expect().assertFail();
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      errorCallback(-1);
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    errorCallback(error.code);
    done();
  }
}

async function opacityCallbackTest(done: () => void, testName: string, opts: image.InitializationOptions, rate: number,
  callback: (data: boolean) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    console.info(TAG, `createPixelMapSync`, testName);
    if (pixelMap != undefined) {
      pixelMap.opacity(rate, (err: BusinessError<void> | null) => {
        if (err) {
          console.error(`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info("Succeeded in setting opacity.");
          callback(true);
        }
      });
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      callback(false);
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacityCallbackAbnormalTest(done: () => void, testName: string, opts: image.InitializationOptions,
  rate: number, errorCallback: (data: string) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      pixelMap.opacity(rate, (err: BusinessError<void> | null) => {
        if (err) {
          console.error(TAG, testName, `Failed to set opacity. err is ${err}, message is ${err.message}`);
          errorCallback(JSON.stringify(err));
        } else {
          console.info(TAG, testName, "Succeeded in setting opacity.");
          expect().assertFail();
        }
      });
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      expect().assertFail();
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    errorCallback(JSON.stringify(error));
    done();
  }
}

export default function pixelMapOpacityTest(): void {
  describe('pixelMapOpacityTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0100
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0100
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0100';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0200
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0200
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0200';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.0000001;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0300
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0300
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0300';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: int = 1;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0400
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0400
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0400';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0500
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0500
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0500';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.0000001;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_opacity_static_0600
     * @tc.number SUB_MEDIA_IMAGE_opacity_static_0600
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_opacity_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_opacity_static_0600';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: int = 1;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })
  })
}