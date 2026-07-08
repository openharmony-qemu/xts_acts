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
} from '@ohos/hypium-binary/src/main/indexStatic';
import { Context } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

const TAG = 'Image.ImagePropertyKeySyncEnum2A'

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
  let caseName = 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_016';
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

export default function ImageGetImagePropertySyncEnumScenePointer(): void {
  describe('ImageGetImagePropertySyncEnumScenePointer', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0100
     * @tc.desc   PhotoAccessHelper_Photo:GPS_TIME_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0100', 'test_exif_v2.jpg', image.PropertyKey.GPS_TIME_STAMP,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('11:37:58.00');
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0200
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_POINTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0200', 'test_exif_v2.jpg', image.PropertyKey.SCENE_POINTER,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('256')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })

    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0300
     * @tc.desc   PhotoAccessHelper_Photo:CAMERA_OWNER_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0300', 'test_exif_v2.jpg', image.PropertyKey.CAMERA_OWNER_NAME,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('c.uec')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0400
     * @tc.desc   PhotoAccessHelper_Photo:BITS_PER_SAMPLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0400', 'test_exif_v2.jpg', image.PropertyKey.BITS_PER_SAMPLE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1, 1, 1')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0500
     * @tc.desc   PhotoAccessHelper_Photo:STANDARD_OUTPUT_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0500', 'test_exif_v2.jpg', image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('5')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0600
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0600', 'test_exif_v2.jpg', image.PropertyKey.OFFSET_TIME,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2024:01:25')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0700
     * @tc.desc   PhotoAccessHelper_Photo:DATE_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0700', 'test_exif_v2.jpg', image.PropertyKey.DATE_TIME_ORIGINAL,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2024:01:25 05:51:34')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0800
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BEACH_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0800', 'test_exif_v2.jpg', image.PropertyKey.SCENE_BEACH_CONF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('6')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0900
     * @tc.desc   PhotoAccessHelper_Photo:WHITE_BALANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_0900', 'test_exif_v2.jpg', image.PropertyKey.WHITE_BALANCE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Manual white balance')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1000
     * @tc.desc   PhotoAccessHelper_Photo:COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1000', 'test_exif_v2.jpg', image.PropertyKey.COMPOSITE_IMAGE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1100
     * @tc.desc   PhotoAccessHelper_Photo:GPS_SATELLITES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1100', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1100', 'test_exif_v2.jpg', image.PropertyKey.GPS_SATELLITES,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('xxx')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1200
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1200
     * @tc.desc   PhotoAccessHelper_Photo:SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1200', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1200', 'test_exif_v2.jpg', image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('xxxw')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1300
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1300
     * @tc.desc   PhotoAccessHelper_Photo:CFA_PATTERN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1300', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1300', 'test_exif_v2.jpg', image.PropertyKey.CFA_PATTERN,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('1 bytes undefined data')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1400
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1400
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_SNOW_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1400', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1400', 'test_exif_v2.jpg', image.PropertyKey.SCENE_SNOW_CONF,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('7')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1500
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1500
     * @tc.desc   PhotoAccessHelper_Photo:APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1500', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1500', 'test_exif_v2.jpg', image.PropertyKey.APERTURE_VALUE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('4.00 EV (f/4.0)')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1600
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1600
     * @tc.desc   PhotoAccessHelper_Photo:GIF_LOOP_COUNT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1600', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1600', 'test61.gif', image.PropertyKey.GIF_LOOP_COUNT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('0')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1700
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1700
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_CAPTURE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1700', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1700', 'test_exif_v2.jpg', image.PropertyKey.SCENE_CAPTURE_TYPE,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('Standard')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1800
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1800
     * @tc.desc   PhotoAccessHelper_Photo:GPS_DOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1800', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1800', 'test_exif_v2.jpg', image.PropertyKey.GPS_DOP,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('182')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1900
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1900
     * @tc.desc   PhotoAccessHelper_Photo:JPEG_INTERCHANGE_FORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1900', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_1900', 'test_exif_v2.jpg', image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
        (data?: string, errorCode?: int) => {
          if (data != undefined) {
            expect(data).assertEqual('2798')
          }
          if (errorCode != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_2000
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_2000
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_STAGE_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_2000', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2A_static_2000', 'test_exif_v2.jpg', image.PropertyKey.SCENE_STAGE_CONF,
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

  });
}