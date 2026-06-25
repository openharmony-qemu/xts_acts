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

import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '../../../../../../hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'xts.imageSourceGetImageInfoSync';

async function getImageSource(pathUri: string): Promise<image.ImageSource> {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi!.getImageInfoSync()));
  return imageSourceApi!;
}

export default function ImageSourceGetImageInfoSyncTest(): void {
  describe('ImageSourceGetImageInfoSyncTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0100
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0100';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0200
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0200';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(226);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0300
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0300';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0400
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0400';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0500
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0500';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0600
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0600';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0700
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0700';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0800
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0800';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(472);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0900
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0900
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_0900';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(75);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1000
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1000';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1100
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1100';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1200
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1200';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1300
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1300';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1400
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1400';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1500
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1500
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1500';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(286);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1600
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1600
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1600';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(221);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1700
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1700
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1700';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1800
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1800
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1800';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1900
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1900
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_1900';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2000
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2000
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2000';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2100
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2100
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2100';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2200
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2200
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2200';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.width);
        expect(imageInfo!.size.width).assertEqual(1446);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2300
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2300
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2300';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, 'imageInfo!.size.width:' + imageInfo!.size.height);
        expect(imageInfo!.size.height).assertEqual(1476);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2400
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2400
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2400';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.density));
        expect(imageInfo!.density).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2500
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2500
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2500';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.stride));
        expect(imageInfo!.stride).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2600
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2600
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2600';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.pixelFormat));
        expect(imageInfo!.pixelFormat).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2700
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2700
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2700';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.alphaType));
        expect(imageInfo!.alphaType).assertEqual(0);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2800
     * @tc.number SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2800
     * @tc.desc   imageSource_getImageInfoSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imageSource_getImageInfoSync_static_2800';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let imageInfo: image.ImageInfo | undefined = imageSourceApi!.getImageInfoSync(0);
        console.info(TAG, testName, `imageInfo `,JSON.stringify(imageInfo!.isHdr));
        expect(imageInfo!.isHdr).assertFalse();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
  })
}