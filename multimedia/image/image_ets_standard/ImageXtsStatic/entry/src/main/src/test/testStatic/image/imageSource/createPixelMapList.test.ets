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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'xts.createPixelMapList';

async function createPixelMapListPromiseTest(done: () => void, testName: string, pathUri: string,
  options?: image.DecodingOptions) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let pixelMapList: Array<image.PixelMap> | undefined = await imageSourceApi!.createPixelMapList(options);
  expect(pixelMapList!.length > 0).assertTrue();
  imageSourceApi!.release();
  done();
}

async function createPixelMapListCallbackTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.createPixelMapList((err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
    if (err) {
      console.error(TAG, `Failed to create pixelMapList object, error code is ${err}`);
      expect().assertFail();
    } else {
      console.info(TAG, 'Succeeded in creating pixelMapList object.');
      expect(pixelMapList!.length > 0).assertTrue();
    }
    imageSourceApi!.release();
    done();
  })
}

async function createPixelMapListCallbackOptionsTest(done: () => void, testName: string, pathUri: string,
  options: image.DecodingOptions) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.createPixelMapList(options,
    (err: BusinessError | null, pixelMapList: Array<image.PixelMap> | undefined) => {
      if (err) {
        console.error(TAG, `Failed to create pixelMapList object, error code is ${err}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in creating pixelMapList object.');
        expect(pixelMapList!.length > 0).assertTrue();
      }
      imageSourceApi!.release();
      done();
    })
}

export default function CreatePixelMapListTest(): void {
  describe('CreatePixelMapListTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0100
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0100
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0100';
      const path = 'test.jpg';
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
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0200
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0200
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0200';
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
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0300
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0300
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0300';
      const path = 'test.jpg';
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
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0400
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0400
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0400';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0500
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0500';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360
      };
      try {
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0600
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0600
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0600';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true
      };
      try {
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0700
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0700
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0700';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {};
      try {
        await createPixelMapListPromiseTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0800
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0800
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0800';
      const path = 'test.jpg';
      try {
        await createPixelMapListPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_0900
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_0900
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_0900';
      const path = 'test.svg';
      try {
        await createPixelMapListPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1000
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1000
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1000';
      const path = 'test.jpg';
      try {
        await createPixelMapListCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1100
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1100
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1100';
      const path = 'test.svg';
      try {
        await createPixelMapListCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1200
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1200
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1200';
      const path = 'test.jpg';
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
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1300
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1300
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1300';
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
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1400
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1400
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1400';
      const path = 'test.jpg';
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
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1500
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1500
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1500';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0
      };
      try {
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1600
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1600
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1600';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 360
      };
      try {
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1700
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1700
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1700';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true
      };
      try {
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createPixelMapList_static_1800
     * @tc.number SUB_MEDIA_IMAGE_createPixelMapList_static_1800
     * @tc.desc   imageSource_createPixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createPixelMapList_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createPixelMapList_static_1800';
      const path = 'test.jpg';
      let decodingOptions: image.DecodingOptions = {};
      try {
        await createPixelMapListCallbackOptionsTest(done, testName, path, decodingOptions);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}