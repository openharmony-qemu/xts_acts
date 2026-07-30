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

import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';


const TAG = 'MetaDataSetBlobTest.xts'
let fdNumber: int = 0;
let imageSourceApi: image.ImageSource | undefined = undefined;
let pixelMaps: image.PixelMap | undefined = undefined;
let imageSource: image.ImageSource | undefined = undefined;
let testContext: common.UIAbilityContext | undefined = undefined;
let path: string = '';
let file: fs.File | undefined = undefined;

let isEmpty = (data: Object | undefined | null) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi!.getImageInfoSync()));
  return imageSourceApi!;
}

async function getPropertiesAbnormalPromiseTest(testName: string, path: string): Promise<image.Metadata | undefined> {
  imageSourceApi = await getImageSource(path);
  let commodityPixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap();
  if (commodityPixelMap == undefined) {
    console.error(TAG, testName, 'createPixelMap failed');
    return undefined;
  }
  let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
  let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
  let metaData: image.Metadata | undefined = await pictureObj.getMetadata(metadataType);
  console.log(TAG, testName, JSON.stringify(metaData));
  return metaData;
}

export default function MetaDataSetBlobStaticSuppTest():void {
  describe('MetaDataSetBlobStaticSuppTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      path = `file://${testContext!.filesDir}/test.jpg`;
      // file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      await imageSourceApi?.release();
    });



    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_Supp_TEST_Static_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_Supp_TEST_Static_0100
     * @tc.desc       imageSource -createPixelMap
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_Supp_TEST_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_Supp_TEST_Static_0100';
      const path = 'test_exif_v2.jpg';
      imageSourceApi = await getImageSource(path);
      try {
        let pixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap();
        if (pixelMap == undefined) {
          console.error(TAG, testName, 'Failed to create pixelMap');
          await imageSourceApi?.release();
          expect().assertFail();
        } else {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.');
          await imageSourceApi?.release();
          expect(isEmpty(pixelMap.isEditable)).assertFalse();
        }
      } catch (error) {
        console.error(TAG, testName, ' setBlob error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })

    
    /**
     * @tc.number     SUB_MEDIA_IMAGE_EXIF_METADATA_SET_PROPERTIES_Supp_TEST_Static_0100
     * @tc.name       SUB_MEDIA_IMAGE_EXIF_METADATA_SET_PROPERTIES_Supp_TEST_Static_0100
     * @tc.desc       Metadata -exifMetadata -setProperties -7600202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_SET_PROPERTIES_Supp_TEST_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_EXIF_METADATA_SET_PROPERTIES_Supp_TEST_Static_0100';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      imageSourceApi = await getImageSource(path);
      try {
        await imageSourceApi!.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi!.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let exifMetadata = metaData.exifMetadata!;
          await exifMetadata.setProperties({ "abc": "abc" });
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'Metadata is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'exifMetadata setProperties error', error.message, error.code);
        expect(error.code).assertEqual(7700204);
      } finally {
        await imageSourceApi?.release();
        done();
      }
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_HEIFS_METADATA_CLONE_Supp_TEST_Static_0100
     * @tc.name       SUB_MEDIA_IMAGE_HEIFS_METADATA_CLONE_Supp_TEST_Static_0100
     * @tc.desc       heifsMetadata -clone
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_HEIFS_METADATA_CLONE_Supp_TEST_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_HEIFS_METADATA_CLONE_Supp_TEST_Static_0100';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSourceApi = image.createImageSource(array, ops)!;
        let imageData = await imageSourceApi!.readImageMetadata()
        console.info(TAG, testName, 'metadataType',JSON.stringify(imageData.heifsMetadata))
        let result:image.HeifsMetadata|undefined= await imageData.heifsMetadata?.clone()
        console.info(TAG, testName, 'heifsMetadata success setBlob');
        expect(result?.heifsDelayTime).assertEqual(imageData.heifsMetadata?.heifsDelayTime);
        done();
      } catch (error) {
        console.error(TAG, testName, ' heifsMetadata setBlob error', error.message, error.code);
        expect(error.code).assertEqual(7600202);
      } finally {
        imageSourceApi?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0100
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0100
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0100';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.UNKNOWN };
        console.info(TAG, testName, ' createImageSource success');
        imageSource = image.createImageSource(path, sourceOptions)!;
        console.info(TAG, testName, ' createImageSource success');
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' createImageSource success');
        expect(res!.pixelFormat== image.PixelMapFormat.UNKNOWN).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });


    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0200
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0200
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0200';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.BGRA_8888 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat == image.PixelMapFormat.BGRA_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success',JSON.stringify(res));
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0300
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0300
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0300';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGB_565 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.RGB_565).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0400
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0400
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0400';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_8888 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0500
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0500
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0500';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.BGRA_8888 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.BGRA_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0600
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0600
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0600';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGB_888 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.RGB_888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0700
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0700
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0700';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.ALPHA_8 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.ALPHA_8).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0800
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0800
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0800';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_F16 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_F16).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0900
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0900
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_0900';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.NV21 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.NV21).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1000
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1000
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1000';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.NV12 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.NV12).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1100
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1100
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1100';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_1010102 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_1010102).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1200
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1200
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1200';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.YCBCR_P010 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.YCBCR_P010).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1300
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1300
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1300';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.YCRCB_P010 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.YCRCB_P010).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1400
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1400
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_Supp_TEST_Static_1400';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.ASTC_4x4 };
        imageSource = image.createImageSource(path, sourceOptions)!;
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.ASTC_4x4).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0100
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0100
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0100';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.UNKNOWN };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        expect(res!.pixelFormat== image.PixelMapFormat.UNKNOWN).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0200
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0200
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0200';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.ARGB_8888 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.ARGB_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0300
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0300
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0300';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGB_565 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat == image.PixelMapFormat.RGB_565).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0400
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0400
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0400';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_8888 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0500
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0500
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is BGRA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0500';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.BGRA_8888 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.BGRA_8888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0600
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0600
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0600';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGB_888 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.RGB_888).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0700
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0700
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0700';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.ALPHA_8 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.ALPHA_8).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0800
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0800
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0800';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_F16 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_F16).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0900
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0900
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_0900';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.NV21 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.NV21).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1000
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1000
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1000';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.NV12 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.NV12).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1100
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1100
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1100';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.RGBA_1010102 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_1010102).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1200
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1200
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1200';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.YCBCR_P010 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.YCBCR_P010).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1300
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1300
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1300';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.YCRCB_P010 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.YCRCB_P010).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1400
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1400
     * @tc.desc   image createImageSource the sourcePixelFormat parameter is ASTC_4x4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_Supp_Static_1400';
      try {
        let sourceOptions: image.SourceOptions =
          { sourceDensity: 120, sourcePixelFormat: image.PixelMapFormat.ASTC_4x4 };
        let file = fs.openSync(path, fs.OpenMode.CREATE);
        imageSource = image.createImageSource(file!.fd, sourceOptions);
        console.info(TAG, testName, ' createImageSource  imageSource success',imageSource);
        let res = await imageSource!.getImageInfo();
        console.info(TAG, testName, ' getImageInfo  imageSource success',res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.ASTC_4x4 ).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0100
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat is true the cropAndScaleStrategy is CROP_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0100';
      const formats = [
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.ASTC_4x4
      ];
      for (const format of formats) {
        try {
          let imageSource = image.createImageSource(path)!;
          let decodingOptions: image.DecodingOptions = {
            editable: true,
            desiredSize: { width: 200, height: 200 },
            rotate: 10,
            desiredPixelFormat: format,
            desiredRegion: { size: { width: 100, height: 100 }, x: 0, y: 0 },
            cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
            index: 0
          };
          pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
          expect(isEmpty(pixelMaps)).assertFalse();
          console.info(TAG, testName, format, ' createPixelMap success', JSON.stringify(pixelMaps));
          let res = await pixelMaps!.getImageInfo();
          console.info(TAG, testName, format, ' createPixelMap success', JSON.stringify(res));
          expect(res!.pixelFormat == format).assertTrue();
          console.info(TAG, testName, format, ' createPixelMap success', JSON.stringify(res));
        } catch (error) {
          console.error(TAG, testName, format, ' createPixelMap error', error);
          expect().assertFail();
        } finally {
          await pixelMaps?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0200
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the editable is true the isEditable is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0200';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          desiredSize: { width: 200, height: 200 },
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
          desiredRegion: { size: { width: 200, height: 200 }, x: 0, y: 0 },
          cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        expect(pixelMaps!.isEditable).assertTrue();
        console.info(TAG, testName, ' createPixelMap success');
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0300
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the editable is false the isEditable is false the cropAndScaleStrategy is CROP_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0300';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: false,
          desiredSize: { width: 200, height: 200 },
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
          desiredRegion: { size: { width: 200, height: 200 }, x: 0, y: 0 },
          cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
          index: 0
        };
        let pixelMapsTemp: image.PixelMap | undefined = await imageSource.createPixelMapUsingAllocator(decodingOptions, image.AllocatorType.SHARE_MEMORY);
        if (pixelMapsTemp != undefined) {
          pixelMaps = pixelMapsTemp;
          expect(pixelMaps!.isEditable).assertFalse()
          console.info(TAG, testName, ' createPixelMap success');
        } else {
          console.error(TAG, testName, ' createPixelMap failed');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, ' createPixelMap error', error);
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0400
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0400';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        let res = await pixelMaps!.getImageInfo();
        console.info(TAG, testName, res!.pixelFormat, ' createPixelMap success');
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap error', error, JSON.stringify(error));
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0500
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat ARGB_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0500';
    try {
      let imageSource = image.createImageSource(path)!;
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        rotate: 10,
        desiredPixelFormat:  image.PixelMapFormat.ARGB_8888,
        index: 0
      };
      pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
      let res = await pixelMaps!.getImageInfo();
      console.info(TAG, testName, res!.pixelFormat, ' createPixelMap success');
      expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
    } catch (error) {
      console.error(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap error', error, JSON.stringify(error));
      expect().assertFail();
    } finally {
      await pixelMaps?.release();
      done();
    }
  });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0900
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0900';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          rotate: 10,
          desiredPixelFormat:  image.PixelMapFormat.RGBA_F16,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        let res = await pixelMaps!.getImageInfo();
        console.info(TAG, testName, res!.pixelFormat, ' createPixelMap success');
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.UNKNOWN, ' createPixelMap error', error, JSON.stringify(error));
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0600
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0600';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        let res = await pixelMaps!.getImageInfo();
        console.info(TAG, testName, res!.pixelFormat, ' createPixelMap success');
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.RGBA_1010102, ' createPixelMap error', error,
          JSON.stringify(error));
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0700
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0700';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        let res = await pixelMaps!.getImageInfo();
        console.info(TAG, testName,' createPixelMap success', res!.pixelFormat);
        expect(res!.pixelFormat== image.PixelMapFormat.RGBA_8888).assertTrue();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.YCBCR_P010, ' createPixelMap error', error, JSON.stringify(error));
        expect().assertFail();
      } finally {
        await pixelMaps?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0800
     * @tc.desc   imageSource createPixelMapUsingAllocatorSync the desiredPixelFormat ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_SYNC_Supp_Static_0800';
      try {
        let imageSource = image.createImageSource(path)!;
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0
        };
        pixelMaps = imageSource.createPixelMapUsingAllocatorSync(decodingOptions, image.AllocatorType.SHARE_MEMORY)!;
        console.info(TAG, testName,' createPixelMapUsingAllocatorSync success', pixelMaps);
        let res = await pixelMaps!.getImageInfo();
        console.info(TAG, testName,' getImageInfo success', res!.pixelFormat);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, image.PixelMapFormat.ALPHA_8, ' createPixelMap error', error, JSON.stringify(error.code));
        expect(error.code).assertEqual(7700301);
      } finally {
        await pixelMaps?.release();
        done();
      }
    });


  })
}