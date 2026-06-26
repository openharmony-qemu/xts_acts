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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../../hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

const TAG = 'ImageXts.ImagePropertyKeyArray';
let fdNumber: int;
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
let filePath: string = '';

const getFd = (fileName: string): int => {
  filePath = testContext.filesDir + "/" + fileName;
  console.info(TAG, "image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};

const getFilePath = async (fileName: string): Promise<string> => {
  filePath = testContext.filesDir + "/" + fileName;
  return filePath;
}

let webpImageSourceApi: image.ImageSource | undefined = undefined;
let jpgImageSourceApi: image.ImageSource | undefined = undefined;
let pngImageSourceApi: image.ImageSource | undefined = undefined;
async function getImageSource(path: string): Promise<image.ImageSource> {
  let fd = getFd(path);
  const imageSourceApi = image.createImageSource(fd)!;
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function ImagePropertyKeyArrayTest(): void {
  describe('ImagePropertyKeyArrayTest', () => {
    beforeAll(async () => {
      console.info(TAG + ' beforeAll case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
    });
    beforeEach(async () => {
      console.info(TAG + ' beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG + ' afterEach case');
    });
    afterAll(async () => {
      console.info(TAG + ' afterAll case');
      await webpImageSourceApi!.release();
      await jpgImageSourceApi!.release();
      await pngImageSourceApi!.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0100
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0200
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0300
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0400
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0400';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0100
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0200
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0300
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0400
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0400';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0500
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0600
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0700
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();;
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0800
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'TOM';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0900
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_1000
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'TOM';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0200
     * @tc.desc       ImageWriteImageMetadata - TransferFunction - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 'N';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0300
     * @tc.desc       ImageWriteImageMetadata - TransferFunction - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 'N';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0200
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'NA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0300
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'NA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' start');
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0500
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'error';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0600
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'error';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0200
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0600
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0700
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0800
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0900
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1000
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1100
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1200
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1300
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1400
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1400';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1500
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_static_1500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0100
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0500
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0600
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0700
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0800
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1.0/2.0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0900
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1/2.0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1000
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1100
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1200
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1300
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1.0/2.0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1400
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1400
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_static_1400';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1/2.0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0300
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0500
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.299, 0.587, 0.114];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0600
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.35, 0.35, 0.3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0700
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0800
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0900
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.299, 0.587, 0.114];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1000
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.35, 0.35, 0.3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1100
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1200
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_static_1200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0300
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0500
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [2,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0600
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0700
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0800
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0900
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [2,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1000
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1100
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1200
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_static_1200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0300
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0300';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await jpgImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0500
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0500';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [1,255,0,255,0,255];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0600
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0600';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [0.25,0.25,0,25,0,25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0700
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0700';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0800
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0800';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0900
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0900
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_0900';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [1,255,0,255,0,255];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1000
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1000';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [0.25,0.25,0,25,0,25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await pngImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1100
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1100';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1200
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1200
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_static_1200';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG + ' ' + testName + ' ' + `start`);
        await webpImageSourceApi!.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + ' ' + testName + ' ' + `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
  })
}