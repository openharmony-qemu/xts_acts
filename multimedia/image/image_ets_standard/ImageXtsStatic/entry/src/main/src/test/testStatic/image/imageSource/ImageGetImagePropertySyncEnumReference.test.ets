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

const TAG = 'Image.ImagePropertyKeySyncEnum7'

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

async function getImagePropertySync7(done: () => void, testContext: Context, testName: string, path: string,
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

export default function ImageGetImagePropertySyncEnumReference(): void {
  describe('ImageGetImagePropertySyncEnumReference', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0100', 'test_exif_empty_2.jpg', image.PropertyKey.SUBFILE_TYPE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0200', 'test_exif_empty_2.jpg', image.PropertyKey.REFERENCE_BLACK_WHITE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0300', 'test_exif_empty_2.jpg', image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0400', 'test_exif_empty_2.jpg', image.PropertyKey.PITCH_ANGLE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertUndefined();
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0500', 'test_exif_empty_2.jpg', image.PropertyKey.FLASHPIX_VERSION,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0600', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_NIGHT_CONF,
        (data?: string, errorCode?: int) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0700', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_DEST_LATITUDE,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0800', 'test_exif_empty_2.jpg', image.PropertyKey.CUSTOM_RENDERED,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_0900', 'test_exif_empty_2.jpg', image.PropertyKey.FACE_CONF,
        (data?: string, errorCode?: int) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1000', 'test_exif_empty_2.jpg', image.PropertyKey.SUBSEC_TIME,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1100', 'test_exif_empty_2.jpg', image.PropertyKey.COMPRESSED_BITS_PER_PIXEL,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1200', 'test_exif_empty_2.jpg', image.PropertyKey.CAPTURE_MODE,
        (data?: string, errorCode?: int) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1300', 'test_exif_empty_2.jpg', image.PropertyKey.IMAGE_WIDTH,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1400', 'test_exif_empty_2.jpg', image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC7_ENUM_static_1500', 'test_exif_empty_2.jpg', image.PropertyKey.SUBSEC_TIME_ORIGINAL,
        (data?: string, errorCode?: int) => {
          expect(errorCode).assertEqual(7700101);
          done();
        })
    })

  });
}