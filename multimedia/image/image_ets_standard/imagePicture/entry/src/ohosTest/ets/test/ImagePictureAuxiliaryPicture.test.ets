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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import fs from '@ohos.file.fs';
import { hdrCapability } from '@kit.ArkGraphics2D';
import display from '@ohos.display';

const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;
const LHDR_GAINMAP = image.AuxiliaryPictureType.LHDR_GAINMAP;
const UNSUPPORTED_ALLOCATOR_TYPE = 7600205;
const INVALID_PARAMETER = 7600206;
const ERRCODE_NOT_DMA = 7600201;
interface Size {
  width: number,
  height: number
};

export default function ImagePictureAuxiliaryPicture() {
  let filesDir: string | undefined;
  let isSupportHdrbyVPE: Boolean;
  let isSupportHdrbyScreen: Boolean;
  describe('ImagePictureAuxiliaryPicture', () => {
    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      isSupportHdrbyScreen =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
      console.info('isSupportHdrbyScreen is ' + isSupportHdrbyScreen);
      isSupportHdrbyVPE = await fs.accessSync("/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so");
      console.info('isSupportHdrbyVPE is ' + isSupportHdrbyVPE);
    });

    beforeEach(() => {

    });

    afterEach(() => {

    });

    afterAll(() => {

    });

    const isSupportDecode = async (testName: string, mineType: string) => {
      let supportedFormat: boolean = false;
      let formats = await image.getImageSourceSupportedFormats();
      supportedFormat = formats.includes(mineType);
      console.info(`${testName} supportedFormat is ${supportedFormat}`);
      return supportedFormat;
    }

    const testGetAuxiliaryPictureWithLhdrGainmap = async (testName: string, fileName: string, AuxiliaryPictureType: image.AuxiliaryPictureType) => {
      let imageSource: image.ImageSource | undefined;
      let result = false;
      try {
        imageSource = await getImageSource(testName, fileName);
        let pictureObj: image.Picture | null = await imageSource.createPicture();
        expect(pictureObj != null).assertTrue();
        if (pictureObj != null) {
          let auxPictureObj: image.AuxiliaryPicture | null = await pictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          expect(auxPictureObj != null).assertTrue();
          if (auxPictureObj != null) {
            let type: image.AuxiliaryPictureType = auxPictureObj.getType();
            result = type == AuxiliaryPictureType
            console.info(testName, `${testName} succeeded, got aux type: ${type}`);
          }
          pictureObj.release();
        }
      } catch (error) {
        console.info(`${testName} failed; error: ${error},${error.code}`);
      }
      await imageSource?.release();
      return result;
    }

    const testHdrComposeToMainPixelMapError = async (testName: string, fileName: string = `testExif.jpg`, decodingOptions?: image.DecodingOptions): Promise<boolean> => {
      let result = false;
      let imageSourceApi = await getImageSource(testName, fileName);
      let pixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      let picture = await image.createPicture(pixelMap);
      try {
        await picture.hdrComposeToMainPixelmap();
      } catch (error) {
        console.error(`${testName} error code is ${error.code} message is ${error.message}`);
        result = (error.code) == ERRCODE_NOT_DMA;
      }
      await imageSourceApi.release();
      await pixelMap.release();
      await picture.release();
      console.info(`${testName} testHdrComposeToMainPixelMapError result is ${result}`);
      return result;
    }

    const testHdrComposeToMainPixelMap = async (testName: string, fileName: string = `testExif.jpg`, AuxiliaryPictureType: image.AuxiliaryPictureType, decodingOptions?: image.DecodingOptions): Promise<boolean> => {
      let result = false;
      try {
        let imageSourceApi = await getImageSource(testName, fileName);
        let picture = await imageSourceApi.createPicture();
        let auxPictureObj: image.AuxiliaryPicture | null = await picture.getAuxiliaryPicture(AuxiliaryPictureType);
        let type1: image.AuxiliaryPictureType | undefined = auxPictureObj?.getType();
        expect(type1).assertEqual(AuxiliaryPictureType);
        const auxInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: LHDR_GAINMAP,
          size: { width: 1024, height: 2048 },
          rowStride: 1024 * 4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
        };
        auxPictureObj?.setAuxiliaryPictureInfo(auxInfo);
        console.info(`${testName} testHdrComposeToMainPixelMap type1 is ${type1}`);
        await picture.setAuxiliaryPicture(image.AuxiliaryPictureType.LHDR_GAINMAP, auxPictureObj);
        await picture.hdrComposeToMainPixelmap();
        let auxPicture: image.AuxiliaryPicture | null = await picture.getAuxiliaryPicture(image.AuxiliaryPictureType.LHDR_GAINMAP);
        let auxPicInfo = auxPicture?.getAuxiliaryPictureInfo();
        let type: image.AuxiliaryPictureType | undefined = auxPicture?.getType();
        let auxWidth = auxPicInfo?.size.width;
        let auxHeight = auxPicInfo?.size.height;
        expect(type).assertEqual(image.AuxiliaryPictureType.LHDR_GAINMAP);
        expect(auxWidth).assertEqual(1024);
        expect(auxHeight).assertEqual(2048);
        result = true;
        await imageSourceApi.release();
        await picture.release();
      } catch (error) {
        console.error(`${testName} error code is ${error.code} message is ${error.message}`);
      }
      console.info(`${testName} testHdrComposeToMainPixelMap result is ${result}`);
      return result;
    }

    const getImageSource = async (testName: string, fileName: string) => {
      const filePath = filesDir + "/" + fileName;
      console.info(`${testName} filePath is ${filePath}`);
      let imageSourceApi: image.ImageSource;
      console.info(`${testName} createImageSource is starting`);
      imageSourceApi = await image.createImageSource(filePath);
      console.info(`${testName} imageSourceApi is ${imageSourceApi}`);
      return imageSourceApi;
    };

    const getPixelsBuffer =
      async (tastName: string, fileName: string, format: image.PixelMapFormat): Promise<ArrayBuffer | undefined> => {
        try {
          const filePath = filesDir + '/' + fileName;
          let imageSource = image.createImageSource(filePath);
          let decodeOpts: image.DecodingOptions = {
            desiredPixelFormat: format
          }
          let pixelMap = await imageSource.createPixelMap(decodeOpts);
          let info = pixelMap.getImageInfoSync();
          console.info(`${tastName} pixelmap info is ${JSON.stringify(info)}`);
          let bufferSize = pixelMap.getPixelBytesNumber();
          let arrayBuffer = new ArrayBuffer(bufferSize);
          await pixelMap.readPixelsToBuffer(arrayBuffer);
          console.info(`${tastName} arrayBuffer byte length is ${arrayBuffer.byteLength}`);
          await imageSource.release();
          await pixelMap.release();
          return arrayBuffer;
        } catch (error) {
          console.error(`${tastName} error code is ${error.code} message is ${error.message}`);
          return undefined;
        }
      }

    const testCreateAuxiliaryPictureUsingAllocator =
      async (testName: string, fileName: string, auxInfo: image.AuxiliaryPictureInfo,
        pixelFormat: image.PixelMapFormat): Promise<boolean> => {
        let result = false;
        try {
          let buffer = await getPixelsBuffer(testName, fileName, pixelFormat);
          let auxiliaryPicture: image.AuxiliaryPicture =
            image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.DMA, buffer);
          let getAuxType = auxiliaryPicture.getType();
          let getAuxInfo = auxiliaryPicture.getAuxiliaryPictureInfo();
          auxiliaryPicture.release();
          console.info(`${testName} pixelmap info is ${JSON.stringify(getAuxInfo)}`)
          let result = getAuxType == auxInfo.auxiliaryPictureType &&
            getAuxInfo.size.width == auxInfo.size.width &&
            getAuxInfo.size.height == auxInfo.size.height &&
            getAuxInfo.pixelFormat == auxInfo.pixelFormat;
          return result;
        } catch (error) {
          console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
          return result;
        }
      }

    const testCreateAuxiliaryPictureWithLhdrGainmap = async (testName: string, fileName: string, auxSize: Size, auxType: image.AuxiliaryPictureType): Promise<boolean> => {
      let result = false;
      try {
        let buffer = await getBuffer(fileName)
        let auxPictureObj: image.AuxiliaryPicture | null = await image.createAuxiliaryPicture(buffer, auxSize, auxType);
        expect(auxPictureObj != null).assertTrue();
        if (auxPictureObj != null) {
          let type: image.AuxiliaryPictureType = auxPictureObj.getType();
          result = type == image.AuxiliaryPictureType.LHDR_GAINMAP;
          console.info(testName + 'CreateAuxiliaryPicture with LHDR_GAINMAP succeeded, type: ' + JSON.stringify(type));
        }
        await auxPictureObj.release();
      } catch (error) {
        console.info(testName, `${testName} failed; error: ${error},${error.code}`);
      }
      return result;
    }

    const testSetAuxiliaryPictureWithLhdrGainmap = async (testName: string, fileName: string,
      AuxiliaryPictureType: image.AuxiliaryPictureType) => {
      let imageSource: image.ImageSource | undefined;
      let result = false;
      try {
        imageSource = await getImageSource(testName, fileName);
        let PictureObj: image.Picture | null = await imageSource.createPicture();
        expect(PictureObj != null).assertTrue();
        const auxInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: LHDR_GAINMAP,
          size: { width: 1024, height: 2048 },
          rowStride: 1024 * 4,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
        }
        if (PictureObj != null) {
          let auxPictureObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
          auxPictureObj?.setAuxiliaryPictureInfo(auxInfo);
          if (auxPictureObj != null) {
            await PictureObj.setAuxiliaryPicture(LHDR_GAINMAP, auxPictureObj);
            let getAuxPicture: image.AuxiliaryPicture | null =
              await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
            expect(getAuxPicture != null).assertTrue();
            if (getAuxPicture != null) {
              let type: image.AuxiliaryPictureType = getAuxPicture.getType();
              await getAuxPicture.release();
              result = type == image.AuxiliaryPictureType.LHDR_GAINMAP;
              console.info(`${testName} succeeded, set and get aux type: ${type}`);
            }
          }
          await PictureObj.release();
        }
      } catch (error) {
        console.info(`${testName} failed; error: ${error},${error.code}`);
      }
      await imageSource?.release();
      return result;
    }

    const getBuffer = (fileName: string) => {
      let filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }
    
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0100
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0100'
      let result: boolean = false;
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let fileName = "0801_sdr2.heic";
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: LHDR_GAINMAP,
        size: { width: 1024, height: 2048 },
        rowStride: 1024 * 4,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
      };
      try {
        if (!isSupportDecodeResult) {
          console.info(`${testName} device unsupported heic decode`);
          done();
          return;
        }
        result = await testCreateAuxiliaryPictureUsingAllocator(testName, fileName, auxInfo, image.PixelMapFormat.YCRCB_P010)
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0200
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0200'
      let result: boolean = false;
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/jpeg');
      let fileName = "testExif.jpg";
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: LHDR_GAINMAP,
        size: { width: 256, height: 256 },
        rowStride: 256,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
      }
      try {
        if (!isSupportDecodeResult) {
          console.info(`${testName} device unsupported heic decode`);
          done();
          return;
        }
        result = await testCreateAuxiliaryPictureUsingAllocator(testName, fileName, auxInfo, image.PixelMapFormat.BGRA_8888)
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0300
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0300'
      let result: boolean = false;
      let fileName = "testExif.jpg";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/jpeg');
      try {
        if (!isSupportDecodeResult || !isSupportHdrbyVPE || !isSupportHdrbyScreen) {
          console.info(`${testName} device unsupported heic decode or hdr`);
          done();
          return;
        }
        result = await testHdrComposeToMainPixelMapError(testName, fileName);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0400
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0400'
      let result: boolean = false;
      let fileName = "0801_sdr2.heic";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        if (!isSupportDecodeResult || !isSupportHdrbyVPE || !isSupportHdrbyScreen) {
          console.info(`${testName} device unsupported heic decode or hdr`);
          done();
          return;
        }
        result = await testHdrComposeToMainPixelMapError(testName, fileName, decodingOptions);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0600
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0600'
      let result: boolean = false;
      let fileName = "all_auxtype.heic";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        if (!isSupportDecodeResult || !isSupportHdrbyVPE || !isSupportHdrbyScreen) {
          console.info(`${testName} device unsupported heic decode or hdr`);
          done();
          return;
        }
        result = await testHdrComposeToMainPixelMap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0500
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_0500'
      let result: boolean = false;
      let fileName = "AllAuxiliaryPictures.jpg";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/jpeg');
      let AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        if (!isSupportDecodeResult || !isSupportHdrbyVPE || !isSupportHdrbyScreen) {
          console.info(`${testName} device unsupported heic decode or hdr`);
          done();
          return;
        }
        result = await testHdrComposeToMainPixelMap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0010
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0010
     * @tc.desc   createAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0010';
      const fileName = 'LHDR.jpg';
      let result: boolean = false;
      let auxSize: Size = {
        height: 300,
        width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        result = await testCreateAuxiliaryPictureWithLhdrGainmap(testName, fileName, auxSize, auxType);
        expect(result).assertTrue()
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0020
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0020
     * @tc.desc   getAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0020';
      let result: boolean = false;
      const fileName = 'LHDR.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        result = await testGetAuxiliaryPictureWithLhdrGainmap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0030
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0030
     * @tc.desc   setAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0030';
      const fileName = 'AllAuxiliaryPictures.jpg';
      let result: boolean = false;
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        result = await testSetAuxiliaryPictureWithLhdrGainmap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0040
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0040
     * @tc.desc   createAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0040';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let result: boolean = false;
      const fileName = 'LHDR.heic';
      let auxSize: Size = {
        height: 300,
        width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          console.info(`${testName} device unsupported heic decode`);
          done();
          return;
        }
        result = await testCreateAuxiliaryPictureWithLhdrGainmap(testName, fileName, auxSize, auxType);
        expect(result).assertTrue()
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0050
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0050
     * @tc.desc   getAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0050';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      const fileName = 'LHDR.heic';
      let result: boolean = false;
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          console.info(`${testName} device unsupported heic decode`);
          done();
          return;
        }
        result = await testGetAuxiliaryPictureWithLhdrGainmap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0060
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0060
     * @tc.desc   setAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_0060';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      const fileName = 'all_auxtype.heic';
      let result: boolean = false;
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          console.info(`${testName} device unsupported heic decode`);
          done();
          return;
        }
        result = await testSetAuxiliaryPictureWithLhdrGainmap(testName, fileName, AuxiliaryPictureType);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}