'use static'
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../../hypium';

const TAG = 'createPremultipliedPixelMap';

async function createPremultipliedPixelMapCallbackTest(done: () => void, testName: string, color: ArrayBuffer,
  optsForUnpre: image.InitializationOptions, optsForPre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i + 1) as int] = 255;
      bufferArr[(i + 2) as int] = 122;
      bufferArr[(i + 3) as int] = 122;
    }
    let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
    let dstPixelMap = image.createPixelMapSync(optsForPre);
    image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError | null ) => {
      if (error) {
        console.error(TAG, `Failed to convert pixelmap, error code is ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, 'Succeeded in converting pixelmap.');
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPremultipliedPixelMapPromiseTest(done: () => void, testName: string, color: ArrayBuffer,
  optsForUnpre: image.InitializationOptions, optsForPre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i: int = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[(i + 1) as int] = 255;
      bufferArr[(i + 2) as int] = 122;
      bufferArr[(i + 3) as int] = 122;
    }
    let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
    let dstPixelMap = image.createPixelMapSync(optsForPre);
    await image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function createPremultipliedPixelMapTest(): void {
  describe('createPremultipliedPixelMapTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0100
     * @tc.desc   createPremultipliedPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0100';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0200
     * @tc.desc   createPremultipliedPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0200';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0300
     * @tc.desc   createPremultipliedPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0300';
      const color: ArrayBuffer = new ArrayBuffer(1000 * 1000 * 4);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 1000, width: 1000 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 1000, width: 1000 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0400
     * @tc.desc   createPremultipliedPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0400';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        await createPremultipliedPixelMapPromiseTest(done, testName, color, optsForUnpre, optsForPre);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0500
     * @tc.desc   getAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPremultipliedPixelMap_static_0500';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      try {
        await createPremultipliedPixelMapPromiseTest(done, testName, color, optsForUnpre, optsForPre);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}