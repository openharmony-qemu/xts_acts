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
} from '../../../../../../hypium/index';
import { Context } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

const TAG = 'Image.ImagePropertyKeySyncEnum1A'

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

async function getImagePropertySync(done: () => void, testContext: Context, testName: string, path: string,
  propertyKey: image.PropertyKey, callback: (data?: string, errorCode?: int) => void) {
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
  } catch (error) {
    expect().assertFail();
    console.error(TAG, testName, error!.message, error!.code);
    done();
  }
}

export default function ImagePropertyKeySyncEnumGPS(): void {
  describe('ImagePropertyKeySyncEnumGPS', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0100',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_SPEED,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('150');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0200',
        'test_exif_v2.jpg',
        image.PropertyKey.XMAGE_RIGHT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:COMPRESSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0300',
        'test_exif_v2.jpg',
        image.PropertyKey.COMPRESSION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Uncompressed');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:ROWS_PER_STRIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0400',
        'test_exif_v2.jpg',
        image.PropertyKey.ROWS_PER_STRIP,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('123');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:RELATED_SOUND_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0500',
        'test_exif_v2.jpg',
        image.PropertyKey.RELATED_SOUND_FILE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('/usr/home');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:IMAGE_UNIQUE_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0600',
        'test_exif_v2.jpg',
        image.PropertyKey.IMAGE_UNIQUE_ID,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('FXIC012');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:EXPOSURE_BIAS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0700',
        'test_exif_v2.jpg',
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('23.00 EV');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:PHOTOMETRIC_INTERPRETATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0800',
        'test_exif_v2.jpg',
        image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Reversed mono');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:USER_COMMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_0900',
        'test_exif_v2.jpg',
        image.PropertyKey.USER_COMMENT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('place for user comments');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:SPATIAL_FREQUENCY_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1000',
        'test_exif_v2.jpg',
        image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('13');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:GPS_IMG_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1100',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_IMG_DIRECTION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2.23');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1200',
        'test_exif_v2.jpg',
        image.PropertyKey.SCENE_VERSION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BLUE_SKY_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1300',
        'test_exif_v2.jpg',
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('4');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:METERING_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1400',
        'test_exif_v2.jpg',
        image.PropertyKey.METERING_MODE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Pattern');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:TRANSFER_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1500',
        'test_exif_v2.jpg',
        image.PropertyKey.TRANSFER_FUNCTION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('3 bytes undefined data');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1600
     * @tc.desc   PhotoAccessHelper_Photo:SATURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1600',
        'test_exif_v2.jpg',
        image.PropertyKey.SATURATION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1700
     * @tc.desc   PhotoAccessHelper_Photo:GPS_TRACK_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1700',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_TRACK_REF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('T');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1800
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_LEFT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1800',
        'test_exif_v2.jpg',
        image.PropertyKey.XMAGE_LEFT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1900
     * @tc.desc   PhotoAccessHelper_Photo:JPEG_INTERCHANGE_FORMAT_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_1900',
        'test_exif_v2.jpg',
        image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('4');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_2000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_2000
     * @tc.desc   PhotoAccessHelper_Photo:COPYRIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_2000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_static_2000',
        'test_exif_v2.jpg',
        image.PropertyKey.COPYRIGHT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('undefined (Photographer) - [None] (Editor)');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

  });
}