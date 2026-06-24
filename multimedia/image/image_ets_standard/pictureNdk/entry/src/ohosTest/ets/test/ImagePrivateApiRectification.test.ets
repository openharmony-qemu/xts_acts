/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ndkTest from 'libPictureNdk.so';
import image from "@ohos.multimedia.image";
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { BusinessError } from '@kit.BasicServicesKit';

const testTag = 'pictureNdkTest';
const domain = 0x0000;
const TEST_SUCCESS = 1;

function createDefaultExifMetadata(type: image.MetadataType): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(type);
  return metadata;
}

export default function ImagePrivateApiRectification() {
  let filePath: string;
  let fdNumber: number;
  let isSupportHeic: Boolean;
  describe('ImagePrivateApiRectification', () => {
    beforeAll(async () => {
      isSupportHeic =
        image.getImageSourceSupportedFormats().includes("image/heic");
      console.info(`isSupportHeic is ${isSupportHeic}`)
    })

    afterEach(() => {
    })

    const getFd = async (fileName: string): Promise<number> => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath);
      fdNumber = file.fd
      console.info('case getFd number is: ' + fdNumber);
      return fdNumber
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_GETPROPERTY_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_GETPROPERTY_0100
     * @tc.desc   Test get ptoperty from metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_GETPROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetBlobMetaData(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0100
     * @tc.desc   Test picture blob metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobMetaData(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0200
     * @tc.desc   Test picture blob metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.SetBlobMetaData(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0300
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let result = ndkTest.GetBlobDataSizeMDNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0400
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobDataSizeBSNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0500
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0500', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetBlobDataSizeBSNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0600
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobMetaDataMDNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0700
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0700', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobMetaDataBlobNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0800
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0800', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobMetaDataBSZero(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0900
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0900', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_0900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetBlobMetaDataBSLess(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1000
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1000', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetBlobMetaData(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1100
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.SetBlobMetaDataMetaDataNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1200
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.SetBlobMetaDataBlobNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1300
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.SetBlobMetaDataBlobSizeZero(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1400
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.SetBlobMetaData(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1500
     * @tc.desc   Test picture blob metadata error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1500', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_BLOB_METADATA_1500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.SetBlobMetaDataBlobSizeZero(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0100
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureCount(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0200
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetAuxiliaryPictureCount(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0300
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureCountPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0400
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureCountCountNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0500
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0500', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`AllAuxiliaryPictures_exclude_fragment.jpg`);
        let result = ndkTest.GetAuxiliaryPictureTypes(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0600
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureTypesPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0700
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0700', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureTypesAuxPicNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0800
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0800', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureTypesCountNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0900
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0900', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_0900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetAuxiliaryPictureTypesCountError(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1000
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1000', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataCount(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1100
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1100
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataCountPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1200
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1200
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataCountCountNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1300
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1300
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataTypes(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1400
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1400
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataTypesPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1500
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1500
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1500', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataTypesMetadataTypesNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1600
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1600
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v4.jpg`);
        let result = ndkTest.GetMetadataTypesCountNull(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1700
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1700
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1700', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.GetMetadataTypesCountError(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1800
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1800
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1800', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`all_auxtype.heic`);
        let result = ndkTest.RemoveAuxiliaryPicture(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1900
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1900
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1900', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_1900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.RemoveAuxiliaryPicturePicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2000
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2000
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2000', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.RemoveAuxiliaryPictureAuxTypeUnsup(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2100
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2100
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.RemoveMetadata(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2200
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2200
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.RemoveMetadataPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2300
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2300
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.RemoveMetadataMetaDataTypeUnsup(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2400
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2400
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.PictureNativeDeepCopy();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2500
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2500
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2500', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.PictureNativeDeepCopyError();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2600
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2600
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2600', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.AcquirePixelmap();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2700
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2700
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2700', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.AcquirePixelmapAuxPicNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2800
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2800
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2800', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`test_exif_v2.jpg`);
        let result = ndkTest.AcquirePixelmapPMNull();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2900
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2900
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2900', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_2900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.RemoveAuxiliaryPictureAuxTypeUnsup(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3000
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3000
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3000', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetMetadataCount(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3100
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3100
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.GetMetadataTypes(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3200
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3200
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      if (!isSupportHeic) {
        console.info("device is not support heic");
        done();
        return;
      }
      try {
        let fd = await getFd(`AllAuxiliaryPictures.jpg`);
        let result = ndkTest.RemoveAuxiliaryPicture(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3300
     * @tc.number SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3300
     * @tc.desc   Test picture AuxiliaryPicture and MetaData.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_AUXILIAEY_PICTURE_AND_METADATA_3300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let fd = await getFd(`HEIC_(664x374)_yuv420p_(fail_name)_(EXIF_HDR)_SDR.heic`);
        let result = ndkTest.RemoveMetadata(fd);
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })
  })
}