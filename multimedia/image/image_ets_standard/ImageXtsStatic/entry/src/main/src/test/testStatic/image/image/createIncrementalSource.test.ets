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
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../../../hypium';
import { Context } from '@kit.AbilityKit';

const TAG = 'ImageXts.createIncrementalSource';

let testContext: Context = Hypium.get("Context") as Context;

export default function createIncrementalSourceTest(): void {
  describe('createIncrementalSourceTest', () => {

    const getBuffer = (fileName: string): ArrayBuffer => {
      const filePath = testContext.filesDir + '/' + fileName;
      let file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize);
      fs.readSync(file.fd, bufferRead);
      fs.closeSync(file);
      return bufferRead;
    }

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_createIncrementalSource_static_0500
     * @tc.number SUB_MEDIA_IMAGE_createIncrementalSource_static_0500
     * @tc.desc   createIncrementalSource return supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0500';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1));
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, `succeeded`);
        expect(imageSourceIncrementalSApi?.supportedFormats != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0600
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0600
     * @tc.desc       CreateIncrementalSource cover sourceDensity,sourcePixelFormat,sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0600';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi);
        expect(imageSourceIncrementalSApi != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      }finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0700
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0700
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0700';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi!.supportedFormats != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0800
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0800
     * @tc.desc       CreateIncrementalSource cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0800';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_0900
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_0900
     * @tc.desc       CreateIncrementalSource cover RGB_565
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_0900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_0900';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_565,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1000
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1000
     * @tc.desc       CreateIncrementalSource cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1000', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1000';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1100
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1100
     * @tc.desc       CreateIncrementalSource cover RGB_888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1100';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGB_888,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1200
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1200
     * @tc.desc       CreateIncrementalSource cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1200';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1300
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1300
     * @tc.desc       CreateIncrementalSource cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1300', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1300';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1400
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1400
     * @tc.desc       CreateIncrementalSource cover NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1400', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1400';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV21,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1500
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1500
     * @tc.desc       CreateIncrementalSource cover NV12
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1500', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1500';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.NV12,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1600
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1600
     * @tc.desc       CreateIncrementalSource cover RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1600', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1600';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1700
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1700
     * @tc.desc       CreateIncrementalSource cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1700', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1700';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1800
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1800
     * @tc.desc       CreateIncrementalSource cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1800', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1800';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })

    /**
     * @tc.name       SUB_MEDIA_IMAGE_createIncrementalSource_static_1900
     * @tc.number     SUB_MEDIA_IMAGE_createIncrementalSource_static_1900
     * @tc.desc       CreateIncrementalSource cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createIncrementalSource_static_1900', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createIncrementalSource_static_1900';
      let imageSourceIncrementalSApi: image.ImageSource | null | undefined ;
      try {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        let testimagebuffer = getBuffer("test_exif_v2.jpg");
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        imageSourceIncrementalSApi = image.createIncrementalSource(new ArrayBuffer(1),sourceOptions);
        let isFinished: boolean = false;
        let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
        await imageSourceIncrementalSApi!.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi!.supportedFormats);
        expect(imageSourceIncrementalSApi != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (imageSourceIncrementalSApi) {
          await imageSourceIncrementalSApi.release();
        }
      }
      done();
    })
  })
}