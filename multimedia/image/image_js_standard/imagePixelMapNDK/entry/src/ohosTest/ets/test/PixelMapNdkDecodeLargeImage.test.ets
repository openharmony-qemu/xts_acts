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

import { describe, beforeAll, afterEach, it, expect, TestType, Level, Size } from '@ohos/hypium';
import ndkTest from 'libPixelMapNdk.so';
import image from "@ohos.multimedia.image";
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

const TEST_DECODE_LARGE_IMAGE_JPEG = "big-30118x30118.jpg";
const TEST_DECODE_LARGE_IMAGE_HEIC = "big-30000x30000.heic";
const TEST_DECODE_LARGE_IMAGE_PNG  = "30009x30009_without_alpha.png";
const IMAGE_TOO_LARGE = 7700103;
const DECODE_FAILED = 7700301;
const IMAGE_UNSUPPORTED_OPERATION = 7600201;
const FAILED_TO_ALLOCATE_MEMORY = 7700302;
const SCALE_FIRST = image.CropAndScaleStrategy.SCALE_FIRST;
const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
const AUTO = image.AllocatorType.AUTO;
const DMA = image.AllocatorType.DMA;
const SHARE_MEMORY = image.AllocatorType.SHARE_MEMORY;
const RGB_565 = image.PixelMapFormat.RGB_565;
const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
const RGB_888 = image.PixelMapFormat.RGB_888;
const NV21 = image.PixelMapFormat.NV21;
const NV12 = image.PixelMapFormat.NV12;
let isSupportHEIFDecode: boolean = false;
let isSupportHdr: Boolean = false;
let testContext: common.UIAbilityContext;
let filesDir: string|undefined;
let cacheDir: string|undefined;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function pixelMapNdkDecodeLargeImageTest() {
  describe('pixelMapNdkDecodeLargeImageTest', () => {
    beforeAll(() => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
                      display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(async () => {
      await sleep(2000);
    });

    class Logger {
      testNum: string;
  
      constructor(testNum: string) {
        this.testNum = testNum;
      }
  
      log(msg: string) {
        hilog.info(0x0000, "pixelMapNdkDecodeLargeImageTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const DecodeLargeImageTest = (
      logger: Logger,
      fileName: string,
      desiredInfo: ndkTest.decodeOptions,
      expectInfo: ndkTest.decodeOptions
    ): boolean => {
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        return true;
      }
      let filePath = filesDir + "/" + fileName;
      logger.log("filePath is: " + filePath);
      let imageInfo = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      if (typeof imageInfo == 'object') {
        let ret = (imageInfo.width == expectInfo.width) &&
                  (imageInfo.height == expectInfo.height) &&
                  (imageInfo.pixelFormat == expectInfo.pixelFormat);
        logger.log("check result is: " + ret);
        logger.log("expect info: " + JSON.stringify(expectInfo));
        logger.log("Actual info: " + JSON.stringify(imageInfo));
        return ret;
      } else {
        logger.log("CreatePixelMapAndGetInfo result is not object!");
        return false;
      }
    }

    const DecodeLargeImageForDMATest = (
      logger: Logger,
      fileName: string,
      desiredInfo: ndkTest.decodeOptions,
      expectInfo: ndkTest.decodeOptions,
      allocatorType: image.AllocatorType = AUTO
    ): boolean => {
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        return true;
      }
      let filePath = filesDir + "/" + fileName;
      logger.log("filePath is: " + filePath);
      let imageInfo = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, allocatorType, desiredInfo);
      if (typeof imageInfo == 'object') {
        let ret = (imageInfo.width == expectInfo.width) &&
                (imageInfo.height == expectInfo.height) &&
                (imageInfo.pixelFormat == expectInfo.pixelFormat);
        logger.log("check result is: " + ret);
        logger.log("expect info: " + JSON.stringify(expectInfo));
        logger.log("Actual info: " + JSON.stringify(imageInfo));
        return ret;
      } else {
        logger.log("CreatePixelMapForDMAAndGetInfo result is not object!");
        return false;
      }
    }

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0100");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
        pixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
        pixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 1124,
        height: 1400,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0300
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0300");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0400
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0400");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0500
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0500");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0600
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0600");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0700
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_0700");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 4096, height: 4096 }
     *                       desiredPixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0100");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_888
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == DECODE_FAILED).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_TOO_LARGE).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_JPEG_ERROR_0300");
      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_TOO_LARGE).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0300
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0400
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0500
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0600
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0700
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
        pixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       pixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_888
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, DMA, desiredInfo);
      expect(ret == DECODE_FAILED).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, DMA, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_TOO_LARGE).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 4096, height: 4096 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, SHARE_MEMORY, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_TOO_LARGE).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0400
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_TOO_LARGE).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0500
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_HEIC_ERROR_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
        pixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, DMA, desiredInfo);
      logger.log("CreatePixelMapForDMAAndGetInfo result is: " + ret);
      expect(ret == FAILED_TO_ALLOCATE_MEMORY).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0100");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
        pixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo, DMA);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0300
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0300");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0400
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is SHARE_MEMORY
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0400");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo, SHARE_MEMORY);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0500
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_0500");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageForDMATest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo, AUTO);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0100");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO, desiredInfo);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_TOO_LARGE).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is DMA
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0200");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_TOO_LARGE).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_DMA_NATIVE_PNG_ERROR_0300");
      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapForDMAAndGetInfo(filePath, AUTO);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_TOO_LARGE).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0100");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
        pixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1124, height: 1400 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1124, height: 1400 },
        pixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 1124,
        height: 1400,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0300
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0300");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0400
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0400");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0500
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0500");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0600
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0600");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0700
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_0700");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_JPEG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 4096, height: 4096 }
     *                       desiredPixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0100");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_888
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_JPEG_ERROR_0300");
      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_JPEG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0300
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0400
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV21
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0500
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: NV12
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV12
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0600
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0700
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
        pixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_HEIC, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       pixelFormat: RGB_888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_888
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0400
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
     *                       desiredPixelFormat: RGB_565,
     *                       cropAndScaleStrategy: SCALE_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_HEIC_ERROR_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
        return;
      }

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
        pixelFormat: RGB_565,
        cropAndScaleStrategy: SCALE_FIRST
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_HEIC;
      logger.log("filePath is: " + filePath);
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0100
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
     *                       desiredPixelFormat: RGBA_8888,
     *                       cropAndScaleStrategy: CROP_FIRST
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0100");
      let desiredInfo: ndkTest.decodeOptions = {
          width: 4096,
          height: 4096,
          desiredRegion: { x: 0, y: 0, width: 1500, height: 1500 },
          pixelFormat: RGBA_8888,
          cropAndScaleStrategy: CROP_FIRST
        };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGB_565
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0200");
      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGB_565
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0300
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0300");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0400
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096},
     *                       desiredPixelFormat: BGRA_8888
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0400");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: BGRA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0500
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_0500");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096
      };

      let expectInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: RGBA_8888
      };

      let ret = DecodeLargeImageTest(logger, TEST_DECODE_LARGE_IMAGE_PNG, desiredInfo, expectInfo);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0100
     * @tc.desc        1.create pixelmap object by imageSource, set AllocatorType is AUTO
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 4096, height: 4096}
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0100");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 4096,
        height: 4096,
        pixelFormat: NV21
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0200
     * @tc.desc        1.create pixelmap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: { width: 30000, height: 30000 }
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0200");

      let desiredInfo: ndkTest.decodeOptions = {
        width: 30000,
        height: 30000
      };

      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath, desiredInfo);
      logger.log("create pixelMap result is: " + ret);
      if (typeof ret == 'number') {
        expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      } else {
        logger.log("create pixelMap result typeof is not number!");
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0300
     * @tc.desc        1.create pixelmap object by imageSource, do not specify AllocatorType type
     * @tc.size        MediumTest
     * 
     * @tc.type        Functional
     * @tc.level       Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_LARGE_IMAGE_NATIVE_PNG_ERROR_0300");
      let filePath = filesDir + "/" + TEST_DECODE_LARGE_IMAGE_PNG;
      let ret = ndkTest.CreatePixelMapAndGetInfo(filePath);
      logger.log("create pixelMap result is: " + ret);
      expect(ret == IMAGE_UNSUPPORTED_OPERATION).assertTrue();
      done();
    });
  })
}