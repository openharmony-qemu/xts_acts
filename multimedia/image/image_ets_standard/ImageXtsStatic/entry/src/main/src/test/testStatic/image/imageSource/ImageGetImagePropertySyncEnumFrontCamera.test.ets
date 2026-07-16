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

const TAG = 'Image.ImagePropertyKeySyncEnum2'

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

async function getImagePropertySync2(done: () => void, testContext: Context, testName: string, path: string,
  propertyKey: image.PropertyKey, callback: (data?: string, errorCode?: int) => void) {
  try {
    const imageSourceApi = getImageSource(path);
    if (imageSourceApi == null) {
      return;
    }
    console.info(TAG, testName, "imageSourceApi : " + imageSourceApi);
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

export default function ImageGetImagePropertySyncEnumFrontCamera(): void {
  describe('ImageGetImagePropertySyncEnumFrontCamera', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0100',
        'test_exif_v2.jpg',
        image.PropertyKey.FRONT_CAMERA,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('3');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0200',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE_REF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('N');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0300',
        'test_exif_v2.jpg',
        image.PropertyKey.IMAGE_LENGTH,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('0');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0400',
        'test_exif_v2.jpg',
        image.PropertyKey.BURST_NUMBER,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0500',
        'test_exif_v2.jpg',
        image.PropertyKey.YCBCR_SUB_SAMPLING,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('3, 2');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0600',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_BEARING,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2.0');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0700',
        'test_exif_v2.jpg',
        image.PropertyKey.DEFAULT_CROP_SIZE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('153, 841');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0800',
        'test_exif_v2.jpg',
        image.PropertyKey.EXPOSURE_TIME,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1/34 sec.');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_0900',
        'test_exif_v2.jpg',
        image.PropertyKey.LENS_SERIAL_NUMBER,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('qxhc');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1000',
        'test_exif_v2.jpg',
        image.PropertyKey.XMAGE_MODE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1100',
        'test_exif_v2.jpg',
        image.PropertyKey.XMAGE_BOTTOM,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1200',
        'test_exif_v2.jpg',
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Inch');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1300',
        'test_exif_v2.jpg',
        image.PropertyKey.SUBSEC_TIME_DIGITIZED,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('427000');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1400',
        'test_exif_v2.jpg',
        image.PropertyKey.PHOTO_MODE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('252');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync2(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC2_ENUM_static_1500',
        'test_exif_v2.jpg',
        image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1456');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        });
    });

  });
}