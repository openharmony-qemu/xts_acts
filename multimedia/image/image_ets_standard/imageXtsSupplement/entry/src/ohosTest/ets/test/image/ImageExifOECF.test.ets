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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let jpgImageSourceApi: image.ImageSource;
let heicImageSourceApi: image.ImageSource;
const TAG = 'TestXtsImageExifOECF';
let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
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

export default function ImageExifOECFSupp() {
  describe('XtsImageExifOECFSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      heicImageSourceApi = await getImageSource('test_exif_v5.heic');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await jpgImageSourceApi.release();
      await heicImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_001
     * @tc.name       SUB_IMAGE_OECF_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(16);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_002
     * @tc.name       SUB_IMAGE_OECF_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(0);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertUndefined();
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_003
     * @tc.name       SUB_IMAGE_OECF_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(null as ESObject);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `testWriteImageMetadata OECF result is0:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, `testWriteImageMetadata OECF result is1:`);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertUndefined();
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_004
     * @tc.name       SUB_IMAGE_OECF_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(65535);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_005
     * @tc.name       SUB_IMAGE_OECF_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(1.1);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_006
     * @tc.name       SUB_IMAGE_OECF_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(17);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_007
     * @tc.name       SUB_IMAGE_OECF_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(16);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_008
     * @tc.name       SUB_IMAGE_OECF_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(0);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertUndefined();
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_009
     * @tc.name       SUB_IMAGE_OECF_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(null as ESObject);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `testWriteImageMetadata OECF result is0:`);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, `testWriteImageMetadata OECF result is1:`);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertUndefined();
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_010
     * @tc.name       SUB_IMAGE_OECF_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(65535);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_011
     * @tc.name       SUB_IMAGE_OECF_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(1.1);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_012
     * @tc.name       SUB_IMAGE_OECF_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(17);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_013
     * @tc.name       SUB_IMAGE_OECF_TEST_013
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(255);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_014
     * @tc.name       SUB_IMAGE_OECF_TEST_014
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(255);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect().assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_015
     * @tc.name       SUB_IMAGE_OECF_TEST_015
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(1);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_016
     * @tc.name       SUB_IMAGE_OECF_TEST_016
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(1);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_017
     * @tc.name       SUB_IMAGE_OECF_TEST_017
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(15);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_OECF_TEST_018
     * @tc.name       SUB_IMAGE_OECF_TEST_018
     * @tc.desc       Test ImageWriteImageMetadata cover OECF
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_OECF_TEST_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_OECF_TEST_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const normalOecfBuffer = new ArrayBuffer(15);
      testExifMetadata.oecf = normalOecfBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        const actualOecf = result.exifMetadata?.oecf;
        console.info(TAG, testName, `testWriteImageMetadata OECF result is:`, actualOecf);
        if (!actualOecf) {
          console.error(TAG, testName, `OECF value is undefined or null`);
          expect().assertFail();
        } else {
          expect(actualOecf.byteLength).assertEqual(normalOecfBuffer.byteLength);
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to test normal OECF, error code is `, err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_001
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_001
     * @tc.desc       Test photographicSensitivity cover normal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        let resultStr = JSON.stringify((result.exifMetadata?.photographicSensitivity));
        expect(resultStr).assertEqual("[100]");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_002
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_002
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [0,-100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });

    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_003
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_003
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       SMALL
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [12800,51200];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_004
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_004
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       SMALL
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_005
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_005
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity =  [100, 100, 100, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_006
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_006
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [10, 50, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_007
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_007
     * @tc.desc       Test photographicSensitivity cover normal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [100, 50, 10];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_008
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_008
     * @tc.desc       Test photographicSensitivity cover normal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        let resultStr = JSON.stringify((result.exifMetadata?.photographicSensitivity));
        expect(resultStr).assertEqual("[100]");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_009
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_009
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [0,-100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });

    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_010
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_010
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       SMALL
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [12800,51200];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_011
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_011
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       SMALL
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_012
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_012
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity =  [100, 100, 100, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_013
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_013
     * @tc.desc       Test photographicSensitivity cover with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [10, 50, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_014
     * @tc.name       SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_014
     * @tc.desc       Test photographicSensitivity cover normal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_PHOTO_GRAPHIC_SENSITIVITY_TEST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photographicSensitivity = [100, 50, 10];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.photographicSensitivity);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
  })
}