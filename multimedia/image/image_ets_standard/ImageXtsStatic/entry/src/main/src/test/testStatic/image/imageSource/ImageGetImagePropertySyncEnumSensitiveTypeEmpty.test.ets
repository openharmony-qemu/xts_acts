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

const TAG = 'Image.ImagePropertyKeySyncEnum11'

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

async function getImagePropertySync11(done: () => void, testContext: Context, testName: string, path: string,
  propertyKey: image.PropertyKey, callback: (data?: string, errorCode?: int) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = getImageSource(path);
    if (imageSourceApi == null) {
      return;
    }
    console.info(TAG, testName, "bits_per_sample : start");
    let propertyKeyName = imageSourceApi.getImagePropertySync(propertyKey);
    console.info(TAG, testName, "bits_per_sample : " + propertyKeyName);
    callback(propertyKeyName, undefined);
    done();
  } catch (error) {
    console.error(TAG, testName, 'this is catch err', error!.message, error!.code);
    callback(undefined, error.code);
    done();
  }
}

export default function ImageGetImagePropertySyncEnumSensitiveTypeEmpty(): void {
  describe('ImageGetImagePropertySyncEnumSensitiveTypeEmpty', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0100', 'test_exif_empty_2.jpg', image.PropertyKey.SENSITIVITY_TYPE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0200', 'test_exif_empty_2.jpg', image.PropertyKey.DATE_TIME_DIGITIZED,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0300', 'test_exif_empty_2.jpg', image.PropertyKey.EXPOSURE_MODE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0400', 'test_exif_empty_2.jpg', image.PropertyKey.MAX_APERTURE_VALUE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0500', 'test_exif_empty_2.jpg', image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0600', 'test_exif_empty_2.jpg', image.PropertyKey.BODY_SERIAL_NUMBER,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0700', 'test_exif_empty_2.jpg', image.PropertyKey.IMAGE_DESCRIPTION,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0800', 'test_exif_empty_2.jpg', image.PropertyKey.EXIF_VERSION,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_0900', 'test_exif_empty_2.jpg', image.PropertyKey.SAMPLES_PER_PIXEL,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1000', 'test_exif_empty_2.jpg', image.PropertyKey.STRIP_BYTE_COUNTS,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1100', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_MAP_DATUM,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1200', 'test_exif_empty_2.jpg', image.PropertyKey.ARTIST,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1300', 'test_exif_empty_2.jpg', image.PropertyKey.IS_XMAGE_SUPPORTED,
        (data?: string, errorCode?: int) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1400', 'test_exif_empty_2.jpg', image.PropertyKey.SHUTTER_SPEED,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1500', 'test_exif_empty_2.jpg', image.PropertyKey.MAKE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1600
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1600', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_TRACK,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1700
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1700', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_TYPE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1800
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1800', 'test_exif_empty_2.jpg', image.PropertyKey.OFFSET_TIME_ORIGINAL,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1900
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_1900', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_LATITUDE_REF,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_2000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_2000
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_2000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync11(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC11_ENUM_static_2000', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_FOOD_CONF,
        (data?: string, errorCode?: int) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })
  });
}