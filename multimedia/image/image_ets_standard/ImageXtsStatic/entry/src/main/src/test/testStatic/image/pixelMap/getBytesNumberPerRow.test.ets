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

import { AppStorage } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Hypium } from '../../../../../../hypium/index';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const TAG = 'imageXts.pixelMapGetBytesNumberPerRowTest';

async function getBytesNumberPerRowTest(done: () => void, testName: string, array: ArrayBuffer,
  options: image.InitializationOptions,
  callback: (data: number) => void) {
  console.info(TAG, testName, "getBytesNumberPerRowTest start");
  try {
    let pixelMap = await image.createPixelMap(array, options);
    console.info(TAG, testName, "createPixelMap success");
    let rowCount: int = pixelMap.getBytesNumberPerRow();
    console.info(TAG, testName, `rowCount: ${rowCount}`);
    callback(rowCount);
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},code:${error.code}`);
    expect().assertFail();
    done();
  }
}

async function getArrayBufferByUri(testContext: common.UIAbilityContext, pathUri: string): Promise<ArrayBuffer> {
  let array = new ArrayBuffer(3000);
  let path = `${testContext.filesDir}/${pathUri}`;
  const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  let fdNumber: int = file.fd as int;
  let readLength = fs.readSync(fdNumber, array);
  fs.closeSync(file);
  console.info(TAG, `readLength: ${readLength}`);
  return array;
}

export default function pixelMapGetBytesNumberPerRowTest(): void {
  describe('pixelMapGetBytesNumberPerRowTest', () => {
    let testContext: common.UIAbilityContext = Hypium.get("Context") as common.UIAbilityContext;

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
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0100
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0100';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0200
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0200';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0300
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0300';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0400
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0400
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0400';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0500
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0500
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0500';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0600
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0600
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0600';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0700
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0700
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0700';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0800
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0800
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0800';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0900
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0900
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_0900';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1000
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1000
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1000';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1100
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1100
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1100';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1200
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1200
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1200';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1300
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1300
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1300';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1400
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1400
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1400';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1500
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1500
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1500';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1600
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1600
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1600';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1700
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1700
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1700';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1800
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1800
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1800';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1900
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1900
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_1900';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2000
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2000
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2000';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2100
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2100
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2100';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2200
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2200
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2200';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2300
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2300
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2300';
      let array = await getArrayBufferByUri(testContext, 'test.png');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2400
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2400
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2400';
      let array = await getArrayBufferByUri(testContext, 'test.123');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2500
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2500
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2500';
      let array = await getArrayBufferByUri(testContext, 'test.arw');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2600
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2600
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2600';
      let array = await getArrayBufferByUri(testContext, 'test.cr2');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2700
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2700
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2700';
      let array = await getArrayBufferByUri(testContext, 'test.cr3');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2800
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2800
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2800';
      let array = await getArrayBufferByUri(testContext, 'test.ico');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2900
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2900
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_2900';
      let array = await getArrayBufferByUri(testContext, 'test.jpeg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3000
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3000
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3000';
      let array = await getArrayBufferByUri(testContext, 'test.nrw');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3100
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3100
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3100';
      let array = await getArrayBufferByUri(testContext, 'test.svg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3200
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3200
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3200';
      let array = await getArrayBufferByUri(testContext, 'test.webp');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3300
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3300
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3300';
      let array = await getArrayBufferByUri(testContext, 'test8.bmp');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3400
     * @tc.number SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3400
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getBytesNumberPerRow_static_3400';
      let array = await getArrayBufferByUri(testContext, 'test_dng.dng');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

  })
}
