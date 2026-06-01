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

const TAG = 'Image.ImagePropertyKeySyncEnum8'

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

async function getImagePropertySync8(done: () => void, testContext: Context, testName: string, path: string,
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

export default function ImageGetImagePropertySyncEnumLength(): void {
  describe('ImageGetImagePropertySyncEnumLength', () => {
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

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_121
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_121
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_121', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_121',
        'test_exif_empty_2.jpg',
        image.PropertyKey.FRONT_CAMERA,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_122
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_122
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_122', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_122',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE_REF,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_123
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_123
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_123', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_123',
        'test_exif_empty_2.jpg',
        image.PropertyKey.IMAGE_LENGTH,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_124
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_124
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_124', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_124',
        'test_exif_empty_2.jpg',
        image.PropertyKey.BURST_NUMBER,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_125
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_125
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_125', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_125',
        'test_exif_empty_2.jpg',
        image.PropertyKey.YCBCR_SUB_SAMPLING,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_126
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_126
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_126', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_126',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_BEARING,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_127
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_127
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_127', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_127',
        'test_exif_empty_2.jpg',
        image.PropertyKey.DEFAULT_CROP_SIZE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_128
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_128
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_128', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_128',
        'test_exif_empty_2.jpg',
        image.PropertyKey.EXPOSURE_TIME,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_129
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_129
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_129', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_129',
        'test_exif_empty_2.jpg',
        image.PropertyKey.LENS_SERIAL_NUMBER,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_130
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_130
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_130', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_130',
        'test_exif_empty_2.jpg',
        image.PropertyKey.XMAGE_MODE,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_131
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_131
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_131', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_131',
        'test_exif_empty_2.jpg',
        image.PropertyKey.XMAGE_BOTTOM,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_132
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_132
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_132', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_132',
        'test_exif_empty_2.jpg',
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_133
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_133
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_133', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_133',
        'test_exif_empty_2.jpg',
        image.PropertyKey.SUBSEC_TIME_DIGITIZED,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_134
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_134
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_134', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_134',
        'test_exif_empty_2.jpg',
        image.PropertyKey.PHOTO_MODE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_135
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_135
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_135', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync8(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_135',
        'test_exif_empty_2.jpg',
        image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        });
    });

  });
}