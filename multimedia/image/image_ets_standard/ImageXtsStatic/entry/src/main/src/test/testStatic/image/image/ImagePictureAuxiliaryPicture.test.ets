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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium/index';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import fs from '@ohos.file.fs';

const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;
const LHDR_GAINMAP = image.AuxiliaryPictureType.LHDR_GAINMAP;
const UNSUPPORTED_ALLOCATOR_TYPE: int = 7600205;
const INVALID_PARAMETER: int = 7600206;
const ERRCODE_NOT_DMA: int = 7600201;

export default function ImagePictureAuxiliaryPicture(): void {
  describe('ImagePictureAuxiliaryPicture', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';

    beforeAll(async () => {
      filesDir = Hypium.get('pathDir') as string;
    });

    beforeEach(() => {
      console.info('beforeEach case.');
    });

    afterEach(() => {
      console.info('afterEach case.');
    });

    afterAll(() => {
      console.info('afterAll case.');
    });

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      let fdNumber: int = file.fd as int;
      return fdNumber;
    };

    const isSupportDecode = async (testName: string, mineType: string): Promise<boolean> => {
      let supportedFormat: boolean = false;
      let formats = await image.getImageSourceSupportedFormats();
      supportedFormat = formats.includes(mineType);
      console.info(`${testName} supportedFormat is ${supportedFormat}`);
      return supportedFormat;
    }

    const testGetAuxiliaryPictureWithLhdrGainmap =
      async (testName: string, fileName: string, AuxiliaryPictureType: image.AuxiliaryPictureType): Promise<boolean> => {
        let fd: int = getFd(fileName);
        let imageSource: image.ImageSource | undefined = image.createImageSource(fd);
        let result = false;
        try {
          let pictureObj: image.Picture | null | undefined = await imageSource!.createPicture();
          expect(pictureObj != null).assertTrue();
          if (pictureObj != null) {
            let auxPictureObj: image.AuxiliaryPicture | null | undefined =
              await pictureObj!.getAuxiliaryPicture(AuxiliaryPictureType);
            expect(auxPictureObj != null).assertTrue();
            if (auxPictureObj != null) {
              let type: image.AuxiliaryPictureType | undefined = auxPictureObj!.getType();
              if (type != undefined) {
                result = type == AuxiliaryPictureType
              }
              console.info(testName, `${testName} succeeded, got aux type: ${type}`);
            }
            pictureObj!.release();
          }
        } catch (error) {
          console.info(`${testName} failed; error: ${error},${error.code}`);
        }
        await imageSource?.release();
        return result;
      }

    const testHdrComposeToMainPixelMapError = async (testName: string, fileName: string,
      decodingOptions?: image.DecodingOptions): Promise<boolean> => {
      let result = false;
      let fd: int = getFd(fileName);
      let imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      let pixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap(decodingOptions);
      if (pixelMap == undefined) {
        return false;
      }
      let picture: image.Picture | undefined = await image.createPicture(pixelMap!);
      try {
        await picture!.hdrComposeToMainPixelmap();
      } catch (error) {
        console.error(`${testName} error code is ${error.code} message is ${error.message}`);
        result = (error.code) == ERRCODE_NOT_DMA;
      }
      await imageSourceApi!.release();
      await pixelMap!.release();
      await picture!.release();
      console.info(`${testName} testHdrComposeToMainPixelMapError result is ${result}`);
      return result;
    }

    const testHdrComposeToMainPixelMap =
      async (testName: string, fileName: string, AuxiliaryPictureType: image.AuxiliaryPictureType,
        decodingOptions?: image.DecodingOptions): Promise<boolean> => {
        let result = false;
        try {
          let fd: int = getFd(fileName);
          let imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
          let picture: image.Picture | undefined = await imageSourceApi!.createPicture();
          let auxPictureObj: image.AuxiliaryPicture | null | undefined = await picture!.getAuxiliaryPicture(AuxiliaryPictureType);
          let type1: image.AuxiliaryPictureType | undefined = auxPictureObj?.getType();
          expect(type1).assertEqual(AuxiliaryPictureType);
          const auxInfo: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LHDR_GAINMAP,
            size: { width: 1024, height: 2049 },
            rowStride: 1024 * 4,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          };
          auxPictureObj?.setAuxiliaryPictureInfo(auxInfo);
          console.info(`${testName} testHdrComposeToMainPixelMap type1 is ${type1}`);
          await picture!.setAuxiliaryPicture(image.AuxiliaryPictureType.LHDR_GAINMAP, auxPictureObj!);
          await picture!.hdrComposeToMainPixelmap();
          let auxPicture: image.AuxiliaryPicture | null | undefined =
            await picture!.getAuxiliaryPicture(image.AuxiliaryPictureType.LHDR_GAINMAP);
          let auxPicInfo: image.AuxiliaryPictureInfo | undefined = auxPicture?.getAuxiliaryPictureInfo();
          let type: image.AuxiliaryPictureType | undefined = auxPicture?.getType();
          let auxWidth: int = auxPicInfo?.size.width ?? 0;
          let auxHeight: int = auxPicInfo?.size.height ?? 0;
          expect(type).assertEqual(image.AuxiliaryPictureType.LHDR_GAINMAP);
          expect(auxWidth).assertEqual(1024);
          expect(auxHeight).assertEqual(2049);
          result = true;
          await imageSourceApi!.release();
          await picture!.release();
        } catch (error) {
          console.error(`${testName} error code is ${error.code} message is ${error.message}`);
        }
        console.info(`${testName} testHdrComposeToMainPixelMap result is ${result}`);
        return result;
      }

    const getPixelsBuffer =
      async (tastName: string, fileName: string, format: image.PixelMapFormat): Promise<ArrayBuffer | undefined> => {
        try {
          filePath = filesDir + '/' + fileName;
          let imageSource: image.ImageSource | undefined = image.createImageSource(filePath);
          let decodeOpts: image.DecodingOptions = {
            desiredPixelFormat: format
          }
          let pixelMap: image.PixelMap | undefined = await imageSource!.createPixelMap(decodeOpts);
          if (pixelMap == undefined) {
            return undefined;
          }
          let info = pixelMap!.getImageInfoSync();
          console.info(`${tastName} pixelmap info is ${JSON.stringify(info)}`);
          let bufferSize: int = pixelMap!.getPixelBytesNumber();
          let arrayBuffer = new ArrayBuffer(bufferSize);
          await pixelMap!.readPixelsToBuffer(arrayBuffer);
          console.info(`${tastName} arrayBuffer byte length is ${arrayBuffer.byteLength}`);
          await imageSource!.release();
          await pixelMap!.release();
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
          if (buffer == undefined) {
            return false;
          }
          let auxiliaryPicture: image.AuxiliaryPicture =
            image.createAuxiliaryPictureUsingAllocator(auxInfo, image.AllocatorType.DMA, buffer!);
          let getAuxType = auxiliaryPicture.getType();
          let getAuxInfo = auxiliaryPicture.getAuxiliaryPictureInfo();
          auxiliaryPicture.release();
          console.info(`${testName} pixelmap info is ${JSON.stringify(getAuxInfo)}`)
          let result = getAuxType == auxInfo.auxiliaryPictureType &&
            getAuxInfo!.size.width == auxInfo.size.width &&
            getAuxInfo!.size.height == auxInfo.size.height &&
            getAuxInfo!.pixelFormat == auxInfo.pixelFormat;
          return result;
        } catch (error) {
          console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
          return result;
        }
      }

    const testCreateAuxiliaryPictureWithLhdrGainmap = async (testName: string, fileName: string, auxSize: image.Size,
      auxType: image.AuxiliaryPictureType): Promise<boolean> => {
      let result = false;
      try {
        filePath = filesDir + '/' + fileName;
        let file = fs.openSync(filePath!);
        const stats = fs.statSync(filePath!);
        const fileSize = stats.size;
        const bufferRead = new ArrayBuffer(fileSize)
        fs.readSync(file.fd, bufferRead)
        let auxPictureObj: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(bufferRead, auxSize, auxType);
        if (auxPictureObj != null) {
          let type: image.AuxiliaryPictureType | undefined = auxPictureObj.getType();
          if (type != undefined) {
            result = type == image.AuxiliaryPictureType.LHDR_GAINMAP;
          }
          console.info(testName + 'CreateAuxiliaryPicture with LHDR_GAINMAP succeeded, type: ' + JSON.stringify(type));
          auxPictureObj.release();
        }
      } catch (error) {
        console.info(testName, `${testName} failed; error: ${error},${error.code}`);
      }
      return result;
    }

    const testSetAuxiliaryPictureWithLhdrGainmap = async (testName: string, fileName: string,
      AuxiliaryPictureType: image.AuxiliaryPictureType): Promise<boolean> => {
      let fd: int = getFd(fileName);
      let imageSource: image.ImageSource | undefined = image.createImageSource(fd);
      let result = false;
      try {
        let PictureObj: image.Picture | null | undefined = await imageSource!.createPicture();
        expect(PictureObj != null).assertTrue();
        const auxInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: LHDR_GAINMAP,
          size: { width: 1024, height: 2049 },
          rowStride: 1024 * 4,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
        }
        if (PictureObj != null) {
          let auxPictureObj: image.AuxiliaryPicture | null | undefined = await PictureObj!.getAuxiliaryPicture(AuxiliaryPictureType);
          auxPictureObj?.setAuxiliaryPictureInfo(auxInfo);
          if (auxPictureObj != null) {
            await PictureObj!.setAuxiliaryPicture(LHDR_GAINMAP, auxPictureObj!);
            let getAuxPicture: image.AuxiliaryPicture | null | undefined =
              await PictureObj!.getAuxiliaryPicture(AuxiliaryPictureType);
            expect(getAuxPicture != null).assertTrue();
            if (getAuxPicture != null) {
              let type: image.AuxiliaryPictureType | undefined = getAuxPicture!.getType();
              await getAuxPicture!.release();
              if (type != undefined) {
                result = type == image.AuxiliaryPictureType.LHDR_GAINMAP;
              }
              console.info(`${testName} succeeded, set and get aux type: ${type}`);
            }
          }
          await PictureObj!.release();
        }
      } catch (error) {
        console.info(`${testName} failed; error: ${error},${error.code}`);
      }
      await imageSource?.release();
      return result;
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0100
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0100'
      let result: boolean = false;
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      console.info(testName, 'isSupportDecodeResult: ',isSupportDecodeResult);
      let fileName = "0801_sdr2.heic";
      const auxInfo: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: LHDR_GAINMAP,
        size: { width: 1024, height: 2049 },
        rowStride: 1024 * 4,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
      };
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
          return;
        }
        result =
          await testCreateAuxiliaryPictureUsingAllocator(testName, fileName, auxInfo, image.PixelMapFormat.YCRCB_P010)
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0200
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0200'
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
          expect(isSupportDecodeResult).assertFalse();
          done();
        }
        result =
          await testCreateAuxiliaryPictureUsingAllocator(testName, fileName, auxInfo, image.PixelMapFormat.BGRA_8888)
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} is error, error code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0300
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0300'
      let result: boolean = false;
      let fileName = "testExif.jpg";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/jpeg');
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0400
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0400'
      let result: boolean = false;
      let fileName = "0801_sdr2.heic";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let decodingOptions: image.DecodingOptions = {
        desiredSize: { width: 512, height: 512 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0600
     * @tc.desc   1.create auxiliary picture LHDR_GAINMAP
     *            2.set auxiliary picture to LHDR_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_HDR_static_0600'
      let result: boolean = false;
      let fileName = "all_auxtype.heic";
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0100
     * @tc.desc   createAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0100';
      const fileName = 'LHDR.jpg';
      let result: boolean = false;
      let auxSize: image.Size = {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0400
     * @tc.desc   createAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0400';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      let result: boolean = false;
      const fileName = 'LHDR.heic';
      let auxSize: image.Size = {
        height: 300,
        width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0500
     * @tc.desc   getAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0500';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      const fileName = 'LHDR.heic';
      let result: boolean = false;
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0600
     * @tc.desc   setAuxiliaryPicture with LHDR_GAINMAP type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_AUXILIARY_PICTURE_TYPE_LHDR_GAINMAP_static_0600';
      let isSupportDecodeResult = await isSupportDecode(testName, 'image/heic');
      const fileName = 'all_auxtype.heic';
      let result: boolean = false;
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        if (!isSupportDecodeResult) {
          expect(isSupportDecodeResult).assertFalse();
          done();
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