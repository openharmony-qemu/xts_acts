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
import taskpool from '@ohos.taskpool';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePixelMapTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

interface exceptDecodeOptions {
  expectedWidth: number;
  expectedHeight: number;
  expectedPixelFormat: image.PixelMapFormat;
}

async function createPixelMapSyncInTaskPool(
  logger: Logger,
  filePath: string,
  decodingOptions: image.DecodingOptions,
  expectedDecodeOpts: exceptDecodeOptions
): Promise<boolean> {
  logger.log("taskpool start");
  try {
    let task = new taskpool.Task(createPixelMapSyncPixelTest, filePath, decodingOptions, expectedDecodeOpts);
    let ret = (await taskpool.execute(task)) as boolean;
    logger.log("taskpool ret is: " + ret);
    return ret;
  } catch (error) {
    logger.log('taskpool execute error is ' + error);
    return false;
  }
}

@Concurrent
async function createPixelMapSyncPixelTest(
  filePath: string,
  decodingOptions: image.DecodingOptions,
  expectedDecodeOpts: exceptDecodeOptions
): Promise<boolean> {
  console.info("asynchronous blocking start!");
  // 模拟异步操作
  return await new Promise<boolean>((resolve) => {
    setTimeout(() => {
      console.log('asynchronous blocking: filePath is:' + filePath);
      console.log('asynchronous blocking: decodingOptions:' + JSON.stringify(decodingOptions));
      console.log('asynchronous blocking: expectedDecodeOpts:' + JSON.stringify(expectedDecodeOpts));

      const src = image.createImageSource(filePath);
      console.log("asynchronous blocking: createImageSource end!");
      let pm: image.PixelMap = src.createPixelMapSync(decodingOptions);
      console.log("asynchronous blocking: createPixelMapSync end!");
      const imageInfo = pm.getImageInfoSync();
      console.log("asynchronous blocking: getImageInfoSync end, InfoSync is:" + JSON.stringify(imageInfo));
      let ret = (imageInfo.size.width == expectedDecodeOpts.expectedWidth) &&
                (imageInfo.size.height == expectedDecodeOpts.expectedHeight) &&
                (imageInfo.pixelFormat == expectedDecodeOpts.expectedPixelFormat);
      console.log("asynchronous blocking: ret is: " + ret);
      pm.release();
      src.release();
      console.log('asynchronous blocking end!');
      resolve(ret);
    }, 15000);
  });
}

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
  const test_wbmp = 'test.wbmp';

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

    let getFilePath = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      return filePath;
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

    const checkPixelMap = async (
      logger: Logger,
      decodeOption: image.DecodingOptions,
      originImageInfo: image.ImageInfo|undefined,
      exceptedMimeType?: string
    ): Promise<boolean> => {
      let ret = false;
      logger.log("originImageInfo is:" + JSON.stringify(originImageInfo));
      ret = (decodeOption.desiredSize?.width  == originImageInfo!.size.width) &&
            (decodeOption.desiredSize?.height == originImageInfo!.size.height) &&
            (decodeOption.desiredPixelFormat  == originImageInfo!.pixelFormat) &&
            (exceptedMimeType == undefined || exceptedMimeType == originImageInfo!.mimeType);
      return ret;
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
      let filePath: string = await getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredRegion: { size: { width: 1500, height: 1500 }, x: 0, y: 0 },
        desiredPixelFormat: RGBA_8888,
        cropAndScaleStrategy: CROP_FIRST
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncInTaskPool(logger, filePath, decodingOptions, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
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
      let filePath: string = await getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGB_565
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGB_565
      }
      
      let ret = await createPixelMapSyncInTaskPool(logger, filePath, decodingOptions, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
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
      let filePath: string = await getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: RGBA_8888
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncInTaskPool(logger, filePath, decodingOptions, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
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
      let filePath: string = await getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 },
        desiredPixelFormat: BGRA_8888
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: BGRA_8888
      }
      let ret = await createPixelMapSyncInTaskPool(logger, filePath, decodingOptions, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
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
      let filePath: string = await getFilePath(TEST_DECODE_LARGE_IMAGE_PNG);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 4096, height: 4096 }
      };

      let verifyDecodeOpts: exceptDecodeOptions = {
        expectedWidth: 4096,
        expectedHeight: 4096,
        expectedPixelFormat: RGBA_8888
      }
      let ret = await createPixelMapSyncInTaskPool(logger, filePath, decodingOptions, verifyDecodeOpts);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0100
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SONY_A350.ARW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A350.ARW");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0200
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SONY_A900.ARW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ARW_0200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A900.ARW");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1616) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0300
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_CANON_G9.CR2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G9.CR2");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0400
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_CANON_G10.CR2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR2_0400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G10.CR2");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0500
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_D90.NEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D90.NEF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4288) && (imageInfo.size.height == 2848) && (imageInfo.mimeType == "image/x-nikon-nef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0600
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_E5700_SRGB.NEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NEF_0600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D3300.NEF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-nikon-nef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0700
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_COOLPIX_P340.NRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_COOLPIX_P340.NRW");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 3000) && (imageInfo.mimeType == "image/x-nikon-nrw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0800
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_P6000_GPS.NRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_NRW_0800");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_P6000_GPS.NRW");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4224) && (imageInfo.size.height == 3168) && (imageInfo.mimeType == "image/x-nikon-nrw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_0900
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_OLYMPUS_E3.ORF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_0900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_0900");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E3.ORF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_1000
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_OLYMPUS_E410.ORF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_1000', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_ORF_1000");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E410.ORF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1100
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PENTAX_STAR_DL.PEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STAR_DL.PEF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2000) && (imageInfo.mimeType == "image/x-pentax-pef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1200
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PENTAX_STARISTD_SRGB.PEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_PEF_1200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STARISTD_SRGB.PEF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2008) && (imageInfo.mimeType == "image/x-pentax-pef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1300
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_FUJI_S6500FD.RAF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S6500FD.RAF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1400
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_FUJI_S9500_SRGB.RAF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RAF_1400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S9500_SRGB.RAF");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1500
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PANASONIC_G1.RW2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_G1.RW2");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1440) && (imageInfo.mimeType == "image/x-panasonic-rw2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1600
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PANASONIC_LX3.RW2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_RW2_1600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_LX3.RW2");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-panasonic-rw2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_SRW_1700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_SRW_1700
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SAMSUNG_EX2F.SRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_SRW_1700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_SRW_1700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SAMSUNG_EX2F.SRW");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 2248) && (imageInfo.mimeType == "image/x-samsung-srw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1800
     * @tc.desc      : 1.create pixelMap object by imageSource -- 023A9785.CR3
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1800");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9785.CR3");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1900
     * @tc.desc      : 1.create pixelMap object by imageSource -- 023A9867.CR3
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_RAW_CR3_1900");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9867.CR3");
      let imageInfo = await getImageInfo(logger, buffer, "defaule");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0100
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SONY_A350.ARW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A350.ARW");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0200
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SONY_A900.ARW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ARW_0200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SONY_A900.ARW");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1616) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-sony-arw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0300
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_CANON_G9.CR2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G9.CR2");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0400
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_CANON_G10.CR2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR2_0400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_CANON_G10.CR2");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-canon-cr2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0500
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_D90.NEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D90.NEF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4288) && (imageInfo.size.height == 2848) && (imageInfo.mimeType == "image/x-nikon-nef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0600
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_E5700_SRGB.NEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NEF_0600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_D3300.NEF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-nikon-nef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0700
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_COOLPIX_P340.NRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_COOLPIX_P340.NRW");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 3000) && (imageInfo.mimeType == "image/x-nikon-nrw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0800
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_NIKON_P6000_GPS.NRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_NRW_0800");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_NIKON_P6000_GPS.NRW");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4224) && (imageInfo.size.height == 3168) && (imageInfo.mimeType == "image/x-nikon-nrw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_0900
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_OLYMPUS_E3.ORF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_0900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_0900");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E3.ORF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_1000
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_OLYMPUS_E410.ORF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_1000', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_ORF_1000");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_OLYMPUS_E410.ORF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-olympus-orf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1100
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PENTAX_STAR_DL.PEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1100', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1100");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STAR_DL.PEF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2000) && (imageInfo.mimeType == "image/x-pentax-pef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1200
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PENTAX_STARISTD_SRGB.PEF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1200', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_PEF_1200");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PENTAX_STARISTD_SRGB.PEF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 3008) && (imageInfo.size.height == 2008) && (imageInfo.mimeType == "image/x-pentax-pef");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1300
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_FUJI_S6500FD.RAF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1300', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1300");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S6500FD.RAF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1400
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_FUJI_S9500_SRGB.RAF
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1400', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RAF_1400");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_FUJI_S9500_SRGB.RAF");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1600) && (imageInfo.size.height == 1200) && (imageInfo.mimeType == "image/x-fuji-raf");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1500
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PANASONIC_G1.RW2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1500', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1500");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_G1.RW2");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1440) && (imageInfo.mimeType == "image/x-panasonic-rw2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1600
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_PANASONIC_LX3.RW2
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1600', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_RW2_1600");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_PANASONIC_LX3.RW2");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1920) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-panasonic-rw2");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_SRW_1700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_SRW_1700
     * @tc.desc      : 1.create pixelMap object by imageSource -- RAW_SAMSUNG_EX2F.SRW
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_SRW_1700', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_SRW_1700");
      let buffer: ArrayBuffer | undefined = await getBuffer("RAW_SAMSUNG_EX2F.SRW");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 4000) && (imageInfo.size.height == 2248) && (imageInfo.mimeType == "image/x-samsung-srw");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1800
     * @tc.desc      : 1.create pixelMap object by imageSource -- 023A9785.CR3
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1800', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1800");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9785.CR3");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1900
     * @tc.desc      : 1.create pixelMap object by imageSource -- 023A9867.CR3
     *                 2.return imageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1900', Level.LEVEL0, async (done: () => void) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_SYNC_RAW_CR3_1900");
      let buffer: ArrayBuffer | undefined = await getBuffer("023A9867.CR3");
      let imageInfo = await getImageInfo(logger, buffer, "sync");
      if (imageInfo != undefined) {
        logger.log("imageInfo is: " + JSON.stringify(imageInfo));
        let ret = (imageInfo.size.width == 1620) && (imageInfo.size.height == 1080) && (imageInfo.mimeType == "image/x-canon-cr3");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100
     * @tc.desc      : 1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0100");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, 'default', decodingOptions);
      let ret = await checkPixelMap(logger, decodingOptions, imageInfo, "image/wbmp");
      logger.log("checkPixelMap result is: " + ret);
      expect(ret).assertTrue();
      buffer = undefined;
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200
     * @tc.desc      : 1.create pixelMap object by imageSource
     *                 2.do not set DecodingOptions
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_0200");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let imageInfo = await getImageInfo(logger, buffer, 'default');
      buffer = undefined;
      logger.log("getImageInfo result is: " + (imageInfo != undefined) + ", info: " + JSON.stringify(imageInfo));
      expect(imageInfo!.mimeType == "image/wbmp").assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100
     * @tc.desc      : 1.create pixelMap object by imageSource
     *                 2.set DecodingOptions 
     *                       desiredSize: {width: 256, height: 256},
     *                       desiredPixelFormat: RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0100");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 256, height: 256 },
        desiredPixelFormat: RGBA_8888
      };
      let imageInfo = await getImageInfo(logger, buffer, 'sync', decodingOptions);
      let ret = await checkPixelMap(logger, decodingOptions, imageInfo, "image/wbmp");
      logger.log("checkPixelMap result is: " + ret);
      expect(ret).assertTrue();
      buffer = undefined;
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200
     * @tc.desc      : 1.create pixelMap object by imageSource
     *                 2.do not set DecodingOptions
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_PIXELMAP_WBMP_SYNC_0200");
      let buffer: ESObject = await getBuffer(test_wbmp);
      let imageInfo = await getImageInfo(logger, buffer, 'sync');
      buffer = undefined;
      logger.log("getImageInfo result is: " + (imageInfo != undefined) + ", info: " + JSON.stringify(imageInfo));
      expect(imageInfo!.mimeType == "image/wbmp").assertTrue();
      done();
    })
  })
}