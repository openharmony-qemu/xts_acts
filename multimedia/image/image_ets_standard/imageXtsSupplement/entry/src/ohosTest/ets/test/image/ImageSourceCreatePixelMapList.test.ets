/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'ImageSource.createPixelMapList'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageSourceCreatePixelMapListSupp() {
  describe('ImageSourceCreatePixelMapListSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG, testName,'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG, testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006
     * @tc.desc       ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003';
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_004
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_004';
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code == 62980118 ).assertTrue();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertFalse();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005';
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006';
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code == 62980118).assertTrue();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertFalse();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006
     * @tc.desc       createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })

  });
}