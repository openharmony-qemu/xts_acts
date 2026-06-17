'use static'
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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium';

const TAG = 'xtsStatic_imagePackerStaticTest';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function getMetadataPromiseTest(done: () => void, testName: string, path: string,
  callback: (exifPictureObj: image.Picture) => Promise<void>) {
  let pathUri = `file://${testContext.filesDir}/${path}`;
  let imageSource: image.ImageSource | undefined = image.createImageSource(pathUri);
  console.info(TAG, testName, 'creat imageSource Success.', imageSource);
  if (imageSource == undefined) {
    console.error(TAG, testName, 'No such file');
    expect().assertFail();
  } else {
    let exifCommodityPixelMap: image.PixelMap | undefined = await imageSource!.createPixelMap();
    console.info(TAG,testName, 'createPixelMap success.');
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap!) as image.Picture;
    if (exifPictureObj != null) {
      callback(exifPictureObj);
    } else {
      console.error(TAG, testName, 'createPicture is null');
      expect().assertFail();
      done();
    }
  }
}

async function sourceRelease( exifPictureObj: image.Picture ): Promise<void> {
  await exifPictureObj!.release();
}

export default function imageGetMetaDataStaticTest(): void {
  describe('imageGetMetaDataStaticTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0100
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0100
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0100';
      const path = 'CUVAHdrMulti.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect(exifMetaData != null).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        await sourceRelease(exifPictureObj);
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0200
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0200
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect(exifMetaData != null).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        await exifPictureObj.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0300
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0300
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_picture_Supp_static_0300';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect(exifMetaData != null).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        await exifPictureObj.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0100
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0100
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0100';
      const path = 'CUVAHdrMulti.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600202);
        }
        await exifPictureObj.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0200
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0200
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0200';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600202);
        }
        await exifPictureObj.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0300
     * @tc.number SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0300
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_picture_getMetadata_abnormal_picture_Supp_static_0300';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, async (exifPictureObj) => {
        try {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType) as image.Metadata;
          console.info(TAG, testName, `exifPictureObj.getMetadata(metadataType) success: `, JSON.stringify(exifMetaData));
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(7600202);
        }
        await exifPictureObj.release()
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

  })
  }
