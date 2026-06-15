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

const TAG = 'Image.ImageGetImagePropertySyncEnumSoftware'

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
    console.info(TAG, testName, "imageSourceApi : " + imageSourceApi);
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

export default function ImageGetImagePropertySyncEnumSoftware(): void {
  describe('ImageGetImagePropertySyncEnumSoftware', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:SOFTWARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0100', 'test_exif_v2.jpg', image.PropertyKey.SOFTWARE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('华为');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:GPS_DEST_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0200', 'test_exif_v2.jpg', image.PropertyKey.GPS_DEST_LONGITUDE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('33, 22, 11')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0300', 'test_exif_v2.jpg', image.PropertyKey.OFFSET_TIME_DIGITIZED,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('cfh')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0400', 'test_exif_v2.jpg', image.PropertyKey.SUBJECT_LOCATION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('0, 1')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:F_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0500', 'test_exif_v2.jpg', image.PropertyKey.F_NUMBER,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('f/1.0')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:GPS_ALTITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0600', 'test_exif_v2.jpg', image.PropertyKey.GPS_ALTITUDE_REF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Sea level')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:NEW_SUBFILE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0700', 'test_exif_v2.jpg', image.PropertyKey.NEW_SUBFILE_TYPE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('3')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0800', 'test_exif_v2.jpg', image.PropertyKey.XMAGE_TOP,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:CONTRAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_0900', 'test_exif_v2.jpg', image.PropertyKey.CONTRAST,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1000', 'test_exif_v2.jpg', image.PropertyKey.SUBJECT_AREA,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('(x,y) = (12,13)')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1100', 'test_exif_v2.jpg', image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('23, 34')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_PLANE_Y_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1200', 'test_exif_v2.jpg', image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('880')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:GPS_ALTITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1300', 'test_exif_v2.jpg', image.PropertyKey.GPS_ALTITUDE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('0.00')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:WIND_SNAPSHOT_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1400', 'test_exif_v2.jpg', image.PropertyKey.WIND_SNAPSHOT_MODE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:FACE_MOUTH_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1500', 'test_exif_v2.jpg', image.PropertyKey.FACE_MOUTH_CENTER,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1 2 3 4 5 6 7 8')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1600
     * @tc.desc   PhotoAccessHelper_Photo:OECF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4A_static_1600', 'test_exif_v2.jpg', image.PropertyKey.OECF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('4 bytes undefined data')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

  });
}