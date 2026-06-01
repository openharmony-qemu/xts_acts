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
  propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
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
  } catch (err) {
    let businessError: BusinessError = err as BusinessError;
    console.error(TAG, testName, 'this is catch err', businessError!.message, businessError!.code);
    callback(undefined, businessError);
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_106
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_106
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_106', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_106', 'test_exif_empty_2.jpg', image.PropertyKey.SUBFILE_TYPE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_107
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_107
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_107', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_107', 'test_exif_empty_2.jpg', image.PropertyKey.REFERENCE_BLACK_WHITE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_108
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_108
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_108', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_108', 'test_exif_empty_2.jpg', image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_109
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_109
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_109', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_109', 'test_exif_empty_2.jpg', image.PropertyKey.PITCH_ANGLE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertUndefined();
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_110
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_110
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_110', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_110', 'test_exif_empty_2.jpg', image.PropertyKey.FLASHPIX_VERSION,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_111
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_111
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_111', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_111', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_NIGHT_CONF,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_112
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_112
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_112', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_112', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_DEST_LATITUDE,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_113
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_113
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_113', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_113', 'test_exif_empty_2.jpg', image.PropertyKey.CUSTOM_RENDERED,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_114
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_114
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_114', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_114', 'test_exif_empty_2.jpg', image.PropertyKey.FACE_CONF,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_115
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_115
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_115', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_115', 'test_exif_empty_2.jpg', image.PropertyKey.SUBSEC_TIME,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_116
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_116
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_116', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_116', 'test_exif_empty_2.jpg', image.PropertyKey.COMPRESSED_BITS_PER_PIXEL,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_117
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_117
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_117', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_117', 'test_exif_empty_2.jpg', image.PropertyKey.CAPTURE_MODE,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_118
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_118
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_118', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_118', 'test_exif_empty_2.jpg', image.PropertyKey.IMAGE_WIDTH,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_119
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_119
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_119', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_119', 'test_exif_empty_2.jpg', image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_120
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_120
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_120', Level.LEVEL1, async (done: () => void) => {
      getImagePropertySync7(done, testContext, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_120', 'test_exif_empty_2.jpg', image.PropertyKey.SUBSEC_TIME_ORIGINAL,
        (data?: string, error?: BusinessError) => {
          expect(error!.code).assertEqual(7700101);
          done();
        })
    })

  });
}