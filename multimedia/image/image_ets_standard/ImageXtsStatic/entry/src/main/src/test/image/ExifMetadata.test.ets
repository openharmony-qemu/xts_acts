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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from "@kit.ImageKit";
import common from '@ohos.app.ability.common';
import { fileIo as fs } from '@kit.CoreFileKit';
import { colorSpaceManager } from "@kit.ArkGraphics2D";
const TAG = 'XTS.ExifMetadata'

export default function ExifMetadataTest(): void {
  describe('ExifMetadataTest', () => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let fdNumber: int;
    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      console.info(TAG, "image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }
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
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0100
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0100
     * @tc.desc      ExifMetadata-createInstance normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0100";
      console.info(TAG, `start：${testName}`);
      try {
        let metadata = image.ExifMetadata.createInstance();
        expect(metadata != undefined).assertTrue();
        done();
        } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0200
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0200
     * @tc.desc      ExifMetadata-getProperties normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0200";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let metaData = await imageSourceObj!.readImageMetadata(["ImageWidth", "ImageLength"]);
      try {
        let res: Record<string, string | null> = await metaData!.exifMetadata!.getProperties(["ImageWidth", "ImageLength"]);
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0300
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0300
     * @tc.desc      ExifMetadata-setProperties normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0300";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let metaData = await imageSourceObj!.readImageMetadata(["ImageWidth"]);
      const setkey: Record<string, string | null> = {};
      setkey[image.PropertyKey.IMAGE_WIDTH] = '200';
      try {
        await metaData!.exifMetadata!.setProperties(setkey);
        let res = await metaData!.exifMetadata!.getProperties([image.PropertyKey.IMAGE_WIDTH]);
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0400
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0400
     * @tc.desc      ExifMetadata-getAllProperties normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0400";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let metadataKey: string[] = ["ImageWidth"];
      const exifValue: image.ImageMetadata = await imageSourceObj!.readImageMetadata(metadataKey);
      try {
        let res: Record<string, string | null> = await exifValue!.exifMetadata!.getAllProperties();
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0500
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0500
     * @tc.desc      ExifMetadata-getBlob normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0500";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let exifMetadataKey: string[] = ["ImageWidth"];
      const metadata: image.ImageMetadata = await imageSourceObj!.readImageMetadata(exifMetadataKey);
      try {
        let res = await metadata!.exifMetadata!.getBlob();
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0600
     * @tc.name      SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0600
     * @tc.desc      ExifMetadata-setBlob normal parameter
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = "SUB_MEDIA_IMAGE_EXIF_METADATA_STATIC_0600";
      console.info(TAG, `start：${testName}`);
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      let exifMetadataKey: string[] = ["ImageWidth"];
      const metadata: image.ImageMetadata = await imageSourceObj!.readImageMetadata(exifMetadataKey);
      try {
        let res = await metadata!.exifMetadata!.getBlob();
        metadata!.exifMetadata!.setBlob(res);
        expect(res != undefined).assertTrue();
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0100
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0100
     * @tc.desc      createAuxiliaryPictureUsingAllocator normal parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0100';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      let pixels: ArrayBuffer = new ArrayBuffer(100000);
      try {
        let auxiliaryPictureInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          size: { width: 100, height: 100 },
          pixelFormat:image.PixelMapFormat.RGBA_8888,
          rowStride:0,
          colorSpace:colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
        };
        mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxiliaryPictureInfo, image.AllocatorType.AUTO, pixels);
        console.info(TAG, testName, 'createAuxiliaryPictureUsingAllocator success');
        let res = mAuxiliaryPicture.getAuxiliaryPictureInfo();
        expect(res!.pixelFormat).assertEqual(auxiliaryPictureInfo!.pixelFormat);
        mAuxiliaryPicture!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0200
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0200
     * @tc.desc      createAuxiliaryPictureUsingAllocator pixelFormat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0200', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_STATIC_0200';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      let pixels: ArrayBuffer = new ArrayBuffer(100000);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ASTC_4x4,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let auxiliaryPictureInfo: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
            size: { width: 100, height: 100 },
            pixelFormat:format,
            rowStride:0,
            colorSpace:colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          };
          mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxiliaryPictureInfo, image.AllocatorType.AUTO, pixels);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual(7600206);
        }
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_STATIC_0100
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_STATIC_0100
     * @tc.desc      readImageMetadataByType cover 7700204
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_STATIC_0100';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        const metadataTypes = [image.MetadataType.EXIF_METADATA];
        await imageSourceObj!.readImageMetadataByType(metadataTypes, -100);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual(7700204);
        await imageSourceObj!.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_STATIC_0100
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_STATIC_0100
     * @tc.desc      createImageRawData normal parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_STATIC_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_STATIC_0100';
      let fd: int = getFd('meta.dng');
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let res = await imageSourceObj!.createImageRawData();
        console.info(TAG, testName, 'createImageRawData success', JSON.stringify(res));
        expect(res.bitsPerPixel).assertEqual(16);
        await imageSourceObj!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}