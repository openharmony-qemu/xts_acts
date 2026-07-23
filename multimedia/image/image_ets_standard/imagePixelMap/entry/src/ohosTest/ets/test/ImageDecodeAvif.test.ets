/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import common from '@ohos.app.ability.common';

const TAG = 'readImageMetadata';

let isSupportedAvif: boolean = true;

export default function imageDecodeAvif() {
  let testContext: common.UIAbilityContext;
  let filesDir: string | undefined;
  let AuxiliaryPicture: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP
  let unSupportPixelMapCode = 7700203
  describe('ImageDecodeAvif', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      let formats = await image.getImageSourceSupportedFormats();
      isSupportedAvif = formats.includes('image/avif');
      console.info(TAG, ' isSupportedAvif is ' + isSupportedAvif);
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

    const getImageSource = async (tag: string, fileName: string) => {
      const filePath = filesDir + "/" + fileName;
      console.info(`${tag} filePath is ${filePath}`);
      let imageSourceApi: image.ImageSource;
      console.info(`${tag} createImageSource is starting`);
      imageSourceApi = await image.createImageSource(filePath);
      console.info(`${tag} imageSourceApi is ${imageSourceApi}`);
      return imageSourceApi;
    };

    const testGetImageInfoMimeType = async (TAG: string, fileName: string): Promise<string | undefined> => {
      let mimeType: string | undefined;
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      try {
        let imageInfo = await imageSourceApi.getImageInfo();
        console.info(`${TAG} imageInfo is ${imageInfo}`);
        mimeType = imageInfo.mimeType;
        console.info(`${TAG} mimeType is ${mimeType},mimeType type is ${typeof mimeType}`);
        await imageSourceApi.release();
        return mimeType;
      } catch (error) {
        console.info(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return mimeType;
      }
    };

    const testGetImageInfoSyncMimeType = async (TAG: string, fileName: string): Promise<string | undefined> => {
      let mimeType: string | undefined;
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      try {
        let imageInfo = await imageSourceApi.getImageInfoSync();
        console.info(`${TAG} imageInfo is ${imageInfo}`);
        mimeType = imageInfo.mimeType;
        console.info(`${TAG} mimeType is ${mimeType},mimeType type is ${typeof mimeType}`);
        await imageSourceApi.release();
        return mimeType;
      } catch (error) {
        console.info(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return mimeType;
      }
    };

    const testCreatePictureMimeType = async (TAG: string, fileName: string, exceptMimeType: string, imageWidth: number,
      imageHeight: number): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      let DecodingOptionsForPicture: image.DecodingOptionsForPicture = { desiredAuxiliaryPictures: [AuxiliaryPicture] }
      try {
        let picture = await imageSourceApi.createPicture(DecodingOptionsForPicture);
        console.info(`${TAG} picture is ${picture}`);
        let mainPixelmap: image.PixelMap = picture.getMainPixelmap();
        console.info(`${TAG} mainPixelmap is ${mainPixelmap}`);
        let imageInfo = await mainPixelmap.getImageInfo();
        console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
        result =
          exceptMimeType == imageInfo.mimeType &&
          imageWidth == imageInfo.size.width &&
          imageHeight == imageInfo.size.height;
        await imageSourceApi.release();
        picture.release();
        return result
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return false;
      }
    };

    const testCreatePixelMapWithOutOpt =
      async (TAG: string, fileName: string, exceptMimeType: string, imageWidth: number,
        imageHeight: number): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = await imageSourceApi.createPixelMap();
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          let imageInfo = await pixelMap.getImageInfo();
          console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
          result =
            exceptMimeType == imageInfo.mimeType &&
            imageWidth == imageInfo.size.width &&
            imageHeight == imageInfo.size.height;
          pixelMap.release();
          await imageSourceApi.release();
          return result
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          await imageSourceApi.release();
          return false;
        }
      };

    const testCreatePixelMapWithOpt = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      try {
        let pixelMap = await imageSourceApi.createPixelMap(decodeOption);
        console.info(`${TAG} pixelMap is ${pixelMap}`);
        let imageInfo = await pixelMap.getImageInfo();
        console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
        result =
          decodeOption.desiredPixelFormat == imageInfo.pixelFormat &&
          decodeOption.desiredSize?.width == imageInfo.size.width &&
          decodeOption.desiredSize.height == imageInfo.size.height &&
          exceptMimeType == imageInfo.mimeType &&
          imageInfo.pixelFormat == decodeOption.desiredPixelFormat;
        pixelMap.release();
        await imageSourceApi.release();
        return result
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return result;
      }
    };

    const testCreatePixelMapWithOptError = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      try {
        let pixelMap = await imageSourceApi.createPixelMap(decodeOption);
        console.info(`${TAG} pixelMap is ${pixelMap}`);
        pixelMap.release();
        await imageSourceApi.release();
        return result
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        if (error.code == undefined) {
          result = true;
        }
        return result;
      }
    };

    const testCreatePixelMapSyncWithOutOpt =
      async (TAG: string, fileName: string, exceptMimeType: string, imageWidth: number,
        imageHeight: number): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = imageSourceApi.createPixelMapSync();
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          let imageInfo = await pixelMap.getImageInfo();
          console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
          result =
            exceptMimeType == imageInfo.mimeType &&
            imageWidth == imageInfo.size.width &&
            imageHeight == imageInfo.size.height &&
            imageInfo.pixelFormat == image.PixelMapFormat.RGBA_8888;
          pixelMap.release();
          await imageSourceApi.release();
          return result
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          await imageSourceApi.release();
          return false;
        }
      };

    const testCreatePixelMapSyncWithOpt = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      try {
        let pixelMap = imageSourceApi.createPixelMapSync(decodeOption);
        console.info(`${TAG} pixelMap is ${pixelMap}`);
        let imageInfo = await pixelMap.getImageInfo();
        console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
        result =
          decodeOption.desiredPixelFormat == imageInfo.pixelFormat &&
          decodeOption.desiredSize?.width == imageInfo.size.width &&
          decodeOption.desiredSize.height == imageInfo.size.height &&
          exceptMimeType == imageInfo.mimeType &&
          imageInfo.pixelFormat == decodeOption.desiredPixelFormat;
        pixelMap.release();
        await imageSourceApi.release();
        return result;
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return false;
      }
    };

    const testCreatePixelMapSyncWithOptError = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      try {
        let pixelMap = imageSourceApi.createPixelMapSync(decodeOption);
        console.info(`${TAG} pixelMap is ${pixelMap}`);
        pixelMap.release();
        await imageSourceApi.release();
        return result
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        if (error.code == undefined) {
          result = true;
        }
        return result;
      }
    };

    const testCreatePixelMapListWithOpt = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      let flagTrue = 0;
      let flagFalse = 0;
      try {
        let pixelMap = await imageSourceApi.createPixelMapList(decodeOption);
        for (let i = 0; i < pixelMap.length; i++) {
          console.info(`${TAG} pixelMap is ${pixelMap[i]}`);
          let imageInfo = await pixelMap[i].getImageInfo();
          console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
          let testResult =
            decodeOption.desiredPixelFormat == imageInfo.pixelFormat &&
            decodeOption.desiredSize?.width == imageInfo.size.width &&
            decodeOption.desiredSize.height == imageInfo.size.height &&
            exceptMimeType == imageInfo.mimeType
          if (testResult) {
            flagTrue++;
          } else {
            flagFalse++;
          }
          pixelMap[i].release();
        }
        await imageSourceApi.release();
        if (flagTrue > 0 && flagFalse == 0) {
          result = true;
        }
        return result;
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        await imageSourceApi.release();
        return false;
      }
    };

    const testCreatePixelMapListWithOptError = async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
      exceptMimeType: string): Promise<boolean> => {
      let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
      let result: boolean = false;
      try {
        let pixelMap = await imageSourceApi.createPixelMapList(decodeOption);
        console.info(`${TAG} createPixelMapList success `);
        await imageSourceApi.release();
        return result;
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code} `);
        if (error.code == 62980103) {
          result = true;
        }
        await imageSourceApi.release();
        return result;
      }
    };

    const testCreatePixelMapUsingAllocatorWithOptError =
      async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
        exceptMimeType: string): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = await imageSourceApi.createPixelMapUsingAllocator(decodeOption, image.AllocatorType.AUTO);
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          pixelMap.release();
          await imageSourceApi.release();
          return result;
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          await imageSourceApi.release();
          if (error.code == unSupportPixelMapCode) {
            result = true;
          }
          return result;
        }
      };

    const testCreatePixelMapUsingAllocatorSyncWithOptError =
      async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
        exceptMimeType: string): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = imageSourceApi.createPixelMapUsingAllocatorSync(decodeOption, image.AllocatorType.AUTO);
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          await pixelMap.release();
          await imageSourceApi.release();
          return result;
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          await imageSourceApi.release();
          if (error.code == unSupportPixelMapCode) {
            result = true;
          }
          return result;
        }
      };

    const testCreatePixelMapUsingAllocatorWithOpt =
      async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
        exceptMimeType: string): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = await imageSourceApi.createPixelMapUsingAllocator(decodeOption, image.AllocatorType.AUTO);
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          let imageInfo = await pixelMap.getImageInfo();
          console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
          result =
            decodeOption.desiredPixelFormat == imageInfo.pixelFormat &&
            decodeOption.desiredSize?.width == imageInfo.size.width &&
            decodeOption.desiredSize.height == imageInfo.size.height &&
            exceptMimeType == imageInfo.mimeType &&
            imageInfo.pixelFormat == decodeOption.desiredPixelFormat;
          await pixelMap.release();
          await imageSourceApi.release();
          return result;
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          await imageSourceApi.release();
          return false;
        }
      };

    const testCreatePixelMapUsingAllocatorSyncWithOpt =
      async (TAG: string, fileName: string, decodeOption: image.DecodingOptions,
        exceptMimeType: string): Promise<boolean> => {
        let imageSourceApi: image.ImageSource = await getImageSource(TAG, fileName);
        let result: boolean = false;
        try {
          let pixelMap = imageSourceApi.createPixelMapUsingAllocatorSync(decodeOption, image.AllocatorType.AUTO);
          console.info(`${TAG} pixelMap is ${pixelMap}`);
          let imageInfo = await pixelMap.getImageInfo();
          console.info(`${TAG} image mimeType is ${imageInfo.mimeType},image width is${imageInfo.size.width},image height is${imageInfo.size.height},image pixelmap is${imageInfo.pixelFormat}`);
          result =
            decodeOption.desiredPixelFormat == imageInfo.pixelFormat &&
            decodeOption.desiredSize?.width == imageInfo.size.width &&
            decodeOption.desiredSize.height == imageInfo.size.height &&
            exceptMimeType == imageInfo.mimeType &&
            imageInfo.pixelFormat == decodeOption.desiredPixelFormat;
          await pixelMap.release();
          await imageSourceApi.release();
          return result;
        } catch (error) {
          console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
          imageSourceApi.release();
          return false;
        }
      };

    const testGetImageSourceSupportedFormats =
      async (TAG: string,
        exceptMimeType: string): Promise<boolean> => {
        let supportedFormat: boolean = false;
        let formats = await image.getImageSourceSupportedFormats();
        supportedFormat = formats.includes(exceptMimeType);
        console.info(`${TAG} supportedFormat is ${supportedFormat}`);
        return supportedFormat;
      };

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DOCODE_SUPPORTE_AVIF_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_DOCODE_SUPPORTE_AVIF_0001
     * @tc.desc   test imageSource info mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_DOCODE_SUPPORTE_AVIF_0001`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_DOCODE_SUPPORTE_AVIF_0001`;
      try {
        let result = await testGetImageSourceSupportedFormats(TAG, 'image/avif');
        console.info(`${TAG} case supportedFormat is ${result} `);
        expect(typeof result).assertEqual('boolean');
        done();
      } catch (error) {
        console.info(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0001
     * @tc.desc   test imageSource info mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0001`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0001`;
      try {
        let mimeType = await testGetImageInfoMimeType(TAG, `8bit_I420_497_323.avif`);
        console.info(`${TAG} case mimeType is ${mimeType},mimeType type is ${typeof mimeType} `);
        expect(mimeType).assertEqual('image/avif');
        done();
      } catch (error) {
        console.info(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0002
     * @tc.desc   test imageSource info mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0002`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFO_MIMETYPE_0002`;
      try {
        let mimeType = await testGetImageInfoMimeType(TAG, `10bit_I010_1080_720.avif`);
        console.info(`${TAG} case mimeType is ${mimeType},mimeType type is ${typeof mimeType} `);
        expect(mimeType).assertEqual('image/avif');
        done();
      } catch (error) {
        console.info(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0001
     * @tc.desc   test imageSource info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0001`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0001`;
      try {
        let mimeType = await testGetImageInfoSyncMimeType(TAG, `8bit_I420_497_323.avif`);
        console.info(`${TAG} case mimeType is ${mimeType},mimeType type is ${typeof mimeType} `);
        expect(mimeType).assertEqual('image/avif');
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0002
     * @tc.desc   test imageSource info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0002`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_GERIMAGEINFOSYNC_MIMETYPE_0002`;
      try {
        let mimeType = await testGetImageInfoSyncMimeType(TAG, `10bit_I010_1080_720.avif`);
        console.info(`${TAG} case mimeType is ${mimeType},mimeType type is ${typeof mimeType} `);
        expect(mimeType).assertEqual('image/avif');
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0001
     * @tc.number SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0001
     * @tc.desc   test picture info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0001`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0001`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePictureMimeType(TAG, `8bit_I420_497_323.avif`, 'image/avif', 497, 323);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0002
     * @tc.number SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0002
     * @tc.desc   test picture info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0002`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_PICTURE_GERIMAGEINFO_MIMETYPE_0002`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePictureMimeType(TAG, `10bit_I010_1080_720.avif`, 'image/avif', 1080, 720);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0001
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0001`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0001`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePixelMapWithOutOpt(TAG, `8bit_I420_497_323.avif`, 'image/avif', 497, 323);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0002
     * @tc.desc   test picture info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0002`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0002`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePixelMapWithOutOpt(TAG, `10bit_I010_1080_720.avif`, 'image/avif', 1080, 720);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0003
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0003`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0003`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePixelMapSyncWithOutOpt(TAG, `8bit_I420_497_323.avif`, 'image/avif', 497, 323);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0004
     * @tc.desc   test picture info sync mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0004`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0004`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      try {
        let result = await testCreatePixelMapSyncWithOutOpt(TAG, `10bit_I010_1080_720.avif`, 'image/avif', 1080, 720);
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0005
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0005`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0005`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0006
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0006
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0006`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0006`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0007
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0007
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0007`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0007`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0008
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0008
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0008`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0008`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0009
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0009
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0009`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0009`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0010
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0010
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0010`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0010`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_888
      }
      try {
        let result = await testCreatePixelMapWithOptError(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0011
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0011
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0011`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0011`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0012
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0012
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0012`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0012`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0013
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0013
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0013`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0013`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapWithOptError(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0014
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0014
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0014`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0014`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0015
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0015
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0015`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0015`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0016
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0016
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0016`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0016`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0017
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0017
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0017`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0017`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0018
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0018
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0018`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0018`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0019
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0019
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0019`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0019`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0020
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0020
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0020`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0020`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0021
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0021
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0021`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0021`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_888
      }
      try {
        let result = await testCreatePixelMapSyncWithOptError(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0022
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0022
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0022`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0022`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0023
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0023
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0023`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0023`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0024
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0024
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0024`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0024`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapSyncWithOptError(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0025
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0025
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0025`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0025`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0026
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0026
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0026`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0026`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0027
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0027
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0027`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0027`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapListWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0028
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0028
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0028`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0028`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_888
      }
      try {
        let result = await testCreatePixelMapListWithOptError(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0029
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0029
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0029`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0029`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapListWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0030
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0030
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0030`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0030`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapListWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0031
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0031
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0031`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0031`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapListWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0032
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0032
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0032`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0032`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapListWithOptError(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0033
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0033
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0033`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0033`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0034
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0034
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0034`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0034`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0035
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0035
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0035`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0035`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0036
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0036
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0036`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0036`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0038
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0038
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0038`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0038`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0039
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0039
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0039`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0039`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0040
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0040
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0040`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0040`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0042
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0042
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0042`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0042`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0043
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0043
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0043`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0043`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0044
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0044
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0044`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0044`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0046
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0046
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0046`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0046`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0047
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0047
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0047`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0047`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0048
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0048
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0048`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0048`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0049
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0049
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0049`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0049`;
      if (!isSupportedAvif) {
        console.info(`${TAG} does not support avif`);
        done();
        return
      }
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorSyncWithOpt(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
      * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0037
      * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0037
      * @tc.desc   test avif pixelMap imageinfo
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */

    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0037`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0037`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_888
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOptError(TAG, `8bit_I420_497_323.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0041
     * @tc.number SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0041
     * @tc.desc   test avif pixelMap imageinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it(`SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0041`, Level.LEVEL0, async (done: Function) => {
      const TAG = `SUB_MULTIMEDIA_IMAGE_SOURCE_PIXELMAP_IMAGEINFO_0041`;
      let decodeOption: image.DecodingOptions;
      decodeOption = {
        index: 0,
        desiredSize: { width: 1000, height: 500 },
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let result = await testCreatePixelMapUsingAllocatorWithOptError(TAG, `10bit_I010_1080_720.avif`, decodeOption, 'image/avif');
        console.info(`${TAG} case result  ${result} `);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error message is ${error.message},error code is ${error.code}`);
        expect().assertFail();
        done();
      }
    });

  });
}