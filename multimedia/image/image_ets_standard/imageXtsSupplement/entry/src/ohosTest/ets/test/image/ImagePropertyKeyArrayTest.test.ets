/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG, sleep } from '../common';

const TAG = LOG_TAG + 'ImageXts.ImagePropertyKeyArray';
let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
let webpImageSourceApi: image.ImageSource;
let jpgImageSourceApi: image.ImageSource;
let pngImageSourceApi: image.ImageSource;
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function  ImagePropertyKeyArrayTest() {
  describe('ImagePropertyKeyArrayTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(async () => {
      console.info('afterAll case');
      await webpImageSourceApi.release();
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_035
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_035
     * @tc.desc       ImageWriteImageMetadata cover normal Artist
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_035';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
        expect(result.exifMetadata?.artist).assertEqual('name');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_036
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_036
     * @tc.desc       ImageWriteImageMetadata cover normal Artist
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_036';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
        expect(result.exifMetadata?.artist).assertEqual('NANAMI');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_043
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_043
     * @tc.desc       ImageWriteImageMetadata cover normal Artist
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_043';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
        expect(result.exifMetadata?.artist).assertEqual('name');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_044
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_044
     * @tc.desc       ImageWriteImageMetadata cover normal Artist
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_044';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
        expect(result.exifMetadata?.artist).assertEqual('NANAMI');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  })
}