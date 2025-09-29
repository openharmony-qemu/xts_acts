/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

export default function imagePixelMapTest() {
  let filesDir: string | undefined;
  let cacheDir: string | undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHdr: Boolean;
  const RGB_565      = image.PixelMapFormat.RGB_565;
  const RGBA_8888    = image.PixelMapFormat.RGBA_8888;
  const BGRA_8888    = image.PixelMapFormat.BGRA_8888;
  const RGB_888      = image.PixelMapFormat.RGB_888;
  const NV21         = image.PixelMapFormat.NV21;
  const NV12         = image.PixelMapFormat.NV12;
  const CROP_FIRST   = image.CropAndScaleStrategy.CROP_FIRST;
  const SCALE_FIRST  = image.CropAndScaleStrategy.SCALE_FIRST;
  const TEST_DECODE_LARGE_IMAGE_JPEG = "big-30118x30118.jpg";
  const TEST_DECODE_LARGE_IMAGE_HEIC = "big-30000x30000.heic";
  const TEST_DECODE_LARGE_IMAGE_PNG  = "30009x30009_without_alpha.png";

  describe('imagePixelMapTest', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
                      display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(async () => {
      hilog.info(0x0000, 'imagePixelMapTest', '%{public}s', 'afterEach case');
    });

    class Logger {
      testNum: string;

      constructor(testNum: string) {
        this.testNum = testNum;
      }

      log(msg: string) {
        hilog.info(0x0000, "imagePixelMapTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const getBuffer = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead);
      fs.closeSync(file.fd);
      return bufferRead;
    }

    const getImageInfo = async (logger: Logger, buffer: ArrayBuffer, type: string, decodingOptions?: image.DecodingOptions) => {
      try {
        let imageSource = image.createImageSource(buffer);
        let pixelMap: image.PixelMap | undefined = undefined;
        if (type == "sync") {
          if (decodingOptions != undefined) {
            pixelMap = imageSource.createPixelMapSync(decodingOptions);
          } else {
            pixelMap = imageSource.createPixelMapSync();
          }
        } else {
          if (decodingOptions != undefined) {
            pixelMap = await imageSource.createPixelMap(decodingOptions);
          } else {
            pixelMap = await imageSource.createPixelMap();
          }
        }
        let imageInfo = pixelMap.getImageInfoSync();
        await pixelMap?.release();
        await imageSource?.release();
        return imageInfo;
      } catch (error) {
        logger.log("getImageInfo error is: " + JSON.stringify(error));
        return undefined;
      }
    }

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1500) && (imageInfo.size.height == 1500) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV21
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0600
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV12
      };
      let imageInfo = await getImageInfo(logger, buffer, "default", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0700
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_888
      };
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap(decodingOptions);
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 30000, height: 30000 }
      };
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap(decodingOptions);
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_JPEG_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap();
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_565
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGBA_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: BGRA_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV21
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0600
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 }
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0700
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGBA_8888,
          cropAndScaleStrategy: CROP_FIRST
        };
        let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_888
        };
        let pixelMap: image.PixelMap|undefined = undefined;
        try {
          let imageSource = image.createImageSource(buffer);
          pixelMap = await imageSource.createPixelMap(decodingOptions);
          logger.log("createPixelMap end!");
          expect(pixelMap == undefined).assertTrue();
          done();
        } catch (error) {
          logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
          expect(pixelMap == undefined).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 30000, height: 30000 }
        };
        let pixelMap: image.PixelMap|undefined = undefined;
        try {
          let imageSource = image.createImageSource(buffer);
          pixelMap = await imageSource.createPixelMap(decodingOptions);
          logger.log("createPixelMap end!");
          expect(pixelMap == undefined).assertTrue();
          done();
        } catch (error) {
          logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
          expect(pixelMap == undefined).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let pixelMap: image.PixelMap|undefined = undefined;
        try {
          let imageSource = image.createImageSource(buffer);
          pixelMap = await imageSource.createPixelMap();
          logger.log("createPixelMap end!");
          expect(pixelMap == undefined).assertTrue();
          done();
        } catch (error) {
          logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
          expect(pixelMap == undefined).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_HEIC_ERROR_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGB_565,
          cropAndScaleStrategy: SCALE_FIRST
        };
        let pixelMap: image.PixelMap|undefined = undefined;
        try {
          let imageSource = image.createImageSource(buffer);
          pixelMap = await imageSource.createPixelMap(decodingOptions);
          logger.log("createPixelMap end!");
          expect(pixelMap == undefined).assertTrue();
          done();
        } catch (error) {
          logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
          expect(pixelMap == undefined).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_565
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let imageInfo = await getImageInfo(logger, buffer, "defaule", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV21
      };
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap(decodingOptions);
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 30000, height: 30000 }
      };
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap(decodingOptions);
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 30000, height: 30000}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_PNG_ERROR_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let pixelMap: image.PixelMap|undefined = undefined;
      try {
        let imageSource = image.createImageSource(buffer);
        pixelMap = await imageSource.createPixelMap();
        logger.log("createPixelMap end!");
        expect(pixelMap == undefined).assertTrue();
        done();
      } catch (error) {
        logger.log("createPixelMap failed, error is: " + JSON.stringify(error));
        expect(pixelMap == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1500) && (imageInfo.size.height == 1500) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV21
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0600
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: NV12
      };
      let imageInfo = await getImageInfo(logger, buffer, "default", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0700
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_JPEG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGB_565
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: RGBA_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: BGRA_8888
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV21
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV21);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredPixelFormat: NV12
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == NV12);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0600
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 }
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0700
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      } else {
        let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_HEIC);
        let decodingOptions: image.DecodingOptions = {
          desiredSize: { width: 4096, height: 4096 },
          desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
          desiredPixelFormat: RGBA_8888,
          cropAndScaleStrategy: CROP_FIRST
        };
        let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
        if (imageInfo != undefined) {
          logger.log("imageInfo is: " + JSON.stringify(imageInfo));
          let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
          expect(ret).assertTrue();
          buffer = undefined;
          done();
        } else {
          logger.log("imageInfo is undefined!");
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0100
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0200
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_565
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGB_565);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0300
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0400
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == BGRA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0500
     * @tc.desc        1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_FOR_LARGE_IMAGE_SYNC_PNG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
        return;
      }
      let buffer: ESObject = await getBuffer(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };
      let imageInfo = await getImageInfo(logger, buffer, "sync", decodingOptions);
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4096) && (imageInfo.size.height == 4096) && (imageInfo.pixelFormat == RGBA_8888);
        expect(ret).assertTrue();
        buffer = undefined;
        done();
      } else {
        logger.log("imageInfo is undefined!");
        expect().assertFail();
        done();
      }
    })
  })
}