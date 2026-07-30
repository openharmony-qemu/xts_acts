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
import { BusinessError } from '@kit.BasicServicesKit';
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect, Level} from '../../../../../../hypium';

const TAG = 'ImageXts.createPixelMap';

async function createPixelMapPromiseTest(done: () => void, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  let pixelMap = await image.createPixelMap(color, opts)
  expect(pixelMap.isEditable === opts.editable).assertTrue();
  done();
}

async function createPixelMapCallbackTest(done: () => void, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  image.createPixelMap(color, opts, (error: BusinessError | null, pixelMap: image.PixelMap | undefined) => {
    if (error) {
      console.error(TAG, `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
      expect().assertFail();
      done();
    } else {
      console.info(TAG, 'Succeeded in creating pixelmap.');
      expect(pixelMap!.isEditable === opts.editable).assertTrue();
      done();
    }
  })
}

export default function createPixelMapTest(): void  {
  describe('createPixelMapTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0400
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0500
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0500';
      const color: ArrayBuffer = new ArrayBuffer(1000 * 1000 * 4);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 1000, width: 1000 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0600
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0700
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0700
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0800
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0800
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0800';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_0900
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_0900
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_0900';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1000
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1000
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1000';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1100
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1100
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1200
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1200
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1300
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1300
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1400
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1400
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1500
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1500
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1600
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1600
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1700
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1700
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1800
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1800
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1800';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_1900
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_1900
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_1900';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2000
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2000
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2000';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2100
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2100
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2200
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2200
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2300
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2300
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2300';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2400
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2400
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2400';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2500
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2500
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2500';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2600
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2600
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2600';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      try {
        await createPixelMapCallbackTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMap_static_2700
     * @tc.number SUB_MEDIA_IMAGE_createPixelMap_static_2700
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMap_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMap_static_2700';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      try {
        await createPixelMapPromiseTest(done, testName, color, opts);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}