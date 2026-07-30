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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';

const TAG =  'xtsStatic_getAllPropertiesStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function getAllPropertiesPromiseTest(done: () => void, testName: string, path: string, callback:(metaData:image.ImageMetadata) => Promise<void>) {
    let inputPathUri =`${testContext.filesDir}/${path}`;
    console.info(TAG, testName, `path: ${path}`);
    let imageSourceApi: image.ImageSource|undefined = image.createImageSource(inputPathUri);
    console.info(TAG, testName,`imageSourceApi success:`,imageSourceApi);
    let metaData:image.ImageMetadata = await imageSourceApi!.readImageMetadata(["ImageWidth", "ImageLength"]);
    if (metaData != undefined && metaData.exifMetadata != undefined) {
      callback(metaData);
    }else {
      console.info(TAG, `failed; error:imageSourceApi!.readImageMetadata fail,`, testName);
      expect().assertFail();
      done();
    }
  await imageSourceApi!.release();
}

export default function metaDatagetAllPropertiesStaticTest(): void {
  describe('metaDatagetAllPropertiesStaticTest', () => {

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
     * @tc.number     SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0100
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值不为空
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0100';
      const testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test_exif_v2.jpg';
      let path =`${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSourceApi: image.ImageSource|undefined = image.createImageSource(path);
      console.info(TAG, testName,`imageSourceApi success:`,imageSourceApi);
      try {
        let metaData:image.ImageMetadata = await imageSourceApi!.readImageMetadata(["ImageWidth", "ImageLength"]);
        console.info(TAG, testName, `readImageMetadata success:`,metaData);
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let res: Record<string, string | null> = await metaData!.exifMetadata!.getAllProperties();
          expect(res != undefined).assertTrue();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'ExifMetadata getProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
      finally {
        await imageSourceApi?.release();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0200
     * @tc.number SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0200
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0200';
      const path = 'CUVAHdr.jpg';
      await getAllPropertiesPromiseTest(done, testName, path, async (metaData: image.ImageMetadata): Promise<void> => {
        try {
          let res: Record<string, string | null> = await metaData!.exifMetadata!.getAllProperties();
          console.info(TAG, testName, `getAllProperties success:`, res);
          expect(res != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0300
     * @tc.number SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0300
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0300';
      const path = 'CUVAHdrMulti.jpg';
      await getAllPropertiesPromiseTest(done, testName, path, async (metaData: image.ImageMetadata): Promise<void> => {
        try {
          let res: Record<string, string | null> = await metaData!.exifMetadata!.getAllProperties();
          console.info(TAG, testName, `getAllProperties success:`, res);
          expect(res != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0400
     * @tc.number SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0400
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_Supp_static_0400';
      const path = 'test_exif_v2.jpg';
      await getAllPropertiesPromiseTest(done, testName, path, async (metaData: image.ImageMetadata): Promise<void> => {
        try {
          let res: Record<string, string | null> = await metaData!.exifMetadata!.getAllProperties();
          console.info(TAG, testName, `getAllProperties success:`, res);
          expect(res != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        console.info(TAG, testName, 'done');
        done();
        return;
      })
    })
  })
}