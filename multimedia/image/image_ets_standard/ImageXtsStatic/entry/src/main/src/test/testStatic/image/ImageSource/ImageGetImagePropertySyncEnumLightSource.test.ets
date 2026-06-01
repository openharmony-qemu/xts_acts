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

import { image } from '@kit.ImageKit';
import fs from '@ohos.file.fs';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium
} from '../../../../../../hypium';
import { Context } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

const TAG = 'Image.ImagePropertyKeySyncEnum9'

let testContext: Context = Hypium.get("Context") as Context;

function getFd(fileName: string): number {
  let basePath = testContext.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  let file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
  console.info(TAG, "image case open fd success " + file.fd);
  return file.fd;
}

function getImageSource(path: string): image.ImageSource {
  let fd = getFd(path);
  const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd.toInt());
  if (imageSourceApi === undefined) {
    throw new Error('createImageSource failed');
  }
  let imageInfo = imageSourceApi.getImageInfoSync();
  console.info(TAG, "createImageSource: " + JSON.stringify(imageInfo));
  return imageSourceApi;
}

async function getImagePropertySync9(done: () => void, testContext: Context, testName: string, path: string,
  propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = getImageSource(path);
    if (imageSourceApi == null) {
      return;
    }
    let propertyKeyName = imageSourceApi.getImagePropertySync(propertyKey);
    console.info(TAG, testName, "bits_per_sample : " + propertyKeyName);
    callback(propertyKeyName, undefined);
    done();
  } catch (err) {
    let businessError: BusinessError = err as BusinessError;
    console.error(TAG, testName, businessError!.message, businessError!.code);
    callback(undefined, businessError);
    done();
  }
}

export default function ImageGetImagePropertySyncEnumLightSource(): void {
  describe('ImageGetImagePropertySyncEnumLightSource', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_136', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_136',
        'test_exif_empty_2.jpg',
        image.PropertyKey.ISO_SPEED,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_137', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_137',
        'test_exif_empty_2.jpg',
        image.PropertyKey.LIGHT_SOURCE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_138', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_138',
        'test_exif_empty_2.jpg',
        image.PropertyKey.FOCUS_MODE,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_139', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_139',
        'test_exif_empty_2.jpg',
        image.PropertyKey.YCBCR_POSITIONING,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_140', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_140',
        'test_exif_empty_2.jpg',
        image.PropertyKey.FACE_VERSION,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_141', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_141',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_PROCESSING_METHOD,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_142', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_142',
        'test_exif_empty_2.jpg',
        image.PropertyKey.DNG_VERSION,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_143', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_143',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_AREA_INFORMATION,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_144', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_144',
        'test_exif_empty_2.jpg',
        image.PropertyKey.LENS_MODEL,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_145', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_145',
        'test_exif_empty_2.jpg',
        image.PropertyKey.LENS_SPECIFICATION,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_146', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_146',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DATE_STAMP,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_147', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_147',
        'test_exif_empty_2.jpg',
        image.PropertyKey.FACE_RECT,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_148', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_148',
        'test_exif_empty_2.jpg',
        image.PropertyKey.COMPONENTS_CONFIGURATION,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_149', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_149',
        'test_exif_empty_2.jpg',
        image.PropertyKey.COLOR_SPACE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_150', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync9(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_150',
        'test_exif_empty_2.jpg',
        image.PropertyKey.DATE_TIME,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });
  });
}