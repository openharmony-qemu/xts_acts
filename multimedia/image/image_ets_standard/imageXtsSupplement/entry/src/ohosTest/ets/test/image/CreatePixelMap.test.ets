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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageXts.CreatePixelMap'

let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function createPixelMapFromImage(pathUri: string, sourceDensity: number = 98): Promise<image.PixelMap> {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let array = new ArrayBuffer(30000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  let ops: image.SourceOptions = {
    sourceDensity: sourceDensity,
  };
  let imageSource: image.ImageSource = image.createImageSource(array, ops);
  return await imageSource.createPixelMap();
}

export default function CreatePixelMapSupp() {
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  describe('CreatePixelMapSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      } catch (err) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 300, height: 70 },
          desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      } catch (err) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: { width: 200, height: 60 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 200, height: 200 },
          desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      } catch (err) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: { width: 150, height: 150 } },
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_040
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_040
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_040';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.height);
          expect(imageInfo.size.height).assertEqual(226);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_041
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_041
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_041';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.width);
          expect(imageInfo.size.width).assertEqual(472);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_042
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_042
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_042';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.height);
          expect(imageInfo.size.height).assertEqual(75);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_043
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_043
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_043';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.width);
          expect(imageInfo.size.width).assertEqual(472);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_044
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_044
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_044';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.height);
          expect(imageInfo.size.height).assertEqual(221);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_045
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_045
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_045';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != undefined) {
          console.info(TAG, testName, `imageInfo.size:` + imageInfo.size.width);
          expect(imageInfo.size.width).assertEqual(286);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_046
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_046
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_046';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`,
              imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(226);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_047
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_047
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_047';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`, imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(472);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_048
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_048
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_048';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`,
              imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(75);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_049
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_049
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_049';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`, imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(472);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_050
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_050
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_050';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`,
              imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(221);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_051
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_051
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_051';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.getImageInfo((error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, `Succeeded in obtaining the image pixel map information`, imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(286);
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_053
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_053
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_053';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_055
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_055
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_055';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_057
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_057
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_057';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      pixelMap.createAlphaPixelmap().then((alphaPixelMap: image.PixelMap) => {
        console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
            expect(pixelMap.isEditable).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_059
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_059
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_059';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
            expect(pixelMap.isStrideAlignment).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
            expect(pixelMap.isEditable).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_061
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_061
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_061', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_061';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
            expect(pixelMap.isStrideAlignment).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062
     * @tc.desc       createAlphaPixelmap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isEditable is: ' + pixelMap.isEditable);
            expect(pixelMap.isEditable).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_063
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_063
     * @tc.desc       createAlphaPixelmap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_063', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_063';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        pixelMap.createAlphaPixelmap((err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName, 'pixelMap.isStrideAlignment is: ' + pixelMap.isStrideAlignment);
            expect(pixelMap.isStrideAlignment).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064
     * @tc.desc       createAlphaPixelmapSync cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isEditable is: ' + pixelmap.isEditable)
          expect(pixelmap.isEditable).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_065
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_065
     * @tc.desc       createAlphaPixelmapSync cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_065', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_065';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isStrideAlignment is: ' + pixelmap.isStrideAlignment)
          expect(pixelmap.isStrideAlignment).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066
     * @tc.desc       createAlphaPixelmapSync cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isEditable is: ' + pixelmap.isEditable)
          expect(pixelmap.isEditable).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_067
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_067
     * @tc.desc       createAlphaPixelmapSync cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_067', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_067';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isStrideAlignment is: ' + pixelmap.isStrideAlignment)
          expect(pixelmap.isStrideAlignment).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068
     * @tc.desc       createAlphaPixelmapSync cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isEditable is: ' + pixelmap.isEditable)
          expect(pixelmap.isEditable).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_069
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_069
     * @tc.desc       createAlphaPixelmapSync cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_069';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        if (pixelMap != undefined) {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName,  'pixelMap.isStrideAlignment is: ' + pixelmap.isStrideAlignment)
          expect(pixelmap.isStrideAlignment).assertFalse();
          done();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097';
      try {
        const pathUri = 'test_exif_v2.jpg';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104';
      try {
        const pathUri = 'test_exif_v2.png';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110';
      try {
        const pathUri = 'test_exif_v2.webp';
        const pixelMap = await createPixelMapFromImage(pathUri);
        console.info(TAG, testName, `pixelmap创建成功`);
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })





  })
}