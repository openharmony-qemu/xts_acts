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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { hdrCapability } from '@kit.ArkGraphics2D';
import display from '@ohos.display';
import { Context } from '@kit.AbilityKit';

const TAG = `PictureSetMainPixelmapTest`;

export default function PictureSetMainPixelmapTest() {
  let filesDir: string | undefined;
  let isSupportHdrbyVPE: Boolean;
  let isSupportHdrbyScreen: Boolean;
  let context: Context = Hypium.get("Context") as Context;

  describe('PictureSetMainPixelmapTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      filesDir = context.filesDir;
      isSupportHdrbyScreen =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
      console.info('isSupportHdrbyScreen is ' + isSupportHdrbyScreen);
      isSupportHdrbyVPE = await fs.accessSync("/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so");
      console.info('isSupportHdrbyVPE is ' + isSupportHdrbyVPE);
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

    //-------------------------------------判断设备是否支持mimeType类型的图片解码-------------------------------------
    const isSupportDecode = async (testName: string, mimeType: string) => {
      let isSupportedFormat: boolean = false;
      let supportedFormats = await image.getImageSourceSupportedFormats();
      console.info(`${testName} supportedFormats have ${JSON.stringify(supportedFormats)}`);
      isSupportedFormat = supportedFormats.includes(mimeType);
      console.info(`${testName} isSupportedFormat is ${isSupportedFormat}`);
      return isSupportedFormat;
    }
    //-------------------------------------通过failPath将图片解码成图片(走PixelMap)-------------------------------------
    const getPicture =
      async (testName: string, fileName: string, DecodingOptions?: image.DecodingOptions): Promise<image.Picture | undefined> => {
        const filePath = filesDir + '/' + fileName
        console.info(`${testName} filePath is ${filePath}`);
        let imageSourceApi: image.ImageSource | undefined;
        console.info(`${testName} getPicture is starting`);
        imageSourceApi = await image.createImageSource(filePath);
        console.info(`${testName} createImageSource success`);
        let pixelMap: image.PixelMap | undefined;
        if (DecodingOptions != undefined) {
          console.info(`${testName} createPixelMap with DecodingOptions is staring`);
          pixelMap = await imageSourceApi!.createPixelMap(DecodingOptions);
          console.info(`${testName} createPixelMap with DecodingOptions success`);
        } else {
          console.info(`${testName} createPixelMap withOut DecodingOptions is staring`);
          pixelMap = await imageSourceApi!.createPixelMap();
          console.info(`${testName} createPixelMap withOut DecodingOptions success`);
        }
        console.info(`${testName} createPicture is staring`);
        let picture: image.Picture = await image.createPicture(pixelMap!);
        console.info(`${testName} getPicture is ending`);
        await imageSourceApi!.release();
        await pixelMap!.release();
        return picture;
      }

    //-------------------------------------通过failPath将图片解码成图片(走createImageSource)-------------------------------------
    const getPictureForSource = async (testName: string, fileName: string): Promise<image.Picture | undefined> => {
      const filePath = filesDir + '/' + fileName
      console.info(`${testName} filePath is ${filePath}`);
      let imageSourceApi: image.ImageSource | undefined;
      console.info(`${testName} getPictureForSource is starting`);
      imageSourceApi = await image.createImageSource(filePath);
      let picture: image.Picture | undefined = await imageSourceApi!.createPicture();
      console.info(`${testName} getPictureForSource is ending`);
      await imageSourceApi!.release();
      return picture;
    }

    /**
     * PictureA：getPicture->getMainPixelmap
     * pictureB：getPicture->setMainPixelmap(A)->getMainPixelmap(B) === getMainPixelmap(B)
     */

    const comparisonMainPixelmap =
      async (testName: string, picture1: image.Picture, picture2: image.Picture): Promise<boolean> => {
        let result = false;
        try {
          console.info(`${testName} comparisonMainPixelmap is starting`);
          let pixelMap1: image.PixelMap | undefined = await picture1.getMainPixelmap();
          let imageInfo1: image.ImageInfo = await pixelMap1!.getImageInfo();
          console.info(`${testName} picture1 imageInfo is ${JSON.stringify(imageInfo1)}`);
          await picture2.setMainPixelmap(pixelMap1!);
          let pixelMap2: image.PixelMap | undefined = await picture2.getMainPixelmap();
          let imageInfo: image.ImageInfo = await pixelMap2!.getImageInfo();
          console.info(`${testName} picture2 imageInfo is ${JSON.stringify(imageInfo)}`);
          result =
            imageInfo1.size.width == imageInfo.size.width &&
              imageInfo1.size.height == imageInfo.size.height &&
              imageInfo1.pixelFormat == imageInfo.pixelFormat;
          await pixelMap1!.release();
          await pixelMap2!.release();
        } catch (error) {
          console.error(` ${testName} comparisonMainPixelmap error is ${error.code},message is ${error.message}`);
        }
        await picture1.release();
        await picture2.release();
        return result;
      }

    // heic setMainPixelmap with otherPicture

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0100
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0100'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.jpg";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0200
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0200'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.jpg";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0300
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0300'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.jpg";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0400
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0400'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.jpg";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0500
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0500'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.png";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0600
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0600'
      let fileName1 = "0801_sdr2.heic";
      let fileName2 = "test.png";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0700
     * @tc.desc   1.set pictuer mainPixelmap error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0700'
      let fileName = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic = await getPicture(testName, fileName);
        let pixelMap: image.PixelMap | undefined = await pic!.getMainPixelmap();
        await pixelMap!.release();
        console.info(`${testName} start setMainPixelmap.`);
        await pic!.setMainPixelmap(pixelMap!);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700204);
        done();
      }
    })

    // jpeg setMainPixelmap with otherPicture

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0800
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0800'
      let fileName1 = "test.jpg";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0900
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_0900'
      let fileName1 = "test.jpg";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1000
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1000'
      let fileName1 = "test.jpg";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1100
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1100
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1100'
      let fileName1 = "test.jpg";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1200
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1200
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1200'
      let fileName1 = "test.jpg";
      let fileName2 = "test.png";
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1300
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1300
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1300'
      let fileName1 = "test.jpg";
      let fileName2 = "test.png";
      try {
        let pic1 = await getPictureForSource(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1400
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1400
     * @tc.desc   1.set pictuer mainPixelmap error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1400'
      let fileName = "test.jpg";
      try {
        let pic = await getPicture(testName, fileName);
        let pixelMap: image.PixelMap | undefined = await pic!.getMainPixelmap();
        await pixelMap!.release();
        await pic!.setMainPixelmap(pixelMap!);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700204);
        done();
      }
    })

    // png setMainPixelmap with otherPicture

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1500
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1500
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1500'
      let fileName1 = "test.png";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1600
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1600
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1600'
      let fileName1 = "test.png";
      let fileName2 = "0801_sdr2.heic";
      let resurt = await isSupportDecode(testName, 'image/heic');
      if (!resurt) {
        console.info(`${testName} The device does not support decoding of HEIC images.`);
        done();
        return;
      }
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1700
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1700
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1700'
      let fileName1 = "test.png";
      let fileName2 = "test.jpg";
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPicture(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1800
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1800
     * @tc.desc   1.set pictuer mainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1800'
      let fileName1 = "test.png";
      let fileName2 = "test.jpg";
      try {
        let pic1 = await getPicture(testName, fileName1);
        let pic2 = await getPictureForSource(testName, fileName2);
        let result = await await comparisonMainPixelmap(testName, pic1!, pic2!);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1900
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1900
     * @tc.desc   1.set pictuer mainPixelmap error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_1900'
      let fileName = "test.png";
      try {
        let pic = await getPicture(testName, fileName);
        let pixelMap: image.PixelMap | undefined = await pic!.getMainPixelmap();
        await pixelMap!.release();
        await pic!.setMainPixelmap(pixelMap!);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700204);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2000
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2000
     * @tc.desc   setMainPixelmap cover isEditable true, verify mainPixelmap.isEditable is true after setMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2000';
      console.info(TAG, `start: ${testName}`);
      try {
        let pic = await getPicture(testName, 'test.jpg');
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        let newPixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(newPixelMap.isEditable).assertTrue();
        pic!.setMainPixelmap(newPixelMap);
        let mainPixelmap: image.PixelMap | undefined = pic!.getMainPixelmap();
        expect(mainPixelmap!.isEditable).assertTrue();
        await newPixelMap.release();
        await mainPixelmap!.release();
        await pic!.release();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2100
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2100
     * @tc.desc   setMainPixelmap cover isEditable false, verify mainPixelmap.isEditable is false after setMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2100';
      console.info(TAG, `start: ${testName}`);
      try {
        let pic = await getPicture(testName, 'test.jpg');
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        let newPixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(newPixelMap.isEditable).assertFalse();
        pic!.setMainPixelmap(newPixelMap);
        let mainPixelmap: image.PixelMap | undefined = pic!.getMainPixelmap();
        expect(mainPixelmap!.isEditable).assertFalse();
        await newPixelMap.release();
        await mainPixelmap!.release();
        await pic!.release();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2200
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2200
     * @tc.desc   setMainPixelmap cover isStrideAlignment false (AUTO allocator), verify mainPixelmap.isStrideAlignment is false after setMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2200';
      console.info(TAG, `start: ${testName}`);
      try {
        let pic = await getPicture(testName, 'test.jpg');
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        let newPixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.AUTO);
        expect(newPixelMap.isStrideAlignment).assertFalse();
        pic!.setMainPixelmap(newPixelMap);
        let mainPixelmap: image.PixelMap | undefined = pic!.getMainPixelmap();
        expect(mainPixelmap!.isStrideAlignment).assertFalse();
        await newPixelMap.release();
        await mainPixelmap!.release();
        await pic!.release();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2300
     * @tc.number SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2300
     * @tc.desc   setMainPixelmap cover isStrideAlignment true (DMA allocator), verify mainPixelmap.isStrideAlignment is true after setMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_PICTURE_SET_MAIN_PIXELMAP_2300';
      console.info(TAG, `start: ${testName}`);
      try {
        let pic = await getPicture(testName, 'test.jpg');
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE
        };
        let dmaPixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(opts, image.AllocatorType.DMA);
        expect(dmaPixelMap.isStrideAlignment).assertTrue();
        pic!.setMainPixelmap(dmaPixelMap);
        let mainPixelmap: image.PixelMap | undefined = pic!.getMainPixelmap();
        expect(mainPixelmap!.isStrideAlignment).assertTrue();
        await dmaPixelMap.release();
        await mainPixelmap!.release();
        await pic!.release();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}