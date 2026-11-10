'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import resourceManager from '@ohos.resourceManager';
import { Context } from '@kit.AbilityKit';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    console.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }

  printRecord(record: Record<string, string | null>, recordName: string) {
    Object.keys(record).forEach(key => {
      const value = record[key];
      if (value !== null) {
        this.log(`${recordName}(${key}) success:  + ${JSON.stringify(value)}`);
      } else {
        this.log(`${recordName}(${key}) is null!`);
      }
    });
  }
}

export default function imagePicture() {
  let context: Context = Hypium.get("Context") as Context;
  const Unsupported_operation_CODE = 7600201;
  let isSupportHEIFDecode: boolean;
  let isSupportHEICEncode: boolean;
  let isSupportHdr: Boolean = false;

  describe('imagePicture', (): void => {
    beforeAll(async (): Promise<void> => {
      // initialize();
      console.info('context is ' + context);
      console.info('filesDir is ' + context.filesDir);
      isSupportHEIFDecode =
        image.createImageSource(context.filesDir + '/' + "test.jpg")!.supportedFormats.includes("image/heic");
      console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode);
      isSupportHEICEncode =
        image.createImagePacker().supportedFormats.includes("image/heic");
      console.info('isSupportHEICEncode is ' + isSupportHEICEncode);
      try {
        isSupportHdr = await fs.access('/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so');
        console.info('isSupportHdr is ' + isSupportHdr);
      } catch (err) {
        console.error('The file path does not exist');
      }
    })

    afterEach(async () => {
      console.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    const getBuffer = (fileName: string) => {
      const filePath = context.filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const getImageSource = async (fileName: string, type?: string): Promise<image.ImageSource | undefined> => {
      let imageSourceApi: image.ImageSource | undefined;
      if (type === "buffer") {
        const buffer = getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = context.filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = context!.resourceManager;
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = getBuffer(fileName);
        imageSourceApi = image.createIncrementalSource(picBuffer);
      } else {
        const filePath = context.filesDir + "/" + fileName;
        const file = fs.openSync(filePath);
        imageSourceApi = image.createImageSource(file.fd as int);
      }
      return imageSourceApi;
    }

    const createPictureImageSourcePic = async (fileName: string, type: string, auxType?: image.AuxiliaryPictureType): Promise<image.Picture | undefined> => {
      let imageSourceApi = await getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        console.info(0x0000, "imagePicture", 'createPictureImageSourcePic failed! imageSourceApi is undefined!');
        return undefined;
      }
      let picture: image.Picture | undefined;
      if (auxType) {
        let decodingOptForPicture: image.DecodingOptionsForPicture;
        decodingOptForPicture = {desiredAuxiliaryPictures: [auxType]};
        picture = await imageSourceApi.createPicture(decodingOptForPicture);
      } else {
        picture = await imageSourceApi.createPicture();
      }
      await imageSourceApi.release();
      return picture;
    }

    const testPictureApiError = async (
      done: () => void,
      logger: Logger,
      fileName: string,
      type: string,
      apiName: String
    ) => {
      let picture: image.Picture | undefined;
      picture = await createPictureImageSourcePic(fileName, type);
      if (picture == undefined) {
        logger.log("create Pictrue failed.");
        expect(false).assertTrue();
        done();
      } else {
        if (apiName == "hdrComposedPixelmap") {
          try {
            await picture.getHdrComposedPixelmap();
            expect(false).assertTrue();
            done();
          } catch (error) {
           
            logger.log(JSON.stringify(error) + ", error code: " + error.code);
            expect(error.code).assertEqual(7600201);
            done();
          } finally {
            picture.release();
          }
        } else {
          let gainMapPixelMap = picture.getGainmapPixelmap();
          logger.log("gainMapPixelMap: " + gainMapPixelMap);
          expect(gainMapPixelMap == undefined).assertTrue();
          picture.release();
          done();
        }
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100");
        testPictureApiError(done, logger, "testExif.jpg", "buffer", "gainMapPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.desc   test picture getHdrComposedPixelmap error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100");
      await testPictureApiError(done, logger, "testExif.jpg", "buffer", "hdrComposedPixelmap");
    })

  })
}

