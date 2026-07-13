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

import { Context } from '@kit.AbilityKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll,Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = 'ImageXts.CreatePixelMap'

let fdNumber: int;

async function getFd(fileName: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  let filePath = testContext.filesDir + "/" + fileName;
  console.info("image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi === undefined) {
    throw new Error('Failed to create image source');
  }
  const imageInfo = imageSourceApi!.getImageInfoSync();
  console.info(TAG + ' createImageSource: ' + JSON.stringify(imageInfo));
  return imageSourceApi;
}

export default function CreatePixelMapSupp(): void {
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  describe('CreatePixelMapSupp', (): void => {
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0100
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0100';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0200
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0200';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0300
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0300';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0400
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0400';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0500
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0500';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0600
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0600';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0700
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0700';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0800
     * @tc.desc       createPixelMap cover ' '
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0800';
      let imageSourceApi: image.ImageSource | null = null;
      try {
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0900
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_0900';
      let imageSourceApi: image.ImageSource | null = null;
      try {
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isStrideAlignment);
        expect(pixelMap!.isEditable).assertFalse();
        expect(pixelMap!.isStrideAlignment).assertFalse();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1000
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1000';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1100
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1100';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1200
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1200';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1300
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1300';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1400
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1400';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1500
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1500';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1600
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1600';
      let imageSourceApi: image.ImageSource | null = null;
      try {
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1700
     * @tc.desc       createPixelMap cover ' '
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1700';
      let imageSourceApi: image.ImageSource | null = null;
      try {
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
          pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap!.release();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1800
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1800';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isStrideAlignment);
        expect(pixelMap!.isEditable).assertFalse();
        expect(pixelMap!.isStrideAlignment).assertFalse();
        await pixelMap!.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1900
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1900
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_1900';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2000
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2000
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2000';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2100
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2100';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2200
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2200';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2300
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2300';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2400
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2400';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2500
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2500
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2500';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test.jpeg');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2600
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2600
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2600';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2700
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2700
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2700';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2800
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2800
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_2800';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3000
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3000
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3000';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3100
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3100
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3100';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3200
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3200
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3200';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3300
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3300
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3300';
      let imageSourceApi: image.ImageSource | null = null;
      try{
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
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap!.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3400
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3400
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_static_3400';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap!.isStrideAlignment);
        expect(pixelMap!.isEditable).assertFalse();
        expect(pixelMap!.isStrideAlignment).assertFalse();
        await pixelMap!.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi!.release();
      done();
    })
  })
}