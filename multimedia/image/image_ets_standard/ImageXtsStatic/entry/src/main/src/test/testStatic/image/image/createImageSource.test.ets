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

import { image } from '@kit.ImageKit';
import fs from '@ohos.file.fs';
import resourceManager from "@ohos.resourceManager";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../../../hypium';
import { Context } from '@kit.AbilityKit';

const TAG = 'ImageXts.createImageSource';

let testContext: Context = Hypium.get("Context") as Context;

async function createImageSourcePromiseTest(done: () => void, testName: string, pathUri: string,
  SourceOptions?: image.SourceOptions) {
  const path = testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  console.log(TAG, JSON.stringify(imageSourceApi))
  let imageInfo = await imageSourceApi!.createPixelMap();
  console.log(TAG, JSON.stringify(imageInfo), JSON.stringify(imageInfo!.getImageInfoSync().size.height));
  expect(imageInfo != undefined).assertTrue();
  done();
}

async function createImageSourceFdPromiseTest(done: () => void, testName: string, pathUri: string,
  SourceOptions?: image.SourceOptions) {
  const path = testContext.filesDir + "/" + pathUri;
  let file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  const imageSourceApi: image.ImageSource | undefined =
    SourceOptions ? image.createImageSource(file.fd, SourceOptions) : image.createImageSource(file.fd.toInt());
  let imageInfo = await imageSourceApi!.createPixelMap();
  console.log(TAG, JSON.stringify(imageInfo), JSON.stringify(imageInfo!.getImageInfoSync().size.height));
  fs.closeSync(file);
  expect(imageInfo != undefined).assertTrue();
  done();
}

async function createImageSourceBufPromiseTest(done: () => void, testName: string, buf: ArrayBuffer,
  SourceOptions?: image.SourceOptions) {
  const imageSourceApi: image.ImageSource | undefined =
    SourceOptions ? image.createImageSource(buf, SourceOptions) : image.createImageSource(buf);
  expect(JSON.stringify(imageSourceApi) != undefined).assertTrue();
  done();
}

async function createImageSourceRawfilePromiseTest(done: () => void, testName: string, path: string,
  SourceOptions?: image.SourceOptions) {
  const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
  let rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(path)
  const imageSourceApi: image.ImageSource | undefined =
    SourceOptions ? image.createImageSource(rawFileDescriptor, SourceOptions) :
      image.createImageSource(rawFileDescriptor);
  expect(imageSourceApi !== undefined).assertTrue();
  done();
}

export default function createImageSourceTest(): void {
  describe('createImageSourceTest', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1200
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1200
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1200';
      const path = 'test.jpg';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1300
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1300
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1300';
      const path = 'test6.gif';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1400
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1400
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1400';
      const path = 'test7.png';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1500
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1500
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1500';
      const path = 'test_exif_empty2.webp';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1600
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1600
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1600';
      const path = 'test_dng.dng';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1700
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1700
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1700';
      const path = 'test_aisr.ico';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1800
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1800
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1800';
      const path = 'test.svg';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_1900
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_1900
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_1900';
      const path = 'test8.bmp';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2000
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2000
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2000';
      const path = 'test.jpg';
      try {
        await createImageSourcePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2100
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2100
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2100';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test.jpg';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2200
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2200
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2200';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const path = 'test6.gif';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2300
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2300
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2300';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 1,
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceSize: {
          height: 1,
          width: 1
        }
      };
      const path = 'test7.png';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2400
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2400
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2400';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test_exif_empty2.webp';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2500
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2500
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2500';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.RGB_888,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test_dng.dng';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2600
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2600
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2600';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test_aisr.ico';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2700
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2700
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2700';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test.svg';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2800
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2800
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2800';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test8.bmp';
      try {
        await createImageSourcePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_2900
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_2900
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_2900';
      const path = 'test.jpg';
      try {
        await createImageSourceFdPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3000
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3000
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3000';
      const path = 'test8.bmp';
      try {
        await createImageSourceFdPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3100
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3100
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3100';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      const path = 'test.jpg';
      try {
        await createImageSourceFdPromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3200
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3200
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3200';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test8.bmp';
      try {
        await createImageSourceFdPromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3300
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3300
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3300';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      try {
        await createImageSourceBufPromiseTest(done, testName, buf);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3400
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3400
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3400';
      const buf: ArrayBuffer = new ArrayBuffer(1000);
      try {
        await createImageSourceBufPromiseTest(done, testName, buf);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3500
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3500
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3500';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      try {
        await createImageSourceBufPromiseTest(done, testName, buf, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3600
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3600
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3600';
      const buf: ArrayBuffer = new ArrayBuffer(1000);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      try {
        await createImageSourceBufPromiseTest(done, testName, buf, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3700
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3700
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3700';
      const path = 'test.jpg';
      try {
        await createImageSourceRawfilePromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3800
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3800
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3800';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      const path = 'test6.gif';
      try {
        await createImageSourceRawfilePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createImageSource_static_3900
     * @tc.number SUB_MEDIA_IMAGE_createImageSource_static_3900
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_3900';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test6.gif';
      try {
        await createImageSourceRawfilePromiseTest(done, testName, path, sourceOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4000
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4000
     * @tc.desc       createImageSource cover sourceDensity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4000';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceDensity为：' + sourceOptions.sourceDensity);
        expect(sourceOptions.sourceDensity).assertEqual(120);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4100
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4100
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4100';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4200
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4200
     * @tc.desc       createImageSource cover sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4200';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceSize为：' + sourceOptions.sourceSize?.height);
        expect(sourceOptions.sourceSize?.height).assertEqual(4);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4300
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4300
     * @tc.desc       createImageSource cover sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4300';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceSize为：' + sourceOptions.sourceSize?.width);
        expect(sourceOptions.sourceSize?.width).assertEqual(6);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4400
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4400
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4400';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(3);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4500
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4500
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4500';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV21,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(8);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4600
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4600
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4600';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(10);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4700
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4700
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4700';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(11);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4800
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4800
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4800';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(12);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_4900
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_4900
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_4900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_4900';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(0);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5000
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5000
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5000';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(3);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5100
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5100
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5100';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV21,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(8);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5200
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5200
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5200';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(10);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5300
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5300
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5300';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(11);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5400
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5400
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5400';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(12);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5500
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5500
     * @tc.desc       createImageSource cover supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5500';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'succeed', JSON.stringify(imageSourceObj!.supportedFormats));
        expect(imageSourceObj!.supportedFormats != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5600
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5600
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5600';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5700
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5700
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5700';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_565,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5800
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5800
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5800';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_5900
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_5900
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_5900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_5900';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_888,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6000
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6000
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6000';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6100
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6100
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6100';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6200
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6200
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6200';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV12,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6300
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6300
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6300';
      try {
        const data: ArrayBuffer = new ArrayBuffer(120);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
        expect(imageSourceObj != null).assertTrue();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6400
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6400
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6400';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6500
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6500
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6500';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_565,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6600
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6600
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6600';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6700
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6700
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6700';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6800
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6800
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6800';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_6900
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_6900
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_6900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_6900';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_7000
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_7000
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_7000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_7000';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV12,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageSource_static_7100
     * @tc.name       SUB_MEDIA_IMAGE_createImageSource_static_7100
     * @tc.desc       createImageSource cover pixelFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageSource_static_7100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageSource_static_7100';
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, `imageSourceObj`,imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
  })
}